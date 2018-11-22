unit Frm_Prod;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, DBGridEh, ExtCtrls, Grids;

type
  TProd_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Grd1: TDBGridEh;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Grd1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
  public
    // class function Init: boolean;
    { Public declarations }
  end;

var
  Prod_Form: TProd_Form;

implementation

 uses DM_u;

{$R *.dfm}

procedure TProd_Form.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO492.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO492.Sort:=Column.FieldName+' DESC';
  end;
  //DM.ADO492AfterScroll(DM.ADO492);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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

procedure TProd_Form.Edit1Change(Sender: TObject);
begin
if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TProd_Form.FormShow(Sender: TObject);
begin
    DM.ADO492.Open;
    Grd1TitleClick(PreColumn);
end;

procedure TProd_Form.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.ADO492.SQL.Text);
end;

procedure TProd_Form.FormCreate(Sender: TObject);
begin
          field_name := Grd1.Columns[0].FieldName;
          PreColumn := Grd1.Columns[0];
          Grd1.Columns[0].Title.Color := clred ;
end;

procedure TProd_Form.Grd1DblClick(Sender: TObject);
begin
    BitBtn1Click(Sender);
end;

procedure TProd_Form.BitBtn1Click(Sender: TObject);
begin
       Prod_Form.ModalResult   :=   mrOK;
end;

end.
