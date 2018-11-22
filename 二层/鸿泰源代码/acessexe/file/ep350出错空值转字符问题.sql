ep350出错空值转字符问题
Could not convert variant of type (Null) into type (String)

是因为0091里的SYSUSER_PTR指定73表的RKEY有问题,73表这个人被删除,
解决办法删除或改另一个RKEY