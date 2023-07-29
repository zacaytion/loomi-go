-- Service Users
drop role if exists lg_api;
create role lg_api with login password :'DB_API_USER_PW' noinherit;
comment on role lg_api is
  E'Role with minimal permissions used for connections from the api server.';

grant connect on database loomi_go to lg_api;

-- Role for un-authenticated queries
drop role if exists lg_visitor;
create role lg_visitor;
comment on role lg_visitor is
  E'Role used for executing database queries from unauthenticated server requests.';

-- Role for queries from an authenticated user
drop role if exists lg_authenticated;
create role lg_authenticated;
comment on role lg_authenticated is
  E'Role used for executing database queries from authenticated server requests.';

-- API role can assume user roles
grant lg_visitor TO lg_api;
grant lg_authenticated TO lg_api;
