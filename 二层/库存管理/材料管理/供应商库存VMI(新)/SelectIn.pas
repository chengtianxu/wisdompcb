unit SelectIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons;

type
  TForm_SelectIn = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1DSDesigner5: TStringField;
    ADOQuery1DSDesigner7: TStringField;
    ADOQuery1DSDesigner8: TStringField;
    ADOQuery1DSDesigner9: TStringField;
    ADOQuery1DSDesigner10: TStringField;
    ADOQuery1DSDesigner11: TBCDField;
    ADOQuery1DSDesigner12: TBCDField;
    ADOQuery1DSDesigner13: TStringField;
    ADOQuery1DSDesigner14: TBCDField;
    ADOQuery1DSDesigner15: TBCDField;
    ADOQuery1DSDesigner16: TBCDField;
    ADOQuery1DSDesigner20: TStringField;
    ADOQuery1DSDesigner21: TStringField;
    ADOQuery1DSDesigner22: TStringField;
    ADOQuery1DSDesigner23: TDateTimeField;
    ADOQuery1DSDesigner25: TStringField;
    ADOQuery1DSDesigner27: TDateTimeField;
    BitBtn5: TBitBtn;
    Button2: TButton;
    ADOQuery1DSDesigner6: TStringField;
    ADOQuery1DSDesigner17: TStringField;
    ADOQuery1DSDesigner18: TStringField;
    PopupMenu1: TPopupMenu;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    BitBtn1: TBitBtn;
    ADOQuery1DSDesigner19: TBCDField;
    ADOQuery1IQC: TStringField;
    ADOQuery1IQC2: TDateTimeField;
    ADOQuery1DSDesigner24: TStringField;
    ADOQuery1DSDesigner26: TStringField;
    ADOQuery1cust_decl: TStringField;
    ADOQuery1DSDesigner28: TBCDField;
    Edit4: TEdit;
    Label4: TLabel;
    procedure CopyDbDataToExcel(Args:array of const);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form_SelectIn: TForm_SelectIn;

implementation

uses demo, Condition;

{$R *.dfm}
procedure Tform_SelectIn.CopyDbDataToExcel(Args:array of const);
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

procedure TForm_SelectIn.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm_SelectIn.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm_SelectIn.Button2Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_SelectIn.FormCreate(Sender: TObject);
begin
field_name:='入库单号';
end;

procedure TForm_SelectIn.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 adoquery1.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 adoquery1.Filter := '';
end;


procedure TForm_SelectIn.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>field_name) then //(column.ReadOnly) and
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  adoquery1.Sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm_SelectIn.item_click(Sender: TObject);
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

procedure TForm_SelectIn.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_SelectIn.FormActivate(Sender: TObject);
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
  if form_Selectin.PopupMenu1.tag<=2 then
  begin
    for i:=14 to 18 do self.PopupMenu1.Items[i].Enabled:=false;
  end;

end;

procedure TForm_SelectIn.FormShow(Sender: TObject);
begin
   if Self.PopupMenu1.Tag=4 then
  begin
    Self.ADOQuery1DSDesigner24.ReadOnly:=false; //有效期
    Self.ADOQuery1DSDesigner27.ReadOnly:=False;//详细位置
    Self.ADOQuery1cust_decl.ReadOnly:=False;//报关单号
  end;
end;

end.
