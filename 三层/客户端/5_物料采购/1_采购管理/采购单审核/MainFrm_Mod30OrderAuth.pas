unit MainFrm_Mod30OrderAuth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, RzRadGrp,System.StrUtils;

type
  TfrmMain_Mod30OrderAuth = class(TfrmBaseMain)
    pnlEhDetail: TPanel;
    cds1: TClientDataSet;
    cds2: TClientDataSet;
    cdsDetail72: TClientDataSet;
    dsDetail72: TDataSource;
    pmDetail71: TPopupMenu;
    mniSupplier: TMenuItem;
    mniStore: TMenuItem;
    mniOldPrice: TMenuItem;
    cdsDetail71: TClientDataSet;
    dsDetail71: TDataSource;
    ehDetail71: TDBGridEh;
    ehDetail72: TDBGridEh;
    rg1: TRzRadioGroup;
    mniAuth: TMenuItem;
    mniUnAuth: TMenuItem;
    mniBack: TMenuItem;
    mniRemark: TMenuItem;
    N1: TMenuItem;
    mniCheck: TMenuItem;
    mniAuthMsg: TMenuItem;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure mniAuthClick(Sender: TObject);
    procedure mniAuthMsgClick(Sender: TObject);
    procedure mniBackClick(Sender: TObject);
    procedure mniCheckClick(Sender: TObject);
    procedure mniOldPriceClick(Sender: TObject);
    procedure mniRemarkClick(Sender: TObject);
    procedure mniStoreClick(Sender: TObject);
    procedure mniSupplierClick(Sender: TObject);
    procedure mniUnAuthClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure pmDetail71Popup(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
  private
    { Private declarations }
    function GetAuthData:string;
    function CheckPrice(ARkey70:string;ARate:Real):Boolean;
//    function GetAuthName(ARkey:string):string;
  public
    { Public declarations }
    procedure GetData;override;
    procedure IninFields();
  end;

var
  frmMain_Mod30OrderAuth: TfrmMain_Mod30OrderAuth;

implementation

uses uCommFunc, AuthMsgFrm_Mod29, DetailFrm_Mod29, NoteFrm_Mod29, CommFrm_Mod29, System.DateUtils;

{$R *.dfm}

{ TfrmDdddd }

procedure TfrmMain_Mod30OrderAuth.btnQryClick(Sender: TObject);
begin
  inherited;
  cdsMainAfterScroll(cdsMain)
end;

procedure TfrmMain_Mod30OrderAuth.btnRefreshClick(Sender: TObject);
begin
  inherited;
  cdsMainAfterScroll(cdsMain);
end;

procedure TfrmMain_Mod30OrderAuth.cdsMainAfterScroll(DataSet: TDataSet);
var
  LSql:string;
begin
  inherited;
  if DataSet.IsEmpty then
  begin
    cdsDetail72.Active:= False;
    cdsDetail71.Active:= False;
    Exit;
  end;

  if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
  begin
    ehDetail71.BringToFront;
    LSql:= cdsDetail71.CommandText + ' WHERE PO_PTR = ' + IntToStr(cdsMain.FieldByName('rkey').AsInteger);
    if not gSvrIntf.IntfGetDataBySql(LSql,cdsDetail71) then Exit;
    ehDetail71.DataSource:=nil;
    ehDetail71.DataSource:= dsDetail71;
  end
  else
  begin
    ehDetail72.BringToFront;
    LSql:= cdsDetail72.CommandText + ' WHERE POPTR = ' + IntToStr(cdsMain.FieldByName('rkey').AsInteger);
    if not gSvrIntf.IntfGetDataBySql(LSql,cdsDetail72) then Exit;
    ehDetail72.DataSource:=nil;
    ehDetail72.DataSource:= dsDetail72;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.cdsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  if cdsMain.FieldByName('auth_date').IsNull  then cdsMain.FieldByName('str_status').Value:='待审批'
  else  cdsMain.FieldByName('str_status').Value:='批准';
end;

function TfrmMain_Mod30OrderAuth.CheckPrice(ARkey70: string; ARate: Real): Boolean;
var
  LSql,LStr:string;
  LCds:TClientDataSet;
begin
  Result:= False;
  LStr:='';
  LCds:= TClientDataSet.Create(Self);
  cdsDetail71.DisableControls;
  try
    cdsDetail71.First;
    while not cdsDetail71.Eof do
    begin
      LSql:=' SELECT TOP 1 Data0017.INV_PART_DESCRIPTION  ' + #13 +
            '      ,(Data0071.PRICE*Data0070.EXCHANGE_RATE) AS PRICE_RMB  ' + #13 +
            '    FROM Data0070 INNER JOIN Data0071 ON Data0070.RKEY=Data0071.PO_PTR   ' + #13 +
            '    INNER JOIN Data0017 ON Data0071.INVT_PTR=Data0017.RKEY  ' + #13 +
            '    WHERE Data0070.STATUS IN(5,6,7)   ' + #13 +
            '    AND Data0071.INVT_PTR =  ' + cdsDetail71.FieldByName('INVT_PTR').AsString + #13+
            '    AND Data0070.RKEY <> ' + ARkey70 + #13+
            '    ORDER BY Data0070.PO_DATE DESC  ';
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        if (cdsDetail71.FieldByName('PRICE').Value * ARate) > LCds.FieldByName('PRICE_RMB').Value then
        begin
          if LStr = '' then
            LStr:= '以下物料不含税价格上涨:' + cdsDetail71.FieldByName('partnumber').AsString + ':' +
                      cdsDetail71.FieldByName('inv_part_number').AsString + #13
          else
            LStr:= LStr + cdsDetail71.FieldByName('partnumber').AsString + ':' +
                      cdsDetail71.FieldByName('inv_part_number').AsString + #13
        end;
      end;
      cdsDetail71.Next;
    end;
    cdsDetail71.First;
    if LStr <> '' then  ShowMessage(LStr);
    Result:= True;
  finally
    cdsDetail71.EnableConstraints;
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.ehMainTitleClick(Column: TColumnEh);
begin
  if Column.FieldName = 'str_status' then exit;
  inherited;
end;

function TfrmMain_Mod30OrderAuth.GetAuthData: string;
begin
  if rg1.ItemIndex = 0  then Result:= ' AND (dbo.data0078.auth_flag = ''Y'')'
  else Result:= '';
end;

//function TfrmMain_Mod29OrderAuth.GetAuthName(ARkey: string): string;
//var
//  LSql:string;
//  LCds:TClientDataSet;
//begin
//  Result:='';
//  LSql:= 'SELECT data0005.EMPLOYEE_NAME,data0073.employee_ptr ' + #13+
//         '   FROM data0005 inner join data0073 on  data0073.employee_ptr=data0005.rkey  ' + #13+
//         '   WHERE  data0073.rkey = ' + ARkey;
//  LCds:= TClientDataSet.Create(Self);
//  try
//    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
//    if not LCds.IsEmpty then
//    begin
//      Result:= LCds.FieldByName('EMPLOYEE_NAME').AsString;
//    end;
//  finally
//    LCds.Free;
//  end;
//end;

procedure TfrmMain_Mod30OrderAuth.GetData;
begin
  if cdsMain.FieldCount = 0 then
  Self.IninFields();

  FMainFrmSql:= cdsMain.CommandText;
  FWhere2:= ' AND (dbo.data0078.user_ptr IN  ' +#13+
           '         (SELECT RKEY   ' +#13+
           '           FROM dbo.Data0073  ' +#13+
           '           WHERE (rpl_po_ptr = ' + gVar.rkey73 + ' ))) ' ;
  FWhere3:= GetAuthData;
  FOrderby:= ' ORDER BY DATA0070.PO_NUMBER ';

//  ShowMessage(FMainFrmSql + FMainWhere + FWhere2 + FWhere3 + FOrderby);
  inherited;
end;

procedure TfrmMain_Mod30OrderAuth.IninFields;
var
  i:Integer;
  LField:TField;
begin
  if not gSvrIntf.IntfGetDataBySql(cdsMain.CommandText+ ' and 1=0',cdsMain) then Exit;
  cdsMain.Close;
  cdsMain.FieldDefs.Update;
  try
    for i := 0 to cdsMain.FieldDefList.Count-1 do
      cdsMain.FieldDefList.FieldDefs[i].CreateField(Self);

    LField:= TStringField.Create(cdsMain);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'str_status';
    LField.DataSet:= cdsMain;
  finally
    cdsMain.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniAuthClick(Sender: TObject);
var
  LSql70,LSql78:string;
  LAuthName:string;
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,30) then Exit;
  LAuthName:='';
  if cdsMain.FieldByName('auth_flag').AsString = 'N' then
  begin
    ShowMessage('审批操作不成，当前审批人员不正确！');
    Exit;
  end;

  if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
    if not Self.CheckPrice(cdsMain.FieldByName('rkey').AsString
            ,cdsMain.FieldByName('EXCHANGE_RATE').AsCurrency) then
    begin
      ShowMessage('检查历史价格出错！');
      Exit;
    end;

  LSql70:= 'SELECT * FROM DATA0070 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString ;
  LSql78:= 'SELECT * FROM DATA0078 WHERE PO_PTR = ' + cdsMain.FieldByName('rkey').AsString + ' ORDER BY ranking';
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql70,LSql78]),[cds1,cds2]) then Exit;
  if not cds1.IsEmpty then
  begin
