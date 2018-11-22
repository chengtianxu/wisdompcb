unit inouthisfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DM, DB, ADODB, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids,
  DBGridEh, Menus;

type
  TfrmInOutHis = class(TForm)
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
    ads405: TADODataSet;
    ds405: TDataSource;
    ads405rkey: TAutoIncField;
    ads405rkey698: TIntegerField;
    ads405id699: TIntegerField;
    ads405inuser: TIntegerField;
    ads405outuser: TIntegerField;
    ads405indatetime: TDateTimeField;
    ads405outdatetime: TDateTimeField;
    ads405pack_ptr: TIntegerField;
    ads405order_no: TSmallintField;
    ads405MANU_PART_NUMBER: TStringField;
    ads405MANU_PART_DESC: TStringField;
    ads405ANALYSIS_CODE_2: TStringField;
    ads405PO_NUMBER: TStringField;
    ads405description: TStringField;
    ads405code: TStringField;
    ads405qty: TIntegerField;
    ads405lotno: TStringField;
    ads405notes: TStringField;
    ads405barcode_id: TStringField;
    ads405CaseNo: TStringField;
    ads405param1: TStringField;
    ads405inusername: TStringField;
    ads405outusername: TStringField;
    lbl3: TLabel;
    lblpackno: TLabel;
    cbx1: TCheckBox;
    cbx2: TCheckBox;
    cbx3: TCheckBox;
    pm1: TPopupMenu;
    mnidele: TMenuItem;
    ads405status: TIntegerField;
    strngfldads405place: TStringField;
    strngfldads405Param2: TStringField;
    intgrfldads405wo_ptr: TIntegerField;
    intgrfldads405outpackkey: TIntegerField;
    mniModiyPace: TMenuItem;
    mniReInStock: TMenuItem;
    strngfldads405barid: TStringField;
    intgrfldads405IncNO: TIntegerField;
    intgrfldads405LockStatus: TIntegerField;
    mniN1: TMenuItem;
    mniPinZhiGuanKong: TMenuItem;
    mniQuXiaoGuanKong: TMenuItem;
    mniAllLock: TMenuItem;
    mniAllUnLock: TMenuItem;
    ads405baknote: TStringField;
    ads405note698: TStringField;
    ads405LotOrder: TStringField;
    ads405surface: TStringField;
    ads405v_date: TDateTimeField;
    ads405WORK_ORDER_NUMBER: TStringField;
    ads405EMPLOYEE_NAME: TStringField;
    lbl4: TLabel;
    cbx4: TComboBox;
    btnZQ: TBitBtn;
    ads405youxiaoqi: TSmallintField;
    ads405printfilename: TStringField;
    ads405isguoqi: TIntegerField;
    ads405isAlter: TIntegerField;
    ads405IsOvercustRec: TIntegerField;
    ads405REVIEW_DAYS: TIntegerField;
    ads405AlterDay: TIntegerField;
    ads405custReciveDay: TIntegerField;
    lbl5: TLabel;
    edtzhouqi: TEdit;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure ads405AfterScroll(DataSet: TDataSet);
    procedure pm1Popup(Sender: TObject);
    procedure mnideleClick(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure mniModiyPaceClick(Sender: TObject);
    procedure mniReInStockClick(Sender: TObject);
    procedure mniPinZhiGuanKongClick(Sender: TObject);
    procedure mniQuXiaoGuanKongClick(Sender: TObject);
    procedure mniAllLockClick(Sender: TObject);
    procedure mniAllUnLockClick(Sender: TObject);
    procedure ehFrmMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnZQClick(Sender: TObject);
    procedure cbx4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FUserName05: string;
    FHotColumn: TColumnEh;
    LMainSql: string;
    procedure GetMainFrmData;
    function GetGuoQiFilter: string;        
  end;


implementation

uses
  WZ_gUnit, DateUtils, ResetPlaceFrm, InOutHisZhouQiSetFrm, StrUtils;

{$R *.dfm}

procedure TfrmInOutHis.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmInOutHis.btnRefreshClick(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmInOutHis.FormCreate(Sender: TObject);
begin
  LMainSql := ads405.CommandText;
end;

procedure TfrmInOutHis.GetMainFrmData;
var
  LAddSql: string;
  LStatus: string;
  LGuoQi: string;
begin
  if cbx4.ItemIndex = 0 then
    LGuoQi := 'd698.lotno >= right(DateName(year,dateadd(wk,0-d07.custReciveDay/7,getdate())),2) + right(''00'' + DateName(week,dateadd(wk,0-d07.custReciveDay/7,getdate())),2)';
  if cbx4.ItemIndex = 1 then
    LGuoQi := 'd698.lotno < right(DateName(year,dateadd(wk,0-d07.custReciveDay/7,getdate())),2) + right(''00'' + DateName(week,dateadd(wk,0-d07.custReciveDay/7,getdate())),2)';

  LStatus := '-1';
  if cbx1.Checked then LStatus := LStatus + ',0';
  if cbx2.Checked then LStatus := LStatus + ',1';
  if cbx3.Checked then LStatus := LStatus + ',2';
  LAddSql := 'and status in (' + LStatus + ')';
  ads405.Close;
  ads405.CommandText := LMainSql + ' where indatetime between ' + QuotedStr(WZ_gUnit.gDateTimeToStr(DateOf(dtp1.DateTime) + TimeOf(dtp3.DateTime))) +
                        ' and ' + QuotedStr(gDateTimeToStr(DateOf(dtp2.DateTime)+ TimeOf(dtp4.DateTime))) +
                        LAddSql + ' and ' + LGuoQi +
                        ' order by indatetime desc,outdatetime desc';
  ads405.Open;

  dm1.SqlOpen(dm1.qry1,'select EMPLOYEE_NAME from data0005 where rkey = ' + gUser.User_Ptr);
  if not dm1.qry1.IsEmpty then
    FUserName05 := dm1.qry1.fieldbyname('EMPLOYEE_NAME').AsString;

  //cbx4Change(cbx4);
end;

procedure TfrmInOutHis.FormShow(Sender: TObject);
begin
  dm1.SqlOpen(dm1.qry1,'select getdate() as NowDatetime');
  dtp1.DateTime := DM1.qry1.fieldbyname('NowDatetime').AsDateTime;
  dtp2.DateTime := DM1.qry1.fieldbyname('NowDatetime').AsDateTime;
  GetMainFrmData;
  ehFrmMainTitleClick(ehFrmMain.Columns[1]);
end;

procedure TfrmInOutHis.btnExprotToExcelClick(Sender: TObject);
begin
  WZ_gUnit.Export_dbGridEH_to_Excel(ehFrmMain,'库存');
end;

procedure TfrmInOutHis.dtp1Change(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmInOutHis.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehFrmMain.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    if edtzhouqi.Text <> '' then
    begin
      DATASET.Filter :=  ' Lotno = ' + QuotedStr(edtzhouqi.Text);
      DATASET.Filtered:= true;
    end
    else
      DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);// + ' and ' + GetGuoQiFilter;
      if edtzhouqi.Text <> '' then DATASET.Filter := DATASET.Filter + ' and Lotno = ' + QuotedStr(edtzhouqi.Text);
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
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr ;//+ ' and ' + GetGuoQiFilter;
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
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter ;//+ ' and ' + GetGuoQiFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TfrmInOutHis.ehFrmMainTitleClick(Column: TColumnEh);
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

procedure TfrmInOutHis.ads405AfterScroll(DataSet: TDataSet);
begin
  lblpackno.Caption := IntToStr(ads405.RecordCount);
end;

procedure TfrmInOutHis.pm1Popup(Sender: TObject);
begin
  mnidele.Enabled := gUser.User_Permit = '2';
  mniModiyPace.Enabled := gUser.User_Permit = '2';
  mniReInStock.Enabled := (gUser.User_Permit = '2') and (not ads405.IsEmpty);
  mniPinZhiGuanKong.Enabled := (gUser.User_Permit = '4') and (not ads405.IsEmpty);
  mniQuXiaoGuanKong.Enabled := (gUser.User_Permit = '4') and (not ads405.IsEmpty);
  mniAllLock.Enabled := mniPinZhiGuanKong.Enabled;
  mniAllUnLock.Enabled := mniQuXiaoGuanKong.Enabled;
end;

procedure TfrmInOutHis.mnideleClick(Sender: TObject);
begin
//  ads405.Edit;
//  ads405.FieldByName('status').AsInteger := 2;
//  ads405.Post;
//  if ads405.FieldByName('status').AsInteger = 1 then
//  begin
//    ShowMessage('已经出库不可以删除');
//    Exit;
//  end;
  dm1.qry1.Close;
  dm1.qry1.SQL.Text := 'select LockStatus from data0405 where rkey = ' + ads405.fieldbyname('rkey').AsString + ' and LockStatus>0';
  dm1.qry1.Open;
  if not dm1.qry1.IsEmpty then
  begin
    ShowMessage('该箱已被品质管控，请联系市场客诉部门');
    Exit;
  end;

  dm1.qry1.Close;
  dm1.qry1.SQL.Clear;
  dm1.qry1.SQL.Text := 'delete from data0405 where rkey = ' + ads405.fieldbyname('rkey').AsString;
  dm1.qry1.ExecSQL;
  btnRefreshClick(btnRefresh);
end;

procedure TfrmInOutHis.cbx1Click(Sender: TObject);
begin
  GetMainFrmData;
end;

procedure TfrmInOutHis.mniModiyPaceClick(Sender: TObject);
var
  LFrm: TfrmResetPlace;
begin
  LFrm := TfrmResetPlace.Create(Self);
  try
    LFrm.edt1.Text := ads405.fieldbyname('place').AsString;
    if LFrm.ShowModal = mrok then
    begin
      ads405.Edit;
      ads405.FieldByName('place').AsString := LFrm.edt1.Text;
      ads405.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmInOutHis.mniReInStockClick(Sender: TObject);
begin
  dm1.qry1.Close;
  dm1.qry1.SQL.Clear;
  dm1.qry1.SQL.Text := 'update data0405 set status = 0 where rkey = ' + ads405.fieldbyname('rkey').AsString;
  dm1.qry1.ExecSQL;
  btnRefreshClick(btnRefresh);
end;

procedure TfrmInOutHis.mniPinZhiGuanKongClick(Sender: TObject);
var
  LStr: string;
begin
  if not InputQuery('Note','说明:    ',LStr) then
  begin
    Exit;
  end;

  LStr := ' ' + FUserName05 + ' 锁定! ' + LStr;

  dm1.qry1.Close;
  dm1.qry1.SQL.Clear;
  dm1.qry1.SQL.Text := 'update data0405 set LockStatus = 1,baknote= isnull(baknote,'''') + ' + QuotedStr(LStr) +' where rkey = ' + ads405.fieldbyname('rkey').AsString;
  dm1.qry1.ExecSQL;
  ShowMessage('管控成功');
  btnRefreshClick(btnRefresh);
end;

procedure TfrmInOutHis.mniQuXiaoGuanKongClick(Sender: TObject);
var
  LStr: string;
begin
  if not InputQuery('Note','说明:    ',LStr) then
  begin
    Exit;
  end;

  LStr := ' ' + FUserName05 + ' 取消锁定! ' + LStr;
  dm1.qry1.Close;
  dm1.qry1.SQL.Clear;
  dm1.qry1.SQL.Text := 'update data0405 set LockStatus = 0,baknote= isnull(baknote,'''') + ' + QuotedStr(LStr) +' where rkey = ' + ads405.fieldbyname('rkey').AsString;
  dm1.qry1.ExecSQL;
  ShowMessage('取消管控成功');
  btnRefreshClick(btnRefresh);
end;

procedure TfrmInOutHis.mniAllLockClick(Sender: TObject);
var
  LStr: string;
begin
  if not InputQuery('Note','说明:    ',LStr) then
  begin
    Exit;
  end;

  LStr := ' ' + FUserName05 + ' 锁定! ' + LStr;

  ads405.DisableControls;
  ads405.First;
  try
    while not ads405.Eof do
    begin
      dm1.qry1.Close;
      dm1.qry1.SQL.Clear;
      dm1.qry1.SQL.Text := 'update data0405 set LockStatus = 1,baknote= isnull(baknote,'''') + ' + QuotedStr(LStr) +' where rkey = ' + ads405.fieldbyname('rkey').AsString;
      dm1.qry1.ExecSQL;
      ads405.Next;
    end;
  finally
    ads405.EnableControls;
  end;
  ShowMessage('管控成功');
  btnRefreshClick(btnRefresh);
end;

procedure TfrmInOutHis.mniAllUnLockClick(Sender: TObject);
var
  LStr: string;
begin
  if not InputQuery('Note','说明:    ',LStr) then
  begin
    Exit;
  end;

  LStr := ' ' + FUserName05 + ' 取消锁定! ' + LStr;
  
  ads405.DisableControls;
  ads405.First;
  try
    while not ads405.Eof do
    begin
      dm1.qry1.Close;
      dm1.qry1.SQL.Clear;
      dm1.qry1.SQL.Text := 'update data0405 set LockStatus = 0,baknote= isnull(baknote,'''') + ' + QuotedStr(LStr) +' where rkey = ' + ads405.fieldbyname('rkey').AsString;
      dm1.qry1.ExecSQL;
      ads405.Next;
    end;
  finally
    ads405.EnableControls;
  end;
  ShowMessage('取消管控成功');
  btnRefreshClick(btnRefresh);
end;

procedure TfrmInOutHis.ehFrmMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (ads405.FieldByName('isAlter').AsInteger = 1) and (ads405.FieldByName('isOverCustRec').AsInteger = 0) then
  begin
    ehFrmMain.Canvas.Font.Color := clBlue;
  end;

  if (ads405.FieldByName('isOverCustRec').AsInteger = 1) and (ads405.FieldByName('isGuoqi').AsInteger = 0) then
  begin
    ehFrmMain.Canvas.Font.Color := clGreen;
  end ;
  if ads405.FieldByName('isGuoqi').AsInteger = 1 then
  begin
    ehFrmMain.Canvas.Font.Color := clRed;
  end;


//  inherited;
    ehFrmMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmInOutHis.btnZQClick(Sender: TObject);
var
  lfrm: TfrmZhouQiSet;
begin
  lfrm := TfrmZhouQiSet.Create(Self);
  try
    lfrm.ShowModal;
  finally
    lfrm.free;
  end;
end;

function TfrmInOutHis.GetGuoQiFilter: string;
begin
  if cbx4.ItemIndex = 0 then
    ads405.Filter := 'isguoqi = 0'
  else
  if cbx4.ItemIndex = 1 then
    ads405.Filter := 'isguoqi = 1';
  ads405.Filtered := True;
end;

procedure TfrmInOutHis.cbx4Change(Sender: TObject);
begin
  GetMainFrmData;
end;

end.
