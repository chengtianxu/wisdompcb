unit RFQInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Mask, DBCtrls,
  Grids, DBGridEh, ADODB, RFQ, Math, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppBands, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  ppModule, raCodMod, ppStrtch, ppMemo, ppSubRpt;

const sqltext = 'select CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG from data0004 where rkey=83';

type
  TfrmRFQInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabBasic: TTabSheet;
    TabPOInfo: TTabSheet;
    TabGYXX: TTabSheet;
    TabPZYQ: TTabSheet;
    TabJCXX: TTabSheet;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtRFQNo: TEdit;
    edtCustId: TEdit;
    edtCustName: TEdit;
    edtCustAddr: TEdit;
    edtSalesMan: TEdit;
    edtTechContact: TEdit;
    edtTel: TEdit;
    edtMail: TEdit;
    edtFileName: TEdit;
    edtFilePath: TEdit;
    edtPartsId: TEdit;
    btnLookCust: TBitBtn;
    dsDetail: TDataSource;
    AQDetail: TADOQuery;
    AQDetailParam_Value: TStringField;
    AQDetailSEQ_NO: TSmallintField;
    AQDetailRKEY: TAutoIncField;
    AQDetailPARAMETER_PTR: TIntegerField;
    AQDetailGroup_Type: TWordField;
    AQDetailGroup_Name: TStringField;
    AQDetailParam_ptr: TIntegerField;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    AQDetailPARAMETER_NAME: TStringField;
    AQDetailPARAMETER_DESC: TStringField;
    AQDetailUNIT_NAME: TStringField;
    DBGridEh1: TDBGridEh;
    rgPOType: TRadioGroup;
    AQDetailDATA_TYPE: TSmallintField;
    AQDetailmin_value: TFloatField;
    AQDetailmax_value: TFloatField;
    sbtnUp: TSpeedButton;
    sbtnDown: TSpeedButton;
    dlgUp: TOpenDialog;
    IdFTP1: TIdFTP;
    dlgDown: TSaveDialog;
    sbtnSetLink: TSpeedButton;
    pnlSetFTPLink: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtIP: TEdit;
    edtUID: TEdit;
    edtPSW: TEdit;
    sbtnSave: TSpeedButton;
    sbtnCancel: TSpeedButton;
    AQDetailMustInput: TWordField;
    btnPrint: TBitBtn;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText22: TppDBText;
    ppLabel23: TppLabel;
    ppDBText23: TppDBText;
    ppLabel24: TppLabel;
    ppDBText24: TppDBText;
    ppLabel25: TppLabel;
    ppLine1: TppLine;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    TabLayInfo: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    ComboBox1: TComboBox;
    btnChkDemo: TBitBtn;
    dbmLayersInfo: TDBMemo;
    ppSummaryBand1: TppSummaryBand;
    ppDBMemo1: TppDBMemo;
    ppLabel14: TppLabel;
    TabSheet1: TTabSheet;
    ds536: TDataSource;
    aq536: TADOQuery;
    aq536rkey: TAutoIncField;
    aq536source_ptr: TIntegerField;
    aq536sheet_BMP: TBlobField;
    aq536pnl_bmp: TBlobField;
    aq536pnl2_bmp: TBlobField;
    aq536TOTAL_PNLS_1: TSmallintField;
    aq536TOTAL_PNLS_2: TSmallintField;
    aq536UNIT_LEN: TFloatField;
    aq536UNIT_WTH: TFloatField;
    aq536UNIT_UNIT: TWordField;
    aq536UNIT_NUM: TIntegerField;
    aq536SHT_LEN: TFloatField;
    aq536SHT_WTH: TFloatField;
    aq536TUSAGE: TBCDField;
    aq536PNL_LEN: TFloatField;
    aq536PNL_WTH: TFloatField;
    aq536UPANEL: TSmallintField;
    aq536PNL_LEN_2: TFloatField;
    aq536PNL_WTH_2: TFloatField;
    aq536UPANEL_2: TSmallintField;
    aq536minspace1: TFloatField;
    aq536minspace2: TFloatField;
    aq536pnl_lenspace: TBCDField;
    aq536pnl_wthspace: TBCDField;
    Image1: TImage;
    sbtnDelete: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLookCustClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AQDetailAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure AQDetailParam_ValueValidate(Sender: TField);
    procedure sbtnUpClick(Sender: TObject);
    procedure sbtnDownClick(Sender: TObject);
    procedure sbtnSetLinkClick(Sender: TObject);
    procedure sbtnSaveClick(Sender: TObject);
    procedure sbtnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPrintClick(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Image1DblClick(Sender: TObject);
    procedure sbtnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    IP,UID,PSW: string;
    IsPost: Byte;
    procedure update_04(v_seed: string);
    procedure ConnectFTP(Host, UId, PSW: string);
    procedure update_536;
    function AutoCalc(var ErrMsg: string):Boolean;
  public
    vIsUP: Boolean;  //文件上传状态
  end;

var
  frmRFQInfo: TfrmRFQInfo;

implementation

uses damo, common, IdFTPList, IdFTPCommon, IniFiles, ConstVar, Pick_Item_Single;

{$R *.dfm}

function CallPCBCut: Boolean;
type
  pfShowPCBCutFrm = function (AOwner: TComponent): Boolean;stdcall;
var
  pf: Pointer;
  hMod: HWND;
begin
  Result := False;
  with TResourceStream.Create(HInstance,'RC1',RT_RCDATA) do
  begin
    try
      SaveToFile('WZPCBCut.dll');
    finally
      Free;
    end;
  end;

  hMod := LoadLibrary(PChar(ExtractFilePath(ParamStr(0)) + 'WZPCBCut.dll'));
  if (hMod <> 0) and (hMod <> INVALID_HANDLE_VALUE) then
  begin
    pf := GetProcAddress(hMod,'ShowPCBCutFrm');
    if pf <> nil then
      Result := pfShowPCBCutFrm(pf)(nil);
    FreeLibrary(hMod);
  end;
end;

procedure TfrmRFQInfo.btnCancelClick(Sender: TObject);
begin
  dm.AQMain.Cancel;
  AQDetail.Cancel;
  ModalResult:= mrCancel;
end;

procedure TfrmRFQInfo.btnLookCustClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                        'BILLING_ADDRESS_1/地址/251';
    InputVar.Sqlstr :=
      'Select t10.CUST_CODE,t10.CUSTOMER_NAME,t10.BILLING_ADDRESS_1, '+#13+
      't5.EMPLOYEE_NAME as SALES_REP_NAME,t10.PHONE,t10.GEN_EMAIL_ADDRESS '+#13+
      'from data0010 t10 Left Join data0005 t5 '+#13+
      'On t10.SALES_REP_PTR = t5.RKEY '+#13+
      'order by t10.CUST_CODE';
    inputvar.InPut_value:=edtCustId.Text;
    inputvar.KeyField:='CUST_CODE';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtCustId.Text:= frmPick_Item_Single.adsPick.FieldByName('CUST_CODE').AsString;
      edtCustName.Text:= frmPick_Item_Single.adsPick.FieldByName('CUSTOMER_NAME').AsString;
      edtCustAddr.Text:= frmPick_Item_Single.adsPick.FieldByName('BILLING_ADDRESS_1').AsString;
      edtSalesMan.Text:= frmPick_Item_Single.adsPick.FieldByName('SALES_REP_NAME').AsString;
      edtTel.Text:= frmPick_Item_Single.adsPick.FieldByName('PHONE').AsString;
      edtMail.Text:= frmPick_Item_Single.adsPick.FieldByName('GEN_EMAIL_ADDRESS').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmRFQInfo.btnSaveClick(Sender: TObject);
var
  i: integer;
  iComponent: TComponent;
  ErrMsg: string;
begin
  IsPost:= 1;
  for i:= 0 to ComponentCount - 1 do
  begin
    iComponent:= Components[i];
    if iComponent.Tag <> 100 then Continue;
    if iComponent is TEdit then
    begin
      if (iComponent as TEdit).Text = '' then
      begin
        ShowMessage((iComponent as TEdit).Hint+'不能为空!');
        if (iComponent as TEdit).CanFocus then
          (iComponent as TEdit).SetFocus;
        Abort;
      end;
    end;
    if iComponent is TRadioGroup then
    begin
      if (iComponent as TRadioGroup).ItemIndex = -1 then
      begin
        ShowMessage((iComponent as TRadioGroup).Hint+'不能为空!');
        if (iComponent as TRadioGroup).CanFocus then
          (iComponent as TRadioGroup).SetFocus;
        Abort;
      end;
    end;
  end;
  if edtFileName.Text = edtPartsId.Text then
  begin
    Showmessage('文件名与零件号不能相同！');
    Abort;
  end;
  if not AutoCalc(ErrMsg) then
  begin
    Showmessage(ErrMsg+#13+#13+'自动计算[SET孔数]、[SET测试点数]失败！');
//    Abort;
  end;
  {
  PageControl1.ActivePage:= TabBasic;
  AQDetail.Filter := '';
  AQDetail.First;
  while not AQDetail.Eof do
  begin
    if AQDetailMustInput.Value = 1 then  //检查Data0166必填参数
    begin
      if AQDetailParam_Value.Value = '' then
      begin
        ShowMessage(AQDetailPARAMETER_NAME.Value +' 为必填参数,请输入!');
        Abort;
      end;
    end;
    AQDetail.Next;
  end;}
  if frmRFQ.YY = 1 then
  begin
    with dm.temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sqltext);
      Open;
    end;
    edtRFQNo.Text:= dm.tempSEED_VALUE.Value;
  end;
  dm.ADOConn.BeginTrans;
  try
    with dm.AQMain do
    begin
      if not (State in [dsinsert, dsedit]) then Edit;
      FieldByName('RFQNo').AsString:= edtRFQNo.Text;
      FieldByName('Cust_Id').AsString:= edtCustId.Text;
      FieldByName('Cust_Name').AsString:= edtCustName.Text;
      FieldByName('Cust_Addr').AsString:= edtCustAddr.Text;
      FieldByName('SalesMan').AsString:= edtSalesMan.Text;
      FieldByName('TechContact').AsString:= edtTechContact.Text;
      FieldByName('Tel').AsString:= edtTel.Text;
      FieldByName('Mail').AsString:= edtMail.Text;
      FieldByName('FileName').AsString:= edtFileName.Text;
      FieldByName('FilePath').AsString:= edtFilePath.Text;
      FieldByName('PartsId').AsString:= edtPartsId.Text;
      FieldByName('POType').AsString:= IntToStr(rgPOType.ItemIndex);
      FieldByName('IsUP').AsBoolean:= vIsUp;
      if frmRFQ.YY = 1 then
        FieldByName('CreateId').AsString:= USERRKEY;
      FieldByName('LastModifyId').AsString:= USERRKEY;
      FieldByName('LastModifyDate').AsDateTime:= getsystem_date(dm.ADQGetDate,0);
      UpdateBatch();
    end;
    with AQDetail do
    begin
      DisableControls;
      if frmRFQ.YY = 1 then  //新增
      begin
        AQDetail.Filter := '';  //*此处万不可省略
        AQDetail.First;
        while not AQDetail.Eof do
        begin
          if not (AQDetail.State in [dsEdit]) then AQDetail.Edit;
          AQDetailPARAMETER_PTR.Value:= dm.AQMainRKEY.Value;
          Next;
        end;
      end;
      UpdateBatch(arAllChapters);  //更换Filter批量更新数据需使用arAllChapters
      EnableControls;
    end;
    with aq536 do
    begin
      if frmRFQ.YY = 1 then  //新增
      begin
        aq536.First;
        while not aq536.Eof do
        begin
          if not (aq536.State in [dsEdit]) then aq536.Edit;
          aq536source_ptr.Value:= dm.AQMainRKEY.Value;
          Next;
        end;
      end;
      UpdateBatch(arAllChapters);
    end;
    if frmRFQ.YY = 1 then  //新增
      update_04(trim(edtRFQNo.Text));
    dm.ADOConn.CommitTrans;
    ModalResult:= mrok;
    Showmessage('保存成功!');
  except
    dm.ADOConn.RollbackTrans;
  end;
end;

procedure TfrmRFQInfo.PageControl1Change(Sender: TObject);
begin
  Case PageControl1.ActivePage.Tag of
    1:
    begin
      AQDetail.Filter:= 'Group_Type = 1';  //订单信息
      if AQDetail.RecordCount = 0 then
        DBGridEh1.ReadOnly:= True
      else
        DBGridEh1.ReadOnly:= False;
    end;
    2:
    begin
       AQDetail.Filter:= 'Group_Type = 2';  //工艺信息
      if AQDetail.RecordCount = 0 then
        DBGridEh2.ReadOnly:= True
      else
        DBGridEh2.ReadOnly:= False;
    end;
    3:
    begin
      AQDetail.Filter:= 'Group_Type = 3';  //特殊工艺/品质要求
      if AQDetail.RecordCount = 0 then
        DBGridEh3.ReadOnly:= True
      else
        DBGridEh3.ReadOnly:= False;
    end;
    4:
    begin
      AQDetail.Filter:= 'Group_Type = 4';  //检测信息
      if AQDetail.RecordCount = 0 then
        DBGridEh4.ReadOnly:= True
      else
        DBGridEh4.ReadOnly:= False;
    end;
  else
    AQDetail.Filter:= '';
  end;
end;

procedure TfrmRFQInfo.FormShow(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  PageControl1.ActivePage := TabBasic;

  MyIniFile:= TIniFile.Create(ExtractFilePath(ParamStr(0))+'RFQ_Link.ini');
  try
    IP:= MyIniFile.ReadString('FTP服务器','服务器IP','172.16.10.6');
    UID:= MyIniFile.ReadString('FTP服务器','用户名','yfq');
    PSW:= Base64_Decode(MyIniFile.ReadString('FTP服务器','密码','vqeGvHKsKAY'));  //解密后:60e7393b
  finally
    MyIniFile.Free;
  end;
end;

procedure TfrmRFQInfo.AQDetailAfterScroll(DataSet: TDataSet);
var
  iDBGridEh: TDBGridEh;
begin
  Case PageControl1.ActivePage.Tag of
    1: iDBGridEh:= DBGridEh1;  //订单信息
    2: iDBGridEh:= DBGridEh2;  //工艺信息
    3: iDBGridEh:= DBGridEh3;  //特殊工艺/品质要求
    4: iDBGridEh:= DBGridEh4;  //检测信息
  else
    iDBGridEh:= DBGridEh1;
  end;

  if AQDetail.Active then
  begin
    if not AQDetailParam_ptr.IsNull then
    begin
      dm.AQ0338.Close;
      dm.AQ0338.Parameters.ParamValues['rkey0166'] := AQDetailParam_ptr.Value ;
      dm.AQ0338.Open;
      if dm.AQ0338.RecordCount > 0 then
       begin
         iDBGridEh.FieldColumns['Param_Value'].PickList.Clear;
         dm.AQ0338.First;
         while not dm.AQ0338.Eof do
         begin
           iDBGridEh.FieldColumns['Param_Value'].PickList.Add(dm.AQ0338.FieldByName('TVALUE').AsString);
           dm.AQ0338.Next;
         end;
       end
      else
        iDBGridEh.FieldColumns['Param_Value'].PickList.Clear;
    end;
  end; 
end;

procedure TfrmRFQInfo.FormActivate(Sender: TObject);
begin
  image1.Canvas.Brush.Color:=clwhite;
  if frmRFQ.YY = 1 then  //新增
  begin
    with dm.temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sqltext);
      Open;
    end;
    edtRFQNo.Text:= dm.tempSEED_VALUE.Value;
    with dm.AQMain do
    begin
      Close;
      Parameters.ParamByName('RKEY').Value:= 0;
      Open;
      Append;
    end;
    dm.AQTempDetail.Close;
    dm.AQTempDetail.Prepared;
    dm.AQTempDetail.Open;
    if not dm.AQTempDetail.IsEmpty then
    begin
      dm.AQTempDetail.First;
      AQDetail.DisableControls;
      dsDetail.DataSet:= nil;
      with dm.AQParamName do
      begin
        Close;
        Open;
      end;
      if not AQDetail.Active then
      begin
        AQDetail.Close;
        AQDetail.Parameters.ParamByName('PARAMETER_PTR').Value:= 0;
        AQDetail.Open;
      end;
      while not dm.AQTempDetail.Eof do
      begin
        AQDetail.Append;
        AQDetailGroup_Type.Value:= dm.AQTempDetail.FieldValues['Group_Type'];
        AQDetailGroup_Name.Value:= dm.AQTempDetail.FieldValues['Group_Name'];
        AQDetailParam_ptr.Value:= dm.AQTempDetail.FieldValues['Param_ptr'];
        AQDetailSEQ_NO.Value:= dm.AQTempDetail.FieldValues['SEQ_NO'];
        AQDetailMustInput.Value:= dm.AQTempDetail.FieldValues['MustInput'];
        if ((dm.AQTempDetail.FieldValues['PARAMETER_DESC']='成品检验报告')
         or (dm.AQTempDetail.FieldValues['PARAMETER_DESC']='电测报告')) then
          AQDetailParam_Value.Value:= '是'
        else
          AQDetailParam_Value.Value:= '';
        AQDetailPARAMETER_PTR.Value:= 0;
        dm.AQTempDetail.Next;
      end;
      dsDetail.DataSet:= AQDetail;
      AQDetail.EnableControls;
    end ;
    dm.AQTempDetail.Close;
    with aq536 do
    begin
      Close;
      Parameters.ParamByName('RKEY165').Value:= 0;
      Open;
    end;
    image1.ShowHint:= True;
    btnSave.Enabled:= True;
    TabBasic.Enabled:= True;
  end;
  if frmRFQ.YY = 2 then  //编辑
  begin
    dm.AQMain.Edit;
    with dm.AQParamName do
    begin
      Close;
      Open;
    end;
    with AQDetail do
    begin
      Close;
      Parameters.ParamByName('PARAMETER_PTR').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
      Open;
      Edit;
    end;
    with aq536 do
    begin
      Close;
      Parameters.ParamByName('RKEY165').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
      Open;
    end;
    if aq536.RecordCount<>0 then image1.Picture.Assign(Load_JPG_Pic_From_DB(aq536sheet_BMP));
    image1.ShowHint:= True;
    btnSave.Enabled:= True;
    TabBasic.Enabled:= True;
  end;
  if frmRFQ.YY = 3 then  //检查
  begin
    with dm.AQParamName do
    begin
      Close;
      Open;
    end;
    with AQDetail do
    begin
      Close;
      Parameters.ParamByName('PARAMETER_PTR').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
      Open;
    end;
    with aq536 do
    begin
      Close;
      Parameters.ParamByName('RKEY165').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
      Open;
    end;
    if aq536.RecordCount<>0 then image1.Picture.Assign(Load_JPG_Pic_From_DB(aq536sheet_BMP));
    image1.ShowHint:= False;
    btnSave.Enabled:= False;
    TabBasic.Enabled:= False;
  end;
end;

procedure TfrmRFQInfo.update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  with dm.temp do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqltext);
    Open;
  end;
  v_length := length(v_seed);
  for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
  begin
    v_last:= floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed:= copy(v_seed,1,i) + copy(v_last,i+1,v_length-i);
    dm.temp.Edit; //使前缀不变后缀加1
    dm.tempSEED_VALUE.Value := new_seed;
    dm.temp.Post;
    break;
  end
  else
  if i=1 then //如果第一位仍然是数字
  begin
    v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
    new_seed := copy(v_last,2,v_length);
    dm.temp.Edit;
    dm.tempSEED_VALUE.Value := new_seed;
    dm.temp.Post;
  end;
