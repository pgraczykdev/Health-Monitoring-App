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


-- sqlcl_snapshot {"hash":"cb5ad49179480d2941b716ceaf77a5eeb92685b9","type":"PACKAGE_SPEC","name":"TAPI_API_CONFIGURATION_UT","schemaName":"HMA"}