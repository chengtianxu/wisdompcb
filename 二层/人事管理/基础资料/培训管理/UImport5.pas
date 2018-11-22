unit UImport5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, ExtCtrls, Excel2000,ComObj;

type
  TfrmImport5 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn_ExModel: TButton;
    btn_exit: TButton;
    btn_exportErr: TButton;
    pnl3: TPanel;
    sg1: TStringGrid;
    pnl4: TPanel;
    btn_OpenFile: TButton;
    btn_check: TButton;
    btn_import: TButton;
    dlgOpen1: TOpenDialog;
    qrytemp: TADOQuery;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_ExModelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure btn_exportErrClick(Sender: TObject);
    procedure btn_OpenFileClick(Sender: TObject);
    procedure btn_checkClick(Sender: TObject);
  private
    { Private declarations }
     ISchecked: integer;
     Eflag: Integer;
       err:Boolean;
  public
    { Public declarations }
  end;

var
  frmImport5: TfrmImport5;

implementation
    uses UDM,common, UMain;
{$R *.dfm}

procedure TfrmImport5.btn_exitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmImport5.btn_ExModelClick(Sender: TObject);
begin
  Export_Grid_to_Excel(sg1,Caption,True);
end;

procedure TfrmImport5.FormShow(Sender: TObject);
begin
  with sg1 do
  begin
    sg1.RowCount:=3;
    Cells[0,0]:='员工工号';
    Cells[1,0]:='培训编号';
    Cells[2,0]:='培训主题';
    Cells[3,0]:='开始日期';
    Cells[4,0]:='开始时间';
    Cells[5,0]:='结束日期';
    Cells[6,0]:='结束时间';
    Cells[7,0]:='培训时长(分钟)';
    Cells[8,0]:='培训讲师';
    Cells[9,0]:='培训地点';
    Cells[10,0]:='培训成绩';
    Cells[11,0]:='培训结果';
    Cells[12,0]:='培训内容';
    Cells[13,0]:='进行状况(未完成/完成)';
    Cells[14,0]:='培训类型';
    Cells[15,0]:='培训费用';
    Cells[16,0]:='费用有效期';
    Cells[17,0]:='关键岗位';

    Cells[18,0]:='课程编号';
    Cells[19,0]:='课程名称';
    Cells[20,0]:='培训类别';
    Cells[21,0]:='培训方式';
    Cells[22,0]:='考核方式';

    Cells[23,0]:='是否OK';  //V是 X 不是
    Cells[24,0]:='错误信息';


    Cells[0,1]:='10010';
    Cells[1,1]:='2013060001';
    Cells[2,1]:='培训专案讲课';
    Cells[3,1]:='2013-10-01';
    Cells[4,1]:='9:30';
    Cells[5,1]:='2013-10-02';
    Cells[6,1]:='10:30';
    Cells[7,1]:='60';
    Cells[8,1]:='张三';
    Cells[9,1]:='三楼会议室';
    Cells[10,1]:='98';
    Cells[11,1]:='合格';
    Cells[12,1]:='培训内容';
    Cells[13,1]:='完成';
    Cells[14,1]:='专案';
    Cells[15,1]:='100';
    Cells[16,1]:='2014-10-01';
    Cells[17,1]:='如切片员';

    Cells[18,1]:='东莞五株用';
    Cells[19,1]:='东莞五株用';

    Cells[20,1]:='东莞五株用';
    Cells[21,1]:='东莞五株用';
    Cells[22,1]:='东莞五株用';
 end;

end;

