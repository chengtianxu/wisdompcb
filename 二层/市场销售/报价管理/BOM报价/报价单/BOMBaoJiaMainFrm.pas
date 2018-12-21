unit BOMBaoJiaMainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBClient, StdCtrls, ExtCtrls, RzPanel,
  ADODB, Provider, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, Vcl.Buttons, DM, Vcl.ComCtrls, Vcl.Menus, frxClass,
  frxDesgn,frxDesgnEditors, EhLibVCL, RzButton, Vcl.DBGrids, RzDBGrid,
  Bde.DBTables;

type
  TfrmMainBOMBaoJia = class(TForm)
    pnl1: TPanel;
    lblFilter: TLabel;
    btn1: TBitBtn;
    btnRefresh: TBitBtn;
    edtFilter: TEdit;
    ehMain: TDBGridEh;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    lbl3: TLabel;
    dtp2: TDateTimePicker;
    pm1: TPopupMenu;
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniView: TMenuItem;
    mniDelete: TMenuItem;
    mniPostPass: TMenuItem;
    mniN5: TMenuItem;
    btnQuery: TBitBtn;
    btnEditReport: TBitBtn;
    mniPrint: TMenuItem;
    mniN3: TMenuItem;
    mniChaKanShenPiLiuCheng: TMenuItem;
    rpt1: TfrxReport;
    mniCopy: TMenuItem;
    strngfldMainBPNO: TStringField;
    strngfldMainCustomer_Name: TStringField;
    strngfldMainManu_Part_Desc: TStringField;
    intgrfldMainD10_Ptr: TIntegerField;
    strngfldMainBP00_Ptr: TStringField;
    cdsMainhanshuijiage_Pcs: TFMTBCDField;
    cdsMainbuhanshuijiage_Pcs: TFMTBCDField;
    intgrfldMainD01_Ptr: TIntegerField;
    cdsMainmaolilv_add: TFMTBCDField;
    intgrfldMainCreateMan: TIntegerField;
    intgrfldMainSaleMan: TIntegerField;
    dtmfldMainBPTime: TDateTimeField;
    intgrfldMainAuthStatus: TIntegerField;
    cdsMainCurRate: TFMTBCDField;
    strngfldMainpayment: TStringField;
    intgrfldMainEnableDays: TIntegerField;
    strngfldMainANALYSIS_CODE_2: TStringField;
    strngfldMainCUST_CODE: TStringField;
    strngfldMainMANU_PART_NUMBER: TStringField;
    cdsMainbpname: TWideStringField;
    strngfldMainCURR_NAME: TStringField;
    strngfldMainSMan: TStringField;
    strngfldMainCMan: TStringField;
    strngfldMainIDKEY: TStringField;
    intgrfldMaind264_ptr: TIntegerField;
    mniPrintIN: TMenuItem;
    mniPrintOutCN: TMenuItem;
    btnExportToExcel: TBitBtn;
    strngfldMainThickness: TStringField;
    strngfldMainbSet_L: TStringField;
    strngfldMainbSet_W: TStringField;
    strngfldMainbPCSPerSet: TStringField;
    strngfldMainbSurface: TStringField;
    mniExportDeptBOMExcel: TMenuItem;
    strngfldMainBPType: TStringField;
    mniPrintOutEN: TMenuItem;
    pnl2: TPanel;
    cbxStatus0: TCheckBox;
    lbl1: TLabel;
    cbxStatus1: TCheckBox;
    cbxStatus2: TCheckBox;
    cbxStatus3: TCheckBox;
    cbxStatus4: TCheckBox;
    cbxUserOnly: TCheckBox;
    pm2: TPopupMenu;
    mniShenPiPass: TMenuItem;
    mniShenPiNoPass: TMenuItem;
    mniAuthView: TMenuItem;
    mniViewShenpiStep: TMenuItem;
    qry1: TADOQuery;
    updtsql2: TUpdateSQL;
    pnl3: TPanel;
    lbl4: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    cdsMainAuth_NoteList: TStringField;
    btn2: TBitBtn;
    fmtbcdfldMainjinglilv_add: TFMTBCDField;
    cdsMainbUseAge: TStringField;
    cdsMainOrignPrice: TFMTBCDField;
    cdsMainLayers: TIntegerField;
    fmtbcdfldMainOrignPrice_M: TFMTBCDField;
    fmtbcdfldMainP1_M: TFMTBCDField;
    fmtbcdfldMainP1P2P3P4P5_M: TFMTBCDField;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniDeleteClick(Sender: TObject);
    procedure mniPostPassClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure mniPrintClick(Sender: TObject);
    procedure mniShenPiPassClick(Sender: TObject);
    procedure mniShenPiNoPassClick(Sender: TObject);
    procedure mniChaKanShenPiLiuChengClick(Sender: TObject);
    procedure btnEditReportClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure mniPrintOutCNClick(Sender: TObject);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure mniExportDeptBOMExcelClick(Sender: TObject);
    procedure mniPrintOutENClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    FHotColum: TColumnEh;
  public
    { Public declarations }
    FWhere: string;
    FIsAuth: Boolean;
    procedure GetData;
    function GetAuthStatusStr: string;
    procedure SHenpiPass;
    procedure UnDoShenpi;
  end;

var
  frmMainBOMBaoJia: TfrmMainBOMBaoJia;

implementation
uses
  DataIntf, DBImpl, WZ_gUnit, System.DateUtils, BOMBaoJiaEditFrm, BomBaoJiaQueryFrm,
  RptDM, BOMPricePrintSetFrm, RptDMOut, System.Win.ComObj, ShenPiFrm;

{$R *.dfm}


{ TfrmMainBOMBaoJia }

procedure TfrmMainBOMBaoJia.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainBOMBaoJia.btn2Click(Sender: TObject);
var
  LStr: string;
