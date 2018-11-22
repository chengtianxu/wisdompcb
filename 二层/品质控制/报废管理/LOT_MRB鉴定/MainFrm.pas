unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DM, DB, DBGridEh, ADODB,
  Menus;

type
  TfrmMain = class(TForm)
    pnl2: TPanel;
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExprotToExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnFields: TBitBtn;
    edtFilter: TLabeledEdit;
    ds1: TDataSource;
    ehFrmMain: TDBGridEh;
    pmZD: TPopupMenu;
    mniZD: TMenuItem;
    pm1: TPopupMenu;
    mniDeal: TMenuItem;
    mniTuiHui: TMenuItem;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ehFrmMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
    procedure btnFieldsClick(Sender: TObject);
    procedure mniZDClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniDealClick(Sender: TObject);
    procedure mniTuiHuiClick(Sender: TObject);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
    FFrmMainSql,FWhere: string;
    procedure FillZD;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  WZ_gUnit, FilterFrm, DateUtils, Pick_Item_Single, FanGongFrm, HeBingGongDan,
  NewFrm, gBFUnit;

{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  dm1.adsFrmMain.Close;
  dm1.adsFrmMain.CommandText := FFrmMainSql + FWhere + ' AND D06.wtype in (2,4) and D06.PROD_STATUS in (3,4,5,6) ' ;
  dm1.adsFrmMain.Open;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  FillZD;
  FWhere := ' WHERE 1=1 ';
  btnRefreshClick(btnRefresh);
  ehFrmMainTitleClick(ehFrmMain.Columns[0]);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFrmMainSql := dm1.adsFrmMain.CommandText;
  gCon := dm1.con1;
end;

procedure TfrmMain.ehFrmMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if (Column.Field.DataSet.FieldByName('Status').AsString = '已审核') then
//  begin
//    TDBGridEh(Sender).Canvas.Brush.Color := clMoneyGreen;
//    TDBGridEh(Sender).Canvas.FillRect(Rect);
//    TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,Column.Field.AsString);
//  end else
//  if (Column.Field.DataSet.FieldByName('Status').AsString = '退回，审核未通过')
//  then
//  begin
//    TDBGridEh(Sender).Canvas.Brush.Color := clSilver;
//    TDBGridEh(Sender).Canvas.FillRect(Rect);
//    TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,Column.Field.AsString);
//  end;
end;

procedure TfrmMain.btnExprotToExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(ehFrmMain,Application.MainForm.Caption);
end;

procedure TfrmMain.ehFrmMainTitleClick(Column: TColumnEh);
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

procedure TfrmMain.edtFilterChange(Sender: TObject);
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

procedure TfrmMain.edtFilterKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  I: Integer;
begin
  frmFilter.InitFrm([
  ehFrmMain.Columns[0],
  ehFrmMain.Columns[1],
  ehFrmMain.Columns[2],
  ehFrmMain.Columns[4],
  ehFrmMain.Columns[11]
  ]);
  if frmFilter.ShowModal = mrOK then
  begin
    FWhere := ' WHERE D06.RELEASE_DATE >= ' + QuotedStr(gDateTimeToStr(DateOf(frmFilter.dtp1.Date) + TimeOf(frmFilter.dtp2.Time))) +
              ' AND D06.RELEASE_DATE <= ' + QuotedStr(gDateTimeToStr(DateOf(frmFilter.dtp3.Date) + TimeOf(frmFilter.dtp4.Time)));

    for I := 0 to frmFilter.lvRet.Items.Count - 1 do
    begin
      FWhere := FWhere + ' AND ' + frmFilter.lvRet.Items[I].SubItems[1] + frmFilter.lvRet.Items[I].SubItems[0];
    end;
    btnRefreshClick(btnRefresh);
  end;
end;

procedure TfrmMain.btnFieldsClick(Sender: TObject);
begin
  pmZD.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.mniZDClick(Sender: TObject);
var
  LItem: TMenuItem;
begin
  LItem := (Sender as TMenuItem);
  LItem.Checked := not LItem.Checked;
  ehFrmMain.Columns[LItem.Tag].Visible := LItem.Checked;
end;

procedure TfrmMain.FillZD;
var
  LCum: TColumnEh;
  LItem: TMenuItem;
  I: Integer;
begin
  pmZD.Items.Clear;
  for I := 0 to ehFrmMain.Columns.Count - 1 do
  begin
    LCum := ehFrmMain.Columns[I];
    if LCum.Visible then
    begin
      LCum.Title.TitleButton := True;
      LItem := TMenuItem.Create(pmZD);
      LItem.Caption := LCum.Title.Caption;
      LItem.Checked := LCum.Visible;
      LItem.OnClick := mniZDClick;
      LItem.Tag := LCum.Index;
      pmZD.Items.Add(LItem);
    end;
  end;
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  mniDeal.Enabled := DM1.adsFrmMain.RecNo > 0;
  mniTuiHui.Enabled := DM1.adsFrmMain.RecNo > 0;
end;

procedure TfrmMain.mniDealClick(Sender: TObject);
var
  LFrm: tfrmnew;
  LUser15Ptr: string;
begin
  if DM1.adsFrmMain.FieldByName('wtype').AsInteger = 2 then
  begin
    if frmFG1.ShowModal = mrOK then btnRefreshClick(btnRefresh);
  end else
  if DM1.adsFrmMain.FieldByName('wtype').AsInteger = 4 then
  begin
    LFrm := TfrmNew.Create(Self);
    try
      //如果用户绑定工厂则
      LUser15Ptr := GetUser15Ptr(gUser.User_Longin_Ptr);
      if LUser15Ptr <> '' then
      begin
        dm1.SqlOpen('SELECT RKey,ABBR_NAME FROM Data0015 WHERE RKey = ' + LUser15Ptr,DM1.qrytmp);
        LFrm.cbxBFGC.Items.AddObject(dm1.qrytmp.FieldByName('ABBR_NAME').AsString,
            TOBJECT(dm1.qrytmp.FieldByName('RKey').AsInteger));
        LFrm.cbxBFGC.ItemIndex := 0;
        LFrm.cbxBFGC.Enabled := False;
      end else
      begin
        //添加工厂
        dm1.qrytmp.Close;
        dm1.qrytmp.SQL.Clear;
        dm1.qrytmp.SQL.Add('SELECT * FROM Data0015');
        dm1.qrytmp.Open;
        while not dm1.qrytmp.Eof do
        begin
          LFrm.cbxBFGC.Items.AddObject(dm1.qrytmp.FieldByName('ABBR_NAME').AsString,
              TOBJECT(dm1.qrytmp.FieldByName('RKey').AsInteger));
          dm1.qrytmp.Next;
        end;
      end;

      LFrm.MRBBFCheckInit(DM1.adsFrmMain.FieldbyName('Rkey').AsString);
      if LFrm.ShowModal = mrok then
        btnRefreshClick(btnRefresh);
    finally
      LFrm.Free;
    end;
    //if frmBaoFei.showmodal = mrOK then btnRefreshClick(btnRefresh);
  end;
end;

procedure TfrmMain.mniTuiHuiClick(Sender: TObject);
begin
  if MessageBox(Handle,'是否退回申请？','提示',MB_YESNO) = IDYES then
  begin
    if CombinLot(DM1.adsFrmMain.FieldbyName('Rkey').AsString) then
    begin
      ShowMessage('退回成功，已经退回');
      btnRefreshClick(btnRefresh);
    end;
  end;
end;

end.
