unit UMainfrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, ubasemainfrm, ucommfunc,
  Data.Win.ADODB,
  frxClass, frxDBSet, Datasnap.Provider;

type
  TFrmMain_mod496 = class(TfrmBaseMain)
    btn_DetailQry: TBitBtn;
    eh468: TDBGridEh;
    ds468: TDataSource;
    cds468: TClientDataSet;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniView: TMenuItem;
    mniDel: TMenuItem;
    N1: TMenuItem;
    mniSubmit: TMenuItem;
    mniASubmit: TMenuItem;
    N2: TMenuItem;
    mniPrint: TMenuItem;
    mniRePrint: TMenuItem;
    mniN6: TMenuItem;
    mniAuditInfo: TMenuItem;
    cds14: TClientDataSet;
    cds314: TClientDataSet;
    frxrprt2: TfrxReport;
    cdstempt: TClientDataSet;
    mniCancelAudidt: TMenuItem;
    qrytemp: TADOQuery;
    atncfldRKEY: TAutoIncField;
    strngfldCUT_NO: TStringField;
    strngfldSO_NO: TStringField;
    intgrfldFLOW_NO: TIntegerField;
    smlntfldSTEP: TSmallintField;
    intgrfldDEPT_PTR: TIntegerField;
    intgrfldINVENT_PTR: TIntegerField;
    fltfldQUAN_BOM: TFloatField;
    fltfldQUAN_ISSUED: TFloatField;
    smlntfldSTATUS: TSmallintField;
    strngfldPRINTIT: TStringField;
    strngfldVENDOR: TStringField;
    smlntfldInvent_or: TSmallintField;
    qrytempquan_alloc: TBCDField;
    wrdfldqrytempoverproof: TWordField;
    strngfldINV_PART_NUMBER: TStringField;
    strngfldINV_PART_DESCRIPTION: TStringField;
    strngfld_name: TStringField;
    strngfldPRINTIT_S: TStringField;
    intgrfld_ptr: TIntegerField;
    strngfld_name1: TStringField;
    strngfldqrytempremark: TStringField;
    intgrfld_ptr1: TIntegerField;
    strngfldExReason: TStringField;
    strngfldqrytempstandards: TStringField;
    procedure btnQryClick(Sender: TObject);
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure mniAddClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniPrintClick(Sender: TObject);
    procedure mniRePrintClick(Sender: TObject);
    procedure mniAuditInfoClick(Sender: TObject);
    procedure mniASubmitClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniSubmitClick(Sender: TObject);
    procedure btn_DetailQryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frxrprt2AfterPrintReport(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure eh468DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnDYClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFliterChange(Sender: TObject);
    procedure mniCancelAudidtClick(Sender: TObject);
  private
    { Private declarations }
    // PSql268,PSql468: string;
    FEFlag: Integer;
    procedure AddRefresh;
    procedure AfterPrint;
  public
    { Public declarations }
    procedure GetData(); override;
  end;

var
  FrmMain_mod496: TFrmMain_mod496;

implementation

uses UEditFrm_mod496, UAuditInfoFrm_Mod496, UReqDetailFrm_mod496,
  UReportFrm_mod496;
{$R *.dfm}

procedure TFrmMain_mod496.AddRefresh;
var
  FBK: TBookmark;
begin

  if FEFlag = 2 then
  begin
    FBK := cdsMain.bookmark;
    btnRefreshClick(btnRefresh);
    cdsMain.gotobookmark(FBK);
  end
  else
  begin
    btnRefreshClick(btnRefresh);
    cdsMain.First;
  end;
end;

procedure TFrmMain_mod496.AfterPrint;
var
  cdsTemp: TClientDataSet;
begin
  inherited;

  if cdsMain.IsEmpty then
    exit;
  cdsTemp := TClientDataSet.Create(nil);
  try
    if not cdsMain.FieldByName('prted').AsBoolean then
    begin
      gSvrintf.IntfGetDataBySql('select * from data0268 where rkey=' +
        cdsMain.FieldByName('rkey').AsString, cdsTemp);
      cdsTemp.Edit;
      cdsTemp.FieldByName('prted').Value := true;
      cdsTemp.Post;

      try
        gSvrintf.IntfPostDataByTable('data0268', cdsTemp.Delta);

      except
        on e: Exception do
        begin
          showmessage('错误：');
          exit;
        end;

      end;
    end;
    self.btnRefreshClick(nil);

  finally
    cdsTemp.Free;
  end;
end;

procedure TFrmMain_mod496.btnDYClick(Sender: TObject);
var
  LFileName: string;
begin
  inherited;
  if cdsMain.IsEmpty then
    exit;

  LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
    'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
    '领料申请单.fr3';
  frxrprt2.Clear;
  frxrprt2.LoadFromFile(LFileName, true);
  frxrprt2.DesignReport();
end;

procedure TFrmMain_mod496.mniPrintClick(Sender: TObject);
var
  Lfrm: TfrmReport_mod496;
  LFileName: string;
begin
  inherited;

  if cdsMain.IsEmpty then
    exit;

   if cdsMain.FieldByName('EMPL_PTR').AsString<>gVar.rkey05 then
   begin
     ShowMessage('只能申领人才能打印!');
     exit;
   end;

  if cdsMain.FieldByName('allow_submit').value=1 then
  begin
  ShowMessage('有超领，短信已发送，请等待领导特批再打印！');
  exit;
  end;

  Lfrm := TfrmReport_mod496.Create(self);
  Lfrm.FAfterPtint := AfterPrint;
  try
    Lfrm.GetData(cdsMain.FieldByName('rkey').AsString);

    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '领料申请单.fr3';
    frxrprt2.LoadFromFile(LFileName, true);
    frxrprt2.ShowReport;
  finally
    Lfrm.Free;
  end;
end;

procedure TFrmMain_mod496.btnQryClick(Sender: TObject);
begin
    FMainWhereID:=0;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0268.date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-1) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '7';
    cdsMainWhereInit.Post;
  end;
  inherited;

