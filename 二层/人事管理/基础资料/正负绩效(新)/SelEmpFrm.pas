
unit SelEmpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, ComCtrls, Damo, DB,
  ADODB, Provider, DBClient,common, Menus,dateutils;

type
  TFrmSelEmp = class(TForm)
    pnl1: TPanel;
    pnlf: TPanel;
    pnl3: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    lbl1: TLabel;
    edt_1: TEdit;
    ds1: TDataSource;
    qry1: TADOQuery;
    qry1IsSelected: TBooleanField;
    atncfldqry1rkey: TAutoIncField;
    qry1ChineseName: TWideStringField;
    qry1DepartmentName: TWideStringField;
    qry1employeecode: TWideStringField;
    dbgrdh1: TDBGridEh;
    btn_SelAll: TButton;
    procedure edt_1Change(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure btnOKClick(Sender: TObject);
    procedure btn_SelAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  FrmSelEmp: TFrmSelEmp;

implementation

uses EditFrm;

{$R *.dfm}

procedure TFrmSelEmp.edt_1Change(Sender: TObject);
begin
  dbgrdh1.DataSource.DataSet.Filtered := false;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dbgrdh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dbgrdh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      dbgrdh1.DataSource.DataSet.Filter:='';
  end;
  dbgrdh1.DataSource.DataSet.Filtered := true;

end;

procedure TFrmSelEmp.btnCancelClick(Sender: TObject);
begin
    SELF.Close;
end;

procedure TFrmSelEmp.FormCreate(Sender: TObject);
begin
  with qry1 do
  begin
   close;
   parameters[0].Value:=startofthemonth(FrmEdit.DateTimePicker1.date);
   parameters[1].value:= endofthemonth(FrmEdit.DateTimePicker1.date);
   open;

  end;


end;

procedure TFrmSelEmp.dbgrdh1TitleClick(Column: TColumnEh);
begin
    if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
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
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;   
    if (field_name <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
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


procedure TFrmSelEmp.btnOKClick(Sender: TObject);
begin
self.ModalResult := mrok;

end;

procedure TFrmSelEmp.btn_SelAllClick(Sender: TObject);
begin
     // dbgrdh1.Selection.SelectAll;
  if  not qry1.Active then qry1.Open;
  qry1.First;
  while not qry1.Eof do
  begin
   qry1.Edit;
   qry1.FieldByName('IsSelected').Value:=1;
   qry1.post;
   qry1.Next;
  end;
  

end;

procedure TFrmSelEmp.FormShow(Sender: TObject);
begin

 field_name:= dbgrdh1.Columns[1].FieldName;
 dbgrdh1.Columns[1].title.Color:=clred;
    lbl1.Caption := dbgrdh1.Columns[1].Title.Caption;
   PreColumn :=dbgrdh1.Columns[1]
end;

end.
