unit invtransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, ADODB,ComObj,Excel2000, ClipBrd,
  Menus;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ado27: TADOQuery;
    ado27INV_PART_NUMBER: TStringField;
    ado27INV_PART_DESCRIPTION: TStringField;
    ado27CODE: TStringField;
    ado27SUPPLIER_NAME: TStringField;
    ado27ABBR_NAME: TStringField;
    ado27LOCATION_CODE_FROM: TStringField;
    ado27LOCATION_NAME_FROM: TStringField;
    ado27LOCATION_CODE_TO: TStringField;
    ado27LOCATION_NAME_TO: TStringField;
    ado27QUANTITY: TIntegerField;
    ado27TDATE: TDateTimeField;
    ado27EMPL_CODE: TStringField;
    ado27EMPLOYEE_NAME: TStringField;
    ado27TYPE_CHS: TStringField;
    ado27REF_NUMBER: TStringField;
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    Edit3: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure item_click(sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure TotalSum;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses main;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado27.SQL.Text);
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
 form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm5.item_click(sender:TObject);
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

procedure TForm5.FormActivate(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
    if dbgrid1.Columns[i-1].Visible then item.Checked:=true;
    item.OnClick:=item_click;
    PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm5.DBGrid1TitleClick(Column: TColumn);
begin
 Edit3.Text:='';
 if (column.ReadOnly=true) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  ado27.sort:=column.FieldName+' ASC';
 end;

end;

procedure TForm5.Edit3Change(Sender: TObject);
begin
  if (trim(edit3.Text)<>'') then
    Ado27.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
  else
    self.ado27.filter := '';
  TotalSum;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  field_name:='INV_PART_NUMBER';
end;

procedure TForm5.TotalSum;
var
  quantity:integer;
begin
  quantity:=0;
  ado27.DisableControls;
  DataSource1.DataSet:=nil;
  while not ado27.Eof do
   begin
    quantity:=quantity+ado27QUANTITY.Value;
    ado27.Next;
   end;
  ado27.First;
  DataSource1.DataSet:=ado27;
  ado27.EnableControls;
  Edit1.Text:=formatfloat('0.00',quantity);
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  TotalSum;
end;

end.
