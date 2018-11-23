unit qk1005001Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditFrm, RzButton, Vcl.ExtCtrls,
  RzPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, qkFunc.Commfunc,qkSvrIntf.ClientIntf,
  RzTabs, Vcl.ComCtrls, RzTreeVw, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  RzEdit, RzDBEdit, Vcl.Mask, RzLabel, RzDBLbl, DBCtrlsEh, RzRadGrp, RzDBRGrp,
  Vcl.Menus, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, RzShellDialogs, RzRadChk, RzBtnEdt;

type
  Tfrmqk1005001Edit = class(Tfrmqkbaseedit)
    mtCustomer: TFDMemTable;
    tv1: TRzTreeView;
    pnl1: TPanel;
    pgc1: TPageControl;
    tsBaseInfo: TTabSheet;
    tsTabSheet2: TTabSheet;
    tsTabSheet3: TTabSheet;
    tsTabSheet4: TTabSheet;
    tsTabSheet5: TTabSheet;
    tsTabSheet6: TTabSheet;
    tsTabSheet7: TTabSheet;
    tsTabSheet8: TTabSheet;
    lbl2: TRZLabel;
    lbl3: TRZLabel;
    lbl4: TRZLabel;
    lbl5: TRZLabel;
    lbl6: TRZLabel;
    lbl7: TRZLabel;
    lbl8: TRZLabel;
    lbl9: TRZLabel;
    lbl10: TRZLabel;
    lbl11: TRZLabel;
    lbl12: TRZLabel;
    lbl13: TRZLabel;
    lbl14: TRZLabel;
    dbedtCUSTOMER_NAME: TRZDBEdit;
    edts: TRzDBEdit;
    dbedtSTATE: TRZDBEdit;
    dbedtPHONE: TRZDBEdit;
    dbedtTELEX: TRZDBEdit;
    dbedtGEN_EMAIL_ADDRESS: TRZDBEdit;
    dbedtZIP: TRZDBEdit;
    dbedtFAX: TRZDBEdit;
    dbmmoBILLING_ADDRESS_1: TDBMemo;
    edtCUSTOMER_NAME_EN: TRzDBEdit;
    dbchkEDI_IN_LOGGING: TDBCheckBox;
    dbedtBILLING_ADDRESS_2: TRZDBEdit;
    dbedtANALYSIS_CODE4: TRZDBEdit;
    dbedtANALYSIS_CODE5: TRZDBEdit;
    lbl15: TRZLabel;
    lbl16: TRZLabel;
    lbl17: TRZLabel;
    bvl1: TBevel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    dbrgrpCUSTOMER_TYPE: TRZDBRadioGroup;
    edtPeopIDCode: TRzDBEdit;
    lblpeop_ChsName: TRzDBLabel;
    edtPeopIDCode1: TRzDBEdit;
    lblpeop_ChsName1: TRzDBLabel;
    edtReg_Code: TRzDBEdit;
    lblReg_Name: TRzDBLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    bvl2: TBevel;
    dbedtEDI_ID: TDBEdit;
    dbedtBILLING_ADDRESS_3: TDBEdit;
    dbedtOUTGOING_FORM_ADDR2: TDBEdit;
    dbedtOUTGOING_FORM_ADDR3: TDBEdit;
    dbedtOUTGOING_FORM_ADDR1: TDBEdit;
    dbedtSMOOTHING_THRESHOLD: TDBEdit;
    dbedtCAPITAL: TDBEdit;
    dbedtMONTH_AMOUNT: TDBEdit;
    dbedtMONTH_PCBAMOUNT: TDBEdit;
    dbedtFIXED_SCOPE: TDBEdit;
    dbedtOUTGOING_FORM_NAME: TDBEdit;
    dbedtSALES_DISCOUNT: TDBEdit;
    dbcbbHOUSE_FIXED: TDBComboBox;
    dbchkEDI_FLAG_FOR_SOACK: TDBCheckBox;
    dbedtEDI_FLAG_CREDIT_MEMO: TDBEdit;
    edtCUST_ENT_DATE: TDBDateTimeEditEh;
    edtLAST_ACTIVE_DATE: TDBDateTimeEditEh;
    dbchkDO_SMOOTHING: TDBCheckBox;
    dbchkCONSUME_FORECASTS: TDBCheckBox;
    dbrgrpLANGUAGE_FLAG: TRZDBRadioGroup;
    dbchkquote_flag: TDBCheckBox;
    grp1: TRZGroupBox;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    lbl50: TLabel;
    dbedtFED_TAX_ID_NO: TDBEdit;
    dbedtDISCOUNT_PCT: TDBEdit;
    dbedtDISCOUNT_DAYS: TDBEdit;
    dbedtNET_PAY: TDBEdit;
    dbedtINVOICE_NOTE_PAD_PTR: TDBEdit;
    dbedtCREDIT_LIMIT: TDBEdit;
    dbedtquote_factor: TDBEdit;
    cbx1: TComboBox;
    dbchkCOD_FLAG: TDBCheckBox;
    edt1: TEdit;
    btn4: TBitBtn;
    dbrgrpREG_TAX_FIXED_UNUSED: TRZDBRadioGroup;
    dbchkEDI_FLAG_FOR_INVOICE: TDBCheckBox;
    dbchkCOFC_FILENAME: TDBCheckBox;
    dbchkQUOTE_FACTOR1: TDBCheckBox;
    dbcbbINVOICE_TYPE: TDBComboBox;
    dbedtHIGH_BALANCE: TDBEdit;
    dbedtBALANCE_DUE: TDBEdit;
    grp2: TRZGroupBox;
    lbl51: TLabel;
    lbl52: TLabel;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl62: TLabel;
    lbl63: TLabel;
    lbl64: TLabel;
    dbedtREP_EVAL: TDBEdit;
    dbedtMAK_EVAL: TDBEdit;
    dbedtFIN_EVAL: TDBEdit;
    dbedtMARMANG_EVAL: TDBEdit;
    dbedtREP_CREDIT: TDBEdit;
    dbedtMAK_CREDIT: TDBEdit;
    dbedtFIN_CREDIT: TDBEdit;
    dbedtMARMANG_CREDIT: TDBEdit;
    dbedtREP_HIGH: TDBEdit;
    dbedtMAK_HIGH: TDBEdit;
    dbedtFIN_HIGH: TDBEdit;
    dbedtMARMANG_HIGH: TDBEdit;
    dbedtREP_NAME: TDBEdit;
    dbedtMAK_NAME: TDBEdit;
    dbedtFIN_NAME: TDBEdit;
    dbedtMARMANG_NAME: TDBEdit;
    edtREP_DATE: TDBDateTimeEditEh;
    edtMAK_DATE: TDBDateTimeEditEh;
    edtFIN_DATE: TDBDateTimeEditEh;
    edtMARMANG_DATE: TDBDateTimeEditEh;
    bvl3: TBevel;
    bvl4: TBevel;
    bvl5: TBevel;
    bvl6: TBevel;
    bvl7: TBevel;
    lbl65: TLabel;
    lbl66: TLabel;
    lbl67: TLabel;
    lbl68: TLabel;
    lbl69: TLabel;
    lbl70: TLabel;
    lbl71: TLabel;
    lbl72: TLabel;
    lbl73: TLabel;
    lbl74: TLabel;
    lbl75: TLabel;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl78: TLabel;
    lbl79: TLabel;
    bvl8: TBevel;
    lbl80: TLabel;
    lbl81: TLabel;
    lbl82: TLabel;
    dbedtCONTACT_NAME_1: TDBEdit;
    dbedtCONT_PHONE_1: TDBEdit;
    dbedtEMAIL_FOR_CONTACT1: TDBEdit;
    dbedtEMAIL_FOR_CONTACT2: TDBEdit;
    dbedtCONTACT_NAME_2: TDBEdit;
    dbedtCONT_PHONE_2: TDBEdit;
    dbedtCONTACT_NAME_3: TDBEdit;
    dbedtEMAIL_FOR_CONTACT3: TDBEdit;
    dbedtCONT_PHONE_3: TDBEdit;
    dbedtCONTACT_NAME_4: TDBEdit;
    dbedtEMAIL_FOR_CONTACT4: TDBEdit;
    dbedtCONT_PHONE_4: TDBEdit;
    dbedtCONTACT_NAME_5: TDBEdit;
    dbedtEMAIL_FOR_CONTACT5: TDBEdit;
    dbedtCONT_PHONE_5: TDBEdit;
    dbedtCONTACT_NAME_6: TDBEdit;
    dbedtEMAIL_FOR_CONTACT6: TDBEdit;
    dbedtCONT_PHONE_6: TDBEdit;
    lbl83: TLabel;
    lbl84: TLabel;
    lbl85: TLabel;
    lbl86: TLabel;
    lbl87: TLabel;
    lbl88: TLabel;
    lbl89: TLabel;
    lbl90: TLabel;
    mmo1: TMemo;
    mmo2: TMemo;
    mmo3: TMemo;
    dbedtDAYS_EARLY_SCHEDULE: TDBEdit;
    mmo4: TMemo;
    mmo5: TMemo;
    mmo6: TMemo;
    mtAddress: TFDMemTable;
    dsAddress: TDataSource;
    lbl91: TLabel;
    lbl92: TLabel;
    lbl93: TLabel;
    lbl94: TLabel;
    lbl95: TLabel;
    lbl96: TLabel;
    lbl97: TLabel;
    lbl98: TLabel;
    lbl99: TLabel;
    lbl100: TLabel;
    lbl101: TLabel;
    lbl102: TLabel;
    dbedtSHIP_TO_ADDRESS_1: TDBEdit;
    dbedtSTATE1: TDBEdit;
    dbedtZIP1: TDBEdit;
    dbedtSHIP_TO_CONTACT: TDBEdit;
    dbedtSHIP_TO_PHONE: TDBEdit;
    dbedtSHIP_TO_FAX: TDBEdit;
    dbedtEMAIL_FOR_CONTACT: TDBEdit;
    dbedtSHIP_TO_ADDRESS_2: TDBEdit;
    dbchkLANGUAGE_FLAG: TDBCheckBox;
    dbedtSHIP_SHIPPING_METHOD: TDBEdit;
    dbedtSHIP_LEAD_TIME: TDBEdit;
    dbedtLOCNAME_FOR_FORM: TDBEdit;
    dbedtSHP_ADDR1_FOR_FORM: TDBEdit;
    pmPM1: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    pnl2: TPanel;
    pnl3: TPanel;
    eh1: TDBGridEh;
    mtFiles: TFDMemTable;
    dsFiles: TDataSource;
    btnBtnUpload: TSpeedButton;
    lbl103: TLabel;
    lbl104: TLabel;
    lbl105: TLabel;
    lbl106: TLabel;
    opdg1: TRzOpenDialog;
    edtOrg_FileName: TRzDBEdit;
    mmoBakNote: TRzDBMemo;
    lblCraeteDateTime: TRzDBLabel;
    lblUpdatePerson: TRzDBLabel;
    pm1: TPopupMenu;
    mniOpenFile: TMenuItem;
    mniDeleFiles: TMenuItem;
    tskehuquanxian: TTabSheet;
    eh2: TDBGridEh;
    pnl4: TPanel;
    btnAddRightPerson: TRzButton;
    btn5: TRzButton;
    mtCustomerRights: TFDMemTable;
    dsCustomerRight: TDataSource;
    lbl107: TLabel;
    mtSeed: TFDMemTable;
    dsCustomer: TDataSource;
    cbxManuCode: TRzCheckBox;
    edtCust_Code: TRzDBEdit;
    lbl1: TLabel;
    lbl108: TLabel;
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure btnBtnUploadClick(Sender: TObject);
    procedure mniOpenFileClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniDeleFilesClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnAddRightPersonClick(Sender: TObject);
  private
    { Private declarations }
    FNodeSHDI: TTreeNode;
  public
    { Public declarations }
    function InitEdit(AIdkey: Int64): boolean;
    procedure ReadNew;
  end;