end;

procedure TFrmMain_mod496.btn_DetailQryClick(Sender: TObject);
var
  Lfrm: TFrmReqDetail_mod496;
begin
  inherited;
  Lfrm := TFrmReqDetail_mod496.Create(self);
  try
    Lfrm.InitWithPickID(496, 6);
    Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;

end;

procedure TFrmMain_mod496.cdsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if cdsMain.FieldByName('rkey').AsString = '' then
  begin
    gSvrintf.IntfGetDataBySql(cds468.CommandText +
      ' and dbo.data0468.flow_no=-1', cds468);
    exit;
  end;
  gSvrintf.IntfGetDataBySql(cds468.CommandText + ' and dbo.data0468.flow_no=' +
    cdsMain.FieldByName('rkey').AsString, cds468);
end;

procedure TFrmMain_mod496.edtFliterChange(Sender: TObject);
var
  fDate: Tdatetime;
begin

  // if (FHotColumn.Field.DataType in [ftDate, ftDateTime]) and
  // (trim(edtFliter.text) <> '') then
  // if not TryStrToDate(trim(edtFliter.text), fDate) then
  // begin
  // showmessage(trim(edtFliter.text) + '不是日期格式！');
  // exit;
  // end;
  inherited;
end;

procedure TFrmMain_mod496.eh468DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cds468.IsEmpty then
    exit;
  if (cds468.FieldByName('remark').Value = null) or
    (cds468.FieldByName('remark').Value = '') then
    exit;
  If Copy(cds468.FieldByName('remark').Value, 0, 1) = 'X' then
  Begin
    eh468.Canvas.Font.Color := clRed;
    eh468.DefaultDrawColumnCell(Rect, DataCol, Column,
      [gdFixed, gdFocused, gdSelected]);
  End
end;

procedure TFrmMain_mod496.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('status').Value = 3 then
    ehMain.Canvas.Font.Color := clRed
  else if cdsMain.FieldByName('status').Value = 2 then
    ehMain.Canvas.Font.Color := clTeal // cllime
  else if cdsMain.FieldByName('status').Value = 1 then
    ehMain.Canvas.Font.Color := clfuchsia
  else if cdsMain.FieldByName('status').Value = 4 then
    ehMain.Canvas.Font.Color := clGreen;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmMain_mod496.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmMain_mod496 := nil;
end;

procedure TFrmMain_mod496.FormCreate(Sender: TObject);
begin
  // PSql268:=cdsMain.CommandText;
  // PSql468:=cds468.CommandText;
  inherited;

end;

procedure TFrmMain_mod496.frxrprt2AfterPrintReport(Sender: TObject);
var
  cdsTemp: TClientDataSet;
begin
  inherited;

  cdsTemp := TClientDataSet.Create(nil);
  try
    if not gSvrintf.IntfGetDataBySql('select * from data0268 where rkey=' +
      cdsMain.FieldByName('rkey').AsString, cdsTemp) then
    begin
      showmessage('错误!');
      exit;
    end;

    cdsTemp.Edit;
    cdsTemp.FieldByName('prted').Value := true;
    cdsTemp.Post;

    try
      gSvrintf.IntfPostDataByTable('data0268', cdsTemp.Delta);

    except
      on e: Exception do
      begin
        showmessage('错误：');
        exit;
      end;
    end;

    self.btnRefreshClick(Sender);

  finally
    cdsTemp.Free;
  end;
end;

