unit WorkdeptInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, common, ppBands, ppCache, ppClass, ppEndUsr, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppPrnabl, DB, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons;

type
  TFrmWorDept = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    DBGridEh1: TDBGridEh;
    Label2: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    edt_1: TEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, startSQL: string;
  public
    { Public declarations }
  end;

var
  FrmWorDept: TFrmWorDept;

implementation

{$R *.dfm}

procedure TFrmWorDept.FormCreate(Sender: TObject);
begin
  startSQL := damo.qry2.SQL.Text;
  with damo.qryTemp do
  begin
    close;
    SQL.Clear;
    sql.Text:='select (select dateadd(dd,-day(getdate())+1,getdate())) as startdate,  '
      + '(select   dateadd(dd,-day(getdate()),dateadd(m,1,getdate()))) as enddate ';
    open;
    DateTimePicker1.DateTime :=  StrToDateTime(fieldvalues['startdate']);
    DateTimePicker2.DateTime :=  StrToDateTime(fieldvalues['enddate']);
  end;
end;

procedure TFrmWorDept.BitBtn1Click(Sender: TObject);
begin
  damo.qry2.SQL.Text := startSQL;
  Close;
  damo.qry2.Filter:='';
  damo.qry2.Filtered:=False;
  damo.qry2.Close;

end;

procedure TFrmWorDept.FormShow(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
begin
  damo.qry2.Close;
  damo.qry2.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry2.SQL.Text := damo.qry2.SQL.Text + ' group by data0492.cut_no,data0008.prod_code, '
    + 'data0008.product_name,data0034.dept_name order by data0034.dept_name';

  damo.qry2.Open;
  total_workhouse := 0.00;
  damo.qry2.First;
  for i := 0 to damo.qry2.RecordCount - 1do
  begin
    total_workhouse :=  total_workhouse +  damo.qry2.FieldValues['工时'];
    damo.qry2.Next;
  end;
  Edit2.Text := FloatToStr(total_workhouse) + ' h';;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
  damo.qry2.First;
end;

procedure TFrmWorDept.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry2.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry2.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    label1.Left := edt_1.Left - label1.Width - 5;
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

procedure TFrmWorDept.edt_1Change(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
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
      DBGridEh1.DataSource.DataSet.Filter := '';
  end;
  total_workhouse := 0.00;
  damo.qry2.DisableControls;
  damo.qry2.First;
  for i := 0 to damo.qry2.RecordCount - 1do
  begin
    total_workhouse :=  total_workhouse +  damo.qry2.FieldValues['工时'];
    damo.qry2.Next;
  end;
  damo.qry2.enablecontrols;
  Edit2.Text := FloatToStr(total_workhouse) + ' h';
end;

procedure TFrmWorDept.DateTimePicker1Change(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
begin
  damo.qry2.Close;
  damo.qry2.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry2.SQL.Text := damo.qry2.SQL.Text + ' group by data0492.cut_no,data0008.prod_code, '
    + 'data0008.product_name,data0034.dept_name order by data0034.dept_name';

  damo.qry2.Open;
  total_workhouse := 0.00;
  damo.qry2.DisableControls;
  damo.qry2.First;
  for i := 0 to damo.qry2.RecordCount - 1do
  begin
    total_workhouse :=  total_workhouse +  damo.qry2.FieldValues['工时'];
    damo.qry2.Next;
  end;
  damo.qry2.enablecontrols;
  Edit2.Text := FloatToStr(total_workhouse)+ ' h';
end;

procedure TFrmWorDept.BitBtn3Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGridEh1, '部门工时明细表');
end;

procedure TFrmWorDept.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  damo.qry2.SQL.Text := startSQL;

end;



end.
