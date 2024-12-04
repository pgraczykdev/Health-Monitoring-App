-- liquibase formatted sql
-- changeset HMA:f060727acddccb8af77169a0fb2712bfe117794d stripComments:false logicalFilePath:project_reorganisation\hma\object_grant\object_grants_as_grantor.admin.table.logger_prefs_by_client_id.sql
-- sqlcl_snapshot src/database/admin/object_grants/object_grants_as_grantor.admin.table.logger_prefs_by_client_id.sql:null:4fe9b092e2d152de7e3891d8bee1482817b4d32a:create

grant select on admin.logger_prefs_by_client_id to hma;