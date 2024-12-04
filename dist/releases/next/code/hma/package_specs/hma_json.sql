-- liquibase formatted sql
-- changeset HMA:bf063c9d62a8c3423a5edf70db05f8aa8548f55a stripComments:false logicalFilePath:package_specs\hma_json.sql
-- sqlcl_snapshot src/database/hma/package_specs/hma_json.pks:null:bf063c9d62a8c3423a5edf70db05f8aa8548f55a:create

create or replace package hma.hma_json is
    function get_varchar2 (
        p_json clob,
        p_path varchar2
    ) return varchar2;

    function get_number (
        p_json clob,
        p_path varchar2
    ) return number;

    function get_date (
        p_json        clob,
        p_path        varchar2,
        p_date_format varchar2 := 'YYYY-MM-DD"T"HH24:MI:SS"Z"'
    ) return date;

    function get_clob (
        p_json clob,
        p_path varchar2
    ) return clob;

end hma_json;
/