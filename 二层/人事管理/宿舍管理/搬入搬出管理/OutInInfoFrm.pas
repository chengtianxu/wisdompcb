unit OutInInfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB,
  ComCtrls, Menus, DM, common, IniFiles;

type
  TFrmOutInInfo = class(TForm)
    dgh_grd1: TDBGridEh;
    label1: TLabel;
    edt_1: TEdit;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    tagg: Integer;
  public
    { Public declarations }
  end;

var
  FrmOutInInfo: TFrmOutInInfo;

implementation

{$R *.dfm}

procedure TFrmOutInInfo.dgh_grd1TitleClick(Column: TColumnEh);
begin
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry4.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry4.Sort:=Column.FieldName+' DESC';
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

procedure TFrmOutInInfo.edt_1Change(Sender: TObject);
begin
  if dgh_grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
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

procedure TFrmOutInInfo.FormShow(Sender: TObject);
begin
  damo.qry4.Close;
  damo.qry4.Open;
  dgh_grd1.DataSource.DataSet.Filtered := True;
  field_name := dgh_grd1.Columns[0].FieldName;
  PreColumn := dgh_grd1.Columns[0];
  dgh_grd1.Columns[0].Title.Color := clred ;
  label1.Caption := dgh_grd1.Columns[0].Title.Caption;
  tagg := 1;
end;

procedure TFrmOutInInfo.bbt_1Click(Sender: TObject);
begin
  tagg := 0;
  Close;
end;

procedure TFrmOutInInfo.bbt_2Click(Sender: TObject);
begin
  tagg := 1;
  Close;
end;

procedure TFrmOutInInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tagg = 0 then
  damo.AddTag := 0
  else
  damo.AddTag := 1;
end;

end.
