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
    pmZD: TPopupMenu;
    pmMain: TPopupMenu;
    btn1: TBitBtn;
    ehFrmMain: TDBGridEh;
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniDele: TMenuItem;
    mniView: TMenuItem;
    mniN5: TMenuItem;
    mniPrint: TMenuItem;
    mniCanReprint: TMenuItem;
    mniHWJS: TMenuItem;
    mniHW1806: TMenuItem;
    mniHW6169: TMenuItem;
    mniHW0040: TMenuItem;
    mniHWZD: TMenuItem;
    mniHWZD1915: TMenuItem;
    mniHWZD6005: TMenuItem;
    mniHWZD0035: TMenuItem;
    mniZXKX: TMenuItem;
    mniZK0275MZ: TMenuItem;
    mniZX0276MZ: TMenuItem;
    mniZX0257MZ: TMenuItem;
    mniZX2303SZ: TMenuItem;
    mniZX2156SZ: TMenuItem;
    mniHS2258: TMenuItem;
    mniSZHS2258: TMenuItem;
    mniCDHW: TMenuItem;
    mniCDHWSZ: TMenuItem;
    mniN01381: TMenuItem;
    mniHWAJX: TMenuItem;
    mniN10111: TMenuItem;
    mniDGMG: TMenuItem;
    mniN21041: TMenuItem;
    mniN21091: TMenuItem;
    mniCLS: TMenuItem;
    mniN1901SZ1: TMenuItem;
    mniN1: TMenuItem;
    mniDaHua: TMenuItem;
    mniN23901: TMenuItem;
    mniN10011: TMenuItem;
    mniN25161: TMenuItem;
    N22621: TMenuItem;
    N70561: TMenuItem;
    N52491: TMenuItem;
    N26271: TMenuItem;
    N70721: TMenuItem;
    mniN2: TMenuItem;
    mniN60041: TMenuItem;
    mniN9961: TMenuItem;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    mniN6: TMenuItem;
    mniCL1: TMenuItem;
    mniN71011: TMenuItem;
    mniN71001: TMenuItem;
    mniN60951: TMenuItem;
    mniN61091: TMenuItem;
    mniN62591: TMenuItem;
    mniN62981: TMenuItem;
    mniN21092: TMenuItem;
    mniN10012: TMenuItem;
    mniN88861: TMenuItem;
    mniN9981: TMenuItem;
    nN10001: TMenuItem;
    nN62411: TMenuItem;
    nN71391: TMenuItem;
    nN64311: TMenuItem;
    nN63991: TMenuItem;
    nN71392: TMenuItem;
    nN1: TMenuItem;
    nN63781: TMenuItem;
    nN71393: TMenuItem;
    nN72181: TMenuItem;
    nN73451: TMenuItem;
    nN2: TMenuItem;
    nS27631: TMenuItem;
    nN28351: TMenuItem;
    nN28341: TMenuItem;
    nN25921: TMenuItem;
    nN28481: TMenuItem;
    N1: TMenuItem;
    N73401: TMenuItem;
    N2: TMenuItem;
    N73251: TMenuItem;
    N713711: TMenuItem;
    N713921: TMenuItem;
    N713931: TMenuItem;
    N713941: TMenuItem;
    N713951: TMenuItem;
    N713961: TMenuItem;
    N713971: TMenuItem;
    nZ51371: TMenuItem;
    nN88891: TMenuItem;
    nN28551: TMenuItem;
    nN25922: TMenuItem;
    cbx1: TCheckBox;
    Z10611: TMenuItem;
    mniN7: TMenuItem;
    mniN73641: TMenuItem;
    mniN71951: TMenuItem;
    mniN73651: TMenuItem;
    mniN713981: TMenuItem;
    mniN29111: TMenuItem;
    Z1: TMenuItem;
    mniCreateOutTag: TMenuItem;
    cbxPrinter: TComboBox;
    lbl1: TLabel;
    N60031: TMenuItem;
    mniN67911: TMenuItem;
    mniZ13771: TMenuItem;
    mniN80011: TMenuItem;
    mniN78261: TMenuItem;
    mniN80051: TMenuItem;
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
    procedure mniViewClick(Sender: TObject);
    procedure mniHW1806Click(Sender: TObject);
    procedure mniPrintClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniHWZD1915Click(Sender: TObject);
    procedure mniZK0275MZClick(Sender: TObject);
    procedure mniSZHS2258Click(Sender: TObject);
    procedure mniN21041Click(Sender: TObject);
    procedure mniN1901SZ1Click(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniCanReprintClick(Sender: TObject);
    procedure mniN23901Click(Sender: TObject);
    procedure mniN60041Click(Sender: TObject);
    procedure mniN71011Click(Sender: TObject);
    procedure mniN60951Click(Sender: TObject);
    procedure mniN62591Click(Sender: TObject);
    procedure mniN62981Click(Sender: TObject);
    procedure nN63781Click(Sender: TObject);
    procedure N73401Click(Sender: TObject);
    procedure N73251Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure mniN73641Click(Sender: TObject);
    procedure mniCreateOutTagClick(Sender: TObject);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
    FFrmMainSql,FWhere: string;
    FIniManu_Part_Number,FIniSalesOrder: string;
    FOrgCust_Code, FSaleCustCode: string;
    procedure FillZD;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  WZ_gUnit, gFilterFrm, DateUtils, Pick_Item_Single, HW1806Frm, BaseFrm, PrintUnit,
  HWZD1915Frm, ZXKX2303Frm, HS2258Frm, MRMT2104Frm, CLS1901Frm, DaHua2390Frm, HighPermitFrm,
  FrmJump, DYH7100Frm, HQ6095Frm, TCL6298Frm, WT6259Frm, JC6378Frm, YYD7340Frm,HS7325Frm,
  DELL7364Frm, CreateOutTag;

{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  dm1.adsFrmMain.Close;
  dm1.adsFrmMain.CommandText := FFrmMainSql + FWhere + ' ORDER BY v_date DESC';
  dm1.adsFrmMain.Open;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  I,J: Integer;
  bVisable: Boolean;
begin
  FillZD;
  FWhere := ' WHERE data0698.v_date >=  dateadd(day,-2,getdate()) AND data0698.v_date <= dateadd(day,1,getdate())';

  btnRefreshClick(btnRefresh);
  FHotColumn := ehFrmMain.Columns[0];
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;
  //ehFrmMainTitleClick(ehFrmMain.Columns[0]);
  //由于不同区域客户代码不同，所以开始取得各个区域的客户代码
  DM1.SqlOpen('SELECT CUST_CODE FROM Data0010');
  for I := 0 to pmMain.Items[0].Count -1 do
  begin
    for J := 0 to pmMain.Items[0].Items[I].Count - 1 do
    begin
      bVisable := False;
      DM1.qrytmp.First;
      while not DM1.qrytmp.Eof do
      begin
        if (Trim(DM1.qrytmp.FieldByName('CUST_CODE').AsString) = Copy(pmMain.Items[0].Items[I].Items[J].Caption,1, Pos('_',pmMain.Items[0].Items[I].Items[J].Caption)-1))
          and (Copy(pmMain.Items[0].Items[I].Items[J].Caption,Pos('_',pmMain.Items[0].Items[I].Items[J].Caption)+1,Length(pmMain.Items[0].Items[I].Items[J].Caption) - Pos('_',pmMain.Items[0].Items[I].Items[J].Caption)) = DM1.GetServerRegion)
        then
        begin
          bVisable := True;
          Break;
        end;
        DM1.qrytmp.Next;
      end;
      pmMain.Items[0].Items[I].Items[J].Visible := bVisable;
    end;
  end;
  //不可见的客户隐藏掉
  for I := 0 to pmMain.Items[0].Count -1 do
  begin
    bVisable := False;
    for J := 0 to pmMain.Items[0].Items[I].Count - 1 do
    begin
      if pmMain.Items[0].Items[I].Items[J].Visible then
        bVisable := True;
    end;
    pmMain.Items[0].Items[I].Visible := bVisable;
  end;  
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFrmMainSql := dm1.adsFrmMain.CommandText;
  //释放报表
  CreateDirectory(PChar(ExtractFilePath(ParamStr(0)) + 'Report'),nil);
  CreateDirectory(PChar(ExtractFilePath(ParamStr(0)) + 'Report\WZPR0698'),nil);

  cbxPrinter.Items.Assign(DM1.ppPrint.PrinterSetup.PrinterNames);
  if cbxPrinter.Items.Count > 0 then
    cbxPrinter.ItemIndex := 0;
end;

procedure TfrmMain.ehFrmMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.Field.DataSet.FieldByName('v_print').AsBoolean) then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clMoneyGreen;
  end;
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  
end;

procedure TfrmMain.btnExprotToExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(ehFrmMain,'标签打印');
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
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint, ftAutoInc] then
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
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',gStrToDateTime(TmpStr));
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
  if edtFilter.Text = 'chengtx' then
  begin
    if Key = #13 then
      mniCanReprint.Visible := not mniCanReprint.Visible;
  end;
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
  ehFrmMain.Columns[3],
  ehFrmMain.Columns[4],
  ehFrmMain.Columns[5],
  ehFrmMain.Columns[13],
  ehFrmMain.Columns[10],
  ehFrmMain.Columns[9]
  ]);
  if frmFilter.ShowModal = mrOK then
  begin
    FWhere := ' WHERE data0698.v_date >= ' + QuotedStr(gDateTimeToStr(DateOf(frmFilter.dtp1.Date) + TimeOf(frmFilter.dtp2.Time))) +
              ' AND data0698.v_date <= ' + QuotedStr(gDateTimeToStr(DateOf(frmFilter.dtp3.Date) + TimeOf(frmFilter.dtp4.Time)));

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


