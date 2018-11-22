unit WorkpaceInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, common, ppBands, ppCache, ppClass, ppEndUsr, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppPrnabl, DB, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons;

type
  TFrmWorPace = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edt_1: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure edt_1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, startSQL: string;
  public
    { Public declarations }
  end;

var
  FrmWorPace: TFrmWorPace;

implementation

{$R *.dfm}

procedure TFrmWorPace.BitBtn1Click(Sender: TObject);
begin
  damo.qry4.SQL.Text := startSQL;
  Close;
  damo.qry4.Filter := '';
  damo.qry4.Filtered := False;
  damo.qry4.Close;
end;

procedure TFrmWorPace.FormCreate(Sender: TObject);
begin
  startSQL := damo.qry4.SQL.Text;
  with damo.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select (select dateadd(dd,-day(getdate())+1,getdate())) as startdate,  '
      + '(select   dateadd(dd,-day(getdate()),dateadd(m,1,getdate()))) as enddate ';
      Open;
      DateTimePicker1.DateTime := StrToDateTime(fieldvalues['startdate']);
      DateTimePicker2.DateTime := StrToDateTime(fieldvalues['enddate']);
    end;
end;

procedure TFrmWorPace.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  damo.qry4.SQL.Text := startSQL;
end;

procedure TFrmWorPace.DateTimePicker1Change(Sender: TObject);
var
   i: Integer;
   total_workhouse: Double;
begin
  damo.qry4.Close;
  damo.qry4.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry4.SQL.Text := damo.qry4.SQL.Text +  ' group by data0492.cut_no,data0008.prod_code, '
    + 'data0008.product_name,data0008.WORKHOUSE order by data0492.cut_no';
  damo.qry4.Open;
  total_workhouse := 0.00;
  damo.qry4.DisableControls;
  damo.qry4.First;
  for i := 0 to damo.qry4.RecordCount -1 do
    begin
       damo.qry4.Next;
    end;
    damo.qry4.EnableControls;

end;

procedure TFrmWorPace.edt_1Change(Sender: TObject);
var
  i: Integer;
  total_workhouse: Double;
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then Exit;
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
  damo.qry4.DisableControls;
  damo.qry4.First;
  for i := 0 to damo.qry4.RecordCount - 1do
  begin
    damo.qry4.Next;
  end;
  damo.qry4.enablecontrols;
     
end;

procedure TFrmWorPace.DBGridEh1TitleClick(Column: TColumnEh);
begin
    if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry4.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry4.Sort:=Column.FieldName+' DESC';
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

procedure TFrmWorPace.FormShow(Sender: TObject);
 var
  i: Integer;
  total_workhouse: Double;
begin
  damo.qry4.Close;
  damo.qry4.SQL.Text := startSQL + ' and work_date >= '+ QuotedStr(DateToStr(DateTimePicker1.date))
    + ' and work_date <= ' + QuotedStr(DateToStr(DateTimePicker2.date));
  damo.qry4.SQL.Text := damo.qry2.SQL.Text + ' group by data0492.cut_no,data0008.prod_code, '
    + 'data0008.product_name,data0008.WORKHOUSE order by data0492.cut_no';
  DateTimePicker1Change(nil)   ;
  damo.qry4.Open;
  total_workhouse := 0.00;
  damo.qry4.First;
  for i := 0 to damo.qry4.RecordCount - 1do
  begin
    damo.qry4.Next;
  end;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
  damo.qry4.First;

end;

end.
