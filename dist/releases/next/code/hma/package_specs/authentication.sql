-- liquibase formatted sql
-- changeset HMA:91bc58f8d5a6fcd86655b16785be1b59bb61bb25 stripComments:false logicalFilePath:package_specs\authentication.sql
-- sqlcl_snapshot src/database/hma/package_specs/authentication.pks:null:91bc58f8d5a6fcd86655b16785be1b59bb61bb25:create

create or replace package hma.authentication as
    function login (
        p_username in varchar2,
        p_password in varchar2
    ) return boolean;

    function sentry return boolean;

end authentication;
/