create or replace package body hma.hma_web_service as

    gc_scope_prefix constant hma_varchar2.vc50 := lower($$plsql_unit)
                                                  || '.';

    procedure send_request (
        p_url          in varchar2,
        p_http_method  in varchar2,
        p_param_names  in apex_application_global.vc_arr2,
        p_param_values in apex_application_global.vc_arr2,
        p_response     out clob
    ) as

        l_response    clob;
        l_params      logger.tab_param;
        l_scope       logger_logs.scope%type := gc_scope_prefix || 'send_request';
        l_http_method hma_varchar2.vc20 := p_http_method;
    begin
        logger.append_param(l_params, 'p_url', p_url);
        logger.append_param(l_params, 'p_http_method', p_http_method);
        logger.append_param(l_params,
                            'p_param_names count',
                            p_param_names.count());
        logger.append_param(l_params,
                            'p_param_values count',
                            p_param_values.count());
        logger.log('START', l_scope, null, l_params);
        l_response := apex_web_service.make_rest_request(
            p_url         => p_url,
            p_http_method => l_http_method,
            p_parm_name   => p_param_names,
            p_parm_value  => p_param_values
        );

        p_response := l_response;
        logger.append_param(l_params, 'l_response', l_response);
        logger.log('END', l_scope, null, l_params);
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end send_request;

    function build_strava_authorize_url (
        p_client_id     in varchar2,
        p_redirect_uri  in varchar2,
        p_request_scope in varchar2 default 'read,activity:read'
    ) return varchar2 is

        l_url    hma_varchar2.vc32767;
        l_params logger.tab_param;
        l_scope  logger_logs.scope%type := gc_scope_prefix || 'build_strava_authorize_url';
    begin
        logger.append_param(l_params, 'p_client_id', p_client_id);
        logger.append_param(l_params, 'p_redirect_uri', p_redirect_uri);
        logger.append_param(l_params, 'p_request_scope', p_request_scope);
        logger.log('START', l_scope, null, l_params);
        l_url := 'https://www.strava.com/oauth/authorize?'
                 || 'client_id='
                 || p_client_id
                 || '&redirect_uri='
                 || utl_url.escape(p_redirect_uri)
                 || '&response_type=code'
                 || '&scope='
                 || utl_url.escape(p_request_scope);

        logger.log('END', l_scope, null, l_params);
        return l_url;
    end build_strava_authorize_url;

end hma_web_service;
/


-- sqlcl_snapshot {"hash":"0c575f82be7edac528d322328d547f330fcfac67","type":"PACKAGE_BODY","name":"HMA_WEB_SERVICE","schemaName":"HMA"}