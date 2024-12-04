-- liquibase formatted sql
-- changeset HMA:c331cf02b1e34a894b5feaac0b16fcd3bb225ab0 stripComments:false logicalFilePath:package_bodies\hma_json.sql
-- sqlcl_snapshot src/database/hma/package_bodies/hma_json.pkb:null:c331cf02b1e34a894b5feaac0b16fcd3bb225ab0:create

create or replace package body hma.hma_json is

    gc_scope_prefix constant hma_varchar2.vc50 := lower($$plsql_unit)
                                                  || '.';

    function get_varchar2 (
        p_json clob,
        p_path varchar2
    ) return varchar2 is
        l_params logger.tab_param;
        l_scope  logger_logs.scope%type := gc_scope_prefix || 'get_varchar2';
    begin
        logger.append_param(l_params, 'p_json', p_json);
        logger.append_param(l_params, 'p_path', p_path);
        logger.log('START', l_scope, null, l_params);
        apex_json.parse(p_json);
        logger.log('END', l_scope, null, l_params);
        return apex_json.get_varchar2(p_path);
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end;

    function get_number (
        p_json clob,
        p_path varchar2
    ) return number is
        l_params logger.tab_param;
        l_scope  logger_logs.scope%type := gc_scope_prefix || 'get_number';
    begin
        logger.append_param(l_params, 'p_json', p_json);
        logger.append_param(l_params, 'p_path', p_path);
        logger.log('START', l_scope, null, l_params);
        apex_json.parse(p_json);
        logger.log('END', l_scope, null, l_params);
        return apex_json.get_number(p_path);
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end;

    function get_date (
        p_json        clob,
        p_path        varchar2,
        p_date_format varchar2
    ) return date is

        l_params   logger.tab_param;
        l_scope    logger_logs.scope%type := gc_scope_prefix || 'get_date';
        l_date_str hma_varchar2.vc100;
    begin
        logger.append_param(l_params, 'p_json', p_json);
        logger.append_param(l_params, 'p_path', p_path);
        logger.log('START', l_scope, null, l_params);
        apex_json.parse(p_json);
        l_date_str := apex_json.get_varchar2(p_path);
        logger.log('END', l_scope, null, l_params);
        return to_date ( l_date_str,
                         p_date_format );
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end;

    function get_clob (
        p_json clob,
        p_path varchar2
    ) return clob is

        l_params logger.tab_param;
        l_scope  logger_logs.scope%type := gc_scope_prefix || 'get_clob';
        l_result clob;
    begin
        logger.append_param(l_params, 'p_json', p_json);
        logger.append_param(l_params, 'p_path', p_path);
        logger.log('START', l_scope, null, l_params);
        apex_json.parse(p_json);
        l_result := apex_json.get_clob(p_path);
        logger.log('END', l_scope, null, l_params);
        return l_result;
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end;

end hma_json;
/