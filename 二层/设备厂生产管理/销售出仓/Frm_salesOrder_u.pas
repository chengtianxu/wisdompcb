unit Frm_salesOrder_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, DB, StdCtrls, Buttons, ADODB;

type
  TFrm_salesOrder = class(TForm)
    ADO70: TADOQuery;
    ADO70rkey: TAutoIncField;
    ADO70sales_order: TStringField;
    ADO70sales_date: TDateTimeField;
    ADO70customer_ptr: TIntegerField;
    ADO70type: TWordField;
    ADO70status: TWordField;
    ADO70ship_method: TStringField;
    ADO70location: TStringField;
    ADO70SALES_REP_PTR: TIntegerField;
    ADO70ent_date: TDateTimeField;
    ADO70ent_user_ptr: TIntegerField;
    ADO70currency_ptr: TIntegerField;
    ADO70exch_rate: TBCDField;
    ADO70total_amount: TBCDField;
    ADO70entrust_deptptr: TIntegerField;
    ADO70produce_deptptr: TIntegerField;
    ADO70CONTACT_NAME: TStringField;
    ADO70CONT_PHONE: TStringField;
    ADO70TAX_cate: TStringField;
    ADO70pay_method: TStringField;
    ADO70CONF_BY_EMPL_PTR: TIntegerField;
    ADO70CONF_DATE: TDateTimeField;
    ADO70remark: TStringField;
    ADO70CUST_CODE: TStringField;
    ADO70CUSTOMER_NAME: TStringField;
    ADO70ABBR_NAME: TStringField;
    ADO70REP_CODE: TStringField;
    ADO70sales_rep_name: TStringField;
    ADO70EMPL_CODE: TStringField;
    ADO70EMPLOYEE_NAME: TStringField;
    ADO70DEPT_CODE: TStringField;
    ADO70DEPT_NAME: TStringField;
    ADO70CURR_CODE: TStringField;
    ADO70CURR_NAME: TStringField;
    ADO70status_c: TStringField;
    ADO71: TADOQuery;
    ADO71rkey: TAutoIncField;
    ADO71so_ptr: TIntegerField;
    ADO71prod_ptr: TIntegerField;
    ADO71price: TBCDField;
    ADO71tax_rate: TBCDField;
    ADO71complete_date: TDateTimeField;
    ADO71remark: TStringField;
    ADO71PROD_CODE: TStringField;
    ADO71PRODUCT_NAME: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    Edit1: TEdit;
    DS1: TDataSource;
    DS2: TDataSource;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    BitBtn1: TBitBtn;
    ADO70rkey10: TIntegerField;
    ADO71quantity: TFloatField;
    ADO71PARTS_SHIPPED: TFloatField;
    ADO71QTY_PLANED: TFloatField;
    ADO71returen_qty: TFloatField;
    wdstrngfldADO70PO_NO: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure ADO70AfterScroll(DataSet: TDataSet);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1DblClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  Frm_salesOrder: TFrm_salesOrder;

implementation
 uses DM_u;
{$R *.dfm}

procedure TFrm_salesOrder.FormShow(Sender: TObject);
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
end;

procedure TFrm_salesOrder.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADO70.SQL.Text);
end;

procedure TFrm_salesOrder.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADO70.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADO70.Sort:=Column.FieldName+' DESC';
  end;

  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftInteger,ftFloat, ftCurrency, ftBCD,ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_salesOrder.ADO70AfterScroll(DataSet: TDataSet);
begin
  ADO71.Close;
  ADO71.Parameters[0].Value:=ADO70rkey.Value;
  ADO71.Open;
end;

procedure TFrm_salesOrder.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_salesOrder.Grd1DblClick(Sender: TObject);
begin
   if not ADO70.IsEmpty then 
   Self.BitBtn1.Click;
end;

end.
