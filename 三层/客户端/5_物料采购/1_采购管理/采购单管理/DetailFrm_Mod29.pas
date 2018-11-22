unit DetailFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, RzRadGrp, RzButton, RzRadChk, Data.DB,
  Datasnap.DBClient, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, RzTabs, RzCmboBx,
  Vcl.ComCtrls, RzDTP, RzDBDTP, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBCmbo, RzDBRGrp, RzDBChk, Vcl.Menus, MiscEx_Mod29, INVTSFrm_Mod29, INVTMFrm_Mod29,
  Data.Win.ADODB, Datasnap.Provider, Vcl.DBCtrls;

type
    Rec = record
      Supplier:string;
      Currency_ptr:Integer;
      WHIndex:Integer;
      RuleIndex:Integer;
      VMI:string;
      VMI_From:Integer;
      InvtType:string;
      SuppName:string;
      ReqNO:string;
      ReqDept:string;
      ReqUser:string;
  end;

type
  TAfterUpdate_Mod29 = procedure (ACds:TClientDataSet) of object;

  TfrmDetail_Mod29 = class(TfrmBaseEdit)
    cds70: TClientDataSet;
    ds70: TDataSource;
    cds71: TClientDataSet;
    ds71: TDataSource;
    cdsLookUp17: TClientDataSet;
    pmDetail71: TPopupMenu;
    mniSAdd: TMenuItem;
    cds200: TClientDataSet;
    tbc: TTabControl;
    pnl5: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    rky1: TRKeyRzBtnEdit;
    rky2: TRKeyRzBtnEdit;
    rky3: TRKeyRzBtnEdit;
    rky4: TRKeyRzBtnEdit;
    rkyReqUser: TRKeyRzBtnEdit;
    rkyType: TRKeyRzBtnEdit;
    rkyAddr: TRKeyRzBtnEdit;
    rky5: TRKeyRzBtnEdit;
    rky6: TRKeyRzBtnEdit;
    rky7: TRKeyRzBtnEdit;
    rky8: TRKeyRzBtnEdit;
    rky9: TRKeyRzBtnEdit;
    rky10: TRKeyRzBtnEdit;
    rky11: TRKeyRzBtnEdit;
    cbxPrePay: TRzCheckBox;
    btnS: TBitBtn;
    btnM: TBitBtn;
    pnl4: TPanel;
    eh71: TDBGridEh;
    pnl3: TPanel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtpkDate: TRzDBDateTimePicker;
    rkyAuthUser: TRKeyRzBtnEdit;
    rkyCurrency: TRKeyRzBtnEdit;
    rkyFactory: TRKeyRzBtnEdit;
    rkyPhone: TRKeyRzBtnEdit;
    rkyPoNumber: TRKeyRzBtnEdit;
    rkyRate: TRKeyRzBtnEdit;
    rkyReqNO: TRKeyRzBtnEdit;
    rkyShipAddr: TRKeyRzBtnEdit;
    rgVMI: TRzRadioGroup;
    cbxVMI: TRzCheckBox;
    rgPO_Rule: TRzRadioGroup;
    cbxContact: TComboBox;
    cds72: TClientDataSet;
    ds72: TDataSource;
    eh72: TDBGridEh;
    pmDetail72: TPopupMenu;
    mniSEdit: TMenuItem;
    mniSDel: TMenuItem;
    mniMAdd: TMenuItem;
    mniMEdit: TMenuItem;
    mniMDel: TMenuItem;
    cds04: TClientDataSet;
    cds15: TClientDataSet;
    cds339: TClientDataSet;
    cds68: TClientDataSet;
    cds69: TClientDataSet;
    cds204: TClientDataSet;
    cds68_2: TClientDataSet;
    cds69_2: TClientDataSet;
    cds204_2: TClientDataSet;
    btnSupplier: TBitBtn;
    mniSCheck: TMenuItem;
    mniMCheck: TMenuItem;
    cds23: TClientDataSet;
    pmJSB: TPopupMenu;
    mniPO: TMenuItem;
    mniREC: TMenuItem;
    mniSSupplier: TMenuItem;
    btnAdd: TBitBtn;
    cds70RKEY: TAutoIncField;
    cds70PO_NUMBER: TStringField;
    cds70CSI_USER_POINTER: TIntegerField;
    cds70EMPLOYEE_POINTER: TIntegerField;
    cds70SUPPLIER_POINTER: TIntegerField;
    cds70SUPP_FAC_ADD_PTR: TIntegerField;
    cds70WAREHOUSE_POINTER: TIntegerField;
    cds70EDIT_BY_EMPL_PTR: TIntegerField;
    cds70STATUS: TSmallintField;
    cds70EXCHANGE_RATE: TFloatField;
    cds70SHIPPING_COST: TFloatField;
    cds70FEDERAL_TAX: TBCDField;
    cds70STATE_TAX: TIntegerField;
    cds70SUB_TOTAL: TFloatField;
    cds70CONFIRMATION_NUMBER: TStringField;
    cds70SHIPPING_METHOD: TStringField;
    cds70PO_DATE: TDateTimeField;
    cds70SUPPIER_CONTACT: TStringField;
    cds70CONTACT_PHONE: TStringField;
    cds70DISCOUNT_AMOUNT: TFloatField;
    cds70DATE_EDITED: TDateTimeField;
    cds70PO_TYPE: TStringField;
    cds70FOB: TStringField;
    cds70MISC_CHARGE: TFloatField;
    cds70PRINT_DATE: TDateTimeField;
    cds70PRINT_TIME: TDateTimeField;
    cds70MULTIPLE_FACTOR: TBCDField;
    cds70CITY_AMOUNT: TBCDField;
    cds70COUNTY_AMOUNT: TBCDField;
    cds70COLLECT_PREPAID: TStringField;
    cds70STATE_SHIP_TAX_FLAG: TStringField;
    cds70STATE_MISC_TAX_FLAG: TStringField;
    cds70STATE_INVT_TAX_FLAG: TStringField;
    cds70CURRENCY_PTR: TIntegerField;
    cds70SECOND_WHSE_PTR: TIntegerField;
    cds70PO_REV_NO: TStringField;
    cds70PAYMENT_TERMS: TSmallintField;
    cds70CASH_DISCOUNT: TBCDField;
    cds70DISCOUNT_DAYS: TSmallintField;
    cds70CASH_DISCOUNT2: TBCDField;
    cds70DISCOUNT2_DAYS: TSmallintField;
    cds70PURCHASE_ORDER_TYPE: TSmallintField;
    cds70EXPIRED_DATE: TDateTimeField;
    cds70ANALYSIS_CODE_1: TStringField;
    cds70ANALYSIS_CODE_2: TStringField;
    cds70ANALYSIS_CODE_3: TStringField;
    cds70ANALYSIS_CODE_4: TStringField;
    cds70ANALYSIS_CODE_5: TStringField;
    cds70SHIPTO_ADDRESS: TStringField;
    cds70PURCHASE_TYPE: TWideStringField;
    cds70Remark70: TMemoField;
    cds70Remark1070: TMemoField;
    cds70Remark2070: TMemoField;
    cds70IDKey: TStringField;
    btnBack: TBitBtn;
    btnB: TBitBtn;
    btnAu: TBitBtn;
    edtAu: TDBEdit;
    btnDE: TBitBtn;
    edtDE: TDBEdit;
    edtShip: TDBEdit;
    btnShip: TBitBtn;
    procedure rkyShipAddrButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniSAddClick(Sender: TObject);
    procedure rkyAuthButtonClick(Sender: TObject);
    procedure cds71CalcFields(DataSet: TDataSet);
//    procedure btnSClick(Sender: TObject);
    procedure rky7KeyPress(Sender: TObject; var Key: Char);
    procedure rky7Exit(Sender: TObject);
    procedure btnMClick(Sender: TObject);
    procedure tbcChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mniSEditClick(Sender: TObject);
    procedure rkyFactoryDataFieldValueChange(AOldValue, ANewValue: Variant);
    procedure cds72CalcFields(DataSet: TDataSet);
    procedure mniMEditClick(Sender: TObject);
    procedure mniSDelClick(Sender: TObject);
    procedure mniMDelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure mniMCheckClick(Sender: TObject);
    procedure mniSCheckClick(Sender: TObject);
    procedure cbxPrePayClick(Sender: TObject);
    procedure btnJiShiBenClick(Sender: TObject);
    procedure mniPOClick(Sender: TObject);
    procedure mniRECClick(Sender: TObject);
    procedure pmDetail71Popup(Sender: TObject);
    procedure pmDetail72Popup(Sender: TObject);
    procedure rkyPoNumberExit(Sender: TObject);
    procedure eh71DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cbxVMIClick(Sender: TObject);
    procedure cbxContactClick(Sender: TObject);
    procedure rgVMIClick(Sender: TObject);
    procedure mniSSupplierClick(Sender: TObject);
    procedure btnBClick(Sender: TObject);
    procedure btnAuClick(Sender: TObject);
    procedure btnDEClick(Sender: TObject);
    procedure btnShipClick(Sender: TObject);
    procedure edtDEExit(Sender: TObject);
    procedure edtShipExit(Sender: TObject);
    procedure edtAuExit(Sender: TObject);
    procedure rkyShipAddrExit(Sender: TObject);
  private
    { Private declarations }
    function Power(x, y : extended) : extended;
    procedure FilterCds();
    procedure Append70(ARec:Rec);
    procedure Append71(AForm:TfrmINVTS_Mod29);
    procedure Append72(AForm:TfrmINVTM_Mod29);
//    procedure LoadMiscEx(AForm:TfrmMiscEx_Mod29);
    procedure AddM(ACom:TObject);
    procedure AddS(ACom:TObject);
    procedure Post0415(ASeed:string);
    function DataChangLog70(ARkey70:string):Boolean;
    procedure Append339(APoPtr,AUserPtr,AType:Integer;ADesc,AFrom,ATo,A71Ptr,A72Ptr,AIDK71,ADIK72:Variant);
    function UnUpdate(ARkey70:string):Boolean;   //反更新68、69、204
    function UpdateS(ARkey70:string):Boolean;   //更新68、69、204
    function UpdateS_Add:Boolean;
    function ChangLogDetail(ARkey70:string):Boolean;
    function CheckEmpty(var APoStr:string;var APoList:TStringList):string;
    function Update23(ARkey:string): Boolean;
    function GetInvtType(ARkey:string):string;

//    procedure Update362();
  public
    { Public declarations }    //AddMod  0表示手工输入   1表示导入
    AddType,AddMod:Integer;     //Detail中71的新增类型   0表示全新新增   1表示编辑状态下新增(带供应商)
    AddINVT,From04:string;    // S表示编码物料  M表示非编码物料     //04控制码
    OpenType:Integer;  //Detail中70的类型 0新增   1编辑  2检查
    FAfterUpdate:TAfterUpdate_Mod29;
    procedure InitField71();
    procedure InitField72();
    procedure GetDataS(ARkey:string);
    procedure GetDataM(ARkey:string);
    procedure LoadData();
    procedure InitApp();
    procedure Init_UI();
    procedure CaleDetailS();
    procedure CaleDetailM();
    procedure CaleTotal();

  end;



var
  frmDetail_Mod29: TfrmDetail_Mod29;

implementation

uses uBaseSinglePickListFrm,uCommFunc,StrUtils, TaxFrm_Mod29, ImportFrm_Mod29,
  SupplierMsgFrm_Mod29, NoteFrm_Mod29, CommFrm_Mod29;

{$R *.dfm}

procedure TfrmDetail_Mod29.btnAuClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(29,3,' WHERE warehouse_ptr = '
          + IntToStr(cds70.FieldByName('WAREHOUSE_POINTER').AsInteger));
    if LFrm.ShowModal= mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('PURCHASE_TYPE').Value:= LFrm.cdsPick.FieldByName('PURCHASE_TYPE').Value;
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.btnBClick(Sender: TObject);
var
  LFrm:TfrmNote_Mod29;
begin
  inherited;
  if cds70.IsEmpty then Exit;
  LFrm:=TfrmNote_Mod29.Create(nil);
  try
    LFrm.Caption:= '采购定单注释 ' + cds70.FieldByName('PO_NUMBER').AsString ;
    LFrm.mmo1.Lines.Add(Trim(cds70.FieldByName('remark2070').AsString));
    if OpenType = 2 then
    begin
      Lfrm.mmo1.Enabled:=False;
      LFrm.btnSelect.Enabled:= False;
      Lfrm.btnS.Enabled:= False;
    end;

    if LFrm.ShowModal = mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('remark2070').Value:= Trim(LFrm.mmo1.Text);
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmDetail_Mod29.btnDEClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(29,4);
    if LFrm.ShowModal= mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('PO_REV_NO').Value:= LFrm.cdsPick.FieldByName('dept_code').Value;
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.btnJiShiBenClick(Sender: TObject);
begin
  inherited;
  if cds70.IsEmpty then Exit;
  pmJSB.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmDetail_Mod29.btnMClick(Sender: TObject);