begin
  {$IFDEF BaoJia}
  LStr := '1: 只能查看自己绑定客户的报价' + #13#10 +
          '2: 只能查看编辑自己绑定的客户报价' + #13#10 +
          '3: 可以查看所有BOM报价' + #13#10 +
          '4: 可以查看编辑所有BOM报价' + #13#10 +
          '5：可以查看高级内容 扩展权限,手动设置';
  {$ENDIF}
  {$IFDEF Auth}
  LStr := '1: 审核权限';
  {$ENDIF}
  ShowMessage(LStr);
end;

procedure TfrmMainBOMBaoJia.btnEditReportClick(Sender: TObject);
var
  LFileName: string;
begin
  LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
               'BOMPriceRpt_1.fr3';
  rpt1.Clear;
  rpt1.LoadFromFile(LFileName,True);
  rpt1.DesignReport();
end;

procedure Export_dbGridEH_to_Excel(AEh: TDBGridEh);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not AEh.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  try
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := 'sheet1';
  Sheet := XLApp.Workbooks[1].WorkSheets['sheet1'];
  AEh.DataSource.DataSet.DisableControls;
  AEh.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to AEh.Columns.Count - 1 do
    if (AEh.Columns.Items[iCount].Visible = true) and (AEh.Columns.Items[iCount].FieldName <> '') then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        AEh.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not AEh.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to AEh.Columns.Count - 1 do
      if (AEh.Columns[iCount].Visible = true)and (AEh.Columns.Items[iCount].FieldName <> '') then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          AEh.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    AEh.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  AEh.DataSource.DataSet.First;
  AEh.DataSource.DataSet.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Export_DataSet_to_Excel(ADs,ADs2: TDataSet);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet,Sheet2: Variant;
begin
  if not ADs2.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  try
  XLApp.WorkBooks.Add;
  XLApp.WorkBooks[1].WorkSheets.add;
  XLApp.SheetsInNewWorkbook := 1;

//  XLApp.WorkBooks[1].WorkSheets[1].Name := 'sheet1';
//  XLApp.WorkBooks[1].WorkSheets[2].Name := 'sheet2';
  Sheet := XLApp.Workbooks[1].WorkSheets['sheet1'];
  Sheet2 := XLApp.Workbooks[1].WorkSheets['sheet2'];
  ADs2.DisableControls;
  ADs2.first;
  ADs.DisableControls;
  ADs.first;


  Sheet.Cells[1, 1] := '步骤';
  Sheet.Cells[1, 2] := '工序代码';
  Sheet.Cells[1, 3] := '工序名称';
  Sheet.Cells[1, 4] := '主料成本';
  Sheet.Cells[1, 5] := '辅料成本';
  Sheet.Cells[1, 6] := '人工成本';
  Sheet.Cells[1, 7] := '水电成本';
  Sheet.Cells[1, 8] := '折旧成本';
  Sheet.Cells[1, 9] := '合计PCS成本';
  Sheet.Cells[1, 10] := '合计平米成本';

  jCount := 1;
  while not ADs.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to ADs.fields.Count - 1 do
    begin
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          ADs.fields[iCount].AsString;
    end;

    Inc(jCount);
    ADs.Next;
  end;


  Sheet2.Cells[1, 1] := '步骤';
  Sheet2.Cells[1, 2] := '工序代码';
  Sheet2.Cells[1, 3] := '工序名称';
  Sheet2.Cells[1, 4] := '材料';
  Sheet2.Cells[1, 5] := '材料每PCS消耗量';
  Sheet2.Cells[1, 6] := '材料每平米消耗';
  Sheet2.Cells[1, 7] := '材料每PCS价格';
  Sheet2.Cells[1, 8] := '主料成本';
  Sheet2.Cells[1, 9] := '辅料成本';
  Sheet2.Cells[1, 10] := '人工成本';
  Sheet2.Cells[1, 11] := '水电成本';
  Sheet2.Cells[1, 12] := '折旧成本';
  Sheet2.Cells[1, 13] := '合计PCS成本';
  Sheet2.Cells[1, 14] := '合计平米成本';

  jCount := 1;
  while not ADs2.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to ADs2.fields.Count - 1 do
    begin
        Sheet2.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          ADs2.fields[iCount].AsString;
    end;

    Inc(jCount);
    ADs2.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  ADs2.First;
  ADs2.EnableControls;
  ADs.DisableControls;
  ADs.first;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmMainBOMBaoJia.btnExportToExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(ehMain);

end;
procedure TfrmMainBOMBaoJia.btnQueryClick(Sender: TObject);
var
  LFrm: TfrmBomBaoJiaQuery;
begin
  LFrm := TfrmBomBaoJiaQuery.Create(Self);
  try
    LFrm.dtpk1.DateTime := dtp1.DateTime;
    LFrm.dtpk2.DateTime := dtp2.DateTime;
    if LFrm.ShowModal = mrOk then
    begin
      dtp1.DateTime := LFrm.dtpk1.DateTime;
      dtp2.DateTime := LFrm.dtpk2.DateTime;
      FWhere := LFrm.GetWhereStr;
      GetData;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.btnRefreshClick(Sender: TObject);
begin
  GetData;
end;

procedure TfrmMainBOMBaoJia.dtp1Change(Sender: TObject);
begin
  GetData;
end;

procedure TfrmMainBOMBaoJia.edtFilterChange(Sender: TObject);
begin
  if FHotColum = nil then FHotColum := ehMain.Columns[0];
  if Trim(edtFilter.Text) <> '' then
  begin
    if FHotColum.Field.DataType in [ftString, ftWideString] then
    begin
      cdsMain.Filter := FHotColum.FieldName + ' like ''%' + Trim(UpperCase(edtFilter.Text)) + '%''';
      cdsMain.Filtered := True;
    end else
    if FHotColum.Field.DataType in [ftSmallint, ftInteger] then
    begin
      cdsMain.Filter := FHotColum.FieldName + ' >=' + Trim(UpperCase(edtFilter.Text));
      cdsMain.Filtered := True;
    end;

  end else
    cdsMain.Filtered := False;
