unit MainFrm_Mod623;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,IdZLib, frxDesgn, Vcl.Grids;

type
  TfrmMain_Mod623 = class(TfrmBaseMain)
    pnl1: TPanel;
    grpStatus: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    NAdd: TMenuItem;
    NCopy: TMenuItem;
    NEdit: TMenuItem;
    NDel: TMenuItem;
    NCheck: TMenuItem;
    N1: TMenuItem;
    NDo: TMenuItem;
    NUnDo: TMenuItem;
    NAuth: TMenuItem;
    NBack: TMenuItem;
    N2: TMenuItem;
    NPrint: TMenuItem;
    NClose: TMenuItem;
    NDocument: TMenuItem;
    mniN3: TMenuItem;
    NRepeat: TMenuItem;
    NDate: TMenuItem;
    NGetResult: TMenuItem;
    N3: TMenuItem;
    NDoAll: TMenuItem;
    NAuthAll: TMenuItem;
    NDelAll: TMenuItem;
    N4: TMenuItem;
    NImport: TMenuItem;
    NExport: TMenuItem;
    sg213: TStringGrid;
    procedure btnQryClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure NAddClick(Sender: TObject);
    procedure NEditClick(Sender: TObject);
    procedure NCheckClick(Sender: TObject);
    procedure NCopyClick(Sender: TObject);
    procedure NDelClick(Sender: TObject);
    procedure NDoClick(Sender: TObject);
    procedure NUnDoClick(Sender: TObject);
    procedure NAuthClick(Sender: TObject);
    procedure NBackClick(Sender: TObject);
    procedure NCloseClick(Sender: TObject);
    procedure NDocumentClick(Sender: TObject);
    procedure NDoAllClick(Sender: TObject);
    procedure NAuthAllClick(Sender: TObject);
    procedure NDelAllClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure NPrintClick(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure NExportClick(Sender: TObject);
    procedure NImportClick(Sender: TObject);
  private
    { Private declarations }
    LEDate:TDateTime;
    function GetCustomer:string;
    function GetStatus:string;
    procedure UnPackStream(var CompressedStream: TMemoryStream);
    function GetRkeys(AStatus:Integer):string;
    procedure Export_Grid_to_Excel(Grid: TStringgrid; title_caption: string;isStr:boolean=false);
    function ExcelToDB:Boolean;
  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmMain_Mod623: TfrmMain_Mod623;

const
  TmpFileDir = 'c:\tmp\';

implementation

uses uCommFunc,System.DateUtils,System.Generics.Collections,System.Win.ComObj
            , DetailsFrm_Mod623,System.StrUtils,Winapi.ShellAPI, PrintFrm_Mod623;

{$R *.dfm}

{ TfrmMain_Mod623 }

procedure TfrmMain_Mod623.btnDYClick(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmPrint_Mod623;
begin
  inherited;
  if not gFunc.CheckUserAuth(10,623) then Exit;
  LFrm:= TfrmPrint_Mod623.Create(nil);
  try
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\市场销售_订单管理\', [rfReplaceAll]) +
      '订单生产申请单.fr3';
    LFrm.rep213.LoadFromFile(LFileName);
    LFrm.rep213.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod623.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'DATA0213.submit_date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',LEDate) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',LEDate);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod623.chk1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmMain_Mod623.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('status').Value = 0 then
  begin
    if (cdsMain.FieldByName('ORIG_REQUEST_DATE').Value - LEDate < 15) then
      ehMain.Canvas.Font.Color := clred
    else
      ehMain.Canvas.Font.Color := clAqua;
  end;
  if cdsMain.FieldByName('status').Value = 1 then ehMain.Canvas.Font.Color := clGreen;
  if cdsMain.FieldByName('status').Value = 2 then ehMain.Canvas.Font.Color := clBlack;
  if cdsMain.FieldByName('status').Value = 3 then ehMain.Canvas.Font.Color := clBlue;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column,GridsEh.TGridDrawState(State));
end;

function TfrmMain_Mod623.ExcelToDB:Boolean;
var
  LSql,LSql10,LSql25,LSql97,LSql213,LSqlTime:string;
  LFileName,LCustcoTool:String;
  LCds,LCds10,LCds25,LCds97,LCds213,LCdsTime:TClientDataSet;
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
  LOpen:TOpenDialog;
  LDateTime:TDateTime;
