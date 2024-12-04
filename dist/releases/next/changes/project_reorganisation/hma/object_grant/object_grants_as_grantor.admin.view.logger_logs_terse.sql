-- liquibase formatted sql
-- changeset HMA:f3ec5457443818ba04a00659796607a4d5e9b968 stripComments:false logicalFilePath:project_reorganisation\hma\object_grant\object_grants_as_grantor.admin.view.logger_logs_terse.sql
-- sqlcl_snapshot src/database/admin/object_grants/object_grants_as_grantor.admin.view.logger_logs_terse.sql:null:00170a0d3788bfe948b8d598c7c77adb8ba964de:create

grant select on admin.logger_logs_terse to hma;