//    LAuthName:= Self.GetAuthName(gVar.rkey73);
//    if LAuthName = '' then
//    begin
//      ShowMessage('取得审批人名字有误！');
//      Exit;
//    end;
    cds1.Edit;
    cds1.FieldByName('EXPIRED_DATE').Value:= StrToDateTime(FormatDateTime('YYYY-MM-DD HH:MM', gFunc.GetSvrDateTime));        //短日期格式  只到分钟
    cds1.FieldByName('CONFIRMATION_NUMBER').Value:= gVar.UserName05;
    cds1.Post;
  end;
  if not cds2.IsEmpty then
  begin
    if cds2.Locate('user_ptr',cdsMain.FieldByName('user_ptr').AsInteger,[]) then
    begin
      cds2.Edit;
      cds2.FieldByName('auth_flag').Value:='N';
      cds2.FieldByName('auth_date').Value:= dateof(gFunc.GetSvrDateTime);    //短日期格式  只日期
      cds2.Post;
    end;

    cds2.First;
    while not cds2.Eof do
    begin
      if cds2.FieldByName('ranking').AsInteger - cdsMain.FieldByName('ranking').AsInteger = 1 then
      begin
        cds2.Edit;
        cds2.FieldByName('auth_flag').Value:='Y';
        cds2.Post;
      end
      else if cds2.RecNo = cds2.RecordCount then
      begin
        cds1.Edit;
        cds1.FieldByName('status').Value:= 5 ;   //已审批
        cds1.Post;
      end;
      cds2.Next;
    end;
  end;

  LData:= VarArrayCreate([0,1],varVariant);
  if cds1.ChangeCount > 0 then LData[0]:= cds1.Delta;
  if cds2.ChangeCount > 0 then LData[1]:= cds2.Delta;
  if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['DATA0070','DATA0078']),LData) then
  begin
    if cds1.ChangeCount > 0 then cds1.MergeChangeLog;
    if cds2.ChangeCount > 0 then cds2.MergeChangeLog;
    ShowMessage('审批成功！');
    cdsMain.Edit;
    cdsMain.FieldByName('status').Value:= 5;
    cdsMain.FieldByName('auth_date').Value:= 0;      //只要不为空状态就会更改
    cdsMain.Post;
  end
  else
  begin
    ShowMessage('审批失败，请联系管理员！');
    Exit;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniAuthMsgClick(Sender: TObject);
