unit UImport22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, ExtCtrls,OleServer, Excel2000,ComObj;

type
  TfrmImport22 = class(TForm)
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
    procedure btn_ExModelClick(Sender: TObject);
    procedure btn_exportErrClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure btn_OpenFileClick(Sender: TObject);
    procedure btn_checkClick(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ISchecked: integer;
    Eflag: Integer;
  public
    { Public declarations }
  end;

var
  frmImport22: TfrmImport22;

implementation

uses UDM, UMain,common;

{$R *.dfm}

procedure TfrmImport22.btn_ExModelClick(Sender: TObject);
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
  Sheet.Cells[1,2]:='题目类型';
  Sheet.Cells[1,3]:='单题分数';
  Sheet.Cells[1,4]:='单题分数';
  Sheet.Cells[1,5]:='题号';
  Sheet.Cells[1,6]:='A答案';
  Sheet.Cells[1,7]:='B答案';
  Sheet.Cells[1,8]:='C答案';
  Sheet.Cells[1,9]:='D答案';
  Sheet.Cells[1,10]:='正确答案';


   XlApp.Visible := True;
end;

procedure TfrmImport22.btn_exportErrClick(Sender: TObject);
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
   if sg1.Cells[10,i]='X' then
   Sheet.cells[i+1,j+1]:=sg1.Cells[j,i];
  end;

   XlApp.Visible := True;
end;

procedure TfrmImport22.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmImport22.btn_OpenFileClick(Sender: TObject);
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

procedure TfrmImport22.btn_checkClick(Sender: TObject);
var
  i,j,k ,flag,XFlag ,tc_ptr,CTypeID:Integer;
  ssql,s:string;
  checkfloat:Double;
begin
 ISchecked:=0;
 Eflag:=0;

 try
  for i:=1  to sg1.RowCount-1 do
  begin
    XFlag:=0;
  if  sg1.Cells[0,i]<>'' then
   begin
    //1.判断课程是否存在
   Ssql:=' select rkey from trainclass  where ccode='''+trim(sg1.Cells[0,i])+'''   ';
   common.OpenQuery(dm.qry_temp,ssql);
    if  not ( dm.qry_temp.IsEmpty)  then
    sg1.Cells[12,i]:=dm.qry_temp.fieldbyname('rkey').AsString
    else
    begin
    sg1.Cells[10,i]:='X';
    sg1.Cells[11,i]:=sg1.Cells[11,i]+'课程编号不对!';
    XFlag:=1;
    end;

   //题目类型
   if (sg1.Cells[1,i]<>'选择') and  (sg1.Cells[1,i]<>'判断') then
   begin
    sg1.Cells[10,i]:='X';
    sg1.Cells[11,i]:=sg1.Cells[11,i]+'题目类型不对!';
    XFlag:=1;
   end;

   //单题分数：
    if not TryStrToFloat(Trim(sg1.cells[2,i]),checkfloat) then     
    begin
    sg1.Cells[10,i]:='X';
    sg1.Cells[11,i]:=sg1.Cells[11,i-1] + ' 培训费用有误 ';
    XFlag:=1;
    end;

    if Xflag=0  then
     sg1.Cells[10,i]:='V'
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

procedure TfrmImport22.btn_importClick(Sender: TObject);
var
i ,j, atype,EmpID,Vcount,Xcount,Xcount2,s: integer;
ssql,ssql2 ,YM,memo,THours: string;
 PTypeID,MRkey:string;
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
     dm.con.BeginTrans;
      if (Eflag=1) and  (MessageDlg('有错误数据需要继续导入正确的数据吗',mtInformation,[mbOK,mbCancel],0)= mrcancel) then exit
      else
      begin
      for i:=1 to  sg1.Rowcount-1 do
      begin
       if sg1.Cells[10,i]='V' then
       begin
        if trim(sg1.Cells[1,i])='判断' then
         PTypeID:='0'
        else if trim(sg1.Cells[1,i])='选择' then
         PTypeID:='1' ;

           //插入DeptPostTrainClass_main主表：
           ssql:=' select rkey  from  paperMain '+
                 ' where tc_ptr='+sg1.Cells[12,i]+'  ';
          dm.OpenQry(qrytemp,ssql) ;
          if  qrytemp.IsEmpty then
          begin
            ssql:=' insert into paperMain(tc_ptr,AScore)'+
                   'values('+sg1.Cells[12,i]+', 100)';
            dm.execsql(qrytemp,ssql) ;
             ssql:=' select rkey  from  paperMain'+
                   ' where tc_ptr='+sg1.Cells[12,i]+' ';
            dm.OpenQry(qrytemp,ssql) ;
            MRkey:=qrytemp.fieldbyname('rkey').AsString;
          end
          else
          begin
          MRkey:=qrytemp.fieldbyname('rkey').AsString;
          //ssql:='update paperMain set tc_ptr='+sg1.Cells[12,i]+' where  tc_ptr='+sg1.Cells[12,i]+' '
          end;

          ssql:=' select rkey  from  paperDetail'+
                 ' where M_ptr='+Mrkey+' and PNo='+sg1.Cells[2,i]+' ';
          dm.OpenQry(qrytemp,ssql) ;
          //插入DeptPostTrainClass_detail表：
          if qrytemp.IsEmpty then
          begin
          ssql:=' insert into paperDetail(M_ptr,PType,PNo,PContent,A,B,C,D,PRight,Ascore)'+
                 'values('+MRkey+','+PTypeID+','+sg1.Cells[2,i]+','''+sg1.Cells[4,i]+''','''+sg1.Cells[5,i]+''','''+sg1.Cells[6,i]+''','''+sg1.Cells[7,i]+''', '+
                 ''''+sg1.Cells[8,i]+''','''+sg1.Cells[9,i]+''','+sg1.Cells[3,i]+'  )';
          dm.execsql(qrytemp,ssql) ;
          end
          else
          begin
            ssql:='update paperDetail set PType='+PTypeID+' ,PContent='''+sg1.Cells[4,i]+''', A='''+sg1.Cells[5,i]+''',B='''+sg1.Cells[6,i]+''','+
                'C='''+sg1.Cells[7,i]+''',D='''+sg1.Cells[8,i]+''',PRight='''+sg1.Cells[9,i]+''',Ascore='+sg1.Cells[3,i]+' where M_ptr='+MRkey+' and PNo='+sg1.Cells[2,i]+'';
           dm.execsql(qrytemp,ssql) ;
          end;
       end;
      end;

    dm.con.CommitTrans;
    showmessage('导入成功!');
  end;
  
  except on e:exception do
  begin
  ShowMessage('错误：'+e.Message+ssql);
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
 end;
end;

procedure TfrmImport22.FormShow(Sender: TObject);
begin
  sg1.ColCount:=13;
  sg1.RowCount:=1 ;

  sg1.Cells[0,0]:='课程编号';
  sg1.Cells[1,0]:='题目类型';
  sg1.Cells[2,0]:='题号';
  sg1.Cells[3,0]:='单题分数';
  sg1.Cells[4,0]:='题目内容';
  sg1.Cells[5,0]:='A答案';
  sg1.Cells[6,0]:='B答案';
  sg1.Cells[7,0]:='C答案';
  sg1.Cells[8,0]:='D答案';
  sg1.Cells[9,0]:='正确答案';
  sg1.Cells[10,0]:='是否OK';
  sg1.Cells[11,0]:='错误说明';
  sg1.Cells[12,0]:='tc_ptr';

  sg1.ColWidths[0]:=100;
  sg1.ColWidths[1]:=100;
  sg1.ColWidths[2]:=100;
  sg1.ColWidths[3]:=100;
  sg1.ColWidths[4]:=200;
  sg1.ColWidths[5]:=120;
  sg1.ColWidths[6]:=120;
  sg1.ColWidths[7]:=120;
  sg1.ColWidths[8]:=120;
  sg1.ColWidths[9]:=120;
  sg1.ColWidths[10]:=50;
  sg1.ColWidths[11]:=200;
  sg1.ColWidths[12]:=-1;

end;

end.