var
  frmqk1005001Edit: Tfrmqk1005001Edit;

implementation

uses
  qkBasePickFrm;

{$R *.dfm}

{ Tfrmqk1005001Edit }

procedure Tfrmqk1005001Edit.btn1Click(Sender: TObject);
var
  LFrm: TfrmqkBasepick;
begin
  inherited;
  LFrm := TfrmqkBasepick.Create(Self);
  try
    if LFrm.InitPick(88880004) then
    begin
      mtCustomer.Edit;
      mtCustomer.FieldByName('SALES_REP_PTR').AsLargeInt := LFrm.RetKey;
      mtCustomer.FieldByName('PeopIDCode').AsString := LFrm.RetDisplay;
      mtCustomer.FieldByName('peop_ChsName').AsString := LFrm.mt1.FieldByName('ChsName').AsString;
      mtCustomer.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqk1005001Edit.btn2Click(Sender: TObject);
var
  LFrm: TfrmqkBasepick;
begin
  inherited;
  LFrm := TfrmqkBasepick.Create(Self);
  try
    if LFrm.InitPick(88880005) then
    begin
      mtCustomer.Edit;
      mtCustomer.FieldByName('COUNTRY_PTR').AsLargeInt := LFrm.RetKey;
      mtCustomer.FieldByName('Reg_Code').AsString := LFrm.RetDisplay;
      mtCustomer.FieldByName('Reg_Name').AsString := LFrm.mt1.FieldByName('Reg_Name').AsString;
      mtCustomer.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqk1005001Edit.btn3Click(Sender: TObject);
