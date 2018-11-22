unit Frm_UserSelect_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, Provider, DB, DBClient;

type
  TFrm_UserSelect = class(TForm)
    Grd1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure ClientDataSet1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PreColumn: TColumnEh;
    field_name:string;
  public

  end;

var
  Frm_UserSelect: TFrm_UserSelect;

implementation
 uses DM_u;
{$R *.dfm}

procedure TFrm_UserSelect.FormShow(Sender: TObject);
begin
  field_name := Grd1.Columns[1].FieldName;
  PreColumn := Grd1.Columns[1];
  Grd1.Columns[1].Title.Color := clred ;
end;

procedure TFrm_UserSelect.Edit1Change(Sender: TObject);
begin
  ClientDataSet1.Filtered:=false;
  ClientDataSet1.Filtered:=true;
end;

procedure TFrm_UserSelect.Grd1TitleClick(Column: TColumnEh);
begin
 { if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ClientDataSet1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ClientDataSet1.Sort:=Column.FieldName+' DESC';
  end;
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  }
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_UserSelect.ClientDataSet1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Edit1.Text<>'' then
    Accept:=(Pos(uppercase(Edit1.Text),uppercase(ClientDataSet1.FieldByName(field_name).AsString))>0)
  else
   Accept:=true;
end;


procedure TFrm_UserSelect.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.tmp.SQL.Text);
end;

end.
