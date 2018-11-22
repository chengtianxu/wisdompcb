unit micpo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000,ClipBrd,
  DBGridEh;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1PO_DATE: TDateTimeField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1CODE: TStringField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1DESCRIPTION: TStringField;
    ADOQuery1DESCRIPTION2: TStringField;
    ADOQuery1QUAN_ORD: TFloatField;
    ADOQuery1total: TFloatField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1v_status: TStringField;
    ADOQuery1gui_ge: TStringField;
    ADOQuery1quantity_received: TFloatField;
    ADOQuery1no_recd: TFloatField;
    ADOQuery1DATE_EDITED: TDateTimeField;
    ADOQuery1EXPIRED_DATE: TDateTimeField;
    ADOQuery1del_date: TDateTimeField;
    ADOQuery1recd_date: TDateTimeField;
    ADOQuery1tax_PRICE: TFloatField;
    ADOQuery1rohs: TStringField;
    ADOQuery1wh_abb_name: TStringField;
    DBGrid1: TDBGridEh;
    Label3: TLabel;
    Edit3: TEdit;
    ADOQuery1reason: TStringField;
    ADOQuery1UNIT_PRICE: TFloatField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1PO_REQ_NUMBER: TStringField;
    ADOQuery1req_employeename: TStringField;
    ADOQuery1DEPARTMENT_NAME: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
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
  Form5: TForm5;

implementation
 uses main;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
 form1.show;
 close;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.show;
end;

procedure TForm5.Button2Click(Sender: TObject);

 begin
form1.CopyDbDataToExcel([dbgrid1],self.Caption);
 end;

procedure TForm5.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 case adoquery1status.Value of
  1: adoquery1v_status.Value := '待审核';
  2: adoquery1v_status.Value := '被退回';
  3: adoquery1v_status.Value := '已保留';
  4: adoquery1v_status.Value := '已暂缓';
  5: adoquery1v_status.Value := '已审核';
  6: adoquery1v_status.Value := '已收货';
  7: adoquery1v_status.Value := '已完成';
  8: adoquery1v_status.Value := '未提交';
 end;
end;

procedure TForm5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
//  DBGrid1.Columns[0].Title.Color := clred ;
end;

procedure TForm5.DBGrid1TitleClick(Column: TColumnEh);
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

  if DBGrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftInteger,ftFloat,ftCurrency, ftBCD,ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label3.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit3.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit3Change(Edit1);
  end else
    edit3.SetFocus;
end;

procedure TForm5.Edit3Change(Sender: TObject);
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
