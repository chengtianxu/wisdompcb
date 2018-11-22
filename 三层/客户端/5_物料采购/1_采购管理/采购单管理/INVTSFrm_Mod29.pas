unit INVTSFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, RzRadChk, RzDBChk,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.ExtCtrls, RzPanel,
  RzRadGrp, Vcl.Buttons, RzCmboBx, Data.DB, Datasnap.DBClient, Vcl.DBCtrls,uBaseFrm;

type
  TfrmINVTS_Mod29 = class(TfrmBase)
    rkyINVT: TRKeyRzBtnEdit;
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
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    rgRule: TRzRadioGroup;
    btnStore: TBitBtn;
    rkyMax: TRKeyRzBtnEdit;
    rkySafe: TRKeyRzBtnEdit;
    rkyExtra: TRKeyRzBtnEdit;
    cbxRoSH: TRzComboBox;
    rkyUnit: TRKeyRzBtnEdit;
    rkyCAF: TRKeyRzBtnEdit;
    rkySupplier: TRKeyRzBtnEdit;
    rkyQuan: TRKeyRzBtnEdit;
    rkyIMP: TRKeyRzBtnEdit;
    rkyTaxRate: TRKeyRzBtnEdit;
    rkyExChang: TRKeyRzBtnEdit;
    rkyIQC: TRKeyRzBtnEdit;
    Label21: TLabel;
    btnCommit: TBitBtn;
    btnCancel: TBitBtn;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    rkyUnit2: TRKeyRzBtnEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    rkyReqNo: TRKeyRzBtnEdit;
    rkyUser: TRKeyRzBtnEdit;
    rkyDepName: TRKeyRzBtnEdit;
    cdsINVT: TClientDataSet;
    dsINVT: TDataSource;
    Label1: TLabel;
    edtBatch: TEdit;
    edtDays: TEdit;
    cbxFactory: TRzComboBox;
    edtDate: TEdit;
    btnSupplier: TBitBtn;
    dbchk1: TDBCheckBox;
    rkyReason: TRKeyRzBtnEdit;
    Label28: TLabel;
    Label29: TLabel;
    btn1: TBitBtn;
    btnOldPrice: TBitBtn;
    edtUnTax: TEdit;
    edtTax: TEdit;
    edtDesc: TEdit;
    cdsINVTINV_PART_NUMBER: TStringField;
    cdsINVTCRITICAL_MATL_FLAG: TSmallintField;
    cdsINVTCATALOG_NUM: TStringField;
    cdsINVTREPORT_VALUE2: TFloatField;
    cdsINVTCONSIGN_ONHAND_QTY: TFloatField;
    cdsINVTINV_NAME: TStringField;
    cdsINVTINV_PART_DESCRIPTION: TStringField;
    cdsINVTPREF_SUPPLIER_PTR: TIntegerField;
    cdsINVTINV_DESCRIPTION: TStringField;
    cdsINVTINVT_PTR: TIntegerField;
    cdsINVTPRICE: TFMTBCDField;
    cdsINVTtax_price: TBCDField;
    cdsINVTTAX_2: TBCDField;
    cdsINVTWO_PTR: TIntegerField;
    cdsINVTPURCHASE_UNIT_PTR: TIntegerField;
    cdsINVTCONVERSION_FACTOR: TFloatField;
    cdsINVTextra_req: TStringField;
    cdsINVTREQ_DATE: TDateTimeField;
    cdsINVTrohs: TStringField;
    cdsINVTIF_CAF: TWideStringField;
    cdsINVTrkey69: TIntegerField;
    cdsINVTIF_urgency: TBooleanField;
    cdsINVTQUAN_ORD: TBCDField;
    cdsINVTSUPPLIER_POINTER: TIntegerField;
    cdsINVTWAREHOUSE_POINTER: TIntegerField;
    cdsINVTreason: TStringField;
    cdsINVTANALYSIS_CODE_2: TStringField;
    procedure rkyINVTButtonClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure rkyQuanKeyPress(Sender: TObject; var Key: Char);
    procedure edtBatchKeyPress(Sender: TObject; var Key: Char);
    procedure edtBatchExit(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure btnStoreClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnOldPriceClick(Sender: TObject);
    procedure rkySupplierDataFieldValueChange(AOldValue, ANewValue: Variant);
    procedure edtUnTaxKeyPress(Sender: TObject; var Key: Char);
    procedure edtTaxExit(Sender: TObject);
    procedure edtUnTaxExit(Sender: TObject);
    procedure rkyINVTExit(Sender: TObject);
    procedure rkyQuanExit(Sender: TObject);
    procedure rkySupplierExit(Sender: TObject);
  private
    { Private declarations }
    LOldPrice:Double;
    LTax_Flag:string;
    function GetInvtType(ARkey:string):string;
    function CheckIQC(ARkey:string):Boolean;

  public
    { Public declarations }      //vmi_vfrom 为vmi价格取向  //edit_type 0表示新增   1表示编辑   2检查
    New_Type,Edit_Type,CURRENCY_PTR,VMI_VFrom:Integer;    //new_Type   0表示全新新增   1表示带供应商的新增
    VMI,Supplier:string;   //InvtType   S表示编码物料  M表示非编码物料

    procedure GetData(ARkey71:string);
    procedure GetSupp_Inf(AType:Integer;ASupp,AINVT:string;APreSupp:string = '');
    procedure Append28To71(ACds:TClientDataSet);
    procedure Init_UI();
    procedure LoadFactory();
    procedure Append71();
    procedure LoadData();
end;

var
  frmINVTS_Mod29: TfrmINVTS_Mod29;

implementation

uses uBaseSinglePickListFrm,uCommFunc,SupplierFrm_Mod29, CommFrm_Mod29;

{$R *.dfm}

procedure TfrmINVTS_Mod29.Append71;
begin
  cdsINVT.Append;
  cdsINVT.FieldByName('QUAN_ORD').Value := 0.00;
  cdsINVT.FieldByName('TAX_2').Value := 0.00;
  cdsINVT.FieldByName('CONVERSION_FACTOR').Value := 1;
  cdsINVT.FieldByName('PRICE').Value:= 0.000000;
  cdsINVT.FieldByName('tax_price').Value := 0.0000;
  cdsINVT.FieldByName('IF_urgency').Value := 0;
  cdsINVT.Post;
end;

procedure TfrmINVTS_Mod29.btn1Click(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  if cdsINVT.FieldByName('INVT_PTR').AsInteger = 0 then
  begin
    ShowMessage('请先选择材料！');
    Exit;
  end;
  try
    LFrm.Caption:= '在途查询';
    LFrm.GetData(cdsINVT.FieldByName('INVT_PTR').AsString,2);     //在途查询
    if LFrm.cds1.IsEmpty then
    begin
      ShowMessage('没有在途');
      Exit;
    end;
    LFrm.InitCds();
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmINVTS_Mod29.btnCommitClick(Sender: TObject);
begin
  if cbxFactory.ItemIndex = -1 then
  begin
    ShowMessage('请输入工厂');
    cbxFactory.SetFocus;
    Exit;
  end;
  if Trim(rkySupplier.Text) = '' then
  begin
    ShowMessage('供应商不能为空');
    rkySupplier.SetFocus;
    Exit;
  end;
  if (Edit_Type = 0) and (gFunc.StrToDateTime(Trim(edtDate.Text))
            < gFunc.StrToDateTime(FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime))) then
  begin
    ShowMessage('交货日期不能小于当前时间！');
    edtDate.SetFocus;
    exit;
  end;
  if StrToFloat(Trim(rkyQuan.Text)) <= 0 then
  begin
    ShowMessage('输入数量不正确！');
    rkyQuan.SetFocus;
    Exit;
  end;
  if (Edit_Type = 0) and (Trim(rkyIQC.Text) = 'Y') then
  begin
    if (rkyIQC.Tag = 0 ) or CheckIQC(IntToStr(rkyIQC.Tag))  then
    begin
      ShowMessage('供应商没有环保认可或者认可资料过期,请检查!');
      Exit;
    end;
  end;
  cdsINVT.Edit;
  cdsINVT.FieldByName('price').Value:= StrToFloat(Trim(edtUnTax.Text));
  cdsINVT.FieldByName('tax_price').Value:=StrToFloat(Trim(edtTax.Text));;
  cdsINVT.Post;
  ModalResult:= mrOk;
end;

procedure TfrmINVTS_Mod29.btnOldPriceClick(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  if cdsINVT.FieldByName('INVT_PTR').AsInteger = 0 then
  begin
    ShowMessage('请先选择材料！');
    Exit;
  end;
  try
    LFrm.Caption:= '历史价格';
    LFrm.GetData(cdsINVT.FieldByName('INVT_PTR').AsString,3);     //历史价格
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

procedure TfrmINVTS_Mod29.btnStoreClick(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  if cdsINVT.FieldByName('INVT_PTR').AsInteger = 0 then
  begin
    ShowMessage('请先选择材料！');
    Exit;
  end;

  try
    LFrm.Caption:= '库存查询';
    LFrm.GetData(cdsINVT.FieldByName('INVT_PTR').AsString,1);     //库存查询
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

procedure TfrmINVTS_Mod29.btnSupplierClick(Sender: TObject);
var
  LFrm: TfrmSupplier_Mode29;
begin
  if cdsINVT.FieldByName('INVT_PTR').AsInteger = 0 then
  begin
    ShowMessage('请先选择材料！');
    Exit;
  end;
  LFrm:= TfrmSupplier_Mode29.Create(Self);
  try
    LFrm.GetData(cdsINVT.FieldByName('INVT_PTR').AsString);
    LFrm.Init_UI;
    if LFrm.ShowModal = mrOk then
    begin
      Append28To71(LFrm.cds23);
    end;
  finally
    LFrm.Free;
  end;
end;

function TfrmINVTS_Mod29.CheckIQC(ARkey: string): Boolean;
var
  LSql:string;
  LCds:TClientDataSet;
begin
  Result:= False;
  LSql:= 'select rkey,Model from data0805 where (rkey=' + ARkey +')'+ #13+
             ' and ((Status=3) and (EffeDate>=convert(datetime,(convert(varchar,getdate(),101)),101))'+ #13+
             ' or (TemporBy=1) and (TemporTo>=convert(datetime,(convert(varchar,getdate(),101)),101)))';
  LCds:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then Result:= True;
  finally
    LCds.Free;
  end;
end;

procedure TfrmINVTS_Mod29.edtBatchExit(Sender: TObject);
begin
  if StrToInt(Trim(edtBatch.Text)) > 1  then edtDays.Enabled:= True;
end;

procedure TfrmINVTS_Mod29.edtBatchKeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key,['0'..'9',#8,#13]) then   Abort;  //判断是否输入数字
end;

procedure TfrmINVTS_Mod29.edtDateExit(Sender: TObject);
var
  LTmp:TDateTime;
begin
  if not TryStrToDateTime(Trim(edtDate.Text),LTmp) then
  begin
    ShowMessage('日期格式不对！应如：2016-09-01 08:00:00');
    edtDate.SetFocus;
    Exit;
  end;
end;

procedure TfrmINVTS_Mod29.edtTaxExit(Sender: TObject);
begin
  if Trim(edtTax.Text) = '' then edtTax.Text := '0';

  edtTax.Text:= FormatFloat('0.0000',StrToFloat(Trim(edtTax.Text)));
  edtUnTax.Text:= FormatFloat('0.000000'
          ,StrToFloat(Trim(edtTax.Text)) / ( 1 + cdsINVT.FieldByName('TAX_2').Value * 0.01));

  if Edit_Type = 1 then
  begin
    if LTax_Flag = 'N' then
    begin
      if (StrToFloat(Trim(edtUnTax.Text)) - LOldPrice > 0.01) and (ActiveControl.Name <> 'btnCancel') then
      begin
        ShowMessage('价格只能改小不能改大！');
        edtUnTax.SetFocus;
        Exit;
      end;
    end
    else
    begin
      if (StrToFloat(Trim(edtTax.Text)) - LOldPrice > 0.01 ) and (ActiveControl.Name <> 'btnCancel') then
      begin
        ShowMessage('价格只能改小不能改大！');
        edtTax.SetFocus;
        Exit;
      end;
    end;
  end
  else
  begin
    if (StrToFloat(Trim(edtTax.Text)) - LOldPrice > 0.01) and (ActiveControl.Name <> 'btnCancel') then
    begin
      ShowMessage('价格只能改小不能改大！');
      edtTax.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmINVTS_Mod29.edtUnTaxExit(Sender: TObject);
begin
  if Trim(edtUnTax.Text) = '' then edtTax.Text := '0';

  edtUnTax.Text:= FormatFloat('0.000000',StrToFloat(Trim(edtUnTax.Text)));
  edtTax.Text:= FormatFloat('0.0000'
          ,StrToFloat(Trim(edtUnTax.Text)) * ( 1 + cdsINVT.FieldByName('TAX_2').Value * 0.01));

  if Edit_Type = 1 then
  begin
    if LTax_Flag = 'N' then
    begin
      if (StrToFloat(Trim(edtUnTax.Text)) - LOldPrice > 0.01) and (ActiveControl.Name <> 'btnCancel') then
      begin
        ShowMessage('价格只能改小不能改大！');
        edtUnTax.SetFocus;
        Exit;
      end;
    end
    else
    begin
      if (StrToFloat(Trim(edtTax.Text)) - LOldPrice > 0.01) and (ActiveControl.Name <> 'btnCancel') then
      begin
        ShowMessage('价格只能改小不能改大！');
        edtUnTax.SetFocus;
        Exit;
      end;
    end;
  end
  else
  begin
    if (StrToFloat(Trim(edtTax.Text)) - LOldPrice > 0.01) and (ActiveControl.Name <> 'btnCancel') then
    begin
      ShowMessage('价格只能改小不能改大！');
      edtUnTax.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmINVTS_Mod29.edtUnTaxKeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',(Sender as TEdit).Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmINVTS_Mod29.GetData(ARkey71:string);
var
  LSql:string;
begin
  LSql:= cdsINVT.CommandText + '  WHERE	dbo.Data0071.RKEY = ' + ARkey71;
  if not gSvrIntf.IntfGetDataBySql(LSql,cdsINVT) then Exit;
end;

function TfrmINVTS_Mod29.GetInvtType(ARkey: string): string;
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

procedure TfrmINVTS_Mod29.GetSupp_Inf(AType:Integer;ASupp,AINVT: string;APreSupp:string = '');
var
  LSql:string;
  LCds:TClientDataSet;
begin
  LSql:= ' SELECT     dbo.Data0028.SUPPLIER_PTR, dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME  '+#13+
       '         , dbo.Data0028.prot_report_ptr, dbo.Data0028.AVL_FLAG, dbo.Data0023.RKEY    '+#13+
       '         ,dbo.Data0028.PURCHASE_UNIT_PTR, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME   '+#13+
       '        , dbo.Data0028.CURRENCY_PTR, dbo.Data0001.CURR_CODE,dbo.Data0001.CURR_NAME   '+#13+
       '         , dbo.Data0028.CONVERSION_FACTOR, dbo.Data0028.TAX_2, dbo.Data0028.tax_flag  '+#13+
       '         , dbo.Data0028.PRICE_1, dbo.Data0028.rohs,dbo.Data0023.EDI_OUT_NEW_PO   '+#13+
       '         , dbo.Data0023.EDI_FLAG_FOR_PO, dbo.Data0028.SUPPLIER_PART_NO, dbo.Data0028.IF_CAF   '+#13+
       '   FROM         dbo.Data0028 INNER JOIN  '+#13+
       '                 dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN   '+#13+
       '                 dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN   '+#13+
       '                 dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY  '+#13+
       '   WHERE     (dbo.Data0028.AVL_FLAG = ''Y'') AND (dbo.Data0023.status = 0)  '+#13+
       '         AND dbo.Data0028.INVENTORY_PTR = ' + AINVT ;
   if AType = 1 then LSql:= LSql + ' AND dbo.data0028.SUPPLIER_PTR = ' + ASupp;   //编辑情况下
   LCds:= TClientDataSet.Create(Self);
   try
     gSvrIntf.IntfGetDataBySql(LSql,LCds);
     if LCds.IsEmpty then
     begin
       MessageDlg('材料未定义供应商价格',mtinformation,[mbcancel],0);
       rkyINVT.SetFocus;
       cdsINVT.Delete;
       edtDesc.Text:='';
     end
     else              //定义了价格
     begin
       if LCds.RecordCount = 1 then Append28To71(LCds)
       else if (APreSupp <> '') then
       begin
         if LCds.Locate('SUPPLIER_PTR',APreSupp,[]) then //如果存在首选供应商，先定位
            Append28To71(LCds);       //加载供应商价格信息
       end;
     end;
   finally
     Lcds.Free;
   end;
end;

procedure TfrmINVTS_Mod29.Init_UI;
var
  i:Integer;
begin
  if Edit_Type = 0 then     //新增时加载交货日期
  begin
    edtDate.Text:= gFunc.DateTimeToStr(gFunc.GetSvrDateTime);
    Label25.Visible:=False;
    Label26.Visible:=False;
    Label27.Visible:=False;
    Label28.Visible:=False;
    rkyReqNo.Visible:=False;
    rkyDepName.Visible:=False;
    rkyUser.Visible:=False;
    rkyReason.Visible:=False;
    rkySupplier.DisplayNoteField:= '';
    if New_Type = 1 then
    begin
      rkySupplier.Enabled:= False;
      btnSupplier.Visible:= False;
      cbxFactory.Enabled:=False;
      rgRule.ReadOnly:= True;
    end;
  end
  else
  begin
    for i:=0 to ControlCount-1 do              //遍历控件设置成只读
      if Controls[i] is TRKeyRzBtnEdit then
        (Controls[i] as TRKeyRzBtnEdit).Enabled:=False;

    btnSupplier.Visible:=False;
    Label12.Visible:=False;
    Label14.Visible:=False;
    label15.Visible:=False;
    edtBatch.Visible:=False;
    edtDays.Visible:=False;
    cbxFactory.ReadOnly:=True;
    rgRule.ReadOnly:= True;
    edtDate.Enabled:= False;
    edtTax.Enabled:= False;
    dbchk1.Enabled:=False;
    btnCommit.Enabled:= False;
    rkySupplier.DisplayNoteField:= 'SUPPLIER_NAME';
    if Edit_Type = 1 then
    begin
      rkyExtra.Enabled:=True;
      rkyUnit.Enabled:=True;
      rkyQuan.Enabled:=True;
      edtDate.Enabled:= True;
      edtUnTax.Enabled:=True;
      edtTax.Enabled:=True;
      rkyReason.Enabled:= True;
      dbchk1.Enabled:=True;
      btnCommit.Enabled:= True;
    end;
  end;
end;

procedure TfrmINVTS_Mod29.LoadData;
var
  i:Integer;
  LSql:string;
  LCds:TClientDataSet;
begin
  if cdsINVT.FieldByName('CRITICAL_MATL_FLAG').Value = 1 then rkyIMP.Text:= '是'
  else rkyIMP.Text:= '否';

  for i := 0 to cbxRoSH.Items.Count do
    if cbxRoSH.Items[i] = cdsINVT.FieldByName('rohs').Value then  cbxRoSH.ItemIndex := i;

  LCds:= TClientDataSet.Create(Self);
  try
    LSql:= 'SELECT PRICE_1,TAX_FLAG FROM DATA0028 WHERE SUPPLIER_PTR='
            + cdsINVT.FieldByName('SUPPLIER_POINTER').AsString +
           ' AND INVENTORY_PTR= ' + cdsINVT.FieldByName('INVT_PTR').AsString;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      LOldPrice:= LCds.FieldByName('PRICE_1').Value;
      LTax_Flag:= LCds.FieldByName('TAX_FLAG').Value;
    end
    else
    begin
      LOldPrice:= cdsINVT.FieldByName('PRICE').Value;
      LTax_Flag:= 'N';
    end;

    if cdsINVT.FieldByName('rkey69').AsInteger > 0 then
    begin
      LSql:=  'SELECT  dbo.Data0068.PO_REQ_NUMBER, dbo.Data0005.EMPLOYEE_NAME ' + #13+
              '      , dbo.Data0034.DEPT_NAME,dbo.data0069.reason '+ #13+
              'FROM    dbo.Data0068 INNER JOIN '+  #13+
              '  dbo.Data0069 ON dbo.Data0068.RKEY = dbo.data0069.PURCH_REQ_PTR INNER JOIN'+ #13+
              '  dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY INNER JOIN'+  #13+
              '  dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE'+  #13+
              ' where data0069.rkey = ' + cdsINVT.FieldByName('rkey69').AsString;

        if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
        if not LCds.IsEmpty then
        begin
          rkyReqNo.Text:= LCds.FieldByName('PO_REQ_NUMBER').AsString;
          rkyDepName.Text:= LCds.FieldByName('DEPT_NAME').AsString;
          rkyUser.Text:= LCds.FieldByName('EMPLOYEE_NAME').AsString;
  //        rkyReason.Text:= LCds.FieldByName('reason').AsString;
        end;
    end;
  finally
    LCds.Free;
  end;

  for i := 0 to cbxFactory.Items.Count-1 do
    if cdsINVT.FieldByName('WAREHOUSE_POINTER').AsInteger =
          Integer(cbxFactory.Items.Objects[i]) then
      cbxFactory.ItemIndex:= i;
  edtDate.Text:= cdsINVT.FieldByName('REQ_DATE').AsString;
  edtUnTax.Text:= FormatFloat('0.000000',cdsINVT.FieldByName('price').Value);
  edtTax.Text:= FormatFloat('0.0000',cdsINVT.FieldByName('tax_price').Value);
end;

procedure TfrmINVTS_Mod29.LoadFactory;
var
  LSql:string;
  LCds:TClientDataSet;
begin
  LSql:= ' SELECT RKEY,WAREHOUSE_CODE,abbr_name,WAREHOUSE_NAME FROM data0015 ORDER BY WAREHOUSE_CODE' ;
  LCds:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        cbxFactory.Items.AddObject(LCds.FieldByName('WAREHOUSE_NAME').AsString,
              Pointer(LCds.FieldByName('rkey').AsInteger));
        LCds.Next;
      end;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmINVTS_Mod29.Append28To71(ACds:TClientDataSet);
begin
  cdsINVT.Edit;
  cdsINVT.FieldByName('extra_req').Value := ACds.FieldByName('SUPPLIER_PART_NO').Value; //特殊要求
  cdsINVT.FieldByName('IF_CAF').Value := ACds.FieldByName('IF_CAF').Value;//耐CAF
  cdsINVT.FieldByName('rohs').Value := ACds.FieldByName('rohs').Value;
  cdsINVT.FieldByName('PURCHASE_UNIT_PTR').Value := ACds.FieldByName('PURCHASE_UNIT_PTR').Value; //28-02采购单位
  cdsINVT.FieldByName('CONVERSION_FACTOR').Value := ACds.FieldByName('CONVERSION_FACTOR').Value;//转换率
  cdsINVT.FieldByName('TAX_2').Value := ACds.FieldByName('TAX_2').Value; //增值税率
  if New_Type = 0 then
    cdsINVT.FieldByName('SUPPLIER_POINTER').Value := ACds.FieldByName('RKEY').Value;
  if cdsINVT.FieldByName('TAX_2').Value = 0 then
  begin
     cdsINVT.FieldByName('PRICE').Value:= FormatFloat('0.000000', ACds.FieldByName('PRICE_1').Value); //不含税单价
     cdsINVT.FieldByName('tax_price').Value:= FormatFloat('0.0000',ACds.FieldByName('PRICE_1').Value); //含税单价
     LOldPrice:=  ACds.FieldByName('PRICE_1').Value;
  end
  else if ACds.FieldByName('tax_flag').Value = 'N' then
  begin
     cdsINVT.FieldByName('PRICE').Value:= FormatFloat('0.000000', ACds.FieldByName('PRICE_1').Value);
     cdsINVT.FieldByName('tax_price').Value:= FormatFloat('0.0000',ACds.FieldByName('PRICE_1').Value *
            ( 1 + cdsINVT.FieldByName('TAX_2').Value*0.01));
     LOldPrice:=  cdsINVT.FieldByName('tax_price').Value;
  end
  else
  begin
     cdsINVT.FieldByName('tax_price').Value:= FormatFloat('0.0000', ACds.FieldByName('PRICE_1').Value);
     cdsINVT.FieldByName('PRICE').Value:= FormatFloat('0.000000',ACds.FieldByName('PRICE_1').Value /
            ( 1 + cdsINVT.FieldByName('TAX_2').Value*0.01));
     LOldPrice:= cdsINVT.FieldByName('tax_price').Value;
  end;
  cdsINVT.Post;
  Label29.Caption:= ACds.FieldByName('SUPPLIER_NAME').AsString;
  if New_Type = 1 then rkySupplier.DisplayNoteLabel.Visible:= False;

  CURRENCY_PTR:= ACds.FieldByName('CURRENCY_PTR').Value;//货币指针
  LTax_Flag:= ACds.FieldByName('tax_flag').AsString;
  if ACds.FieldByName('EDI_OUT_NEW_PO').Value = 1 then VMI:= 'Y'//是否VMI
  else VMI:='N';
  VMI_VFrom:= ACds.FieldByName('EDI_FLAG_FOR_PO').Value;//VMI取值
  edtuntax.Text:= cdsINVT.FieldByName('PRICE').AsString;
  edttax.Text:= cdsINVT.FieldByName('tax_price').AsString;
  rkyiqc.Tag:= ACds.FieldByName('prot_report_ptr').AsInteger;
end;

procedure TfrmINVTS_Mod29.rkyINVTButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
  i:Integer;
begin
  LFrm:= TfrmSinglePickList.Create(Self);
  try
    if New_Type =0  then
    begin
      if Trim(rkyINVT.Text) = '' then LFrm.InitWithPickID(29,8, ' ORDER BY Data0017.INV_PART_NUMBER')
      else  LFrm.InitWithPickID(29,8,' and dbo.Data0017.INV_PART_NUMBER like ''%'
          + Trim(rkyINVT.Text) + '%''  ORDER BY Data0017.INV_PART_NUMBER');
    end
    else
    begin
      if Trim(rkyINVT.Text) = '' then
        LFrm.InitWithPickID(29,9,'  WHERE (dbo.Data0017.STOP_PURCH = ''N'') ' +
        ' AND (dbo.Data0028.AVL_FLAG = ''Y'') and data0028.supplier_ptr= ' +
        cdsINVT.FieldByName('SUPPLIER_POINTER').AsString + ' ORDER BY Data0017.INV_PART_NUMBER')
      else
        LFrm.InitWithPickID(29,9,'  WHERE (dbo.Data0017.STOP_PURCH = ''N'') ' +
        ' AND (dbo.Data0028.AVL_FLAG = ''Y'') and data0028.supplier_ptr= ' +
        cdsINVT.FieldByName('SUPPLIER_POINTER').AsString + ' AND dbo.Data0017.INV_PART_NUMBER like ''%'
          + Trim(rkyINVT.Text) + '%''  ORDER BY Data0017.INV_PART_NUMBER');
    end;
    if LFrm.ShowModal = mrOk then
    begin
//      cdsINVT.FieldByName('INV_PART_DESCRIPTION').ReadOnly:=False;

      cdsINVT.Edit;
      cdsINVT.FieldByName('INVT_PTR').Value := LFrm.cdsPick.FieldByName('RKEY').Value;
      cdsINVT.FieldByName('INV_PART_NUMBER').Value := LFrm.cdsPick.FieldByName('INV_PART_NUMBER').Value; //材料编码
      cdsINVT.FieldByName('INV_NAME').Value := LFrm.cdsPick.FieldByName('INV_NAME').Value;
//      cdsINVT.FieldByName('INV_PART_DESCRIPTION').Value := LFrm.cdsPick.FieldByName('INV_PART_DESCRIPTION').Value; //材料描述
      cdsINVT.FieldByName('REPORT_VALUE2').Value := LFrm.cdsPick.FieldByName('REPORT_VALUE2').Value; //最高库存
      cdsINVT.FieldByName('CONSIGN_ONHAND_QTY').Value := LFrm.cdsPick.FieldByName('CONSIGN_ONHAND_QTY').Value; //安全库存
      cdsINVT.FieldByName('PREF_SUPPLIER_PTR').Value := LFrm.cdsPick.FieldByName('PREF_SUPPLIER_PTR').Value;//首选供应商
      cdsINVT.FieldByName('CRITICAL_MATL_FLAG').Value := LFrm.cdsPick.FieldByName('CRITICAL_MATL_FLAG').Value; //重要标识
      cdsINVT.FieldByName('CATALOG_NUM').Value := LFrm.cdsPick.FieldByName('CATALOG_NUM').Value; //是否需要环保认可
      cdsINVT.FieldByName('WO_PTR').Value := LFrm.cdsPick.FieldByName('STOCK_UNIT_PTR').Value; //存货单位
      cdsINVT.FieldByName('AVL_FLAG').Value := LFrm.cdsPick.FieldByName('INSPECT').Value;   //是否需要iqc检查
      cdsINVT.FieldByName('ANALYSIS_CODE_2').Value := GetInvtType(LFrm.cdsPick.FieldByName('RKEY').AsString);    //物料类别
      cdsINVT.Post;
      edtDesc.Text:= LFrm.cdsPick.FieldByName('INV_PART_DESCRIPTION').AsString;
      if New_Type = 0 then  GetSupp_Inf(New_Type,cdsINVT.FieldByName('SUPPLIER_POINTER').AsString
                  ,cdsINVT.FieldByName('INVT_PTR').AsString
                  ,cdsINVT.FieldByName('PREF_SUPPLIER_PTR').AsString)    //取得供应商价格排程信息
      else Append28To71(LFrm.cdsPick);

      if cdsINVT.FieldByName('CRITICAL_MATL_FLAG').Value = 1 then rkyIMP.Text:= '是'
      else rkyIMP.Text:= '否';

      for i := 0 to cbxRoSH.Items.Count do
        if cbxRoSH.Items[i] = cdsINVT.FieldByName('rohs').Value then  cbxRoSH.ItemIndex := i;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmINVTS_Mod29.rkyINVTExit(Sender: TObject);
var
  LSql:string;
  LCds,LCds2:TClientDataSet;
  i:Integer;
begin
  if ActiveControl.Name = 'btnCancel'  then Exit;
  inherited;
  LSql:= ' Select * FROM  dbo.Tier3_PickList WHERE modid=29 and (PickID = 8 or PickID = 9)';
  LCds:= TClientDataSet.Create(Self);
  LCds2:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if New_Type =0  then
    begin
      LCds.Locate('PickID',8,[]);
      LSql:= LCds.FieldByName('PickSql').AsString + ' and dbo.Data0017.INV_PART_NUMBER = '
      + QuotedStr(Trim(rkyINVT.Text))
    end
    else
    begin
      LCds.Locate('PickID',9,[]);
      LSql:= LCds.FieldByName('PickSql').AsString + '  WHERE (dbo.Data0017.STOP_PURCH = ''N'') ' +
        ' AND (dbo.Data0028.AVL_FLAG = ''Y'') and data0028.supplier_ptr= ' +
        cdsINVT.FieldByName('SUPPLIER_POINTER').AsString + ' AND dbo.Data0017.INV_PART_NUMBER = '
          + QuotedStr(Trim(rkyINVT.Text)) ;
    end;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds2) then exit;
    if not LCds2.IsEmpty then
    begin
      cdsINVT.Edit;
      cdsINVT.FieldByName('INVT_PTR').Value := LCds2.FieldByName('RKEY').Value;
      cdsINVT.FieldByName('INV_PART_NUMBER').Value := LCds2.FieldByName('INV_PART_NUMBER').Value; //材料编码
      cdsINVT.FieldByName('INV_NAME').Value := LCds2.FieldByName('INV_NAME').Value;
//      cdsINVT.FieldByName('INV_PART_DESCRIPTION').Value := LFrm.cdsPick.FieldByName('INV_PART_DESCRIPTION').Value; //材料描述
      cdsINVT.FieldByName('REPORT_VALUE2').Value := LCds2.FieldByName('REPORT_VALUE2').Value; //最高库存
      cdsINVT.FieldByName('CONSIGN_ONHAND_QTY').Value := LCds2.FieldByName('CONSIGN_ONHAND_QTY').Value; //安全库存
      cdsINVT.FieldByName('PREF_SUPPLIER_PTR').Value := LCds2.FieldByName('PREF_SUPPLIER_PTR').Value;//首选供应商
      cdsINVT.FieldByName('CRITICAL_MATL_FLAG').Value := LCds2.FieldByName('CRITICAL_MATL_FLAG').Value; //重要标识
      cdsINVT.FieldByName('CATALOG_NUM').Value := LCds2.FieldByName('CATALOG_NUM').Value; //是否需要环保认可
      cdsINVT.FieldByName('WO_PTR').Value := LCds2.FieldByName('STOCK_UNIT_PTR').Value; //存货单位
      cdsINVT.FieldByName('AVL_FLAG').Value := LCds2.FieldByName('INSPECT').Value;   //是否需要iqc检查
      cdsINVT.FieldByName('ANALYSIS_CODE_2').Value := GetInvtType(LCds2.FieldByName('RKEY').AsString);    //物料类别
      cdsINVT.Post;
      edtDesc.Text:= LCds2.FieldByName('INV_PART_DESCRIPTION').AsString;
      if New_Type = 0 then  GetSupp_Inf(New_Type,cdsINVT.FieldByName('SUPPLIER_POINTER').AsString
                  ,cdsINVT.FieldByName('INVT_PTR').AsString
                  ,cdsINVT.FieldByName('PREF_SUPPLIER_PTR').AsString)    //取得供应商价格排程信息
      else Append28To71(LCds2);

      if cdsINVT.FieldByName('CRITICAL_MATL_FLAG').Value = 1 then rkyIMP.Text:= '是'
      else rkyIMP.Text:= '否';

      for i := 0 to cbxRoSH.Items.Count do
        if cbxRoSH.Items[i] = cdsINVT.FieldByName('rohs').Value then  cbxRoSH.ItemIndex := i;
    end
    else
    begin
      ShowMessage('材料编码不正确,请重新输入或选择!');
      exit;
    end;
  finally
    LCds.Free;
    LCds2.Free;
  end;
end;

procedure TfrmINVTS_Mod29.rkyQuanExit(Sender: TObject);
begin
  inherited;
  if Trim(rkyQuan.Text) = '' then rkyQuan.Text:= '0';
end;

procedure TfrmINVTS_Mod29.rkyQuanKeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',rkyQuan.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmINVTS_Mod29.rkySupplierDataFieldValueChange(AOldValue,
  ANewValue: Variant);
begin
  Label29.Caption:= rkySupplier.DisplayNoteLabel.Caption;
end;

procedure TfrmINVTS_Mod29.rkySupplierExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if CURRENCY_PTR = 0 then
  begin
    LSql:= 'SELECT CURRENCY_PTR FROM  Data0023 where rkey=' + cdsINVT.FieldByName('SUPPLIER_POINTER').AsString;
    LCds:= TClientDataSet.Create(nil);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        CURRENCY_PTR:= LCds.FieldByName('CURRENCY_PTR').Value;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

end.
