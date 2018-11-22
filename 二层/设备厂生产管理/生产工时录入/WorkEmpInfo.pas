unit WorkEmpInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, common, DM, DB,
  ExtCtrls;

type
  TFrmWorkEmp = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    DBGridEh1: TDBGridEh;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    Label1: TLabel;
    edt_1: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    pnl4: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, startSQL: string;
  public
    { Public declarations }
  end;

var
  FrmWorkEmp: TFrmWorkEmp;

implementation

{$R *.dfm}

procedure TFrmWorkEmp.FormCreate(Sender: TObject);
begin
  startSQL := damo.qry3.SQL.Text;
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

procedure TFrmWorkEmp.BitBtn1Click(Sender: TObject);
begin
  damo.qry3.SQL.Text := startSQL;
  Close;
  damo.qry3.Filter := '';
  damo.qry3.Filtered := False;
  damo.qry3.Close;

end;

procedure TFrmWorkEmp.FormShow(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
begin
  damo.qry3.Close;
  damo.qry3.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry3.SQL.Text := damo.qry3.SQL.Text + ' group by data0034.dept_name,data0005.empl_code,data0005.employee_name,wzcp0072.WORK_DATE ,round(d.rwt+d.rot,1)   '
    + ')aa order by 部门';

  //ShowMessage(damo.qry3.SQL.Text);
  damo.qry3.Open;

  total_workhouse := 0.00;
  damo.qry3.First;
  for i := 0 to damo.qry3.RecordCount - 1 do
  begin
    total_workhouse :=  total_workhouse +  damo.qry3.FieldValues['工时'];
    damo.qry3.Next;
  end;
  Edit2.Text := FloatToStr(total_workhouse) + ' h';;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
  damo.qry3.First;
end;

procedure TFrmWorkEmp.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry3.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry3.Sort:=Column.FieldName+' DESC';
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

procedure TFrmWorkEmp.edt_1Change(Sender: TObject);
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
  damo.qry3.DisableControls;
  damo.qry3.First;
  for i := 0 to damo.qry3.RecordCount - 1do
  begin
    total_workhouse :=  total_workhouse +  damo.qry3.FieldValues['工时'];
    damo.qry3.Next;
  end;
  damo.qry3.enablecontrols;
  Edit2.Text := FloatToStr(total_workhouse) + ' h';
end;

procedure TFrmWorkEmp.DateTimePicker1Change(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
begin
  damo.qry3.Close;
  damo.qry3.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry3.SQL.Text := damo.qry3.SQL.Text + ' group by data0034.dept_name,data0005.empl_code,data0005.employee_name,wzcp0072.WORK_DATE ,round(d.rwt+d.rot,1) '
    + ')aa order by 部门';
  damo.qry3.Open;
  total_workhouse := 0.00;
  damo.qry3.DisableControls;
  damo.qry3.First;
  for i := 0 to damo.qry3.RecordCount - 1 do
  begin
    total_workhouse :=  total_workhouse +  damo.qry3.FieldValues['工时'];
    damo.qry3.Next;
  end;
  damo.qry3.enablecontrols;
  Edit2.Text := FloatToStr(total_workhouse)+ ' h';
end;

procedure TFrmWorkEmp.BitBtn3Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGridEh1, '部门工时明细表');
end;

procedure TFrmWorkEmp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  damo.qry3.SQL.Text := startSQL;
end;

procedure TFrmWorkEmp.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.FieldName = '工时') and (not VarIsNull(damo.qry3.fieldbyname('考勤工时').Value)) then
  begin
    //if VarCompareValue(Column.Field.Value, damo.qry3.fieldbyname('考勤工时').Value) <> vrEqual then
    if   Column.Field.Value>damo.qry3.fieldbyname('考勤工时').Value then 
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clYellow;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,FormatFloat('0.0',Column.Field.AsFloat));
    end;
  end;
end;

end.
