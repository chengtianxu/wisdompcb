unit UImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,OleServer, Excel2000,ComObj;

type
  TfrmImport = class(TForm)
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
  frmImport: TfrmImport;

implementation
          uses common, UDM, UMain;
{$R *.dfm}

procedure TfrmImport.btn_ExModelClick(Sender: TObject);
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

  Sheet.Cells[1,1]:='课程编号';
  Sheet.Cells[1,2]:='课程名称';
//  Sheet.Cells[1,3]:='课程类型';
//  Sheet.Cells[1,4]:='课程类别';
//  Sheet.Cells[1,5]:='培训方式';
//  Sheet.Cells[1,6]:='考核方式';
//  Sheet.Cells[1,7]:='培训时长';


   XlApp.Visible := True;
end;

procedure TfrmImport.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmImport.btn_OpenFileClick(Sender: TObject);
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

procedure TfrmImport.FormShow(Sender: TObject);
begin
  sg1.ColCount:=9;
  sg1.RowCount:=1 ;
  sg1.Cells[0,0]:='课程编号';
  sg1.Cells[1,0]:='课程名称';
//  sg1.Cells[2,0]:='课程类型';
//  sg1.Cells[3,0]:='课程类别';
//  sg1.Cells[4,0]:='培训方式';
//  sg1.Cells[5,0]:='考核方式';
//  sg1.Cells[6,0]:='培训时长';
  sg1.Cells[2,0]:='是否OK';
  sg1.Cells[3,0]:='原因';

  sg1.ColWidths[0]:=50;
  sg1.ColWidths[1]:=100;
  sg1.ColWidths[2]:=80;
  sg1.ColWidths[3]:=200;
//  sg1.ColWidths[4]:=80;
//  sg1.ColWidths[5]:=80;
//  sg1.ColWidths[6]:=80;
//  sg1.ColWidths[7]:=80;
//  sg1.ColWidths[8]:=200;



end;

procedure TfrmImport.btn_checkClick(Sender: TObject);
var
  i,j,k ,flag,XFlag:Integer;
  ssql,s:string;
begin
//
 ISchecked:=0;
 Eflag:=0;


 try
  for i:=1  to sg1.RowCount-1 do
  begin
   XFlag:=0;
   if  sg1.Cells[0,i]<>'' then
   begin


   if (sg1.Cells[0,i]='') then
   begin
    sg1.Cells[2,i]:='X';
    sg1.Cells[3,i]:=sg1.Cells[3,i]+'编号不能为空!';
    XFlag:=1;
   end;


    //判断课程类别
//    if ((sg1.Cells[2,i]<>'内训') and (sg1.Cells[2,i]<>'外训')) or (sg1.Cells[2,i]='')   then
//    begin
//       sg1.Cells[7,i]:='X';
//      sg1.Cells[8,i]:=sg1.Cells[8,i]+' 课程类别有误!';
//      XFlag:=1;
//    end;
//
   // 判断课程需求
//    ssql:='select rkey  from datadetail  where dictid=27 and item='''+trim(sg1.Cells[3,i])+''' ';
//    common.OpenQuery(dm.qry_temp,ssql);
//   if  (dm.qry_temp.IsEmpty)  then
//   begin
//    sg1.Cells[7,i]:='X';
//    sg1.Cells[8,i]:=sg1.Cells[8,i]+' 课程类别有误!';
//    XFlag:=1;
//   end;
// 
    //判断培训方式
//    if ((sg1.Cells[4,i]<>'课堂面授') and (sg1.Cells[4,i]<>'实操培训') and  (sg1.Cells[4,i]<>'在线培训'))   or (sg1.Cells[4,i]='')   then
//    begin
//       sg1.Cells[7,i]:='X';
//      sg1.Cells[8,i]:=sg1.Cells[8,i]+' 培训方式有误!';
//      XFlag:=1;
//    end;
//
    //判断考核方式