begin
  Result:= False;
  LOpen := TOpenDialog.Create(nil);
  try
    if LOpen.Execute then LFileName := LOpen.FileName
    else exit;
  finally
    LOpen.Free;
  end;
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
  LSql := 'SELECT custcoTool FROM DATA0192';
  LSql213 := ' SELECT * FROM DATA0213 WHERE 1=2 ';
  LSqlTime:= ' SELECT GETDATE() as dt';
  LCds:= TClientDataSet.Create(nil);
  LCds213:= TClientDataSet.Create(nil);
  LCdsTime:= TClientDataSet.Create(nil);
  LCds10:= TClientDataSet.Create(nil);
  LCds25:= TClientDataSet.Create(nil);
  LCds97:= TClientDataSet.Create(nil);
  try
    XLApp.workBooks.Open(LFileName);
    Sheet := XLApp.Workbooks[1].WorkSheets[1];

    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql, LSql213,LSqlTime]), [LCds, LCds213,LCdsTime]) then
    begin
      ShowMessage('从数据库取得数据失败！');
      Exit;
    end;
    LCustcoTool := LCds.FieldByName('custcoTool').AsString;
    LDateTime:= LCdsTime.FieldByName('dt').AsDateTime;
    for iCount := 2 to 65535 do
    begin
      if trim(XLApp.workbooks[1].sheets[1].cells[iCount, 5]) = '' then
      begin
        MessageDlg('第' + inttostr(iCount) + '行客户代码不能为空!', mtInformation, [mbok], 1);
        Continue;
      end;
      if trim(XLApp.workbooks[1].sheets[1].cells[iCount, 1]) = '' then
      begin
        MessageDlg('第' + inttostr(iCount) + '行本厂编号不能为空!', mtInformation, [mbok], 1);
        Continue;
      end;
      LSql10 := 'select data0010.cust_code from data0025 inner join ' + #13 +
                ' data0010 on data0025.customer_ptr = data0010.rkey ' + #13 +
                ' where data0025.manu_part_number = ' + quotedstr(trim(XLApp.workbooks[1].sheets[1].cells[iCount, 1]));
      LSql97 := 'select top 1 * from data0097 where PO_NUMBER=' + quotedstr(trim(XLApp.workbooks[1].sheets[1].cells[iCount, 2]));
      LSql25 := 'select ONHOLD_SALES_FLAG from data0025 where MANU_PART_NUMBER= ' + QuotedStr(trim(XLApp.workbooks[1].sheets[1].cells[iCount, 1]));
      if gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql10, LSql25, LSql97]), [LCds10, LCds25, LCds97]) then
      begin
        if LCds10.IsEmpty then
        begin
          MessageDlg('第' + inttostr(iCount) + '行本厂编号所绑定的客户代码在系统中不存在,请联系市场部!', mtInformation, [mbok], 1);
          Continue;
        end;
        if (LCustcoTool <> 'Y') and (LCds10.FieldByName('cust_code').Value <> trim(XLApp.workbooks[1].sheets[1].cells[iCount,5])) then
        begin
          MessageDlg('第' + inttostr(iCount) + '行本厂编号所绑定的客户代码与导入的客户代码不一致,请联系市场部!', mtInformation, [mbok], 1);
          Continue;
        end;
        if LCds97.IsEmpty then
        begin
          MessageDlg('第' + inttostr(iCount) + '行合同编号在客户订单号系统中不存在,请先建立好客户订单号信息!', mtInformation, [mbok], 1);
          Continue;
        end;
        if (trim(XLApp.workbooks[1].sheets[1].cells[iCount, 15]) = '是') then
          XLApp.workbooks[1].sheets[1].cells[iCount, 15] := 0
        else
          XLApp.workbooks[1].sheets[1].cells[iCount, 15] := 1;
        if LCds25.IsEmpty or (LCds25.FieldByName('ONHOLD_SALES_FLAG').Value = 0) then
        begin
          MessageDlg('第' + inttostr(iCount) + '行本厂编号还没在销售状态!', mtInformation, [mbok], 1);
          Continue;
        end;
        LCds213.Append;
        LCds213.FieldByName('MANU_PART_NUMBER').Value := sheet.cells[iCount, 1];
        LCds213.FieldByName('PO_NUMBER').Value := sheet.cells[iCount, 2];
        LCds213.FieldByName('ANALYSIS_CODE_2').Value := sheet.cells[iCount, 3];
        LCds213.FieldByName('MANU_PART_DESC').Value := sheet.cells[iCount, 4];
        LCds213.FieldByName('cust_code').Value := sheet.cells[iCount, 5];
        LCds213.FieldByName('ORIG_SCHED_SHIP_DATE').Value := sheet.cells[iCount, 6];
        LCds213.FieldByName('ORIG_REQUEST_DATE').Value := sheet.cells[iCount, 7];
        LCds213.FieldByName('PARTS_ORDERED').Value := sheet.cells[iCount, 8];
        LCds213.FieldByName('PART_PRICE').Value := sheet.cells[iCount, 9];
        LCds213.FieldByName('CURR_CODE').Value := sheet.cells[iCount, 10];
        LCds213.FieldByName('PO_DATE').Value := sheet.cells[iCount, 11];
        LCds213.FieldByName('REFERENCE_NUMBER').Value := sheet.cells[iCount, 12];
        LCds213.FieldByName('WAREHOUSE_CODE').Value := sheet.cells[iCount, 13];
        LCds213.FieldByName('orig_customer').Value := sheet.cells[iCount, 14];
        LCds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value := sheet.cells[iCount, 15];
        LCds213.FieldByName('user_ptr').Value := StrToInt(gVar.rkey05);
        LCds213.FieldByName('submit_date').Value := LDateTime;
        LCds213.FieldByName('so_oldnew').Value := '旧单';
        LCds213.Post;
      end
      else
      begin
        MessageDlg('第' + inttostr(iCount) + '行数据验证失败!', mtInformation, [mbok], 1);
        Continue;
      end;
    end;
    if LCds213.ChangeCount > 0 then
    if gSvrIntf.IntfPostDataByTable('Data0213',LCds213.Delta) then
    begin
      Result:= True;
      ShowMessage('导入成功！');
    end;
    XLApp.workbooks[1].close;
  finally
    XLApp.quit;
    Screen.Cursor := crDefault;
    LCds.Free;
    LCds213.Free;
    LCdsTime.Free;
    LCds10.Free;
    LCds25.Free;
    LCds97.Free;
  end
