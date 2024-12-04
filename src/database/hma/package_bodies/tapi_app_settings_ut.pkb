create or replace package body hma.tapi_app_settings_ut is

   -- Test for the hash function
    procedure test_hash_function is
        l_hash varchar2(4000);
    begin
      -- Given
        insert into app_settings (
            setting_name,
            setting_value
        ) values ( 'TEST_HASH_FUNCTION',
                   'TestValue' );

      -- When
        l_hash := tapi_app_settings.hash('TEST_HASH_FUNCTION');

      -- Then
        ut.expect(l_hash).to_be_not_null;
        delete from app_settings
        where
            setting_name = 'TEST_HASH_FUNCTION';

    end test_hash_function;

   -- Test for the hash_rowid function
    procedure test_hash_rowid_function is
        l_hash  varchar2(4000);
        l_rowid varchar2(18);
    begin
      -- Given
        insert into app_settings (
            setting_name,
            setting_value
        ) values ( 'TEST_HASH_ROWID_FUNCTION',
                   'TestValue' );

        select
            rowid
        into l_rowid
        from
            app_settings
        where
            setting_name = 'TEST_HASH_ROWID_FUNCTION';

      -- When
        l_hash := tapi_app_settings.hash_rowid(l_rowid);

      -- Then
        ut.expect(l_hash).to_be_not_null;
        delete from app_settings
        where
            setting_name = 'TEST_HASH_ROWID_FUNCTION';

    end test_hash_rowid_function;

   -- Test for the insert procedure
    procedure test_ins_procedure is
        l_app_settings_rec tapi_app_settings.app_settings_rt;
        l_count            pls_integer;
    begin
      -- Given
        l_app_settings_rec.setting_name := 'TEST_INSERT';
        l_app_settings_rec.setting_value := 'TestValue';

      -- When
        tapi_app_settings.ins(l_app_settings_rec);

      -- Then
        select
            count(*)
        into l_count
        from
            app_settings
        where
            setting_name = 'TEST_INSERT';

        ut.expect(l_count).to_equal(1);
        delete from app_settings
        where
            setting_name = 'TEST_INSERT';

    end test_ins_procedure;

   -- Test for the update procedure
    procedure test_upd_procedure is
        l_app_settings_rec tapi_app_settings.app_settings_rt;
        l_value            varchar2(1000);
    begin
      -- Given
        insert into app_settings (
            setting_name,
            setting_value
        ) values ( 'TEST_UPDATE',
                   'OldValue' );

        l_app_settings_rec.setting_name := 'TEST_UPDATE';
        l_app_settings_rec.setting_value := 'NewValue';

      -- When
        tapi_app_settings.upd(l_app_settings_rec);

      -- Then
        select
            setting_value
        into l_value
        from
            app_settings
        where
            setting_name = 'TEST_UPDATE';

        ut.expect(l_value).to_equal('NewValue');
        delete from app_settings
        where
            setting_name = 'TEST_UPDATE';

    end test_upd_procedure;

   -- Test for the delete procedure
    procedure test_del_procedure is
        l_count pls_integer;
    begin
      -- Given
        insert into app_settings (
            setting_name,
            setting_value
        ) values ( 'TEST_DELETE',
                   'TestValue' );

      -- When
        tapi_app_settings.del('TEST_DELETE');

      -- Then
        select
            count(*)
        into l_count
        from
            app_settings
        where
            setting_name = 'TEST_DELETE';

        ut.expect(l_count).to_equal(0);
    end test_del_procedure;

end tapi_app_settings_ut;
/


-- sqlcl_snapshot {"hash":"8a37015019501595ab5ead3d772225f369388515","type":"PACKAGE_BODY","name":"TAPI_APP_SETTINGS_UT","schemaName":"HMA"}