procedure TFrmMain_mod496.GetData;
var
  ssql, Dept_ptr: string;
  cdsTemp: TClientDataSet;
begin

  cdsTemp := TClientDataSet.Create(nil);
  try
    ssql := 'SELECT Data0034.DEPT_CODE,Data0034.dept_name,Data0005.RKEY rkey05,Data0034.rkey,data0034.ttype,data0034.is_cost_dept '
      + 'FROM Data0005 INNER JOIN ' +
      'Data0034 ON Data0005.EMPLOYEE_ID = Data0034.RKEY INNER JOIN ' +
      'Data0073 ON Data0005.RKEY = Data0073.EMPLOYEE_PTR ' +
      'where data0073.rkey= ' + gVar.rkey73;

    if not gSvrintf.IntfGetDataBySql(ssql, cdsTemp) then
    begin
      showmessage('错误!');
      exit;
    end;

    if not cdsTemp.IsEmpty then
      Dept_ptr := cdsTemp.FieldByName('rkey').AsString;

    FMainFrmSql :=
      ' SELECT  dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.dept_ptr, dbo.DATA0268.DATE, dbo.DATA0268.EMPL_PTR, dbo.DATA0268.status, '
      + ' dbo.DATA0268.auth_emplptr, dbo.DATA0268.auth_date, dbo.DATA0268.reference, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'
      + ' dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME AS abbr_name, Data0005_1.EMPL_CODE AS Auditcode,'
      + ' Data0005_1.EMPLOYEE_NAME AS Auditname, dbo.Data0268.cut_no,' +
      ' CASE WHEN data0268.status = 0 THEN ''待提交'' WHEN data0268.status = 1 THEN ''待审核'' WHEN data0268.status = 2 THEN ''已审核'' WHEN data0268.status'
      + ' = 3 THEN ''被退回'' WHEN data0268.status = 4 THEN ''已发料'' END AS status_c, dbo.DATA0268.auth_ptr, dbo.Data0094.RKEY AS rkey94,'
      + ' dbo.Data0094.CODE, dbo.Data0094.PURCHASE_APPROV_DESC, dbo.Data0015.ABBR_NAME AS fac_name, dbo.DATA0268.warehouse_ptr,'
      + ' dbo.DATA0268.Prted, case when dbo.DATA0268.Prted=0 then ''未打印'' else ''已打印'' end as PRINTITS,  dbo.DATA0268.allow_submit,'
      + ' CASE WHEN data0268.allow_submit = 0 THEN ''不确认'' WHEN data0268.allow_submit = 1 THEN ''待确认'' WHEN data0268.allow_submit = 2 THEN ''已确认'' '
      + ' WHEN data0268.allow_submit = 3 THEN ''待确认'' ' +
      ' END AS allow_submit_c, Data0005_2.EMPL_CODE AS allow_submit_person_code, Data0005_2.EMPLOYEE_NAME AS allow_submit_person_name,'
      + ' dbo.DATA0268.allow_submit_time, dbo.DATA0268.control_ptr,dbo.DATA0268.IsMsgSended'
      + ' FROM         dbo.DATA0268 INNER JOIN' +
      ' dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY INNER JOIN' +
      ' dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = dbo.Data0005.RKEY LEFT JOIN' +
      ' dbo.Data0005 AS Data0005_1 ON dbo.DATA0268.auth_emplptr = Data0005_1.RKEY INNER JOIN'
      + ' dbo.Data0094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY INNER JOIN'
      + ' dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY LEFT JOIN'
      + ' dbo.Data0005 AS Data0005_2 ON dbo.DATA0268.allow_submit_person = Data0005_2.RKEY '
      + ' where data0268.ttype in (0,1) ';

    if trim(FMainWhere) = '' then
      FMainWhere := ' and data0268.date>getdate()-1   and  dbo.DATA0268.dept_ptr = ' + Dept_ptr ;


    // FWhere2 := GetFWhere2;

    FOrderby := ' order by DATA0268.rkey desc ';
    // showmessage(FMainFrmSql+FMainWhere+FOrderby);
    inherited;
    if cdsMain.FieldByName('rkey').AsString = '' then
    begin
      gSvrintf.IntfGetDataBySql(cds468.CommandText +
        ' and dbo.data0468.flow_no=-1', cds468);
      exit;
    end;

  finally
    cdsTemp.Free;
  end;
end;

procedure TFrmMain_mod496.mniAddClick(Sender: TObject);
var
  Lfrm: TfrmEdit_Mod496;
