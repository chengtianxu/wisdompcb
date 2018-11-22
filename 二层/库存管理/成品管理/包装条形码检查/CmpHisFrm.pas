unit CmpHisFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids,
  DBGridEh, Frm_main, Menus;

type
  TfrmCmpHis = class(TForm)
    ehFrmMain: TDBGridEh;
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExprotToExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnFields: TBitBtn;
    edtFilter: TLabeledEdit;
    btn1: TButton;
    ads404: TADODataSet;
    ds404: TDataSource;
    ads404rkey: TAutoIncField;
    ads404rkey698: TIntegerField;
    ads404id699: TIntegerField;
    ads404cmpDatetime: TDateTimeField;
    ads404cmpUser: TIntegerField;
    ads404EMPLOYEE_NAME: TStringField;
    ads404pack_ptr: TIntegerField;
    ads404order_no: TSmallintField;
    ads404MANU_PART_NUMBER: TStringField;
    ads404MANU_PART_DESC: TStringField;
    ads404ANALYSIS_CODE_2: TStringField;
    ads404PO_NUMBER: TStringField;
    ads404description: TStringField;
    ads404code: TStringField;
    ads404qty: TIntegerField;
    ads404lotno: TStringField;
    ads404notes: TStringField;
    ads404barcode_id: TStringField;
    ads404CaseNo: TStringField;
    ads404param1: TStringField;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    ads404wo_ptr: TIntegerField;
    ads404cmpret: TIntegerField;
    ads404cmpnote: TStringField;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure mniN1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FHotColumn: TColumnEh;
    LMainSql: string;
    procedure GetMainFrmData;        
  end;


implementation

uses
  WZ_gUnit, DateUtils;

{$R *.dfm}

procedure TfrmCmpHis.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCmpHis.btnRefreshClick(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmCmpHis.FormCreate(Sender: TObject);
begin
  LMainSql := ads404.CommandText;
end;

procedure TfrmCmpHis.GetMainFrmData;
begin
  ads404.Close;
  ads404.CommandText := LMainSql + ' where cmpdate between ' + QuotedStr(WZ_gUnit.gDateTimeToStr(DateOf(dtp1.DateTime) + TimeOf(dtp3.DateTime))) +
                        ' and ' + QuotedStr(gDateTimeToStr(DateOf(dtp2.DateTime)+ TimeOf(dtp4.DateTime))) + ' order by cmpdate desc';
  ads404.Open;
end;

procedure TfrmCmpHis.FormShow(Sender: TObject);
begin
  Form1.qrytmp.Close;
  Form1.qrytmp.SQL.Text := 'select getdate() as NowDatetime';
  Form1.qrytmp.Open;

  dtp1.DateTime := Form1.qrytmp.fieldbyname('NowDatetime').AsDateTime;
  dtp2.DateTime := Form1.qrytmp.fieldbyname('NowDatetime').AsDateTime;
  GetMainFrmData;
  ehFrmMainTitleClick(ehFrmMain.Columns[1]);
end;

procedure TfrmCmpHis.btnExprotToExcelClick(Sender: TObject);
begin
  WZ_gUnit.Export_dbGridEH_to_Excel(ehFrmMain,'Æ¥ÅäÐÅÏ¢');
end;

procedure TfrmCmpHis.dtp1Change(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmCmpHis.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehFrmMain.DataSource.DataSet);
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

procedure TfrmCmpHis.ehFrmMainTitleClick(Column: TColumnEh);
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

procedure TfrmCmpHis.mniN1Click(Sender: TObject);
var
  Lqry: TADOQuery;
  LMsg: string;
begin
  Lqry := TADOQuery.Create(Self);
  try
    Lqry.Connection := Form1.ADOCon;
    Lqry.SQL.Text := 'select barcode_id from data0699 where outpackkey = ' +  ads404.fieldbyname('rkey698').AsString;
    Lqry.Open;
    while not Lqry.Eof do
    begin
      LMsg := LMsg + Lqry.fieldbyname('barcode_id').AsString + #13#10;
      Lqry.Next;
    end;
    ShowMessage(LMsg);
  finally
    Lqry.Free;
  end;
end;

end.
