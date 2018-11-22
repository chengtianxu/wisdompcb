unit UImport3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,OleServer, Excel2000,ComObj, DB, ADODB,DateUtils;

type
  TfrmImport3 = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    btn_ExModel: TButton;
    btn_exit: TButton;
    btn_exportErr: TButton;
    Panel2: TPanel;
    sg1: TStringGrid;
    Panel3: TPanel;
    btn_OpenFile: TButton;
    btn_check: TButton;
    btn_import: TButton;
    OpenDialog1: TOpenDialog;
    qrytemp: TADOQuery;
    procedure btn_ExModelClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure btn_OpenFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_checkClick(Sender: TObject);
    procedure btn_exportErrClick(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
  private
    { Private declarations }
    ISchecked: integer;
    Eflag: Integer;
  public
    { Public declarations }
  end;

var
  frmImport3: TfrmImport3;

implementation
          uses common, UDM, UMain;
{$R *.dfm}

procedure TfrmImport3.btn_ExModelClick(Sender: TObject);
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

  Sheet.Cells[1,1]:='月份';
  Sheet.Cells[1,2]:='部门';
 // Sheet.Cells[1,3]:='职务';
  Sheet.Cells[1,3]:='课程编号';
  Sheet.Cells[1,4]:='课程名称';

   XlApp.Visible := True;

end;

procedure TfrmImport3.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmImport3.btn_OpenFileClick(Sender: TObject);
var
  fileName: string;
begin
 if sg1.rowcount>=2 then
    sg1.rowcount:=1;

 if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
  try
  common.load_xls_to_sgrid(fileName,sg1);

  except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
end;
end;

procedure TfrmImport3.FormShow(Sender: TObject);
begin
  sg1.ColCount:=12;
  sg1.RowCount:=1 ;
  sg1.Cells[0,0]:='月份';
  sg1.Cells[1,0]:='部门';
  sg1.Cells[2,0]:='课程编号';
  sg1.Cells[3,0]:='课程名称';
  sg1.Cells[4,0]:='是否OK';
  sg1.Cells[5,0]:='原因';
  sg1.Cells[6,0]:=' ';
  sg1.Cells[7,0]:='D_ptr';
  sg1.Cells[8,0]:='TC_ptr';
  sg1.Cells[9,0]:='ttype';


  sg1.ColWidths[0]:=60;
  sg1.ColWidths[1]:=100;
  sg1.ColWidths[2]:=100;
  sg1.ColWidths[3]:=120;
  sg1.ColWidths[4]:=80;
  sg1.ColWidths[5]:=200;

  sg1.ColWidths[6]:=-1;
  sg1.ColWidths[7]:=-1;
  sg1.ColWidths[8]:=-1;
  sg1.ColWidths[9]:=-1;
 
end;

procedure TfrmImport3.btn_checkClick(Sender: TObject);
var
  i,j,k ,flag,XFlag: integer;
  DeptID,PostID,tc_ptr,ttype,PMonth:string;
  ssql,s:string;
   fDate : TDateTime;
begin
 ISchecked:=0;
 Eflag:=0;

 try
  for i:=1  to sg1.RowCount-1 do
  begin
     XFlag:=0;
   if  sg1.Cells[0,i]<>'' then
   begin
    //1.判断部门：
   ssql:=' select rkey  from Datadepartment where departmentName='''+trim(sg1.Cells[1,i])+''' ';
   common.OpenQuery(dm.qry_temp,ssql);
    if  (not dm.qry_temp.IsEmpty)  then
    begin
    DeptID:=dm.qry_temp.fieldbyname('rkey').asstring;
    sg1.Cells[7,i]:=DeptID;
    end
    else
    begin
    sg1.Cells[4,i]:='X';
    sg1.Cells[5,i]:=sg1.Cells[5,i]+'部门名称不存在!';
    XFlag:=1;
    end;


   //3.课程编号或者课程名称 
   ssql:=' select rkey from trainclass where  ccode='''+trim(sg1.Cells[2,i])+''' and cName='''+trim(sg1.Cells[3,i])+'''  ';
   common.OpenQuery(dm.qry_temp,ssql);
    if  ( dm.qry_temp.IsEmpty)  then
   begin
    sg1.Cells[4,i]:='X';
    sg1.Cells[5,i]:=sg1.Cells[5,i]+'课程编号或者课程名称不对!';
    XFlag:=1;
   end
   else
   begin
   tc_ptr:= dm.qry_temp.fieldbyname('rkey').asstring;
   sg1.Cells[8,i]:=tc_ptr;
   end;


   //判断培训类型
   ssql:=' select rkey from datadetail where  item=''普通'' and dictid=20 ';
   common.OpenQuery(dm.qry_temp,ssql);
    if  ( dm.qry_temp.IsEmpty)  then
   begin
    sg1.Cells[4,i]:='X';
    sg1.Cells[5,i]:=sg1.Cells[5,i]+'培训类型不存在!';
    XFlag:=1;
   end
   else
   begin
   TType:= dm.qry_temp.fieldbyname('rkey').asstring;
   sg1.Cells[9,i]:=TTYpe;
   end;

  // 判断月份：
//   longdateformat:='yyyy-MM';
//    application.UpdateFormatSettings := false;
//   if not TryStrTodate(sg1.cells[0,i],fdate)  then
//   begin
//    sg1.Cells[6,i]:='X';
//    sg1.Cells[7,i]:=sg1.Cells[7,i]+'月份格式不对! eg:2017-01';
//    XFlag:=1;
//   end;

   ssql:=' select rkey  '+
   ' from trainplan '+
   ' where  Deptid='+(DeptID)+'   and tc_ptr ='+(tc_ptr)+' and pmonth='''+trim(sg1.Cells[0,i])+''' ';
   common.OpenQuery(dm.qry_temp,ssql);
    //showmessage(ssql);
   if  (not dm.qry_temp.IsEmpty)  then
   begin
    sg1.Cells[4,i]:='X';
    sg1.Cells[5,i]:=sg1.Cells[5,i]+'月份、部门和课程重复!';
    XFlag:=1;
   end;



    if Xflag=0  then
     sg1.Cells[4,i]:='V'
    else
    begin
     Eflag:=1;
     //sg1.Rows[i].font.Color:=clRed;
    end;

    end;
   end;

  ISchecked:=1
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 ISchecked:=0;
 exit;
 end;
 end;

end;

procedure TfrmImport3.btn_exportErrClick(Sender: TObject);
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


   if sg1.Cells[4,i]='X' then
   Sheet.cells[i+1,j+1]:=sg1.Cells[j,i];

  end;

   XlApp.Visible := True;

end;

procedure TfrmImport3.btn_importClick(Sender: TObject);
var
i ,j, atype,EmpID,Vcount,Xcount,Xcount2,s: integer;
ssql,ssql2 ,YM,memo,THours: string;
//EmployeeId,Deptid, PostID,tc_ptr,MRkey,TType:string;
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

 try
   dm.con.BeginTrans;
    if (Eflag=1) and  (MessageDlg('有错误数据需要继续导入正确的数据吗',mtInformation,[mbOK,mbCancel],0)= mrcancel) then exit
    else
    begin
       for i:=1 to  sg1.Rowcount-1 do
       begin
       if sg1.Cells[4,i]='V' then
        begin

        ssql:=' select rkey from trainPlan where pmonth='''+sg1.Cells[0,i]+''' and tc_ptr='+sg1.Cells[8,i]+' and DeptID='+sg1.Cells[7,i]+' ';
        //ShowMessage(ssql);
        dm.OpenQry(qrytemp,ssql);

        if not qrytemp.IsEmpty then
        begin
//         ssql:='update trainPlan  set BDate='''+sg1.Cells[5,i]+''',EDate='''+sg1.Cells[6,i]+''',ttype='+ttype+',remark='''+sg1.Cells[7,i]+''' '+
//          ' where employeeID='+employeeid+' and tc_ptr='+tc_ptr+' and DeptID='+Deptid+' and PostID='+Postid+'';
//         dm.execsql(qrytemp,ssql) ;
        End
        else
        begin
        ssql:='insert into trainPlan(Pmonth,tc_ptr,DeptID, TType) values( ' +
           ' '''+sg1.Cells[0,i]+''','+sg1.Cells[8,i]+','+sg1.Cells[7,i]+','+sg1.Cells[9,i]+') ';
          // showmessage(ssql);
        dm.execsql(qrytemp,ssql) ;
        end;
       end;
      end;
    end;
  dm.con.CommitTrans;
  showmessage('导入成功!');
    frmMain.btn_refresh3Click(sender);
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 dm.con.RollbackTrans;
 exit;
 end;
 end;

 frmMain.btn_refreshClick(sender);

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
    if sg1.cells[4,i]='V'  then
    begin
     Vcount:=Vcount+1;
     sg1.Rows[i].Clear;
    end;
      if sg1.cells[4,i]='X'  then
      Xcount:=Xcount+1;
    end;
    
      Xcount2:=0;
    //非空行上移：
    for i:=1 to sg1.RowCount-1 do
    begin
     if sg1.cells[0,i]='' then
     for j:=1 to sg1.RowCount-1 do
     begin
      if  (sg1.cells[4,j]='X') and  (Xcount2<=Xcount)  then
       begin
        Xcount2:=Xcount2+1;
        sg1.Rows[i].Text:=sg1.Rows[j].Text;
        sg1.Rows[j].Clear;
         exit;
       end;
     end;
    end;
   // sg1.RowCount:=Xcount+1;

 end;

end;

end.