var
  LFrm: TfrmTax_Mod29;
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  LFrm:= TfrmTax_Mod29.Create(nil);
  LCds:= TClientDataSet.Create(nil);
  try
    LSql:= ' SELECT  dbo.Data0189.state_id  ' + #13+
           ' FROM    dbo.Data0024 INNER JOIN  ' + #13+
           '           dbo.Data0189 ON dbo.Data0024.CITY_TAX_PTR = dbo.Data0189.RKEY ' + #13+
           ' WHERE Data0024.Rkey = ' + cds70.FieldByName('SUPP_FAC_ADD_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(LSql,LCds);
    LFrm.edtTaxCode.Text:= Lcds.FieldByName('state_id').AsString;
    LFrm.edtTax.Text:= cds70.FieldByName('FEDERAL_TAX').AsString;
    LFrm.cbxShip.Checked:= cds70.FieldByName('STATE_SHIP_TAX_FLAG').AsString = 'Y';
    LFrm.cbxM.Checked:= cds70.FieldByName('STATE_MISC_TAX_FLAG').AsString = 'Y';
    if LFrm.ShowModal = mrOk then
    begin
      cds70.Edit;
      if LFrm.cbxShip.Checked then
        cds70.FieldByName('STATE_SHIP_TAX_FLAG').Value := 'Y'
      else
        cds70.FieldByName('STATE_SHIP_TAX_FLAG').Value := 'N';
      if LFrm.cbxM.Checked then
        cds70.FieldByName('STATE_MISC_TAX_FLAG').Value := 'Y'
      else
        cds70.FieldByName('STATE_MISC_TAX_FLAG').Value := 'N';
      cds70.Post;

      Self.CaleTotal;
    end;
  finally
    LFrm.Free;
    LCds.Free;
  end;
end;

procedure TfrmDetail_Mod29.btnSaveClick(Sender: TObject);
var
  LDataPost:OleVariant;
  LErr,LPoStr,LSql:string;
  LCds:TClientDataSet;
  LRecNo,i,j:Integer;
  LPoList:TStringList;
begin
  inherited;
  case OpenType of
    0:     //新增
    begin
      LPoStr:= '';
      LPoList:=TStringList.Create;
      try
        LErr:= CheckEmpty(LPoStr,LPoList);
        if LErr <> '' then
        begin
          ShowMessage(LErr);
          Exit;
        end;
        LSql:= ' SELECT PO_NUMBER FROM DATA0070 WHERE PO_NUMBER IN (' + LPoStr + ') ORDER BY PO_NUMBER';
        LCds:=TClientDataSet.Create(Self);
        try
          if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
          if not LCds.IsEmpty then
          begin
            LRecNo:= cds70.RecNo;
            cds70.DisableControls;
            try
              LCds.First;
//              while not LCds.Eof do       //发现一条就更新所有，不再循环处理
//              begin
                if cds70.Locate('PO_NUMBER',LCds.FieldByName('PO_NUMBER').AsString,[]) then
                begin
        //          LErrStr:= LErrStr + '第' + IntToStr(cds70.RecNo) + '条采购单号重复！' + #13 ;
                  if not MessageDlg('采购订单号重复，是否自动更新所有订单号？'
                        , mtconfirmation,[mbYes,mbNo],0) = mrYes then exit;

                  if From04 = 'Y' then
                  begin
                    LSql:=' SELECT * FROM Data0004 WHERE table_name = ''DATA0070''';
                    if not gSvrIntf.IntfGetDataBySql(LSql,cds04) then exit;
                    while not cds70.Eof do
                    begin
                      cds70.Edit;
                      cds70.FieldByName('PO_NUMBER').Value:= LCds.FieldByName('SEED_VALUE').Value;
                      cds70.Post;
                      Self.Post0415(LCds.FieldByName('SEED_VALUE').AsString);
                      cds70.Next;
                    end;
//                    Break;
                  end
                  else
                  begin
                    LSql:= 'SELECT * FROM DATA0015';
                    if not gSvrIntf.IntfGetDataBySql(LSql,cds15) then Exit;
                    while not cds70.Eof do
                    begin
                      cds15.Locate('rkey',cds70.FieldByName('WAREHOUSE_POINTER').AsInteger,[]);
                      cds70.Edit;
                      if rgPO_Rule.ItemIndex = 0 then
                        cds70.FieldByName('PO_NUMBER').Value:= cds15.FieldByName('purchase_order').Value
                      else
                        cds70.FieldByName('PO_NUMBER').Value:= cds15.FieldByName('o_purchase_order').Value;
                      cds70.Post;
                      Self.Post0415(cds15.FieldByName('purchase_order').AsString);
                      cds70.Next;
                    end;
                  end;
                end;
//                LCds.Next;
//              end;
            finally
              cds70.RecNo:= LRecNo;
              cds70.EnableControls;
            end;
          end;
        finally
          LCds.Free;
        end;
      finally
        LPoList.Free;
      end;

      for i := 0 to LPoList.Count-1 do           //内部重复
        for j := i+1 to LPoList.Count-1 do
          if LPoList[i] = LPoList[j] then
            ShowMessage('第' + IntToStr(i) + '条采购单号与第'  + IntToStr(i) + '条重复！');

      if AddMod = 1 then
      begin

        if not  UpdateS_Add then
        begin
          ShowMessage('更新状态失败,请购状态已改变，可能多人操作！！');
          Exit;
        end;
      end;
    end;
    1:    //编辑
    begin
      cds70.Edit;
      cds70.FieldByName('PRINT_DATE').AsVariant:= null;
      cds70.FieldByName('EDIT_BY_EMPL_PTR').Value:= StrToInt(gVar.rkey05);
      cds70.FieldByName('EMPLOYEE_POINTER').Value:= StrToInt(gVar.rkey05);
//      if Trim(cds70.FieldByName('FOB').Value) = '' then cds70.FieldByName('FOB').AsVariant := null;
      if cds70.FieldByName('STATUS').Value <> 8 then cds70.FieldByName('STATUS').Value := 8;
      cds70.Post;
      if not  Self.DataChangLog70(cds70.FieldByName('rkey').AsString) then   //编辑70时保存修改日志与预算
      begin
        ShowMessage('写入修改日志失败！');
        Exit;
      end;
      if not Self.UnUpdate(cds70.FieldByName('rkey').AsString) then    //反更新69、68、204
      begin
        ShowMessage('反更新状态失败！');
        Exit;
      end;
      if not Self.ChangLogDetail(cds70.FieldByName('rkey').AsString) then  //编辑71/72时保存修改日志
      begin
        ShowMessage('写入明细日志失败');
        Exit;
      end;
      if not  UpdateS(cds70.FieldByName('rkey').AsString) then   //更新69、68、204
      begin
        ShowMessage('更新状态失败');
        Exit;
      end;
      if not Update23(cds70.FieldByName('SUPPLIER_POINTER').AsString) then   //更新供应商信息
      begin
        ShowMessage('更新供应商信息失败！');
        Exit;
      end;

    end;
  end;

//  if cds70.State in [dsEdit,dsInsert] then cds70.Post;
//  if (AddINVT = 'S') and (cds71.State in [dsEdit,dsInsert]) then cds71.Post;
//  if (AddINVT = 'M') and (cds72.State in [dsEdit,dsInsert]) then cds72.Post;
//  if cds200.State in [dsEdit,dsInsert] then cds200.Post;

  LDataPost:= VarArrayCreate([0,13],varVariant);
  if cds70.ChangeCount > 0 then LDataPost[0]:= cds70.Delta;
  if (AddINVT = 'S') then
  begin
    if (cds71.ChangeCount > 0) then LDataPost[1]:= cds71.Delta;
    if (cds68.ChangeCount > 0) then LDataPost[2]:= cds68.Delta;
    if (cds69.ChangeCount > 0) then LDataPost[3]:= cds69.Delta;
//    if cds68_2.ChangeCount > 0 then LDataPost[4]:= cds68_2.Delta;
//    if cds69_2.ChangeCount > 0 then LDataPost[5]:= cds69_2.Delta;
    if cds339.ChangeCount > 0 then LDataPost[11]:= cds339.Delta;
  end;
  if (AddINVT = 'M') then
  begin
    if (cds72.ChangeCount > 0) then LDataPost[6]:= cds72.Delta;
    if (cds68.ChangeCount > 0) then LDataPost[2]:= cds68.Delta;
    if (cds204.ChangeCount > 0) then LDataPost[7]:= cds204.Delta;
//    if cds68_2.ChangeCount > 0 then LDataPost[4]:= cds68_2.Delta;
//    if cds204_2.ChangeCount > 0 then LDataPost[8]:= cds204_2.Delta;
    if cds339.ChangeCount > 0 then LDataPost[12]:= cds339.Delta;
  end;
  if cds04.ChangeCount > 0 then LDataPost[9]:= cds04.Delta;
  if cds15.ChangeCount > 0 then LDataPost[10]:= cds15.Delta;
  if cds23.ChangeCount > 0 then LDataPost[13]:= cds23.Delta;

  //  if cds200.ChangeCount > 0 then  LDataPost[12]:= cds200.Delta;

  if gSvrIntf.IntfPostModData('公共基础',29,LDataPost,0) then
  begin
    if (cds70.ChangeCount > 0) then cds70.MergeChangeLog;
    if (cds71.ChangeCount > 0) then cds71.MergeChangeLog;
    if (cds68.ChangeCount > 0) then cds68.MergeChangeLog;
    if (cds69.ChangeCount > 0) then cds69.MergeChangeLog;
    if (cds68_2.ChangeCount > 0) then cds68_2.MergeChangeLog;
    if (cds69_2.ChangeCount > 0) then cds69_2.MergeChangeLog;
    if (cds72.ChangeCount > 0) then cds72.MergeChangeLog;
    if (cds204.ChangeCount > 0) then cds204.MergeChangeLog;
    if (cds204_2.ChangeCount > 0) then cds204_2.MergeChangeLog;
    if cds04.ChangeCount > 0 then cds04.MergeChangeLog;
    if cds15.ChangeCount > 0 then cds15.MergeChangeLog;
    if cds339.ChangeCount > 0 then cds339.MergeChangeLog;
    if cds23.ChangeCount > 0 then cds23.MergeChangeLog;
    ShowMessage('保存成功');
    if Assigned(FAfterUpdate) then
      FAfterUpdate(nil);
    Close;
  end;
end;

procedure TfrmDetail_Mod29.btnShipClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(29,5);
    if LFrm.ShowModal= mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('SHIPPING_METHOD').Value:= LFrm.cdsPick.FieldByName('description').Value;
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.btnSupplierClick(Sender: TObject);
var
  LFrm:TfrmSupplierMsg_Mod29;
begin
  inherited;
  LFrm:= TfrmSupplierMsg_Mod29.Create(self);
  try
    LFrm.GetData(cds70.FieldByName('SUPPLIER_POINTER').AsString);
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

{$REGION '取消了杂项费用'}
//procedure TfrmDetail_Mod29.btnSClick(Sender: TObject);
//var
//  LFrm:TfrmMiscEx_Mod29;
//  i:Integer;
//begin
//  inherited;
//  LFrm:= TfrmMiscEx_Mod29.Create(nil);
//  try
//    LFrm.Init_UI;
//    cds200.Filtered:=False;
//    cds200.Filter:= 'D70_IDKey = ' + cds70.FieldByName('IDKey').AsString;
//    cds200.Filtered:=True;
//    LoadMiscEx(LFrm);
//    if LFrm.ShowModal = mrOk then
//    begin
//      for I := 1 to LFrm.sgM.RowCount-1 do
//      begin
//        if not cds200.IsEmpty  then
//        begin
//          cds200.Edit;
//          cds200.FieldByName('MISC_CHARGE_PTR').AsString:= LFrm.sgM.Cells[4,i];
//          cds200.FieldByName('AMOUNT').AsString:= LFrm.sgM.Cells[3,i];
//          cds200.FieldByName('POPTR').AsString:= cds70.FieldByName('rkey').AsString;
//          cds200.Post;
//        end else
//        begin
//          cds200.Append;
//          cds200.FieldByName('MISC_CHARGE_PTR').AsString:= LFrm.sgM.Cells[4,i];
//          cds200.FieldByName('AMOUNT').AsString:= LFrm.sgM.Cells[3,i];
//          cds200.FieldByName('D70_IDKey').AsString:= cds70.FieldByName('IDKey').AsString;
//          cds200.Post;
//        end;
//        cds70.Edit;
//        cds70.FieldByName('MISC_CHARGE').Value:= cds70.FieldByName('MISC_CHARGE').Value + StrToFloat(LFrm.sgM.Cells[3,i]);
//        cds70.Post;
//      end;
//      Self.CaleTotal;         //计算总计费用
//    end;
//  finally
//    LFrm.Free;
//  end;
//end;

{$ENDREGION}

procedure TfrmDetail_Mod29.CaleDetailM;
var
  LTaxPrice,LTax:Double;
begin
  LTaxPrice:=0;
  LTax:=0;
  cds72.Filtered:=False;
  cds72.Filter:= 'D70_IDKey = ' + QuotedStr(cds70.FieldByName('IDKey').AsString);
  cds72.Filtered:=True;
  cds72.First;
  while not cds72.Eof do
  begin
    LTaxPrice:= LTaxPrice + StrToFloat(FormatFloat('0.00',
        StrToFloat(Ifthen(cds72.FieldByName('tax_price').IsNull,'0',cds72.FieldByName('tax_price').AsString)) *
        StrToFloat(Ifthen(cds72.FieldByName('QUAN_ORD').IsNull,'0',cds72.FieldByName('QUAN_ORD').AsString))));     //含税总计71所有记录
    LTax:= LTax + cds72.FieldByName('Price_Total_C').Value -  StrToFloat(FormatFloat('0.00',
        StrToFloat(Ifthen(cds72.FieldByName('UNIT_PRICE').IsNull,'0',cds72.FieldByName('UNIT_PRICE').AsString)) *
        StrToFloat(Ifthen(cds72.FieldByName('QUAN_ORD').IsNull,'0',cds72.FieldByName('QUAN_ORD').AsString))));     //税金总计
     cds72.Next;
  end;
  rky10.Text:= FormatFloat('0.00',LTaxPrice);
  rky11.Text:= FormatFloat('0.00',LTax);
end;

procedure TfrmDetail_Mod29.CaleDetailS();
var
  LTaxPrice,LTax:Double;
begin
  LTaxPrice:=0;
  LTax:=0;
//  cds71.Filter:= 'D70_IDKey = ' + cds70.FieldByName('IDKey').AsString;
  cds71.First;
  while not cds71.Eof do
  begin
    LTaxPrice:= LTaxPrice + StrToFloat(FormatFloat('0.00',
        StrToFloat(Ifthen(cds71.FieldByName('tax_price').IsNull,'0',cds71.FieldByName('tax_price').AsString)) *
        StrToFloat(Ifthen(cds71.FieldByName('QUAN_ORD').IsNull,'0',cds71.FieldByName('QUAN_ORD').AsString))));     //含税总计71所有记录
    LTax:= LTax + cds71.FieldByName('Price_Total_C').Value -  StrToFloat(FormatFloat('0.00',
        StrToFloat(Ifthen(cds71.FieldByName('PRICE').IsNull,'0',cds71.FieldByName('PRICE').AsString)) *
        StrToFloat(Ifthen(cds71.FieldByName('QUAN_ORD').IsNull,'0',cds71.FieldByName('QUAN_ORD').AsString))));     //税金总计
     cds71.Next;
  end;
  rky10.Text:= FormatFloat('0.00',LTaxPrice);
  rky11.Text:= FormatFloat('0.00',LTax);
end;

procedure TfrmDetail_Mod29.CaleTotal;
var
  LShipHasTax:Double;
begin
  LShipHasTax:=0;
//  LMiscHasTax:=0;
//  if cds70.FieldByName('STATE_MISC_TAX_FLAG').AsString = 'Y' then
//  begin
//    cds200.First;
//    while not cds200.Eof do
//    begin
//      if cds200.FieldByName('TAXABLE').AsString = 'Y' then
//        LMiscHasTax:= LMiscHasTax + cds200.FieldByName('AMOUNT').Value;
//      cds200.Next;
//    end;
//  end;
  if cds70.FieldByName('STATE_SHIP_TAX_FLAG').AsString = 'Y' then
    LShipHasTax:= StrToFloat(rky7.Text) * cds70.FieldByName('FEDERAL_TAX').Value * 0.01;
  rky8.Text:= FormatFloat('0.00',LShipHasTax);

  cds70.Edit;
  cds70.FieldByName('SUB_TOTAL').AsString:= FormatFloat('0.00',
                                            cds70.FieldByName('SHIPPING_COST').Value +
                                            StrToFloat(rky8.Text) + StrToFloat(rky10.Text));
  cds70.Post;
end;

procedure TfrmDetail_Mod29.cbxContactClick(Sender: TObject);
begin
  inherited;
  cds70.Edit;
  cds70.FieldByName('SUPPIER_CONTACT').Value:= Trim(cbxContact.Text);
  cds70.Post;
end;

procedure TfrmDetail_Mod29.cbxPrePayClick(Sender: TObject);
begin
  inherited;
  rky1.Enabled:=not cbxPrePay.Checked;
  rky2.Enabled:=not cbxPrePay.Checked;
  rky3.Enabled:=not cbxPrePay.Checked;
  cds70.Edit;
  if cbxPrePay.Checked then cds70.FieldByName('COLLECT_PREPAID').Value:= 'P'
  else cds70.FieldByName('COLLECT_PREPAID').Value:= 'C';
  cds70.Post;
end;

procedure TfrmDetail_Mod29.cbxVMIClick(Sender: TObject);
begin
  inherited;
  rgVMI.Enabled:= cbxVMI.Checked;
  cds70.Edit;
  if cbxVMI.Checked then
    cds70.FieldByName('STATE_INVT_TAX_FLAG').Value:= 'Y'
  else
  cds70.FieldByName('STATE_INVT_TAX_FLAG').Value:= 'N';
  cds70.Post;
end;

procedure TfrmDetail_Mod29.cds71CalcFields(DataSet: TDataSet);
begin
  inherited;
  if cds71.FieldByName('tax_price').IsNull or cds71.FieldByName('QUAN_ORD').IsNull
      or cds71.FieldByName('PRICE').IsNull  then  Exit;

  cds71.FieldByName('Price_Total_C').Value:= StrToFloat(FormatFloat('0.00',
    StrToFloat(Ifthen(cds71.FieldByName('tax_price').IsNull,'0',cds71.FieldByName('tax_price').AsString)) *
      StrToFloat(Ifthen(cds71.FieldByName('QUAN_ORD').IsNull,'0',cds71.FieldByName('QUAN_ORD').AsString))));    //含税总价

  cds71.FieldByName('TAX_C').Value:= StrToFloat(FormatFloat('0.00',cds71.FieldByName('Price_Total_C').Value -
        StrToFloat(Ifthen(cds71.FieldByName('PRICE').IsNull,'0',cds71.FieldByName('PRICE').AsString)) *
      StrToFloat(Ifthen(cds71.FieldByName('QUAN_ORD').IsNull,'0',cds71.FieldByName('QUAN_ORD').AsString))));
end;

procedure TfrmDetail_Mod29.cds72CalcFields(DataSet: TDataSet);
begin
  inherited;
  if cds72.FieldByName('tax_price').IsNull or cds72.FieldByName('QUAN_ORD').IsNull
      or cds72.FieldByName('UNIT_PRICE').IsNull  then  Exit;

  cds72.FieldByName('Price_Total_C').Value:= StrToFloat(FormatFloat('0.00',
    StrToFloat(Ifthen(cds72.FieldByName('tax_price').IsNull,'0',cds72.FieldByName('tax_price').AsString)) *
      StrToFloat(Ifthen(cds72.FieldByName('QUAN_ORD').IsNull,'0',cds72.FieldByName('QUAN_ORD').AsString))));    //含税总价

  cds72.FieldByName('TAX_C').Value:= StrToFloat(FormatFloat('0.00',cds72.FieldByName('Price_Total_C').Value -
        StrToFloat(Ifthen(cds72.FieldByName('UNIT_PRICE').IsNull,'0',cds72.FieldByName('UNIT_PRICE').AsString)) *
      StrToFloat(Ifthen(cds72.FieldByName('QUAN_ORD').IsNull,'0',cds72.FieldByName('QUAN_ORD').AsString))));
end;

function TfrmDetail_Mod29.ChangLogDetail(ARkey70: string):Boolean;
var
  LCds:TClientDataSet;
  LSql:string;
begin
  Result:= False;
  LCds:= TClientDataSet.Create(Self);
  try
    if AddINVT = 'S' then
    begin
      LSql:= 'SELECT * FROM DATA0071   '+#13+
             ' WHERE PO_PTR = ' + ARkey70 ;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then  Exit;
      LCds.First;
      cds71.First;
      while not cds71.Eof do
      begin
        if LCds.Locate('rkey',cds71.FieldByName('rkey').Value,[loPartialKey]) then
        begin
          if LCds.FieldByName('REQ_DATE').Value <> cds71.FieldByName('REQ_DATE').Value then
          begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,1
                ,'采购项目要求到货日期已改',LCds.FieldByName('REQ_DATE').AsString
                ,cds71.FieldByName('REQ_DATE').AsString,cds71.FieldByName('rkey').AsString,null,null,null);
          end;
          if LCds.FieldByName('QUAN_ORD').Value <> cds71.FieldByName('QUAN_ORD').Value then
          begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,2
                ,'采购项目订购数量已改',LCds.FieldByName('QUAN_ORD').AsString
                ,cds71.FieldByName('QUAN_ORD').AsString,cds71.FieldByName('rkey').AsString,null,null,null);
          end;
          if LCds.FieldByName('PRICE').Value <> cds71.FieldByName('PRICE').Value then
          begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,3
                ,'采购项目单价已改',LCds.FieldByName('PRICE').AsString
                ,cds71.FieldByName('PRICE').AsString,cds71.FieldByName('rkey').AsString,null,null,null);
          end;
        end
        else
        begin       //71rkey怎么填？
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,6
                ,'插入一个标准采购项目',null,null,null,null
                ,cds71.FieldByName('IDKey').AsString,null);
        end;
        cds71.Next;
      end;

      LCds.First;
      cds71.First;
      while not LCds.Eof do
      begin
        if not cds71.Locate('rkey',LCds.FieldByName('rkey').Value,[loPartialKey]) then
        begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,7
                ,'删除一个标准采购项目',null,null,cds71.FieldByName('rkey').AsString,null,null,null);
        end;
        LCds.Next;
      end;
    end
    else
    begin
      LSql:= 'SELECT * FROM DATA0072  '+#13+
             ' WHERE POPTR = ' + ARkey70 ;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then  Exit;
      LCds.First;
      cds72.First;
      while not cds72.Eof do
      begin
        if LCds.Locate('rkey',cds72.FieldByName('rkey').Value,[loPartialKey]) then
        begin
          if LCds.FieldByName('DEL_DATE').Value <> cds72.FieldByName('DEL_DATE').Value then
          begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,1
                ,'杂项采购条目要求到货日期已改',LCds.FieldByName('DEL_DATE').AsString
                ,cds72.FieldByName('DEL_DATE').AsString,null,cds72.FieldByName('rkey').AsString
                ,null,null);
          end;
          if LCds.FieldByName('QUAN_ORD').Value <> cds72.FieldByName('QUAN_ORD').Value then
          begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,2
                ,'杂项采购项目订购数量已改',LCds.FieldByName('QUAN_ORD').AsString
                ,cds72.FieldByName('QUAN_ORD').AsString,null,cds72.FieldByName('rkey').AsString
                ,null,null);
          end;
          if LCds.FieldByName('UNIT_PRICE').Value <> cds72.FieldByName('UNIT_PRICE').Value then
          begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,3
                ,'杂项采购项目单价已改',LCds.FieldByName('UNIT_PRICE').AsString
                ,cds72.FieldByName('UNIT_PRICE').AsString,null,cds72.FieldByName('rkey').AsString
                ,null,null);
          end;
        end
        else
        begin       //71rkey怎么填？
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,6
                ,'插入一个杂项采购项目',null,null,null,null
                ,null,cds72.FieldByName('IDKey').AsString);
        end;
        cds72.Next;
      end;

      LCds.First;
      cds72.First;
      while not LCds.Eof do
      begin
        if not cds72.Locate('rkey',LCds.FieldByName('rkey').Value,[loPartialKey]) then
        begin
            Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,7
                ,'删除一个杂项采购项目',null,null,cds72.FieldByName('rkey').AsString,null,null,null);
        end;
        LCds.Next;
      end;
    end;
    Result:= True;
  finally
    LCds.Free;
  end;
