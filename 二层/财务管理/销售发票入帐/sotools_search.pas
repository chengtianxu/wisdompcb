unit sotools_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ComCtrls, ExtCtrls, Buttons,
  Menus,DateUtils;

type
  TForm_sotool = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Aqd64: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Aqd64delivery_no: TStringField;
    Aqd64date_sailing: TDateTimeField;
    Aqd64SALES_ORDER: TStringField;
    Aqd64TOTAL_ADD_L_PRICE: TFloatField;
    Aqd64CUST_CODE: TStringField;
    Aqd64CUSTOMER_NAME: TStringField;
    Aqd64ABBR_NAME: TStringField;
    Aqd64PO_NUMBER: TStringField;
    Aqd64PO_DATE: TDateTimeField;
    Aqd64ENT_DATE: TDateTimeField;
    Aqd64SCH_DATE: TDateTimeField;
    Aqd64NET_PAY: TSmallintField;
    Aqd64CURR_CODE: TStringField;
    Aqd64CURR_NAME: TStringField;
    Aqd64RKEY: TIntegerField;
    Aqd64CUSTOMER_PTR: TIntegerField;
    Aqd64CURRENCY_PTR: TIntegerField;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Aqd64tax_in_price: TStringField;
    Aqd62: TADODataSet;
    DataSource2: TDataSource;
    Aqd62CATEGORY: TStringField;
    Aqd62AMOUNT: TFloatField;
    Aqd62FREE_AMOUNT: TFloatField;
    Aqd62PTR_TO_GL_ACCT: TIntegerField;
    Aqd62ADDL_CAT_PTR: TIntegerField;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    Aqd64tax_2: TBCDField;
    Aqd62TAX_FLAG: TStringField;
    Aqd64ACC_REC_PTR: TIntegerField;
    Aqd62GL_ACC_NUMBER: TStringField;
    Aqd62GL_DESCRIPTION: TStringField;
    Aqd64base_to_other: TFloatField;
    Aqd64MANU_PART_NUMBER: TStringField;
    Aqd64MANU_PART_DESC: TStringField;
    Aqd64REG_TAX_FIXED_UNUSED: TStringField;
    Aqd64EDI_FLAG_CREDIT_MEMO: TSmallintField;
    Aqd64warehouse_ptr: TIntegerField;
    Aqd64abbrname15: TStringField;
    N16: TMenuItem;
    Aqd64FED_TAX_ID_NO: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);        
  public
    { Public declarations }
  end;

var
  Form_sotool: TForm_sotool;

implementation

uses damo, main;

{$R *.dfm}
procedure TForm_sotool.NewGridWnd(var Message: TMessage);
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

procedure TForm_sotool.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
 showmessage(aqd64.CommandText);
if (key=13) and (not aqd64.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm_sotool.DBGrid1DblClick(Sender: TObject);
begin
if not aqd64.IsEmpty then modalresult:=mrok;
end;

procedure TForm_sotool.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  aqd64.Filter :=field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  aqd64.filter:='';

 if aqd64.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TForm_sotool.FormCreate(Sender: TObject);
begin
 field_name := 'SALES_ORDER';
 dtpk1.Date := form1.sys_sortdate-dayof(form1.sys_sortdate)+1;
 dtpk2.Date := form1.sys_sortdate;

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_sotool.dtpk1CloseUp(Sender: TObject);
begin
 aqd64.Close;
 aqd64.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
 aqd64.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date;
 aqd64.Open;
 if aqd64.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true; 
end;

procedure TForm_sotool.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>aqd64.IndexFieldNames) then
 aqd64.IndexFieldNames:=column.FieldName;

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
procedure TForm_sotool.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_sotool.N1Click(Sender: TObject);
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
    dbgrid1.Columns[i].Visible := false;
    break;
   end;
 end;
end;

procedure TForm_sotool.FormShow(Sender: TObject);

begin
 aqd64.Close;
 aqd64.Parameters.ParamByName('dtpk1').Value := dtpk1.Date;
 aqd64.Parameters.ParamByName('dtpk2').Value := dtpk2.Date;
 aqd64.Open;
 Aqd62.Open;
if aqd64.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;

end;

end.
