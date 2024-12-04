-- liquibase formatted sql
-- changeset HMA:14103e2e3db674825f72e4a4284de76bb01295e7 stripComments:false logicalFilePath:package_specs\api_configuration_service.sql
-- sqlcl_snapshot src/database/hma/package_specs/api_configuration_service.pks:null:14103e2e3db674825f72e4a4284de76bb01295e7:create

create or replace package hma.api_configuration_service as
    function exists (
        p_config_name in api_configuration.config_name%type
    ) return boolean;

    procedure save (
        p_client_id     in api_configuration.config_value%type,
        p_client_secret in api_configuration.config_value%type,
        p_redirect_uri  in api_configuration.config_value%type
    );

end;
/