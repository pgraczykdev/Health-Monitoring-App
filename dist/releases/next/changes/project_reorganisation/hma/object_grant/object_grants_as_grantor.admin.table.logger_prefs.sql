-- liquibase formatted sql
-- changeset HMA:e59a873ccc1be59a3ef23a341f0bea0639c25903 stripComments:false logicalFilePath:project_reorganisation\hma\object_grant\object_grants_as_grantor.admin.table.logger_prefs.sql
-- sqlcl_snapshot src/database/admin/object_grants/object_grants_as_grantor.admin.table.logger_prefs.sql:null:1afefaa48d96c0ff17475080f2f7a4e45f53bb23:create

grant select on admin.logger_prefs to hma;

grant update on admin.logger_prefs to hma;