begin
  inherited;
  if not gfunc.CheckUserAuth(1, 496) then
    exit;
  FEFlag := 1;
  if frmEdit_Mod496 = nil then
  begin
    frmEdit_Mod496 := TfrmEdit_Mod496.Create(self);
    frmEdit_Mod496.EFlag := 1;
    frmEdit_Mod496.Init;
  end;

  frmEdit_Mod496.AddRefresh := AddRefresh;
  frmEdit_Mod496.cds268.ReadOnly := false;
  frmEdit_Mod496.cds468.ReadOnly := false;
  frmEdit_Mod496.btnSave.Enabled := true;
  frmEdit_Mod496.pnl3.Enabled := true;

  frmEdit_Mod496.GetData('-1');
  frmEdit_Mod496.Append268;
  frmEdit_Mod496.Show;

end;

procedure TFrmMain_mod496.mniASubmitClick(Sender: TObject);
var
  cdsTemp: TClientDataSet;
   Lsql: string;
begin
  inherited;
  if not gfunc.CheckUserAuth(2, 496) then
    exit;

  if cdsMain.IsEmpty then
    exit;

  cdsTemp := TClientDataSet.Create(nil);



  try
  try
     Lsql:='select  warehouse_ptr from data0073  where rkey='+gVar.rkey73;
    if not gSvrintf.IntfGetDataBySql(Lsql,cdstempt) then Exit;


     if cdstempt.FieldByName('warehouse_ptr').asinteger>0  then
    begin
     if cdstempt.FieldByName('warehouse_ptr').AsString<>cdsmain.FieldByName('warehouse_ptr').AsString  then
     begin
     ShowMessage('您没有权限提交别厂的资料！');
     exit;
     end;
    end ;


    if not gSvrintf.IntfGetDataBySql('select *  from data0268 where rkey=' +
      cdsMain.FieldByName('rkey').AsString, cdsTemp) then
    begin
      showmessage('错误!');
      exit;
    end;
    cdsTemp.Edit;
    cdsTemp.FieldByName('allow_submit').Value := 2; // 已确认
    cdsTemp.FieldByName('allow_submit_person').Value := gVar.rkey05;
    cdsTemp.FieldByName('allow_submit_time').Value := gfunc.GetSvrDateTime;
    cdsTemp.Post;

    gSvrintf.IntfPostDataByTable('data0268', cdsTemp.Delta);

  except
    on e: Exception do
    begin
      showmessage('错误：');
      exit;
    end;
  end;

  self.btnRefreshClick(Sender);

  finally
   cdsTemp.Free;
  end;
end;

procedure TFrmMain_mod496.mniAuditInfoClick(Sender: TObject);
var
  Lfrm: TFrmAuditInfo_Mod496;
begin
  inherited;
  if cdsMain.IsEmpty then
    exit;
  Lfrm := TFrmAuditInfo_Mod496.Create(self);
  try
    if not cdsMain.IsEmpty then
      Lfrm.GetData(cdsMain.FieldByName('rkey').AsString);
    Lfrm.ShowModal;
  finally
    Lfrm.Free;
  end;
end;

procedure TFrmMain_mod496.mniCancelAudidtClick(Sender: TObject);
var
  Lsql: string;
  Lcds268: TClientDataSet;
  Lcds368: TClientDataSet;
  Lcdstemp: TClientDataSet;
  LUpdateData: OleVariant;
   LBK: TBookmark;
begin
  inherited;
  if not gfunc.CheckUserAuth(1, 496) then
    exit;

  if MessageBox(Handle, '确定取消提交此申请单吗?', '提示', MB_YESNO + MB_ICONWARNING +
    MB_DEFBUTTON2) = IDNO then
    exit;

   LBK := cdsMain.Bookmark;

  Lcds268 := TClientDataSet.Create(nil);
  Lcds368 := TClientDataSet.Create(nil);
  Lcdstemp := TClientDataSet.Create(nil);

  try
    try
      Lsql := 'select * from data0268  where status=1 and  rkey = ' +
        cdsMain.FieldByName('rkey').AsString;
      // 'update data0268 set status=0,auth_emplptr=null,auth_date=null where rkey = '
      // + cdsMain.FieldByName('rkey').AsString + ' and status=1';
      gSvrintf.IntfGetDataBySql(Lsql, Lcds268);

      Lsql := 'select * From data0368 where apply_ptr= ' +
        cdsMain.FieldByName('rkey').AsString;
      gSvrintf.IntfGetDataBySql(Lsql, Lcds368);

      if Lcds268.RecordCount < 1 then
      begin
        showmessage('取消提交此申请单失败,数据状态已发生变化...');
        exit;
      end
      else
      begin
        Lcds268.Edit;
        Lcds268.FieldByName('status').Value := 0;
        Lcds268.FieldByName('auth_emplptr').Value := null;
        Lcds268.FieldByName('auth_date').Value := null;
        Lcds268.Post;
        if Lcds368.RecordCount > 0 then
        begin
          while Lcds368.RecordCount > 0 do
            Lcds368.Delete;
        end;

      end;

      LUpdateData := VarArrayCreate([0, 1], varVariant);
      if Lcds268.ChangeCount > 0 then
        LUpdateData[0] := Lcds268.Delta; // 268
      if Lcds368.ChangeCount > 0 then
        LUpdateData[1] := Lcds368.Delta; // 368

      if gSvrintf.IntfPostModData('公共基础', 496, LUpdateData, 2) then
        showmessage('取消提交成功');

       btnRefreshClick(nil);
       cdsMain.GotoBookmark(LBK);
    except
      showmessage('取消提交此申请单失败...');
      exit;
    end;

  finally
    Lcds268.Free;
    Lcds368.Free;
    Lcdstemp.Free;
  end;