procedure TfrmMain.mniViewClick(Sender: TObject);
var
  LFrm: TfrmBase;
begin
  LFrm := TfrmBase.Create(Self);
  try
    LFrm.FCustCode := DM1.adsFrmMain.FieldByName('CUST_CODE').AsString;
    LFrm.ViewShow(DM1.adsFrmMain.FieldByName('RKey').AsInteger);
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
end;

procedure TfrmMain.mniHW1806Click(Sender: TObject);
var
  LFrm: Tfrm1806;
begin
  LFrm := Tfrm1806.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    DM1.SqlOpen('select top 1 notes from data0699 order by pack_ptr DESC');
    LFrm.edtBZ.Text := DM1.qrytmp.fieldbyname('notes').AsString;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniPrintClick(Sender: TObject);
var
  LCustType: TCustomType;
  lCustomerCode: string;
begin
  DM1.ppPrint.PrinterSetup.PrinterName := cbxPrinter.Text;
  gPrintName := cbxPrinter.Text;
  if DM1.adsFrmMain.FieldByName('v_print').AsBoolean then
  begin
    ShowMessage('已经打印过，禁止打印，如需请用高级权限选择重印');
    Exit;
  end;

  if DM1.adsFrmMain.FieldByName('ORIG_CUSTOMER').AsString <> '' then
  begin
    if DM1.SqlOpen('select cust_code from data0010 where abbr_name = ' + QuotedStr(DM1.adsFrmMain.fieldbyname('ORIG_CUSTOMER').AsString)) then
      LCustType := GetCustType(DM1.qrytmp.fieldbyname('cust_code').AsString)
    else
      LCustType := ctUnknow;
    lCustomerCode := DM1.qrytmp.fieldbyname('cust_code').AsString;
  end
  else
  begin
    LCustType := GetCustType(DM1.adsFrmMain.fieldbyname('CUST_CODE').AsString);
    lCustomerCode := DM1.adsFrmMain.fieldbyname('CUST_CODE').AsString;
  end;

  case LCustType of
    ctZXKX:
    begin
      Print_2303(LCustType,lCustomerCode);
    end;
    ctWT:
    begin
      Print_WT(LCustType);
    end;
    ctDGDELL:
    begin
      Print_DGDell(LCustType);
    end;
    ctHWZD:
    begin
      Print_HWZD(LCustType);
    end;
    ctDGHS:
    begin
      ShowMessage(DM1.adsFrmMain.fieldbyname('CUST_CODE').AsString);
      ShowMessage('标签待制作');
      //Print_DGHS(LCustType);
    end;
    ctUnknow:
    begin
      ShowMessage('不支持该客户的打印');
    end;
  else
    Common_Print(LCustType);
  end ;
