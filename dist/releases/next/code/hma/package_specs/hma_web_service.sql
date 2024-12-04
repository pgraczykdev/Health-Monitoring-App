-- liquibase formatted sql
-- changeset HMA:c8396d45349951026b2e952a7bc9f6e69df3500c stripComments:false logicalFilePath:package_specs\hma_web_service.sql
-- sqlcl_snapshot src/database/hma/package_specs/hma_web_service.pks:null:c8396d45349951026b2e952a7bc9f6e69df3500c:create

create or replace package hma.hma_web_service as
    procedure send_request (
        p_url          in varchar2,
        p_http_method  in varchar2,
        p_param_names  in apex_application_global.vc_arr2,
        p_param_values in apex_application_global.vc_arr2,
        p_response     out clob
    );

    function build_strava_authorize_url (
        p_client_id     in varchar2,
        p_redirect_uri  in varchar2,
        p_request_scope in varchar2 default 'read,activity:read'
    ) return varchar2;

end hma_web_service;
/