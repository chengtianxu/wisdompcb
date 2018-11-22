unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, ADODB, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm_main = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1CUSTOMER_NAME: TStringField;
    ADOQuery1invoice_number: TStringField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1EXCHANGE_RATE: TFloatField;
    ADOQuery1POSTED_DATE: TDateTimeField;
    ADOQuery1INVOICE_DATE: TDateTimeField;
    ADOQuery1INVOICE_TOTAL: TBCDField;
    ADOQuery1amount_paid: TBCDField;
    ADOQuery1amt_payable: TBCDField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1LAYERS: TWordField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1ANALYSIS_CODE_1: TStringField;
    ADOQuery1unit_sq: TFloatField;
    ADOQuery1delivery_no: TStringField;
    ADOQuery1SALES_ORDER: TStringField;
    ADOQuery1DATE_SHIPPED: TDateTimeField;
    ADOQuery1quan_shipped: TBCDField;
    ADOQuery1QUANTITY: TIntegerField;
    ADOQuery1PARTS_ALLOC: TFloatField;
    ADOQuery1TAX_2: TBCDField;
    ADOQuery1RUSH_CHARGE: TBCDField;
    ADOQuery1cost_2: TFloatField;
    ADOQuery1invoicetype: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    PopupMenu2: TPopupMenu;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1abbrname15: TStringField;
    ADOQuery1abbrname23: TStringField;
    ADOQuery1Amount: TFloatField;
    ADOQuery1MISC_INV_DESCRIPTION: TStringField;
    ADOQuery1ORIG_CUSTOMER: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
   sql_text: WideString;
   PreColumn: TColumnEh;
   procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation
   uses common, contion;
{$R *.dfm}
procedure TForm_main.item_click(sender:TObject);
var i:byte;
begin
 (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
 if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
 else begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm_main.BitBtn4Click(Sender: TObject);
begin
if not ADOQuery1.IsEmpty then
Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm_main.BitBtn6Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
close;
application.Terminate;
end;

procedure TForm_main.FormShow(Sender: TObject);
var
  i:Integer;
    item:TMenuItem;
begin
  PreColumn := DBGridEh1.Columns[0];
  sql_text:=ADOQuery1.SQL.Text;
  for i:=1 to DBGridEh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;
    if DBGridEh1.Columns[i-1].Visible then
      item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
  end;
end;

procedure TForm_main.BtQryClick(Sender: TObject);
var
   i:byte;
begin

if Form_contion.ShowModal=mrok then
begin
  Screen.Cursor:= crSQLWait;
  try
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:=sql_text;
    ADOQuery1.SQL.Delete(27);
    ADOQuery1.SQL.Insert(27,'WHERE (dbo.DATA0163.HEADER_PTR = '+inttostr(Form_contion.Edit1.Tag)+')');
    ADOQuery1.SQL.Delete(58);
    ADOQuery1.SQL.Insert(58,'WHERE (dbo.DATA0163.HEADER_PTR = '+inttostr(Form_contion.Edit1.Tag)+')');
    ADOQuery1.SQL.Delete(88);
    ADOQuery1.SQL.Insert(88,'WHERE (dbo.DATA0163.HEADER_PTR = '+inttostr(Form_contion.Edit1.Tag)+')');
    ADOQuery1.SQL.Delete(104);
    ADOQuery1.SQL.Insert(104,'WHERE (dbo.DATA0163.HEADER_PTR = '+inttostr(Form_contion.Edit1.Tag)+')');
    for i:=1 to Form_contion.SGrid1.RowCount-2 do
     ADOQuery1.SQL.Add(Form_contion.SGrid1.Cells[2,i]);
    ADOQuery1.Prepared;
    ADOQuery1.Open;
    ADOQuery1.Sort:=PreColumn.FieldName;
  finally
    Screen.Cursor:= crDefault;
  end;
end;
end;

procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if not ADOQuery1.Active then Exit;
  if Column.FieldName = 'Amount' then Exit;  //计算字段
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ADOQuery1.Sort:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   ADOQuery1.Sort:=Column.FieldName+' DESC';
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
  else edit1.SetFocus;
end;

procedure TForm_main.Edit1Change(Sender: TObject);
begin
if ADOQuery1.Active then
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADOQuery1.SQL.Text);
end;

procedure TForm_main.FormActivate(Sender: TObject);
begin
 BtQryClick(sender);
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
  if not app_init(ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
 self.Caption:=application.Title;

 // user_ptr:='3';
 // vprev:='2';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm_main.ADOQuery1CalcFields(DataSet: TDataSet);
begin
  ADOQuery1.FieldByName('Amount').AsCurrency:=
    ADOQuery1.FieldByName('RUSH_CHARGE').AsCurrency/(1+ADOQuery1.FieldByName('TAX_2').AsCurrency*0.01);
end;

end.
