-- liquibase formatted sql
-- changeset HMA:cb5ad49179480d2941b716ceaf77a5eeb92685b9 stripComments:false logicalFilePath:package_specs\tapi_api_configuration_ut.sql
-- sqlcl_snapshot src/database/hma/package_specs/tapi_api_configuration_ut.pks:null:cb5ad49179480d2941b716ceaf77a5eeb92685b9:create

create or replace package hma.tapi_api_configuration_ut is
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

end tapi_api_configuration_ut;
/