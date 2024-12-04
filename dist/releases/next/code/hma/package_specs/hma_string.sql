-- liquibase formatted sql
-- changeset HMA:e065449eb05e2f1f4440fea908a6dad0121ccbc7 stripComments:false logicalFilePath:package_specs\hma_string.sql
-- sqlcl_snapshot src/database/hma/package_specs/hma_string.pks:null:e065449eb05e2f1f4440fea908a6dad0121ccbc7:create

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