end;

function TfrmDetail_Mod29.CheckEmpty(var APoStr:string;var APoList:TStringList):string;
var
  LErrStr:string;
//  LCds:TClientDataSet;
  LBk:TBookmark;
begin
  Result:= '';
  LErrStr:='';
//  LCds:=TClientDataSet.Create(Self);
  LBk:= cds70.GetBookmark();
  cds70.DisableControls;
  try
    cds70.First;
    while not cds70.Eof do
    begin
      APoStr:= QuotedStr(cds70.FieldByName('PO_NUMBER').AsString) + ',' + APoStr;
      if cds70.FieldByName('PURCHASE_TYPE').AsString = '' then
        LErrStr:= LErrStr + '第' + IntToStr(cds70.RecNo) + '条采购订单审批类型不能为空！' + #13 ;
      if cds70.FieldByName('PO_NUMBER').AsString = '' then
        LErrStr:= LErrStr + '第' + IntToStr(cds70.RecNo) + '条采购定单号码不能为空！' + #13 ;
      if cds70.FieldByName('SHIPPING_METHOD').AsString = '' then
        LErrStr:= LErrStr + '第' + IntToStr(cds70.RecNo) + '条采购订单装运方法不能为空！' + #13 ;

      APoList.Add(cds70.FieldByName('PO_NUMBER').AsString);
      cds70.Next;
    end;
    APoStr:= Copy(APoStr,1,Length(APoStr)-1);
//    LSql:= ' SELECT PO_NUMBER FROM DATA0070 WHERE PO_NUMBER IN (' + LPoNum + ')';
//    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
//    if not LCds.IsEmpty then
//    begin
//      LCds.First;
//      while not LCds.Eof do
//      begin
//        if cds70.Locate('PO_NUMBER',LCds.FieldByName('PO_NUMBER').AsString,[]) then
//        begin
////          LErrStr:= LErrStr + '第' + IntToStr(cds70.RecNo) + '条采购单号重复！' + #13 ;
//          if MessageDlg('采购订单号重复，是否自动更新订单号？'
//                , mtconfirmation,[mbYes,mbNo],0) = mrNo then
//          begin
//
//          end;
//        end;
//        LCds.Next;
//      end;
//    end;
//
//    for i := 0 to LPoList.Count-1 do           //内部重复
//      for j := i+1 to LPoList.Count-1 do
//        if LPoList[i] = LPoList[j] then
//          LErrStr:= LErrStr + '第' + IntToStr(i) + '条采购单号与第'  + IntToStr(i) + '条重复！';

    if LErrStr <> '' then Result:= LErrStr;
  finally
    cds70.GotoBookmark(LBk);
    cds70.EnableControls;
//    LCds.Free;
  end;
end;

function TfrmDetail_Mod29.DataChangLog70(ARkey70:string):Boolean;
var
  LCds,LCds68:TClientDataSet;
  LSql:string;
begin
  Result:= False;
  LCds:= TClientDataSet.Create(Self);
  LCds68:=TClientDataSet.Create(Self);
  try
    LSql:= 'SELECT * FROM DATA0070 WHERE RKEY = ' + ARkey70 ;
//    LSql68:= cds362.CommandText + ' WHERE data0068.PO_REQ_NUMBER= '
//                      + QuotedStr(cds70.FieldByName('FOB').AsString);
//    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql68]),[LCds,LCds68]) then Exit;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;

    if LCds.FieldByName('PAYMENT_TERMS').Value <> cds70.FieldByName('PAYMENT_TERMS').Value then
    begin
      Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,4
          ,'付款条件净付款天数已改',LCds.FieldByName('PAYMENT_TERMS').AsString
          ,cds70.FieldByName('PAYMENT_TERMS').AsString,null,null,null,null);
    end;
    if LCds.FieldByName('SUPP_FAC_ADD_PTR').Value <> cds70.FieldByName('SUPP_FAC_ADD_PTR').Value then
    begin
      Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,5
          ,'装运地点已改',LCds.FieldByName('SUPP_FAC_ADD_PTR').AsString
          ,cds70.FieldByName('SUPP_FAC_ADD_PTR').AsString,null,null,null,null);
    end;
    if LCds.FieldByName('shipping_cost').Value <> cds70.FieldByName('shipping_cost').Value then
    begin
      Append339(StrToInt(ARkey70),cds70.FieldByName('EDIT_BY_EMPL_PTR').AsInteger,9
          ,'装运费用已改',LCds.FieldByName('shipping_cost').AsString
          ,cds70.FieldByName('shipping_cost').AsString,null,null,null,null);
    end;
//    if LCds.FieldByName('sub_total').Value <> cds70.FieldByName('sub_total').Value then
//    begin
//      if not LCds68.IsEmpty then
//      begin
//        cds362.Edit;
//        cds362.FieldByName('USED_PERIOD_' + LCds68.FieldByName('v_month').AsString).Value:=
//            StrToFloat(FormatFloat('0.00',
//            cds362.FieldByName('USED_PERIOD_' + LCds68.FieldByName('v_month').AsString).Value)
//            + (LCds.FieldByName('SUB_TOTAL').Value - cds70.FieldByName('SUB_TOTAL').Value)
//            * cds70.FieldByName('EXCHANGE_RATE').Value );
//        cds362.Post;
//      end;
//    end;
    Result:= True;
  finally
    LCds.Free;
    LCds68.Free;
  end;
end;

procedure TfrmDetail_Mod29.edtAuExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if Trim(edtAu.Text) <> '' then
  begin
    LSql:= ' SELECT  distinct  PURCHASE_TYPE FROM data0077    '+#13+
           ' WHERE  PURCHASE_TYPE = ' + QuotedStr(Trim(edtAu.Text));
    LCds:= TClientDataSet.Create(Self);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
      if LCds.IsEmpty then
      begin
        ShowMessage('装运方法不存在，请重新输入');
        edtAu.SetFocus;
        Exit;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmDetail_Mod29.edtDEExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if Trim(edtDE.Text) <> '' then
  begin
    LSql:= ' SELECT rkey,dept_code,dept_name FROM data0034 '+#13+
           ' WHERE ACTIVE_FLAG=0 and (ttype in (4,5) or IS_cost_dept = 1) '+ #13+
           ' AND DEPT_CODE = ' + QuotedStr(Trim(edtDE.Text));
    LCds:= TClientDataSet.Create(Self);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
      if LCds.IsEmpty then
      begin
        ShowMessage('部门代码不存在，请重新输入');
        edtDE.SetFocus;
        Exit;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmDetail_Mod29.edtShipExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if Trim(edtShip.Text) <> '' then
  begin
    LSql:= ' SELECT rkey,code,[description] FROM data0370   '+#13+
           ' WHERE  description = ' + QuotedStr(Trim(edtShip.Text));
    LCds:= TClientDataSet.Create(Self);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
      if LCds.IsEmpty then
      begin
        ShowMessage('装运方法不存在，请重新输入');
        edtShip.SetFocus;
        Exit;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmDetail_Mod29.eh71DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cds71.FieldByName('INVT_PTR').AsInteger <> cdsLookUp17.FieldByName('rkey').AsInteger then
    cdsLookUp17.Locate('rkey',cds71.FieldByName('INVT_PTR').AsInteger,[]);
  if cdsLookUp17.FieldByName('CRITICAL_MATL_FLAG').Value = 1 then
  eh71.Canvas.Font.Color := clRed;
  eh71.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmDetail_Mod29.AddS(ACom: TObject);
var
  LFrm: TfrmINVTS_Mod29;
  LRec:Rec;
  i:Integer;
begin
  LFrm:= TfrmINVTS_Mod29.Create(nil);
  try
    LFrm.Edit_Type:=0;
    LFrm.GetData('0');
    LFrm.LoadFactory;
    LFrm.Append71;
    if ACom is TMenuItem then
    begin
      LFrm.New_Type:=1;     //带供应商
      LFrm.cdsINVT.Edit;
      LFrm.cdsINVT.FieldByName('SUPPLIER_POINTER').value:= cds70.FieldByName('SUPPLIER_POINTER').Value;
      LFrm.cdsINVT.Post;
      LFrm.rgRule.ItemIndex:= rgPO_Rule.ItemIndex;
      for i := 0 to LFrm.cbxFactory.Items.Count-1 do
        if cds70.FieldByName('WAREHOUSE_POINTER').AsInteger =
              Integer(LFrm.cbxFactory.Items.Objects[i]) then
          LFrm.cbxFactory.ItemIndex:= i;
    end
    else
    begin
      LFrm.New_Type:=0;    //全新新增
    end;
    LFrm.Init_UI;
    if LFrm.ShowModal = mrOk then
    begin
      Screen.Cursor:= crHourGlass;
      try
        if LFrm.New_Type = 0 then
        begin
          LRec.Supplier:= LFrm.cdsINVT.FieldByName('SUPPLIER_POINTER').AsString;
          LRec.Currency_ptr:=LFrm.CURRENCY_PTR;
          LRec.WHIndex:=Integer(LFrm.cbxFactory.Items.Objects[LFrm.cbxFactory.ItemIndex]);
          LRec.RuleIndex:=LFrm.rgRule.ItemIndex;
          LRec.VMI:=LFrm.VMI;
          LRec.VMI_From:=LFrm.VMI_VFrom;
          LRec.SuppName:=LFrm.rkySupplier.Text;
          LRec.InvtType:= LFrm.cdsINVT.FieldByName('ANALYSIS_CODE_2').AsString;
          if ( not cds70.IsEmpty) and
                  cds70.Locate('SUPPLIER_POINTER',LFrm.cdsINVT.FieldByName('SUPPLIER_POINTER').Value,[]) then
          begin
            if cds70.FieldByName('SUPPLIER_POINTER').AsString <> LFrm.cdsINVT.FieldByName('SUPPLIER_POINTER').AsString then
            begin
              ShowMessage('同一采购定单中,不能有供应商相同而工厂不同的采购!');
              Exit;
            end;
            if cds70.FieldByName('CURRENCY_PTR').AsInteger <> LFrm.CURRENCY_PTR then
            begin
              ShowMessage('同一采购定单中,不能有货币不同的采购!');
              Exit;
            end;
            Append71(LFrm);    //全新新增有可能选的是已经选过的供应商
          end
          else
          begin
            Append70(LRec);
            Append71(LFrm);
          end;
        end
        else
        begin
          if (cds70.FieldByName('CURRENCY_PTR').AsInteger <> 0) and
             (cds70.FieldByName('CURRENCY_PTR').AsInteger <> LFrm.CURRENCY_PTR) then
          begin
            ShowMessage('同一采购订单中,不能有要求货币不同的采购!');
            exit;
          end;
          Append71(LFrm);
        end;
        eh71.DataSource:= nil;
        eh71.DataSource:= ds71;
        FilterCds;      //过滤71
        CaleDetailS();   //计算含税小计与税金
        CaleTotal;
        tbc.Visible:=True;
        if LFrm.New_Type = 0 then tbc.TabIndex:= tbc.Tabs.Count - 1;
      finally
        Screen.Cursor:= crDefault;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

