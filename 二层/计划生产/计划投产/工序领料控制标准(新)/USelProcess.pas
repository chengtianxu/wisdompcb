unit USelProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TFrmSelProcess = class(TForm)
    pnl1: TPanel;
    dbgrdh1: TDBGridEh;
    pnlf: TPanel;
    lbl_field: TLabel;
    edt_value: TEdit;
    pnl3: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    btn_SelAll: TButton;
    ds1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
  private
    { Private declarations }
      field_name  :  string;
    PreColumn : TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmSelProcess: TFrmSelProcess;

implementation
      uses UDM;
{$R *.dfm}

procedure TFrmSelProcess.FormCreate(Sender: TObject);
begin
// if   dm.qry_selProcess.Active then dm.qry_selprocess.close;        //alter by zsp 2017-03-23
//     dm.qry_selprocess.open;
end;

procedure TFrmSelProcess.dbgrdh1TitleClick(Column: TColumnEh);
begin

if  DM.qry_selProcess.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry_selProcess.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry_selProcess.Sort:=Column.FieldName+' DESC';
  end;

  if DM.qry_selProcess.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edt_value.SetFocus;
end;

procedure TFrmSelProcess.FormShow(Sender: TObject);
begin
 field_name:= dbgrdh1.columns[1].fieldname;
PreColumn:=dbgrdh1.columns[1];
dbgrdh1.columns[1].title.Color:=clRed;
 dbgrdh1.columns[1].Title.SortMarker:=smUpEh;

end;

procedure TFrmSelProcess.edt_valueChange(Sender: TObject);
begin
 dm.qry_selProcess.Filtered:=false;
  if dm.qry_selProcess.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dm.qry_selProcess.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftFloat]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if dm.qry_selProcess.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dm.qry_selProcess.Filter:=field_name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if dm.qry_selProcess.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dm.qry_selProcess.Filter:=  field_name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       dm.qry_selProcess.Filter:='';
  end;

  dm.qry_selProcess.Filtered:=true;
  
      if trim(edt_value.text)=''  then    dm.qry_selProcess.Filtered:=false;
end;

end.
