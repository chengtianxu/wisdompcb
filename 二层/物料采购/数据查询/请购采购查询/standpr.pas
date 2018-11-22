unit standpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids,ComObj, Excel2000,
  Menus,ClipBrd, DBGridEh;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1PO_REQ_NUMBER: TStringField;
    ADOQuery1DEPARTMENT_NAME: TStringField;
    ADOQuery1REQ_DATE: TDateTimeField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1WAREHOUSE_NAME: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1QUANTITY: TFloatField;
    ADOQuery1CODE: TStringField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1total: TFloatField;
    ADOQuery1v_status: TStringField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1INV_PART_description: TStringField;
    ADOQuery1rkey: TIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOQuery1reason: TStringField;
    ADOQuery1AUTH_DATE: TDateTimeField;
    ADOQuery1ENT_DATE: TDateTimeField;
    ADOQuery1EDITED_DATE: TDateTimeField;
    ADOQuery1tax_PRICE: TFloatField;
    ADOQuery1rohs: TStringField;
    ADOQuery1unit_name: TStringField;
    DBGrid1: TDBGridEh;
    Label3: TLabel;
    Edit3: TEdit;
    ADOQuery1extra_req: TStringField;
    ADOQuery1names: TStringField;
    ADOQuery1note_pad_line_1: TStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumnEh);
    procedure Edit3Change(Sender: TObject);
    
  private
    PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main, auth_info;
{$R *.dfm}

procedure TForm2.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 case adoquery1status.Value of
  1 : adoquery1v_status.Value := '待审批';
  2 : adoquery1v_status.Value := '待采购';
  3 : adoquery1v_status.Value := '已批准';
  4 : adoquery1v_status.Value := '被退回';
  5 : adoquery1v_status.Value := '请购单已撤消';
  6 : adoquery1v_status.Value := '请购单已处理';
  7 : adoquery1v_status.Value := '未提交';
 end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 form1.show;
 close;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm2.N1Click(Sender: TObject);
begin
 try
  form6 := tform6.Create(application);
  form1.ados276.Close;
  form1.ados276.Parameters[1].Value := ADOQuery1rkey.Value;
  form1.ados276.Open;
  form6.ShowModal;
 finally
  form6.Free;
  form1.ados276.Close;
 end;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
  DBGrid1.Columns[0].Title.Color := clred ;
end;

procedure TForm2.DBGrid1TitleClick(Column: TColumnEh);
begin
  if DBGrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADOQuery1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADOQuery1.Sort:=Column.FieldName+' DESC';
  end;

  if DBGrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in
  [ftString,ftWideString] then
  if (field_name <> column.FieldName) then
  begin
    label3.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit3.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit3Change(Edit1);
  end
  else
    edit3.SetFocus;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGrid1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit3.text) <> '' then
    begin
      if DBGrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGrid1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit3.text) + '%'')'
      else if DBGrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGrid1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit3.text,0))+')';
    end else
      DBGrid1.DataSource.DataSet.Filter:='';
  end;
end;

end.
