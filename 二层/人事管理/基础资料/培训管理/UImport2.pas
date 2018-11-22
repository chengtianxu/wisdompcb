unit UImport2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,OleServer, Excel2000,ComObj, DB, ADODB;

type
  TfrmImport2 = class(TForm)
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
  frmImport2: TfrmImport2;

implementation
          uses common, UDM, UMain;
{$R *.dfm}

procedure TfrmImport2.btn_ExModelClick(Sender: TObject);
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

  Sheet.Cells[1,1]:='部门名称';
  Sheet.Cells[1,2]:='职各名称';
  Sheet.Cells[1,3]:='课程编号';
  Sheet.Cells[1,4]:='课程名称';
  Sheet.Cells[1,5]:='课程类别';



   XlApp.Visible := True;


end;

procedure TfrmImport2.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmImport2.btn_OpenFileClick(Sender: TObject);
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

procedure TfrmImport2.FormShow(Sender: TObject);
begin
  sg1.ColCount:=6;
  sg1.RowCount:=1 ;

  sg1.Cells[0,0]:='部门名称';
  sg1.Cells[1,0]:='职务名称';
  sg1.Cells[2,0]:='课程编号';
  sg1.Cells[3,0]:='课程名称';
  sg1.Cells[4,0]:='课程名称';
  sg1.Cells[5,0]:='是否OK';
  sg1.Cells[6,0]:='原因';

  sg1.ColWidths[0]:=120;
  sg1.ColWidths[1]:=100;
  sg1.ColWidths[2]:=100;
  sg1.ColWidths[3]:=120;
  sg1.ColWidths[4]:=80;
  sg1.ColWidths[5]:=200;
end;

procedure TfrmImport2.btn_checkClick(Sender: TObject);
var
  i,j,k ,flag,XFlag,DeptID,PostID,tc_ptr,CTypeID:Integer;
  ssql,s:string;
