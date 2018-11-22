unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGrids, Grids, DBGridEh, StdCtrls, Menus, Buttons,
  ComCtrls,DateUtils, DB, ADODB;

type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Panel3: TPanel;
    CheckBox0: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    PopupMenu3: TPopupMenu;
    N10: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
    
  end;

var
  Form_Main: TForm_Main;

implementation
uses
  common, Detail, Demo, frmReport;
{$R *.dfm}

procedure TForm_Main.N1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;
try
 form_detail:=Tform_detail.Create(application);
 form_detail.State:=1;  //标识新增
 if form_detail.ShowModal=mrok then
  begin
    dm.ADS236.Close;
    dm.ADS236.Prepared;
    dm.ADS236.Open;
    dm.ADS236.Locate('rkey',dm.ADO236RKEY.Value,[]);
    dm.ADO236.Close;
    dm.ADO236.Close;
  end;
finally
 form_detail.Free;
end;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin
if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;

 self.Caption:= application.Title;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
// user_ptr:='3';
// vprev:='2';
end;

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm_Main.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
  DateTimePicker2.Date:=getsystem_date(dm.adoquery1,1);
  DateTimePicker1.Date:=DateTimePicker2.Date-dayof(DateTimePicker2.Date)+1;
  self.DateTimePicker1Change(nil);
  
  PreColumn := DBGridEh1.Columns[0];
  for i:=1 to DBGrideh1.Columns.Count do
   begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
   end;
end;

procedure TForm_Main.DateTimePicker1Change(Sender: TObject);
begin
  WITH DM.ADS236 do
  begin
    close;
    parameters.ParamByName('vdate1').Value :=datetimepicker1.Date ;
    parameters.ParamByName('vdate2').Value :=datetimepicker2.Date ;
    Prepared;
    open;
  end;
  dm.ADO237.Close;
  dm.ADO237.Open;
end;

procedure TForm_Main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := true;
      break;
    end;
  end else begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;


procedure TForm_Main.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_Main.BitBtn2Click(Sender: TObject);
var
 rkey236:integer;
begin
rkey236:=dm.ADS236RKEY.Value;
dm.ADS236.Close;
dm.ADS236.Prepared;
dm.ADS236.Open;
if rkey236>0 then dm.ADS236.Locate('rkey',rkey236,[]);
end;


procedure TForm_Main.CheckBox0Click(Sender: TObject);
begin
 dm.ADS236.Close;
if checkbox0.Checked then
 dm.ADS236.Parameters[2].Value:=9
else
 dm.ADS236.Parameters[2].Value:=0;

if checkbox1.Checked then
 dm.ADS236.Parameters[3].Value:=9
else
 dm.ADS236.Parameters[3].Value:=1;

if checkbox2.Checked then
 dm.ADS236.Parameters[4].Value:=9
else
 dm.ADS236.Parameters[4].Value:=2;
 dm.ADS236.Prepared;
 DM.ADS236.open;
end;

procedure TForm_Main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.ADS236STATUS.value=2 then
  DBGrideh1.Canvas.Font.Color := clRed;
  if DM.ADS236STATUS.Value=1 then
  DBGrideh1.Canvas.Font.Color := clBlue;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS236.CommandText);
end;

procedure TForm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS236.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS236.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label3.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_Main.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TForm_Main.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS236.IsEmpty then
 begin
  n2.Enabled := false;
  n3.Enabled := false;
  n4.Enabled := false;
  N4.Enabled := False;
  N5.Enabled := False;
  N7.Enabled := False;
  N9.Enabled := False;
 end
else
 begin
  n3.Enabled:=true;
  if dm.ADS236STATUS.Value =0 then
    begin
     n2.Enabled :=true;
     n4.Enabled :=true;
     N5.Enabled :=False;
     N9.Enabled :=False;
    end
  else
  if dm.ADS236STATUS.Value=1 then
  begin
   N2.Enabled :=False;
   N5.Enabled :=True;
   N4.Enabled :=False;
   N7.Enabled :=False;
   N9.Enabled :=True;
  end
  else
  begin
   n2.Enabled :=True;
   n4.Enabled :=True;
   N5.Enabled :=False;
   N7.Enabled :=True;
   N9.Enabled :=False;
  end;
 end;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;
 dm.ADO236.Close;
 dm.ADO236.Parameters[0].Value:=dm.ADS236RKEY.Value;
 dm.ADO236.Open;
 if dm.ADO236STATUS.Value =1then
  begin
   messagedlg('对帐单状态发生变化,无法编辑!',mtinformation,[mbcancel],0);
   dm.ADO236.Close;
   exit;
  end;