end;

procedure TfrmMainBOMBaoJia.ehMainTitleClick(Column: TColumnEh);
var
  LOP: TIndexOptions;
begin
  inherited;
  lblFilter.Caption := Column.Title.Caption;
  FHotColum := Column;
  if not Column.Field.IsBlob then { 不能给大二进制字段建立索引或排序 }
  begin
    if column.Title.SortMarker =smDownEh then
    begin
     column.Title.SortMarker:=smUpEh;
     lop:=[];
    end else
    begin
     column.Title.SortMarker:=smDownEh;
     LOP := [ixDescending];
    end;
    cdsMain.IndexDefs.Update;
    if cdsMain.IndexDefs.IndexOf('index1') >= 0 then
      cdsMain.DeleteIndex('index1');
    cdsMain.AddIndex('index1', Column.FieldName, LOP, '');
    cdsMain.IndexName := 'index1';

    cdsMain.First;
  end;
end;

procedure TfrmMainBOMBaoJia.FormCreate(Sender: TObject);
begin
  dtp1.Date := IncDay(dm1.GetSvrNowTime,-7);
  dtp2.Date := dm1.GetSvrNowTime;
end;

procedure TfrmMainBOMBaoJia.FormShow(Sender: TObject);
var
  I: Integer;
begin
  {$IFDEF Auth}
    ehMain.PopupMenu := pm2;
    cbxUserOnly.Visible := False;
    pnl3.Visible := True;
    pnl2.Visible := False;
  {$ENDIF}

  {$IFDEF BaoJia}
    pnl3.Visible := False;
    pnl2.Visible := True;
  {$ENDIF}
  GetData;
  ehMain.Columns[11].Visible := (StrToIntdef(gUser.User_Permit,1) >= 3) or FIsAuth;
  ehMainTitleClick(ehMain.Columns[0]);

  {$REGION '工程部权限不能看到价格'}
  if gUser.User_Permit = '8' then
  begin
    for I := 7 to ehMain.Columns.Count - 1 do
    begin
      ehMain.Columns[I].Visible := False;
    end;
  end;
  {$ENDREGION}
end;

function TfrmMainBOMBaoJia.GetAuthStatusStr: string;
begin
  Result := ' AND AuthStatus in (-1';
  {$IFDEF Auth}
    if rb1.Checked then
      Result := Result + ',1,2';
    if rb2.Checked then
      Result := Result + ',3';
    if rb3.Checked then
      Result := Result + ',4';
  {$ENDIF}

  {$IFDEF BaoJia}
    if cbxStatus0.Checked then
      Result := Result + ',0';
    if cbxStatus1.Checked then
      Result := Result + ',1';
    if cbxStatus2.Checked then
      Result := Result + ',2';
    if cbxStatus3.Checked then
      Result := Result + ',3';
    if cbxStatus4.Checked then
      Result := Result + ',4';
  {$ENDIF}
  Result := Result + ') ';

  if cbxUserOnly.Checked then
  begin
    {$IFDEF BaoJia}
      Result := Result + ' and BP06.CreateMan = ' + gUser.User_Ptr;
    {$ENDIF}
  end;
end;

procedure TfrmMainBOMBaoJia.GetData;
var
  IBP06: IData;
  LWhere: string;
  lSql: string;
begin
  cdsMain.IndexDefs.Update;
  if cdsMain.IndexDefs.IndexOf('index1') >= 0 then
    cdsMain.DeleteIndex('index1');

  LWhere := 'where createtime between ' + QuotedStr(gDateTimeToStr(dtp1.DateTime)) + ' AND ' +  QuotedStr(gDateTimeToStr(dtp2.DateTime));
  {$REGION '报价员'}

  {$IFDEF BaoJia}
  begin
    //绑定客户
    if (gUser.User_Permit = '1') or (gUser.User_Permit = '2') then
    begin
      LWhere := LWhere + 'AND ISNULL(BP06.D10_Ptr,0) in (select d10.rkey from data0010 d10' +
              ' inner join data0100 d100 on d10.rkey = d100.CUSTOMER_PTR ' +
               ' where d100.CSI_PTR  = ' + gUser.User_Longin_Ptr + ') ';
    end;
    LWhere := LWhere + GetAuthStatusStr;

    updtsql2.InsertSQL.Text := LWhere;
    //lSql := updtsql2.DeleteSQL.Text + updtsql2.InsertSQL.Text + updtsql2.ModifySQL.Text;
    lSql := updtsql2.ModifySQL.Text + updtsql2.InsertSQL.Text;
    if FWhere <> '' then
      //lSql := lSql + ' where (1=1) and ' + FWhere;
      lSql := lSql + ' and ' + FWhere;
  end;
  {$ENDIF}
  {$ENDREGION}


  {$REGION '报价审核'}
  {$IFDEF Auth}
  begin
    if rb1.Checked then
    begin
      LWhere := LWhere + ' and EXISTS(select 1 from BOMPrice14 bp14 ' +
        ' WHERE bp06.idkey = bp14.BP06_Ptr and bp14.D05_ptr = ' + gUser.User_Ptr +' and bp14.nowauth = 1) ';
    end else
    if rb2.Checked or rb3.Checked then
    begin
      LWhere := LWhere + ' and EXISTS(select 1 from BOMPrice14 bp14 ' +
        ' WHERE bp06.idkey = bp14.BP06_Ptr and bp14.D05_ptr = ' + gUser.User_Ptr +') ';
    end ;
    LWhere := LWhere + GetAuthStatusStr;
    if FWhere <> '' then
      LWhere := LWhere + ' AND ' + FWhere;

    updtsql2.InsertSQL.Text := LWhere;
    //lSql := updtsql2.DeleteSQL.Text + updtsql2.InsertSQL.Text + updtsql2.ModifySQL.Text;
    lSql := updtsql2.ModifySQL.Text + updtsql2.InsertSQL.Text;
  end;
  {$ENDIF}
  {$ENDREGION}


  IBP06 := TBP06.Create;
  IBP06.SetSql(lSql);
  //ShowMessage(gUser.User_Permit);
  //ShowMessage(lSql);
  cdsMain.Data := IBP06.GetData;
