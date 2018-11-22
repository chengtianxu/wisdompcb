unit UMainFrm_Mod497;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, uCommFunc,
  DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.Buttons, EhLibVCL,
  System.DateUtils,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, Data.Win.ADODB;

type
  TFrmMain_Mod497 = class(TfrmBaseMain)
    eh468: TDBGridEh;
    chk0: TCheckBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    rg1: TRadioGroup;
    chkTime: TCheckBox;
    lbl1: TLabel;
    dtpk1: TDateTimePicker;
    lbl2: TLabel;
    dtpk2: TDateTimePicker;
    dsDetail: TDataSource;
    cdsDetail: TClientDataSet;
    qry1: TADOQuery;
    strngfldqry1INV_PART_NUMBER: TStringField;
    strngfldqry1INV_PART_DESCRIPTION: TStringField;
    fltfldqry1QUAN_BOM: TFloatField;
    fltfldqry1QUAN_ISSUED: TFloatField;
    strngfldqry1UNIT_NAME: TStringField;
    smlntfldqry1STATUS: TSmallintField;
    strngfldqry1VENDOR: TStringField;
    mniAudit: TMenuItem;
    mniCancelAudit: TMenuItem;
    mniAuditInfo: TMenuItem;
    mniN1: TMenuItem;
    mniReBack: TMenuItem;
    pnl1: TPanel;
    cdstempt: TClientDataSet;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure chk0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkTimeClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure mniAuditInfoClick(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ehMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure mniAuditClick(Sender: TObject);
    procedure mniCancelAuditClick(Sender: TObject);
    procedure mniReBackClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure edtFliterChange(Sender: TObject);
  private
    { Private declarations }

    Lemp_ptr, Lcurr_ranking: Integer;
    procedure Getdata(); override;

  public
    { Public declarations }
  end;

var
  FrmMain_Mod497: TFrmMain_Mod497;

implementation

uses UAuditInfoFrm_Mod497;

{$R *.dfm}

procedure TFrmMain_Mod497.btnRefreshClick(Sender: TObject);
begin
  inherited;
  Getdata();
end;

procedure TFrmMain_Mod497.cdsMainAfterScroll(DataSet: TDataSet);
var
  Lsql: string;
begin
  inherited;
  Lsql := ' SELECT  dbo.Data0468.RKEY, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PTR, '
    + ' dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0468.QUAN_BOM, dbo.Data0468.QUAN_ISSUED,   '
    + ' dbo.Data0002.UNIT_NAME, dbo.Data0468.STATUS, dbo.Data0468.VENDOR                                                      '
    + ' FROM    dbo.Data0002                                                                                                    '
    + ' INNER JOIN dbo.Data0017 ON dbo.Data0002.RKEY = dbo.Data0017.STOCK_UNIT_PTR                                                '
    + '  INNER JOIN dbo.Data0468 ON dbo.Data0017.RKEY = dbo.Data0468.INVENT_PTR '
    + 'where Data0468.flow_no= ';

  if cdsMain.FieldByName('rkey').AsString = '' then
  begin
    if not gSvrIntf.IntfGetDataBySql(Lsql + '-1', cdsDetail) then
      ShowMessage('取数据错误.');
    exit;
  end;

  if not gSvrIntf.IntfGetDataBySql(Lsql + cdsMain.FieldByName('rkey').AsString,
    cdsDetail) then
    ShowMessage('取数据错误.');

end;

procedure TFrmMain_Mod497.chk0Click(Sender: TObject);
var
  Li0, Li1, Li2, Li3, Li4: string;
begin
  inherited;
  // 领料单状态：
  if chk0.Checked then
    Li0 := '9'
  else
    Li0 := '0';

  if chk1.Checked then
    Li1 := '9'
  else
    Li1 := '1';

  if chk2.Checked then
    Li2 := '9'
  else
    Li2 := '2';

  if chk3.Checked then
    Li3 := '9'
  else
    Li3 := '3';

  if chk4.Checked then
    Li4 := '9'
  else
    Li4 := '4';

  fwhere2 := ' and ( d268.status  not in (' + Li0 + ',' + Li1 + ',' + Li2 + ','
    + Li3 + ' ,' + Li4 + ') )';

  Getdata();

end;

procedure TFrmMain_Mod497.chkTimeClick(Sender: TObject);
begin
  inherited;
  // 时间段
  if chkTime.Checked then
    FWhere3 := ' and (d268.DATE>=''' + formatdatetime('yyyy-MM-dd hh:mm:ss',
      dtpk1.Date) + ''' and d268.DATE<=''' +
      formatdatetime('yyyy-MM-dd hh:mm:ss', dtpk2.Date) + ''' )  '
  else
    FWhere3 := '';

  Getdata();
end;

procedure TFrmMain_Mod497.edtFliterChange(Sender: TObject);
var
  fDate: Tdatetime;
begin

  // if (FHotColumn.Field.DataType in [ftDate, ftDateTime]) and
  // (trim(edtFliter.text) <> '') then
  // if not TryStrToDate(trim(edtFliter.text), fDate) then
  // begin
  // ShowMessage(trim(edtFliter.text) + '不是日期格式！');
  // exit;
  // end;
  inherited;
end;

procedure TFrmMain_Mod497.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (cdsMain.FieldByName('status').value = 0) then
    ehMain.Canvas.Font.Color := cllime
  else if (cdsMain.FieldByName('status').value = 3) then
    ehMain.Canvas.Font.Color := clRed;

  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmMain_Mod497.ehMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (chr(Key) = 'V') and (ssalt in Shift) then
    ShowMessage(cdsMain.CommandText);
end;

procedure TFrmMain_Mod497.FormCreate(Sender: TObject);
begin
  dtpk1.Date := gFunc.GetSvrDateTime - 7;
  dtpk2.Date := gFunc.GetSvrDateTime;

  rg1.itemindex:=1;
  inherited;
    rg1.itemindex:=0;


end;

procedure TFrmMain_Mod497.FormShow(Sender: TObject);
begin
  inherited;
  //self.chk1.Checked := true;

  chkTime.Checked := false;


end;

procedure TFrmMain_Mod497.Getdata();
var
  Lsql: string;
begin

  FMainFrmSql :=
    ' SELECT DISTINCT d268.rkey,d268.number,d268.dept_ptr,d34.DEPT_CODE,d34.DEPT_NAME,d268.DATE,  '
    + '  d268.EMPL_PTR,d05_1.EMPL_CODE,d05_1.EMPLOYEE_NAME,d268.status,    ' +
    ' CASE d268.status WHEN 0 THEN ''待提交'' WHEN 1 THEN ''待审核'' WHEN 2 THEN ''已审核'' WHEN 3 THEN ''被退回''  WHEN 4 THEN ''已发放'' END AS C_STATUS,  '
    + ' d268.auth_emplptr,d05_2.EMPL_CODE AS auth_EMPL_CODE, d05_2.EMPLOYEE_NAME AS auth_EMPLOYEE_NAME,   '
    + ' d268.auth_date, d268.auth_ptr, d268.reference  ' +
    ' FROM DATA0268 d268                          ' +
    ' INNER JOIN Data0034 d34 ON d268.dept_ptr = d34.RKEY   ' +
    ' INNER JOIN Data0005 d05_1 ON d268.EMPL_PTR = d05_1.RKEY   ' +
    ' LEFT JOIN Data0005 d05_2 ON d268.auth_emplptr = d05_2.RKEY   ' +
    ' left JOIN DATA0368 d368 ON d368.apply_ptr = d268.rkey   ' +
    ' INNER JOIN Data0073 d73 ON d73.RKEY = d368.user_ptr    ' + ' where  1=1 ';

  if fwhere2 = '' then
  begin
    self.chk1.Checked := true;
    fwhere2 := ' and ( d268.status =1 ) ';
  end;

  FMainWhere := '  and  d73.rkey=' + gVar.rkey73;
  FOrderby := ' order by d268.rkey  desc ';

  inherited;

  //showmessage(FMainFrmSql+FMainWhere+fwhere2+fwhere3);

  Lsql := ' SELECT  dbo.Data0468.RKEY, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PTR, '
    + ' dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0468.QUAN_BOM, dbo.Data0468.QUAN_ISSUED,   '
    + ' dbo.Data0002.UNIT_NAME, dbo.Data0468.STATUS, dbo.Data0468.VENDOR                                                      '
    + ' FROM    dbo.Data0002                                                                                                    '
    + ' INNER JOIN dbo.Data0017 ON dbo.Data0002.RKEY = dbo.Data0017.STOCK_UNIT_PTR                                                '
    + '  INNER JOIN dbo.Data0468 ON dbo.Data0017.RKEY = dbo.Data0468.INVENT_PTR '
    + 'where Data0468.flow_no= ';

  if cdsMain.FieldByName('rkey').AsString = '' then
  begin
    if not gSvrIntf.IntfGetDataBySql(Lsql + '-1', cdsDetail) then
      ShowMessage('取数据错误.');
    exit;
  end;

end;

procedure TFrmMain_Mod497.mniAuditClick(Sender: TObject);
var
  Lsql: string;
  cdstemp: TClientDataSet;
  cdstemp2: TClientDataSet;
  cds268: TClientDataSet;
  cds368: TClientDataSet;
  cds368_2: TClientDataSet;
  cds73: TClientDataSet;
  LUpdateData: OleVariant;
  LBK: TBookmark;
begin
  inherited;
  if not gFunc.CheckUserAuth(1, 497) then
    exit;

   LBK := cdsMain.Bookmark;

  cdstemp := TClientDataSet.create(nil);
  cdstemp2 := TClientDataSet.create(nil);
  cds268 := TClientDataSet.create(nil);
  cds368 := TClientDataSet.create(nil);
  cds368_2 := TClientDataSet.create(nil);
  cds73 := TClientDataSet.create(nil);
  try
    // 判断有没有其它人审核
    Lsql := 'select status from data0268 where rkey=' +
      cdsMain.FieldByName('rkey').AsString + ' and status=' +
      cdsMain.FieldByName('status').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    if cdstemp.IsEmpty then
    begin
      ShowMessage('领料单状态发生变化,操作失败!');
      btnRefreshClick(nil);
      exit;
    end;

    Lsql := 'SELECT dbo.DATA0368.rkey, dbo.DATA0368.apply_ptr, dbo.DATA0368.user_ptr, dbo.DATA0368.auth_date, dbo.DATA0368.ranking, dbo.DATA0368.auth_flag, '
      + #13 + '       dbo.DATA0368.remark, dbo.Data0073.draw_materiel_ptr, Data0073_1.USER_FULL_NAME AS RPL_USER_FULL_NAME '
      + #13 + 'FROM   dbo.DATA0368 INNER JOIN ' + #13 +
      '       dbo.Data0073 ON dbo.DATA0368.user_ptr = dbo.Data0073.RKEY INNER JOIN '
      + #13 + '       dbo.Data0073 AS Data0073_1 ON dbo.Data0073.draw_materiel_ptr = Data0073_1.RKEY '
      + #13 + 'WHERE  (dbo.DATA0368.auth_flag = ''Y'') AND (dbo.DATA0368.apply_ptr = '
      + cdsMain.FieldByName('rkey').AsString + ')';

    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    if cdstemp.FieldByName('draw_materiel_ptr').AsString = '' then
    begin
      ShowMessage('当前没有审核人员，请与审核部门联系。');
      exit;
    end
    else
    begin

      if cdstemp.FieldByName('draw_materiel_ptr').AsString <> gVar.rkey73 then
      begin
        ShowMessage('您不是当前审批人，当前审批人是：' + cdstemp.FieldByName
          ('RPL_USER_FULL_NAME').AsString);
        exit;
      end;
    end;

    Lcurr_ranking := cdstemp.FieldByName('ranking').AsInteger;

    try

      Lsql := 'select * from data0368 WHERE  (auth_flag = ''Y'') AND (apply_ptr = '
        + cdsMain.FieldByName('rkey').AsString + ')';
      // showmessage(lsql);
      gSvrIntf.IntfGetDataBySql(Lsql, cds368);

      cds368.Edit;
      cds368.FieldByName('auth_date').value := gFunc.GetSvrDateTime;
      cds368.FieldByName('auth_flag').value := 'N';
      cds368.Post;

      Lsql := 'select * from data0368  ' + 'WHERE  (ranking = ' +
        inttostr(Lcurr_ranking + 1) + ') AND (apply_ptr = ' +
        cdsMain.FieldByName('rkey').AsString + ')';
      gSvrIntf.IntfGetDataBySql(Lsql, cds368_2);

      if not cds368_2.IsEmpty then
      begin
        cds368_2.Edit;
        cds368_2.FieldByName('auth_flag').value := 'Y';
        cds368_2.Post;
      end;

      // EMP_PTR
      if cds368_2.IsEmpty then
      begin
        Lsql := 'SELECT EMPLOYEE_PTR ' + #13 + 'FROM dbo.Data0073 ' + #13 +
          'WHERE RKEY = ' + gVar.rkey73;
        gSvrIntf.IntfGetDataBySql(Lsql, cds73);

        // 368
        Lsql := 'select cast(auth_date as smalldatetime)auth_date  from data0368  '
          + 'WHERE apply_ptr =' + cdsMain.FieldByName('rkey').AsString;
        gSvrIntf.IntfGetDataBySql(Lsql, cdstemp2);

        Lsql := 'select * from data0268  ' + 'WHERE rkey =' +
          cdsMain.FieldByName('rkey').AsString;
        gSvrIntf.IntfGetDataBySql(Lsql, cds268);

        cds268.Edit;
        cds268.FieldByName('auth_emplptr').value :=
          cds73.FieldByName('EMPLOYEE_PTR').AsInteger;
        cds268.FieldByName('status').value := 2;
        // showmessage(FormatDateTime('yyyy-MM-dd hh:mm:ss',cdstemp2.fieldbyname('auth_date').AsDateTime));
        if cdstemp2.FieldByName('auth_date').value <> null then
          cds268.FieldByName('auth_date').value :=
            cdstemp2.FieldByName('auth_date').value
        else
          cds268.FieldByName('auth_date').value := gFunc.GetSvrDateTime;
        cds268.Post;
      end;

      LUpdateData := VarArrayCreate([0, 2], varVariant);
      if cds368.ChangeCount > 0 then
        LUpdateData[0] := cds368.Delta;
      if cds368_2.ChangeCount > 0 then
        LUpdateData[1] := cds368_2.Delta;
      if cds268.ChangeCount > 0 then
        LUpdateData[2] := cds268.Delta;

      if gSvrIntf.IntfPostModData('公共基础', 497, LUpdateData) then
        ShowMessage('审核操作成功!');

      btnRefreshClick(nil);


      // if not  cds368_2.IsEmpty then
       // cdsMain.GotoBookmark(LBK);

        rg1Click(rg1);

    except
      on E: Exception do
      begin
        messagedlg('审核操作失败' + #13 + '原因：' + E.Message, mterror, [mbcancel], 0);
      end;
    end;
  finally
    cdstemp.free;
    cdstemp2.free;
    cds268.free;
    cds368.free;
    cds368_2.free;
    cds73.free;

  end;
end;

procedure TFrmMain_Mod497.mniCancelAuditClick(Sender: TObject);
var
  Lsql, Lstr: string;
  cdstemp: TClientDataSet;
  cds268: TClientDataSet;
  cds368: TClientDataSet;
  cds368_2: TClientDataSet;
  LUpdateData: OleVariant;
  LBK: TBookmark;
begin
  inherited;
  if not gFunc.CheckUserAuth(2, 497) then
    exit;
  cdstemp := TClientDataSet.create(nil);
  cds268 := TClientDataSet.create(nil);
  cds368 := TClientDataSet.create(nil);
  cds368_2 := TClientDataSet.create(nil);
  try
    LBK := cdsMain.Bookmark;
    Lsql := 'select status from data0268 where rkey=' +
      cdsMain.FieldByName('rkey').AsString + ' and status=' +
      cdsMain.FieldByName('status').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    if cdstemp.IsEmpty then
    begin
      ShowMessage('领料单状态发生变化,操作失败!');
      btnRefreshClick(nil);
      exit;
    end;

    Lsql := 'SELECT TOP 1 QUAN_ISSUED ' + #13 + 'FROM    Data0468 ' + #13 +
      'WHERE   (QUAN_ISSUED > 0) AND (FLOW_NO = ' + cdsMain.FieldByName('rkey')
      .AsString + ')';
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    if not cdstemp.IsEmpty then
    begin
      ShowMessage('领料单已发料，不允许反审领料单！');
      btnRefreshClick(nil);
      exit;
    end;

    if cdsMain.FieldByName('status').value = 2 then
    begin

      Lsql := 'SELECT TOP 1 DATA0368.user_ptr, DATA0368.ranking, Data0073_1.USER_FULL_NAME, Data0073.draw_materiel_ptr '
        + #13 + 'FROM         DATA0368 INNER JOIN ' + #13 +
        '             Data0073 ON DATA0368.user_ptr = Data0073.RKEY INNER JOIN '
        + #13 + '             Data0073 AS Data0073_1 ON Data0073.draw_materiel_ptr = Data0073_1.RKEY '
        + #13 + 'WHERE  DATA0368.apply_ptr = ' + cdsMain.FieldByName('rkey')
        .AsString + ' ' + #13 + 'ORDER BY DATA0368.ranking DESC';
      gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

      Lcurr_ranking := cdstemp.FieldByName('ranking').AsInteger + 1;

      if cdstemp.FieldByName('draw_materiel_ptr').AsString <> gVar.rkey73 then
      begin
        ShowMessage('反审失败！您不是最后审批人，最后审批人是：' + cdstemp.FieldValues
          ['USER_FULL_NAME']);
        btnRefreshClick(nil);
        exit;
      end;
    end;

    if cdsMain.FieldByName('status').value = 1 then
    begin
      // with dm.adoquery1 do

      Lsql := 'SELECT ranking ' + #13 + 'FROM   DATA0368 ' + #13 +
        'WHERE  (auth_flag = ''Y'') AND (apply_ptr = ' +
        cdsMain.FieldByName('rkey').AsString + ')';
      gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

      if cdstemp.FieldByName('ranking').AsInteger = 1 then
      begin
        ShowMessage('该领料单没有审批，不需要反审！');
        btnRefreshClick(nil);
        exit;
      end;

      Lcurr_ranking := cdstemp.FieldByName('ranking').AsInteger;

      // with dm.adoquery1 do
      Lsql := 'SELECT  DATA0368.user_ptr, DATA0368.ranking, Data0073_1.USER_FULL_NAME, DATA0073.draw_materiel_ptr '
        + #13 + 'FROM         DATA0368 INNER JOIN ' + #13 +
        '             Data0073 ON DATA0368.user_ptr = Data0073.RKEY INNER JOIN '
        + #13 + '             Data0073 AS Data0073_1 ON Data0073.draw_materiel_ptr = Data0073_1.RKEY '
        + #13 + 'WHERE  (DATA0368.apply_ptr = ' + cdsMain.FieldByName('rkey')
        .AsString + ') and DATA0368.ranking= ' + inttostr(Lcurr_ranking - 1);
      gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

      if cdstemp.FieldByName('draw_materiel_ptr').AsString <> gVar.rkey73 then
      begin
        ShowMessage('反审失败！您不是最后审批人，最后审批人是：' + cdstemp.FieldValues
          ['USER_FULL_NAME']);
        btnRefreshClick(nil);
        exit;
      end;
    end;

    if inputquery('反审原因', '请输入反审原因:', Lstr) then
    begin
      if trim(Lstr) = '' then
      begin
        ShowMessage('反审原因为空操作不成功');
        exit;
      end;
    end
    else
      exit;

    try

      if cdsMain.FieldByName('status').value = 2 then
      // 将状态为已审批的领料单改为未审批，并清除审批信息
      begin
        Lsql := 'select * from data0268  ' + 'WHERE  rkey = ' +
          cdsMain.FieldByName('rkey').AsString;
        gSvrIntf.IntfGetDataBySql(Lsql, cds268);

        cds268.Edit;
        cds268.FieldByName('status').value := 1;
        cds268.FieldByName('auth_emplptr').value := null;
        cds268.FieldByName('auth_date').value := null;
        cds268.Post;
      end;

      if cdsMain.FieldByName('status').value = 1 then // 修改当前审批人标志
      begin
        Lsql := 'select * from DATA0368  ' + 'WHERE  (apply_ptr = ' +
          cdsMain.FieldByName('rkey').AsString + ') AND (ranking = ' +
          inttostr(Lcurr_ranking) + ')';
        gSvrIntf.IntfGetDataBySql(Lsql, cds368);

        cds368.Edit;
        cds368.FieldByName('auth_flag').value := 'N';
        cds368.Post;
      end;

      Lsql := 'select * from DATA0368  ' + 'WHERE  (apply_ptr = ' +
        cdsMain.FieldByName('rkey').AsString + ') AND (ranking = ' +
        inttostr(Lcurr_ranking - 1) + ')';
      gSvrIntf.IntfGetDataBySql(Lsql, cds368_2);

      if not cds368_2.IsEmpty then
      begin
        cds368_2.Edit;
        cds368_2.FieldByName('auth_flag').value := 'Y';
        cds368_2.FieldByName('auth_date').value := null;
        cds368_2.FieldByName('remark').value := Lstr;
        cds368_2.Post;
      end;

      LUpdateData := VarArrayCreate([0, 2], varVariant);

      if cds268.ChangeCount > 0 then
        LUpdateData[0] := cds268.Delta;
      if cds368.ChangeCount > 0 then
        LUpdateData[1] := cds368.Delta;
      if cds368_2.ChangeCount > 0 then
        LUpdateData[2] := cds368_2.Delta;

      if gSvrIntf.IntfPostModData('公共基础', 497, LUpdateData, 1) then
        ShowMessage('取消审核操作成功!');

      btnRefreshClick(nil);

//       if LBK<>null then
//       cdsMain.GotoBookmark(LBK);
    except
      on E: Exception do
      begin
        messagedlg('审核操作失败' + #13 + '原因：' + E.Message, mterror, [mbcancel], 0);
      end;
    end;
  finally
    cdstemp.free;
    cds268.free;
    cds368.free;
    cds368_2.free;
  end;
end;

procedure TFrmMain_Mod497.mniReBackClick(Sender: TObject);
var
  Lstr: string;
  Lsql: string;
  cdstemp: TClientDataSet;
  cds268: TClientDataSet;
  LBK: TBookmark;
begin
  inherited;
  try
    if not gFunc.CheckUserAuth(3, 497) then
      exit;

    cdstemp := TClientDataSet.create(nil);
    cds268 := TClientDataSet.create(nil);
    try
      LBK := cdsMain.Bookmark;
      Lsql := 'select status from data0268 where rkey=' +
        cdsMain.FieldByName('rkey').AsString + ' and status=' +
        cdsMain.FieldByName('status').AsString;
      gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

      if cdstemp.IsEmpty then
      begin
        ShowMessage('出仓单号状态发生变化,操作失败!');
        exit;
      end;

      Lsql := 'SELECT TOP 1 dbo.DATA0368.apply_ptr, dbo.Data0073.draw_materiel_ptr, dbo.DATA0368.auth_flag '
        + #13 + 'FROM         dbo.DATA0368 INNER JOIN ' + #13 +
        '             dbo.Data0073 ON dbo.DATA0368.user_ptr = dbo.Data0073.RKEY '
        + #13 + 'WHERE       (dbo.DATA0368.auth_flag = ''Y'') AND (dbo.DATA0368.apply_ptr = '
        + cdsMain.FieldByName('rkey').AsString +
        ') AND (dbo.Data0073.draw_materiel_ptr = ' + gVar.rkey73 + ')';
      gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

      if cdstemp.IsEmpty then
      begin
        ShowMessage('你不是当前审批人，不允许退回!');
        exit;
      end;

      if inputquery('退回原因', '请输入退回原因:', Lstr) then
      begin
        if trim(Lstr) = '' then
        begin
          ShowMessage('退回原因为空操作不成功');
          exit;
        end
      end
      else
        exit;

      Lsql := 'select * from data0268  ' + 'WHERE  rkey = ' +
        cdsMain.FieldByName('rkey').AsString;
      gSvrIntf.IntfGetDataBySql(Lsql, cds268);

      cds268.Edit;
      cds268.FieldByName('auth_emplptr').value := Lemp_ptr;
      cds268.FieldByName('auth_date').value := gFunc.GetSvrDateTime;
      cds268.FieldByName('status').value := 3;
      cds268.FieldByName('reference').value := Lstr;
      cds268.Post;

      gSvrIntf.IntfPostDataByTable('data0268', cds268.Delta);

      btnRefreshClick(nil);
      cdsMain.GotoBookmark(LBK);
    except
      on E: Exception do
      begin
        ShowMessage('错误：' + E.Message);
        exit;
      end;
    end;
  finally
    cdstemp.free;
    cds268.free;
  end;
end;

procedure TFrmMain_Mod497.pmMainPopup(Sender: TObject);
var
  Ldraw_materiel_ptr: Integer;
  LI: Integer;
  Lsql: string;
begin
  inherited;

  if cdsMain.IsEmpty then
  begin
    self.mniAudit.Enabled := false;
    self.mniCancelAudit.Enabled := false;
    self.mniAuditInfo.Enabled := false;
    self.mniReBack.Enabled := false;
    exit;
  end;

  Lsql := 'SELECT draw_materiel_ptr FROM Data0073 where RKEY =' + gVar.rkey73;
  if not gSvrIntf.IntfGetDataBySql(Lsql, cdstempt) then
  begin
    ShowMessage('错误!');
    exit;
  end;

  Ldraw_materiel_ptr := cdstempt.FieldByName('draw_materiel_ptr').value;

  if Ldraw_materiel_ptr <> strtoint(gVar.rkey73) then
  begin
    Lsql := 'SELECT user_full_name FROM Data0073 where RKEY =' +
      inttostr(Ldraw_materiel_ptr);
    if not gSvrIntf.IntfGetDataBySql(Lsql, cdstempt) then
    begin
      ShowMessage('错误!');
      exit;
    end
    else
      messagedlg('您已经将领料审批授权给用户：' + cdstempt.FieldByName('user_full_name').value
        + ' 请首先取消授权', mtinformation, [mbok], 0);

    for LI := 0 to PMMain.Items.Count - 1 do
      PMMain.Items[LI].Enabled := false;
    exit;
  end;

  Lsql := 'select status from data0268 where rkey=' +
    cdsMain.FieldByName('rkey').AsString + ' and status=' +
    cdsMain.FieldByName('status').AsString;
  if not gSvrIntf.IntfGetDataBySql(Lsql, cdstempt) then
  begin
    ShowMessage('错误!');
    exit;
  end;

  if cdstempt.IsEmpty then
  begin
    btnRefreshClick(nil);
  end;

  Lsql := 'SELECT TOP 1 RKEY ' + #13 + 'FROM   dbo.DATA0368' + #13 +
    'WHERE  (auth_flag = ''Y'') AND (apply_ptr = ' + cdsMain.FieldByName('rkey')
    .AsString + ') AND (RANKING <> 1)';
  if not gSvrIntf.IntfGetDataBySql(Lsql, cdstempt) then
  begin
    ShowMessage('错误!');
    exit;
  end;

  mniAudit.Enabled := cdsMain.FieldByName('status').value = 1;
  mniReBack.Enabled := mniAudit.Enabled;
  mniCancelAudit.Enabled := cdsMain.FieldByName('status').value = 2;
  if (cdsMain.FieldByName('status').value = 1) AND (NOT cdstempt.IsEmpty) then
    mniCancelAudit.Enabled := true;
  mniAuditInfo.Enabled := not cdsMain.IsEmpty
end;

procedure TFrmMain_Mod497.mniAuditInfoClick(Sender: TObject);
var
  Lfrm: TFrmAuditInfo_Mod497;
begin
  inherited;
  Lfrm := TFrmAuditInfo_Mod497.create(nil);
  try
    Lfrm.Getdata(cdsMain.FieldByName('rkey').AsString);
    Lfrm.ShowModal;
  finally
    Lfrm.free;
  end;
end;

procedure TFrmMain_Mod497.rg1Click(Sender: TObject);
begin
  inherited;
  // 本人否
//  if FWhere3 = '' then
//  begin
    if rg1.ItemIndex = 0 then
      FWhere3 := ' and ( d368.auth_flag=''Y'' )'
    else
      FWhere3 := ' and (d368.auth_flag in (''Y'',''N''))';
//  end  ;
//  else
//  begin
//    if rg1.ItemIndex = 0 then
//      FWhere3 := FWhere3 + ' and (d368.auth_flag=''Y'' )'
//    else
//      FWhere3 := FWhere3 + ' and(d368.auth_flag in (''Y'',''N''))';
//  end;

  Getdata();
end;

end.