var
  LFrm: TfrmqkBasepick;
begin
  inherited;
  LFrm := TfrmqkBasepick.Create(Self);
  try
    if LFrm.InitPick(88880006) then
    begin
      mtCustomer.Edit;
      mtCustomer.FieldByName('CURRENCY_PTR').AsLargeInt := LFrm.RetKey;
      mtCustomer.FieldByName('Curr_Code').AsString := LFrm.RetDisplay;
      mtCustomer.FieldByName('Curr_ChsName').AsString := LFrm.mt1.FieldByName('Curr_ChsName').AsString;
      mtCustomer.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqk1005001Edit.btn5Click(Sender: TObject);
begin
  inherited;
  if not mtCustomerRights.IsEmpty then
  begin
    if qkDialog.DeleConfig then
      mtCustomerRights.Delete;
  end;
end;

procedure Tfrmqk1005001Edit.btnAddRightPersonClick(Sender: TObject);
var
  LFrm: TfrmqkBasepick;
begin
  inherited;
  lfrm := TfrmqkBasepick.Create(Self);
  try
    if LFrm.InitPick(88880004) then
    begin
      mtCustomerRights.Append;
      mtCustomerRights.FieldByName('userIDkey').AsLargeInt := LFrm.RetKey;
      mtCustomerRights.FieldByName('PeopIDCode').AsString := LFrm.RetDisplay;
      mtCustomerRights.FieldByName('ChsName').AsString := LFrm.mt1.FieldByName('ChsName').AsString;
      mtCustomerRights.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqk1005001Edit.btnBtnUploadClick(Sender: TObject);
