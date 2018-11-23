@echo off
title 创建IP安全策略，屏蔽3000.30001端口
netsh ipsec static add policy name=XE3
netsh ipsec static add filterlist name=denyXE3
netsh ipsec static add filter filterlist=denyXE3 srcaddr=any dstaddr=Me dstport=30000 protocol=UDP
netsh ipsec static add filter filterlist=denyXE3 srcaddr=any dstaddr=Me dstport=30001 protocol=UDP
netsh ipsec static add filteraction name=deny30000 action=block
netsh ipsec static add rule name=Rule1 policy=XE3 filterlist=denyXE3 filteraction=deny30000
netsh ipsec static set policy name=XE3 assign=y
exit