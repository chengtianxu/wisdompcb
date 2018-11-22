unit mature_invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, Menus, Buttons, StdCtrls,
  ComObj,Excel2000,ClipBrd;

type
  TForm3 = class(TForm)
    Aq107: TADOQuery;
    DataSource1: TDataSource;
    Aq107INVOICE_NO: TStringField;
    Aq107CODE: TStringField;
    Aq107ABBR_NAME: TStringField;
    Aq107SUPPLIER_NAME: TStringField;
    Aq107CURR_NAME: TStringField;
    Aq107EMPLOYEE_NAME: TStringField;
    Aq107WAREHOUSE_CODE: TStringField;
    Aq107WAREHOUSE_NAME: TStringField;
    Aq107INV_DATE: TDateTimeField;
    Aq107DUE_DATE: TDateTimeField;
    Aq107tax_invoice_amt: TBCDField;
    Aq107tax_invoice_date: TDateTimeField;
    Aq107tax_invoice_ref: TStringField;
    Aq107INV_TOTAL: TBCDField;
    Aq107pay_amt: TBCDField;
    Aq107mature_yamt: TBCDField;
    Aq107mature_bamt: TBCDField;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Aq107INV_TP: TStringField;
    Aq107EX_RATE: TFloatField;
    Aq107GLPTR_STATUS: TBooleanField;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses datamd, main;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
field_name:='INVOICE_NO';     //Éè±¸¹ýÂË×Ö¶Î
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
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


procedure TForm3.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  aq107.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  aq107.Filter:='';
end;

procedure TForm3.Button2Click(Sender: TObject);

begin
 form1.CopyDbDataToExcel([dbgrid1]); 
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
self.Aq107.Open;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm3.N1Click(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuitem).Checked:=not (sender as tmenuitem).Checked;
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

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(Aq107.SQL.Text);
end;

end.
