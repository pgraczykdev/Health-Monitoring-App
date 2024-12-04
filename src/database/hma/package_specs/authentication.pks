create or replace package hma.authentication as
    function login (
        p_username in varchar2,
        p_password in varchar2
    ) return boolean;

    function sentry return boolean;

end authentication;
/


-- sqlcl_snapshot {"hash":"91bc58f8d5a6fcd86655b16785be1b59bb61bb25","type":"PACKAGE_SPEC","name":"AUTHENTICATION","schemaName":"HMA"}