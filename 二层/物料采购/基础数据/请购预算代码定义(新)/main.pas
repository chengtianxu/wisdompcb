unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB, Menus,
  DateUtils;

type
  TForm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    sql_text:string;
    PreColumn: TColumnEh;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses damo,common, budget, QuerySet;

{$R *.dfm}

procedure TForm_main.item_click(sender: TObject);
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
  end
  else
   begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
   end;
end;

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
close;
application.Terminate;
end;

procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker = smDownEh then
  begin
   column.Title.SortMarker := smUpEh;
   dm.ADS362.IndexFieldNames := Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS362.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
   edit1.SetFocus;
end;

procedure TForm_main.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  PreColumn := DBGridEh1.Columns[0];
  for i:=1 to DBGrideh1.Columns.Count do
   begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
   end;
  sql_text:=dm.ADS362.CommandText;
  dm.ADS362.Close;
  dm.ADS362.CommandText:=dm.ADS362.CommandText+
  'and bud_year='+inttostr(yearof(common.getsystem_date(dm.ADOQuery1,1)));
  dm.ADS362.Open;
  dm.ads363.Open;
  with frmQuerySet do
  begin
    sgrid1.Cells[0,sgrid1.RowCount-1]:='预算年度';
    sgrid1.Cells[1,sgrid1.RowCount-1]:=' = '+inttostr(yearof(common.getsystem_date(dm.ADOQuery1,1)));
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and bud_year='+inttostr(yearof(common.getsystem_date(dm.ADOQuery1,1)));
    ListBox3.ItemIndex :=2;
    sgrid1.RowCount:=sgrid1.RowCount+1;
    ListBox3Click(Sender);
  end;
end;

procedure TForm_main.Edit1Change(Sender: TObject);
begin

 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TForm_main.BitBtn2Click(Sender: TObject);
var
 rkey362:integer;
begin
  rkey362:=dm.ADS362RKEY.Value;
  dm.ADS362.Close;
  dm.ADS362.Prepared;
  dm.ADS362.Open;
  if rkey362>0 then
   dm.ADS362.Locate('rkey',rkey362,[]);
end;

procedure TForm_main.BitBtn4Click(Sender: TObject);
begin
 if not dm.ADS362.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm_main.BitBtn6Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_main.N1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else
  try
    form_budget:=Tform_budget.Create(Application);
    form_budget.v_status:=0;
    form_budget.SpinEdit1.Value:=yearof(date());
    if form_budget.ShowModal=mrok then
    begin
     dm.ADS362.Close;
     dm.ADS362.Open;
     dm.ADS362.Locate('rkey',form_budget.rkey362,[]);
     ShowMsg('新增操作成功!',1);
    end;
  finally
    form_budget.Free;
  end;
end;

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS362.CommandText);
end;

procedure TForm_main.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else

if MessageDlg('您确删除该预算代码吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
begin
try
 with dm.ADOQuery1 do
 begin
   close;
   sql.Text:='delete data0362 where code='+quotedstr(dm.ADS362CODE.Value) ;

   if ExecSQL>0 then
    begin
     common.ShowMsg('删除操作成功！',1);
     self.BitBtn2Click(Sender);
    end;
 end;

except
 on E: Exception do
  begin
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

end;

procedure TForm_main.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
  form_budget:=Tform_budget.Create(Application);
   form_budget.rkey362:=dm.ADS362RKEY.Value;
  form_budget.v_status:=1;
  if form_budget.ShowModal=mrok then
  begin

   BitBtn2Click(Sender);
   ShowMsg('编辑操作成功!',1);
  end;
finally
  form_budget.Free;
end;
end;

procedure TForm_main.BtQryClick(Sender: TObject);
var
  i:integer;
begin
 if frmQuerySet.ShowModal=mrok then
 begin
  dm.ADS362.Close;
  dm.ADS362.CommandText:=sql_text;
  for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
  dm.ADS362.CommandText:=dm.ADS362.CommandText+ frmQuerySet.SGrid1.Cells[2,i];
  dm.ADS362.Open;
 end;
end;

procedure TForm_main.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
   form_budget:=Tform_budget.Create(application);
   form_budget.rkey362:=dm.ADS362RKEY.Value;
   form_budget.v_status:= 2; //表示复制
   if form_budget.ShowModal = mrok then
   begin
    BitBtn2Click(Sender);
    ShowMsg('复制操作成功!',1);
   end;
  finally
   form_budget.Free;
  end;
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
  self.Caption:=application.Title;
  { dm.ADOConnection1.Open;
  rkey73:='851';
  user_ptr := '963';
  vprev := '4'; }
end;

procedure TForm_main.N5Click(Sender: TObject);
begin
dm.ADOQuery1.Close;
dm.ADOQuery1.SQL.Text := 'DELETE data0363 from data0363 inner join data0073 on data0363.user_ptr=data0073.rkey'+
                         ' where data0073.active_flag=1 and data0363.BUDGET_PTR='+dm.ADS362RKEY.AsString;
dm.ADOQuery1.ExecSQL;
BitBtn2Click(Sender);
end;

end.
