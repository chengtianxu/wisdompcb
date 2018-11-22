unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  ComObj,Excel2000,ClipBrd, DB, ADODB,DateUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    empl_name: TLabel;
    curr_code: TLabel;
    N2: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
     command_text:string;

   v_colwidth: array of integer;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
   sys_shortdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation

uses datamd, income_payment, term,common;

{$R *.dfm}

procedure Tform1.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
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
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  dm.aq129.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aq129.Filter:='';
 dm.AQ129.AfterOpen(dm.AQ129);
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-723)*v_colwidth[i]/700);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.aq129.CommandText);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if dm.AQ129.IndexFieldNames<>column.FieldName then
 dm.AQ129.IndexFieldNames:=column.FieldName;
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.Aq129rkey.Value;
 dm.Aq129.Close;
 dm.Aq129.Open;
 if rkey>0 then dm.Aq129.Locate('rkey',rkey,[]);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要取消这条记录吗?该操作将不可逆!',mtConfirmation,[mbyes,mbno],0)=mryes then
begin

if strtoint(user_ptr)<>dm.AQ129EMPL_PTR.Value then
 begin
  messagedlg('取消操作必须输入人员才能进行!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.AQ129rkey105.Value;
 dm.ado105.Open;
 if (not dm.ADO105.IsEmpty) and (dm.ado105STATUS.Value>0) then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法取消!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

 dm.ADO129.Close;
 dm.ADO129.Parameters[0].Value:=dm.AQ129rkey.Value;
 dm.ADO129.Open;

 if dm.ADO129STATUS.Value=dm.AQ129status.Value then
 begin
  dm.ACt.BeginTrans;
  try

   dm.ADO129.Edit;
   dm.ADO129STATUS.Value:=3;
   dm.ADO129.Post;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0128');
     sql.Add('set bal_amount=bal_amount+data0129.AMOUNT');
     sql.Add('from data0129 inner join data0128');
     sql.Add('on data0129.bank_ptr=data0128.rkey');
     sql.Add('where data0129.rkey='+dm.aq129rkey.AsString);
     ExecSQL;
    end;

   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('delete data0521');
    sql.Add('where ttype=0 and SRCE_PTR='+dm.aq129RKEY.AsString);
    ExecSQL;
   end;

   if not dm.ado105.isempty then
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;
     dm.ado105.Post;
    end;

    dm.ACt.CommitTrans;
    showmessage('取消操作成功');
    dm.AQ129.Close;
    dm.AQ129.Open;
    dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
    dm.ADO129.Close;
    dm.ADO105.Close;
   except
    dm.ACt.RollbackTrans;
    showmessage('取消操作不成功,请与管理员联系');
   end;
 end
 else
  messagedlg('取消操作不成功,支票状态发生变发,可能有人已经取消',mterror,[mbcancel],0);
end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ129.IsEmpty then
 begin
  n2.Enabled:=false;
  n4.enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
 end
else
 begin
  n5.Enabled:=true;
  if dm.AQ129STATUS.Value=3 then
   begin
    n2.Enabled:=false;
    n4.enabled:=false;    
    n6.Enabled:=false;
   end
  else
   begin
    n2.Enabled:=true;
    n4.enabled:=true;
    n6.Enabled:=true;
   end;
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
form2.dtpk1.Date:=self.sys_shortdate;
form2.CheckBox1.Visible:=true;
if form2.ShowModal=mrok then
 begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ado129.close;
  dm.ADO521.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.AQ129rkey105.Value;
 dm.ado105.Open;
 if (not dm.ADO105.IsEmpty) and (dm.ado105STATUS.Value > 0) then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
  end
 else
try
form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.AQ129CHECK_NUMBER.Value;

   edit2.Text:=dm.AQ129BANK_NAME.Value;
   edit7.Text:=floattostr(dm.AQ129bal_amount.Value+dm.AQ129AMOUNT.Value);
   dtpk1.Date:=dm.AQ129TDATE.Value;

   edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
   label9.Caption:=dm.AQ129WAREHOUSE_NAME.Value;
   edit4.Text:=dm.aq129empl_code.Value;
   label10.Caption:=dm.AQ129DSDesigner.Value;
   edit5.Text:=dm.AQ129CURR_CODE.Value;
   label11.Caption:=dm.AQ129CURR_NAME.Value;
   edit6.Text:=dm.AQ129EX_RATE.AsString;
   edit8.Text:=dm.AQ129AMOUNT.AsString;

   edit15.Text:=dm.AQ129REMARK.Value;
   label12.caption:='1';//编辑
   bitbtn2.Enabled:=false;
  end;
 if form2.ShowModal=mrok then
  begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ADO129.Close;
  dm.ADO521.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
  end;
finally
 form2.Free;
end;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
try
form2:=tform2.Create(application);
 with form2 do
  begin
   edit1.Text:=dm.AQ129CHECK_NUMBER.Value;
   edit2.Text:=dm.AQ129BANK_NAME.Value;
   edit7.Text:=dm.AQ129bal_amount.AsString;
   dtpk1.Date:=dm.AQ129TDATE.Value;
   edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
   label9.Caption:=dm.AQ129WAREHOUSE_NAME.Value;
   edit4.Text:=dm.aq129empl_code.Value;
   label10.Caption:=dm.AQ129DSDesigner.Value;
   edit5.Text:=dm.AQ129CURR_CODE.Value;
   label11.Caption:=dm.AQ129CURR_NAME.Value;
   edit6.Text:=dm.AQ129EX_RATE.AsString;
   edit8.Text:=dm.AQ129AMOUNT.AsString;

   edit15.Text:=dm.AQ129REMARK.Value;
   label12.caption:='2';//检查
   bitbtn1.enabled:=false;
   bitbtn2.Enabled:=false;
   bitbtn3.Enabled:=false;
   bitbtn5.Enabled:=false;
   edit1.Enabled:=false;
   dtpk1.Enabled:=false;
   edit15.Enabled:=false;
   stgd1.Options:=stgd1.Options-[goediting];
   stgd1.popupmenu:=nil;
   toolbar1.Enabled:=false;
   sgrid1.Enabled:=false;
   edit_date.Enabled:=false;
   updown1.Enabled:=false;
   edit_attached.ReadOnly:=true;
   edit6.Enabled:=false;
  end;

form2.ShowModal;

finally
 form2.Free;
end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var
 i:byte;
begin
form_condition:=tform_condition.Create(application);
form_condition.dtpk1.Date:=dm.aq129.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.aq129.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin
  dm.aq129.Close;
  dm.aq129.CommandText:=self.command_text;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.aq129.CommandText:=dm.aq129.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  dm.aq129.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.aq129.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.AQ129.Prepared;
  dm.aq129.Open;
 end;
form_condition.Free;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.AQ129status.value=3 then
  DBGrid1.Canvas.Font.Color := clRed;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not App_init_2(dm.ACt) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:= application.Title;

//user_ptr:='1';
//vprev:='4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
if  dm.act.Connected then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select employee_name from data0005'+#13+
               'where rkey='+user_ptr;
    open;
    self.empl_name.Caption:=fieldbyname('employee_name').AsString;
   end;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select curr_code from data0001 where rkey=1');
   open;
   self.curr_code.Caption:=fieldvalues['curr_code'];
  end;

   with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_shortdate:=strtodate(datetostr(fieldvalues['v_dt']));
   end;

  dm.Aq129.Close;
  dm.Aq129.Parameters[0].Value:=sys_shortdate-dayof(sys_shortdate)+1;
  dm.Aq129.Parameters[1].Value:=sys_shortdate;
  dm.AQ129.Prepared;
  dm.Aq129.Open;
  self.command_text:=dm.AQ129.CommandText;
 setlength(v_colwidth,dbgrid1.fieldcount);
 for i:=low(v_colwidth) to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
 field_name:='CHECK_NUMBER';     //设备过滤字段
 end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    try
    form2:=tform2.Create(application);
     with form2 do
      begin
       edit1.Text:=dm.AQ129CHECK_NUMBER.Value;

       edit2.Text:=dm.AQ129BANK_NAME.Value;
       edit7.Text:=floattostr(dm.AQ129bal_amount.Value+dm.AQ129AMOUNT.Value);
       dtpk1.Date:=sys_shortdate;
       CheckBox1.Visible:=true;
       edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
       label9.Caption:=dm.AQ129WAREHOUSE_NAME.Value;
       edit4.Text:=dm.aq129empl_code.Value;
       label10.Caption:=dm.AQ129DSDesigner.Value;
       edit5.Text:=dm.AQ129CURR_CODE.Value;
       label11.Caption:=dm.AQ129CURR_NAME.Value;
       edit6.Text:=dm.AQ129EX_RATE.AsString;
       edit8.Text:=dm.AQ129AMOUNT.AsString;
       edit15.Text:=dm.AQ129REMARK.Value;
       label12.caption:='3';//复制
       bitbtn2.Enabled:=true;
      end;
     if form2.ShowModal=mrok then
      begin
      dm.AQ129.Close;
      dm.AQ129.Open;
      dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
      dm.ADO129.Close;
      dm.ADO521.Close;
      dm.ADO105.Close;
      dm.ADO106.Close;
      end;
    finally
     form2.Free;
    end;
  end;
end;

end.
