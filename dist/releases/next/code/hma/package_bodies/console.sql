-- liquibase formatted sql
-- changeset HMA:2964507d2d0042d4597834336dd54426cf921281 stripComments:false logicalFilePath:package_bodies\console.sql
-- sqlcl_snapshot src/database/hma/package_bodies/console.pkb:null:2964507d2d0042d4597834336dd54426cf921281:create

create or replace package body hma.console as

    procedure write (
        p_message in varchar2
    ) as
    begin
        dbms_output.put_line(p_message);
    end write;

    procedure write (
        p_message in number
    ) as
    begin
        dbms_output.put_line(to_char(p_message));
    end write;

    procedure write (
        p_message in boolean
    ) as
    begin
        if p_message then
            write('TRUE');
        else
            write('FALSE');
        end if;
    end write;

    procedure write (
        p_message in date
    ) as
    begin
        dbms_output.put_line(to_char(p_message, 'YYYY-MM-DD HH24:MI:SS'));
    end write;

    procedure write (
        p_message in timestamp
    ) as
    begin
        dbms_output.put_line(to_char(p_message, 'YYYY-MM-DD HH24:MI:SS.FF'));
    end write;

end console;
/