end;

procedure TfrmMain.pmMainPopup(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to pmMain.Items.Count - 1 do
  begin
    pmMain.Items[I].Enabled := DM1.adsFrmMain.RecordCount > 0;
  end;
  mniPrint.Enabled := not DM1.adsFrmMain.FieldByName('v_print').AsBoolean;
  FOrgCust_Code := '';
  FIniManu_Part_Number := '';
  FIniSalesOrder := '';
  FSaleCustCode := '';
  mniCreateOutTag.Enabled := True;
end;

procedure TfrmMain.mniHWZD1915Click(Sender: TObject);
var
  LFrm: TfrmHWZD1915;
begin
  LFrm := TfrmHWZD1915.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    DM1.SqlOpen('select top 1 notes from data0699 order by pack_ptr DESC');
    LFrm.edtBZ.Text := DM1.qrytmp.fieldbyname('notes').AsString;      
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);    
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniZK0275MZClick(Sender: TObject);
var
  LFrm: TfrmZXKX2303;
begin
  LFrm := TfrmZXKX2303.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);    
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniSZHS2258Click(Sender: TObject);
var
  LFrm: TfrmHS2258;
begin
  LFrm := TfrmHS2258.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);    
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniN21041Click(Sender: TObject);
var
  LFrm: TfrmMRMT2104;
