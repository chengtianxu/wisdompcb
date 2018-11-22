unit SelTClass2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TfrmSelTClass2 = class(TForm)
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
    strngfldqry1CCode: TStringField;
    strngfldqry1Cname: TStringField;
    procedure btnCancelClick(Sender: TObject);
    procedure btn_SelAllClick(Sender: TObject);
    procedure edt_1Change(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
      PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  frmSelTClass2: TfrmSelTClass2;

implementation
   uses UDM;
{$R *.dfm}

procedure TfrmSelTClass2.btnCancelClick(Sender: TObject);
begin
close;
end;

procedure TfrmSelTClass2.btn_SelAllClick(Sender: TObject);
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

procedure TfrmSelTClass2.edt_1Change(Sender: TObject);
begin
  eh1.DataSource.DataSet.Filtered := false;
  if eh1.DataSource.DataSet.FieldByName(PreColumn.FieldName).FieldKind = fkCalculated then  exit;
  if eh1.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if eh1.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in  [ftString, ftWideString]  then
          begin
            eh1.DataSource.DataSet.Filter:=' (' +  PreColumn.FieldName + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if eh1.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in  [ftSmallint, ftInteger]  then
          begin
            eh1.DataSource.DataSet.Filter:=' (' + PreColumn.FieldName+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      eh1.DataSource.DataSet.Filter:='';
  end;
  eh1.DataSource.DataSet.Filtered := true;
end;

procedure TfrmSelTClass2.eh1TitleClick(Column: TColumnEh);
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
    PreColumn.FieldName := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
   PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TfrmSelTClass2.FormShow(Sender: TObject);
begin
PreColumn:=eh1.Columns[1];
PreColumn.Title.Color:=clRed;

end;

end.