{$REGION '更改04或15表的PO号'}

procedure TfrmDetail_Mod29.Post0415(ASeed: string);
var
 v_last,new_seed:string;
 i,control_no:word;
begin
  control_no := length(ASeed);
  if Self.From04='Y' then
  begin
    if cds04.FieldByName('SEED_FLAG').Value <> 1 then
    begin
      for i := control_no downto 1 do
      begin
        if (copy(ASeed,i,1)<'0') or (copy(ASeed,i,1)>'9') then  //如果不是数字
        begin
          v_last := floattostr(power(10,control_no-1)+strtofloat(copy(ASeed,i+1,control_no-i))+1); //后缀加1
          new_seed := copy(ASeed,1,i)+copy(v_last,i+1,control_no-i);
          cds04.Edit; //使前缀不变后缀加1
          cds04.FieldByName('SEED_Value').Value := new_seed;
          cds04.Post;
          break;
        end
        else
        if i=1 then //如果第一位仍然是数字
        begin
           v_last := floattostr(power(10,control_no)+strtofloat(ASeed)+1);
           new_seed := copy(v_last,2,control_no);
           cds04.Edit;
           cds04.FieldByName('SEED_Value').Value := new_seed;
           cds04.Post;
        end;
      end;
    end;
  end
  else
  begin
    for i := control_no downto 1 do
    begin
      if (copy(ASeed,i,1)<'0') or (copy(ASeed,i,1)>'9') then
      begin
        v_last := floattostr(100000000000000+strtofloat(copy(ASeed,i+1,control_no-i))+1); //后缀加1
        new_seed := copy(ASeed,1,i)+copy(v_last,15-(control_no-i)+1,control_no-i);
        cds15.edit;
        if cds70.FieldByName('DISCOUNT2_DAYS').Value = 0 then
          cds15.FieldByName('purchase_order').value := new_seed
        else
          cds15.FieldByName('o_purchase_order').value := new_seed;
        cds15.Post;
        break;
      end
      else
      if i=1 then //如果第一位仍然是数字
      begin
        v_last := floattostr(1000000000000000+strtofloat(ASeed)+1);
        new_seed := copy(v_last,16-control_no+1,control_no);
        cds15.edit;
        if cds70.FieldByName('DISCOUNT2_DAYS').Value = 0 then
         cds15.FieldByName('purchase_order').value := new_seed
        else
         cds15.FieldByName('o_purchase_order').value := new_seed;
        cds15.Post;
      end;
    end;
  end;
end;

function TfrmDetail_Mod29.Power(x, y: extended): extended;
begin
  result := exp(y*ln(x));
end;

{$ENDREGION}

procedure TfrmDetail_Mod29.Append339(APoPtr, AUserPtr, AType: Integer; ADesc,
  AFrom, ATo, A71Ptr, A72Ptr,AIDK71,ADIK72: Variant);
begin
  cds339.Append;
  cds339.FieldByName('po_ptr').Value:= APoPtr;
  cds339.FieldByName('EDITED_BY_PTR').Value:= AUserPtr;
  cds339.FieldByName('tran_type').Value:= AType;
  cds339.FieldByName('TRAN_DESCRIPTION').Value:= ADesc;
  cds339.FieldByName('tran_from').Value:= AFrom;
  cds339.FieldByName('tran_to').Value:= ATo;
  cds339.FieldByName('data0071_ptr').AsVariant:= A71Ptr;
  cds339.FieldByName('data0072_ptr').AsVariant:= A72Ptr;
  cds339.FieldByName('D71_IDKey').AsVariant:= AIDK71;
  cds339.FieldByName('D72_IDKey').AsVariant:= ADIK72;
  cds339.Post;
end;

procedure TfrmDetail_Mod29.Append70(ARec:Rec);
var
  LSql23,LSql24,LSql01:string;
  LCds23,LCds24,LCds01:TClientDataSet;
  i:Integer;
begin
  LCds23:= TClientDataSet.Create(nil);
  LCds24:= TClientDataSet.Create(nil);
  LCds01:= TClientDataSet.Create(nil);

  try
    LSql23:=' SELECT  CONTACT_NAME_1, CONTACT_NAME_2, CONTACT_NAME_3, CONTACT_NAME_4  '+#13+
          '        , CONTACT_NAME_5, CONTACT_NAME_6, PHONE, DISCOUNT, DISCOUNT2   '+#13+
          '              ,DISCOUNT_DAYS, DISCOUNT2_DAYS, PAYMENT_TERMS, TAX_ID_NUMBER   '+#13+
          '              , ANALYSIS_CODE1, ANALYSIS_CODE2, FAX,EDI_OUT_NEW_PO,EDI_FLAG_FOR_PO '+#13+
          '  FROM  dbo.Data0023  '+#13+
          '  WHERE rkey= ' + ARec.Supplier;
    LSql24:=' SELECT  dbo.Data0024.RKEY, dbo.Data0024.SHIPPING_LEAD_TIME, dbo.Data0024.FACTORY_LOCATION  '+#13+
          '      , dbo.Data0024.STATE_MISC_TAX_FLAG,dbo.Data0024.STATE_SHIP_TAX_FLAG '+#13+
          '      , dbo.Data0189.STATE_TAX, dbo.Data0024.SHIPPING_METHOD  '+#13+
          '  FROM    dbo.Data0024 INNER JOIN  '+#13+
          '                        dbo.Data0189 ON dbo.Data0024.CITY_TAX_PTR = dbo.Data0189.RKEY  '+#13+
          '  WHERE Data0024.SUPPLIER_PTR = ' + ARec.Supplier  +#13+
          '  ORDER BY Data0024.rkey ';
    LSql01:= 'SELECT exch_rate,BASE_TO_OTHER FROM DATA0001 WHERE RKEY = '
                    + IntToStr(ARec.Currency_ptr);

    gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql23,LSql24,LSql01]),[LCds23,LCds24,LCds01]);

    cbxContact.Clear;
    for i := 1 to 6 do
      cbxContact.Items.Add(Trim(LCds23.FieldByName('CONTACT_NAME_' + IntToStr(i)).AsString));
    cbxContact.ItemIndex:= cbxContact.Items.IndexOf(Trim(LCds23.FieldByName('CONTACT_NAME_1').AsString));


    cds70.Append;
    if (Self.From04='Y') and (Cds04.FieldByName('SEED_FLAG').Value <> 1) then
        cds70.FieldByName('PO_NUMBER').Value:= Cds04.FieldByName('SEED_VALUE').Value;

    cds15.DisableControls;
    cds15.Locate('rkey',ARec.WHIndex,[]);
    cds15.EnableControls;
    if ARec.RuleIndex = 0 then
    begin
      if Self.From04='N' then
        cds70.FieldByName('PO_NUMBER').Value:= Cds15.FieldByName('purchase_order').Value;
      cds70.FieldByName('SHIPTO_ADDRESS').Value:= Cds15.FieldByName('ADDRESS_LINE_3').Value;
    end
    else
    begin
      if Self.From04='N' then
        cds70.FieldByName('PO_NUMBER').Value:= Cds15.FieldByName('o_purchase_order').Value;
      cds70.FieldByName('SHIPTO_ADDRESS').Value:= Cds15.FieldByName('o_address_3').Value;
    end;

    cds70.FieldByName('CONTACT_PHONE').Value:= LCds23.FieldByName('PHONE').Value + '/' +
                      LCds23.FieldByName('FAX').Value;
    cds70.FieldByName('SUPPIER_CONTACT').Value:= LCds23.FieldByName('CONTACT_NAME_1').Value;
    cds70.FieldByName('PAYMENT_TERMS').Value:= LCds23.FieldByName('payment_terms').Value;   //   净付款天数
    cds70.FieldByName('CASH_DISCOUNT').Value:= LCds23.FieldByName('discount').Value;   //  付款条件
    cds70.FieldByName('CASH_DISCOUNT2').Value:= LCds23.FieldByName('discount2').Value;  //  附加条件
    cds70.FieldByName('DISCOUNT_DAYS').Value:= LCds23.FieldByName('discount_days').Value;   //  付款条件天数
    cds70.FieldByName('ANALYSIS_CODE_3').Value:= LCds23.FieldByName('ANALYSIS_CODE2').Value;    //付款地点
    cds70.FieldByName('ANALYSIS_CODE_4').Value:= LCds23.FieldByName('ANALYSIS_CODE1').Value;  //票据种类
    cds70.FieldByName('ANALYSIS_CODE_5').Value:= LCds23.FieldByName('tax_id_number').Value;   //付款方法

    cds70.FieldByName('SUPP_FAC_ADD_PTR').Value:= LCds24.FieldByName('rkey').Value;  //装运地址
    cds70.FieldByName('FEDERAL_TAX').Value:= LCds24.FieldByName('state_tax').Value;  //增值税
    cds70.FieldByName('STATE_SHIP_TAX_FLAG').Value:= LCds24.FieldByName('STATE_SHIP_TAX_FLAG').Value;  //装运计税
    cds70.FieldByName('STATE_MISC_TAX_FLAG').Value:= LCds24.FieldByName('STATE_MISC_TAX_FLAG').Value;  //杂项计税
    cds70.FieldByName('SHIPPING_METHOD').Value:= LCds24.FieldByName('shipping_method').Value;  //装运方法
    cds70.FieldByName('EXCHANGE_RATE').Value:= LCds01.FieldByName('BASE_TO_OTHER').Value;   //汇率
    cds70.FieldByName('SUPPLIER_POINTER').Value:= ARec.Supplier;
    cds70.FieldByName('WAREHOUSE_POINTER').Value:= ARec.WHIndex;
    cds70.FieldByName('CURRENCY_PTR').Value:= ARec.CURRENCY_PTR;
    if AddINVT = 'S' then
    begin
//      cds70.FieldByName('STATE_INVT_TAX_FLAG').Value:= ARec.VMI;    //是否vmi
//      cds70.FieldByName('SECOND_WHSE_PTR').Value:= ARec.VMI_From;   //vmi价格取值
      if LCds23.FieldByName('EDI_OUT_NEW_PO').Value = 0 then
        cds70.FieldByName('STATE_INVT_TAX_FLAG').Value:= 'N'    //是否vmi
      else
        cds70.FieldByName('STATE_INVT_TAX_FLAG').Value:= 'Y';
      cds70.FieldByName('SECOND_WHSE_PTR').Value:= LCds23.FieldByName('EDI_FLAG_FOR_PO').Value;;   //vmi价格取值
    end;
    cds70.FieldByName('DISCOUNT2_DAYS').Value:= ARec.RuleIndex;   //国内、国外
    cds70.FieldByName('PURCHASE_ORDER_TYPE').Value:= 1;    //新增类型 1表示手工新增  0表示导入
    cds70.FieldByName('COLLECT_PREPAID').Value:= 'C';      //后付款
    cds70.FieldByName('ANALYSIS_CODE_2').Value:= ARec.InvtType;      //物料类别
    if AddMod = 1 then
    begin
      cds70.FieldByName('FOB').Value:= ARec.ReqNO;
      cds70.FieldByName('PO_REV_NO').Value:= ARec.ReqDept;
      cds70.FieldByName('ANALYSIS_CODE_1').Value:= ARec.ReqUser;
      cds70.FieldByName('PURCHASE_ORDER_TYPE').Value:= 0;
    end;
    cds70.FieldByName('EMPLOYEE_POINTER').Value:= gVar.rkey05;
    cds70.FieldByName('STATUS').Value:= 8;
    cds70.FieldByName('PO_DATE').Value:= FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime);
    cds70.FieldByName('SHIPPING_COST').Value:= 0 ;  //装运费
    cds70.FieldByName('MISC_CHARGE').Value:= 0.00 ;    //杂项费
    cds70.FieldByName('PO_TYPE').Value:= AddINVT;   // S/M
    cds70.FieldByName('SUB_TOTAL').Value:= 0.00;   //金额合计
    cds70.FieldByName('DISCOUNT_AMOUNT').Value:= 0;   //价格折扣合计
    cds70.FieldByName('STATE_TAX').Value:= 0;   //审批退回人员不能为空
    cds70.FieldByName('MULTIPLE_FACTOR').Value:= 0;
    cds70.FieldByName('CITY_AMOUNT').Value:= 0;
    cds70.FieldByName('COUNTY_AMOUNT').Value:= 0;
    cds70.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
    cds70.Post;

    if cds70.FieldByName('CURRENCY_PTR').Value = 1 then rkyRate.ReadOnly:=True;
    if AddINVT = 'S' then
    begin
      if cds70.FieldByName('STATE_INVT_TAX_FLAG').Value = 'Y' then cbxVMI.Checked:=True
      else cbxVMI.Checked:=False;
      rgVMI.ItemIndex:= cds70.FieldByName('SECOND_WHSE_PTR').AsInteger;
      rgVMI.Enabled:= cbxVMI.Checked;
    end;
    rgPO_Rule.ItemIndex:=ARec.RuleIndex;

    tbc.Tabs.Add(ARec.SuppName);
    if AddINVT = 'S' then eh71.BringToFront
    else eh72.BringToFront;

    Self.Post0415(cds70.FieldByName('PO_NUMBER').AsString);           //本地提交04、15
  finally
    LCds23.Free;
    LCds24.Free;
    LCds01.Free;
  end;

end;

procedure TfrmDetail_Mod29.Append71(AForm:TfrmINVTS_Mod29);
var
  LField:TField;
  i:Integer;