begin
 ISchecked:=0;
 Eflag:=0;

 try
  for i:=1  to sg1.RowCount-1 do
  begin
    XFlag:=0;
  if  sg1.Cells[0,i]<>'' then
   begin
    //1.判断部门和岗位是否重复：
   ssql:=' select rkey from datadepartment where departmentName='''+trim(sg1.Cells[0,i])+'''   ';
   common.OpenQuery(dm.qry_temp,ssql);
    if  (not dm.qry_temp.IsEmpty)  then
    Deptid:=dm.qry_temp.fieldbyname('rkey').AsInteger
    else
    begin
    sg1.Cells[4,i]:='X';
    sg1.Cells[5,i]:=sg1.Cells[5,i]+'部门名称不对!';
    XFlag:=1;
    end;

   ssql:=' select rkey from datadetail where dictid=1 and item='''+trim(sg1.Cells[1,i])+'''   ';
   common.OpenQuery(dm.qry_temp,ssql);
    if  (not dm.qry_temp.IsEmpty)  then
    PostID:=dm.qry_temp.fieldbyname('rkey').AsInteger
    else
    begin
    sg1.Cells[5,i]:='X';
    sg1.Cells[6,i]:=sg1.Cells[6,i]+'职务名称不对!';
    XFlag:=1;
    end;

    if trim(sg1.Cells[4,i])='入职培训' then
     CTypeID:=0
    else if trim(sg1.Cells[4,i])='岗前培训' then
     CTypeID:=1
    else if trim(sg1.Cells[4,i])='在岗培训' then
     CTypeID:=2
    else
    begin
    sg1.Cells[5,i]:='X';
    sg1.Cells[6,i]:=sg1.Cells[6,i]+'课程类别不对!';
    XFlag:=1;
    end;


   ssql:=' select rkey from trainclass where  ccode='''+trim(sg1.Cells[2,i])+''' and cName='''+trim(sg1.Cells[3,i])+'''  ';
   common.OpenQuery(dm.qry_temp,ssql);
    if  ( dm.qry_temp.IsEmpty)  then
   begin
    sg1.Cells[5,i]:='X';
    sg1.Cells[6,i]:=sg1.Cells[6,i]+'课程编号或者课程名称不对!';
    XFlag:=1;
   end
   else tc_ptr:= dm.qry_temp.fieldbyname('rkey').AsInteger;

   ssql:=' select a.rkey  '+
   ' from DeptPostTrainClass_main a '+
   ' inner join  DeptPostTrainClass_detail b on a.rkey=b.m_ptr '+
   ' where  a.Deptid='+inttostr(DeptID)+' and a.PostID='+inttostr(PostID)+' and a.CType='+inttostr(ctypeID)+' and b.tc_ptr ='+inttostr(tc_ptr)+' ';
   common.OpenQuery(dm.qry_temp,ssql);
   if  (not dm.qry_temp.IsEmpty)  then
   begin
    sg1.Cells[5,i]:='X';
    sg1.Cells[6,i]:=sg1.Cells[6,i]+'部门、职务、课程类别和课程重复!';
    XFlag:=1;
   end;


    if Xflag=0  then
     sg1.Cells[5,i]:='V'
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
 ISchecked:=0;
 exit;
 end;
 end;

end;

procedure TfrmImport2.btn_exportErrClick(Sender: TObject);
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

procedure TfrmImport2.btn_importClick(Sender: TObject);
var
i ,j, atype,EmpID,Vcount,Xcount,Xcount2,s: integer;
ssql,ssql2 ,YM,memo,THours: string;
Deptid, PostID,tc_ptr,CTypeID,MRkey:string;
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
       if sg1.Cells[5,i]='V' then
        begin
        ssql:=' select rkey from DataDepartment where departmentname='''+sg1.Cells[0,i]+''' ';
        DeptID:=IntToStr(dm.GetOne('rkey',ssql,dm.qry_temp));

        ssql:=' select rkey from DataDetail where dictid=1 and item='''+sg1.Cells[1,i]+''' ';
        PostID:=IntToStr(dm.GetOne('rkey',ssql,dm.qry_temp));

        ssql:=' select rkey from trainclass where ccode='''+sg1.Cells[2,i]+''' ';
        tc_ptr:=IntToStr(dm.GetOne('rkey',ssql,dm.qry_temp));

          if trim(sg1.Cells[4,i])='入职培训' then
           CTypeID:='0'
          else if trim(sg1.Cells[4,i])='岗前培训' then
           CTypeID:='1'
          else if trim(sg1.Cells[4,i])='在岗培训' then
           CTypeID:='2';
           
         //插入DeptPostTrainClass_main主表：

         ssql:=' select rkey  from  DeptPostTrainClass_main'+
               ' where deptid='+DeptID+' and postid='+PostID+' and ctype='+ctypeid+'';
        dm.OpenQry(qrytemp,ssql) ;
        if  qrytemp.IsEmpty then
        begin
        ssql:=' insert into DeptPostTrainClass_main(DeptID,PostID,ctype)'+
               'values('+DeptID+','+PostID+','+ctypeid+')';
        dm.execsql(qrytemp,ssql) ;
         ssql:=' select rkey  from  DeptPostTrainClass_main'+
               ' where deptid='+DeptID+' and postid='+PostID+' and ctype='+ctypeid+' ';
        dm.OpenQry(qrytemp,ssql) ;
        MRkey:=qrytemp.fieldbyname('rkey').AsString;
        end
        else
        MRkey:=qrytemp.fieldbyname('rkey').AsString;

        ssql:=' select rkey  from  DeptPostTrainClass_Detail'+
               ' where M_ptr='+Mrkey+' and tc_ptr='+tc_ptr+' ';
        dm.OpenQry(qrytemp,ssql) ;
        //插入DeptPostTrainClass_detail表：
        if qrytemp.IsEmpty then
        begin
        ssql:=' insert into DeptPostTrainClass_detail(M_ptr,tc_ptr)'+
               'values('+Mrkey+','+tc_ptr+')';
        dm.execsql(qrytemp,ssql) ;
        end;
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
