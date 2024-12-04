-- liquibase formatted sql
-- changeset HMA:e6a9d8c0f8a5677d17d5180768074c5cf5398dda stripComments:false logicalFilePath:package_specs\tapi_app_settings_ut.sql
-- sqlcl_snapshot src/database/hma/package_specs/tapi_app_settings_ut.pks:null:e6a9d8c0f8a5677d17d5180768074c5cf5398dda:create

create or replace package hma.tapi_app_settings_ut is
    --%suite

    --%test() 
    procedure test_hash_function;

    --%test() 
    procedure test_hash_rowid_function;

    --%test()
    procedure test_ins_procedure;

    --%test() 
    procedure test_upd_procedure;

    --%test()
    procedure test_del_procedure;

end tapi_app_settings_ut;
/