begin
  LFrm := TfrmMRMT2104.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;   
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);    
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniN1901SZ1Click(Sender: TObject);
var
  LFrm: TfrmCLS1901;
begin
  LFrm := TfrmCLS1901.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;   
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);    
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniN1Click(Sender: TObject);
begin
  DM1.SqlExec('DELETE FROM Data0699 WHERE Pack_Ptr = ' + dm1.adsFrmMain.FieldByName('RKey').AsString);
  DM1.SqlExec('DELETE FROM Data0698 WHERE RKey = ' + dm1.adsFrmMain.FieldByName('RKey').AsString);
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniCanReprintClick(Sender: TObject);
var
  lperFrm: TfrmHighPermit;
begin
  if gUser.User_Permit <> '4' then
  begin
    lperFrm := TfrmHighPermit.Create(Self);
    try
      if lperFrm.ShowModal <> mrok then
      begin
        Exit;
      end;
    finally
      lperFrm.Free;
    end;
  end;
  
  if not DM1.adsFrmMain.IsEmpty then
  begin
    DM1.adsFrmMain.Edit;
    DM1.adsFrmMain.FieldByName('v_print').AsBoolean := False;
    DM1.adsFrmMain.Post;
  end;
end;

procedure TfrmMain.mniN23901Click(Sender: TObject);
var
  LFrm: TfrmDaHua2390;
begin
  LFrm := TfrmDaHua2390.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);    
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniN60041Click(Sender: TObject);
var
  LFrm: TfrmJmp;