const
  FTPNAME = 'CustomerFiles';
begin
  inherited;
  if opdg1.Execute then
  begin
    mtFiles.Append;
    mtFiles.FieldByName('Org_FileName').AsString := ExtractFileName(opdg1.FileName) ;
    mtFiles.FieldByName('Ftp_Name').AsString := FTPNAME;
    mtFiles.FieldByName('Ftp_Dir').AsString := '\ERP_3_TIER\Tier3\CustomerFiles\' + mtCustomer.FieldByName('ABBR_Name').AsString;
    mtFiles.FieldByName('Ftp_FileName').AsString := qkCommfunc.CreateIDKey().ToString + ExtractFileName(opdg1.FileName);
    mtFiles.FieldByName('BakNote').AsString := '';
    mtFiles.FieldByName('UpdatePerson').AsString := qkVar.LoginFullName;
    mtFiles.FieldByName('Dele').AsBoolean := False;
    mtFiles.Post;

    if not qkCommfunc.qkUpLoad(FTPNAME,
    mtFiles.FieldByName('Ftp_Dir').AsString,
    mtFiles.FieldByName('Ftp_FileName').AsString,
    opdg1.FileName)
    then
      mtFiles.Delete;
  end;
end;

procedure Tfrmqk1005001Edit.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetCurrIDKey(mtCustomer);
  qkCommfunc.SetFK(mtAddress,mtCustomer.FieldByName('IDKey').AsLargeInt,'customer_ptr');
  qkCommfunc.SetFK(mtFiles,mtCustomer.FieldByName('IDKey').AsLargeInt,'Customer_Ptr');
  qkCommfunc.SetFK(mtCustomerRights,mtCustomer.FieldByName('IDKey').AsLargeInt,'Customer_Ptr');
  //自动编码则更新seed
  if not cbxManuCode.Checked then
  begin
    if not qkDataIntf.GetTableData(mtSeed,'gsys_seed',' seedname=' + QuotedStr('客户编码')) then Exit;
    mtCustomer.Edit;
    mtCustomer.FieldByName('Cust_Code').AsString := qkCommfunc.GetSeed('客户编码');
    mtCustomer.Post;
    mtSeed.Edit;
    mtSeed.FieldByName('seed').AsInteger := mtSeed.FieldByName('seed').AsInteger + 1;
    mtSeed.Post;
  end;

  inherited;
