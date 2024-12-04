-- liquibase formatted sql
-- changeset HMA:d8cbd7157559effca99271f40bf8fef174c1c908 stripComments:false logicalFilePath:project_reorganisation\hma\object_grant\object_grants_as_grantor.admin.table.logger_logs.sql
-- sqlcl_snapshot src/database/admin/object_grants/object_grants_as_grantor.admin.table.logger_logs.sql:null:f4b9c00789dacd6b338364436e4df7cb6a68b2c8:create

grant delete on admin.logger_logs to hma;

grant select on admin.logger_logs to hma;