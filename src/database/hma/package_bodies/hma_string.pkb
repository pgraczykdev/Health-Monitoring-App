create or replace package body hma.hma_string is

    gc_scope_prefix constant hma_varchar2.vc20 := lower($$plsql_unit)
                                                  || '.';

    function split (
        p_str       in varchar2,
        p_delimiter in varchar2
    ) return hma_varchar2.hma_t_varchar2 is

        l_str    hma_varchar2.vc32767;
        l_pos    number;
        l_scope  logger_logs.scope%type := gc_scope_prefix || 'split';
        l_params logger.tab_param;
        l_result hma_varchar2.hma_t_varchar2 := hma_varchar2.hma_t_varchar2();
    begin
        logger.append_param(l_params, 'p_str', p_str);
        logger.append_param(l_params, 'p_delimiter', p_delimiter);
        logger.log('START', l_scope, null, l_params);
        l_str := p_str || p_delimiter;
        l_pos := instr(l_str, p_delimiter);
        while l_pos > 0 loop
            l_result.extend;
            l_result(l_result.count) := substr(l_str, 1, l_pos - 1);

            l_str := substr(l_str,
                            l_pos + length(p_delimiter));
            l_pos := instr(l_str, p_delimiter);
        end loop;

        logger.log('END', l_scope);
        return l_result;
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end split;
   -----------------------------------------------------------------
    function join (
        p_list      in hma_varchar2.hma_t_varchar2,
        p_delimiter in varchar2
    ) return varchar2 is

        l_result hma_varchar2.vc32767 := '';
        l_scope  logger_logs.scope%type := gc_scope_prefix || 'join';
        l_params logger.tab_param;
    begin
        logger.append_param(l_params,
                            'p_list - first element',
                            p_list(1));
        logger.append_param(l_params, 'p_delimiter', p_delimiter);
        logger.log('START', l_scope, null, l_params);
        for i in 1..p_list.count loop
            if i > 1 then
                l_result := l_result || p_delimiter;
            end if;
            l_result := l_result || p_list(i);
        end loop;

        logger.log('END', l_scope);
        return l_result;
    exception
        when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
    end join;

end hma_string;
/


-- sqlcl_snapshot {"hash":"d1a211616a4c7dec1d5fb60ff8bee5d65f1eb782","type":"PACKAGE_BODY","name":"HMA_STRING","schemaName":"HMA"}