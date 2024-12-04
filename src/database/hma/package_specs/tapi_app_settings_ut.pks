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


-- sqlcl_snapshot {"hash":"e6a9d8c0f8a5677d17d5180768074c5cf5398dda","type":"PACKAGE_SPEC","name":"TAPI_APP_SETTINGS_UT","schemaName":"HMA"}