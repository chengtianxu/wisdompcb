unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons,
  Menus, ComCtrls,ComObj,Excel2000,ClipBrd,DateUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    empl_name: TLabel;
    curr_code: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure CopyDbDataToExcel(Args:array of const);
  public
    { Public declarations }
   sys_shortdate:tdatetime; 
  end;

var
  Form1: TForm1;

implementation

uses damo, transfer,common;

{$R *.dfm}

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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.Aqd522rkey.Value;
 dm.Aqd522.Close;
 dm.Aqd522.Open;
 if rkey>0 then dm.Aqd522.Locate('rkey',rkey,[]);
end;


procedure TForm1.FormShow(Sender: TObject);
begin
if dm.ADOConnection1.Connected then
begin

  field_name:='REF_NUMBER';     //设备过滤字段

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
  dtpk1.Date:=sys_shortdate-dayof(sys_shortdate)+1;
  dtpk2.Date:=sys_shortdate;
  dm.aqd522.Close;
  dm.aqd522.Parameters.ParamValues['dtpk1']:=dtpk1.date;
  dm.Aqd522.Parameters.ParamValues['dtpk2']:=dtpk2.date;
  dm.aqd522.Prepared;
  dm.Aqd522.Open;
end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.Aqd522.CommandText);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
IF column.FieldName<>dm.aqd522.IndexFieldNames then
 dm.aqd522.IndexFieldNames:=column.FieldName;

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


procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  dm.aqd522.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aqd522.Filter:='';
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
  dm.aqd522.Close;
  dm.aqd522.Parameters.ParamValues['dtpk1']:=dtpk1.date;
  dm.Aqd522.Parameters.ParamValues['dtpk2']:=dtpk2.date;
  dm.aqd522.Prepared;
  dm.Aqd522.Open;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 form2:=Tform2.Create(application);
 dm.ADOsp04.Close;
 dm.ADOsp04.Open;
 if dm.ADOsp04SEED_FLAG.Value<>1 then
  form2.Edit1.Text:=dm.ADOsp04SEED_VALUE.Value;
 form2.dtpk1.Date:=self.sys_shortdate;
 if form2.ShowModal=mrok then
  begin
  dm.aqd522.Close;
  dm.aqd522.Open;
  dm.aqd522.Locate('rkey',dm.ADO522RKEY.Value,[]);
  dm.ADO522.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
  dm.ado129.Close;
  dm.ado114.Close;
  dm.ADO128.Close;
  dm.ADOsp04.Close;
  end;
finally
 form2.Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
 exit;
