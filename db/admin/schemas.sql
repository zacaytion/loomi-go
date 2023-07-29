-- For Idempotentcy
drop schema if exists lg_public cascade;
drop schema if exists lg_hidden cascade;
drop schema if exists lg_private cascade;


/*
 * The `public` *schema* contains things like PostgreSQL extensions. We
 * deliberately do not install application logic into the public schema
 * (instead storing it to app_public/app_hidden/app_private as appropriate),
 * but none the less we don't want untrusted roles to be able to install or
 * modify things into the public schema.
 *
 * The `public` *role* is automatically inherited by all other roles; we only
 * want specific roles to be able to access our database so we must revoke
 * access to the `public` role.
 */

revoke all on schema public from public;

alter default privileges revoke all on sequences from public;
alter default privileges revoke all on functions from public;

-- Of course we want our database owner to be able to do anything inside the
-- database, so we grant access to the `public` schema
grant all on schema public to lg_owner;


create schema if not exists lg_public;
comment on schema lg_public is
  E'Namespace for tables and functions exposed to public connections';

create schema if not exists lg_hidden;
comment on schema lg_hidden is
  E'Namespace for implementation details of the `lg_public` schema that are not intended to be exposed publicly';

create schema if not exists lg_private;
comment on schema lg_private is
  E'Namespace for private tables and functions that should not be publicly accessible. Users need a `SECURITY DEFINER` function that selectively grants access to the namespace';

-- We need to do this to give the root user permissions to drop the database
grant all privileges on all tables in schema public, lg_public, lg_hidden, lg_private
  to :DATABASE_ROOT_USER;

alter default privileges for role :DATABASE_OWNER in schema public, lg_public, lg_hidden, lg_private
  grant all privileges on tables to :DATABASE_ROOT_USER;

alter default privileges for role :DATABASE_OWNER in schema public, lg_public, lg_hidden, lg_private
  grant all privileges on sequences to :DATABASE_ROOT_USER;

alter default privileges for role :DATABASE_OWNER in schema public, lg_public, lg_hidden, lg_private
  grant all privileges on functions to :DATABASE_ROOT_USER;

alter default privileges for role :DATABASE_OWNER in schema public, lg_public, lg_hidden, lg_private
  grant all privileges on types to :DATABASE_ROOT_USER;

alter default privileges for role :DATABASE_OWNER in schema public, lg_public, lg_hidden, lg_private
  grant all privileges on functions to :DATABASE_ROOT_USER;

-- The 'anonymous' role (used to represent an unauthenticated user) may
-- access the public, app_public and app_hidden schemas (but _NOT_ the
-- app_private schema).
grant usage on schema public, lg_public, lg_hidden to :VISITOR_ROLE;

-- We only want the `anonymous` role to be able to insert rows (`serial` data type
-- creates sequences, so we need to grant access to that).
alter default privileges in schema public, lg_public, lg_hidden
  grant usage, select on sequences to :VISITOR_ROLE;

-- And the `anonymous` role should be able to call functions too.
alter default privileges in schema public, lg_public, lg_hidden
  grant execute on functions to :VISITOR_ROLE;

grant usage on schema lg_public, lg_private to lg_authenticated;
grant select on all tables in schema lg_public to lg_authenticated;
grant usage, select on all sequences in schema lg_public to lg_authenticated;
grant execute on all functions in schema lg_public to lg_authenticated;
