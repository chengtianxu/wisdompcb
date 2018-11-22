\\192.168.8.8\erp最新程序更新\日常问题分析思路\解决打印乱码的问题

一、
拷贝rbRCL107.bpl、rbRCL107.dcp这两个文件替换到客户服务器的ERP目录文件。
如果还不行、哪一个模块的告诉相应负责人、让他把上面服务器文件夹里面的ppPlainText.pas更新到自己的报表安装路径 RBuilder\Lib和RBuilder\Source里面。重新编译成exe再更新测试看。   

二、行高

三、DBtext和DBMEMO

有数据没办法显示
Value := formatfloat('#######',strtofloat('0'+DBPipeline1[V-CUT'])+
                                strtofloat('0'+DBPipeline1['ROU'])+
                             strtofloat('0'+DBPipeline1['PH']));   