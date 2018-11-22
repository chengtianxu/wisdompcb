unit USelEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TfrmSelEmp = class(TForm)
    pnl1: TPanel;
    eh1: TDBGridEh;
    pnlf: TPanel;
    lbl1: TLabel;
    edt_1: TEdit;
    pnl3: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    btn_SelAll: TButton;
    ds1: TDataSource;
    qry1: TADOQuery;
    qry1IsSelected: TBooleanField;
    atncfldqry1rkey: TAutoIncField;
    wdstrngfldqry1employeeCode: TWideStringField;
    wdstrngfldqry1chinesename: TWideStringField;
    wdstrngfldqry1departmentName: TWideStringField;
    wdstrngfldqry1item: TWideStringField;
    intgrfldqry1station: TIntegerField;
    intgrfldqry1departmentid: TIntegerField;
    procedure eh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure btn_SelAllClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PreColumn : TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  frmSelEmp: TfrmSelEmp;

implementation

{$R *.dfm}

procedure TfrmSelEmp.eh1TitleClick(Column: TColumnEh);
begin
  if eh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry1.Sort:=Column.FieldName+' DESC';
  end;
  if eh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;   
    if (PreColumn.FieldName <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
    Field_Name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
   PreColumn := column ;
   // edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TfrmSelEmp.edt_1Change(Sender: TObject);
begin
  eh1.DataSource.DataSet.Filtered := false;
  if eh1.DataSource.DataSet.FieldByName(Field_Name).FieldKind = fkCalculated then  exit;
  if eh1.DataSource.DataSet.FieldByName(Field_Name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if eh1.DataSource.DataSet.FieldByName(Field_Name).DataType in  [ftString, ftWideString]  then
          begin
            eh1.DataSource.DataSet.Filter:=' (' +  Field_Name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if eh1.DataSource.DataSet.FieldByName(Field_Name).DataType in  [ftSmallint, ftInteger]  then
          begin
            eh1.DataSource.DataSet.Filter:=' (' + Field_Name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      eh1.DataSource.DataSet.Filter:='';
  end;
  eh1.DataSource.DataSet.Filtered := true;
end;

procedure TfrmSelEmp.btn_SelAllClick(Sender: TObject);
begin
  if  not qry1.Active then qry1.Open;
  qry1.First;
  while not qry1.Eof do
  begin
   qry1.Edit;
   qry1.FieldByName('IsSelected').Value:=1;
   qry1.post;
   qry1.Next;
  end;
end;

procedure TfrmSelEmp.btnCancelClick(Sender: TObject);
begin
close;
end;

procedure TfrmSelEmp.FormShow(Sender: TObject);
begin
 PreColumn:=eh1.Columns[1];
 PreColumn.Title.Color:=clRed;
 field_name:=PreColumn.fieldname;
end;

end.