begin
  if not cdsLookUp17.Locate('rkey',AForm.cdsINVT.FieldByName('INVT_PTR').Value,[]) then
  begin
    cdsLookUp17.FieldByName('rkey').ReadOnly:= False;
    cdsLookUp17.FieldByName('INV_PART_DESCRIPTION').ReadOnly:= False;
    cdsLookUp17.Append;
  //  cdsLookUp17.FieldByName('rkey').Value:=AForm.cdsINVT.FieldByName('INVT_PTR').Value;
  //  cdsLookUp17.FieldByName('INV_PART_NUMBER').Value:= AForm.cdsINVT.FieldByName('INV_PART_NUMBER').Value;
  //  cdsLookUp17.FieldByName('INV_Name').Value:=AForm.cdsINVT.FieldByName('INV_Name').Value;
  //  cdsLookUp17.FieldByName('INV_PART_DESCRIPTION').Value:=AForm.cdsINVT.FieldByName('INV_PART_DESCRIPTION').AsString;
    for LField in cdsLookUp17.Fields do
    begin
      if AForm.cdsINVT.FindField(LField.FieldName) <> nil then
        LField.Value := AForm.cdsINVT.FieldByName(LField.FieldName).Value;
    end;
    cdsLookUp17.FieldByName('rkey').Value:=AForm.cdsINVT.FieldByName('INVT_PTR').Value;
    cdsLookUp17.FieldByName('INV_PART_DESCRIPTION').Value:= AForm.edtDesc.Text;
    cdsLookUp17.Post;
  end;

  for i := 1 to StrToInt(Trim(AForm.edtBatch.Text)) do   //以交货批次与间隔天数来决定循环次数
  begin
    if AForm.Edit_Type = 0 then cds71.Append
    else cds71.Edit;
    for LField in cds71.Fields do
    begin
      if (IndexText(LField.FieldName,['rkey']) <> -1) then Continue;
      if AForm.cdsINVT.FindField(LField.FieldName) <> nil then
        LField.Value:= AForm.cdsINVT.FieldByName(LField.FieldName).Value;
    end;
    if AddType = 1 then
      cds71.FieldByName('PO_PTR').Value:= cds70.FieldByName('rkey').Value;
    cds71.FieldByName('REQ_DATE').Value:= gFunc.StrToDateTime(Trim(AForm.edtDate.Text))+ (i-1) * StrToInt(Trim(AForm.edtDays.text));
    cds71.FieldByName('D70_IDKey').Value := cds70.FieldByName('IDKey').Value;
    cds71.FieldByName('QUAN_RECD').Value := 0;
    cds71.FieldByName('QUAN_IN_INSP').Value := 0;
    cds71.FieldByName('QUAN_RETN').Value := 0;
    cds71.FieldByName('QUAN_INVD').Value := 0;
    cds71.FieldByName('QUAN_REJD').Value := 0;
    cds71.FieldByName('DISCOUNT').Value := 0;
    cds71.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
//    if AForm.cbxIF_Urgency.Checked then cds71.FieldByName('IF_urgency').Value:= True
//    else cds71.FieldByName('IF_urgency').Value:= False;
    cds71.Post;
  end;
end;

procedure TfrmDetail_Mod29.Append72(AForm: TfrmINVTM_Mod29);
var
  i:Integer;
  LField:TField;
begin
  for i := 1 to StrToInt(Trim(AForm.edtBatch.Text)) do   //以交货批次与间隔天数来决定循环次数
  begin
    if AForm.Edit_Type = 0 then cds72.Append
    else cds72.Edit;
    for LField in cds72.Fields do
    begin
      if (IndexText(LField.FieldName,['rkey']) <> -1) then Continue;
      if AForm.cds72.FindField(LField.FieldName) <> nil then
        LField.Value:= AForm.cds72.FieldByName(LField.FieldName).Value;
    end;
    if AddType = 1 then
      cds72.FieldByName('POPTR').Value:= cds70.FieldByName('rkey').Value;
    cds72.FieldByName('DESCRIPTION2').Value:= AForm.cbxType.Text;
    cds72.FieldByName('rohs').Value:= AForm.cbxRoSH.Text;
    cds72.FieldByName('DEL_DATE').Value:= gFunc.StrToDateTime(Trim(AForm.edtDate.Text))+ (i-1) * StrToInt(Trim(AForm.edtDays.text));
    cds72.FieldByName('D70_IDKey').Value := cds70.FieldByName('IDKey').Value;
    cds72.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
//    if AForm.cbxIF_Urgency.Checked then cds71.FieldByName('IF_urgency').Value:= True
//    else cds71.FieldByName('IF_urgency').Value:= False;
    cds72.Post;
  end;
end;

procedure TfrmDetail_Mod29.AddM(ACom:TObject);
var
  LFrm: TfrmINVTM_Mod29;
  i:Integer;
  LRec:Rec;
begin
  LFrm:= TfrmINVTM_Mod29.Create(nil);
  try
    LFrm.Edit_Type:=0;   //0新增 1编辑
    LFrm.Init_Data;
    LFrm.GetData('0');
    LFrm.add72;
    if ACom is TMenuItem then
    begin
      LFrm.New_Type:=1;     //带供应商
      LFrm.cds72.Edit;
      LFrm.cds72.FieldByName('SUPPLIER_POINTER').Value:= cds70.FieldByName('SUPPLIER_POINTER').Value;
      LFrm.cds72.Post;
      for i := 0 to LFrm.cbxFactory.Items.Count-1 do
        if cds70.FieldByName('WAREHOUSE_POINTER').AsInteger =
              Integer(LFrm.cbxFactory.Items.Objects[i]) then
          LFrm.cbxFactory.ItemIndex:= i;
    end
    else
    begin
      LFrm.New_Type:=0;    //全新新增
    end;
    LFrm.Init_UI;
    if LFrm.ShowModal = mrOk then
    begin
      if LFrm.New_Type = 0 then
      begin
        LRec.Supplier:= LFrm.cds72.FieldByName('SUPPLIER_POINTER').AsString;
//        ShowMessage(LFrm.cds72.FieldByName('SUPPLIER_POINTER').AsString);
//        ShowMessage(IntToStr(LFrm.CURRENCY_PTR));
        LRec.Currency_ptr:=LFrm.CURRENCY_PTR;
        LRec.WHIndex:=Integer(LFrm.cbxFactory.Items.Objects[LFrm.cbxFactory.ItemIndex]);
        LRec.RuleIndex:=LFrm.rgRule.ItemIndex;
        LRec.VMI:=LFrm.VMI;
        LRec.VMI_From:=LFrm.VMI_VFrom;
        LRec.SuppName:=LFrm.rkySupplier.Text;
        LRec.InvtType:= LFrm.cbxType.Text;
        if ( not cds70.IsEmpty) and
                cds70.Locate('SUPPLIER_POINTER',LFrm.cds72.FieldByName('SUPPLIER_POINTER').Value,[]) then
        begin
          Append72(LFrm);    //全新新增有可能选的是已经选过的供应商
        end
        else
        begin
          Append70(LRec);
          Append72(LFrm);
        end;
      end
      else
      begin
        Append72(LFrm);
      end;
      eh72.DataSource:= nil;
      eh72.DataSource:= ds72;
      FilterCds();
      CaleDetailM();   //计算含税小计与税金
      CaleTotal;
      tbc.Visible:=True;
      if LFrm.New_Type = 0 then tbc.TabIndex:= tbc.Tabs.Count - 1;
    end
    else Close;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.FilterCds;
begin
  if AddINVT = 'S' then
  begin
    cds71.DisableControls;
    cds71.Filtered:=False;
    cds71.Filter:= 'D70_IDKey = ' + QuotedStr(cds70.FieldByName('IDKey').AsString);
    cds71.Filtered:=True;
    cds71.EnableControls;
  end else
  begin
    cds72.DisableControls;
    cds72.Filtered:=False;
    cds72.Filter:= 'D70_IDKey = ' + QuotedStr(cds70.FieldByName('IDKey').AsString);
    cds72.Filtered:=True;
    cds72.EnableControls;
  end;
end;

procedure TfrmDetail_Mod29.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
  frmDetail_Mod29:=nil;
end;

procedure TfrmDetail_Mod29.GetDataM(ARkey: string);
var
  LSql70,LSql72,LSql04,LSql15,LSql339:string;
begin
  LSql70:='SELECT * FROM DATA0070 WHERE RKEY = ' + ARkey;
  LSql72:='SELECT * FROM DATA0072 WHERE POPTR = ' + ARkey;
  LSql04:= ' SELECT *  FROM data0004  where table_name = ''DATA0070''';
  LSql15:= ' SELECT *  FROM data0015 ';
  LSql339:= ' SELECT * FROM DATA0339 WHERE 1=0 ';
//  LSql200:= ' SELECT RKEY,POPTR,MISC_CHARGE_PTR,AMOUNT FROM DATA0200 WHERE POPTR = ' +
//          ARkey + ' ORDER BY RKEY';

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql70,LSql72,LSql04,LSql15,LSql339])
              ,[cds70,cds72,cds04,cds15,cds339]) then Exit;
  if (not cds70.IsEmpty) and (cds70.FieldByName('IDKey').AsString = '') then
  begin
    cds70.Edit;
    cds70.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
    cds70.Post;
  end;

  cds72.DisableControls;
  try
    if not cds72.IsEmpty then
    begin
      cds72.First;
      while not cds72.Eof do
      begin
        if cds72.FieldByName('D70_IDKey').AsString = '' then
        begin
          cds72.Edit;
          cds72.FieldByName('D70_IDKey').Value:= cds70.FieldByName('IDKey').Value;
          cds72.Post;
        end;
        if cds72.FieldByName('IDKey').AsString = '' then
        begin
          cds72.Edit;
          cds72.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
          cds72.Post;
        end;
        cds72.Next;
      end;
    end;

{$REGION '已取消'}
//    if not cds200.IsEmpty then
//    begin
//      Cds200.First;
//      while not Cds200.Eof do
//      begin
//        if cds200.FieldByName('D70_IDKey').AsString = '' then
//        begin
//          cds200.Edit;
//          cds200.FieldByName('D70_IDKey').AsString:= cds70.FieldByName('IDKey').AsString;
//          cds200.Post;
//        end;
//        Cds200.Next;
//      end;
//    end;
{$ENDREGION}
  finally
    cds72.EnableControls;
  end;
end;

procedure TfrmDetail_Mod29.GetDataS(ARkey:string);
var
  LSql17,LSql70,LSql71:string;
  LSql339,LSql04,LSql15:string;
begin
  LSql17:='SELECT DATA0017.*  ' +
          '  FROM Data0071 INNER JOIN   ' +
          '        Data0017 ON Data0071.INVT_PTR = Data0017.RKEY   ' +
          '  WHERE Data0071.PO_PTR =  ' +  ARkey;
  LSql70:='SELECT * FROM DATA0070 WHERE RKEY = ' + ARkey;
  LSql71:='SELECT * FROM DATA0071 WHERE PO_PTR = ' + ARkey;
  LSql04:= ' SELECT *  FROM data0004  where table_name = ''DATA0070''';
  LSql15:= ' SELECT *  FROM data0015 ';
  LSql339:= ' SELECT * FROM DATA0339 WHERE 1=0 ';
//  LSql200:= ' SELECT RKEY,POPTR,MISC_CHARGE_PTR,AMOUNT FROM DATA0200 WHERE POPTR = ' +
//          ARkey + ' ORDER BY RKEY';

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql17,LSql70,LSql71,LSql04,LSql15,LSql339])
                ,[cdsLookUp17,cds70,cds71,cds04,cds15,cds339]) then Exit;
  if (not cds70.IsEmpty) and (cds70.FieldByName('IDKey').AsString = '') then
  begin
    cds70.Edit;
    cds70.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
    cds70.Post;
  end;

  cds71.DisableControls;
  try
    if not cds71.IsEmpty then
    begin
      cds71.First;
      while not cds71.Eof do
      begin
        if cds71.FieldByName('D70_IDKey').AsString = '' then
        begin
          cds71.Edit;
          cds71.FieldByName('D70_IDKey').Value:= cds70.FieldByName('IDKey').Value;
          cds71.Post;
        end;
//        if cds71.FieldByName('IDKey').AsString = '' then
//        begin
//          cds71.Edit;
//          cds71.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
//          cds71.Post;
//        end;
        cds71.Next;
      end;
    end;

{$REGION '已取消'}
//    if not cds200.IsEmpty then
//    begin
//      Cds200.First;
//      while not Cds200.Eof do
//      begin
//        if cds200.FieldByName('D70_IDKey').AsString = '' then
//        begin
//          cds200.Edit;
//          cds200.FieldByName('D70_IDKey').AsString:= cds70.FieldByName('IDKey').AsString;
//          cds200.Post;
//        end;
//        Cds200.Next;
//      end;
//    end;
{$ENDREGION}

  finally
    cds71.EnableControls;
  end;
end;

function TfrmDetail_Mod29.GetInvtType(ARkey: string): string;
var
  LSql:string;
  LCds:TClientDataSet;
begin
  Result:='';
  LSql:=' SELECT Data0019.inv_group_desc  '+#13+
        ' FROM Data0019 INNER JOIN   '+#13+
        '    Data0496 ON Data0019.rkey = Data0496.group_ptr INNER JOIN   '+#13+
        '    Data0017 ON Data0496.RKEY = Data0017.GROUP_PTR '+#13+
        '  where data0017.rkey=  '+ ARkey;
  LCds:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      Result:= LCds.FieldByName('inv_group_desc').AsString;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmDetail_Mod29.InitApp;
var
  LFrm:TfrmImport_Mod29;
  LRec:Rec;
{$REGION '提交71、72'}
procedure Add71(ACds:TClientDataSet);
var
  LField:TField;
begin
  cdsLookUp17.FieldByName('rkey').ReadOnly:= False;
  cdsLookUp17.FieldByName('INV_PART_DESCRIPTION').ReadOnly:= False;
  cdsLookUp17.Append;
  for LField in cdsLookUp17.Fields do
    if ACds.FindField(LField.FieldName) <> nil then
      LField.Value := ACds.FieldByName(LField.FieldName).Value;
  cdsLookUp17.FieldByName('rkey').Value:=ACds.FieldByName('INVT_PTR').Value;
  cdsLookUp17.Post;

  cds71.Append;
  cds71.FieldByName('INVT_PTR').Value:= ACds.FieldByName('INVT_PTR').Value;
  cds71.FieldByName('QUAN_ORD').Value:= ACds.FieldByName('QUANTITY').Value;
  cds71.FieldByName('PRICE').Value:= ACds.FieldByName('UNIT_PRICE').Value; //不含税价格
  cds71.FieldByName('tax_price').Value:= ACds.FieldByName('tax_price').Value;  //含税
  cds71.FieldByName('TAX_2').Value:= ACds.FieldByName('tax').Value;
  cds71.FieldByName('REQ_DATE').Value:= ACds.FieldByName('reply_date').Value;   //需求日期与到货日期
  cds71.FieldByName('PURCHASE_UNIT_PTR').Value:= ACds.FieldByName('UNIT_PTR').Value;
  cds71.FieldByName('CONVERSION_FACTOR').Value:= ACds.FieldByName('CONVERSION_FACTOR').Value;
  cds71.FieldByName('reason').Value:= ACds.FieldByName('reason').Value;
  cds71.FieldByName('extra_req').Value:= ACds.FieldByName('extra_req').Value;
  cds71.FieldByName('avl_flag').Value:= ACds.FieldByName('INSPECT').Value;  //是否需要来料检查
  cds71.FieldByName('rohs').Value:= ACds.FieldByName('rohs').Value;
  cds71.FieldByName('WO_PTR').Value:= ACds.FieldByName('req_unit_ptr').Value;  //存货单位
  cds71.FieldByName('IF_CAF').Value:= ACds.FieldByName('IF_CAF').Value;
  cds71.FieldByName('rkey69').Value:= ACds.FieldByName('RKEY').Value;
  cds71.FieldByName('IF_urgency').Value:= ACds.FieldByName('IF_urgency').Value;
  cds71.FieldByName('D70_IDKey').Value:= cds70.FieldByName('IDKey').Value;
  cds71.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
  cds71.Post;
end;