end;

procedure TFrmMain_mod496.mniDelClick(Sender: TObject);
begin
  inherited;
  if not gfunc.CheckUserAuth(1, 496) then
    exit;

  if cdsMain.IsEmpty then
    exit;

  gSvrintf.IntfGetDataBySql('select * from data0268 where rkey=' +
    cdsMain.FieldByName('rkey').AsString, cdstempt);

  if not cdstempt.IsEmpty then
    cdstempt.Delete;

  if not gSvrintf.IntfPostDataByTable('data0268', cdstempt.Delta) then
    exit;

  // if cdsMain.isempty then
  // gSvrintf.IntfGetDataBySql(cds468.CommandText + ' and dbo.data0468.flow_no=-1',cds468);

  GetData;

end;

procedure TFrmMain_mod496.mniEditClick(Sender: TObject);
begin
  inherited;

  if not gfunc.CheckUserAuth(1, 496) then
    exit;

  if cdsMain.IsEmpty then
    exit;

  FEFlag := 2;

  if frmEdit_Mod496 = nil then
  begin
    frmEdit_Mod496 := TfrmEdit_Mod496.Create(self);
    frmEdit_Mod496.AddRefresh := AddRefresh;
    frmEdit_Mod496.EFlag := 2;

    frmEdit_Mod496.Init;
  end;

  frmEdit_Mod496.cds268.ReadOnly := false;
  frmEdit_Mod496.cds468.ReadOnly := false;
  frmEdit_Mod496.btnSave.Enabled := true;
  frmEdit_Mod496.pnl3.Enabled := true;

  frmEdit_Mod496.dtpReqDate.DateTime := cdsMain.FieldByName('date').AsDateTime;
  frmEdit_Mod496.GetData(cdsMain.FieldByName('rkey').AsString);
  frmEdit_Mod496.cds268.FieldByName('number').ReadOnly := true;

  frmEdit_Mod496.Show;


end;

procedure TFrmMain_mod496.mniRePrintClick(Sender: TObject);
var
  cdsTemp: TClientDataSet;
  LBK: TBookmark;
begin
  inherited;
  if not gfunc.CheckUserAuth(3, 496) then
    exit;

  if cdsMain.IsEmpty then
    exit;
  cdsTemp := TClientDataSet.Create(nil);
  LBK := cdsMain.Bookmark;
 try
  if cdsMain.FieldByName('prted').AsBoolean then
  begin
    gSvrintf.IntfGetDataBySql('select * from data0268 where rkey=' +
      cdsMain.FieldByName('rkey').AsString, cdsTemp);
    cdsTemp.Edit;
    cdsTemp.FieldByName('prted').Value := false;
    cdsTemp.Post;

    try
      gSvrintf.IntfPostDataByTable('data0268', cdsTemp.Delta);

    except
      on e: Exception do
      begin
        showmessage('错误：');
        exit;
      end;

    end;
  end;
  self.btnRefreshClick(Sender);
  cdsMain.GotoBookmark(LBK);
 finally
   cdsTemp.Free;
 end;
end;

procedure TFrmMain_mod496.mniSubmitClick(Sender: TObject);
var
  ADataArr: OleVariant;
  sql275, Lsql, LTableName, LerrMsg: string;
  Messages, Messages2: string;
  Lcds_Ctrl_ptr: TClientDataSet;
  Lcds_mtrlL: TClientDataSet;
  cdsTemp: TClientDataSet;
  cdstemp2: TClientDataSet;
  cdstemp3: TClientDataSet;
  cdstemp4: TClientDataSet;
  LcdsMan: TClientDataSet;
  cds268: TClientDataSet;
  LUpdateData: OleVariant;
  LI: Integer;
  // AdataTemp: OleVariant;
  // n : integer;
   LBK: TBookmark;
