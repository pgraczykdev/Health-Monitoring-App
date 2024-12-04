-- liquibase formatted sql
-- changeset HMA:4bbef04b68ea8a0a6719c8ec331077b6efa01bbf stripComments:false logicalFilePath:project_reorganisation\hma\object_grant\object_grants_as_grantor.admin.view.logger_logs_5_min.sql
-- sqlcl_snapshot src/database/admin/object_grants/object_grants_as_grantor.admin.view.logger_logs_5_min.sql:null:b05de936334c56a6763b7da5a1108a2681ba8135:create

grant select on admin.logger_logs_5_min to hma;