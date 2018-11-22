unit Frm_Auth_u;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBGridEh, DB, ADODB, Grids;

type
  TFrm_Auth = class(TForm)
    Panel1: TPanel;
    DBGridEh2: TDBGridEh;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DS11: TDataSource;
    DS22: TDataSource;
    ADO94: TADOQuery;
    ADO94CODE: TStringField;
    ADO94PURCHASE_APPROV_DESC: TStringField;
    ADO94DEPT_CODE: TStringField;
    ADO94DEPT_NAME: TStringField;
    ADO94type_c: TStringField;
    ADO94dept_ptr: TIntegerField;
    ADO94type: TWordField;
    ADO94mode: TWordField;
    ADO94RKEY: TAutoIncField;
    ADO275: TADOQuery;
    ADO275USER_LOGIN_NAME: TStringField;
    ADO275USER_FULL_NAME: TStringField;
    ADO275LOWER_LIMIT: TFloatField;
    ADO275UPPER_LIMIT: TFloatField;
    ADO275RKEY: TAutoIncField;
    ADO275AUTH_GROUP_PTR: TIntegerField;
    ADO275USER_PTR: TIntegerField;
    Panel2: TPanel;
    Grd1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    procedure ADO94AfterScroll(DataSet: TDataSet);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Grd1DblClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
  public
    class procedure getAuth(sDept:string;Edt:TEdit;Lab: TLabel);
    { Public declarations }
  end;

var
  Frm_Auth: TFrm_Auth;

implementation
 
{$R *.dfm}

{ TFrm_Auth }



{ TFrm_Auth }

class procedure TFrm_Auth.getAuth(sDept: string; Edt: TEdit; Lab: TLabel);
begin
  with TFrm_Auth.Create(nil) do
  try
    field_name := Grd1.Columns[0].FieldName;
    PreColumn := Grd1.Columns[0];
    Grd1.Columns[0].Title.Color := clred ;
    ADO94.Parameters[0].Value:=sDept;
    ADO94.Open;
    if ADO94.IsEmpty then
     showmessage(sDept+' 此部门未定义材料申领审批流程...')
    else
    if showmodal=mrok then
    begin
      Edt.Text:=ADO94CODE.Value;
      lab.Caption:=ADO94PURCHASE_APPROV_DESC.Value;
      Edt.tag:=ADO94RKEY.Value;
    end;
  finally
    free;
  end;
end;

procedure TFrm_Auth.ADO94AfterScroll(DataSet: TDataSet);
begin
  ADO275.Close;
  ADO275.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO275.Open;
end;

procedure TFrm_Auth.Edit1Change(Sender: TObject);
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

procedure TFrm_Auth.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADO94.SQL.Text);
end;

procedure TFrm_Auth.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADO94.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADO94.Sort:=Column.FieldName+' DESC';
  end;
  ADO94AfterScroll(ADO94);
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

procedure TFrm_Auth.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_Auth.Grd1DblClick(Sender: TObject);
begin
   modalresult:=mrok;
end;

end.