end;

procedure TfrmMainBOMBaoJia.mniNewClick(Sender: TObject);
var
  LFrm: TfrmEditBOMBaoJia;
begin
  LFrm := TfrmEditBOMBaoJia.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(btnRefresh);
      cdsMain.Locate('IDKey',lfrm.cdsBP06.FieldByName('idkey').AsString,[loCaseInsensitive]);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.mniEditClick(Sender: TObject);
var
  LFrm: TfrmEditBOMBaoJia;
begin
  LFrm := TfrmEditBOMBaoJia.Create(Self);
  try
    LFrm.FIDKey := cdsMain.FieldByName('idkey').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(btnRefresh);
      cdsMain.Locate('IDKey',lfrm.cdsBP06.FieldByName('idkey').AsString,[loCaseInsensitive]);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.mniExportDeptBOMExcelClick(Sender: TObject);
var
  LSql,LSql2: string;
  LCds,LCds2: TClientDataSet;
  LTmp: ITmp;
begin
  LSql := ' SELECT bp07.Selforder,DEPT_CODE,DEPT_NAME,d17.INV_PART_DESCRIPTION,MUsePerPcs,MUsePrice_M,MUsePrice,P1,P2,P3,P4,P5,bp07.AllP,AllP_M FROM BOMPrice07 bp07 ' +
          ' INNER JOIN BOMPrice08 bp08 ON bp07.BP06_ptr = bp08.BP06_ptr and bp08.d34_ptr = bp07.d34_ptr ' +
          ' INNER JOIN Data0017 d17 ON d17.RKEY = D17_ptr ' +
          ' INNER JOIN Data0034 d34 ON d34.RKEY = bp07.D34_ptr ' +
          ' WHERE bp07.BP06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString) + ' order by Selforder asc';
  LSql2 := ' SELECT bp07.Selforder,DEPT_CODE,DEPT_NAME,P1,P2,P3,P4,P5,bp07.AllP,AllP_M FROM BOMPrice07 bp07 ' +
          ' INNER JOIN Data0034 d34 ON d34.RKEY = bp07.D34_ptr ' +
          ' WHERE bp07.BP06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString) + ' order by Selforder asc';
  LCds := TClientDataSet.Create(Self);
  LCds2 := TClientDataSet.Create(Self);
  LTmp := ttmp.Create;
  try
    LCds.Data := LTmp.SqlOpen(LSql);
    LCds2.Data := LTmp.SqlOpen(LSql2);

    Export_DataSet_to_Excel(LCds2,LCds);

  finally
    LCds.Free;
    LCds2.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.mniViewClick(Sender: TObject);
var
  LFrm: TfrmEditBOMBaoJia;
  LComponent: TComponent;
  I: Integer;
begin
  LFrm := TfrmEditBOMBaoJia.Create(Self);
  LFrm.FReadOnly := True;
  try
    LFrm.FIDKey := cdsMain.FieldByName('idkey').AsString;
    for I := 0 to LFrm.ComponentCount - 1 do
    begin
      LComponent := LFrm.Components[I];
      //if LComponent is TClientDataSet then (LComponent as TClientDataSet).ReadOnly := True;
      if LComponent is TButton then (LComponent as TButton).Enabled := False;
      if LComponent is Trzbutton then (LComponent as Trzbutton).Enabled := False;
      if LComponent is TSpeedButton then (LComponent as TSpeedButton).Enabled := False;
      if LComponent is TDBGridEh then (LComponent as TDBGridEh).ReadOnly := True;
      if LComponent is TDBGridEh then (LComponent as TDBGridEh).PopupMenu := nil;
    end;
    LFrm.btnExit.Enabled := True;
    LFrm.btnViewMI.Enabled := True;
    if LFrm.ShowModal = mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.mniChaKanShenPiLiuChengClick(Sender: TObject);
var
  LTmp: ITmp;
  LCds: TClientDataSet;
  LSql: string;
  LStr: string;
begin
  LTmp := TTmp.Create;
  LCds := TClientDataSet.Create(Self);
  try
    LSql := ' select BP06.Auth_NoteList,bp14.SeqNo,d05.EMPLOYEE_NAME,case bp14.Auth_Flag when 0 then ''未审核'' when 1 then ''成功审核'' when 2 then ''审核不通过'' end as auth_flag from bomprice14 bp14 ' +
            ' inner join data0005 d05 on d05.RKEY = bp14.D05_ptr ' +
            ' INNER JOIN BomPrice06 BP06 on bp14.bp06_ptr = BP06.IDKey ' +
            ' where bp14.bp06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString) +
            ' order BY bp14.SeqNo ASC ';
    LCds.Data := LTmp.SqlOpen(LSql);
    LStr := '审批流程信息：';
    while not LCds.Eof do
    begin
      LStr := LStr + #13 + LCds.FieldByName('seqno').AsString + ':  ' + LCds.FieldByName('EMPLOYEE_NAME').AsString + '   ' + LCds.FieldByName('auth_flag').AsString;
      LCds.Next;
    end;
    if not LCds.IsEmpty then
    begin
      LStr := Lstr + #13 + '----------------------------------------------------';
      LStr := LStr + #13 + '审批备注记录: ' + #13 + LCds.FieldByName('Auth_NoteList').AsString;
    end;
    ShowMessage(LStr);
  finally
    LCds.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.mniCopyClick(Sender: TObject);
var
  LFrm: TfrmEditBOMBaoJia;
