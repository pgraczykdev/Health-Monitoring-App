-- liquibase formatted sql
-- changeset HMA:28e56631513ae77c0db7e9fe3ca6b06c0cfc212b stripComments:false logicalFilePath:package_specs\console.sql
-- sqlcl_snapshot src/database/hma/package_specs/console.pks:null:28e56631513ae77c0db7e9fe3ca6b06c0cfc212b:create

create or replace package hma.console as
    procedure write (
        p_message in varchar2
    );

    procedure write (
        p_message in number
    );

    procedure write (
        p_message in boolean
    );

    procedure write (
        p_message in date
    );

    procedure write (
        p_message in timestamp
    );

end console;
/