end;

function Tfrmqk1005001Edit.InitEdit(AIdkey: Int64): boolean;
var
  I: Integer;
begin
  Result := False;
  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := AIdkey;
  end;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('12',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    Exit;

  if not qkTmp.CopyDsLstToMT([mtCustomer,mtAddress,mtFiles,mtCustomerRights,mtSeed]) then
    Exit;

  {$REGION '添加装运地址'}
  for I := 0 to tv1.Items.Count - 1 do
  begin
    if (tv1.Items[I].Text = '送货地址') and (tv1.Items[I].Parent = nil) then
    begin
      FNodeSHDI := tv1.Items[I];
      mtAddress.First;
      while not mtAddress.Eof do
      begin
        tv1.Items.AddChild(tv1.Items[I],mtAddress.FieldByName('LOCATION').AsString);
        mtAddress.Next;
      end;
      Break;
    end;
  end;
  {$ENDREGION}


  PostTableArr := 'gSales_Customer;gSales_Customer_ShipAddress;'+
                  'gSales_Customer_Files;gSales_Customer_Rights;' +
                  'gsys_Seed';
  PostDsList.Clear;
  PostDsList.Add(mtCustomer);
  PostDsList.Add(mtAddress);
  PostDsList.Add(mtFiles);
  PostDsList.Add(mtCustomerRights);
  PostDsList.Add(mtSeed);



  pgc1.ActivePageIndex := 0;
  tv1.FullExpand;
  Result := true;
end;

procedure Tfrmqk1005001Edit.mniN1Click(Sender: TObject);
var
  Larr: array of string;
  I: Integer;
begin
  inherited;
  SetLength(Larr,1);
  if InputQuery('输入地址',['送货地址'],larr) then
  begin
    for I := 0 to FNodeSHDI.Count - 1 do
    begin
      if FNodeSHDI.Item[I].Text = Larr[0] then
      begin
        ShowMessage('已经存在地址');
        Exit;
      end;
    end;

    mtAddress.Append;
    mtAddress.FieldByName('LOCATION').AsString := Larr[0];
    mtAddress.Post;

    tv1.Items.AddChild(FNodeSHDI,larr[0]);
  end;

end;

procedure Tfrmqk1005001Edit.mniN2Click(Sender: TObject);
var
  Larr: array of string;
  I: Integer;
begin
  inherited;
  if tv1.Selected = nil then Exit;
  if tv1.Selected.Parent <> FNodeSHDI then
  begin
    ShowMessage('请选中一个地址编辑');
    exit;
  end;

  SetLength(Larr,1);
  if InputQuery('输入地址',['送货地址'],larr) then
  begin
    for I := 0 to FNodeSHDI.Count - 1 do
    begin
      if FNodeSHDI.Item[I].Text = Larr[0] then
      begin
        ShowMessage('已经存在地址');
        Exit;
      end;
    end;

    if mtAddress.Locate('LOCATION',tv1.Selected.Text,[loCaseInsensitive]) then
    begin
      mtAddress.Edit;
      mtAddress.FieldByName('LOCATION').AsString := Larr[0];
      mtAddress.Post;

      tv1.Selected.Text := Larr[0];
    end;
  end;

end;

procedure Tfrmqk1005001Edit.mniN3Click(Sender: TObject);
begin
  inherited;
  if tv1.Selected = nil then Exit;
  if tv1.Selected.Parent <> FNodeSHDI then
  begin
    ShowMessage('请选中一个地址删除');
    exit;
  end;

  if qkDialog.DeleConfig then
  begin
   if mtAddress.Locate('LOCATION',tv1.Selected.Text,[loCaseInsensitive]) then
    begin
      mtAddress.Delete;
    end;
    tv1.Items.Delete(tv1.Selected);
  end;
end;

procedure Tfrmqk1005001Edit.mniDeleFilesClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    mtFiles.Edit;
    mtFiles.FieldByName('Dele').AsBoolean := true;
    mtFiles.Post;
  end;
end;

procedure Tfrmqk1005001Edit.mniOpenFileClick(Sender: TObject);
begin
  inherited;
  if qkCommfunc.qkDownLoad(mtFiles.FieldByName('Ftp_Name').AsString,
  mtFiles.FieldByName('Ftp_Dir').AsString,
  mtFiles.FieldByName('Ftp_FileName').AsString,
  ExtractFilePath(ParamStr(0))+'DownLoad\' + mtFiles.FieldByName('Org_FileName').AsString)
  then
  begin

  end;
end;

procedure Tfrmqk1005001Edit.pm1Popup(Sender: TObject);
begin
  inherited;
  mniOpenFile.Enabled := not mtFiles.IsEmpty;
  mniDeleFiles.Enabled := not mtFiles.IsEmpty;
end;

procedure Tfrmqk1005001Edit.ReadNew;
var
  LCode: string;
begin
  //
  LCode := qkCommfunc.GetSeed('客户编码');
  mtCustomer.Append;
  mtCustomer.FieldByName('Cust_Code').AsString := LCode;
  mtCustomer.Post;
  //添加创建者权限
  mtCustomerRights.Append;
  mtCustomerRights.FieldByName('useridkey').AsLargeInt := qkVar.LoginIDKey;
  mtCustomerRights.Post;
end;

procedure Tfrmqk1005001Edit.tv1Change(Sender: TObject; Node: TTreeNode);
begin
  inherited;

  if Node.Text = '基本信息' then
  begin
    pgc1.ActivePage := tsBaseInfo;
  end;
  if Node.Text = '详细信息' then
  begin
    pgc1.ActivePageIndex := 1;
  end;
  if Node.Text = '财务信息' then
  begin
    pgc1.ActivePageIndex := 2;
  end;
  if Node.Text = '历史信息' then
  begin
    pgc1.ActivePageIndex := 3;
  end;
  if Node.Text = '联系人员' then
  begin
    pgc1.ActivePageIndex := 4;
  end;
  if Node.Text = '计划安排' then
  begin
    pgc1.ActivePageIndex := 5;
  end;
  if Node.Parent <> nil then
  begin
    if Node.Parent.Text = '送货地址' then
    begin
      pgc1.ActivePageIndex := 6;
      mtAddress.Locate('LOCATION',Node.Text,[loCaseInsensitive]);
    end;
  end;
  if Node.Text = '客户文档' then
  begin
    pgc1.ActivePageIndex := 7;
  end;
  if Node.Text = '客户权限' then
  begin
    pgc1.ActivePage := tskehuquanxian;
  end;
end;

end.
