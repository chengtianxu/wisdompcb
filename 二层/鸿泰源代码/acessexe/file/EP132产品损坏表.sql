--产品损坏原因表
--spec_type为1时，报废率分析不予分析
select * from data0039 where SPEC_TYPE=1 --spec_type 为0是统计报废率，1不统计报废率