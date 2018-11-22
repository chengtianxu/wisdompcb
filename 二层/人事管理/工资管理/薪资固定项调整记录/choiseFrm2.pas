unit choiseFrm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, damo, DB;

type
  Tfrmchoise2 = class(TForm)
    DBGridEh1: TDBGridEh;
    edt_1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name: string;
  public
    { Public declarations }
  end;

var
  frmchoise2: Tfrmchoise2;

implementation
uses
  EditFrm;

{$R *.dfm}

procedure Tfrmchoise2.FormCreate(Sender: TObject);
begin
  DM.qrychosieEmp.Close;
  DM.qrychosieEmp.SQL.Clear;
  DM.qrychosieEmp.SQL.Text := 'select employeemsg.rkey, employeemsg.employeecode, employeemsg.chinesename, '
    + ' datadepartment.departmentname,Employeebasicsalary.'
    + DM.ItemField + ' ,datadetail.item,datadetail.train_flag'
    + ' from employeemsg inner join datadepartment '
    + ' on employeemsg.departmentid=datadepartment.rkey '
    + ' inner join dbo.Employeebasicsalary on Employeebasicsalary.employeeid=employeemsg.rkey '
    + ' left join datadetail on employeemsg.position=datadetail.rkey'
    + ' where status=1 and wagetype=' + IntToStr(DM.AccountRkey);
  DM.qrychosieEmp.Open;
end;

procedure Tfrmchoise2.DBGridEh1DblClick(Sender: TObject);
begin
  self.ModalResult := mrOk;
end;

procedure Tfrmchoise2.FormShow(Sender: TObject);
begin
  Self.Left := EditFrm.FrmEdit.Left + EditFrm.FrmEdit.StringGrid1.ColWidths[0] + 4;
  Self.Top := EditFrm.FrmEdit.Top + EditFrm.FrmEdit.Panel1.Top
    + EditFrm.FrmEdit.Panel1.Height
    + (EditFrm.FrmEdit.StringGrid1.RowHeights[0]) * (EditFrm.FrmEdit.StringGrid1.Row + 1) + 4;
  DBGridEh1.SelectedRows.CurrentRowSelected := False;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;    
end;

procedure Tfrmchoise2.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qrychosieEmp.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qrychosieEmp.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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

procedure Tfrmchoise2.edt_1Change(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure Tfrmchoise2.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    DBGridEh1.OnDblClick(DBGridEh1);
end;

end.
