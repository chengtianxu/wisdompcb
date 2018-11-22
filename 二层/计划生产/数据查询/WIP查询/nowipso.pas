unit nowipso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBGridEh, Menus, StdCtrls, Buttons, ExtCtrls;

type
  TForm_nowipso = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;

    procedure item_click(Sender: TObject);
  public
    { Public declarations }

  end;

var
  Form_nowipso: TForm_nowipso;

implementation

uses DM, common, term;
{$R *.dfm}

procedure TForm_nowipso.item_click(Sender: TObject);
var
  i: byte;
begin (Sender as tmenuItem)
  .Checked := not((Sender as tmenuItem).Checked);
  if (Sender as tmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
      if DBGridEh1.Columns[i].Title.Caption = (Sender as tmenuItem).Caption then
      begin
        DBGridEh1.Columns[i].Visible := true;
        break;
      end;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
      if DBGridEh1.Columns[i].Title.Caption = (Sender as tmenuItem).Caption then
      begin
        DBGridEh1.Columns[i].Visible := false;
        break;
      end;
  end;
end;

procedure TForm_nowipso.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm_nowipso.BitBtn3Click(Sender: TObject);
var
  rkey: string;
begin
  rkey := dmcon.ads60SALES_ORDER.Value;
  dmcon.ads60.close;
  dmcon.ads60.Open;
  if rkey <> '' then
    dmcon.ads60.Locate('SALES_ORDER', rkey, []);
end;

procedure TForm_nowipso.BitBtn2Click(Sender: TObject);
begin
  if not DBGridEh1.DataSource.DataSet.IsEmpty then
    Export_dbGridEH_to_Excel(self.DBGridEh1, self.Caption);
end;

procedure TForm_nowipso.BitBtn5Click(Sender: TObject);
begin
  PopupMenu1.Popup(mouse.CursorPos.x, mouse.CursorPos.y);
end;

procedure TForm_nowipso.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(Key) = 'V') and (ssalt in Shift) then
    showmessage(dmcon.ads60.CommandText);
end;

procedure TForm_nowipso.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker = smDownEh then
  begin
    Column.Title.SortMarker := smUpEh;
    dmcon.ads60.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    dmcon.ads60.IndexFieldNames := Column.FieldName + ' DESC';
  end;

  if (Column.ReadOnly) and (PreColumn.FieldName <> Column.FieldName) then
  begin
    Label1.Caption := Column.Title.Caption;
    Edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := Column;
  end
  else
    Edit1.SetFocus;
end;

procedure TForm_nowipso.FormShow(Sender: TObject);
var
  i: integer;
  item: tmenuItem;
begin
  dmcon.ads60.Open;

  PreColumn := DBGridEh1.Columns[0];
  for i := 1 to DBGridEh1.Columns.Count do
  begin
    item := tmenuItem.Create(self);
    item.Caption := DBGridEh1.Columns[i - 1].Title.Caption;
    if DBGridEh1.Columns[i - 1].Visible then
      item.Checked := true;
    item.OnClick := item_click;
    self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm_nowipso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmcon.ads60.close;
  Form_condition.Free;
end;

procedure TForm_nowipso.Edit1Change(Sender: TObject);
begin
  if (trim(Edit1.Text) <> '') then
    dmcon.ads60.Filter := PreColumn.FieldName + ' like ''%' + trim(Edit1.Text)
      + '%'''
  else
    dmcon.ads60.Filter := '';
end;

procedure TForm_nowipso.BitBtn4Click(Sender: TObject);
var
  i: byte;
begin

  if Form_condition.ShowModal = mrok then
  begin
    dmcon.ads60.close;
    dmcon.ads60.CommandText := dmcon.sql_text;

    for i := 1 to Form_condition.SGrid1.RowCount - 2 do
      dmcon.ads60.CommandText := dmcon.ads60.CommandText +
        Form_condition.SGrid1.Cells[2, i] + #13;
    dmcon.ads60.Open;
  end;

end;

procedure TForm_nowipso.FormActivate(Sender: TObject);
begin
  Form_condition := tForm_condition.Create(application);
end;

end.