try
 form_detail:=Tform_detail.Create(application);
 form_detail.State:=2; //编辑
 if form_detail.ShowModal=mrok then
  begin
    dm.ADS236.Close;
    dm.ADS236.Prepared;
    dm.ADS236.Open;
    dm.ADS236.Locate('rkey',dm.ADO236RKEY.Value,[]);
    dm.ADO236.Close;
  end;
finally
 form_detail.Free;
end;
end;

procedure TForm_Main.N3Click(Sender: TObject);
begin
 try
 form_detail:=Tform_detail.Create(application);
 form_detail.State:=3;  //检查
 if form_detail.ShowModal=mrok then
  begin

  end;
 finally
 form_detail.Free;
 end;
end;

procedure TForm_Main.N4Click(Sender: TObject);
begin
 if (strtoint(vprev)<>4) then
 begin
  messagedlg('对不起!您没有审核权限!',mtinformation,[mbok],0);
  exit;
 end;
 dm.ADO236.Close;
 dm.ADO236.Parameters[0].Value:=dm.ADS236RKEY.Value;
 dm.ADO236.Open;
 if not dm.ADO236.IsEmpty then
 begin
  dm.ADO236.Edit;
  dm.ADO236STATUS.Value:=1;
  DM.ADO236AUDITED_BY_EMPL_PTR.AsString:=user_ptr;
  dm.ADO236.Post;
 end;
 BitBtn2Click(Sender);
end;

procedure TForm_Main.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) then
 begin
  messagedlg('对不起!您没有退回权限!',mtinformation,[mbok],0);
  exit;
 end;
 dm.ADO236.Close;
 dm.ADO236.Parameters[0].Value:=dm.ADS236RKEY.Value;
 dm.ADO236.Open;
 if not dm.ADO236.IsEmpty then
 begin
  dm.ADO236.Edit;
  dm.ADO236STATUS.Value:=2;
  dm.ADO236.Post;
 end;
 BitBtn2Click(Sender);
end;

procedure TForm_Main.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

if strtoint(user_ptr)<>dm.ADS236ENTERED_BY_EMPL_PTR.Value then
 begin
  messagedlg('对不起删除操作必须由创建人自己进行!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ADO236.Close;
 dm.ADO236.Parameters[0].Value:=dm.ADS236RKEY.Value;
 dm.ADO236.Open;
 if dm.ADO236STATUS.Value=1then
  begin
   messagedlg('客户对帐单状态发生变化,无法删除!',mtinformation,[mbok],0);
   dm.ADO236.Close;
   exit;
  end;
 if messagedlg('您确定要删除该对帐单吗??'+dm.ADS236VOUCHER.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
   try
    dm.ADOConnection1.BeginTrans;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0112'+#13+
              'set recon_amount=data0112.recon_amount-DATA0237.recon_amount'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0112 ON DATA0237.INVOICE_PTR = Data0112.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;             //去掉112对帐金额
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0116'+#13+
              'set recon_amount=data0116.recon_amount-DATA0237.recon_amount'+#13+
              'FROM DATA0237 INNER JOIN' +#13+
              'data0116 ON DATA0237.DEBIT_PTR = Data0116.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;             //去掉116对帐金额
    end;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0064'+#13+
              'set recon_qty=recon_qty-DATA0237.QUANTITY'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0064 ON dbo.DATA0237.SO_SHP_PTR = dbo.Data0064.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;             //去掉64对帐数量
    end;
    
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='update data0098'+#13+
              'set recon_qty=recon_qty-DATA0237.QUANTITY'+#13+
              'FROM dbo.DATA0237 INNER JOIN' +#13+
              'dbo.Data0098 ON dbo.DATA0237.RMA_PTR = dbo.Data0098.RKEY'+#13+
              'where  DATA0237.rkey236_ptr='+dm.ADO236RKEY.AsString;
     ExecSQL;
    end;
                              //去掉98对帐数量
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='delete data0237 '+
               'where rkey236_ptr ='+dm.ADO236RKEY.AsString;
     ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='delete data0236 '+
               'where rkey ='+dm.ADO236RKEY.AsString;
     ExecSQL;
    end;
     dm.ADOConnection1.CommitTrans;
     BitBtn2Click(nil);
     showmsg('删除操作成功!',1);
    except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
   end;
 end;
end;

procedure TForm_Main.BitBtn3Click(Sender: TObject);
begin
popupmenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_Main.N9Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz236.close;
  Form_Report.Aqwz236.Parameters[0].Value:=dm.ADS236rkey.Value;
  Form_Report.Aqwz236.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr236.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1BeforePrint(Sender);
//  Form_Report.ppReport1.SaveAsTemplate:=false;
//  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N10Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr236.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

end.
