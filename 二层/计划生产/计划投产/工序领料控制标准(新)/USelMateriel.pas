unit USelMateriel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Grids, DBGridEh, ExtCtrls;

type
  TFrmSelMateriel = class(TForm)
    pnl1: TPanel;
    dbgrdh1: TDBGridEh;
    pnlf: TPanel;
    lbl_field: TLabel;
    edt_value: TEdit;
    pnl3: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    ds1: TDataSource;
    chk_all: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure chk_allClick(Sender: TObject);
  private
    { Private declarations }
      field_name  :  string;
    PreColumn : TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmSelMateriel: TFrmSelMateriel;

implementation
          uses UDM;
{$R *.dfm}

procedure TFrmSelMateriel.FormCreate(Sender: TObject);
begin
 //if not dm.qry_selmateriel.Active then DM.qry_selmateriel.open;
//  if   dm.qry_selmateriel.Active then dm.qry_selmateriel.close;
//     dm.qry_selmateriel.open;
    //dm.qry_SelMateriel.Filtered:=false;

end;

procedure TFrmSelMateriel.btnCancelClick(Sender: TObject);
begin
close
end;

procedure TFrmSelMateriel.FormShow(Sender: TObject);
begin
 field_name:= dbgrdh1.columns[1].fieldname;
PreColumn:=dbgrdh1.columns[1];
dbgrdh1.columns[1].title.Color:=clRed;
 dbgrdh1.columns[1].Title.SortMarker:=smUpEh;

end;

procedure TFrmSelMateriel.dbgrdh1TitleClick(Column: TColumnEh);
begin

if DM.qry_SelMateriel.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry_SelMateriel.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry_SelMateriel.Sort:=Column.FieldName+' DESC';
  end;

  if DM.qry_SelMateriel.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
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

procedure TFrmSelMateriel.edt_valueChange(Sender: TObject);
begin
    if trim(edt_value.text)=''  then
     begin
      dm.qry_SelMateriel.Filtered:=false;
       exit;
      end;

            dm.qry_SelMateriel.Filtered:=false;
  if dm.qry_SelMateriel.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dm.qry_SelMateriel.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftFloat]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if dm.qry_SelMateriel.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dm.qry_SelMateriel.Filter:=field_name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if dm.qry_SelMateriel.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dm.qry_SelMateriel.Filter:=  field_name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       dm.qry_SelMateriel.Filter:='';
  end;

  dm.qry_SelMateriel.Filtered:=true;


end;

procedure TFrmSelMateriel.btnOKClick(Sender: TObject);
begin
//    dm.qry_SelMateriel.Filtered:=false;
//    ModalResult:=mrOk;
end;

procedure TFrmSelMateriel.chk_allClick(Sender: TObject);
begin
   if  chk_all.Checked then
   begin
   dm.qry_SelMateriel.First;
   dm.qry_SelMateriel.DisableControls;
   while not dm.qry_SelMateriel.Eof do
   begin
    dm.qry_SelMateriel.edit;
    dm.qry_SelMateriel.FieldByName('IsSelected').value:=1;
    dm.qry_SelMateriel.Post;
    dm.qry_SelMateriel.Next;
   end;
    dm.qry_SelMateriel.EnableControls;
  end
  else
   begin
   dm.qry_SelMateriel.First;
   dm.qry_SelMateriel.DisableControls;
   while not dm.qry_SelMateriel.Eof do
   begin
    dm.qry_SelMateriel.edit;
    dm.qry_SelMateriel.FieldByName('IsSelected').value:=0;
    dm.qry_SelMateriel.Post;
    dm.qry_SelMateriel.Next;
   end;
    dm.qry_SelMateriel.EnableControls;
  end
end;

end.