procedure TfrmImport5.btn_importClick(Sender: TObject);
var
i ,j, atype,EmpID,Vcount,Xcount,Xcount2,s,TStatus: integer;
Lsql,Lsql2 : string;
daystr,Key:string;
begin

 if sg1.RowCount<2  then
 begin
  ShowMessage('请先导入资料');
  exit;
 end;

 if ISchecked=0 then
 begin
  showmessage('请先对数据进行检查!');
   btn_check.setfocus;
  exit;
 end;

 try
    if (Eflag=1) and  (MessageDlg('有错误数据需要继续导入正确的数据吗',mtInformation,[mbOK,mbCancel],0)= mrcancel) then exit

    else
    begin
     for i:=1 to  sg1.Rowcount-1 do
     begin
     if sg1.Cells[23,i]='V' then
      begin
       if  sg1.Cells[13,i]='已完成'  then
         TStatus :=1
       else   TStatus :=0;
       
        Lsql:= 'if exists(select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb..#trainimport'') and type=''U'') '+ #13+
            'drop table #trainimport '+#13+
            'create table #trainimport(employeeid int,employeecode nvarchar(20),train_no varchar(50),train_topics nvarchar(50), '+
            ' startdate datetime,starttime varchar(20),enddate datetime,endtime varchar(20),train_time float, '+
            ' teacher nvarchar(50),train_place nvarchar(30),train_grade nvarchar(20),train_result nvarchar(20), '+
            ' train_content nvarchar(200),train_status int,train_feels money,effective_date datetime,oprator_ptr int, '+
            ' oprate_time datetime,traintype nvarchar(20),typeid int,feels_payed bit,ptr_flag bit,dbflag bit,deptid int,keyid int,KeyPosition varchar(40), '+
            'ccode varchar(20),cname varchar(30),tc_ptr int,Ctype varchar(10),Ttype varchar(10),Etype varchar(10), CtypeiD int, TTYpeID int,ETYpeid int,postID int)';
      dm.execsql(dm.qry_temp,Lsql);

      Lsql:= 'insert into #trainimport values(0,'+ QuotedStr(sg1.Cells[0,i])+','+ QuotedStr(sg1.Cells[1,i])+','+ QuotedStr(sg1.Cells[2,i])+','+
              QuotedStr(sg1.Cells[3,i])+','+ QuotedStr(sg1.Cells[4,i])+','+ QuotedStr(sg1.Cells[5,i])+','+QuotedStr(sg1.Cells[6,i])+','+ sg1.Cells[7,i]+','+
              QuotedStr(sg1.Cells[8,i])+','+QuotedStr(sg1.Cells[9,i])+','+QuotedStr(sg1.Cells[10,i])+','+ QuotedStr(sg1.Cells[11,i])+','+
              QuotedStr(sg1.Cells[12,i])+','+inttostr(TStatus)+','+ sg1.Cells[15,i]+','+ QuotedStr(sg1.Cells[16,i]) +','+ user_ptr+','+
              QuotedStr(FormatDateTime('yyyy-MM-dd',getsystem_date(DM.qry_temp,1)))+','+QuotedStr(sg1.Cells[14,i])+',0,0,0,0,0,null,' +
              QuotedStr(sg1.Cells[17,i])+','+QuotedStr(sg1.Cells[18,i])+','+QuotedStr(sg1.Cells[19,i])+ ',0,'+QuotedStr(sg1.Cells[20,i])+ ','+QuotedStr(sg1.Cells[21,i])+ ' '+
              ','+QuotedStr(sg1.Cells[22,i])+ ',-1,-1,-1,-1)';
      dm.execsql(dm.qry_temp,Lsql);

      Lsql:='update #trainimport set employeeid = employeemsg.rkey,typeid = datadetail.rkey,deptid = employeemsg.departmentid,postid=employeemsg.position ,tc_ptr=isnull(trainclass.rkey,0) ' + #13+
                ' ,keyid = isnull(hr_KeyPosition.rkey,0)'+#13+
                ',CtypeID=(case when #trainimport.ctype=''入职培训''  then 0  when #trainimport.ctype=''岗前培训''  then 1 when #trainimport.ctype=''在岗培训''  then 2 else -1 end )'+  #13+
                ',TtypeID=(case when #trainimport.ttype=''课堂面授''  then 0  when #trainimport.Ttype=''实操培训''  then 1 when #trainimport.Ttype=''在线培训''  then 2 else -1 end )'+  #13+
                ',EtypeID=(case when #trainimport.Etype=''口试考核''  then 0  when #trainimport.Etype=''笔试考核''  then 1 when #trainimport.Etype=''实操考核''  then 2 when #trainimport.Etype=''在线考核''  then 3 else -1 end )'+  #13+
                'from #trainimport  '+  #13+
                ' inner join employeemsg on #trainimport.employeecode=employeemsg.employeecode '+  #13+
                'inner join datadetail on #trainimport.traintype=datadetail.item '+#13+
                'left join trainclass  on #trainimport.ccode=trainclass.ccode   '+#13+
                'left join hr_KeyPosition on #trainimport.deptid = hr_KeyPosition.deptid and #trainimport.KeyPosition = hr_KeyPosition.positionname ';
               dm.execsql(dm.qry_temp,Lsql);

         LSql:=  'select * from #trainimport';
         dm.openqry(dm.qry_temp,Lsql);

       Lsql:='select rkey,employeeid,Train_no from employee_train where employeeid ='+
                DM.qry_temp.FieldByName('employeeid').AsString +' and tc_ptr = '+ DM.qry_temp.FieldByName('tc_ptr').AsString +
                ' and Deptid='+DM.qry_temp.FieldByName('DeptID').AsString+' and postID='+DM.qry_temp.FieldByName('POstID').AsString+' '+
                ' and convert(char(7),startdate,120)='''+formatdatetime('yyyy-MM',DM.qry_temp.FieldByName('startdate').AsDateTime)+''' ';
               // ShowMessage(Lsql);
        dm.openqry(dm.qry_temp,Lsql);
        if dm.qry_temp.IsEmpty then
        begin
         Lsql:='insert into employee_train(employeeid, Train_NO, Train_topics, startdate, starttime, enddate, endtime, Train_time, Teacher, ' +
                  'Train_place, Train_grade, Train_result, Train_content, Train_status, ptr_flag, type_ptr, train_feels, effective_date, ' +
                  'feels_payed, oprator_ptr, oprate_time, employeecode,KeyPositionId,tc_ptr,DeptID,Ctype,TType,ETYpe,postID)'+#13+
                  'select employeeid,train_no,train_topics,startdate,starttime,enddate,endtime,train_time,teacher,train_place,train_grade, '+
                  'train_result,train_content,train_status,ptr_flag,typeid,train_feels,effective_date,feels_payed,oprator_ptr,oprate_time,employeecode,keyid,tc_ptr,DeptID '+ #13+
                  ',CtypeID,TTypeID,ETYpeID,postid'+ #13+
                  'from #trainimport where (employeeid <>0 and typeid <>0 ) ';  //and dbflag=0
        dm.execsql(DM.qry_temp,Lsql);
        end;
//        else
//        begin
//         Lsql:='update  Employee_Train set score='+floattostr(Lfrm.FAScore)+',Train_result='''+LResult+''' '  +
//         ' where employeeid='+qry66.fieldbyname('rkey').AsString+' and tc_ptr='+qry66.fieldbyname('tc_ptr').AsString+
//         ' DeptID='+qry66.fieldbyname('departmentid').AsString+',PostID= '+qry66.fieldbyname('position').AsString+
//         ' and convert(char(7),startdate,120)=''convert(char(7),getdate(),120)'' ';
//            dm.execsql(DM.qry_temp,Lsql);
//        end;
      end;
     end;
    end;

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
 showmessage('导入成功!');
 
  
   
 if eflag=0  then
 begin
 for i:=1 to  sg1.RowCount-1 do
  sg1.Rows[i].Clear;
  sg1.RowCount:=1;
  end
  else
  begin
     s:=0;
      Xcount:=0;
    for i:=1 to sg1.RowCount-1 do          
    begin
    if sg1.cells[6,i]='V'  then
    begin
     Vcount:=Vcount+1;
     sg1.Rows[i].Clear;
    end;
      if sg1.cells[6,i]='X'  then
      Xcount:=Xcount+1;
    end;
    
      Xcount2:=0;
    //非空行上移：
    for i:=1 to sg1.RowCount-1 do
    begin
     if sg1.cells[0,i]='' then
     for j:=1 to sg1.RowCount-1 do
     begin
      if  (sg1.cells[6,j]='X') and  (Xcount2<=Xcount)  then
       begin
        Xcount2:=Xcount2+1;
        sg1.Rows[i].Text:=sg1.Rows[j].Text;
        sg1.Rows[j].Clear;
         exit;
       end;
     end;
    end;


 end;
end;

procedure TfrmImport5.btn_exportErrClick(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
  i,j: Integer;
begin
 if eflag=0  then
 begin
  showmessage('没有错误数据！');
  exit;
 end;
 
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '错误数据';
  Sheet := XLApp.Workbooks[1].WorkSheets['错误数据'];

  for j:=0  to  sg1.ColCount-1  do
   for i:=0  to  sg1.RowCount-1 do 
  begin
    if i=0   then
     Sheet.cells[1,j+1]:=sg1.Cells[j,0];


   if sg1.Cells[6,i]='X' then
   Sheet.cells[i+1,j+1]:=sg1.Cells[j,i];

  end;





   XlApp.Visible := True;
end;

procedure TfrmImport5.btn_OpenFileClick(Sender: TObject);
var
  fileName: string;
begin
 if sg1.rowcount>=2 then
    sg1.rowcount:=1;

 if dlgOpen1.Execute then  fileName:=dlgOpen1.FileName else exit;
  try
  common.load_xls_to_sgrid(fileName,sg1);

  except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
end;
end;

procedure TfrmImport5.btn_checkClick(Sender: TObject);
var
  i,j,k ,flag,XFlag:Integer;
  Lsql,s:string;
   checkDate:TDateTime;
   checkfloat:Double;
begin
//
 ISchecked:=0;
 Eflag:=0;
 XFlag:=0;
 sg1.ColCount:=sg1.ColCount+2;
 sg1.Cells[23,0]:='是否OK';
 sg1.Cells[24,0]:='原因';
 sg1.ColWidths[23]:=40;
 sg1.ColWidths[24]:=800;
 try
  for i:=1  to sg1.RowCount-1 do
  begin
   if  sg1.Cells[0,i]<>'' then
   begin
      //判断工号和姓名能否对上或在系统里能不能找到
     Lsql:=' select employeecode from employeemsg where employeecode='''+trim(sg1.Cells[0,i])+'''   ';
     dm.OpenQry(DM.qry_temp,Lsql);
     if  (dm.qry_temp.IsEmpty) or (sg1.Cells[0,i]='')  then
     begin
      sg1.Cells[23,i]:='X';
      sg1.Cells[24,i]:=sg1.Cells[7,i]+'工号不存在!';
      XFlag:=1;
     end;

     //判断年月格式是否正确：
     if not TryStrToDate(Trim(sg1.cells[3,i]),checkDate) then
     begin
     sg1.Cells[23,i]:='X';
     sg1.Cells[24,i]:=sg1.Cells[24,i] + ' 开始日期格式不对 ';
     XFlag:=1;
     end;
     if not TryStrToDateTime(Trim(sg1.cells[4,i]),checkDate) then
     begin
     sg1.Cells[23,i]:='X';
     sg1.Cells[24,i]:=sg1.Cells[24,i] + ' 开始时间格式不对 ';
     XFlag:=1;
     end;
     if not TryStrToDate(Trim(sg1.cells[5,i]),checkDate) then
     begin
     sg1.Cells[23,i]:='X';
     sg1.Cells[24,i]:=sg1.Cells[24,i] + ' 结束日期格式不对 ';
     XFlag:=1;
     end;
     if not TryStrToDateTime(Trim(sg1.cells[6,i]),checkDate) then
     begin
     sg1.Cells[23,i]:='X';
     sg1.Cells[24,i]:=sg1.Cells[24,i] + ' 结束时间格式不对 ';
     XFlag:=1;
     end;

     if (sg1.Cells[13,i]<>'已完成') and  (sg1.Cells[13,i]<>'未完成') then
     begin
     sg1.Cells[23,i]:='X';
     sg1.Cells[24,i]:=sg1.Cells[24,i] + ' 完成状况输入有误 ';
     XFlag:=1;
     end;

     //培训费用：
      if not TryStrToFloat(Trim(sg1.cells[15,i]),checkfloat) then      //培训费用
      begin
      sg1.Cells[23,i]:='X';
      sg1.Cells[24,i]:=sg1.Cells[24,i-1] + ' 培训费用有误 ';
      XFlag:=1;
      end;

     Lsql:=' select rkey from trainclass where  ccode='''+trim(sg1.Cells[18,i])+''' and cName='''+trim(sg1.Cells[19,i])+'''  ';
     common.OpenQuery(dm.qry_temp,Lsql);
      if  ( dm.qry_temp.IsEmpty)  then
     begin
      sg1.Cells[23,i]:='X';
      sg1.Cells[24,i]:=sg1.Cells[24,i]+'课程编号或者课程名称不对!';
      XFlag:=1;
     end ;


   //类别
    if (trim(sg1.Cells[20,i])<>'入职培训')  and  (trim(sg1.Cells[20,i])<>'岗前培训')  and   (trim(sg1.Cells[20,i])<>'在岗培训') then
    begin
    sg1.Cells[23,i]:='X';
    sg1.Cells[24,i]:=sg1.Cells[24,i]+'课程类别不对!';
    XFlag:=1;
    end;

    //培训方式
    if (trim(sg1.Cells[21,i])<>'课堂面授')  and (trim(sg1.Cells[21,i])<>'实操培训')  and  (trim(sg1.Cells[21,i])<>'在线培训') then
    begin
    sg1.Cells[23,i]:='X';
    sg1.Cells[24,i]:=sg1.Cells[24,i]+'培训方式不对!';
    XFlag:=1;
    end;

    //考核方式
    if (trim(sg1.Cells[22,i])<>'口试考核')  and (trim(sg1.Cells[22,i])<>'笔试考核')  and  (trim(sg1.Cells[22,i])<>'实操考核')  and  (trim(sg1.Cells[22,i])<>'在线考核')  then
    begin
    sg1.Cells[23,i]:='X';
    sg1.Cells[24,i]:=sg1.Cells[24,i]+'考核方式不对!';
    XFlag:=1;
    end;

   ////////////////////////////////////////////////////////////
    if Xflag=0  then
     sg1.Cells[23,i]:='V'
    else
    begin
     Eflag:=1;
     //sg1.Rows[i].c.Color:=clRed;
    end;

    end;
   end;
  ISchecked:=1 
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

end.
