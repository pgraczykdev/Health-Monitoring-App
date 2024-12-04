-- liquibase formatted sql
-- changeset HMA:99f2d3ef63a90841e0e82ac70b055e9e3cb24a23 stripComments:false logicalFilePath:project_reorganisation\hma\object_grant\object_grants_as_grantor.admin.table.logger_logs_apex_items.sql
-- sqlcl_snapshot src/database/admin/object_grants/object_grants_as_grantor.admin.table.logger_logs_apex_items.sql:null:1fc47e1f98258dff344487a74574d58926ba22d7:create

grant select on admin.logger_logs_apex_items to hma;