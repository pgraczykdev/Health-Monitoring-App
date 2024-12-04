-- liquibase formatted sql
-- changeset HMA:ac513fe8febc15aae817a45087df10f0b422628a stripComments:false logicalFilePath:project_reorganisation\hma\table\api_configuration.sql
-- sqlcl_snapshot src/database/hma/tables/api_configuration.sql:null:ac513fe8febc15aae817a45087df10f0b422628a:create

create table hma.api_configuration (
    config_name  varchar2(100 byte) not null enable,
    config_value varchar2(1000 byte) not null enable
);

alter table hma.api_configuration
    add constraint pk_api_configuration primary key ( config_name )
        using index enable;