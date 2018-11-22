--EP091审核打印
IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'mo_prt_sample_flag') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0195'))) 
begin
alter table data0195 add mo_prt_sample_flag bit default(0) not null
---是否允许样板在配料单审核前打印配料单：0不允许，1允许
end
GO

IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'mo_prt_bf_audit_flag') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0195'))) 
begin
alter table data0195 add mo_prt_bf_audit_flag bit default(0) not null
---是否允许量产板在配料单审核前打印配料单：0不允许，1允许
end
GO
