unit inv_serach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBGridEh;

type
  Tform_inv = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_PART_DESCRIPTION: TStringField;
    ADOQuery1manufacturer_name: TStringField;
    ADOQuery1PREF_SUPPLIER_PTR: TIntegerField;
    ADOQuery1stock_purch: TFloatField;
    ADOQuery1purch_unit_ptr: TIntegerField;
    ADOQuery1AVL_FLAG: TStringField;
    ADOQuery1STOP_PURCH: TStringField;
    DBGridEh1: TDBGridEh;
    ADOQuery1MANUFACTURER_CODE: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1CATALOG_NUM: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  form_inv: Tform_inv;

implementation
uses damo;
{$R *.dfm}

procedure Tform_inv.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
  if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure Tform_inv.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADOQuery1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADOQuery1.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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

procedure Tform_inv.Edit1Change(Sender: TObject);
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

procedure Tform_inv.FormCreate(Sender: TObject);
begin
//  ADOQuery1.Close;
//  ADOQuery1.Open;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

procedure Tform_inv.DBGridEh1DblClick(Sender: TObject);
begin
  if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure Tform_inv.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if adoquery1.IsEmpty then button1.Enabled:=false
  else button1.Enabled:=true;
end;

procedure Tform_inv.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADOQuery1.SQL.Text);
end;

end.