end;

procedure TfrmMain_Mod623.Export_Grid_to_Excel(Grid: TStringgrid;
  title_caption: string; isStr: boolean);
var
  iCount, jCount,v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
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

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  v_cloumn := 0;
  for iCount := 0 to Grid.ColCount - 1 do
   if Grid.ColWidths[iCount]>0 then
    Sheet.Cells[1, iCount + 1-v_cloumn] := Grid.Cells[icount, 0]
   else
    inc(v_cloumn);

  for jcount := 1 to Grid.RowCount - 1 do
   begin
    v_cloumn := 0;
    for iCount := 0 to Grid.ColCount - 1 do
     if Grid.ColWidths[iCount]>0 then
     begin
       if isStr then  Sheet.Cells[jCount + 1, iCount + 1-v_cloumn].NumberFormatLocal:='@';
       Sheet.Cells[jCount + 1, iCount + 1-v_cloumn] := Grid.Cells[iCount, jcount]
     end else
      inc(v_cloumn);
   end;
  XlApp.Visible := True;
  Screen.Cursor := crDefault;
end;

function TfrmMain_Mod623.GetCustomer: string;
var
  LArr: TArray<Integer>;
  I,LNum: Integer;
  LSql,LRkeyList:string;
  LCds:TClientDataSet;
begin
  Result := '';
  LArr := gFunc.GetUserModAuthIDArr(StrToInt(gVar.rkey73),623);
  if TArray.BinarySearch<Integer>(LArr,7,LNum) then     //7为指定客户权限，在功能中定义
  begin
    Result := ' AND Data0010.rkey in ( SELECT customer_ptr from DATA0100 WHERE csi_ptr = ' + gVar.rkey73 + ') ';
//    LSql:= 'SELECT customer_ptr from DATA0100 WHERE csi_ptr = ' + gVar.rkey73;
//    LCds:= TClientDataSet.Create(nil);
//    try
//      gSvrIntf.IntfGetDataBySql(LSql,LCds);
//      if not LCds.IsEmpty then
//      begin
//        LRkeyList:= '0';
//        LCds.First;
//        while not LCds.Eof  do
//        begin
//          LRkeyList:= LCds.FieldByName('customer_ptr').AsString + ',' + LRkeyList ;
//          LCds.Next;
//        end;
//        Result := ' AND Data0010.rkey in (' + LRkeyList + ') ';
//      end
//      else  Result:= ' AND Data0010.rkey in (-1) ';
//    finally
//      LCds.Free;
//    end;
  end;
