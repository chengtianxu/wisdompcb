unit UReqDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, StdCtrls, ComCtrls,
  Buttons;

type
  TfrmReqDetail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    eh1: TDBGridEh;
    ds1: TDataSource;
    qry1: TADOQuery;
    strngfldqry1DSDesigner: TStringField;
    dtmfldqry1DSDesigner2: TDateTimeField;
    dtmfldqry1DSDesigner3: TDateTimeField;
    strngfldqry1DSDesigner4: TStringField;
    strngfldqry1DSDesigner5: TStringField;
    strngfldqry1DSDesigner6: TStringField;
    strngfldqry1DSDesigner7: TStringField;
    strngfldqry1DSDesigner8: TStringField;
    strngfldqry1DSDesigner9: TStringField;
    strngfldqry1DSDesigner10: TStringField;
    strngfldqry1DSDesigner11: TStringField;
    strngfldqry1DSDesigner12: TStringField;
    strngfldqry1DSDesigner13: TStringField;
    strngfldqry1DSDesigner14: TStringField;
    strngfldqry1DSDesigner15: TStringField;
    strngfldqry1DSDesigner16: TStringField;
    qry1DSDesigner17: TBooleanField;
    strngfldqry1DSDesigner18: TStringField;
    strngfldqry1DSDesigner19: TStringField;
    dtmfldqry1DSDesigner20: TDateTimeField;
    strngfldqry1DSDesigner21: TStringField;
    strngfldqry1DSDesigner22: TStringField;
    strngfldqry1DSDesigner23: TStringField;
    intgrfldqry1DEPT_PTR: TIntegerField;
    strngfldqry1DSDesigner24: TStringField;
    strngfldqry1DSDesigner25: TStringField;
    strngfldqry1DSDesigner26: TStringField;
    strngfldqry1DSDesigner27: TStringField;
    fltfldqry1DSDesigner28: TFloatField;
    fltfldqry1DSDesigner29: TFloatField;
    strngfldqry1DSDesigner30: TStringField;
    strngfldqry1DSDesigner31: TStringField;
    strngfldqry1DSDesigner32: TStringField;
    strngfldqry1DSDesigner33: TStringField;
    strngfldqry1VMI: TStringField;
    qry1DSDesigner34: TBCDField;
    qry1DSDesigner35: TBCDField;
    strngfldqry1DSDesigner36: TStringField;
    lbl3: TLabel;
    dtp1: TDateTimePicker;
    lbl4: TLabel;
    dtp2: TDateTimePicker;
    lbl_field: TLabel;
    edt_value: TEdit;
    btn_close: TBitBtn;
    btn_export: TBitBtn;
    procedure eh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure dtp2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
  private
    { Private declarations }
    FName:string;
    FPreColumn:TColumnEh;
  public
    { Public declarations }
    procedure getData;
  end;

var
  frmReqDetail: TfrmReqDetail;

implementation
    uses UDM,common,DateUtils;
{$R *.dfm}

procedure TfrmReqDetail.getData;
begin
  qry1.Close;
  qry1.Parameters[0].Value:=FormatDateTime('yyyy-MM-dd',dtp1.date);
  qry1.Parameters[1].Value:=FormatDateTime('yyyy-MM-dd',IncDay(dtp2.Date));
  qry1.Open;
end;

procedure TfrmReqDetail.eh1TitleClick(Column: TColumnEh);
begin
  if eh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

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

  if eh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (fname <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    fname := column.FieldName ;
    edt_value.SetFocus;
    FPreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    FPreColumn := column ;
    edt_valueChange(edt_value);
  end else
    edt_value.SetFocus;
end;

procedure TfrmReqDetail.FormShow(Sender: TObject);
begin
  FName:=eh1.Columns[0].FieldName;
  FPreColumn:=eh1.Columns[0];
  eh1.Columns[0].Title.color:=clRed;
  dtp1.date:=IncMonth(common.getsystem_date(DM.qrytemp,1),-1);
  dtp2.date:=common.getsystem_date(DM.qrytemp,1)+1;

end;

procedure TfrmReqDetail.edt_valueChange(Sender: TObject);
begin
 if eh1.DataSource.DataSet.FieldByName(fname).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if eh1.DataSource.DataSet.FieldByName(fname).DataType in  [ftString, ftWideString]  then
        eh1.DataSource.DataSet.Filter:=' (' +  fname + ' like ''%' + trim(edt_value.text) + '%'')'
      else if eh1.DataSource.DataSet.FieldByName(fname).DataType in  [ftSmallint, ftInteger]  then
        eh1.DataSource.DataSet.Filter:=' (' + fname+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
    end else
      eh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TfrmReqDetail.dtp1Change(Sender: TObject);
begin
getdata;
end;

procedure TfrmReqDetail.dtp2Change(Sender: TObject);
begin
  getdata;
end;

procedure TfrmReqDetail.FormCreate(Sender: TObject);
begin
 dtp1.date:=IncMonth(common.getsystem_date(dm.qrytemp,1),-1);
 dtp2.date:=common.getsystem_date(dm.qrytemp,1);
end;

procedure TfrmReqDetail.btn_closeClick(Sender: TObject);
begin
close;
end;

procedure TfrmReqDetail.btn_exportClick(Sender: TObject);
begin
if  qry1.IsEmpty  then Exit;
    Export_dbGridEH_to_Excel(eh1,'¡Ï¡œ√˜œ∏');
end;

end.
