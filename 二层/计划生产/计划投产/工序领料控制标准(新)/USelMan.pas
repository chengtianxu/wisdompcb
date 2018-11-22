unit USelMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TFrmSelMan = class(TForm)
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
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
      field_name  :  string;
      PreColumn : TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmSelMan: TFrmSelMan;

implementation

uses UDM;

{$R *.dfm}

procedure TFrmSelMan.FormCreate(Sender: TObject);
begin

 //if not dm.qry_selman.Active then DM.qry_selman.open;

  if   dm.qry_selman.Active then dm.qry_selman.close;
     dm.qry_selman.open;
 
end;

procedure TFrmSelMan.btnCancelClick(Sender: TObject);
begin
close;
end;

procedure TFrmSelMan.FormShow(Sender: TObject);
begin
field_name:= dbgrdh1.columns[1].fieldname;
PreColumn:=dbgrdh1.columns[1];
dbgrdh1.columns[1].title.Color:=clRed;
dbgrdh1.columns[1].Title.SortMarker:=smUpEh;

end;

procedure TFrmSelMan.dbgrdh1TitleClick(Column: TColumnEh);
begin

if dm.qry_selMan.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry_selMan.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry_selMan.Sort:=Column.FieldName+' DESC';
  end;

  if DM.qry_selMan.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
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

procedure TFrmSelMan.edt_valueChange(Sender: TObject);
begin
    if trim(edt_value.text)=''  then
     begin
      dm.qry_SelMateriel.Filtered:=false;
       exit;
     end;



 dm.qry_SelMan.Filtered:=false;
  if dm.qry_SelMan.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dm.qry_SelMan.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftFloat]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if dm.qry_SelMan.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dm.qry_SelMan.Filter:=field_name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if dm.qry_SelMan.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dm.qry_SelMan.Filter:=  field_name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       dm.qry_SelMan.Filter:='';
  end;

  dm.qry_SelMan.Filtered:=true;
  
    //  if trim(edt_value.text)=''  then    dm.qry_SelMateriel.Filtered:=false;
end;

procedure TFrmSelMan.btnOKClick(Sender: TObject);
begin
// dm.qry_SelMan.Filtered:=false;
//    ModalResult:=mrOk;
end;

end.
