unit UImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids,OleServer, Excel2000,ComObj;

type
  TFrmImport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_ExModel: TButton;
    btn_exit: TButton;
    btn_OpenFile: TButton;
    btn_check: TButton;
    btn_import: TButton;
    sg1: TStringGrid;
    OpenDialog1: TOpenDialog;
    btn_exportErr: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn_OpenFileClick(Sender: TObject);
    procedure btn_checkClick(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure btn_ExModelClick(Sender: TObject);
    procedure btn_exportErrClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
  private
    { Private declarations }
    ISchecked: integer;
    Eflag: Integer;
  public
    { Public declarations }
  end;

var
  FrmImport: TFrmImport;

implementation
         uses common, udm, UMain;
{$R *.dfm}

procedure TFrmImport.FormShow(Sender: TObject);
begin
//
sg1.ColCount:=6;
 sg1.RowCount:=1 ;
 sg1.Cells[0,0]:='工号';
 sg1.Cells[1,0]:='姓名';
 sg1.Cells[2,0]:='年月';
 sg1.Cells[3,0]:='类型';
 sg1.Cells[4,0]:='天数';
 sg1.Cells[5,0]:='备注';

  sg1.ColWidths[0]:=50;
  sg1.ColWidths[1]:=100;
  sg1.ColWidths[2]:=100;
  sg1.ColWidths[3]:=100;
  sg1.ColWidths[4]:=50;
  sg1.ColWidths[5]:=150;




end;

procedure TFrmImport.btn_OpenFileClick(Sender: TObject);
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

procedure TFrmImport.btn_checkClick(Sender: TObject);
var
  i,j,k ,flag,XFlag:Integer;
  ssql,s:string;
begin
//
 ISchecked:=0;
 Eflag:=0; 
 XFlag:=0;
 sg1.ColCount:=sg1.ColCount+2;
 sg1.Cells[6,0]:='是否OK';
 sg1.Cells[7,0]:='原因';
 sg1.ColWidths[6]:=40;
 sg1.ColWidths[7]:=800;
 try
  for i:=1  to sg1.RowCount-1 do
  begin
   if  sg1.Cells[0,i]<>'' then
   begin 
    //判断工号和姓名能否对上或在系统里能不能找到
   ssql:=' select employeecode from employeemsg where employeecode='''+trim(sg1.Cells[0,i])+'''  and chineseName='''+trim(sg1.Cells[1,i])+'''   ';
   dm.OpenQry(DM.qry_temp,ssql);
   if  (dm.qry_temp.IsEmpty) or (sg1.Cells[0,i]='') or (sg1.Cells[1,i]='') then
   begin
    sg1.Cells[6,i]:='X';
    sg1.Cells[7,i]:=sg1.Cells[7,i]+'工号和姓名不匹配!';
    XFlag:=1;
   end;


   //判断年月格式是否正确：
     flag:=0;
   if  (Length(Trim(sg1.Cells[2,i]))<>7) or (Trim(sg1.Cells[2,i])='') then
   begin
    flag:=1;
   // XFlag:=1;
   end;
  // k:=Length(Trim(sg1.Cells[2,i]))-2;
   // s:=copy(Trim(sg1.Cells[2,i]),Length(Trim(sg1.Cells[2,i]))-2,2);
   k:= StrToInt(copy(Trim(sg1.Cells[2,i]),Length(Trim(sg1.Cells[2,i]))-1,2));
    if  (k>12) then
     flag:=1;


   if flag=1 then
   begin
    sg1.Cells[6,i]:='X';
    sg1.Cells[7,i]:=sg1.Cells[7,i]+' 年月格式有误!';
    XFlag:=1;
   end;
   ////////////
  //判断类型
  if ((sg1.Cells[3,i]<>'周末') and (sg1.Cells[3,i]<>'节假')) or (sg1.Cells[3,i]='')   then
  begin
     sg1.Cells[6,i]:='X';
    sg1.Cells[7,i]:=sg1.Cells[7,i]+' 类型有误!';
    XFlag:=1;
  end;

  if Xflag=0  then
   sg1.Cells[6,i]:='V'
  else
  begin
   Eflag:=1;
   //sg1.Rows[i].font.Color:=clRed;
  end; 
 // 天数必须为数字：
//     if sg1.Cells[4,i]=''  then
//  begin
//     sg1.Cells[6,i]:='X';
//    sg1.Cells[7,i]:=sg1.Cells[7,i]+'天数有误!';
//  end;

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

procedure TFrmImport.btn_importClick(Sender: TObject);
var
i ,j, atype,EmpID,Vcount,Xcount,Xcount2,s: integer;
ssql,ssql2, EmpCode,YM,memo,days: string;
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

    if (Eflag=1) and  (MessageDlg('有错误数据需要继续导入正确的数据吗',mtInformation,[mbOK,mbCancel],0)= mrcancel) then exit

    else
    begin
       for i:=1 to  sg1.Rowcount-1 do
       begin
       if sg1.Cells[6,i]='V' then
        begin
        EmpCode:=sg1.Cells[0,i];
        ssql:=' select rkey from employeemsg where employeecode='''+EmpCode+''' ';
        EmpID:=dm.GetOne('rkey',ssql,dm.qry_temp);
        YM:=sg1.Cells[2,i];
        if sg1.Cells[3,i]='周末' then
         atype:=0
        else
         atype:=1;
         if sg1.Cells[4,i]<>'' then
        days:=sg1.Cells[4,i]
        else
        days:='0';

        memo:=sg1.Cells[5,i];
    
        ssql2:='select rkey from  OverWorkApply where employeeid='+inttostr(EmpID)+' and YearMonth='''+ym+''' and atype='+inttostr(atype)+' ';
         dm.openqry(DM.qry_temp,ssql2);

         if DM.qry_temp.RecordCount>0 then
         ssql:= 'update  OverWorkApply  set  status=1 ,days='+days+',remark='''+memo+'''  where  employeeid='+inttostr(EmpID)+' and YearMonth='''+ym+''' and atype='+inttostr(atype)+' '
         else 
          ssql:=' insert into OverWorkApply(employeeid, YearMonth,AType,days,status,remark)'+
               'values('+inttostr(EmpID)+','''+ym+''','+inttostr(atype)+','+days+',1,'''+memo+'''  )';

        dm.execsql(DM.qry_temp,ssql);
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
   // sg1.RowCount:=Xcount+1;

 end;
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

 Sheet.Cells[1,1]:='工号';
 Sheet.Cells[1,2]:='姓名';
 Sheet.Cells[1,3]:='年月';
 Sheet.Cells[1,4]:='类型';
 Sheet.Cells[1,5]:='天数';
 Sheet.Cells[1,6]:='备注';

 Sheet.Cells[2,1]:='3001';
 Sheet.Cells[2,2]:='张三';
 Sheet.Cells[2,3]:='2015-11';
 Sheet.Cells[2,4]:='周末';
 Sheet.Cells[2,5]:='3.5';
 Sheet.Cells[2,6]:='测试';


   XlApp.Visible := True;
   
end;

procedure TFrmImport.btn_exportErrClick(Sender: TObject);
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

procedure TFrmImport.btn_exitClick(Sender: TObject);
begin
close;
end;

end.
