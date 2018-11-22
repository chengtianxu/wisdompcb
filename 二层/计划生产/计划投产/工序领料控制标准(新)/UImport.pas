unit UImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,OleServer, Excel2000,ComObj;

type
  TFrmImport = class(TForm)
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
    lbl1: TLabel;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_ExModelClick(Sender: TObject);
    procedure btn_OpenFileClick(Sender: TObject);
    procedure btn_exportErrClick(Sender: TObject);
    procedure btn_checkClick(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    lst,lst2:  TStringList;
    procedure load_xls_to_sgrid(fileName:String; grid:TStringGrid);
  public
    { Public declarations }
  end;

var
  FrmImport: TFrmImport;

implementation

uses UDM,common, UMain;

{$R *.dfm}

procedure TFrmImport.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TFrmImport.btn_ExModelClick(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
begin
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := '模版';
  Sheet := XLApp.Workbooks[1].WorkSheets['模版'];

 Sheet.Cells[1,1]:='标准编码';
 Sheet.Cells[1,2]:='成本中心';
 Sheet.Cells[1,3]:='材料编号';
 Sheet.Cells[1,4]:='请购单位名称';
 Sheet.Cells[1,5]:='耗用单位名称';
 Sheet.Cells[1,6]:='转换率';
 Sheet.Cells[1,7]:='物料归类';
 Sheet.Cells[1,8]:='属性1';
 Sheet.Cells[1,9]:='属性2';
 Sheet.Cells[1,10]:='属性3';
 Sheet.Cells[1,11]:='属性4';
 Sheet.Cells[1,12]:='按保养频率';

  Sheet.Cells[1,13]:='几天保养一次';
 Sheet.Cells[1,14]:='保养一次耗用量';
 Sheet.Cells[1,15]:='按员工人数';
 Sheet.Cells[1,16]:='员工人数/班';
 Sheet.Cells[1,17]:='每班每人使用数量';
 Sheet.Cells[1,18]:='按照固定时间';
 Sheet.Cells[1,19]:='每月用几次';
 Sheet.Cells[1,20]:='每次用多少';
 Sheet.Cells[1,21]:='按产出因素';
 Sheet.Cells[1,22]:='单耗量/平米';
 Sheet.Cells[1,23]:='对应工序代码';
 Sheet.Cells[1,24]:='因素名称';

  Sheet.Cells[1,25]:='因素单位名称';
 Sheet.Cells[1,26]:='产出单位名称';
 Sheet.Cells[1,27]:='备注';
 Sheet.Cells[1,28]:='工厂代号';
 Sheet.Cells[1,29]:='因素频率天数';
 Sheet.Cells[1,30]:='按公式';
 Sheet.Cells[1,31]:='公式代码';





   XlApp.Visible := True;


end;

procedure TFrmImport.btn_OpenFileClick(Sender: TObject);
var
  fileName: string;
begin
 if sg1.rowcount>=2 then
    sg1.rowcount:=1;

 if dlgOpen1.Execute then  fileName:=dlgOpen1.FileName else exit;
  try
  load_xls_to_sgrid(fileName,sg1);

  except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
end;


end;

procedure TFrmImport.load_xls_to_sgrid(fileName:String; grid:TStringGrid);
var //从Excel中读取数据到 Grid
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  try
   XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
  except
   Screen.Cursor := crDefault;
   Exit;
  end;
   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     for iCount:=2 to 65535 do
      begin
       if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then
         break
       else
        begin
         grid.RowCount:=grid.RowCount+1;
        for jCount:=1 to 31 do
   //    grid.Cells[jCount-1,iCount-1]:=XLApp.workbooks[1].sheets[1].cells[iCount,jCount];
         grid.Cells[jCount-1,iCount-1]:=sheet.cells[iCount,jCount];
        end;
      end;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
   end
end;


procedure TFrmImport.btn_exportErrClick(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
  i,j: Integer;
begin
 if dm.eflag=0  then
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


   if sg1.Cells[31,i]='X' then
   Sheet.cells[i+1,j+1]:=sg1.Cells[j,i];

  end;





   XlApp.Visible := True;

end;

procedure TFrmImport.btn_checkClick(Sender: TObject);
var
  i,j,k ,l,l2,flag,XFlag,ISchecked:Integer;
  ssql,s,sr,str:string;
  //lst,lst2: TStringList;
begin
//
 ISchecked:=0;
 dm.Eflag:=0; 

 sg1.ColCount:=sg1.ColCount+2;
 sg1.Cells[31,0]:='是否OK';
 sg1.Cells[32,0]:='原因';
 sg1.ColWidths[31]:=40;
 sg1.ColWidths[32]:=800;
 try
    for i:=1  to sg1.RowCount-1 do
    begin
         XFlag:=0;
       if  sg1.Cells[0,i]='' then
        begin
        sg1.Cells[31,i]:='X';
        sg1.Cells[32,i]:=sg1.Cells[32,i]+'标准编码不能为空!';
        XFlag:=1;
        end;


        //判断成本中心：
       ssql:=' select rkey from data0034 where dept_code='''+trim(sg1.Cells[1,i])+'''   ';
       dm.OpenQry(DM.qry_temp,ssql);
       if  (dm.qry_temp.IsEmpty) or (sg1.Cells[1,i]='')  then
       begin
        sg1.Cells[31,i]:='X';
        sg1.Cells[32,i]:=sg1.Cells[32,i]+'成本中心和系统里面不匹配!';
        XFlag:=1;
       end;

          //物料归类名称判断：
       ssql:=' select rkey from data0496 where group_desc='''+trim(sg1.Cells[6,i])+'''   ';
       dm.OpenQry(DM.qry_temp,ssql);
       if  (dm.qry_temp.IsEmpty) or (sg1.Cells[1,i]='')  then
       begin
        sg1.Cells[31,i]:='X';
        sg1.Cells[32,i]:=sg1.Cells[32,i]+'成本中心和系统里面不匹配!';
        XFlag:=1;
       end;


       //材料编码判断：
        str:=trim(sg1.Cells[2,i]);
        if  (Pos('，',str)>0) or (str='') then
        begin
         sg1.Cells[31,i]:='X';
         sg1.Cells[32,i]:=sg1.Cells[32,i]+'有材料编码里面逗号不对或者材料编码为空，请核对好再导入!';
         XFlag:=1;
        end;

        if str<>'' then
        begin
         lst:=TStringList.Create;
         lst.CommaText:= str;
         for l:=0 to lst.Count-1 do
         begin
          ssql:=' select rkey from data0017 where inv_part_number='''+lst[l]+'''   ';
          dm.OpenQry(DM.qry_temp,ssql);
          if  (dm.qry_temp.IsEmpty) then
          begin
          sg1.Cells[31,i]:='X';
          sg1.Cells[32,i]:=sg1.Cells[32,i]+'材料编码'''+lst[l]+'''与系统里面不匹配!';
          XFlag:=1;
          end;

         end;
        end;

          //工序代码判断：
        str:=trim(sg1.Cells[22,i]);
        if  (Pos('，',str)>0) or (str='') then
        begin
         sg1.Cells[31,i]:='X';
         sg1.Cells[32,i]:=sg1.Cells[32,i]+'有工序代码里面逗号不对或者工序代码为空，请核对好再导入!';
         XFlag:=1;
        end;

        if str<>'' then
        begin
         lst2:=TStringList.Create;
         lst2.CommaText:= str;
         for l2:=0 to lst2.count-1 do
         begin
          ssql:=' select rkey from data0034 where dept_code='''+lst2[l2]+'''   ';
          dm.OpenQry(DM.qry_temp,ssql);
          if  (dm.qry_temp.IsEmpty) then
          begin
          sg1.Cells[31,i]:='X';
          sg1.Cells[32,i]:=sg1.Cells[32,i]+'工序代码'''+lst2[l2]+'''与系统里面不匹配!';
          XFlag:=1;
          end;

         end;
        end;


      //请购单位，
        ssql:=' select rkey from data0002 where unit_name='''+trim(sg1.Cells[3,i])+'''   ';

     dm.OpenQry(DM.qry_temp,ssql);
     if  (dm.qry_temp.IsEmpty)  and (trim(sg1.Cells[3,i])<>'')   then
     begin
      sg1.Cells[31,i]:='X';
      sg1.Cells[32,i]:=sg1.Cells[32,i]+'请购单位和系统里面不匹配!';
      XFlag:=1;
     end;
       //耗用单位判断
      ssql:=' select rkey from data0002 where unit_name='''+trim(sg1.Cells[4,i])+'''   ';

     dm.OpenQry(DM.qry_temp,ssql);
     if  (dm.qry_temp.IsEmpty)  and (trim(sg1.Cells[4,i])<>'')   then
     begin
      sg1.Cells[31,i]:='X';
      sg1.Cells[32,i]:=sg1.Cells[32,i]+'耗用单位和系统里面不匹配!';
      XFlag:=1;
     end;

          //因素单位判断
      ssql:=' select rkey from data0002 where unit_name='''+trim(sg1.Cells[24,i])+'''   ';

     dm.OpenQry(DM.qry_temp,ssql);
     if  (dm.qry_temp.IsEmpty) and (trim(sg1.Cells[24,i])<>'')    then
     begin
      sg1.Cells[31,i]:='X';
      sg1.Cells[32,i]:=sg1.Cells[32,i]+'因素单位和系统里面不匹配!';
      XFlag:=1;
     end;

      //产出单位判断
      ssql:=' select rkey from data0002 where unit_name='''+trim(sg1.Cells[25,i])+'''   ';
     dm.OpenQry(DM.qry_temp,ssql);
     if  (dm.qry_temp.IsEmpty)  and (trim(sg1.Cells[25,i])<>'')  then
     begin
      sg1.Cells[31,i]:='X';
      sg1.Cells[32,i]:=sg1.Cells[32,i]+'产出单位和系统里面不匹配!';
      XFlag:=1;
     end;

    //工厂
      ssql:=' select rkey from data0015 where warehouse_code='''+trim(sg1.Cells[27,i])+'''   ';
     dm.OpenQry(DM.qry_temp,ssql);
     if  (dm.qry_temp.IsEmpty) or (sg1.Cells[27,i]='')  then
     begin
      sg1.Cells[31,i]:='X';
      sg1.Cells[32,i]:=sg1.Cells[32,i]+'工厂代号和系统里面不匹配!';
      XFlag:=1;
     end;


      if Xflag=0  then
      sg1.Cells[31,i]:='V'
      else
      DM.Eflag:=1;


    end;
   ISchecked:=1;
   showmessage('检查完毕!');
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TFrmImport.btn_importClick(Sender: TObject);
var
i ,j,s,Xcount,Vcount,Xcount2,m,n,ISchecked,IFlag,eflag: integer;
ssql,ssql2, prodno,pid,ppid,PurUnit,UseUnit,FacUnit,OUnit,MType ,FacUse,FacDay,IsFormula  :string;
isMcount,IsFreq,IsTime,IsFac,FDays,FUse ,MCount ,Muse ,TCount ,TUse ,wh,control_ptr,str,str2 :string;
lst, lst2: TStringList ;
 Formula:Variant;
begin
//
      
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

 IFlag:=0;
  try
  if not dm.con1.InTransaction then  dm.con1.BeginTrans;

    if (dm.Eflag=1) and  (MessageDlg('有错误数据，需要继续导入正确的数据吗',mtInformation,[mbOK,mbCancel],0)= mrcancel) then exit

    else
    begin
       for i:=1 to  sg1.Rowcount-1 do
       begin
       if sg1.Cells[31,i]='V' then
        begin
         //先保存主表：136
         
        //成本中心：
        ssql:=' select rkey from data0034 where Dept_code='''+sg1.Cells[1,i]+''' ';
        ppid:=dm.GetOne('rkey',ssql,dm.qry_temp);

          //工厂：
        ssql:=' select rkey from data0015 where warehouse_code='''+sg1.Cells[27,i]+''' ';
       wh:=dm.GetOne('rkey',ssql,dm.qry_temp);



        //请购单位：
        ssql:=' select rkey from data0002 where unit_name='''+sg1.Cells[3,i]+''' ';
        PurUnit:=dm.GetOne('rkey',ssql,dm.qry_temp);

        if PurUnit='' then PurUnit:='null';

          //耗用单位：
        ssql:=' select rkey from data0002 where unit_name='''+sg1.Cells[4,i]+''' ';
        UseUnit:=dm.GetOne('rkey',ssql,dm.qry_temp);
        if UseUnit='' then UseUnit:='null';

          //因素单位：
        ssql:=' select rkey from data0002 where unit_name='''+sg1.Cells[24,i]+''' ';
        FacUnit:=dm.GetOne('rkey',ssql,dm.qry_temp);
        if FacUnit='' then FacUnit:='null';

          //产出单位：
        ssql:=' select rkey from data0002 where unit_name='''+sg1.Cells[25,i]+''' ';
        OUnit:=dm.GetOne('rkey',ssql,dm.qry_temp);
        if OUnit='' then OUnit:='null';

         //物料类型：
        ssql:=' select rkey from data0496 where group_desc='''+sg1.Cells[6,i]+''' ';
        MType:=dm.GetOne('rkey',ssql,dm.qry_temp);

        //按保养频率：
        if Trim(sg1.cells[11,i])<>''  then
        begin
         if Trim(sg1.cells[11,i])='是' then
          IsFreq:='1'
          else isfreq:='0';
        end
        else   isfreq:='0';


         //按员工数：
        if Trim(sg1.cells[14,i])<>''  then
        begin
         if Trim(sg1.cells[14,i])='是' then
          IsMcount:='1'
          else isMcount:='0';
        end
        else isMcount:='0';

         //按固定时间：
        if Trim(sg1.cells[17,i])<>''  then
        begin
         if Trim(sg1.cells[17,i])='是' then
          IsTime:='1'
          else IsTime:='0';
        end
         else IsTime:='0';

        //按产出因素：
        if Trim(sg1.cells[20,i])<>''  then
        begin
         if Trim(sg1.cells[20,i])='是' then
          IsFac:='1'
          else   IsFac:='0';
        end
         else IsFac:='0';

         
        //按产出因素：
        if Trim(sg1.cells[29,i])<>''  then
        begin
         if Trim(sg1.cells[29,i])='是' then
          IsFormula:='1'
          else   IsFormula:='0';
        end
         else IsFormula:='0';

          //几天保养一次：
          if Trim(sg1.cells[12,i])<>''  then
         FDays:= Trim(sg1.cells[12,i])
        else
          FDays:='0' ;

       //保养一次用量：
         if Trim(sg1.cells[13,i])<>''  then
         FUse:= Trim(sg1.cells[13,i])
        else
         FUse:='0' ;

          //员工人数：
         if Trim(sg1.cells[15,i])<>''  then
          MCount:=Trim(sg1.cells[15,i])
        else
         MCount:='0' ;
         
          //每人使用量：
         if Trim(sg1.cells[16,i])<>''  then
          Muse:=Trim(sg1.cells[16,i])
        else
         Muse:='0' ;

         //每月几次：
         if Trim(sg1.cells[18,i])<>''  then
          TCount:=  Trim(sg1.cells[18,i])
        else
          TCount:='0';

         //每次用量：
         if Trim(sg1.cells[19,i])<>''  then
          TUse:=Trim(sg1.cells[19,i])
        else
         TUse:='0' ;

          //单耗：
         if Trim(sg1.cells[21,i])<>''  then
          FacUse:=Trim(sg1.cells[21,i])
        else
         FacUse:='0' ;

         
          //因素天数：
         if Trim(sg1.cells[28,i])<>''  then
          FacDay:=Trim(sg1.cells[28,i])
        else
         FacDay:='0' ;

         //if  sg1.cells[28,i]<>'' then
            Formula:=sg1.cells[30,i];


        ssql2:='select rkey from  data0136 where control_name='''+Trim(sg1.cells[0,i])+''' ';
         dm.openqry(DM.qry_temp,ssql2);
         if not DM.qry_temp.isempty then
         begin
         ssql:= 'update  data0136  set  DeptID_p='+PPID+',warehouse_ptr='+wh+' ,PurUnit='+PurUnit+',useUnit='+useUnit+' , '+
                ' crate= '+Trim(sg1.cells[5,i])+',PgroupID='+MType+', property='''+Trim(sg1.cells[7,i])+''',property2='''+Trim(sg1.cells[8,i])+''',  '+
               ' property3='''+Trim(sg1.cells[9,i])+''',property4='''+Trim(sg1.cells[10,i])+''', '+
                '  IsFreq='+IsFreq+',IsMcount='+IsMcount+',IsSTime='+IsTime+',IsFactor='+IsFac+',Fdays='+Fdays+',FAmountused='+Fuse+',  '+
               ' Mcount='+Mcount+',Mused='+Muse+',Tcount='+Tcount+',Tused='+Tuse+',stan_consume='+FacUse+',facname='''+Trim(sg1.cells[23,i])+''',fac_unit='+FacUnit+',Unit_ptr='+Ounit+' '+
               ',FacDay= '+FacDay+' ,IsFormula='+IsFormula+',Formula_ptr=(case when '''+Formula+'''<>'''' then '''+Formula+''' else null end     )'+
                ' where  control_name='''+Trim(sg1.cells[0,i])+'''  ' ;
             dm.execsql(DM.qry_temp,ssql);
         IFlag:=1;
         end
         else
         begin
          ssql:=' insert into data0136(control_name,unit_ptr,warehouse_ptr,stan_consume, '+
                '  DeptID_p,PurUnit,UseUnit,CRate,PGroupID,property,property2,property3,property4,'+
               '  isfreq,Fdays,Famountused,IsMCount,Mcount,Mused,IsSTime,TCount,Tused,IsFactor,FacName,remark,Fac_unit,FacDay,IsFormula,Formula_ptr) '+
               '  values('''+Trim(sg1.cells[0,i])+''', '+Ounit+','+wh+','+FacUse+', '+
                ' '+PPID+','+PurUnit+','+useUnit+', '+Trim(sg1.cells[5,i])+','+MType+','''+Trim(sg1.cells[7,i])+''', '''+Trim(sg1.cells[8,i])+''','''+Trim(sg1.cells[9,i])+''', '+
               '  '''+Trim(sg1.cells[10,i])+''','+IsFreq+','+Fdays+','+Fuse+','+IsMcount+','+Mcount+','+Muse+','+IsTime+','+TCount+','+Tuse+','+IsFac+','''+Trim(sg1.cells[23,i])+''', '+
               '  '''+Trim(sg1.cells[26,i])+''','+FacUnit+','+FacDay+','+IsFormula+' ,'''+Formula+''')   ';
         dm.execsql(DM.qry_temp,ssql);
         IFlag:=1;
         end;

         //control_ptr
           ssql:=' select rkey from data0136 where control_name='''+sg1.Cells[0,i]+''' ';
         control_ptr:=dm.GetOne('rkey',ssql,dm.qry_temp);


         ////////////////////////////////////////////////////////////////
         str2:=trim(sg1.Cells[22,i]);
         lst2:=TStringList.Create;
         lst2.CommaText:= str2;
         //工序保存 154：
         for m:=0  to lst2.Count-1 do
         begin
           ssql:=' select rkey from data0034 where dept_code='''+lst2[m]+''' '  ;
             pid:= inttostr(dm.GetOne('rkey',ssql,dm.qry_temp));
          ssql:= ' select control_ptr from data0154 where control_ptr='+control_ptr+' and dept_ptr= '+pid+'';
          dm.openqry(DM.qry_temp,ssql);
          if not dm.qry_temp.isempty  then
          begin
//           ssql:= 'update data0154 set dept_ptr='+pid+' where control_ptr='+control_ptr+' ' ;
//          dm.execsql(DM.qry_temp,ssql);
          end
          else
          begin
            ssql:='insert into data0154(control_ptr,dept_ptr) values('+control_ptr+','+pid+')';
            dm.execsql(DM.qry_temp,ssql);
          end;
         end;

         //////////////////////////////////////////////////////////////////////////
         // 材料编码保存155：
          str:=trim(sg1.Cells[2,i]);
         lst:=TStringList.Create;
         lst.CommaText:= str;
         for n:=0  to lst.Count-1 do
         begin
           ssql:=' select rkey from data0017 where inv_part_number='''+lst[n]+''' ' ;
             prodno:= inttostr(dm.GetOne('rkey',ssql,dm.qry_temp));
          ssql:= ' select control_ptr from data0155 where control_ptr='+control_ptr+' and invt_ptr= '+prodno+'';
          dm.openqry(DM.qry_temp,ssql);
          if not dm.qry_temp.isempty  then
          begin
//           ssql:= 'update data0155 set invt_ptr='+pid+' where control_ptr='+control_ptr+' ' ;
//          dm.execsql(DM.qry_temp,ssql);
          end
          else
          begin
           ssql:='insert into data0155(control_ptr,invt_ptr) values('+control_ptr+','+prodno+')';
            dm.execsql(DM.qry_temp,ssql);
          end;
         end;



        end;
      end;

    end;



    dm.con1.CommitTrans;
    if IFlag=1  then 
     showmessage('导入成功!');
       close;
  except on e:exception do
  begin
  ShowMessage('错误：'+e.Message+'----:'+ssql);
  dm.con1.RollbackTrans;
  exit;
  end;
  end;

 
   //FrmMain.btn_refreshClick(sender);
   
 if eflag=0  then
 begin
 for i:=1 to  sg1.RowCount-1 do
  sg1.Rows[i].Clear;
  sg1.RowCount:=1;
  end
  else
  begin

        s:=0;   //Vcount:=0;   //s:='1'; //
      Xcount:=0;
    for i:=1 to sg1.RowCount-1 do            // sg1.RowCount-1 do
    begin
    if sg1.cells[12,i]='V'  then
    begin
     Vcount:=Vcount+1;
     sg1.Rows[i].Clear;
    end;
      if sg1.cells[12,i]='X'  then
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
   // sg1.RowCount:=Xcount+1;


        close;

 end;

end;

procedure TFrmImport.FormShow(Sender: TObject);
begin
 sg1.ColCount:=31;
 sg1.RowCount:=1 ;
 sg1.Cells[0,0]:='标准编码';
 sg1.Cells[1,0]:='成本中心编号';
 sg1.Cells[2,0]:='材料编码';
 sg1.Cells[3,0]:='请购单位名称';
 sg1.Cells[4,0]:='耗用单位名称';
 sg1.Cells[5,0]:='转换率';
 sg1.Cells[6,0]:='物料类别名称';
 sg1.Cells[7,0]:='属性1';
 sg1.Cells[8,0]:='属性2';
 sg1.Cells[9,0]:='属性3';
 sg1.Cells[10,0]:='属性4';
 sg1.Cells[11,0]:='按保养频率';

 sg1.Cells[12,0]:='几天保养一次';
 sg1.Cells[13,0]:='保养一次耗用量';
 sg1.Cells[14,0]:='按员工人数';
 sg1.Cells[15,0]:='员工人数/班';
 sg1.Cells[16,0]:='每班每人使用量';
 sg1.Cells[17,0]:='按固定时间';
 sg1.Cells[18,0]:='每月用几次';
 sg1.Cells[19,0]:='每次用多少';
 sg1.Cells[20,0]:='按产出因素';
 sg1.Cells[21,0]:='单耗量/平米';
 sg1.Cells[22,0]:='工序代码';
 sg1.Cells[23,0]:='因素名称';

 sg1.Cells[24,0]:='因素单位名称';
 sg1.Cells[25,0]:='产出单位名称';
 sg1.Cells[26,0]:='备注';
 sg1.Cells[27,0]:='工厂代号';
  sg1.Cells[28,0]:='因素频率天数';
 sg1.Cells[29,0]:='按公式';
  sg1.Cells[30,0]:='公式代码';


  sg1.ColWidths[0]:=120;
  sg1.ColWidths[1]:=100;
  sg1.ColWidths[2]:=200;
  sg1.ColWidths[3]:=50;
  sg1.ColWidths[4]:=50;
  sg1.ColWidths[5]:=50;
  sg1.ColWidths[6]:=50;
  sg1.ColWidths[7]:=50;
  sg1.ColWidths[8]:=50;
  sg1.ColWidths[9]:=50;
  sg1.ColWidths[10]:=50;
  sg1.ColWidths[11]:=50;

   sg1.ColWidths[12]:=60;
  sg1.ColWidths[13]:=60;
  sg1.ColWidths[14]:=60;
  sg1.ColWidths[15]:=50;
  sg1.ColWidths[16]:=50;
  sg1.ColWidths[17]:=50;
  sg1.ColWidths[18]:=60;
  sg1.ColWidths[19]:=50;
  sg1.ColWidths[20]:=60;
  sg1.ColWidths[21]:=60;
  sg1.ColWidths[22]:=180;
  sg1.ColWidths[23]:=60;

  sg1.ColWidths[24]:=60;
  sg1.ColWidths[25]:=60;
  sg1.ColWidths[26]:=100;
  sg1.ColWidths[27]:=100;
  sg1.ColWidths[27]:=80;

end;

end.