begin
  inherited;
  if not gfunc.CheckUserAuth(1, 496) then    exit;


  if cdsMain.IsEmpty then
    exit;
  Lcds_Ctrl_ptr := TClientDataSet.Create(nil);
  Lcds_mtrlL := TClientDataSet.Create(nil);
  cdsTemp := TClientDataSet.Create(nil);
  cdstemp2 := TClientDataSet.Create(nil);
  cdstemp3 := TClientDataSet.Create(nil);
  cdstemp4 := TClientDataSet.Create(nil);
  LcdsMan := TClientDataSet.Create(nil);
  cds268 := TClientDataSet.Create(nil);

   LBK := cdsMain.Bookmark;
  try
    try
      Lsql := 'select SUPLFEDSHIP,SUPLFEDMAT,SUPLFEDMISC from data0192';
      gSvrintf.IntfGetDataBySql(Lsql, cdstemp2);

      if not gSvrintf.IntfGetDataBySql('select * from data0014 where  1=0 ',
        cds14) then
        showmessage('错误!');

      gSvrintf.IntfGetDataBySql('select * from data0314 where  1=0 ', cds314);

      Lsql := 'select * from [' + cdstemp2.FieldValues['SUPLFEDSHIP'] + '].' +
        cdstemp2.FieldValues['SUPLFEDMAT'] + '.dbo.' + cdstemp2.FieldValues
        ['SUPLFEDMISC'] + ' where 1=0';
      gSvrintf.IntfGetDataBySql(Lsql, cdstemp3);

      Lsql := 'select distinct d468.control_ptr ' +
        ' from data0268 d268                                                  '
        + ' inner join data0468  d468  on d268.rkey=d468.flow_no                  '
      // + ' inner join data0017  d17 on d468.INVENT_PTR=d17.rkey' +
        + ' left join data0136 d136  on d468.control_ptr = d136.rkey                '
        + ' where   left(d468.remark,1)=''X'' and  isnull(d136.control_name,'''')<>''''  and  d268.number='''
        + cdsMain.FieldByName('number').AsString + ''' ';

      if not gSvrintf.IntfGetDataBySql(Lsql, Lcds_Ctrl_ptr) then
      begin
        showmessage('错误!');
        exit;
      end;

      // Messages2 := '以下物料超领：';
      Messages2 := ' ' + cdsMain.FieldByName('fac_name').AsString + ' ' +
        cdsMain.FieldByName('dept_name').AsString + ' 领料单号' +
        cdsMain.FieldByName('number').AsString + ': ' + #13;

      if not Lcds_Ctrl_ptr.IsEmpty then
      begin

        Lcds_Ctrl_ptr.First;
        while not Lcds_Ctrl_ptr.eof do
        begin
          Messages := '';
          Lsql := 'select distinct d17.inv_name, d268.number, d468.remark  ' +
            ' from data0268 d268                                                  '
            + ' inner join data0468  d468  on d268.rkey=d468.flow_no                  '
            + ' inner join data0017  d17 on d468.INVENT_PTR=d17.rkey' +
            ' left join data0136 d136  on d468.control_ptr = d136.rkey                '
            + ' where   left(d468.remark,1)=''X'' and  d468.control_ptr=' +
            Lcds_Ctrl_ptr.FieldByName('control_ptr').AsString +
            '  and  d268.number=''' + cdsMain.FieldByName('number')
            .AsString + ''' ';

          if not gSvrintf.IntfGetDataBySql(Lsql, Lcds_mtrlL) then
          begin
            showmessage('错误!');
            exit;
          end;

          if not Lcds_mtrlL.IsEmpty then
            while not Lcds_mtrlL.eof do
            begin
              if Messages = '' then
                Messages := Lcds_mtrlL.FieldByName('inv_name').AsString
              else
                Messages := Messages + '、' + Lcds_mtrlL.FieldByName
                  ('inv_name').AsString;
              Lcds_mtrlL.Next;
            end;

          Messages := Messages2 + Messages + ' ' + Lcds_mtrlL.FieldByName
            ('remark').AsString;

          cds14.Append;
          cds14.FieldByName('IDkey').Value := gfunc.CreateIDKey;
          cds14.FieldByName('message').AsString := Messages;
          cds14.FieldByName('senddate').Value := gfunc.GetSvrDateTime;
          cds14.FieldByName('whosend').Value := gVar.rkey73;
          cds14.Post;

          // 要发送消息的人员：
          Lsql := 'select distinct isnull(d139.csi_ptr,0)csi_ptr ,d05.PHONE' +
          // , d73.USER_FULL_NAME
            '  from data0468 d468   ' +
            ' left join data0139  d139 on d468.control_ptr =d139.rkey136 ' +
            '  INNER JOIN   dbo.Data0073  d73 ON d139.csi_ptr =d73.RKEY  ' + #13
            + '  INNER JOIN  dbo.Data0005  d05 ON d73.EMPLOYEE_PTR = d05.RKEY    '
            + #13 + ' AND  d73.EMPLOYEE_PTR = d05.RKEY ' + #13 +
            ' where   left(d468.remark,1)=''X''  and  d468.control_ptr=' +
            Lcds_Ctrl_ptr.FieldByName('control_ptr').AsString +
            '  and  d468.flow_no=' + cdsMain.FieldByName('rkey').AsString;
          gSvrintf.IntfGetDataBySql(Lsql, LcdsMan);

          // 人员
          Lsql := 'select user_full_name from data0073 where rkey = ' +
            gVar.rkey73;
          gSvrintf.IntfGetDataBySql(Lsql, cdstemp4);

          if not LcdsMan.IsEmpty then
          begin
            LcdsMan.First;
            while not LcdsMan.eof do // 要发送消息的人员
            begin

              // 插入314表
              cds314.Append;
              cds314.FieldByName('emp_ptr').AsString :=
                LcdsMan.FieldByName('csi_ptr').AsString;
              cds314.FieldByName('D14_IDKey').Value :=
                cds14.FieldByName('IDkey').Value;
              cds314.FieldByName('hread').Value := 'F';
              cds314.FieldByName('deleted').Value := 'N';
              cds314.FieldByName('if_note').Value := 1;
              cds314.Post;

              if trim(cdstemp2.FieldByName('SUPLFEDSHIP').AsString) <> '' then
              begin

                cdstemp3.Append;
                cdstemp3.FieldByName('phonenumber').Value :=
                  LcdsMan.FieldByName('phone').AsString;
                cdstemp3.FieldByName('messagecontent').Value := Messages;
                cdstemp3.FieldByName('sendername').Value :=
                  cdstemp4.FieldByName('USER_FULL_NAME').AsString;
                cdstemp3.FieldByName('companyid').Value := 9;
                cdstemp3.Post;
              end;

              LcdsMan.Next;
            end;

          end;
          Messages := '';
          Lcds_Ctrl_ptr.Next;
        end;

        LTableName := cdstemp2.FieldValues['SUPLFEDMISC'];

        if cdstemp3.ChangeCount > 0 then
          if not gSvrintf.IntfPostDataByTable(LTableName, cdstemp3.Delta,
            LerrMsg, '化工厂SMS', '公共基础') then
          begin
            showmessage(LerrMsg);
            exit;
          end;

        // 更新发短信状态
        Lsql := 'select  * from data0268 where number=''' +
          cdsMain.FieldByName('number').AsString + ''' ';
        gSvrintf.IntfGetDataBySql(Lsql, cds268);
        cds268.Edit;
        cds268.FieldByName('IsMsgSended').Value := 1;
        cds268.Post;

        LUpdateData := VarArrayCreate([0, 2], varVariant);
        if cds14.ChangeCount > 0 then
          LUpdateData[0] := cds14.Delta;
        if cds314.ChangeCount > 0 then
          LUpdateData[1] := cds314.Delta;
        if cds268.ChangeCount > 0 then
          LUpdateData[2] := cds268.Delta;

        if not gSvrintf.IntfPostModData('公共基础', 496, LUpdateData, 1) then
        begin
          showmessage('发短信失败');
          exit;
        end;
        // btnRefreshClick(nil);

      end;

      // 更新其它：
      Lsql := 'select rkey from  data0268 where rkey=' +
        cdsMain.FieldByName('rkey').AsString + ' and  status =0';

      if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then
      begin
        showmessage('错误!');
        exit;
      end;

      if cdsTemp.IsEmpty then
      begin
        showmessage('申请单状态发生改变而未能成功提交!');
        exit;
      end;

      // 268 cdsTemp
      gSvrintf.IntfGetDataBySql('select * from data0268 where rkey=' +
        cdsMain.FieldByName('rkey').AsString, cdsTemp);
      cdsTemp.Edit;
      cdsTemp.FieldByName('status').Value := 1;
      cdsTemp.FieldByName('auth_emplptr').Value := null;
      cdsTemp.FieldByName('auth_date').Value := null;
      cdsTemp.Post;

      // 368 cdsTemp2
      gSvrintf.IntfGetDataBySql('select * from data0368 where apply_ptr=' +
        cdsMain.FieldByName('rkey').AsString, cdstemp2);
      while cdstemp2.RecordCount > 0 do
        cdstemp2.Delete;

      // 275 cdsTemp3
      sql275 := 'select * from data0275 where AUTH_GROUP_PTR=' +
        cdsMain.FieldByName('AUTH_ptr').AsString + ' order by rkey';
      gSvrintf.IntfGetDataBySql(sql275, cdstemp3);

      // 插入368
      LI := 1;
      if not cdstemp3.IsEmpty then
      begin
        cdstemp3.First;
        while not cdstemp3.eof do
        begin
          cdstemp2.Append;
          cdstemp2.FieldByName('D268_IDKey').Value :=
            cdsTemp.FieldByName('IDKey').AsString;
          cdstemp2.FieldByName('apply_ptr').Value := cdsMain.FieldByName('rkey')
            .AsInteger;
          cdstemp2.FieldByName('user_ptr').Value :=
            cdstemp3.FieldByName('user_ptr').AsString;
          if LI = 1 then
            cdstemp2.FieldByName('auth_flag').Value := 'Y'
          else
            cdstemp2.FieldByName('auth_flag').Value := 'N';

          cdstemp2.FieldByName('ranking').Value := LI;
          cdstemp2.Post;
          inc(LI);
          cdstemp3.Next;
        end;
      end;

      ADataArr := VarArrayCreate([0, 1], varVariant);
      // ATableArr := varArrayCreate([0, 1], varVariant);

      if cdsTemp.ChangeCount > 0 then
        ADataArr[0] := cdsTemp.Delta; // 268
      if cdstemp2.ChangeCount > 0 then
        ADataArr[1] := cdstemp2.Delta; // 368

      if gSvrintf.IntfPostModData('公共基础', 496, ADataArr, 2) then
        showmessage('提交成功');

      btnRefreshClick(Sender);

      cdsMain.GotoBookmark(LBK);
    except
      on e: Exception do
      begin
        showmessage('错误：' + e.message);
        exit;
      end;
    end;

  finally
    cdsTemp.Free;
    Lcds_Ctrl_ptr.Free;
    Lcds_mtrlL.Free;
    cdstemp2.Free;
    cdstemp3.Free;
    cdstemp4.Free;
    LcdsMan.Free;
    cds268.Free;
  end;

end;

//

procedure TFrmMain_mod496.mniViewClick(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
    exit;

  FEFlag := 3;
  if frmEdit_Mod496 = nil then
  begin
    frmEdit_Mod496 := TfrmEdit_Mod496.Create(self);
    frmEdit_Mod496.EFlag := 3;
    frmEdit_Mod496.Init;
  end;

  frmEdit_Mod496.GetData(cdsMain.FieldByName('rkey').AsString);
  frmEdit_Mod496.dtpReqDate.DateTime := cdsMain.FieldByName('date').AsDateTime;
  frmEdit_Mod496.cds268.ReadOnly := true;
  frmEdit_Mod496.cds468.ReadOnly := true;
  frmEdit_Mod496.btnSave.Enabled := false;
  frmEdit_Mod496.pnl3.Enabled := false;
  frmEdit_Mod496.Show;
end;

procedure TFrmMain_mod496.pmMainPopup(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
  begin

    mniAdd.Enabled := true; // 添加
    mniEdit.Enabled := false; // 编辑
    mniView.Enabled := false; // 检查
    mniDel.Enabled := false; // 删除
    mniSubmit.Enabled := false; // 提交
    mniCancelAudidt.Enabled := false; // 取消提交
    mniASubmit.Enabled := false; // 允许提交
    mniPrint.Enabled := false; // 打印
    mniRePrint.Enabled := false; // 重新打印
    mniAuditInfo.Enabled := false; // 审批信息

  end
  else
  begin
    mniEdit.Enabled := (cdsMain.FieldByName('status').AsInteger in [0, 3]) and
      (cdsMain.FieldByName('EMPL_PTR').AsString = gVar.rkey05);
    mniView.Enabled := true;
    mniSubmit.Enabled := (cdsMain.FieldByName('status').AsInteger = 0); //and
     // (cdsMain.FieldByName('allow_submit').AsInteger in [0, 2]); // 提交审批
    mniCancelAudidt.Enabled := (cdsMain.FieldByName('status').AsInteger = 1);
    mniDel.Enabled := (cdsMain.FieldByName('status').AsInteger in [0, 3]) and
      (cdsMain.FieldByName('EMPL_PTR').AsString = gVar.rkey05);
    mniPrint.Enabled := (cdsMain.FieldByName('status').AsInteger in [2, 4]) and
      (not cdsMain.FieldByName('prted').AsBoolean); // (vprev='3') or
    mniRePrint.Enabled := (cdsMain.FieldByName('status').AsInteger in [2, 4])
      and (cdsMain.FieldByName('prted').AsBoolean); // 重印     //(vprev='4') or
    // 申请人员只能打印一次,仓库人员可多次打印
    mniAuditInfo.Enabled := true;


    mniASubmit.Enabled := (cdsMain.FieldByName('allow_submit').AsInteger=1) and (cdsMain.fieldbyname('status').AsInteger =2);

    // 临时 允许      //and (cdsMain.fieldbyname('status').AsInteger in [0,3])
    //
  end;
end;

end.
