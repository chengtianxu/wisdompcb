unit CmpHisFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DM, DB, ADODB, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids,
  DBGridEh, Menus;

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
    ads737: TADODataSet;
    ds737: TDataSource;
    stat1: TStatusBar;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure ads737AfterScroll(DataSet: TDataSet);
    procedure ehFrmMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    FHotColumn: TColumnEh;
    LMainSql: string;
    procedure GetMainFrmData;
    procedure GetPackCount;
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
  LMainSql := ads737.CommandText;
end;

procedure TfrmCmpHis.GetMainFrmData;

begin
  ads737.Close;
  ads737.CommandText := LMainSql + ' where cmpdate between ' + QuotedStr(WZ_gUnit.gDateTimeToStr(DateOf(dtp1.DateTime) + TimeOf(dtp3.DateTime))) +
                        ' and ' + QuotedStr(gDateTimeToStr(DateOf(dtp2.DateTime)+ TimeOf(dtp4.DateTime))) + ' order by cmpdate desc';
  ads737.Open;
  GetPackCount;

end;

procedure TfrmCmpHis.FormShow(Sender: TObject);
begin
  dm1.SqlOpen(dm1.qry1,'select getdate() as NowDatetime');
  dtp1.DateTime := DM1.qry1.fieldbyname('NowDatetime').AsDateTime;
  dtp2.DateTime := DM1.qry1.fieldbyname('NowDatetime').AsDateTime;
  GetMainFrmData;
  ehFrmMainTitleClick(ehFrmMain.Columns[1]);
end;

procedure TfrmCmpHis.btnExprotToExcelClick(Sender: TObject);
begin
  WZ_gUnit.Export_dbGridEH_to_Excel(ehFrmMain,'匹配信息');
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
  GetPackCount;
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

procedure TfrmCmpHis.N1Click(Sender: TObject);
var
  LRecNo: Integer;
  LRkey698,Lid699: string;
  LOurBarID: string;
  LNowTime: TDateTime;
begin
  LRecNo := ads737.RecNo;
  dm1.SqlOpen(dm1.qry1,'select getdate() as nowtime');
  LNowTime := dm1.qry1.fieldbyname('nowtime').AsDateTime;
  DM1.con1.BeginTrans;
  try
    ads737.DisableControls;
    ads737.First;
    while not ads737.Eof do
    begin
      LOurBarID := ads737.fieldbyname('ourBarID').AsString;
      LRkey698 := Copy(LOurBarID,1,Pos('-',LOurBarID)-1);
      Lid699 := Copy(LOurBarID,Pos('-',LOurBarID)+1,Length(LOurBarID) - Pos('-',LOurBarID));
      dm1.SqlOpen(DM1.qry1,'select * from data0405 where rkey698 = ' + IntToStr(StrToIntdef(LRkey698,0)) + ' and id699 = ' + IntToStr(StrToIntDef(Lid699,0)) + ' and status = 0');
      if dm1.qry1.IsEmpty then
      begin
        Continue;
      end;
      dm1.qry1.Edit;
      dm1.qry1.FieldByName('outuser').AsString := gUser.User_Ptr;
      dm1.qry1.FieldByName('outdatetime').AsDateTime := LNowTime;
      dm1.qry1.FieldByName('status').AsInteger := 1;
      dm1.qry1.Post;
      ads737.Next;
    end;
    dm1.con1.CommitTrans;
    ShowMessage('出仓成功');
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('出仓失败');
    end;
    ads737.RecNo := LRecNo;
    ads737.EnableControls;
  end;
end;

procedure TfrmCmpHis.ads737AfterScroll(DataSet: TDataSet);
begin
  stat1.Panels[5].Text := IntToStr(ads737.RecordCount);
end;

procedure TfrmCmpHis.GetPackCount;
var
//  LOldRec: Integer;
  LPass,Lerr: Integer;
begin
 ads737.DisableControls;
  ads737.First;

  LPass := 0;
  lerr :=0;
  while not ads737.Eof do
  begin
    if ads737.FieldByName('cmpret').AsInteger = 0 then
      Inc(Lerr)
    else
      inc(LPass);
    ads737.Next;
  end;
  ads737.first;
  ads737.EnableControls;

  stat1.Panels[1].Text := IntToStr(LPass);
  stat1.Panels[3].Text := IntToStr(Lerr);
end;

procedure TfrmCmpHis.ehFrmMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if ads737.FieldByName('cmpRet').AsInteger = 0 then
    ehFrmMain.Canvas.Font.Color := clred
  else
    ehFrmMain.Canvas.Font.Color := clGreen;

  ehFrmMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