end;

procedure TfrmRFQInfo.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = 40) and (AQDetail.RecNo = AQDetail.RecordCount)) then  //↓
    abort;
  if key = 45 then  //Insert
    abort;
  if ((key = 46) and (ssCtrl in shift)) then  //Ctrl+Delete
    abort;
  if ((key = 112) and (dm.AQ0338.RecordCount > 0)) then  //F1显示下拉箭头
  begin
    (Sender as TDBGridEh).Columns[3].DropDown;
  end;
end;

procedure TfrmRFQInfo.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if AQDetailDATA_TYPE.Value = 1 then  //数字
  begin
    if not (key in ['0'..'9','.',#8,#13]) then
      abort;
  end;
end;

procedure TfrmRFQInfo.AQDetailParam_ValueValidate(Sender: TField);
begin
  if ((AQDetailDATA_TYPE.Value = 1) and (AQDetailParam_Value.Value <> '')) then
  begin
    if not ((AQDetailmin_value.Value = 0) and (AQDetailmax_value.Value = 0)) then
    begin
      if ((Sender.Value < AQDetailmin_value.Value)
       Or (Sender.Value > AQDetailmax_value.Value)) then
      begin
        ShowMessage(Sender.Value+'您所输入的数据不在该参数限定的范围内('+
        FloatToStr(AQDetailmin_value.Value)+'~'+FloatToStr(AQDetailmax_value.Value)+'),请重新输入!');
        Abort;
      end;
    end;
  end;
end;

procedure TfrmRFQInfo.sbtnUpClick(Sender: TObject);
var
  i: Integer;
  setMark: string;
begin
  if not IdFTP1.Connected then ConnectFTP(IP,UID,PSW);
  if dlgUp.Execute then
  begin
    if ((ExtractFileName(dlgUp.FileName) <> edtFileName.Text) and
      (StringReplace(ExtractFileName(dlgUp.FileName),ExtractFileExt(dlgUp.FileName),'',[]) <> edtFileName.Text)) then
    begin
      ShowMessage('所上传的文件名与基本信息中的文件名不一致,'+#13+#13+'上传失败!');
      Abort;
    end;
    try
      for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
      begin
        if IdFTP1.DirectoryListing.Items[i].FileName = ExtractFileName(dlgUp.FileName) then
        begin
          setMark:= 'Find';
          Break;
        end;
      end;
      if setMark = 'Find' then
      begin
        if MessageDlg('该文件在FTP服务器上已存在,是否覆盖?',
                       mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
      end;
      IdFTP1.Put(dlgUp.FileName,ExtractFileName(dlgUp.FileName));  //上传
      vIsUP:= True;
      ShowMessage('文件上传成功!');
    except
      ShowMessage('文件上传失败!');
    end;
  end;
  IdFTP1.Disconnect;
end;

procedure TfrmRFQInfo.sbtnDownClick(Sender: TObject);
var
  i: integer;
  t: TIdFTPListItem;
  setMark: string;
begin
  if not IdFTP1.Connected then ConnectFTP(IP,UID,PSW);
  dlgDown.FileName:= edtFileName.Text;
  if dlgDown.Execute then
  begin
    IdFTP1.TransferType:= ftBinary;  //指定为二进制文件 或文本文件ftASCII
    for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
    begin
      t:= IdFTP1.DirectoryListing.Items[i];  //从当前目录下文件及列表得到文件相关信息
      if ((t.FileName = edtFileName.Text) or
          (StringReplace(ExtractFileName(t.FileName),ExtractFileExt(t.FileName),'',[]) = edtFileName.Text)) then
      begin
        setMark:= 'Find';
        try
          if IdFTP1.DirectoryListing.Items[i].ItemType = ditFile then  //如果是文件
          begin
            if FileExists(dlgDown.FileName) then
              if MessageDlg('该文件已存在,是否覆盖?',mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
            IdFTP1.Get(t.FileName,dlgDown.FileName,False,True);  //下载到本地,覆盖,支持断点续传
            if Pos('.',ExtractFileName(dlgDown.FileName))<=0 then
              RenameFile(dlgDown.FileName,dlgDown.FileName+ExtractFileExt(t.FileName) );//为下载的文件加上后缀
          end;
          ShowMessage('文件下载成功!');
        except
          ShowMessage('文件下载失败!');
        end;
        //Break;  //不同文件后缀需要多次下载
      end;
    end;
    if setMark <> 'Find' then
      ShowMessage('未找到您要下载的文件!');
  end;
  IdFTP1.Disconnect;
end;

procedure TfrmRFQInfo.sbtnSetLinkClick(Sender: TObject);
begin
  pnlSetFTPLink.Visible:= True;
  edtIP.Text:= IP;
  edtUID.Text:= UID;
  edtPSW.Text:= PSW;
end;

procedure TfrmRFQInfo.sbtnSaveClick(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  pnlSetFTPLink.Visible:= False;
  try
    MyIniFile:= TIniFile.Create(ExtractFilePath(ParamStr(0))+'RFQ_Link.ini');
    try
      MyIniFile.WriteString('FTP服务器','服务器IP',edtIP.Text);
      MyIniFile.WriteString('FTP服务器','用户名',edtUID.Text);
      MyIniFile.WriteString('FTP服务器','密码',Base64_Encode(edtPSW.Text));
      IP:= edtIP.Text;
      UID:= edtUID.Text;
      PSW:= edtPSW.Text;
    finally
      MyIniFile.Free;
    end;
    ShowMessage('设定参数成功!');
  except
    ShowMessage('设定参数失败!');
  end;
end;

procedure TfrmRFQInfo.sbtnCancelClick(Sender: TObject);
begin
  pnlSetFTPLink.Visible:= False;
end;

procedure TfrmRFQInfo.ConnectFTP(Host, UId, PSW: string);
var
  vList: TStrings;
begin
  try
    IdFTP1.Host := Host;  //FTP服务器地址
    IdFTP1.Username := UId;  //FTP服务器用户名
    IdFTP1.Password := PSW;  //FTP服务器密码
    IdFTP1.Connect();  //连接到ftp

    IdFTP1.ChangeDir('yfq_info');  //进入yfq_info子目录{初始目录IdFTP1.RetrieveCurrentDir}
    vList:= TStringList.Create;
    try
      IdFTP1.List(vList);  //得到yfq_info目录下所有文件列表
    finally
      vList.Free;
    end;
  except
    ShowMessage('连接FTP服务器失败!');
    Abort;
  end;
end;

procedure TfrmRFQInfo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if IsPost = 1 then Exit;
  if frmRFQ.YY <> 3 then
  begin
    if messagedlg('你确定不保存退出吗?', mtconfirmation, [mbyes, mbno],0) = mryes then
    begin
      if dm.AQMain.State in [dsInsert, dsEdit] then dm.AQMain.Cancel;
      if AQDetail.State in [dsInsert, dsEdit] then AQDetail.Cancel;
      self.ModalResult:= mrCancel;
    end
    else
      CanClose:= False;
  end;
end;

procedure TfrmRFQInfo.btnPrintClick(Sender: TObject);
begin
  with dm.AQPrint do
  begin
    Close;
    Parameters.ParamByName('RKEY165').Value:= dm.AQMain.FieldByName('RKEY').AsInteger;
    Open;
  end;
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'RFQInfo.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TfrmRFQInfo.ComboBox1DropDown(Sender: TObject);
begin
  with dm.AQ0193 do
  begin
    Close;
    Parameters[0].Value:= '';
    Parameters[1].Value:= '';
    Open;
    First;
    ComboBox1.Items.Clear;
    while not dm.AQ0193.Eof do
    begin
      ComboBox1.Items.Add(FieldByName('CODE').AsString+'_'+FieldByName('DESCRIPTION').AsString);
      Next;
    end;
  end;
end;

procedure TfrmRFQInfo.ComboBox1Click(Sender: TObject);
var
  iCODE: string;
begin
  if Pos('_',ComboBox1.Text)>0 then
    iCODE:= Copy(ComboBox1.Text,1,Pos('_',ComboBox1.Text)-1)
  else
    iCODE:= ComboBox1.Text;
  with dm.AQ0193 do
  begin
    Close;
    Parameters[0].Value:= iCODE;
    Parameters[1].Value:= iCODE;
    Open;
  end;
  dbmLayersInfo.Lines.Clear;
  dbmLayersInfo.Lines.Add(dm.AQ0193.FieldByName('layers_info').Value);
end;

procedure TfrmRFQInfo.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if AQDetail.FieldByName('MustInput').AsInteger = 1 then
    (Sender as TDBGridEh).Canvas.Font.Color:= clBlue;
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmRFQInfo.Image1DblClick(Sender: TObject);
var
  LIni: TIniFile;
  tmpS: string;
begin
  if not (frmRFQ.YY in[1,2]) then Abort;
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PinBan.ini');
  try
    LIni.EraseSection('SheetList');
    LIni.EraseSection('DefCutParam');
    LIni.EraseSection('CutRet');
    LIni.EraseSection('CutParam');
    if OpenQuery(DM.AQEmp,'select selected,Length,Width from data0503 order by rkey') then
    begin
      while not DM.AQEmp.Eof do
      begin
        tmpS := DM.AQEmp.FieldByName('Length').AsString + 'x'+ DM.AQEmp.FieldByName('width').AsString;
        if DM.AQEmp.FieldByName('selected').AsBoolean then
          tmpS := tmpS + 'sY'
        else
          tmpS := tmpS + 'sN';
        LIni.WriteString('SheetList',IntToStr(DM.AQEmp.RecNo),tmpS);
        DM.AQEmp.Next;
      end;
    end
    else
    begin
      ShowMessage('连接数据库失败');
      Exit;
    end;
    
    dm.AQEmp.Close;
    if OpenQuery(DM.AQEmp,'Select cut_unit_tp,cut_l1_max,cut_l1_min,cut_w1_max,cut_w1_min,cut_l2_max,cut_l2_min,cut_w2_max,cut_w2_min,SPACE_L_Min,SPACE_w_Min,border_l_min,border_w_min from data0192') then
    begin
      LIni.WriteString('DefCutParam','PnlMinW_A',DM.AQEmp.FieldByName('cut_l1_min').AsString);
      LIni.WriteString('DefCutParam','PnlMaxW_A',DM.AQEmp.FieldByName('cut_l1_max').AsString);
      LIni.WriteString('DefCutParam','PnlMinH_A',DM.AQEmp.FieldByName('cut_w1_min').AsString);
      LIni.WriteString('DefCutParam','PnlMaxH_A',DM.AQEmp.FieldByName('cut_w1_max').AsString);
      LIni.WriteString('DefCutParam','PnlBorderLeftRightW_A',DM.AQEmp.FieldByName('border_w_min').AsString);
      LIni.WriteString('DefCutParam','PnlBorderTopBottomW_A',DM.AQEmp.FieldByName('border_l_min').AsString);
      LIni.WriteString('DefCutParam','SetVerSpace_A',DM.AQEmp.FieldByName('space_w_min').AsString);
      LIni.WriteString('DefCutParam','SetHorSpace_A',DM.AQEmp.FieldByName('space_l_min').AsString);
    end
    else
    begin
      ShowMessage('连接数据库失败');
      Exit;
    end;

    dm.AQParamName.Locate('PARAMETER_DESC','SET长度',[loCaseInsensitive]);
    AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
    LIni.WriteString('DefCutParam','PnlSetW_A',AQDetailParam_Value.AsString);
    dm.AQParamName.Locate('PARAMETER_DESC','SET宽度',[loCaseInsensitive]);
    AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
    LIni.WriteString('DefCutParam','PnlSetH_A',AQDetailParam_Value.AsString);

    if (aq536.Fieldbyname('total_pnls_1').AsInteger > 0)  then
    begin
      LIni.WriteInteger('CutRet','HasRet',1);
      aq536sheet_BMP.SaveToFile(ExtractFilePath(ParamStr(0))+ 'SheetImg.JPG');
      LIni.WriteString('CutRet','SheetImg',ExtractFilePath(ParamStr(0))+ 'SheetImg.JPG');
      aq536pnl_bmp.SaveToFile(ExtractFilePath(ParamStr(0))+ 'PnlImg_A.JPG');
      LIni.WriteString('CutRet','PnlImg_A',ExtractFilePath(ParamStr(0))+ 'PnlImg_A.JPG');
      LIni.WriteString('CutRet','SheetW',aq536.Fieldbyname('sht_len').AsString);
      LIni.WriteString('CutRet','SheetH',aq536.Fieldbyname('sht_wth').AsString);
      LIni.WriteString('CutRet','PnlCount_A',aq536.Fieldbyname('total_pnls_1').AsString);
      LIni.WriteString('CutRet','PnlW_A',aq536.Fieldbyname('pnl_len').AsString);
      LIni.WriteString('CutRet','PnlH_A',aq536.Fieldbyname('pnl_wth').AsString);
      LIni.WriteString('CutRet','SetCountPerPnl_A',aq536.Fieldbyname('upanel').AsString);
      LIni.WriteString('CutRet','SetW_A',aq536.Fieldbyname('unit_len').AsString);
      LIni.WriteString('CutRet','SetH_A',aq536.Fieldbyname('unit_wth').AsString);
      LIni.WriteString('CutRet','SetHorSapce_A',aq536.Fieldbyname('minspace1').AsString);
      LIni.WriteString('CutRet','SetVerSapce_A',aq536.Fieldbyname('minspace2').AsString);
      LIni.WriteString('CutRet','PnlLeftRightBorderW_A',aq536.FieldByName('pnl_wthspace').AsString);
      LIni.WriteString('CutRet','PnlTopBottomBorderW_A',aq536.FieldByName('pnl_lenspace').AsString);
      LIni.WriteString('CutRet','SheetUseage',aq536.FieldByName('Tusage').AsString);
    end;
    if CallPCBCut then
    begin
      update_536;
      image1.Picture.Assign(Load_JPG_Pic_From_DB(aq536sheet_BMP));
    end;
  finally
    LIni.Free;
  end;

end;

procedure TfrmRFQInfo.update_536;
var LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PinBan.ini');
  try
    try
      if aq536.RecNo > 0 then aq536.Edit else aq536.Append;
      if frmRFQ.YY = 1 then
        aq536source_ptr.Value:= 0
      else
        aq536source_ptr.Value:= dm.AQMainRKEY.Value;
      aq536sheet_BMP.LoadFromFile(LIni.ReadString('CutRet','SheetImg',''));
      aq536pnl_bmp.LoadFromFile(LIni.ReadString('CutRet','PnlImg_A',''));
      if LIni.ReadString('CutRet','DoublePnl','') = '1' then
        aq536pnl2_bmp.LoadFromFile(LIni.ReadString('CutRet','PnlImg_B',''))
      else
        aq536pnl2_bmp.clear;
      aq536.Fieldbyname('unit_unit').asinteger := 0;                 //单位为mm
      aq536.Fieldbyname('minspace1').asString := LIni.ReadString('CutRet','SetHorSapce_A','0');
      aq536.Fieldbyname('minspace2').asString := LIni.ReadString('CutRet','SetVerSpace_A','0');
      aq536.FieldByName('pnl_lenspace').AsString := LIni.ReadString('CutRet','PnlTopBottomBorderW_A','0');
      aq536.FieldByName('pnl_wthspace').AsString := LIni.ReadString('CutRet','PnlLeftRightBorderW_A','0');
      aq536.Fieldbyname('upanel').AsString := LIni.ReadString('CutRet','SetCountPerPnl_A','0');
      aq536.Fieldbyname('total_pnls_1').AsString := LIni.ReadString('CutRet','PnlCount_A','0');
      aq536.Fieldbyname('upanel_2').AsString :=LIni.ReadString('CutRet','PnlBSetNum','0');
      aq536.Fieldbyname('total_pnls_2').asstring:=LIni.ReadString('CutRet','PnlBNum','0');
      aq536.Fieldbyname('pnl_len').AsString := LIni.ReadString('CutRet','PnlW_A','0');
      aq536.Fieldbyname('pnl_wth').AsString := LIni.ReadString('CutRet','PnlH_A','0');
      aq536.Fieldbyname('pnl_len_2').asstring:= LIni.ReadString('CutRet','PnlBW','0');
      aq536.Fieldbyname('pnl_wth_2').asstring:= LIni.ReadString('CutRet','PnlBH','0');
      aq536.Fieldbyname('unit_len').AsString:= LIni.ReadString('CutRet','SetW_A','0');
      aq536.Fieldbyname('unit_wth').AsString:= LIni.ReadString('CutRet','SetH_A','0');
      dm.AQParamName.Locate('PARAMETER_DESC','PCS/SET',[loCaseInsensitive]);
      AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
      aq536.Fieldbyname('unit_num').AsString:= AQDetailParam_Value.AsString;
      aq536.Fieldbyname('Tusage').AsString:= LIni.ReadString('CutRet','SheetUseage','0');
      aq536.Fieldbyname('sht_len').AsString:= LIni.ReadString('CutRet','SheetW','0');
      aq536.Fieldbyname('sht_wth').AsString:= LIni.ReadString('CutRet','SheetH','0');
      aq536.Post;
    except
      aq536.Cancel;
    end;
  finally
    LIni.Free;
  end;
end;

procedure TfrmRFQInfo.sbtnDeleteClick(Sender: TObject);
var
  i,j: Integer;
  setMark: string;
  FileNameList:TStringList;
begin
  if not IdFTP1.Connected then ConnectFTP(IP,UID,PSW);
  FileNameList:= TStringList.Create;
  try
    try
      for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
      begin
        if ((IdFTP1.DirectoryListing.Items[i].FileName = edtFileName.Text) or
          (StringReplace(ExtractFileName(IdFTP1.DirectoryListing.Items[i].FileName),ExtractFileExt(IdFTP1.DirectoryListing.Items[i].FileName),'',[]) = edtFileName.Text)) then
        begin
          setMark:= 'Find';
          FileNameList.Add(IdFTP1.DirectoryListing.Items[i].FileName);
          //Break;  //不同文件后缀需要多次删除
        end;
      end;
      if setMark = 'Find' then
      begin
        for j:= FileNameList.Count-1 downto 0 do
        begin
          IdFTP1.Delete(FileNameList.Strings[j]);  //删除
        end;
        vIsUP:= False;
        ShowMessage('文件删除成功!');
      end
      else
        ShowMessage('未找到该文件！');
    except
      ShowMessage('文件删除失败!');
    end;
  finally
    FileNameList.Free;
  end;
  IdFTP1.Disconnect;
end;

function TfrmRFQInfo.AutoCalc(var ErrMsg: string): Boolean;
var
  status: Boolean;
  v,v1,v2: Double;
begin
  status:= False;
  try
    if AQDetail.Filtered then
    begin
      AQDetail.Filtered:= False;
      status:= True;
    end;
    dm.AQParamName.Locate('PARAMETER_DESC','PCS/SET',[loCaseInsensitive]);
    AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
    v:= AQDetail.FieldByName('Param_Value').AsFloat;

    dm.AQParamName.Locate('PARAMETER_DESC','PCS孔数',[loCaseInsensitive]);
    AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
    v1:= AQDetail.FieldByName('Param_Value').AsFloat;

    dm.AQParamName.Locate('PARAMETER_DESC','PCS测试点数',[loCaseInsensitive]);
    AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
    v2:= AQDetail.FieldByName('Param_Value').AsFloat;

    dm.AQParamName.Locate('PARAMETER_DESC','SET孔数',[loCaseInsensitive]);
    AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
    if not(AQDetail.State in [dsInsert, dsEdit]) then AQDetail.Edit;
    AQDetail.FieldByName('Param_Value').AsString:= FloatToStr(v*v1);
    AQDetail.Post;
    
    dm.AQParamName.Locate('PARAMETER_DESC','SET测试点数',[loCaseInsensitive]);
    AQDetail.Locate('Param_ptr',dm.AQParamNameRKEY.Value,[]);
    if not(AQDetail.State in [dsInsert, dsEdit]) then AQDetail.Edit;
    AQDetail.FieldByName('Param_Value').AsString:= FloatToStr(v*v2);
    AQDetail.Post;

    if status then AQDetail.Filtered:= True;

    Result:= True;
  except
    on E:exception do
    begin
      Result:= False;
      ErrMsg:= E.Message;
      if status then AQDetail.Filtered:= True;      
    end;
  end;
end;

end.
