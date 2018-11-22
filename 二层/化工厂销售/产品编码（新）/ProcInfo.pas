unit ProcInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DM_u, DBGridEh, ADODB, DB;

type
  TFrmProInfo = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    edt_1: TEdit;
    label1: TLabel;
    dgh_grd1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  FrmProInfo: TFrmProInfo;

implementation

{$R *.dfm}

procedure TFrmProInfo.FormShow(Sender: TObject);
begin
  DM.ADO492.Close;
  DM.ADO492.Parameters[0].Value := DM.D08.FieldValues['PROD_CODE'];
  DM.ADO492.Open;
  DM.ADS468.Close;
  DM.ADS468.Parameters[0].Value := DM.ADO492.FieldValues['CUT_NO'];
  DM.ADS468.Parameters[1].Value := DM.ADO492.FieldValues['CUT_NO'];
  DM.ADS468.Open;
  field_name := dgh_grd1.Columns[0].FieldName;
  PreColumn := dgh_grd1.Columns[0];
  dgh_grd1.Columns[0].Title.Color := clred ;
  label1.Caption := dgh_grd1.Columns[0].Title.Caption;
end;

procedure TFrmProInfo.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmProInfo.dgh_grd1TitleClick(Column: TColumnEh);
begin
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADS468.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADS468.Sort:=Column.FieldName+' DESC';
  end;
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TFrmProInfo.edt_1Change(Sender: TObject);
begin
  //if dgh_grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      dgh_grd1.DataSource.DataSet.Filter:='';
  end;
end;

end.