var
  LFrm:TfrmAuthMsg_Mod29;
begin
  inherited;
  LFrm:= TfrmAuthMsg_Mod29.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniBackClick(Sender: TObject);
var
  LFrm: TfrmNote_Mod29;
  LSql70:string;
//  LAuthName:string;
//  LData:OleVariant;
begin
  inherited;
  LFrm:= TfrmNote_Mod29.Create(nil);
  try
    LFrm.btnSelect.Visible:= False;
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString,2);
    if LFrm.ShowModal = mrOk then
    begin
      LSql70:= 'SELECT * FROM DATA0070 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString ;
      if not gSvrIntf.IntfGetDataBySql(LSql70,cds1) then Exit;
      if not cds1.IsEmpty then
      begin
        cds1.Edit;
        cds1.FieldByName('remark2070').Value := Trim(LFrm.mmo1.Text);
        cds1.FieldByName('status').Value:= 2;  //被退回
        cds1.FieldByName('STATE_TAX').Value := gVar.rkey05;
        cds1.FieldByName('PRINT_TIME').Value := gFunc.GetSvrDateTime;       //短日期
        cds1.Post;
      end;

      if gSvrIntf.IntfPostDataByTable('data0070',cds1.Delta) then
      begin
        cds1.MergeChangeLog;
        ShowMessage('退回成功');
        btnRefreshClick(nil);
      end
      else
      begin
        ShowMessage('退回失败，请联系管理员！');
        Exit;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniCheckClick(Sender: TObject);