begin
  LFrm := TfrmJmp.Create(Self,Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1));

  try
    if LFrm.ShowModal = mrok then
    begin
      FIniManu_Part_Number := LFrm.edtBCBH.Text;
      FIniSalesOrder := LFrm.edtXSDD.Text;
      FOrgCust_Code := LFrm.FOrgCust;
      FSaleCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
      case GetCustType(LFrm.FOrgCust) of
        ctHW, ctCDHW, ctHWAJX://华为技术
        begin
          mniHW1806Click(Self);
        end;
        ctHWZD://华为终端
        begin
          mniHWZD1915Click(Self);
        end;
        ctMRMT://明锐明泰
        begin
          mniN21041Click(Self);
        end;
        //ctSAMSUNG,//三星
        //ctGreatWall,//长城
        ctCLS://创力仕
        begin
          mniN1901SZ1Click(Self);
        end;
        ctZXKX://中兴康讯
        begin
          mniZK0275MZClick(Self);
        end;
        ctHS://海思半导体
        begin
          mniSZHS2258Click(Self);        
        end;
        ctDH://大华
        begin
          mniN23901Click(Self);
        end;
        ctDYH,ctSSJ://大运河
        begin
          mniN71011Click(Self);
        end;
        ctWT://闻泰
        begin
          mniN62591Click(Self);
        end;
        ctHQ://华勤
        begin
          mniN60951Click(Self);
        end;
        ctTCL://TCL
        begin
          mniN62981Click(Self);
        end;
        ctJCKJ://精诚科技
        begin
          nN63781Click(Self);
        end;
        ctYYD:
        begin
          N73401Click(Self);
        end;
        ctDGHS:
        begin
          N73251Click(Self);
        end;
        ctDGDELL:
        begin
          mniN73641Click(Self);
        end;
        ctBCKJ:
        begin
          mniN23901Click(Self);
        end;
        ctUnknow://其他
        begin
          ShowMessage('不支持的客户');
          Exit;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.mniN71011Click(Sender: TObject);
var
  LFrm: TfrmDYH7100;
begin
  LFrm := TfrmDYH7100.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);  
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniN60951Click(Sender: TObject);
var
  LFrm: TfrmHQ6095;
begin
  LFrm := TfrmHQ6095.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);  
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniN62591Click(Sender: TObject);
var
  LFrm: TfrmWT6259;
begin
  LFrm := TfrmWT6259.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);  
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniN62981Click(Sender: TObject);
var
  LFrm: TfrmTCL6298;
begin
  LFrm := TfrmTCL6298.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);  
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.nN63781Click(Sender: TObject);
var
  LFrm: Tfrm6378;
begin
  LFrm := Tfrm6378.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.N73401Click(Sender: TObject);
var
  LFrm: TfrmYYD7340;
begin
  LFrm := TfrmYYD7340.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.N73251Click(Sender: TObject);
var
  LFrm: TfrmHS7325;
begin
  LFrm := TfrmHS7325.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  DM1.ppDesigner1.ShowModal;
end;

procedure TfrmMain.mniN73641Click(Sender: TObject);
var
  LFrm: TfrmDell7364;
begin
  LFrm := TfrmDell7364.Create(Self);
  try
    LFrm.FCustCode := Copy(TMenuItem(Sender).Caption,1, Pos('_',TMenuItem(Sender).Caption)-1);
    if FOrgCust_Code = '' then
      FOrgCust_Code := LFrm.FCustCode
    else
      LFrm.FCustCode := FOrgCust_Code;
    if FSaleCustCode = '' then
      LFrm.FSaleCustCode := LFrm.FCustCode
    else
      LFrm.FSaleCustCode := FSaleCustCode;
    LFrm.btnResetClick(nil);
    LFrm.edtBCBH.Text := FIniManu_Part_Number;
    LFrm.edtXSDD.Text := FIniSalesOrder;
    LFrm.edtBCBHExit(LFrm.edtBCBH);
    LFrm.edtXSDDExit(LFrm.edtXSDD);  
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;
  DM1.adsFrmMain.Requery();
end;

procedure TfrmMain.mniCreateOutTagClick(Sender: TObject);
var
  LFrm: TfrmCreateOutTag;
begin
  LFrm := TfrmCreateOutTag.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

end.