end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.aqd522rkey105.Value;
 dm.ado105.Open;
 if (not dm.ADO105.IsEmpty) and (dm.ado105STATUS.Value>0) then
  begin
   messagedlg('银行转帐生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

try
 form2:=Tform2.Create(application);
 with form2 do
 begin
  a_or_e.Caption:='1';//编辑
  edit1.Text:=dm.aqd522REF_NUMBER.Value;
  dtpk1.Date:=dm.aqd522TDATE.Value;
  edit12.Text:=dm.aqd522empl_code.value;
  label5.Caption:=dm.aqd522DSDesigner.Value;
  edit5.Text:=dm.aqd522curr_code.Value;
  label11.Caption:=dm.aqd522DSDesigner8.Value;
  edit9.Text:=dm.aqd522exch_rate.AsString;
  edit2.Text:=dm.aqd522DSDesigner3.AsString;
  edit3.Text:=dm.aqd522REMARK.Value;
  edit4.Text:=dm.aqd522DSDesigner6.Value;
  edit7.Text:=trim(dm.aqd522DSDesigner4.Value);
  edit8.Text:=dm.aqd522DSDesigner7.Value;
  edit11.Text:=trim(dm.aqd522DSDesigner5.Value);
  edit6.Text:=floattostr(dm.aqd522bal_amount.Value+
                         dm.aqd522DSDesigner3.Value);
  edit10.Text:=floattostr(dm.aqd522putout_bal_amount.Value-
                          dm.aqd522DSDesigner3.Value);
  bitbtn3.Enabled:=false;
  bitbtn5.Enabled:=false;
  edit13.Text:=dm.aqd522amount.asstring;                        
 end;

 if form2.ShowModal=mrok then
  begin
  dm.aqd522.Close;
  dm.aqd522.Open;
  dm.aqd522.Locate('rkey',dm.ADO522RKEY.Value,[]);
  dm.ADO522.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
  dm.ado129.Close;
  dm.ado114.Close;
  dm.ADO128.Close;
  end;
finally
 form2.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
try
 form2:=Tform2.Create(application);
 with form2 do
 begin
  a_or_e.Caption:='2';//检查
  edit1.Text:=dm.aqd522REF_NUMBER.Value;
  dtpk1.Date:=dm.aqd522TDATE.Value;
  edit12.Text:=dm.aqd522empl_code.value;
  label5.Caption:=dm.aqd522DSDesigner.Value;
  edit5.Text:=dm.aqd522curr_code.Value;
  label11.Caption:=dm.aqd522DSDesigner8.Value;
  edit9.Text:=dm.aqd522exch_rate.AsString;
  edit2.Text:=dm.aqd522DSDesigner3.AsString;
  edit3.Text:=dm.aqd522REMARK.Value;
  edit4.Text:=dm.aqd522DSDesigner6.Value;
  edit7.Text:=trim(dm.aqd522DSDesigner4.Value);
  edit8.Text:=dm.aqd522DSDesigner7.Value;
  edit11.Text:=trim(dm.aqd522DSDesigner5.Value);
  edit6.Text:=floattostr(dm.aqd522bal_amount.Value+
                         dm.aqd522DSDesigner3.Value);
  edit10.Text:=floattostr(dm.aqd522putout_bal_amount.Value-
                          dm.aqd522DSDesigner3.Value);
  bitbtn1.Enabled := false;
  bitbtn2.Enabled := false;
  bitbtn3.Enabled := false;
  bitbtn5.Enabled := false;
  bitbtn6.Enabled := false;  
  edit7.Enabled := false;
  edit11.Enabled := false;
  edit1.Enabled := false;
  dtpk1.Enabled := false;
  edit2.Enabled := false;
  edit3.Enabled := false;
  sgrid1.Enabled := false;
  toolbar1.Enabled := false;
  edit_date.ReadOnly:=true;
  form2.UpDown1.Enabled:=false;
  edit_attached.ReadOnly:=true;
  edit13.Text:=dm.aqd522amount.asstring;
  edit13.Enabled:=false; 
 end;

 if form2.ShowModal=mrok then
  begin

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
if messagedlg('你确定要取消这条记录吗?该操作将不可逆!',mtConfirmation,[mbyes,mbno],0)=mryes then
begin

 if strtoint(user_ptr)<>dm.aqd522sys_ptr.Value then
 begin
  messagedlg('取消操作必须输入人员才能进行!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.aqd522rkey105.Value;
 dm.ado105.Open;
 if (not dm.ADO105.IsEmpty) and (dm.ado105STATUS.Value>0) then
  begin
   messagedlg('银行转帐生成的会计凭证已被审核,无法取消!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

 dm.ado522.Close;
 dm.ado522.Parameters[0].Value:=dm.aqd522RKEY.Value;
 dm.ado522.Open;
 if dm.ado522STATUS.Value=dm.aqd522STATUS.Value then
 begin
  dm.ADOConnection1.BeginTrans;
  try
  dm.ado522.Edit;
  dm.ado522STATUS.Value:=1;
  dm.ado522check_129ptr.AsVariant:=null;
  dm.ado522check_114ptr.AsVariant:=null;
  dm.ado522.Post;

  dm.ADO129.Close;
  dm.ADO129.Parameters[0].Value:=dm.aqd522RKEY.Value;
  dm.ADO129.Open;
  dm.ADO128.Close;
  dm.ADO128.Parameters[0].Value:=dm.ado129BANK_PTR.Value;
  dm.ADO128.Open;
  dm.ADO128.Edit;
  dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value+dm.ado129AMOUNT.Value;
  dm.ADO128.Post;
  dm.ado129.Delete;

  dm.ado114.Close;
  dm.ado114.Parameters[0].Value:=dm.aqd522RKEY.Value;
  dm.ado114.Open;
  dm.ADO128.Close;
  dm.ADO128.Parameters[0].Value:=dm.ado114BANK_PTR.Value;
  dm.ADO128.Open;
  dm.ADO128.Edit;
  dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-dm.ado114AMOUNT.Value;
  dm.ADO128.Post;
  dm.ado114.Delete;

  if not dm.ado105.isempty then
  begin
   dm.ADO105.Edit;
   dm.ADO105STATUS.Value:=5;
   dm.ado105.post;
  end;

  dm.ADOConnection1.CommitTrans;
  messagedlg('取消操作成功!',mtinformation,[mbok],0);
  dm.aqd522.Close;
  dm.aqd522.Open;
  dm.aqd522.Locate('rkey',dm.ado522RKEY.Value,[]);
  dm.ado522.Close;
  dm.ado129.Close;
  dm.ado114.Close;
  dm.ADO128.Close;
  except
   on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
  end;
 end
 else
  messagedlg('取消操作不成功,可能有人已经取消',mterror,[mbcancel],0);
end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.aqd522STATUS.value=1 then
  DBGrid1.Canvas.Font.Color := clRed;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.aqd522.IsEmpty then
 begin
  n2.enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
 end
else
 begin
  if dm.aqd522STATUS.Value=1 then
   begin
    n2.Enabled:=false;
    n3.Enabled:=false;
    n4.enabled:=false;
   end
  else
   begin
    n2.Enabled:=true;
    n3.enabled:=true;
    n4.Enabled:=true;
   end;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

end.
