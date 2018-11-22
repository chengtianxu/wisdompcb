unit USelEMP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGrids, StdCtrls, DBGridEh,dateutils;

type
  TFrmSelEmp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ds: TDataSource;
    btn_OK: TButton;
    btn_cancel: TButton;
    lbl_field: TLabel;
    edt_value: TEdit;
    dgh_emp: TDBGridEh;
    qry_SelEmp: TADOQuery;
    qry_SelEmpsel: TBooleanField;
    qry_SelEmprkey: TAutoIncField;
    qry_SelEmpemployeecode: TWideStringField;
    qry_SelEmpchineseName: TWideStringField;
    qry_SelEmpdepartmentName: TWideStringField;
    qry_SelEmpondutytime: TDateTimeField;
    qry_SelEmpoutdutytime: TDateTimeField;
    ckb_all: TCheckBox;
    Label1: TLabel;
    wdstrngfld_SelEmpAccountname: TWideStringField;
    procedure dgh_empTitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckb_allClick(Sender: TObject);
  private
    { Private declarations }
     field_name :  string;
    PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmSelEmp: TFrmSelEmp;

implementation
         uses udm,common, UAdd;
{$R *.dfm}

procedure TFrmSelEmp.dgh_empTitleClick(Column: TColumnEh);
begin
 if dgh_emp.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_SelEmp.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_SelEmp.Sort:=Column.FieldName+' DESC';
  end;
  if qry_SelEmp.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ; 
  end else
    edt_value.SetFocus;
end;

procedure TFrmSelEmp.edt_valueChange(Sender: TObject);
begin
  if qry_SelEmp.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if qry_SelEmp.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if dgh_emp.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dgh_emp.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_value.text) + '%'')'
      else if qry_SelEmp.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        qry_SelEmp.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
    end else
       qry_SelEmp.Filter:='';
  end;
   Label1.caption:=inttostr(qry_selemp.recordcount);

end;

procedure TFrmSelEmp.btn_cancelClick(Sender: TObject);
begin
close;
end;

procedure TFrmSelEmp.FormShow(Sender: TObject);
var
  enddate:  tdatetime;
begin
 //if not qry_selemp.active then  qry_selemp.open;

 enddate:= endofthemonth(strtodate(FrmAdd.cbb_ym.text+'-01'));
   //showmessage(datetostr(enddate));
  with qry_selemp do
  begin
   close;
   parameters[0].Value:= strtodate(FrmAdd.cbb_ym.text+'-01');
   parameters[1].value:= enddate;
   open;
  end;

 Label1.caption:=inttostr(qry_selemp.recordcount);

 field_name:= dgh_emp.Columns[1].FieldName;
 self.PreColumn:=dgh_emp.Columns[1];
 dgh_emp.Columns[1].Title.Color:=clRed;
 dgh_emp.Columns[1].Title.SortMarker:=smUpEh;
 qry_SelEmp.Sort:=dgh_emp.Columns[1].FieldName;

end;



procedure TFrmSelEmp.ckb_allClick(Sender: TObject);
begin
   if  ckb_all.Checked then 
   begin
 qry_SelEmp.First;
 qry_SelEmp.DisableControls;
 while not qry_SelEmp.Eof do
 begin
  qry_SelEmp.edit;
  qry_SelEmp.FieldByName('sel').value:=1;
  qry_SelEmp.Post;
  qry_SelEmp.Next;
 end;
    qry_SelEmp.EnableControls;
  end
  else
   begin
   qry_SelEmp.First;
   qry_SelEmp.DisableControls;
   while not qry_SelEmp.Eof do
   begin
    qry_SelEmp.edit;
    qry_SelEmp.FieldByName('sel').value:=0;
    qry_SelEmp.Post;
    qry_SelEmp.Next;
   end;
    qry_SelEmp.EnableControls;
  end
end;

end.
