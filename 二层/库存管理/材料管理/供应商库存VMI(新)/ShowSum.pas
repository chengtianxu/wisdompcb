unit ShowSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB,Excel2000,comobj,
  Menus;

type
  TForm_ShowSum = class(TForm)
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form_ShowSum: TForm_ShowSum;

implementation

uses demo;

{$R *.dfm}

procedure TForm_ShowSum.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TForm_ShowSum.BitBtn2Click(Sender: TObject);
begin
self.Edit3.Text:='';
self.Edit3.SetFocus;
end;

procedure TForm_ShowSum.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 dm.ADO172Sum.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 dm.ADO172Sum.Filter := '';
end;

procedure TForm_ShowSum.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ADO172Sum.SQL.Text);
end;

procedure TForm_ShowSum.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>'quan_total') and
    (column.FieldName<>'avl_price') and
    (column.FieldName<>'amount') and
    (column.FieldName<>'STOCK_BASE') and
    (column.FieldName<>'total_weigth') and
    (column.FieldName<>'STOCK_SELL') and
    (column.FieldName<>'total_area') and    
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  dm.ADO172Sum.sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm_ShowSum.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm_ShowSum.CopyDbDataToExcel(Args:array of const);
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


procedure TForm_ShowSum.BitBtn4Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_ShowSum.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=self.item_click;
   self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm_ShowSum.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_ShowSum.item_click(Sender:Tobject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

end.
