-- liquibase formatted sql
-- changeset HMA:f84cd761dedbe547576a099f50085aef8cd22b07 stripComments:false logicalFilePath:project_reorganisation\hma\table\app_settings.sql
-- sqlcl_snapshot src/database/hma/tables/app_settings.sql:null:f84cd761dedbe547576a099f50085aef8cd22b07:create

create table hma.app_settings (
    setting_name  varchar2(100 byte) not null enable,
    setting_value varchar2(1000 byte) not null enable
);

alter table hma.app_settings
    add constraint pk_app_settings primary key ( setting_name )
        using index enable;