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
    lbl1: TLabel;
    edt_value: TEdit;
    pnl3: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    btn_SelAll: TButton;
    ds1: TDataSource;
    procedure btn_SelAllClick(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
  private
     field_name:string;
    PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmSelProcess: TFrmSelProcess;

implementation
        uses UDM;
{$R *.dfm}

procedure TFrmSelProcess.btn_SelAllClick(Sender: TObject);
begin
  if  not dm.qry1.Active then dm.qry1.Open;
  dm.qry1.First;
  while not dm.qry1.Eof do
  begin
   dm.qry1.Edit;
   dm.qry1.FieldByName('IsSelected').Value:=1;
   dm.qry1.post;
   dm.qry1.Next;
  end;
end;

procedure TFrmSelProcess.dbgrdh1TitleClick(Column: TColumnEh);
begin
 if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.qry1.Sort:=Column.FieldName+' DESC';
  end;
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
    if (field_name <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
   PreColumn := column ;
    edt_valueChange(edt_value);
  end
  else
    edt_value.SetFocus;
end;

procedure TFrmSelProcess.FormShow(Sender: TObject);
begin
 

 field_name:= dbgrdh1.Columns[1].FieldName;
 dbgrdh1.Columns[1].title.Color:=clred;
 lbl1.Caption := dbgrdh1.Columns[1].Title.Caption;
  PreColumn :=dbgrdh1.Columns[1]
end;

procedure TFrmSelProcess.btnCancelClick(Sender: TObject);
begin
close;
end;

procedure TFrmSelProcess.FormCreate(Sender: TObject);
begin
 if not dm.qry1.Active  then dm.qry1.Open;
 //showmessage(qry1.sql.text);
end;

procedure TFrmSelProcess.edt_valueChange(Sender: TObject);
begin
 dbgrdh1.DataSource.DataSet.Filtered := false;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
      begin
        if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dbgrdh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_value.text) + '%'')' ;
          end
        else
          if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dbgrdh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
          end;
      end
    else
      dbgrdh1.DataSource.DataSet.Filter:='';
  end;
  dbgrdh1.DataSource.DataSet.Filtered := true;
  
end;

end.
