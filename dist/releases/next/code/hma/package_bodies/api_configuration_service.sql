-- liquibase formatted sql
-- changeset HMA:eb45b8d4b9a94681c20762f9d1258f0b35697344 stripComments:false logicalFilePath:package_bodies\api_configuration_service.sql
-- sqlcl_snapshot src/database/hma/package_bodies/api_configuration_service.pkb:null:eb45b8d4b9a94681c20762f9d1258f0b35697344:create

create or replace package body hma.api_configuration_service as

    gc_scope_prefix         constant hma_varchar2.vc50 := lower($$plsql_unit)
                                                  || '.';
    gc_strava_client_id     constant api_configuration.config_name%type := 'STRAVA_CLIENT_ID';
    gc_strava_client_secret constant api_configuration.config_name%type := 'STRAVA_CLIENT_SECRET';
    gc_strava_redirect_uri  constant api_configuration.config_name%type := 'STRAVA_REDIRECT_URI';

    function exists (
        p_config_name in api_configuration.config_name%type
    ) return boolean as

        l_api_configuration tapi_api_configuration.api_configuration_rt;
        l_params            logger.tab_param;
        l_scope             logger_logs.scope%type := gc_scope_prefix || 'exists';
    begin
        logger.append_param(l_params, 'p_config_name', p_config_name);
        logger.log('START', l_scope, null, l_params);
        if p_config_name is null then
            logger.log('END', l_scope, null, l_params);
            return false;
        end if;

        l_api_configuration := tapi_api_configuration.rt(p_config_name => p_config_name);
        if l_api_configuration.config_name is not null then
            logger.log('END', l_scope, null, l_params);
            return true;
        end if;

        logger.log('END', l_scope, null, l_params);
        return false;
    end exists;
 -------------------------------------------------------------------------------  
    procedure save (
        p_client_id     in api_configuration.config_value%type,
        p_client_secret in api_configuration.config_value%type,
        p_redirect_uri  in api_configuration.config_value%type
    ) as

        l_api_configuration tapi_api_configuration.api_configuration_rt;
        l_scope             logger_logs.scope%type := gc_scope_prefix || 'save';
        l_params            logger.tab_param;
        l_exists            boolean := false;
    begin
        logger.append_param(l_params, 'p_client_id', p_client_id);
        logger.append_param(l_params, 'p_client_secret', p_client_secret);
        logger.append_param(l_params, 'p_redirect_uri', p_redirect_uri);
        l_exists := api_configuration_service.exists(p_config_name => gc_strava_client_id);
        if l_exists then
            logger.log('Updating client_id', l_scope, null, l_params);
            l_api_configuration.config_name := gc_strava_client_id;
            l_api_configuration.config_value := p_client_id;
            tapi_api_configuration.upd(p_api_configuration_rec => l_api_configuration);
        else
            logger.log('Inserting client_id', l_scope, null, l_params);
            l_api_configuration.config_name := gc_strava_client_id;
            l_api_configuration.config_value := p_client_id;
            tapi_api_configuration.ins(p_api_configuration_rec => l_api_configuration);
        end if;

        l_exists := api_configuration_service.exists(p_config_name => gc_strava_client_secret);
        if l_exists then
            logger.log('Updating client_secret', l_scope, null, l_params);
            l_api_configuration.config_name := gc_strava_client_secret;
            l_api_configuration.config_value := p_client_secret;
            tapi_api_configuration.upd(p_api_configuration_rec => l_api_configuration);
        else
            logger.log('Inserting client_secret', l_scope, null, l_params);
            l_api_configuration.config_name := gc_strava_client_secret;
            l_api_configuration.config_value := p_client_secret;
            tapi_api_configuration.ins(p_api_configuration_rec => l_api_configuration);
        end if;

        l_exists := api_configuration_service.exists(p_config_name => gc_strava_redirect_uri);
        if l_exists then
            logger.log('Updating redirect_uri', l_scope, null, l_params);
            l_api_configuration.config_name := gc_strava_redirect_uri;
            l_api_configuration.config_value := p_redirect_uri;
            tapi_api_configuration.upd(p_api_configuration_rec => l_api_configuration);
        else
            logger.log('inserting redirect_uri', l_scope, null, l_params);
            l_api_configuration.config_name := gc_strava_redirect_uri;
            l_api_configuration.config_value := p_redirect_uri;
            tapi_api_configuration.ins(p_api_configuration_rec => l_api_configuration);
        end if;

        logger.log('END', l_scope, null, l_params);
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end save;

end;
/