procedure Add72_2(ACds:TClientDataSet);
begin
  cds72.Append;
  cds72.FieldByName('DESCRIPTION').Value:= ACds.FieldByName('INV_PART_NUMBER').Value;
  cds72.FieldByName('GUI_GE').Value:= ACds.FieldByName('INV_NAME').Value;
  cds72.FieldByName('QUAN_ORD').Value:= ACds.FieldByName('QUANTITY').Value;
  cds72.FieldByName('UNIT_PRICE').Value:= ACds.FieldByName('UNIT_PRICE').Value; //不含税价格
  cds72.FieldByName('tax_price').Value:= ACds.FieldByName('tax_price').Value;  //含税
  cds72.FieldByName('STATE_TAX').Value:= ACds.FieldByName('tax').Value;
  cds72.FieldByName('DEL_DATE').Value:= ACds.FieldByName('reply_date').Value;   //需求日期与到货日期
  cds72.FieldByName('UNIT_PTR').Value:= ACds.FieldByName('UNIT_PTR').Value;
  cds72.FieldByName('reason').Value:= ACds.FieldByName('reason').Value;
  cds72.FieldByName('DESCRIPTION2').Value:= ACds.FieldByName('INV_DESCRIPTION').Value;  //类型
  cds72.FieldByName('rohs').Value:= ACds.FieldByName('rohs').Value;
  cds72.FieldByName('rkey204').Value:= ACds.FieldByName('RKEY').Value;
  cds72.FieldByName('IF_urgency').Value:= ACds.FieldByName('IF_urgency').Value;
  cds72.FieldByName('D70_IDKey').Value:= cds70.FieldByName('IDKey').Value;
  cds72.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
  cds72.Post;
end;

procedure Add72(ACds:TClientDataSet);
begin
  cds72.Append;
  cds72.FieldByName('DESCRIPTION').Value:= ACds.FieldByName('DESCRIPTION_1').Value;
  cds72.FieldByName('GUI_GE').Value:= ACds.FieldByName('GUI_GE').Value;
  cds72.FieldByName('QUAN_ORD').Value:= ACds.FieldByName('QUANTITY_REQUIRED').Value; //不含税价格
  cds72.FieldByName('UNIT_PRICE').Value:= ACds.FieldByName('UNIT_PRICE').Value; //不含税价格
  cds72.FieldByName('tax_price').Value:= ACds.FieldByName('tax_price').Value;  //含税
  cds72.FieldByName('STATE_TAX').Value:= ACds.FieldByName('tax').Value;
  cds72.FieldByName('DEL_DATE').Value:= ACds.FieldByName('reply_date').Value;   //需求日期与到货日期
  cds72.FieldByName('UNIT_PTR').Value:= ACds.FieldByName('G_L_PTR').Value;
  cds72.FieldByName('reason').Value:= ACds.FieldByName('reason').Value;
  cds72.FieldByName('DESCRIPTION2').Value:= ACds.FieldByName('DESCRIPTION_2').Value;  //是否需要来料检查
  cds72.FieldByName('rohs').Value:= ACds.FieldByName('rohs').Value;
  cds72.FieldByName('rkey204').Value:= ACds.FieldByName('RKEY').Value;
  cds72.FieldByName('IF_urgency').Value:= ACds.FieldByName('IF_urgency').Value;
  cds72.FieldByName('D70_IDKey').Value:= cds70.FieldByName('IDKey').Value;
  cds72.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
  cds72.Post;
end;

{$ENDREGION}
begin
  if AddMod = 0 then  mniSAddClick(nil)
  else
  begin
    Lfrm:= TfrmImport_Mod29.Create(Application);
    try
      LFrm.InitField;
      LFrm.GetData;
      if LFrm.ShowModal= mrOk then
      begin
        Screen.Cursor:= crHourGlass;
        pnl1.Enabled:= False;
        try
          if LFrm.pgc1.ActivePageIndex = 0 then         //按请购单
          begin
            if LFrm.cds68.FieldByName('FLAG').AsString = 'S' then
            begin
              AddINVT:='S';
              InitField71;
              GetDataS('0');
              LFrm.cds6869.First;
              while not LFrm.cds6869.Eof do
              begin
                LRec.Supplier:= LFrm.cds6869.FieldByName('SUPP_PTR').AsString;
                LRec.Currency_ptr:=LFrm.cds6869.FieldByName('PO_LINK_PTR').AsInteger;
                LRec.WHIndex:=LFrm.cds68.FieldByName('WHSE_PTR').AsInteger;
                LRec.RuleIndex:=LFrm.cds6869.FieldByName('o_i_flag').AsInteger;
      //          LRec.VMI:=LFrm.cds69.FieldByName('PO_LINK_PTR').AsInteger;         //
      //          LRec.VMI_From:=LFrm.cds69.FieldByName('PO_LINK_PTR').AsInteger;    //
                LRec.SuppName:=LFrm.cds6869.FieldByName('CODE').AsString;
                LRec.ReqNO:= LFrm.cds68.FieldByName('PO_REQ_NUMBER').AsString;
                LRec.ReqDept:= LFrm.cds68.FieldByName('DEPARTMENT_NAME').AsString;
                LRec.ReqUser:= LFrm.cds68.FieldByName('EMPLOYEE_NAME').AsString;
                LRec.InvtType:= Self.GetInvtType(LFrm.cds6869.FieldByName('INVT_PTR').AsString);

                if ( not cds70.IsEmpty) and
                        cds70.Locate('SUPPLIER_POINTER',LFrm.cds6869.FieldByName('SUPP_PTR').Value,[]) then
                begin
                  Add71(LFrm.cds6869);    //有可能选的是已经选过的供应商
                end
                else
                begin
                  Append70(LRec);
                  Add71(LFrm.cds6869);
                end;
                LFrm.cds6869.Next;
              end;
              eh71.DataSource:= nil;
              eh71.DataSource:= ds71;
              FilterCds;
              CaleDetailS();
            end else
            begin
              AddINVT:='M';
              InitField72;
              GetDataM('0');
              LFrm.cds68204.First;
              while not LFrm.cds68204.Eof do
              begin
                LRec.Supplier:= LFrm.cds68204.FieldByName('SUPPLIER_PTR').AsString;
                LRec.Currency_ptr:=LFrm.cds68204.FieldByName('PO_LINK_PTR').AsInteger;
                LRec.WHIndex:=LFrm.cds68.FieldByName('WHSE_PTR').AsInteger;
                LRec.RuleIndex:=LFrm.cds68204.FieldByName('o_i_flag').AsInteger;
      //          LRec.VMI:=LFrm.cds69.FieldByName('PO_LINK_PTR').AsInteger;         //
      //          LRec.VMI_From:=LFrm.cds69.FieldByName('PO_LINK_PTR').AsInteger;    //
                LRec.SuppName:=LFrm.cds68204.FieldByName('CODE').AsString;
                LRec.ReqNO:= LFrm.cds68.FieldByName('PO_REQ_NUMBER').AsString;
                LRec.ReqDept:= LFrm.cds68.FieldByName('DEPARTMENT_NAME').AsString;
                LRec.ReqUser:= LFrm.cds68.FieldByName('EMPLOYEE_NAME').AsString;
                LRec.InvtType:=  LFrm.cds68204.FieldByName('DESCRIPTION_2').AsString;
                if ( not cds70.IsEmpty) and
                        cds70.Locate('SUPPLIER_POINTER',LFrm.cds68204.FieldByName('SUPPLIER_PTR').Value,[]) then
                begin
                  Add72(LFrm.cds68204);    //有可能选的是已经选过的供应商
                end
                else
                begin
                  Append70(LRec);
                  Add72(LFrm.cds68204);
                end;
                LFrm.cds68204.Next;
              end;

              eh72.DataSource:= nil;
              eh72.DataSource:= ds72;
              FilterCds;
              CaleDetailM();
            end;
          end else                        //按请购明细
          begin
            if LFrm.cds69.IsEmpty then Exit;

            LRec.Supplier:= LFrm.cds69.FieldByName('SUPP_PTR').AsString;
            LRec.Currency_ptr:=LFrm.cds69.FieldByName('PO_LINK_PTR').AsInteger;
            LRec.WHIndex:=LFrm.cds69.FieldByName('WHSE_PTR').AsInteger;
            LRec.RuleIndex:=LFrm.cds69.FieldByName('o_i_flag').AsInteger;
  //          LRec.VMI:=LFrm.cds69.FieldByName('PO_LINK_PTR').AsInteger;         //
  //          LRec.VMI_From:=LFrm.cds69.FieldByName('PO_LINK_PTR').AsInteger;    //
            LRec.SuppName:=LFrm.cds69.FieldByName('CODE').AsString;
            LRec.ReqNO:= LFrm.cds69.FieldByName('PO_REQ_NUMBER').AsString;
            LRec.ReqDept:= LFrm.cds69.FieldByName('DEPARTMENT_NAME').AsString;
            LRec.ReqUser:= LFrm.cds69.FieldByName('EMPLOYEE_NAME').AsString;
            if LFrm.cds69.FieldByName('FLAG').AsString = 'S' then
              LRec.InvtType:= Self.GetInvtType(LFrm.cds69.FieldByName('INVT_PTR').AsString)
            else
              LRec.InvtType:=  LFrm.cds69.FieldByName('INV_DESCRIPTION').AsString;
            if LFrm.cds69.FieldByName('FLAG').AsString = 'S' then
            begin
              InitField71;
              GetDataS('0');
              LFrm.cds69.First;
              AddINVT:='S';
              Append70(LRec);
              while not LFrm.cds69.Eof do
              begin
                Add71(LFrm.cds69);
                LFrm.cds69.Next;
              end;
              eh71.DataSource:= nil;
              eh71.DataSource:= ds71;
              FilterCds;
              CaleDetailS();
            end else
            begin
              InitField72;
              GetDataM('0');
              LFrm.cds69.First;
              AddINVT:='M';
              Append70(LRec);
              while not LFrm.cds69.Eof do
              begin
                Add72_2(LFrm.cds69);
                LFrm.cds69.Next;
              end;
              eh72.DataSource:= nil;
              eh72.DataSource:= ds72;
              FilterCds;
              CaleDetailM();
            end;
          end;
          CaleTotal;
          Init_UI;
          tbc.Visible:=True;
          tbc.TabIndex:= tbc.Tabs.Count - 1;
        finally
          pnl1.Enabled:= True;
          Screen.Cursor:= crDefault;
        end;
      end
      else Close;
    finally
      Lfrm.Free;
    end;
  end;
end;

procedure TfrmDetail_Mod29.InitField71;
var
  i:Integer;
  LField:TField;
begin
  if not gSvrIntf.IntfGetDataBySql('SELECT * FROM DATA0071 WHERE 1=0',cds71) then Exit;
  cds71.Close;
  cds71.FieldDefs.Update;
  try
    for i := 0 to cds71.FieldDefList.Count-1 do
      cds71.FieldDefList.FieldDefs[i].CreateField(Self);

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkLookup;
    LField.FieldName:= 'INV_PART_NUMBER';
    LField.KeyFields:= 'INVT_PTR';
    LField.LookupDataSet:= cdsLookUp17;
    LField.LookupKeyFields:= 'rkey';
    LField.LookupResultField:= 'INV_PART_NUMBER';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkLookup;
    LField.FieldName:= 'INV_Name';
    LField.KeyFields:= 'INVT_PTR';
    LField.LookupDataSet:= cdsLookUp17;
    LField.LookupKeyFields:= 'rkey';
    LField.LookupResultField:= 'INV_Name';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkLookup;
    LField.FieldName:= 'INV_PART_DESCRIPTION';
    LField.KeyFields:= 'INVT_PTR';
    LField.LookupDataSet:= cdsLookUp17;
    LField.LookupKeyFields:= 'rkey';
    LField.LookupResultField:= 'INV_PART_DESCRIPTION';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'Price_Total_C';
    LField.DataSet:= cds71;

    LField:= TStringField.Create(cds71);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'TAX_C';
    LField.DataSet:= cds71;

  finally
    cds71.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmDetail_Mod29.InitField72;
var
  i:Integer;
  LField:TField;
begin
  if not gSvrIntf.IntfGetDataBySql('SELECT * FROM DATA0072 WHERE 1=0',cds72) then Exit;
  cds72.Close;
  cds72.FieldDefs.Update;
  try
    for i := 0 to cds72.FieldDefList.Count-1 do
      cds72.FieldDefList.FieldDefs[i].CreateField(Self);

    LField:= TStringField.Create(cds72);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'Price_Total_C';
    LField.DataSet:= cds72;

    LField:= TStringField.Create(cds72);
    LField.FieldKind:= fkCalculated;
    LField.FieldName:= 'TAX_C';
    LField.DataSet:= cds72;

  finally
    cds72.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmDetail_Mod29.Init_UI;
var
  i:Integer;
begin
  if AddINVT = 'M' then
  begin
    cbxVMI.Visible:= False;
    rgVMI.Visible:= False;
  end;
  case OpenType of
    0:
    begin
      if AddMod = 0 then
      begin
        btnAdd.Visible:= True;
        edtDE.Enabled:=True;
        btnDE.Enabled:= True;
        rkyReqNO.Enabled:=True;
      end;
    end;
    1:   //编辑
    begin
      if cds70.FieldByName('PURCHASE_ORDER_TYPE').AsInteger = 1 then
      begin
        edtDE.Enabled:=True;
        btnDE.Enabled:= True;
        rkyReqNO.Enabled:=True;
      end;
      rkyPoNumber.Enabled:= False;
    end;
    2:   //检查
    begin
      for i:=0 to ControlCount-1 do              //遍历控件设置成只读
        if Controls[i] is TRKeyRzBtnEdit then
          (Controls[i] as TRKeyRzBtnEdit).Enabled:= False;
      edtAu.Enabled:= False;
      btnAu.Enabled:= False;
      cbxContact.Enabled:= False;
      cbxVMI.Enabled:= False;
      rgVMI.Enabled:= False;
      edtShip.Enabled:= False;
      btnShip.Enabled:= False;
      rkyShipAddr.Enabled:= False;
      rkyPhone.Enabled:= False;
      rkyPoNumber.Enabled:= False;
      rkyRate.Enabled:= False;
      btnSave.Enabled:= False;
//      cbxPrePay.Enabled:= False;
//      btnM.Enabled:= False;
      pnl5.Enabled:= False;
    end;
  end;
end;

procedure TfrmDetail_Mod29.LoadData;
var
  LSql23:string;
  LCds23:TClientDataSet;
  i:Integer;
begin
  LSql23:=' SELECT  CONTACT_NAME_1, CONTACT_NAME_2, CONTACT_NAME_3, CONTACT_NAME_4  '+#13+
      '        , CONTACT_NAME_5, CONTACT_NAME_6, PHONE, DISCOUNT, DISCOUNT2   '+#13+
      '              ,DISCOUNT_DAYS, DISCOUNT2_DAYS, PAYMENT_TERMS, TAX_ID_NUMBER   '+#13+
      '              , ANALYSIS_CODE1, ANALYSIS_CODE2, FAX '+#13+
      '  FROM  dbo.Data0023  '+#13+
      '  WHERE rkey= ' +  cds70.FieldByName('SUPPLIER_POINTER').AsString;
  LCds23:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql23,LCds23) then Exit;
    if not LCds23.IsEmpty then
    begin
      cbxContact.Clear;
      for i := 1 to 6 do
      begin
        cbxContact.Items.Add(LCds23.FieldByName('CONTACT_NAME_' + IntToStr(i)).AsString);
        if Trim(LCds23.FieldByName('CONTACT_NAME_' + IntToStr(i)).AsString)
                        = Trim(cds70.FieldByName('SUPPIER_CONTACT').AsString) then
          cbxContact.ItemIndex:= i-1;
      end;
    end;
    rgPO_Rule.ItemIndex:=cds70.FieldByName('DISCOUNT2_DAYS').AsInteger;
    cbxPrePay.Checked:= cds70.FieldByName('COLLECT_PREPAID').AsString = 'P';
    if cds70.FieldByName('CURRENCY_PTR').Value = 1 then rkyRate.ReadOnly:=True;
    if AddINVT = 'S' then
    begin
      if cds70.FieldByName('STATE_INVT_TAX_FLAG').Value = 'Y' then cbxVMI.Checked:=True
      else cbxVMI.Checked:=False;
      rgVMI.ItemIndex:= cds70.FieldByName('SECOND_WHSE_PTR').AsInteger;
    end;
  finally
    LCds23.Free;
  end;
