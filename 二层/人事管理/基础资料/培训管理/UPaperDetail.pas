unit UPaperDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB,common;

type
  TfrmPaperDetail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btnExit: TBitBtn;
    btn_export3: TBitBtn;
    lbl_field: TLabel;
    edt_value: TEdit;
    ehPaper: TDBGridEh;
    ds1: TDataSource;
    qry1: TADOQuery;
    btn_refresh3: TBitBtn;
    procedure btnExitClick(Sender: TObject);
    procedure btn_export3Click(Sender: TObject);
    procedure ehPaperTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
  private
    { Private declarations }
     PreColumn : TColumnEh;
     FieldName :string;
  public
    { Public declarations }
  end;

var
  frmPaperDetail: TfrmPaperDetail;

implementation
   uses udm;
{$R *.dfm}

procedure TfrmPaperDetail.btnExitClick(Sender: TObject);
begin
close;
end;

procedure TfrmPaperDetail.btn_export3Click(Sender: TObject);
begin
  if qry1.IsEmpty then exit;
 common.Export_dbGridEH_to_Excel(ehPaper,' ‘Ã‚√˜œ∏');
end;

procedure TfrmPaperDetail.ehPaperTitleClick(Column: TColumnEh);
begin
if qry1.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
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

  if qry1.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (FieldName <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    FieldName := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edt_value.SetFocus;
end;

procedure TfrmPaperDetail.FormShow(Sender: TObject);
begin
    preColumn:=ehPaper.columns[0];
    PreColumn.Title.Color:=clRed;
    FieldName:=PreColumn.FieldName;
end;

procedure TfrmPaperDetail.edt_valueChange(Sender: TObject);
begin
  qry1.Filtered:=false;
  if qry1.FieldByName(FieldName).FieldKind = fkCalculated then  exit;
  if qry1.FieldByName(FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry1.FieldByName(FieldName).DataType in  [ftString, ftWideString]  then
        qry1.Filter:=FieldName + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry1.FieldByName(FieldName).DataType in  [ftSmallint, ftInteger]  then
        qry1.Filter:= FieldName+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry1.Filter:='';
  end;
  qry1.Filtered:=true;
end;

end.
