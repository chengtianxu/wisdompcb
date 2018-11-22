unit Frm_order_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TFrm_order = class(TForm)
    DBGridEh1: TDBGridEh;
    ADO70: TADOQuery;
    DataSource1: TDataSource;
    ADO70sales_order: TStringField;
    ADO70sales_date: TDateTimeField;
    ADO70ABBR_NAME: TStringField;
    ADO70complete_date: TDateTimeField;
    ADO70remark: TStringField;
    ADO70CONTACT_NAME: TStringField;
    ADO70CONT_PHONE: TStringField;
    ADO70status_c: TStringField;
    ADO70status: TWordField;
    Panel1: TPanel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    ADO70prod_ptr: TIntegerField;
    ADO70PROD_CODE: TStringField;
    ADO70PRODUCT_NAME: TStringField;
    ADO70DEPT_CODE: TStringField;
    ADO70DEPT_NAME: TStringField;
    BitBtn2: TBitBtn;
    ADO70cust_code: TStringField;
    ADO70unit_name: TStringField;
    ADO70PRODUCT_DESC: TStringField;
    ADO70quantity: TFloatField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsSearch:string;
  public
    procedure init(sSql:string);
  end;

var
  Frm_order: TFrm_order;

implementation
 uses DM_u,common;
{$R *.dfm}

{ TFrm_order }

procedure TFrm_order.init(sSql: string);
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;

  ADO70.SQL.Text:=ADO70.SQL.Text+sSql;
  ADO70.Open;
end;

procedure TFrm_order.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(ADO70.SQL.Text);
end;

procedure TFrm_order.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
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

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_order.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_order.BitBtn2Click(Sender: TObject);
begin
  if not ADO70.IsEmpty then
    Export_dbGridEH_to_Excel(DBGridEh1,'¶©µ¥Ã÷Ï¸');
end;

end.
