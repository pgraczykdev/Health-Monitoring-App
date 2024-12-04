-- liquibase formatted sql
-- changeset HMA:6c8c3920f547e337160bb014118c1d12e1b0a731 stripComments:false logicalFilePath:package_bodies\authentication.sql
-- sqlcl_snapshot src/database/hma/package_bodies/authentication.pkb:null:6c8c3920f547e337160bb014118c1d12e1b0a731:create

create or replace package body hma.authentication as

    function login (
        p_username in varchar2,
        p_password in varchar2
    ) return boolean as
    begin
        return true;
    end login;

    function sentry return boolean as
    begin
        return true;
    end sentry;

end authentication;
/