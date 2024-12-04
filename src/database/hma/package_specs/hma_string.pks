create or replace package hma.hma_string is
    function split (
        p_str       in varchar2,
        p_delimiter in varchar2
    ) return hma_varchar2.hma_t_varchar2;

    function join (
        p_list      in hma_varchar2.hma_t_varchar2,
        p_delimiter in varchar2
    ) return varchar2;

end hma_string;
/


-- sqlcl_snapshot {"hash":"e065449eb05e2f1f4440fea908a6dad0121ccbc7","type":"PACKAGE_SPEC","name":"HMA_STRING","schemaName":"HMA"}