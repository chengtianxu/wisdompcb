unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGrids, Grids, DBGridEh, StdCtrls, Menus, Buttons,
  ComCtrls,DateUtils, DB, ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel2: TPanel;
    CheckBox0: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    Edit1: TEdit;
    Label3: TLabel;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, ysdetail;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey105:integer;
begin
rkey105:=dm.ADS105RKEY.Value;
dm.ADS105.Close;
dm.ADS105.Prepared;
dm.ADS105.Open;
if rkey105>0 then dm.ADS105.Locate('rkey',rkey105,[]);
end;

procedure TForm1.item_click(sender: TObject);
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

procedure TForm1.FormShow(Sender: TObject);
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

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
  WITH DM.ADS105 do
  begin
    close;
    parameters.ParamByName('vdate1').Value :=datetimepicker1.Date ;
    parameters.ParamByName('vdate2').Value :=datetimepicker2.Date ;
    Prepared;
    open;
  end;
  dm.ads106.Open;
end;

procedure TForm1.CheckBox0Click(Sender: TObject);
begin
 dm.ads105.Close;

if checkbox0.Checked then
 dm.ads105.Parameters[2].Value:=9
else
 dm.ads105.Parameters[2].Value:=0;

if checkbox1.Checked then
 dm.ads105.Parameters[3].Value:=9
else
 dm.ads105.Parameters[3].Value:=1;

if checkbox2.Checked then
 dm.ads105.Parameters[4].Value:=9
else
 dm.ads105.Parameters[4].Value:=2;

if checkbox3.Checked then
 dm.ads105.Parameters[5].Value:=9
else
 dm.ads105.Parameters[5].Value:=3;

if checkbox4.Checked then
 dm.ads105.Parameters[6].Value:=9
else
 dm.ads105.Parameters[6].Value:=4;

if checkbox5.Checked then
 dm.ads105.Parameters[7].Value:=9
else
 dm.ads105.Parameters[7].Value:=5;

 dm.ads105.Prepared;
 DM.ads105.open;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS105.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS105.IndexFieldNames:=Column.FieldName+' DESC';
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS105.CommandText);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
 end
else
try
 form_ysdetail:=Tform_ysdetail.Create(application);
 form_ysdetail.State:=1;
 if form_ysdetail.ShowModal=mrok then
  begin
    dm.ADS105.Close;
    dm.ADS105.Prepared;
    dm.ADS105.Open;
    dm.ADS105.Locate('rkey',dm.ADO105RKEY.Value,[]);
    dm.ADO105.Close;
    dm.ADO106.Close;
  end;
finally
 form_ysdetail.Free;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:= application.Title;
 {}
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

// user_ptr:='3';
// vprev:='2';
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.ADS105RKEY.Value;
 dm.ado105.Open;
 if dm.ado105STATUS.Value > 0 then
  begin
   messagedlg('会计凭证状态发生变化,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

try
 form_ysdetail:=Tform_ysdetail.Create(application);
 form_ysdetail.State:=2;
 if form_ysdetail.ShowModal=mrok then
  begin
    dm.ADS105.Close;
    dm.ADS105.Prepared;
    dm.ADS105.Open;
    dm.ADS105.Locate('rkey',dm.ADO105RKEY.Value,[]);
    dm.ADO105.Close;
    dm.ADO106.Close;
  end;
finally
 form_ysdetail.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
try
 form_ysdetail:=Tform_ysdetail.Create(application);
 form_ysdetail.State:=3;
 if form_ysdetail.ShowModal=mrok then
  begin

  end;
finally
 form_ysdetail.Free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

if strtoint(user_ptr)<>dm.ADS105ENTERED_BY_EMPL_PTR.Value then
 begin
  messagedlg('对不起取消操作必须由创建人自己完成!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.ADS105RKEY.Value;
 dm.ado105.Open;
 if dm.ado105STATUS.Value > 0 then
  begin
   messagedlg('会计凭证状态发生变化,无法作废!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

 if messagedlg('您确定要作废该凭证吗??'+dm.ADS105VOUCHER.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   try
    dm.ADOConnection1.BeginTrans;
    if not dm.ado105.IsEmpty then  //删除计帐凭证
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;    //被作废
     dm.ado105.Post;
    end;

    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='update data0064'+#13+
              'set glptr_stauts2=0 , GL_HEADER_PTR2=null'+#13+
              'where GL_HEADER_PTR2='+dm.ADO105RKEY.AsString;
      ExecSQL;
     end;
     dm.ADOConnection1.CommitTrans;
     BitBtn2Click(nil);
     showmsg('作废操作成功!',1);
    except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;

   end;
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if dm.ADS105STATUS.value=5 then
  DBGrideh1.Canvas.Font.Color := clRed;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS105.IsEmpty then
 begin
  n2.Enabled := false;
  n3.Enabled := false;
  n4.Enabled := false;
 end
else
 begin
  n3.Enabled:=true;
  if dm.Ads105status.Value =0 then
    begin
     n2.Enabled :=true;
     n4.Enabled :=true;
    end
   else
    begin
     n2.Enabled :=false;
     n4.Enabled :=false;
    end;
 end;
end;

end.
