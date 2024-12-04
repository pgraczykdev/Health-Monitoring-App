-- liquibase formatted sql
-- changeset HMA:444fa1ced5076ab583154dff6395235c32789775 stripComments:false logicalFilePath:project_reorganisation\hma\object_grant\object_grants_as_grantor.admin.view.logger_logs_60_min.sql
-- sqlcl_snapshot src/database/admin/object_grants/object_grants_as_grantor.admin.view.logger_logs_60_min.sql:null:1b945ae9a52caace13c8f1793a9389be20212d46:create

grant select on admin.logger_logs_60_min to hma;