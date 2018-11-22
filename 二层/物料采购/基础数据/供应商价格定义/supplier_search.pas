unit supplier_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls, DBGridEh;

type
  TForm_supp = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADODataSet;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1CODE: TStringField;
    ADOQuery1SUPPLIER_NAME: TStringField;
    ADOQuery1supper_status: TStringField;
    ADOQuery1currency_ptr: TIntegerField;
    DBGridEh1: TDBGridEh;
    ADOQuery1ABBR_NAME: TStringField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_supp: TForm_supp;

implementation
 uses damo;
{$R *.dfm}

procedure TForm_supp.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if adoquery1.IsEmpty then button1.Enabled:=false
  else button1.Enabled:=true;
end;

procedure TForm_supp.DBGridEh1DblClick(Sender: TObject);
begin
  if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_supp.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
  if (chr(key)='S') and (ssalt in shift) then showmessage(adoquery1.CommandText);
end;

procedure TForm_supp.DBGridEh1TitleClick(Column: TColumnEh);
begin
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
    PreColumn := column;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TForm_supp.Edit1Change(Sender: TObject);
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

procedure TForm_supp.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Open;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

end.
