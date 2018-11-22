unit UOldInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGridEh, StdCtrls;

type
  TfrmOldInfo = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    eh1: TDBGridEh;
    ds1: TDataSource;
    qry1: TADOQuery;
    lbl_field: TLabel;
    edt_value: TEdit;
    wdstrngfldqry1employeecode: TWideStringField;
    wdstrngfldqry1chinesename: TWideStringField;
    strngfldqry1company: TStringField;
    dtmfldqry1ondutytime: TDateTimeField;
    dtmfldqry1alterdate: TDateTimeField;
    wdstrngfldqry1item: TWideStringField;
    lbl1: TLabel;
    qry1hire: TStringField;
    wdstrngfldqry1reason: TWideStringField;
    procedure eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
  private
    { Private declarations }
    Field_Name :string;
    PreColumn: TColumnEh;
  public
    { Public declarations }
   // FIDCard:string;
    procedure getdata(AIDcard:string);
  end;

var
  frmOldInfo: TfrmOldInfo;

implementation
    uses udm,common;
{$R *.dfm}

procedure TfrmOldInfo.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(qry1.SQL.Text);
end;

procedure TfrmOldInfo.eh1TitleClick(Column: TColumnEh);
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
  
  if (Field_Name<> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    Field_Name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edt_value.SetFocus;
end;

procedure TfrmOldInfo.FormShow(Sender: TObject);
begin
 Field_Name:=eh1.Columns[0].FieldName;
 PreColumn:=eh1.Columns[0];
 eh1.Columns[0].Title.Color:=clRed;
end;

procedure TfrmOldInfo.edt_valueChange(Sender: TObject);
begin
  qry1.Filtered:=false;
  if qry1.FieldByName(Field_Name).FieldKind = fkCalculated then  exit;
  if qry1.FieldByName(Field_Name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry1.FieldByName(Field_Name).DataType in  [ftString, ftWideString]  then
        qry1.Filter:=Field_Name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry1.FieldByName(Field_Name).DataType in  [ftSmallint, ftInteger]  then
        qry1.Filter:= Field_Name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry1.Filter:='';
  end;
  qry1.Filtered:=true;
end;

procedure TfrmOldInfo.getdata(AIDcard: string);
begin
 qry1.Close;
 qry1.Parameters[0].Value:=AIDcard;
 qry1.Parameters[1].Value:=AIDcard;
 qry1.Parameters[2].Value:=AIDcard;
 qry1.open;
end;

end.
