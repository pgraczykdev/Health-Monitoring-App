-- liquibase formatted sql
-- changeset HMA:cec302fe0234e1275c73cb76ecb977ab5452f705 stripComments:false logicalFilePath:package_bodies\tapi_api_configuration_ut.sql
-- sqlcl_snapshot src/database/hma/package_bodies/tapi_api_configuration_ut.pkb:null:cec302fe0234e1275c73cb76ecb977ab5452f705:create

create or replace package body hma.tapi_api_configuration_ut is

    -- Test for hash function
    procedure test_hash_function is
        l_hash varchar2(4000);
    begin
        -- given
        insert into api_configuration (
            config_name,
            config_value
        ) values ( 'TEST_HASH_FUNCTION',
                   'TestValue' );

        -- when
        l_hash := tapi_api_configuration.hash('TEST_HASH_FUNCTION');

        --then
        ut.expect(l_hash).to_be_not_null;
        delete from api_configuration
        where
            config_name = 'TEST_HASH_FUNCTION';

    end test_hash_function;

    -- Test for hash_rowid function
    procedure test_hash_rowid_function is
        l_hash  varchar2(4000);
        l_rowid varchar2(18);
    begin
        -- given
        insert into api_configuration (
            config_name,
            config_value
        ) values ( 'TEST_HASH_ROWID_FUNCTION',
                   'TestValue' );

        select
            rowid
        into l_rowid
        from
            api_configuration
        where
            config_name = 'TEST_HASH_ROWID_FUNCTION';

        -- when
        l_hash := tapi_api_configuration.hash_rowid(l_rowid);

        -- then
        ut.expect(l_hash).to_be_not_null;
        delete from api_configuration
        where
            config_name = 'TEST_HASH_ROWID_FUNCTION';

    end test_hash_rowid_function;

    -- Test for insert procedure
    procedure test_ins_procedure is
        l_api_configuration_rec tapi_api_configuration.api_configuration_rt;
        l_count                 pls_integer;
    begin
        -- given
        l_api_configuration_rec.config_name := 'TEST_INSERT';
        l_api_configuration_rec.config_value := 'TestValue';

        -- when
        tapi_api_configuration.ins(l_api_configuration_rec);
        select
            count(*)
        into l_count
        from
            api_configuration
        where
            config_name = 'TEST_INSERT';

        -- then
        ut.expect(l_count).to_equal(1);
        delete from api_configuration
        where
            config_name = 'TEST_INSERT';

    end test_ins_procedure;

    -- Test for update procedure
    procedure test_upd_procedure is
        l_api_configuration_rec tapi_api_configuration.api_configuration_rt;
        l_new_value             api_configuration.config_value%type;
    begin
        -- given
        insert into api_configuration (
            config_name,
            config_value
        ) values ( 'TEST_UPDATE',
                   'OldValue' );

        l_api_configuration_rec.config_name := 'TEST_UPDATE';
        l_api_configuration_rec.config_value := 'NewValue';

        -- when
        tapi_api_configuration.upd(l_api_configuration_rec);
        select
            config_value
        into l_new_value
        from
            api_configuration
        where
            config_name = 'TEST_UPDATE';

        -- then
        ut.expect(l_new_value).to_equal('NewValue');
        delete from api_configuration
        where
            config_name = 'TEST_UPDATE';

    end test_upd_procedure;

    -- Test for delete procedure
    procedure test_del_procedure is
        l_count pls_integer;
    begin
        -- given
        insert into api_configuration (
            config_name,
            config_value
        ) values ( 'TEST_DELETE',
                   'TestValue' );

        -- when
        tapi_api_configuration.del('TEST_DELETE');
        select
            count(*)
        into l_count
        from
            api_configuration
        where
            config_name = 'TEST_DELETE';

        -- then
        ut.expect(l_count).to_equal(0);
    end test_del_procedure;

end tapi_api_configuration_ut;
/