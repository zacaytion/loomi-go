drop role if exists lg_owner;
create role lg_owner with login password :'DATABASE_OWNER_PASSWORD' SUPERUSER;
comment on role lg_owner is
  E'Role that `owns` the database and is used for migrations and the worker.';

-- Create database
create database loomi_go OWNER lg_owner ENCODING UTF8;

comment on database loomi_go is
  E'Primary database for loomi-go';

-- Database permissions
revoke all on database loomi_go from public;
grant all on database loomi_go to lg_owner;