begin
  LFrm := TfrmEditBOMBaoJia.Create(Self);
  try
    LFrm.FIDKey := cdsMain.FieldByName('idkey').AsString;
    LFrm.FBCopy := True;
    LFrm.edtManuPartNum.Text := cdsMain.FieldByName('MANU_PART_NUMBER').AsString;
    LFrm.btnSvae.Enabled := False;
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(btnRefresh);
      cdsMain.Locate('IDKey',lfrm.cdsBP06.FieldByName('idkey').AsString,[loCaseInsensitive]);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.mniDeleteClick(Sender: TObject);
var
  Itmp: IData;
  lcds: TClientDataSet;
begin
  if MessageBox(Handle,'是否删除','提示',MB_YESNO) = IDYES then
  begin
    lcds := TClientDataSet.Create(Self);
    Itmp := TBP06.Create;
    Itmp.SetSql('select * from bomprice06 where idkey = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString));
    try
      lcds.Data := Itmp.GetData;
      if not lcds.IsEmpty then
        lcds.Delete;
      if PostdataByInterface(lcds,Itmp) then
      begin
        cdsMain.Delete;
        ShowMessage('删除成功');
      end;
    finally
      lcds.Free;
    end;
  end;
end;

procedure TfrmMainBOMBaoJia.mniPostPassClick(Sender: TObject);
var
  LCds,LCds265: TClientDataSet;
  LIBP14: IData;
  LItmp: IData;
  LSql: string;
  LRkey14: Integer;
  LCdstmp: TClientDataSet;
  ltmp: ITmp;
begin
  if cdsMain.FieldByName('d264_ptr').AsInteger = 0 then
  begin
    ShowMessage('请选择审批流程');
    Exit;
  end;


  if MessageBox(Handle,'是否提交审批操作?','提示',MB_YESNO) <> ID_YES then
  begin
    Exit;
  end;

  {$REGION '总裁特批流程'}
//  LCdstmp := TClientDataSet.Create(Self);
//  ltmp := TTmp.Create;
//  try
//    LCdstmp.Data := ltmp.SqlOpen('select * from bompirce06 where idkey = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString));
//    if LCdstmp.FieldByName('redline').AsFloat <> 0 then
//    begin
//      if LCdstmp.FieldByName('Redline').AsFloat <= LCdstmp.FieldByName('buhanshuijiage_M').AsFloat then
//      begin
//        LCdstmp.Data := Ltmp.SqlOpen('select rkey, CODE, QTE_APPROV_DESC from data0264 where rkey = ' + IntToStr(LCdstmp.FieldByName('d264_ptr').AsInteger));
//        if LCdstmp.IsEmpty then
//        begin
//          ShowMessage('没有找到特批流程，失败');
//          Exit;
//        end;
//        if LCdstmp.FieldByName('code').AsString <> '99999' then
//        begin
//          ShowMessage('超过红线价格，请选择代码99999的总裁特批流程');
//          Exit;
//        end;
//      end;
//    end;
//  finally
//    LCdstmp.Free;
//  end;

  {$ENDREGION}



  LCds := TClientDataSet.Create(Self);
  LCds265 := TClientDataSet.Create(Self);
  LIBP14 := TTableBase.Create;
  LItmp := TTableBase.Create;
  DM1.con1.BeginTrans;
  try
    //删除原有的审核记录
    LIBP14.SetSql('select * from bomprice14 where bp06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString));
    LCds.Data := LIBP14.GetData;
    while not LCds.Eof do
      LCds.Delete;
    if not PostdataByInterface(LCds,LIBP14) then
      Exit;

    //查询出审批流程265表增加到BP14
    LSql := 'SELECT d05.rkey,USER_PTR FROM Data0265 ' +
            ' inner join data0073 d73 on d73.rkey = Data0265.USER_PTR ' +
            ' inner join data0005 d05 on d05.rkey = d73.EMPLOYEE_PTR ' +
            ' where (lower_limit >= ' + cdsMain.FieldByName('jinglilv_add').AsString +') and ' +
            ' (upper_limit <= ' + cdsMain.FieldByName('jinglilv_add').AsString + ') and ' + '(AUTH_GROUP_PTR= ' + cdsMain.FieldByName('d264_ptr').AsString + ')' +
            ' order by Data0265.rkey asc';
    LItmp.SetSql(LSql);
    LCds265.Data := LItmp.GetData;
    LCds.MergeChangeLog;
    while not LCds265.Eof do
    begin
      LCds.Append;
      LCds.FieldByName('idkey').AsString := LIBP14.CreateKeyID;
      LCds.FieldByName('bp06_ptr').AsString := cdsMain.FieldByName('idkey').AsString;
      LCds.FieldByName('d05_ptr').AsInteger := LCds265.FieldByName('rkey').AsInteger;
      LCds.FieldByName('seqno').AsInteger := LCds.RecordCount;
      LCds.Post;
      LCds265.Next;
    end;
    if not lcds.IsEmpty then
    begin
      LCds.First;
      LCds.Edit;
      LCds.FieldByName('NowAuth').AsBoolean := True;
      LCds.Post;
    end;
    if not PostdataByInterface(LCds,LIBP14) then
      Exit;

    //短信通知
    LItmp.SetSql('select * from data0014 where rkey = -1');
    LCds.Data := LItmp.GetData;
    LCds.Append;
    LCds.FieldByName('idkey').AsString := LItmp.CreateKeyID;
    LCds.FieldByName('MESSAGE').AsString := '有一张报价单需要通过您的审批,报价人员:' + cdsmain.FieldByName('cman').AsString +
                                            ' 报价编号: ' + cdsMain.FieldByName('BPNO').AsString;
    LCds.FieldByName('whosend').AsString := gUser.User_Longin_Ptr;
    LCds.Post;
    if not PostdataByInterface(LCds,LItmp) then
      Exit;
    LItmp.SetSql('select rkey from data0014 where idkey = ' + QuotedStr(LCds.FieldByName('idkey').AsString));
    LCds.Data := LItmp.GetData;
    LRkey14 := LCds.FieldByName('rkey').AsInteger;

    LItmp.SetSql('select * from data0314 where 1=0');
    LCds.Data := LItmp.GetData;
    LCds265.First;
    while not LCds265.Eof do
    begin
      LCds.Append;
      LCds.FieldByName('emp_ptr').AsInteger := LCds265.FieldByName('USER_PTR').AsInteger;
      LCds.FieldByName('d14_ptr').AsInteger := LRkey14;
      LCds.Post;
      LCds265.Next;
    end;
    if not PostdataByInterface(LCds,LItmp) then
      Exit;


    //更改BP06的状态
    LItmp.SetSql('select * from bomprice06 where idkey = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString));
    LCds.Data := LItmp.GetData;
    LCds.Edit;
    LCds.FieldByName('authstatus').AsInteger := 1;
    LCds.Post;
    if not PostdataByInterface(LCds,LItmp) then
      Exit;

    cdsMain.Edit;
    cdsMain.FieldByName('authstatus').AsInteger := 1;
    cdsMain.Post;

    dm1.con1.CommitTrans;
    ShowMessage('提交审核操作成功');
  finally
    LCds.Free;
    LCds265.Free;
    if DM1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('提交审核操作失败');
    end;
  end;
end;

procedure TfrmMainBOMBaoJia.mniPrintClick(Sender: TObject);
var
  LFrm: TdmRpt;
  LFrmSet: TfrmBomPricePrintSet;
  LFileName: string;
  LRCName: string;
begin
  if dm1.GetServerRegion(dm1.con1) = '深圳' then
  begin
    LRCName := 'SZ_BomPriceRpt_In';
    LFileName := ExtractFilePath(ParamStr(0))+'Report\BomPrice\SZ\BomPriceRpt_In.fr3';
  end else
  if dm1.GetServerRegion(dm1.con1) = '东莞' then
  begin
    LRCName := 'DG_BomPriceRpt_In';
    LFileName := ExtractFilePath(ParamStr(0))+'Report\BomPrice\DG\BomPriceRpt_In.fr3';
  end else
  if dm1.GetServerRegion(dm1.con1) = '梅州' then
  begin
    LRCName := 'MZ_BomPriceRpt_In';
    LFileName := ExtractFilePath(ParamStr(0))+'Report\BomPrice\MZ\BomPriceRpt_In.fr3';
  end else
  begin
    ShowMessage('不支持的区域');
    Exit;
  end;

  with TResourceStream.Create(HInstance,LRCName,RT_RCDATA) do
  begin
    try
      if not DirectoryExists(ExtractFileDir(LFileName)) then
      begin
        if not ForceDirectories(ExtractFileDir(LFileName)) then
          ShowMessage(ExtractFileDir(LFileName) + '路径创建失败');
      end;
      SaveToFile(LFileName);
    finally
      Free;
    end;
  end;

  if not FileExists(LFileName) then
  begin
    ShowMessage('没有对应的报表文件');
    Exit;
  end;


  LFrmSet := TfrmBomPricePrintSet.Create(Self);
  try
    if LFrmSet.ShowModal = mrOk then
    begin
      LFrm := TdmRpt.Create(Self);
      try
        LFrm.GetData(cdsMain.FieldByName('idkey').AsString);

        rpt1.LoadFromFile(LFileName,True);

        if not LFrmSet.cbxParam.Checked then
        begin
          rpt1.FindObject('Header1').Visible := False;
          rpt1.FindObject('DetailData1').Visible := False;
        end;
        if not LFrmSet.cbxDeptParam.Checked then
        begin
          rpt1.FindObject('Header4').Visible := False;
          rpt1.FindObject('DetailData3').Visible := False;
        end;
        if not LFrmSet.cbxYaheImg.Checked then
        begin
          rpt1.FindObject('DetailData6').Visible := False;
        end;
        if not LFrmSet.cbxBOM.Checked then
        begin
          rpt1.FindObject('Header2').Visible := False;
          rpt1.FindObject('DetailData2').Visible := False;
          rpt1.FindObject('Footer1').Visible := False;
        end;
        if not LFrmSet.cbxDeptPrice.Checked then
        begin
          rpt1.FindObject('Header3').Visible := False;
          rpt1.FindObject('DetailData4').Visible := False;
          rpt1.FindObject('Footer2').Visible := False;
        end;
        rpt1.ShowReport;
      finally
        LFrm.Free;
      end;
    end;
  finally
    LFrmSet.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.mniPrintOutCNClick(Sender: TObject);
var
  LFrm: TdmRptOut;
  LFileName: string;
begin
  LFrm := TdmRptOut.Create(Self);
  try

    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
                 'BOM报价单.xls';
    LFrm.PrintExcelRpt(cdsMain.FieldByName('idkey').AsString,LFileName);
  finally
    LFrm.Free;
  end;

end;

procedure TfrmMainBOMBaoJia.mniPrintOutENClick(Sender: TObject);
var
  LFrm: TdmRptOut;
  LFileName: string;
begin
  LFrm := TdmRptOut.Create(Self);
  try
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
                 'BOM报价单EN.xls';
    LFrm.PrintExcelRpt(cdsMain.FieldByName('idkey').AsString,LFileName);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJia.UnDoShenpi;
var
  LSql: string;
  LTmp: ITmp;
  LCds: TClientDataSet;
  LBp06: IBOMPrice06;
  LBp14: IData;
  LCdsBp06: TClientDataSet;
  LCdsBp14: TClientDataSet;
  LFrm: TfrmShenPi;
  LUserName: string;
begin
  LTmp := TTmp.Create;
  LBP06 := TBP06.Create;
  LBP14 := TTableBase.Create;
  LCds := TClientDataSet.Create(Self);
  LCdsBp06 := TClientDataSet.Create(Self);
  LCdsBp14 := TClientDataSet.Create(Self);
  LFrm := TfrmShenPi.Create(Self);

  LBP06.SetSql('select * from bomprice06 where idkey = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString));
  LSql := 'select * from bomprice14 where bp06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString) +
          ' and d05_ptr=' + gUser.User_Ptr;
  LBP14.SetSql(LSql);

  {$REGION '取得05的用户名'}
  LSql := ' SELECT d05.EMPLOYEE_NAME FROM Data0005 d05 ' +
          ' INNER JOIN Data0073 d73 ON d05.RKEY = d73.EMPLOYEE_PTR ' +
          ' WHERE d73.RKEY =' + gUser.User_Longin_Ptr;
  LCds.Data := LTmp.SqlOpen(LSql);
  if not LCds.IsEmpty then
    LUserName := LCds.FieldByName('EMPLOYEE_NAME').AsString;
  {$ENDREGION}

  try
    LSql := 'SELECT SALES_ORDER from data0060 where bp06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString);
    LCds.Data := LTmp.SqlOpen(LSql);
    if not lcds.IsEmpty then
    begin
      ShowMessage('销售订单： ' + LCds.FieldByName('SALES_ORDER').AsString + ' 已经引用了改报价单，取消审批失败 ');
      Exit;
    end;


    LCdsBp06.Data := LBP06.GetData;
    LCdsBp14.Data := LBP14.GetData;
    if not LCdsBp06.FieldByName('AuthStatus').AsInteger in [1,2,3] then
    begin
      ShowMessage('报价单状态已经改变,请刷新;');
      Exit;
    end;
    if LCdsBp14.IsEmpty then
    begin
      ShowMessage('报价单状态已经改变,请刷新; 或者您无权审批,请查看审批流程!');
      Exit;
    end;

    LFrm.lbl2.Caption := '不通过审批!';
    LFrm.mmo1.Lines.Text := LCdsBp06.FieldByName('Auth_NoteList').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      LSql := ' SELECT EMPLOYEE_NAME FROM BOMPrice14 bp14 ' +
              ' inner JOIN Data0005 d05 ON d05.RKEY = bp14.D05_ptr ' +
              ' WHERE bp14.Auth_Flag = 2 and bp14.BP06_Ptr = ' + QuotedStr(QuotedStr(cdsMain.FieldByName('idkey').AsString));
      LCds.Data := LTmp.SqlOpen(LSql);
      if not LCds.IsEmpty then
      begin
        ShowMessage('改记录已经被 ' + LCds.FieldByName('EMPLOYEE_NAME').AsString + ' 拒绝审批，操作失败');
        Exit;
      end;

      LCdsBp14.Edit;
      LCdsBp14.FieldByName('auth_flag').AsInteger := 2;
      LCdsBp14.FieldByName('passtime').AsDateTime := dm1.GetSvrNowTime;
      LCdsBp14.Post;

      LCdsBp06.Edit;
      LCdsBp06.FieldByName('AuthStatus').AsInteger := 4;
      LCdsBp06.FieldByName('Auth_NoteList').AsString := LCdsBp06.FieldByName('Auth_NoteList').AsString +
          LUserName + '(' + FormatDateTime('YYYY-MM-DD hh:mm:ss',dm1.GetSvrNowTime) + ')拒绝！' +
          ' : ' + LFrm.mmo2.Text + ''#13'';
      LCdsBp06.Post;

      dm1.con1.BeginTrans;
      if not PostdataByInterface(LCdsBp14,LBP14) then Exit;
      if not PostdataByInterface(LCdsBp06,LBP06) then Exit;
      dm1.con1.CommitTrans;

      cdsMain.Edit;
      cdsMain.FieldByName('AuthStatus').AsInteger := 4;
      cdsMain.Post;
      cdsMain.MergeChangeLog;

      ShowMessage('操作成功');
    end;
  finally
    LCds.Free;
    LFrm.Free;
  end;


end;

procedure TfrmMainBOMBaoJia.mniShenPiNoPassClick(Sender: TObject);
begin
  UnDoShenpi;
end;


procedure TfrmMainBOMBaoJia.SHenpiPass;
var
  LSql: string;
  LTmp: ITmp;
  LCds: TClientDataSet;
  LCdsBp06: TClientDataSet;
  LCdsBp14: TClientDataSet;
  LBP06: IBOMPrice06;
  LBP14: IData;
  LUserName: string;
  LFrm: TfrmShenPi;
  LBp06Status: Integer;
begin
  LTmp := TTmp.Create;
  LBP06 := TBP06.Create;
  LBP14 := TTableBase.Create;
  LCds := TClientDataSet.Create(Self);
  LCdsBp06 := TClientDataSet.Create(Self);
  LCdsBp14 := TClientDataSet.Create(Self);

  LBP06.SetSql('select * from bomprice06 where idkey = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString));
  LSql := 'select * from bomprice14 where bp06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString) +
          ' and auth_flag = 0 order by seqno asc';
  LBP14.SetSql(LSql);

  {$REGION '取得05的用户名'}
  LSql := ' SELECT d05.EMPLOYEE_NAME FROM Data0005 d05 ' +
          ' INNER JOIN Data0073 d73 ON d05.RKEY = d73.EMPLOYEE_PTR ' +
          ' WHERE d73.RKEY =' + gUser.User_Longin_Ptr;
  LCds.Data := LTmp.SqlOpen(LSql);
  if not LCds.IsEmpty then
    LUserName := LCds.FieldByName('EMPLOYEE_NAME').AsString;
  {$ENDREGION}

  LFrm := TfrmShenPi.Create(Self);
  try
    LCdsBp06.Data := LBP06.GetData;
    LCdsBp14.Data := LBP14.GetData;
    if not LCdsBp06.FieldByName('AuthStatus').AsInteger in [1,2] then
    begin
      ShowMessage('报价单状态已经改变,请刷新;');
      Exit;
    end;
    if LCdsBp14.IsEmpty then
    begin
      ShowMessage('报价单状态已经改变,请刷新; 或者您无权审批,请查看审批流程!');
      Exit;
    end;

    LFrm.lbl2.Caption := '通过审批!';
    LFrm.mmo1.Lines.Text := LCdsBp06.FieldByName('Auth_NoteList').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      LSql := ' SELECT EMPLOYEE_NAME FROM BOMPrice14 bp14 ' +
              ' inner JOIN Data0005 d05 ON d05.RKEY = bp14.D05_ptr ' +
              ' WHERE bp14.Auth_Flag = 2 and bp14.BP06_Ptr = ' + QuotedStr(QuotedStr(cdsMain.FieldByName('idkey').AsString));
      LCds.Data := LTmp.SqlOpen(LSql);
      if not LCds.IsEmpty then
      begin
        ShowMessage('记录已经被 ' + LCds.FieldByName('EMPLOYEE_NAME').AsString + ' 拒绝审批，操作失败');
        Exit;
      end;

      if (LCdsBp14.FieldByName('d05_ptr').AsString = gUser.User_Ptr) and (LCdsBp14.FieldByName('NowAuth').AsBoolean) then
      begin
        LCdsBp14.Edit;
        LCdsBp14.FieldByName('auth_flag').AsInteger := 1;
        LCdsBp14.FieldByName('passtime').AsDateTime := dm1.GetSvrNowTime;
        LCdsBp14.FieldByName('NowAuth').AsBoolean := False;
        LCdsBp14.Post;
        if LCdsBp14.RecNo < LCdsBp14.RecordCount then
        begin
          if not LCdsBp14.Eof then
          begin
            LCdsBp14.Next;
            LCdsBp14.Edit;
            LCdsBp14.FieldByName('NowAuth').AsBoolean := True;
            LCdsBp14.Post;
          end;
        end;
      end else
      begin
        ShowMessage('当前审核人不是您,请查看审批流程');
        Exit;
      end;


      LSql := 'select 1 from bomprice14 where bp06_ptr = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString) +
              ' and d05_ptr <> ' + gUser.User_Ptr + ' and auth_flag = 0';
      LCds.Data := LTmp.SqlOpen(LSql);
      if LCds.IsEmpty then
        LBp06Status := 3
      else
        LBp06Status := 2;

      LCdsBp06.Edit;
      LCdsBp06.FieldByName('AuthStatus').AsInteger := LBp06Status;
      LCdsBp06.FieldByName('Auth_NoteList').AsString := LCdsBp06.FieldByName('Auth_NoteList').AsString +
          LUserName + '(' + FormatDateTime('YYYY-MM-DD hh:mm:ss',dm1.GetSvrNowTime) + ')通过！' +
          ' : ' + LFrm.mmo2.Text + ''#13'';
      LCdsBp06.Post;

      dm1.con1.BeginTrans;
      if not PostdataByInterface(LCdsBp14,LBP14) then Exit;
      if not PostdataByInterface(LCdsBp06,LBP06) then Exit;
      dm1.con1.CommitTrans;

      cdsMain.Edit;
      cdsMain.FieldByName('AuthStatus').AsInteger := LBp06Status;
      cdsMain.Post;
      cdsMain.MergeChangeLog;

      ShowMessage('操作成功');
    end;

  finally
    LCds.Free;
    LCdsBp06.Free;
    LCdsBp14.Free;
    LFrm.Free;
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('操作失败');
    end;
  end;



end;

procedure TfrmMainBOMBaoJia.mniShenPiPassClick(Sender: TObject);
begin
  SHenpiPass;
end;


procedure TfrmMainBOMBaoJia.pm1Popup(Sender: TObject);
var
  AuthStatus: Integer;
begin
  mniEdit.Enabled := not cdsMain.IsEmpty;
  mniCopy.Enabled := not cdsMain.IsEmpty;
  mniView.Enabled := not cdsMain.IsEmpty;
  mniDelete.Enabled := not cdsMain.IsEmpty;
  mniPostPass.Enabled := not cdsMain.IsEmpty;

  mniChaKanShenPiLiuCheng.Enabled := not cdsMain.IsEmpty;

  if not cdsMain.IsEmpty then
  begin
    AuthStatus := cdsMain.FieldByName('AuthStatus').AsInteger;
    mniEdit.Enabled := AuthStatus in [0,4]; //未提交，审核不通过
    mniDelete.Enabled := AuthStatus in [0,4]; //未提交，审核不通过
    mniPostPass.Enabled := AuthStatus in [0,4]; //未提交，审核不通过
    mniChaKanShenPiLiuCheng.Enabled := AuthStatus in [1,2,3,4];
  end;

  //权限的设定
  //8是工程部检查BOM资料是否和工程选取一样的权限
  if (gUser.User_Permit = '1') or (gUser.User_Permit = '3') or (gUser.User_Permit = '8') then
  begin
    mniNew.Visible := False;
    mniDelete.Visible := False;
    mniPostPass.Visible := False;
    mniEdit.Visible := False;
    mniCopy.Visible := False;
  end;

  //工程部不能打印
  if gUser.User_Permit = '8' then
  begin
    mniPrint.Visible := False;
  end;
end;

procedure TfrmMainBOMBaoJia.pm2Popup(Sender: TObject);
begin
  mniViewShenpiStep.Enabled := not cdsMain.IsEmpty;
  mniAuthView.Enabled := not cdsMain.IsEmpty;
  mniShenPiPass.Enabled := not cdsMain.IsEmpty;
  mniShenPiNoPass.Enabled := not cdsMain.IsEmpty;
  if not cdsMain.IsEmpty then
  begin
    mniShenPiPass.Enabled := cdsMain.FieldByName('AuthStatus').AsInteger in [1,2];//待审核，审核中
    mniShenPinoPass.Enabled := cdsMain.FieldByName('AuthStatus').AsInteger in [1,2,3];//待审核，审核中,审核通过
  end;
end;

procedure TfrmMainBOMBaoJia.rb1Click(Sender: TObject);
begin
  GetData;
end;

end.