end;

{$REGION '查找杂项费用  已取消'}
//procedure TfrmDetail_Mod29.LoadMiscEx(AForm:TfrmMiscEx_Mod29);
//var
//  i:Integer;
//begin
//  if not cds200.IsEmpty then             //查找已经保存的杂项费用
//  begin
//    Cds200.First;
//    while not Cds200.Eof do
//    begin
//      for i := 1 to AForm.sgM.RowCount - 1 do
//        if Cds200.FieldByName('MISC_CHARGE_PTR').AsString = AForm.sgM.Cells[4,i] then
//           AForm.sgM.Cells[3,i]:= Cds200.FieldByName('AMOUNT').AsString;
//      cds200.Edit;
//      cds200.FieldByName('D70_IDKey').AsString:= cds70.FieldByName('IDKey').AsString;
//      cds200.Post;
//      Cds200.Next;
//    end;
//  end;
//end;
{$ENDREGION}

 procedure TfrmDetail_Mod29.mniSAddClick(Sender: TObject);
begin
  if AddINVT = 'S' then AddS(Sender)
  else AddM(Sender);
end;

procedure TfrmDetail_Mod29.mniSDelClick(Sender: TObject);
begin
  inherited;
  cds71.Delete;
  Self.CaleDetailS;
  Self.CaleTotal;
end;

procedure TfrmDetail_Mod29.mniSEditClick(Sender: TObject);
var
  LFrm:TfrmINVTS_Mod29;
  LField:TField;
begin
  inherited;
  LFrm:= TfrmINVTS_Mod29.Create(Self);
  try
    LFrm.Edit_Type:=1;    //编辑
    LFrm.Init_UI;
//    if cds71.FieldByName('rkey').AsInteger = 0 then
//    begin
      LFrm.GetData('0');
      LFrm.cdsINVT.FieldByName('INV_PART_DESCRIPTION').ReadOnly:= False;
      LFrm.cdsINVT.Append;
      for LField in LFrm.cdsINVT.Fields do
      begin
        if cds71.FindField(LField.FieldName) <> nil then
          LField.Value:= cds71.FieldByName(LField.FieldName).Value;
      end;

      cdsLookUp17.Locate('rkey',cds71.FieldByName('INVT_PTR').Value,[]);
      for LField in LFrm.cdsINVT.Fields do
      begin
        if (IndexText(LField.FieldName,['avl_flag']) <> -1) then Continue;
        if cdsLookUp17.FindField(LField.FieldName) <> nil then
          LField.Value:= cdsLookUp17.FieldByName(LField.FieldName).Value;
      end;

      LFrm.cdsINVT.FieldByName('SUPPLIER_POINTER').Value:=cds70.FieldByName('SUPPLIER_POINTER').Value;
      LFrm.cdsINVT.FieldByName('WAREHOUSE_POINTER').Value:=cds70.FieldByName('WAREHOUSE_POINTER').Value;
      LFrm.cdsINVT.Post;
//    end
//    else
//    begin
//      LFrm.GetData(cds71.FieldByName('rkey').AsString);
//    end;
    LFrm.LoadFactory();
    LFrm.LoadData; //加载非DB控件
//    for i := 0 to LFrm.cbxFactory.Items.Count-1 do
//      if cds70.FieldByName('WAREHOUSE_POINTER').AsInteger =
//            Integer(LFrm.cbxFactory.Items.Objects[i]) then
//        LFrm.cbxFactory.ItemIndex:= i;
//    LFrm.edtDate.Text:= LFrm.cdsINVT.FieldByName('REQ_DATE').AsString;
    LFrm.rgRule.ItemIndex:= rgPO_Rule.ItemIndex;
    LFrm.edtDesc.Text:= LFrm.cdsINVT.FieldByName('INV_PART_DESCRIPTION').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      Append71(LFrm);
      Self.CaleDetailS;
      Self.CaleTotal;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.mniSSupplierClick(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  try
    LFrm.Caption:= '现有供应商';
    LFrm.GetData(cds71.FieldByName('INVT_PTR').AsString,1);     //现有供应商
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

procedure TfrmDetail_Mod29.mniMCheckClick(Sender: TObject);
var
  LFrm:TfrmINVTM_Mod29;
  LField:TField;
begin
  inherited;
  LFrm:= TfrmINVTM_Mod29.Create(Self);
  try
    LFrm.Edit_Type:=2;    //检查
    LFrm.Init_Data;
    if OpenType = 0 then
    begin
      LFrm.GetData('0');
      LFrm.cds72.Append;
      for LField in LFrm.cds72.Fields do
      begin
        if (IndexText(LField.FieldName,['rkey']) <> -1) then Continue;
        if cds72.FindField(LField.FieldName) <> nil then
          LField.Value:= cds72.FieldByName(LField.FieldName).Value;
      end;
      LFrm.cds72.FieldByName('SUPPLIER_POINTER').Value:=cds70.FieldByName('SUPPLIER_POINTER').Value;
      LFrm.cds72.FieldByName('WAREHOUSE_POINTER').Value:=cds70.FieldByName('WAREHOUSE_POINTER').Value;
      LFrm.cds72.Post;
    end
    else
    begin
      LFrm.GetData(cds72.FieldByName('rkey').AsString);
    end;
    LFrm.LoadData; //加载非DB控件
    LFrm.rgRule.ItemIndex:= rgPO_Rule.ItemIndex;
    LFrm.Init_UI;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.mniMDelClick(Sender: TObject);
begin
  inherited;
  cds72.Delete;
  Self.CaleDetailM;
  Self.CaleTotal;
end;

procedure TfrmDetail_Mod29.mniMEditClick(Sender: TObject);
var
  LFrm:TfrmINVTM_Mod29;
  LField:TField;
begin
  inherited;
  LFrm:= TfrmINVTM_Mod29.Create(Self);
  try
    LFrm.Edit_Type:=1;    //编辑
    LFrm.Init_Data;
    LFrm.Init_UI;
//    if cds72.FieldByName('rkey').AsInteger = 0 then
//    begin
      LFrm.GetData('0');
      LFrm.cds72.Append;
      for LField in LFrm.cds72.Fields do
      begin
        if (IndexText(LField.FieldName,['rkey']) <> -1) then Continue;
        if cds72.FindField(LField.FieldName) <> nil then
          LField.Value:= cds72.FieldByName(LField.FieldName).Value;
      end;
      LFrm.cds72.FieldByName('SUPPLIER_POINTER').Value:=cds70.FieldByName('SUPPLIER_POINTER').Value;
      LFrm.cds72.FieldByName('WAREHOUSE_POINTER').Value:=cds70.FieldByName('WAREHOUSE_POINTER').Value;
      LFrm.cds72.Post;
//    end
//    else
//    begin
//      LFrm.GetData(cds72.FieldByName('rkey').AsString);   //这样写会导致二次编辑得不到第一次的数据
//    end;
    LFrm.LoadData; //加载非DB控件
    LFrm.rgRule.ItemIndex:= rgPO_Rule.ItemIndex;

    if LFrm.ShowModal = mrOk then
    begin
      Append72(LFrm);
      Self.CaleDetailM;
      Self.CaleTotal;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.mniPOClick(Sender: TObject);
var
  LFrm:TfrmNote_Mod29;
begin
  inherited;
  LFrm:=TfrmNote_Mod29.Create(nil);
  try
    LFrm.Caption:= '订单记事本 ' + cds70.FieldByName('PO_NUMBER').AsString ;
    LFrm.mmo1.Lines.Add(Trim(cds70.FieldByName('remark70').AsString));
    if OpenType = 2 then
    begin
      Lfrm.mmo1.Enabled:=False;
      LFrm.btnSelect.Enabled:= False;
      Lfrm.btnS.Enabled:= False;
    end;

    if LFrm.ShowModal = mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('remark70').Value:= Trim(LFrm.mmo1.Text);
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.mniRECClick(Sender: TObject);
var
  LFrm:TfrmNote_Mod29;
begin
  inherited;
  LFrm:=TfrmNote_Mod29.Create(nil);
  try
    LFrm.Caption:= '交货记事本 ' + cds70.FieldByName('PO_NUMBER').AsString ;
    LFrm.mmo1.Lines.Add(Trim(cds70.FieldByName('remark1070').AsString));
    if OpenType = 2 then
    begin
      Lfrm.mmo1.Enabled:=False;
      LFrm.btnSelect.Enabled:= False;
      LFrm.btnS.Enabled:= False;
    end;
    if LFrm.ShowModal = mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('remark1070').Value:= Trim(LFrm.mmo1.Text);
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.mniSCheckClick(Sender: TObject);
var
  LFrm:TfrmINVTS_Mod29;
  LField:TField;
begin
  inherited;
  LFrm:= TfrmINVTS_Mod29.Create(Self);
  try
    LFrm.Edit_Type:=2;    //检查
    LFrm.Init_UI;
    if OpenType = 0 then
    begin
      LFrm.GetData('0');
      LFrm.cdsINVT.FieldByName('INV_PART_DESCRIPTION').ReadOnly:= False;
      LFrm.cdsINVT.Append;
      for LField in LFrm.cdsINVT.Fields do
        if cds71.FindField(LField.FieldName) <> nil then
          LField.Value:= cds71.FieldByName(LField.FieldName).Value;
      for LField in LFrm.cdsINVT.Fields do
        if cdsLookUp17.FindField(LField.FieldName) <> nil then
          LField.Value:= cdsLookUp17.FieldByName(LField.FieldName).Value;
      LFrm.cdsINVT.FieldByName('SUPPLIER_POINTER').Value:=cds70.FieldByName('SUPPLIER_POINTER').Value;
      LFrm.cdsINVT.FieldByName('WAREHOUSE_POINTER').Value:=cds70.FieldByName('WAREHOUSE_POINTER').Value;
      LFrm.cdsINVT.Post;
    end
    else
    begin
      LFrm.GetData(cds71.FieldByName('rkey').AsString);
    end;
    LFrm.LoadFactory();
    LFrm.LoadData; //加载非DB控件
//    for i := 0 to LFrm.cbxFactory.Items.Count-1 do
//      if cds70.FieldByName('WAREHOUSE_POINTER').AsInteger =
//            Integer(LFrm.cbxFactory.Items.Objects[i]) then
//        LFrm.cbxFactory.ItemIndex:= i;
//    LFrm.edtDate.Text:= LFrm.cdsINVT.FieldByName('REQ_DATE').AsString;
    LFrm.rgRule.ItemIndex:= rgPO_Rule.ItemIndex;
    LFrm.edtDesc.Text:= LFrm.cdsINVT.FieldByName('INV_PART_DESCRIPTION').AsString;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.pmDetail71Popup(Sender: TObject);
begin
  inherited;
//  if cds71.IsEmpty then
//  begin
//    mniEdit.Enabled:= False;
//    mniDel.Enabled:= False;
//    mniSCheck.Enabled:= False;
//    mniSupplier.Enabled:= False;
//  end else if cds71.FieldByName('QUAN_RECD').Value > 0 then
//  begin
//    mniEdit.Enabled:= False;
//    mniDel.Enabled:= False;
//  end;
  mniSAdd.Visible:= cds71.IsEmpty or (OpenType = 0) or (OpenType = 1);
  mniSEdit.Visible:= not (cds71.IsEmpty or (OpenType = 2));
  mniSCheck.Visible:= not cds71.IsEmpty;
  mniSDel.Visible:= not (cds71.IsEmpty or (OpenType = 2));
  mniSSupplier.Visible:= not cds71.IsEmpty;
end;

procedure TfrmDetail_Mod29.pmDetail72Popup(Sender: TObject);
begin
  inherited;
//  if cds72.IsEmpty then
//  begin
//    mniEdit.Enabled:= False;
//    mniDel.Enabled:= False;
//    mniSCheck.Enabled:= False;
//  end else if cds72.FieldByName('QUANTITY_RECEIVED').Value > 0 then
//  begin
//    mniEdit.Enabled:= False;
//    mniDel.Enabled:= False;
//  end;
  mniMAdd.Visible:= cds72.IsEmpty or (OpenType = 0) or (OpenType = 1);
  mniMEdit.Visible:= not (cds72.IsEmpty or (OpenType = 2));
  mniMCheck.Visible:= not cds72.IsEmpty;
  mniMDel.Visible:= not (cds72.IsEmpty or (OpenType = 2));
end;

procedure TfrmDetail_Mod29.rgVMIClick(Sender: TObject);
begin
  inherited;
  cds70.Edit;
  cds70.FieldByName('SECOND_WHSE_PTR').Value:= rgVMI.ItemIndex;
  cds70.Post;
end;

procedure TfrmDetail_Mod29.rky7Exit(Sender: TObject);
begin
  inherited;
  if Trim(rky7.Text) = '' then rky7.Text:='0';
  Self.CaleTotal;
end;

procedure TfrmDetail_Mod29.rky7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',rky7.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmDetail_Mod29.rkyAuthButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(29,3,' WHERE warehouse_ptr = '
          + IntToStr(cds70.FieldByName('WAREHOUSE_POINTER').AsInteger));
    if LFrm.ShowModal= mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('PURCHASE_TYPE').Value:= LFrm.cdsPick.FieldByName('PURCHASE_TYPE').Value;
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.rkyFactoryDataFieldValueChange(AOldValue,
  ANewValue: Variant);
begin
  inherited;
  rkyFactory.DisplayNoteLabel.Visible:=False;
end;

procedure TfrmDetail_Mod29.rkyPoNumberExit(Sender: TObject);
var
 v_end:string;
begin
  inherited;
  v_end:=copy(rkyPoNumber.Text,length(trim(rkyPoNumber.Text)),1);
  if (v_end<'0') or (v_end>'9') then
  begin
    application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
    rkyPoNumber.SetFocus;
  end;
end;