end;

procedure TfrmMain_Mod623.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  if Trim(FMainWhere) = '' then
  begin
    LEDate:= gFunc.GetSvrDateTime(dtdate);
    FMainWhere:= ' AND data0213.submit_date BETWEEN '
          + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-30)))
          + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1)));
  end;
  FWhere2:= GetCustomer;
  FWhere3:= GetStatus;
  FOrderby:= ' ORDER BY Data0015.abbr_Name';
  inherited;
end;

function TfrmMain_Mod623.GetRkeys(AStatus: Integer): string;
var
  LLocate:Integer;
  LRkeys:string;
begin
  Result := '0';
  LRkeys:='0';
  if cdsMain.IsEmpty then Exit;
  LLocate:= cdsMain.FieldByName('rkey').AsInteger;
  cdsMain.DisableControls;
  try
    cdsMain.First;
    while not cdsMain.Eof do
    begin
      if cdsMain.FieldByName('status').AsInteger = AStatus then
        LRkeys:= cdsMain.FieldByName('rkey').AsString + ',' + LRkeys;
      cdsMain.Next;
    end;
    cdsMain.Locate('rkey',LLocate,[]);
    Result:= LRkeys;
  finally
    cdsMain.EnableControls;
  end;
end;

function TfrmMain_Mod623.GetStatus: string;
begin
  Result:= ' AND DATA0213.STATUS IN (-1';
  if chk1.Checked then Result:= Result + ',0';
  if chk2.Checked then Result:= Result + ',1';
  if chk3.Checked then Result:= Result + ',3';
  if chk4.Checked then Result:= Result + ',2';
  Result:= Result + ')';
end;

