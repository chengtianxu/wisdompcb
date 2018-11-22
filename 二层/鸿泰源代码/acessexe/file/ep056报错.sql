ep056报错

OPERATION  NOT applicable  可用
主要是MIDAS.DLL文件有问题,放在WINDOWS\SYSTEM32目录 下重新注册一下
REGSVR32 -U MIDAS.DLL
REGSVR32  MIDAS.DLL

还有dbexpmss.dll 问题与上面一样的

