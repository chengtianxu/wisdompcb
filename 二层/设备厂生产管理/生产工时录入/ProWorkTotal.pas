unit ProWorkTotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, common, DM, StdCtrls, Buttons, DB, ExtCtrls, ADODB,
  ComCtrls, Menus, UpdateWorkHouse;

type
  TFrmProWorkTotal = class(TForm)
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    pnl1: TPanel;
    pnl2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    edt_1: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    pnl3: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    pnl4: TPanel;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, startSQL: string;
  public
    { Public declarations }
  end;

var
  FrmProWorkTotal: TFrmProWorkTotal;

implementation

{$R *.dfm}

procedure TFrmProWorkTotal.DBGridEh1TitleClick(Column: TColumnEh);
begin
if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry1.Sort:=Column.FieldName+' DESC';
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

procedure TFrmProWorkTotal.edt_1Change(Sender: TObject);
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
  damo.qry1.DisableControls;
  damo.qry1.First;
  for i := 0 to damo.qry1.RecordCount - 1do
  begin
    total_workhouse :=  total_workhouse +  damo.qry1.FieldValues['工时'];
    damo.qry1.Next;
  end;
  damo.qry1.enablecontrols;
  Edit2.Text := FloatToStr(total_workhouse) + ' h';
end;

procedure TFrmProWorkTotal.FormCreate(Sender: TObject);
begin
  startSQL := damo.qry1.SQL.Text;
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

procedure TFrmProWorkTotal.BitBtn3Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGridEh1, '项目工时明细表');
end;

procedure TFrmProWorkTotal.BitBtn1Click(Sender: TObject);
begin
  damo.qry1.SQL.Text := startSQL;
  close;
  damo.qry1.Filter := '';
  damo.qry1.Filtered := False;
  damo.qry1.Close;

end;

procedure TFrmProWorkTotal.DateTimePicker1Change(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
begin
  damo.qry1.Close;
  damo.qry1.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry1.SQL.Text := damo.qry1.SQL.Text + ' order by work_date desc';
  damo.qry1.Open;
  total_workhouse := 0.00;
  damo.qry1.DisableControls;
  damo.qry1.First;
  for i := 0 to damo.qry1.RecordCount - 1do
  begin
    total_workhouse :=  total_workhouse +  damo.qry1.FieldValues['工时'];
    damo.qry1.Next;
  end;
  damo.qry1.enablecontrols;
  Edit2.Text := FloatToStr(total_workhouse)+ ' h';
end;

procedure TFrmProWorkTotal.FormShow(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
begin
  damo.qry1.Close;
  damo.qry1.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry1.SQL.Text := damo.qry1.SQL.Text + ' order by work_date desc';
  damo.qry1.Open;
  total_workhouse := 0.00;
  damo.qry1.First;               
  for i := 0 to damo.qry1.RecordCount - 1do
  begin
    total_workhouse :=  total_workhouse +  damo.qry1.FieldValues['工时'];
    damo.qry1.Next;
  end;
  Edit2.Text := FloatToStr(total_workhouse) + ' h';;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
  damo.qry1.First;
end;

procedure TFrmProWorkTotal.N1Click(Sender: TObject);
begin
  if strtoint(vprev) <> 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  FrmUpdateWorkHouse := TFrmUpdateWorkHouse.Create(Application);
  FrmUpdateWorkHouse.ShowModal;
  FrmUpdateWorkHouse.Free;
end;

procedure TFrmProWorkTotal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  damo.qry1.SQL.Text := startSQL;
end;

end.
