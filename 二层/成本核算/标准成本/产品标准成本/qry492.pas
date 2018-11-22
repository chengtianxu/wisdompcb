unit qry492;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB,
  ADODB, dm;

type
  TfrmQry492 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    eh1: TDBGridEh;
    ds1: TDataSource;
    ads1: TADODataSet;
    ads1CUST_CODE: TStringField;
    ads1CUSTPART_ENT_DATE: TDateTimeField;
    ads1MANU_PART_NUMBER: TStringField;
    ads1ABBR_NAME: TStringField;
    ads1MANU_PART_DESC: TStringField;
    ads1cut_no: TStringField;
    ads1ISSUE_DATE: TDateTimeField;
    lbl2: TLabel;
    edtFilter: TLabeledEdit;
    lbl3: TLabel;
    cbb1: TComboBox;
    ads1BOM_STATUS: TStringField;
    ads1TSTATUS: TStringField;
    ads1PRODUCT_NAME: TStringField;
    ads1BIAOZHUNCHENGBEN: TFloatField;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
    FMainSql: string;
    function GetBOMStatusFliater: string;
  public
    { Public declarations }
  end;

implementation

uses
  DateUtils, common;

{$R *.dfm}

procedure TfrmQry492.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmQry492.FormShow(Sender: TObject);
begin
  dtp1.Date := StartOfTheMonth(dmcon.GetServerDateTime);
  dtp2.Date := EndOfTheMonth(dmcon.GetServerDateTime);
  btn3Click(btn3);
  eh1TitleClick(eh1.Columns[0]);
end;

procedure TfrmQry492.btn3Click(Sender: TObject);
var
  lSql: string;
  LDate,LBomStatus: string;
begin
  LDate := ' and d492.ISSUE_DATE between ' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss',dtp1.DateTime)) +
           ' and ' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss',dtp2.DateTime));
  LBomStatus := ' and D25.BOM_STATUS in ' + GetBOMStatusFliater;
  lSql := FMainSql + LDate + LBomStatus + ' group by ' +
        ' D10.CUST_CODE,D25.CUSTPART_ENT_DATE,D25.MANU_PART_NUMBER,D10.ABBR_NAME,D25.TSTATUS,D25.BOM_STATUS,D25.MANU_PART_DESC,' +
        ' d492.cut_no,d492.ISSUE_DATE,dbo.Data0008.PRODUCT_NAME,     D25.tot_accu_matl_per_sqft, D25.tot_accu_OVHD_per_sqft ';
  ads1.Close;
  ads1.CommandText := lSql;
  ads1.Open;
end;

procedure TfrmQry492.eh1TitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;

  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else
  if Column.Title.SortMarker = smUpEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end ;
end;

procedure TfrmQry492.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(eh1.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;

end;

procedure TfrmQry492.edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end else
  if  FHotColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TLabeledEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

function TfrmQry492.GetBOMStatusFliater: string;
begin
  case cbb1.ItemIndex of
    0: Result := '(0)';
    1: Result := '(1)';
    2: Result := '(2)';
    3: Result := '(4)';
    4: Result := '(0,1,2)';
  else
    Result := '(0,1,2,4)';
  end;
end;

procedure TfrmQry492.btn4Click(Sender: TObject);
begin
  if not ads1.IsEmpty then
    Export_dbGridEH_to_Excel(eh1,'产品BOM设计列表');
end;

procedure TfrmQry492.FormCreate(Sender: TObject);
begin
  FMainsql := ads1.CommandText;
end;

procedure TfrmQry492.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (chr(key)='V') and (ssalt in shift) then
    showmessage(ads1.CommandText);
end;

end.