begin
  inherited;
  if frmDetail_Mod29 = nil then
  begin
    frmDetail_Mod29:= TfrmDetail_Mod29.Create(Self);
    if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then  frmDetail_Mod29.InitField71
    else frmDetail_Mod29.InitField72;
  end;
  frmDetail_Mod29.AddINVT:= cdsMain.FieldByName('PO_TYPE').AsString;
  frmDetail_Mod29.OpenType := 2;
  if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
  begin
    frmDetail_Mod29.GetDataS(cdsMain.FieldByName('rkey').AsString);
    frmDetail_Mod29.eh71.BringToFront;
  end
  else
  begin
    frmDetail_Mod29.GetDataM(cdsMain.FieldByName('rkey').AsString);
    frmDetail_Mod29.eh72.BringToFront;
  end;
  frmDetail_Mod29.tbc.Tabs.Add(cdsMain.FieldByName('CODE').AsString);
  frmDetail_Mod29.tbc.Visible:=True;
  frmDetail_Mod29.LoadData;
  frmDetail_Mod29.Init_UI;
  frmDetail_Mod29.Show;
end;

procedure TfrmMain_Mod30OrderAuth.mniOldPriceClick(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  if cdsDetail71.FieldByName('INVT_PTR').AsInteger = 0 then
  begin
    ShowMessage('请先选择材料！');
    Exit;
  end;
  try
    LFrm.Caption:= '历史价格';
    LFrm.GetData(cdsDetail71.FieldByName('INVT_PTR').AsString,3);     //历史价格
    if LFrm.cds1.IsEmpty then
    begin
      ShowMessage('历史价格为空！');
      Exit;
    end;
    LFrm.InitCds();
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniRemarkClick(Sender: TObject);
var
  LFrm: TfrmNote_Mod29;
  LSql70:string;
begin
  inherited;
  LFrm:= TfrmNote_Mod29.Create(nil);
  try
    LFrm.btnSelect.Visible:= False;
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString,2);
    if LFrm.ShowModal = mrOk then
    begin
      LSql70:= 'SELECT * FROM DATA0070 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString ;
      if not gSvrIntf.IntfGetDataBySql(LSql70,cds1) then Exit;
      if not cds1.IsEmpty then
      begin
        cds1.Edit;
        cds1.FieldByName('Remark2070').Value := Trim(LFrm.mmo1.Text);
        cds1.Post;
      end;

      if gSvrIntf.IntfPostDataByTable('data0070',cds1.Delta) then
      begin
        cds1.MergeChangeLog;
        btnRefreshClick(nil);
      end
      else
      begin
        ShowMessage('修改备注信息失败，请联系管理员！');
        Exit;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniStoreClick(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  if cdsDetail71.FieldByName('INVT_PTR').AsInteger = 0 then
  begin
    ShowMessage('请先选择材料！');
    Exit;
  end;

  try
    LFrm.Caption:= '库存查询';
    LFrm.GetData(cdsDetail71.FieldByName('INVT_PTR').AsString,1);     //库存查询
    if LFrm.cds1.IsEmpty then
    begin
      ShowMessage('没有库存');
      Exit;
    end;
    LFrm.InitCds();
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniSupplierClick(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  try
    LFrm.Caption:= '现有供应商';
    LFrm.GetData(cdsDetail71.FieldByName('INVT_PTR').AsString,5);     //现有供应商
    if LFrm.cds1.IsEmpty then
    begin
      ShowMessage('没有找到供应商');
      Exit;
    end;
    LFrm.InitCds();
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.mniUnAuthClick(Sender: TObject);
var
  LSql70,LSql78:string;
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,30) then Exit;
  LSql70:= 'SELECT * FROM DATA0070 WHERE RKEY = ' + cdsMain.FieldByName('rkey').AsString ;
  LSql78:= 'SELECT * FROM DATA0078 WHERE PO_PTR = ' + cdsMain.FieldByName('rkey').AsString + ' ORDER BY ranking';
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql70,LSql78]),[cds1,cds2]) then Exit;
  if not cds1.IsEmpty then
  begin
    cds1.Edit;
    cds1.FieldByName('EXPIRED_DATE').Value:= gFunc.GetSvrDateTime;      //长日期格式
    cds1.FieldByName('CONFIRMATION_NUMBER').Value:= '';
    if cds1.FieldByName('status').Value = 5 then  cds1.FieldByName('status').Value:= 1 ;   //待审核
    cds1.Post;
  end;
  if not cds2.IsEmpty then
  begin
    if cds2.Locate('user_ptr',cdsMain.FieldByName('user_ptr').AsInteger,[]) then
    begin
      cds2.Edit;
      cds2.FieldByName('auth_flag').Value:='Y';
      cds2.FieldByName('auth_date').AsVariant:= null;
      cds2.Post;
    end;

    cds2.First;
    while not cds2.Eof do
    begin
      if cds2.FieldByName('ranking').AsInteger > cdsMain.FieldByName('ranking').AsInteger then
      begin
        cds2.Edit;
        cds2.FieldByName('auth_flag').Value:='N';
        cds2.Post;
      end;
      cds2.Next;
    end;
  end;

  LData:= VarArrayCreate([0,1],varVariant);
  if cds1.ChangeCount > 0 then LData[0]:= cds1.Delta;
  if cds2.ChangeCount > 0 then LData[1]:= cds2.Delta;
  if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['DATA0070','DATA0078']),LData) then
  begin
    if cds1.ChangeCount > 0 then cds1.MergeChangeLog;
    if cds2.ChangeCount > 0 then cds2.MergeChangeLog;
    ShowMessage('取消审批成功！');
    cdsMain.Edit;
    cdsMain.FieldByName('status').Value:= 1;
    cdsMain.FieldByName('auth_date').AsVariant:= null;
    cdsMain.Post;
  end
  else
  begin
    ShowMessage('取消审批失败，请联系管理员！');
    Exit;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.pmDetail71Popup(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if cdsDetail71.IsEmpty then
  begin
    for i:= 0 to pmDetail71.Items.Count - 1 do
    begin
      pmDetail71.Items[i].Enabled:= False;
    end;
  end;
end;

procedure TfrmMain_Mod30OrderAuth.pmMainPopup(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    for i:= 0 to pmMain.Items.Count - 1 do
    begin
      pmMain.Items[i].Enabled:= False;
    end;
  end;
  mniAuth.Enabled:= cdsMain.FieldByName('status').Value = 1;
  mniUnAuth.Enabled:= cdsMain.FieldByName('status').Value = 5;
  mniBack.Enabled:= cdsMain.FieldByName('status').Value = 1;

end;

procedure TfrmMain_Mod30OrderAuth.rg1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

end.