//    if ((sg1.Cells[5,i]<>'口试考核') and (sg1.Cells[5,i]<>'笔试考核') and  (sg1.Cells[5,i]<>'实操考核') and  (sg1.Cells[5,i]<>'在线考核')) or (sg1.Cells[5,i]='')   then
//    begin
//       sg1.Cells[7,i]:='X';
//      sg1.Cells[8,i]:=sg1.Cells[8,i]+' 考核方式有误!';
//      XFlag:=1;
//    end;

    if Xflag=0  then
     sg1.Cells[2,i]:='V'
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

procedure TfrmImport.btn_exportErrClick(Sender: TObject);
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


   if sg1.Cells[2,i]='X' then
   Sheet.cells[i+1,j+1]:=sg1.Cells[j,i];

  end;

   XlApp.Visible := True;

end;

procedure TfrmImport.btn_importClick(Sender: TObject);
var
i ,j, atype,EmpID,Vcount,Xcount,Xcount2,s: integer;
ssql,ssql2 ,YM,memo,THours: string;
Deptid, PostID:string;
CType, CType2,TType,EType:string;

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
       if sg1.Cells[2,i]='V' then
        begin

//        if sg1.Cells[2,i]='内训' then
//         CType:='0'
//        else
//         CType:='1';

//        ssql:='select rkey from datadetail  where dictid=27 and item='''+trim(sg1.Cells[3,i])+''' ' ;
//        dm.OpenQry(dm.qry_temp,ssql);
//        if not DM.qry_temp.IsEmpty then
//        ctype2:=DM.qry_temp.fieldbyname('rkey').asstring;

//        if sg1.Cells[4,i]='课程面授' then
//         TType:='0'
//        else   if sg1.Cells[4,i]='实操培训' then
//         TType:='1'
//        else
//         TType:='2';
//
//        if sg1.Cells[5,i]='口试考核' then
//         EType:='0'
//        else   if sg1.Cells[5,i]='笔试考核' then
//         EType:='1'
//        else   if sg1.Cells[5,i]='实操考核' then
//         EType:='2'
//        else
//         EType:='3' ;
//
//        if sg1.Cells[6,i]<>'' then
//        THours:=sg1.Cells[6,i]
//        else
//        THours:='0';

        ssql2:='select rkey from  TrainClass where   CCode= '''+sg1.Cells[0,i]+''' ';
         dm.openqry(DM.qry_temp,ssql2);

         if DM.qry_temp.RecordCount>0 then
         ssql:= 'update  TrainClass  set  CName='''+trim(sg1.Cells[1,i])+''' '+
               //' CType='+CType+',CType2='+CType2+', TType='+TType+', EType='+EType+',THours='+THours+' '+
               ' where CCode='''+sg1.Cells[0,i]+''''
         else
          ssql:=' insert into TrainClass(CCode, CName)'+   //,CType,CType2,TType,EType,THours
               'values('''+trim(sg1.Cells[0,i])+''','''+trim(sg1.Cells[1,i])+''')';  //,'+CType+','+CType2+','+TType+','+EType+','+THours+' 

        dm.execsql(DM.qry_temp,ssql);
        end;
      end;
      end;
   dm.con.CommitTrans;
  showmessage('导入成功!');
  frmMain.btn_refresh2Click(sender);

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 dm.con.RollbackTrans;
 exit;
 end;
 end;

   
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
    if sg1.cells[2,i]='V'  then
    begin
     Vcount:=Vcount+1;
     sg1.Rows[i].Clear;
    end;
      if sg1.cells[2,i]='X'  then
      Xcount:=Xcount+1;
    end;
    
      Xcount2:=0;
    //非空行上移：
    for i:=1 to sg1.RowCount-1 do
    begin
     if sg1.cells[0,i]='' then
     for j:=1 to sg1.RowCount-1 do
     begin
      if  (sg1.cells[2,j]='X') and  (Xcount2<=Xcount)  then
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