procedure TfrmMain_Mod623.NAddClick(Sender: TObject);
var
  LFrm:TfrmDetail_Mod623;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,623) then  exit;
  LFrm:= TfrmDetail_Mod623.Create(nil);
  try
    LFrm.LDetailType:= 0;     //新增
    LFrm.GetData(0);
    LFrm.Append213;
    LFrm.cbxNewOrOldChange(nil);
    if LFrm.ShowModal = mrOk then btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod623.NAuthAllClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,623) then  exit;

  LSql:='SELECT * FROM DATA0213 WHERE status = 1 and RKEY in (' + GetRkeys(1) + ')';;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        LCds.Edit;
        LCds.FieldByName('status').Value := 3;    //审核
        LCds.FieldByName('audit_date').Value := gFunc.GetSvrDateTime(dtdate);
        LCds.FieldByName('audit_ptr').Value := StrToInt(gVar.rkey05);
        LCds.Post;
        LCds.Next;
      end;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('提交成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NAuthClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,623) then  exit;

  LSql:='SELECT * FROM DATA0213 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      if cdsMain.FieldByName('status').Value <> LCds.FieldByName('status').Value then
      begin
        ShowMessage('可能多人同时操作，请刷新后重试！');
        Exit;
      end;
      LCds.Edit;
      LCds.FieldByName('status').Value := 3;    //审核
      LCds.FieldByName('audit_date').Value := gFunc.GetSvrDateTime(dtdate);
      LCds.FieldByName('audit_ptr').Value := StrToInt(gVar.rkey05);
      LCds.Post;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('审核成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NBackClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(6,623) then  exit;
  if MessageDlg('你确定要退回此条已审核的订单吗?', mtWarning, [mbYes,mbNo],0) <> mrYes  then Exit;

  LSql:='SELECT * FROM DATA0213 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      if cdsMain.FieldByName('status').Value <> LCds.FieldByName('status').Value then
      begin
        ShowMessage('可能多人同时操作，请刷新后重试！');
        Exit;
      end;
      if LCds.FieldByName('UsedQuantity').AsInteger > 0 then
      begin
        ShowMessage('已存在下单数量不能返审！');
        exit;
      end;

      LCds.Edit;
      LCds.FieldByName('status').Value := 0;
//      LCds.FieldByName('audit_date').Value := gFunc.GetSvrDateTime(dtdate);
//      LCds.FieldByName('audit_ptr').Value := StrToInt(gVar.rkey05);
      LCds.Post;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('退回成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NCheckClick(Sender: TObject);
var
  LFrm:TfrmDetail_Mod623;
begin
  inherited;
  if not gFunc.CheckUserAuth(3,623) then  exit;
  LFrm:= TfrmDetail_Mod623.Create(nil);
  try
    LFrm.LDetailType:= 2;     //检查
    LFrm.GetData25(cdsMain.FieldByName('MANU_PART_NUMBER').AsString);
    LFrm.GetData(cdsMain.FieldByName('rkey').Value);
    LFrm.cbxNewOrOldChange(nil);
    LFrm.edtOrderQtyChange(nil);
    LFrm.pnl2.Enabled:= False;
    LFrm.btnSave.Enabled:= False;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod623.NCloseClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(9,623) then  exit;
  if MessageDlg('你确定要关闭此订单吗?', mtWarning, [mbYes,mbNo],0) <> mrYes  then Exit;

  LSql:='SELECT * FROM DATA0213 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      if cdsMain.FieldByName('status').Value <> LCds.FieldByName('status').Value then
      begin
        ShowMessage('可能多人同时操作，请刷新后重试！');
        Exit;
      end;
      LCds.Edit;
      LCds.FieldByName('status').Value := 2;
//      LCds.FieldByName('audit_date').Value := gFunc.GetSvrDateTime(dtdate);
      LCds.FieldByName('close_Ren').Value := StrToInt(gVar.rkey05);
      LCds.Post;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('关闭成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NCopyClick(Sender: TObject);
var
  LFrm:TfrmDetail_Mod623;
  LSql:string;
  LCds:TClientDataSet;
  LField:TField;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,623) then  exit;
  LFrm:= TfrmDetail_Mod623.Create(nil);
  LCds:= TClientDataSet.Create(nil);
  try
    LFrm.LDetailType:= 3;     //复制
    LFrm.GetData(0);
    LSql:='SELECT * FROM DATA0213 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      ShowMessage('取得数据失败！！');
      Exit;
    end;
    LFrm.GetData25(cdsMain.FieldByName('MANU_PART_NUMBER').AsString);
    LFrm.cds213.Append;
    for LField in LFrm.cds213.Fields do
    begin
      if (IndexText(LField.FieldName,['rkey']) <> -1) then Continue;      //-1表示没找到
      if (LCds.FindField(LField.FieldName) <> nil) then
      LField.Value := LCds.FieldByName(LField.FieldName).Value;
    end;
    LFrm.cds213.FieldByName('ORIG_SCHED_SHIP_DATE').Value:= gFunc.GetSvrDateTime(dtdate);
    LFrm.cds213.FieldByName('ORIG_REQUEST_DATE').Value:= LFrm.cds213.FieldByName('ORIG_SCHED_SHIP_DATE').Value;
    LFrm.cds213.FieldByName('PO_DATE').Value:= LFrm.cds213.FieldByName('ORIG_SCHED_SHIP_DATE').Value;
    LFrm.cds213.FieldByName('status').Value:= 0;
    LFrm.cds213.FieldByName('user_ptr').Value:= StrToInt(gVar.rkey05);
    LFrm.cds213.FieldByName('Remark').Value:= '';
    LFrm.cds213.Post;
    LFrm.cbxNewOrOldChange(nil);
      if (Trim(LFrm.cds213.FieldByName('CURR_CODE').AsString) <> 'RMB') then      //rmb含税,其它不含税
        LFrm.rgRate.Visible:= False
      else
        LFrm.rgRate.Visible:= True;

    if LFrm.ShowModal = mrOk then btnRefreshClick(nil);
  finally
    LCds.Free;
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod623.NDelAllClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,623) then  exit;
  if MessageDlg('你确定要批量删除记录吗？', mtWarning, [mbYes,mbNo],0) <> mrYes  then Exit;
  if cdsMain.FieldByName('user_ptr').AsString <> gVar.rkey05 then
  begin
    ShowMessage('非本人新建，不能删除！');
    Exit;
  end;

  LSql:='SELECT * FROM DATA0213 WHERE status = 0 and  user_ptr = '+ gVar.rkey05 +
        ' and  RKEY = ' + GetRkeys(0);
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      while not LCds.Eof do LCds.Delete;

      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('删除成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NDelClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,623) then  exit;
  if MessageDlg('你确定要删除记录吗？', mtWarning, [mbYes,mbNo],0) <> mrYes  then Exit;
  if cdsMain.FieldByName('user_ptr').AsString <> gVar.rkey05 then
  begin
    ShowMessage('非本人新建，不能删除！');
    Exit;
  end;

  LSql:='SELECT * FROM DATA0213 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      if cdsMain.FieldByName('status').Value <> LCds.FieldByName('status').Value then
      begin
        ShowMessage('可能多人同时操作，请刷新后重试！');
        Exit;
      end;
      LCds.Delete;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('删除成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NDoAllClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,623) then  exit;

  LSql:='SELECT * FROM DATA0213 WHERE status = 0 and RKEY in (' + GetRkeys(0) + ')';;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        LCds.Edit;
        LCds.FieldByName('status').Value := 1;
        LCds.FieldByName('submit_date').Value := gFunc.GetSvrDateTime(dtdatetime);
        LCds.FieldByName('user_ptr').Value := StrToInt(gVar.rkey05);
        LCds.Post;
        LCds.Next;
      end;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('提交成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NDoClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,623) then  exit;

  LSql:='SELECT * FROM DATA0213 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      if cdsMain.FieldByName('status').Value <> LCds.FieldByName('status').Value then
      begin
        ShowMessage('可能多人同时操作，请刷新后重试！');
        Exit;
      end;
      LCds.Edit;
      LCds.FieldByName('status').Value := 1;
      LCds.FieldByName('submit_date').Value := gFunc.GetSvrDateTime(dtdatetime);
      LCds.FieldByName('user_ptr').Value := StrToInt(gVar.rkey05);
      LCds.Post;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('提交成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.NDocumentClick(Sender: TObject);
var
  LSql,LPath:string;
  LCds:TClientDataSet;
  fs:TMemoryStream;
begin
  inherited;
  if cdsMain.FieldByName('PO_NUMBER').AsString <> '' then
  begin
    LSql:= 'SELECT file_content,filename FROM Data0097 '+#13+
        ' WHERE (file_content is not null) and CUSTOMER_PTR = '
          + IntToStr(cdsMain.FieldByName('rkey10').AsInteger) + #13+
        ' and PO_NUMBER = ' + QuotedStr(Trim(cdsMain.FieldByName('PO_NUMBER').AsString)) ;
    LCds:= TClientDataSet.Create(nil);
    fs:= TMemoryStream.Create;
    try
      gSvrIntf.IntfGetDataBySql(LSql,LCds);
      if not LCds.IsEmpty then
      begin
        TBlobField(LCds.FieldByName('file_content')).SaveToStream(fs);
        UnPackStream(fs);
        if not DirectoryExists(TmpFileDir) then
        if not CreateDir(TmpFileDir) then
        begin
          ShowMessage('创建临时文件目录错误: '+TmpFileDir);
          exit;
        end;
        LPath:= TmpFileDir +  LCds.FieldByName('filename').AsString;
        fs.SaveToFile(LPath);
        ShellExecute(self.Handle,nil,pchar(LPath),nil,nil,SW_SHOWNORMAL);
      end
      else
      begin
        ShowMessage('合同号不存在或未上传文档！');
        exit;
      end;
    finally
      LCds.Free;
      fs.Free;
    end;
  end;
end;

procedure TfrmMain_Mod623.NEditClick(Sender: TObject);
var
  LFrm:TfrmDetail_Mod623;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,623) then  exit;
  LFrm:= TfrmDetail_Mod623.Create(nil);
  try
    LFrm.LDetailType:= 1;    //编辑
    LFrm.GetData25(cdsMain.FieldByName('MANU_PART_NUMBER').AsString);
    LFrm.GetData(cdsMain.FieldByName('rkey').Value);
    LFrm.cbxNewOrOldChange(nil);
    LFrm.edtOrderQtyChange(nil);
    if LFrm.ShowModal = mrOk then btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod623.NExportClick(Sender: TObject);
var
  iCount:Integer;
begin
  inherited;
  sg213.RowCount := 1;
  for iCount := 0 to sg213.ColCount - 1 do
    sg213.Cells[iCount, 1] := '';
  sg213.Update;

  sg213.ColCount:=15;
  sg213.RowCount:=2;
  sg213.Cells[0,0]:='本厂编号';
  sg213.Cells[1,0]:='合同编号';
  sg213.Cells[2,0]:='客户物料号';
  sg213.Cells[3,0]:='客户型号';
  sg213.Cells[4,0]:='客户代码';
  sg213.Cells[5,0]:='出厂日期(计划交期)';
  sg213.Cells[6,0]:='交货日期(客户交期)';
  sg213.Cells[7,0]:='订单数量';
  sg213.Cells[8,0]:='价格';
  sg213.Cells[9,0]:='货币';
  sg213.Cells[10,0]:='合同发送日期(原始客户交期)';
  sg213.Cells[11,0]:='参考附注';
  sg213.Cells[12,0]:='工厂代码';
  sg213.Cells[13,0]:='关联原客户';
  sg213.Cells[14,0]:='是否含税(是/否)';
  sg213.Cells[0,1]:='操作说明：所有输入汉字标点请用半角；标题上日期的括号说明是对应销售订单而言，日期格式：2013-10-01。导入时请删除本列说明';
  Export_Grid_to_Excel(sg213,'订单预处理',False);
end;

procedure TfrmMain_Mod623.NImportClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,623) then  exit;
  if ExcelToDB then btnRefreshClick(nil);
end;

procedure TfrmMain_Mod623.NPrintClick(Sender: TObject);
var
  LFrm:TfrmPrint_Mod623;
begin
  inherited;
  LFrm:= TfrmPrint_Mod623.Create(nil);
  try
    LFrm.dtpBegin.DateTime:= IncDay(LEDate,-1);
    LFrm.dtpEnd.DateTime:= LEDate;
    LFrm.GetData;
    LFrm.edtCustomer.SetFocus;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod623.NUnDoClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(8,623) then  exit;

  LSql:='SELECT * FROM DATA0213 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString;
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;;
    if not LCds.IsEmpty then
    begin
      if cdsMain.FieldByName('status').Value <> LCds.FieldByName('status').Value then
      begin
        ShowMessage('可能多人同时操作，请刷新后重试！');
        Exit;
      end;
      LCds.Edit;
      LCds.FieldByName('status').Value := 0;
//      LCds.FieldByName('submit_date').Value := gFunc.GetSvrDateTime(dtdatetime);
//      LCds.FieldByName('user_ptr').Value := StrToInt(gVar.rkey05);
      LCds.Post;
      if gSvrIntf.IntfPostDataByTable('Data0213',LCds.Delta) then
      begin
        ShowMessage('取消提交成功！');
        btnRefreshClick(nil);
      end;
    end
    else
    begin
      ShowMessage('记录不存在，可能多人同时操作，请刷新后重试');
      exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod623.pmMainPopup(Sender: TObject);
begin
  inherited;
  NEdit.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 0);
  NDel.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 0);
  NDelAll.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 0);
  NCheck.Enabled:= not cdsMain.IsEmpty;
  NCopy.Enabled:= not cdsMain.IsEmpty;
  NDo.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 0);
  NDoAll.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 0);
  NUnDo.Enabled:=(not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 1);
  NAuth.Enabled:=(not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 1);
  NAuthAll.Enabled:= (not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 1);
  NClose.Enabled:=(not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 3);
  NDocument.Enabled:= not cdsMain.IsEmpty;
  NBack.Enabled:=(not cdsMain.IsEmpty) and (cdsMain.FieldByName('status').AsInteger = 1);
end;

procedure TfrmMain_Mod623.UnPackStream(var CompressedStream: TMemoryStream);
var
  SourceStream: TDecompressionStream;
  DestStream: TMemoryStream;
  Buffer: PChar;
  Count: integer;
  tmpstr:string;
Begin
  CompressedStream.Position:=0;
  tmpstr:='DDD';
  CompressedStream.ReadBuffer(tmpstr[1], 3);
  if tmpstr<>#6#3#1 then exit; //判断是否压缩的流
  CompressedStream.ReadBuffer(Count, SizeOf(Count));
  GetMem(Buffer, Count);
  DestStream := TMemoryStream.Create;
  SourceStream := TDecompressionStream.Create(CompressedStream);
  Try
    SourceStream.ReadBuffer(Buffer^, Count);
    DestStream.WriteBuffer(Buffer^, Count);
    SourceStream.Free;
    DestStream.Position := 0;//复位流指针
    CompressedStream.LoadFromStream(DestStream);
  finally
    FreeMem(Buffer);
    DestStream.Free;
  end;
end;

end.
