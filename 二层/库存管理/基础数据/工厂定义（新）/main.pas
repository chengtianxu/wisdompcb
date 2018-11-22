unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, Menus,DB;

type
  TForm_main = class(TForm)
    pnl1: TPanel;
    lblColumn: TLabel;
    btnExit: TBitBtn;
    btnField: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    Edit1: TEdit;
    BtQry: TBitBtn;
    Bar1: TStatusBar;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    add_ware: TMenuItem;
    edit_ware: TMenuItem;
    copy_ware: TMenuItem;
    del_ware: TMenuItem;
    PopupMenu2: TPopupMenu;
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure add_wareClick(Sender: TObject);
    procedure edit_wareClick(Sender: TObject);
    procedure copy_wareClick(Sender: TObject);
    procedure del_wareClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtQryClick(Sender: TObject);
  private
    { Private declarations }
    PreColumn:TColumnEh;
    sql_text:string;
    procedure item_click(Sender: TObject);
  public
    { Public declarations }
    is_new:boolean;
  end;

var
  Form_main: TForm_main;

implementation

uses damo,common,budget,QrySet;

{$R *.dfm}

procedure TForm_main.btnExitClick(Sender: TObject);
begin
close;
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
   sql_text:=DM.ADS15.CommandText;
   DM.ADS15.Open;
   DM.AQ04.Open;
end;

procedure TForm_main.btnRefreshClick(Sender: TObject);
var
 rkey015:integer;
begin
  rkey015:=dm.ADS15RKEY.Value;
  dm.ADS15.Close;
  dm.ADS15.Prepared;
  dm.ADS15.Open;
  if rkey015>0 then
  dm.ADS15.Locate('rkey',rkey015,[]);
end;

procedure TForm_main.btnExportClick(Sender: TObject);
begin
if not dm.ADS15.IsEmpty then
if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
Export_DBGridEh_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm_main.btnFieldClick(Sender: TObject);
begin
PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm_main.FormCreate(Sender: TObject);

begin
//  if not app_init_2(DM.ADOConnection1) then
//  begin
//   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
//   application.Terminate;
//  end;
  vprev:='4';
  self.Caption:=application.Title;
end;
procedure TForm_Main.item_click(Sender: TObject);
var i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i:=0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=True;
        Break;
      end;
  end
  else
  begin
    for i:=0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=False;
        Break;
      end;
  end;
end;


procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker = smDownEh then
  begin
   column.Title.SortMarker := smUpEh;
   dm.ADS15.IndexFieldNames := Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS15.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    lblColumn.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
   edit1.SetFocus;
    
end;
procedure TForm_main.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  begin
    DM.ADS15.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%''';
  end
 else
  begin
    DM.ADS15.Filter:='';
  end;
end;

procedure TForm_main.add_wareClick(Sender: TObject);

begin
  try
    dm.ADS15.Append;
    is_new:=True;
    Form_budget:=TForm_budget.Create(application);
    if Form_budget.ShowModal=mrok then
    begin
      dm.ADS15.Locate('rkey',Form_budget.rkey15,[]);
    end;
  finally
   Form_budget.free;
  end;
  btnRefreshClick(Sender);
end;

procedure TForm_main.edit_wareClick(Sender: TObject);
begin
  DM.ADS15.Edit;
try
  Form_budget:=TForm_budget.Create(application);
  Form_budget.ShowModal;
finally
  Form_budget.free;
end;
end;

procedure TForm_main.copy_wareClick(Sender: TObject);
var
 v_recode:array[2..34] of variant;
 i:word;
begin
is_new:=false;
for i:=2 to 34 do
  v_recode[i]:=dm.ADS15.Fields[i].Value;
 dm.ADS15.Append;
 for i:=2 to 34 do
  dm.ADS15.fieldvalues[dm.ADS15.Fields[i].FieldName]:=v_recode[i];
 try
  Form_budget:=TForm_budget.Create(application);
  Form_budget.ShowModal;
 finally
  Form_budget.Free;
 end;
 btnRefreshClick(Sender);
end;

procedure TForm_main.del_wareClick(Sender: TObject);
begin
if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  DM.ADOConnection1.BeginTrans;
  try
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text:='delete from data0015  where rkey='+DM.ADS15RKEY.AsString;
    DM.ADOQuery1.ExecSQL;
    DM.ADOConnection1.CommitTrans;
    showmessage('数据被成功删除!');
   btnRefreshClick(Sender);
  except
    DM.ADOConnection1.RollbackTrans;
    showmessage('不能删除该工厂,已有记录!');
  end;
end;

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS15.CommandText);
end;
procedure TForm_main.BtQryClick(Sender: TObject);
var
  i:integer;
begin
  Qry:=TQry.Create(Application);
  if Qry.ShowModal=mrok then
  with DM.ADS15 do
  begin
    close;
    commandtext:=sql_text;
    for i:=1 to qry.SGrid1.RowCount-1 do
    commandtext:=commandtext+qry.SGrid1.Cells[2,i];
    open;
  end;
end;

end.