procedure TfrmDetail_Mod29.rkyShipAddrButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(29,StrToInt(rkyShipAddr.DisplayPickID),' WHERE Data0024.SUPPLIER_PTR = '
                + IntToStr(cds70.FieldByName('SUPPLIER_POINTER').AsInteger));
    if LFrm.ShowModal= mrOk then
    begin
      cds70.Edit;
      cds70.FieldByName('SUPP_FAC_ADD_PTR').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
      cds70.FieldByName('FEDERAL_TAX').Value:= LFrm.cdsPick.FieldByName('state_tax').Value;
      cds70.FieldByName('STATE_SHIP_TAX_FLAG').Value:= LFrm.cdsPick.FieldByName('STATE_SHIP_TAX_FLAG').Value;
      cds70.FieldByName('STATE_MISC_TAX_FLAG').Value:= LFrm.cdsPick.FieldByName('STATE_MISC_TAX_FLAG').Value;
      cds70.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod29.rkyShipAddrExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if Trim(rkyShipAddr.Text) <> '' then
  begin
    LSql:= ' SELECT Data0024.RKEY ,Data0024.FACTORY_LOCATION,Data0024.FACTORY_ADDRESS_1 '+ #13+
           ' ,Data0024.STATE,data0024.state_misc_tax_flag,Data0024.ZIP,data0024.state_ship_tax_flag,data0189.state_tax  '+ #13+
           ' FROM  Data0024 inner join data0189 ON data0024.city_tax_ptr=data0189.rkey '+ #13+
           ' WHERE  FACTORY_LOCATION = ' + QuotedStr(Trim(rkyShipAddr.Text));
    LCds:= TClientDataSet.Create(Self);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
      if LCds.IsEmpty then
      begin
        ShowMessage('装运地址不存在，请重新输入');
        rkyShipAddr.SetFocus;
        Exit;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmDetail_Mod29.tbcChange(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
  i:Integer;
begin
  inherited;
  LCds:= TClientDataSet.Create(Self);
  try
//    cds70.RecNo:= tbc.TabIndex - cds70.RecNo + 1;   //直接移动到某条记录
    cds70.MoveBy(tbc.TabIndex - cds70.RecNo + 1);
    LSql:=' SELECT  CONTACT_NAME_1, CONTACT_NAME_2, CONTACT_NAME_3, CONTACT_NAME_4  '+#13+
          '        , CONTACT_NAME_5, CONTACT_NAME_6, PHONE, DISCOUNT, DISCOUNT2   '+#13+
          '              ,DISCOUNT_DAYS, DISCOUNT2_DAYS, PAYMENT_TERMS, TAX_ID_NUMBER   '+#13+
          '              , ANALYSIS_CODE1, ANALYSIS_CODE2, FAX '+#13+
          '  FROM  dbo.Data0023  '+#13+
          '  WHERE rkey= ' +  cds70.FieldByName('SUPPLIER_POINTER').AsString;
    if not  gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
    cbxContact.Clear;
    for i := 1 to 6 do
      cbxContact.Items.Add(Trim(LCds.FieldByName('CONTACT_NAME_' + IntToStr(i)).AsString));
    cbxContact.ItemIndex:= cbxContact.Items.IndexOf(Trim(cds70.FieldByName('SUPPIER_CONTACT').AsString));

    if cds70.FieldByName('CURRENCY_PTR').Value = 1 then rkyRate.ReadOnly:=True;
    if cds70.FieldByName('STATE_INVT_TAX_FLAG').Value = 'Y' then cbxVMI.Checked:=True
    else cbxVMI.Checked:=False;
    rgVMI.ItemIndex:= cds70.FieldByName('SECOND_WHSE_PTR').AsInteger;
    rgPO_Rule.ItemIndex:=cds70.FieldByName('DISCOUNT2_DAYS').AsInteger;

    FilterCds;
    if AddINVT = 'S' then Self.CaleDetailS()           //小计
    else Self.CaleDetailM();
    Self.CaleTotal;       //总计
  finally
    LCds.Free;
  end;

end;

function TfrmDetail_Mod29.UnUpdate(ARkey70: string):Boolean;
var
  LSql,LSql2,LRkeys,LPtrs:string;
  LCds:TClientDataSet;
begin
  Result:= False;
  LRkeys:= '';
  LPtrs:= '';
  LCds:=TClientDataSet.Create(self);
  try
    if AddINVT = 'S' then
    begin
      LSql:=' SELECT DATA0069.rkey,DATA0069.PURCH_REQ_PTR FROM DATA0069 INNER JOIN  ' + #13+
            '    DATA0071 ON DATA0069.RKEY = DATA0071.rkey69 ' + #13 +
            ' WHERE DATA0071.PO_PTR = ' + ARkey70;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        LCds.First;
        while not LCds.Eof do
        begin
          LRkeys:= LCds.FieldByName('rkey').AsString + ',' + LRkeys;
          if Pos(LPtrs,LCds.FieldByName('PURCH_REQ_PTR').AsString) = 0 then
            LPtrs:= LCds.FieldByName('PURCH_REQ_PTR').AsString + ',' + LPtrs;
          LCds.Next;
        end;
        LRkeys:= Copy(LRkeys,1,Length(LRkeys)-1);
        LPtrs:= Copy(LPtrs,1,Length(LPtrs)-1);

        LSql:= ' SELECT * FROM DATA0069 WHERE RKEY IN (' + LRkeys + ')';
        LSql2:= ' SELECT * FROM DATA0068 WHERE RKEY IN (' + LPtrs + ')';
        if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql2]),[cds69,cds68]) then Exit;
        if not cds69.IsEmpty then
        begin
          cds69.First;
          while not cds69.Eof do
          begin
            cds69.Edit;
            cds69.FieldByName('status').Value:= 0;
            cds69.Post;
            cds69.Next;
          end;
        end;
//        if not cds68.IsEmpty then
//        begin
//          cds68.First;
//          while not cds68.Eof do
//          begin
//            if cds68.FieldByName('status').Value <> 0 then
//            begin
//              cds68.Edit;
//              cds68.FieldByName('status').Value:= 2;
//              cds68.Post;
//            end;
//            cds68.Next;
//          end;
//        end;
      end;
    end
    else
    begin
      LSql:=' SELECT DATA0204.rkey,DATA0204.PURCHASE_REQ_PTR FROM DATA0204 INNER JOIN  ' + #13+
            '    DATA0072 ON DATA0204.RKEY = DATA0072.rkey204 ' + #13 +
            ' WHERE DATA0072.POPTR = ' + ARkey70;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        LCds.First;
        while not LCds.Eof do
        begin
          LRkeys:= LCds.FieldByName('rkey').AsString + ',' + LRkeys;
          if Pos(LPtrs,LCds.FieldByName('PURCHASE_REQ_PTR').AsString) = 0 then
            LPtrs:= LCds.FieldByName('PURCHASE_REQ_PTR').AsString + ',' + LPtrs;
          LCds.Next;
        end;
        LRkeys:= Copy(LRkeys,1,Length(LRkeys)-1);
        LPtrs:= Copy(LPtrs,1,Length(LPtrs)-1);

        LSql:= ' SELECT * FROM DATA0204 WHERE RKEY IN (' + LRkeys + ')';
        LSql2:= ' SELECT * FROM DATA0068 WHERE RKEY IN (' + LPtrs + ')';

        if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql2]),[cds204,cds68]) then Exit;
        if not cds204.IsEmpty then
        begin
          cds204.First;
          while not cds204.Eof do
          begin
            cds204.Edit;
            cds204.FieldByName('status').Value:= 0;
            cds204.Post;
            cds204.Next;
          end;
        end;
//        if not cds68.IsEmpty then
//        begin
//          cds68.First;
//          while not cds68.Eof do
//          begin
//            if cds68.FieldByName('status').Value <> 0 then
//            begin
//              cds68.Edit;
//              cds68.FieldByName('status').Value:= 2;
//              cds68.Post;
//            end;
//            cds68.Next;
//          end;
//        end;
      end;
    end;
    Result:= True;
  finally
    LCds.Free;
  end;
end;

//procedure TfrmDetail_Mod29.Update362;
//var
//  LBk:TBookmark;
//  LTotal:Double;
//  LSql:string;
//  LCds:TClientDataSet;
//begin
//  LTotal:=0;
//  LBk:= cds70.GetBookmark;
//  LCds:= TClientDataSet.Create(Self);
//  cds70.DisableControls;
//  try
//    cds70.First;
//    while not cds70.Eof do
//    begin
//      Ltotal:= LTotal + cds70.FieldByName('SUB_TOTAL').Value;
//      cds70.Next;
//    end;
//    LSql:= cds362.CommandText + ' WHERE data0068.PO_REQ_NUMBER= '
//                  + QuotedStr(cds70.FieldByName('FOB').AsString);
//  finally
//    cds70.GotoBookmark(LBk);
//    cds70.EnableControls;
//    cds70.FreeBookmark(LBk);
//    LCds.Free;
//  end;
//end;

function TfrmDetail_Mod29.Update23(ARkey: string): Boolean;   //更新供应商信息
var
  LSql:string;
begin
  Result:=False;
  LSql:='SELECT * FROM DATA0023 WHERE RKEY = ' + ARkey;
  if not gSvrIntf.IntfGetDataBySql(LSql,cds23) then Exit;
  if not cds23.IsEmpty then
  begin
    cds23.Edit;
    cds23.FieldByName('tax_id_number').Value:= Trim(cds70.FieldByName('ANALYSIS_CODE_5').Value); //付款方法
    cds23.FieldByName('analysis_code1').Value:= Trim(cds70.FieldByName('ANALYSIS_CODE_4').Value); //票据种类
    cds23.Post;
    Result:= True;
  end;
end;

function TfrmDetail_Mod29.UpdateS(ARkey70: string):Boolean;
var
  LRkeys,LPtr:string;
begin
  Result:= False;
  LRkeys:='';
  LPtr:='';
  if AddINVT = 'S' then
  begin
    if not cds69.Active then        //说明编辑里面没有导入项，都是由手工输入
    begin
      Result:= True;
      exit;
    end;
    cds71.DisableControls;
    if cds71.Filter <> '' then cds71.Filter := '';
    cds71.First;
    while not cds71.Eof do
    begin
      if (cds71.FieldByName('rkey69').Value > 0) then
      begin
        if   cds69.Locate('rkey',cds71.FieldByName('rkey69').AsInteger,[]) then
        begin
          cds69.Edit;
          cds69.FieldByName('status').Value:= 1;
          cds69.Post;
        end
        else
        begin
          ShowMessage('定位记录出错!');
          exit;
        end;
      end;
      cds71.Next;
    end;
    cds71.EnableControls;

    cds69.DisableControls;                                  //以上更新69的状态  以下更新68的状态
    cds69.First;
    while not cds69.Eof do
    begin
      if (cds69.FieldByName('status').Value = 0) then
      begin
        if cds68.Locate('rkey',cds69.FieldByName('PURCH_REQ_PTR').AsInteger,[]) then
        begin
          cds68.Edit;
          cds68.FieldByName('status').Value:= 2;
          cds68.Post;
        end
        else
        begin
          ShowMessage('定位记录出错!');
          exit;
        end;
      end;
      cds69.Next;
    end;
    cds69.EnableControls;
  end
  else
  begin
    if not cds204.Active then        //说明编辑里面没有导入项，都是由手工输入
    begin
      Result:= True;
      exit;
    end;
    cds72.DisableControls;
    if cds72.Filter <> '' then cds72.Filter := '';
    cds72.First;
    while not cds72.Eof do
    begin
      if (cds72.FieldByName('rkey204').Value > 0) then
      begin
        if   cds204.Locate('rkey',cds72.FieldByName('rkey204').AsInteger,[]) then
        begin
          cds204.Edit;
          cds204.FieldByName('status').Value:= 1;
          cds204.Post;
        end
        else
        begin
          ShowMessage('定位记录出错!');
          exit;
        end;
      end;
      cds72.Next;
    end;
    cds72.EnableControls;
    cds204.DisableControls;
    cds204.First;
    while not cds204.Eof do
    begin
      if (cds204.FieldByName('status').Value = 0) then
      begin
        if cds68.Locate('rkey',cds204.FieldByName('PURCHASE_REQ_PTR').AsInteger,[]) then
        begin
          cds68.Edit;
          cds68.FieldByName('status').Value:= 2;
          cds68.Post;
        end
        else
        begin
          ShowMessage('定位记录出错!');
          exit;
        end;
      end;
      cds204.Next;
    end;
    cds204.EnableControls;
  end;
  Result:= True;
end;

function TfrmDetail_Mod29.UpdateS_Add: Boolean;
var
  LSql,LRkeys,LPtr:string;
begin
  Result:= False;
  LRkeys:='';
  LPtr:='';
  if AddINVT = 'S' then
  begin
    if cds71.Filter <> '' then cds71.Filter := '';
    cds71.DisableControls;
    try
      cds71.First;
      while not cds71.Eof do
      begin
        if cds71.FieldByName('rkey69').AsInteger > 0 then
         LRkeys:= cds71.FieldByName('rkey69').AsString + ',' + LRkeys;
        cds71.Next;
      end;
    finally
      cds71.EnableControls;
    end;

                                      //以上更新69的状态  以下更新68的状态

    if LRkeys <> '' then
    begin
      LRkeys:= Copy(LRkeys,1,Length(LRkeys)-1);

      LSql:=' SELECT * FROM DATA0069 WHERE RKEY IN (' + LRkeys + ')';
      if NOT gSvrIntf.IntfGetDataBySql(LSql,cds69) then Exit;
      if not cds69.IsEmpty then
      begin
        cds69.First;
        while not cds69.Eof do
        begin
          if cds69.FieldByName('status').Value = 0 then
          begin
            cds69.Edit;
            cds69.FieldByName('status').Value:= 1;
            cds69.Post;
            if Pos(LPtr,cds69.FieldByName('PURCH_REQ_PTR').AsString) = 0 then
              LPtr:= cds69.FieldByName('PURCH_REQ_PTR').AsString + ',' + LPtr;
          end
          else
          begin
            exit;
          end;
          cds69.Next;
        end;
        LPtr:= Copy(LPtr,1,Length(LPtr)-1);

        LSql:=' SELECT * FROM DATA0068 WHERE RKEY IN (' + LPtr + ')' +#13+
              '   	AND rkey NOT IN (  ' +#13+
              '       		SELECT dbo.Data0069.PURCH_REQ_PTR ' +#13+
              '           FROM data0069 ' +#13+
              '           WHERE PURCH_REQ_PTR in (' + LPtr + ') ' +#13+
              '                      AND data0069.RKEY NOT IN (' + LRkeys + ') ' +#13+
              '       and status =0 )';
        if NOT gSvrIntf.IntfGetDataBySql(LSql,cds68) then Exit;
        if not cds68.IsEmpty then
        begin
          cds68.First;
          while not cds68.Eof do
          begin
            cds68.Edit;
            cds68.FieldByName('status').Value:= 6;
            cds68.Post;
            cds68.Next;
          end;
        end;
      end;
    end;
  end
  else
  begin
    if cds72.Filter <> '' then cds72.Filter := '';
    cds72.DisableControls;
    cds72.First;
    while not cds72.Eof do
    begin
      if cds72.FieldByName('rkey204').AsInteger > 0 then
        LRkeys:= cds72.FieldByName('rkey204').AsString + ',' + LRkeys;
      cds72.Next;
    end;
    cds72.EnableControls;
    if LRkeys <>'' then
    begin
      LRkeys:= Copy(LRkeys,1,Length(LRkeys)-1);

      LSql:=' SELECT * FROM DATA0204 WHERE RKEY IN (' + LRkeys + ')';
      if NOT gSvrIntf.IntfGetDataBySql(LSql,cds204) then Exit;
      if not cds204.IsEmpty then
      begin
        cds204.First;
        while not cds204.Eof do
        begin
          if cds204.FieldByName('status').Value = 0 then
          begin
            cds204.Edit;
            cds204.FieldByName('status').Value:= 1;
            cds204.Post;
            if Pos(LPtr,cds204.FieldByName('PURCHASE_REQ_PTR').AsString) = 0 then
              LPtr:= cds204.FieldByName('PURCHASE_REQ_PTR').AsString + ',' + LPtr;
          end
          else
          begin
            exit;
          end;
          cds204.Next;
        end;
        LPtr:= Copy(LPtr,1,Length(LPtr)-1);
        LSql:=' SELECT * FROM DATA0068 WHERE RKEY IN (' + LPtr + ')' +#13+
              '   	AND rkey NOT IN (  ' +#13+
              '       		SELECT dbo.Data0204.PURCHASE_REQ_PTR ' +#13+
              '           FROM data0204' +#13+
              '           WHERE PURCHASE_REQ_PTR in (' + LPtr + ') ' +#13+
              '                      AND data0204.RKEY NOT IN (' + LRkeys + ') ' +#13+
              '       and status =0 )';
        if NOT gSvrIntf.IntfGetDataBySql(LSql,cds68) then Exit;
        if not cds68.IsEmpty then
        begin
          cds68.First;
          while not cds68.Eof do
          begin
            cds68.Edit;
            cds68.FieldByName('status').Value:= 6;
            cds68.Post;
            cds68.Next;
          end;
        end;
      end;
    end;
  end;
  Result:= True;
end;

end.
