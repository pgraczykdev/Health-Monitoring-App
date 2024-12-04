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


-- sqlcl_snapshot {"hash":"28e56631513ae77c0db7e9fe3ca6b06c0cfc212b","type":"PACKAGE_SPEC","name":"CONSOLE","schemaName":"HMA"}