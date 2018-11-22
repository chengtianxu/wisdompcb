unit INVTMFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, RzRadChk, RzDBChk,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.ExtCtrls, RzPanel,
  RzRadGrp, Vcl.Buttons, RzCmboBx, Data.DB, Datasnap.DBClient, Vcl.DBCtrls,uBaseFrm;

type
  TfrmINVTM_Mod29 = class(TfrmBase)
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    rgRule: TRzRadioGroup;
    cbxRoSH: TRzComboBox;
    rkyUnit: TRKeyRzBtnEdit;
    rkySupplier: TRKeyRzBtnEdit;
    rkyQuan: TRKeyRzBtnEdit;
    rkyTaxRate: TRKeyRzBtnEdit;
    Label21: TLabel;
    btnCommit: TBitBtn;
    btnCancel: TBitBtn;
    rkyINVTM: TRKeyRzBtnEdit;
    Label22: TLabel;
    Label23: TLabel;
    rkyDesc: TRKeyRzBtnEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    rkyReqNo: TRKeyRzBtnEdit;
    rkyUser: TRKeyRzBtnEdit;
    rkyDepName: TRKeyRzBtnEdit;
    cds72: TClientDataSet;
    ds72: TDataSource;
    Label1: TLabel;
    edtBatch: TEdit;
    edtDays: TEdit;
    cbxFactory: TRzComboBox;
    edtDate: TEdit;
    Label28: TLabel;
    cbxType: TComboBox;
    Label4: TLabel;
    rkyReason: TRKeyRzBtnEdit;
    chkIF_urgency: TDBCheckBox;
    edtTax: TEdit;
    edtUnTax: TEdit;
    procedure btnCommitClick(Sender: TObject);
    procedure edtBatchKeyPress(Sender: TObject; var Key: Char);
    procedure edtBatchExit(Sender: TObject);
    procedure rkyQuanKeyPress(Sender: TObject; var Key: Char);
    procedure edtDateExit(Sender: TObject);
    procedure rkySupplierButtonClick(Sender: TObject);
    procedure edtTaxExit(Sender: TObject);
    procedure edtTaxKeyPress(Sender: TObject; var Key: Char);
    procedure rkyQuanExit(Sender: TObject);
    procedure rkySupplierExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }      //vmi_vfrom 为vmi价格取向  //edit_type 0表示新增   1表示编辑
    New_Type,Edit_Type,CURRENCY_PTR,VMI_VFrom:Integer;    //new_Type   0表示全新新增   1表示带供应商的新增
    InvtType,VMI:string;   //InvtType   S表示编码物料  M表示非编码物料

    procedure GetData(ARkey72:string);
//    procedure Append28To17(ACds:TClientDataSet);
    procedure Init_Data();
    procedure add72();
    procedure LoadData();
    procedure Init_UI();
end;

var
  frmINVTM_Mod29: TfrmINVTM_Mod29;

implementation

uses uBaseSinglePickListFrm,uCommFunc,SupplierFrm_Mod29;

{$R *.dfm}

procedure TfrmINVTM_Mod29.add72;
begin
  cds72.Append;
  cds72.FieldByName('QUAN_ORD').Value := 0.00;
  cds72.FieldByName('QUAN_INVD').Value := 0.00;
  cds72.FieldByName('QUAN_RETN').Value := 0.00;
  cds72.FieldByName('QUANTITY_RECEIVED').Value := 0.00;
  cds72.FieldByName('STATE_TAX').Value := 0.00;
  cds72.FieldByName('UNIT_PRICE').Value:= 0.000000;
  cds72.FieldByName('tax_price').Value := 0.0000;
  cds72.FieldByName('IF_urgency').Value := 0;
  cds72.Post;
end;

procedure TfrmINVTM_Mod29.btnCommitClick(Sender: TObject);
begin
  if Trim(rkyINVTM.Text) = '' then
  begin
    ShowMessage('材料名称不能为空！');
    rkyINVTM.SetFocus;
    Exit;
  end;
  if Trim(rkyDesc.Text) = '' then
  begin
    ShowMessage('材料规格不能为空');
    rkyDesc.SetFocus;
    Exit;
  end;
  if cbxType.ItemIndex = -1 then
  begin
    ShowMessage('材料类别不能为空');
    cbxType.SetFocus;
    Exit;
  end;
  if Trim(rkyUnit.Text) = '' then
  begin
    ShowMessage('单位不能为空');
    rkyUnit.SetFocus;
    Exit;
  end;

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
  if StrToFloat(Trim(rkyQuan.Text)) <= 0 then
  begin
    ShowMessage('输入数量不正确！');
    rkyQuan.SetFocus;
    Exit;
  end;
  cds72.Edit;
  cds72.FieldByName('UNIT_PRICE').Value:= StrToFloat(Trim(edtUnTax.Text));
  cds72.FieldByName('tax_price').Value:=  StrToFloat(Trim(edtTax.Text));
  cds72.Post;
  ModalResult:= mrOk;
end;

procedure TfrmINVTM_Mod29.edtBatchExit(Sender: TObject);
begin
  if StrToInt(Trim(edtBatch.Text)) > 1  then edtDays.ReadOnly:= False;
end;

procedure TfrmINVTM_Mod29.edtBatchKeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key,['0'..'9',#8,#13]) then   Abort;  //判断是否输入数字
end;

procedure TfrmINVTM_Mod29.edtDateExit(Sender: TObject);
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

procedure TfrmINVTM_Mod29.edtTaxExit(Sender: TObject);
begin
  if Trim(edtTax.Text) = '' then edtTax.Text := '0';
  edtTax.Text:= FormatFloat('0.0000',StrToFloat(Trim(edtTax.Text)));
  edtUnTax.Text:= FormatFloat('0.000000'
          ,StrToFloat(Trim(edtTax.Text)) / ( 1 + cds72.FieldByName('STATE_TAX').Value * 0.01));
end;

procedure TfrmINVTM_Mod29.edtTaxKeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',edtTax.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmINVTM_Mod29.GetData(ARkey72:string);
var
  LSql:string;
begin
  LSql:= cds72.CommandText + ' WHERE DATA0072.RKEY = ' + ARkey72;

  gSvrIntf.IntfGetDataBySql(LSql,cds72);
end;

procedure TfrmINVTM_Mod29.Init_Data;
var
  LSql,LSql75:string;
  LCds,LCds75:TClientDataSet;
begin
  if Edit_Type = 0 then     //新增时加载交货日期
    edtDate.Text:= gFunc.DateTimeToStr(gFunc.GetSvrDateTime);
  LSql:= ' SELECT RKEY,WAREHOUSE_CODE,abbr_name,WAREHOUSE_NAME FROM data0015 ORDER BY WAREHOUSE_CODE' ;
  LSql75:= 'SELECT * FROM Data0075 order by DESCRIPTION';
  LCds:= TClientDataSet.Create(Self);
  LCds75:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql75]),[LCds,LCds75]) then Exit;
    if not LCds.IsEmpty then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        cbxFactory.Items.AddObject(Trim(LCds.FieldByName('WAREHOUSE_NAME').AsString),
              Pointer(LCds.FieldByName('rkey').AsInteger));
        LCds.Next;
      end;
    end;
    if not LCds75.IsEmpty then
    begin
      LCds75.First;
      while not LCds75.Eof do
      begin
        cbxType.Items.AddObject(Trim(LCds75.FieldByName('DESCRIPTION').AsString),
              Pointer(LCds75.FieldByName('rkey').AsInteger));
        LCds75.Next;
      end;
    end;
  finally
    LCds.Free;
    LCds75.Free;
  end;
end;

procedure TfrmINVTM_Mod29.Init_UI;
var
  i:Integer;
begin
  if Edit_Type = 0 then     //新增时加载交货日期
  begin
    edtDate.Text:= gFunc.DateTimeToStr(gFunc.GetSvrDateTime);
    Label25.Visible:=False;
    Label26.Visible:=False;
    Label27.Visible:=False;
    Label4.Visible:=False;
    rkyDepName.Visible:=False;
    rkyReqNo.Visible:=False;
    rkyUser.Visible:=False;
    rkyReason.Visible:=False;
    if New_Type = 1 then
    begin

      rkySupplier.Enabled:= False;
      cbxFactory.Enabled:=False;
      rgRule.Enabled:= False;
    end;
  end
  else
  begin
    Label12.Visible:=False;
    Label14.Visible:=False;
    label15.Visible:=False;
    edtBatch.Visible:=False;
    edtDays.Visible:=False;
    rkySupplier.Enabled:= False;
    cbxFactory.Enabled:=False;
    rgRule.Enabled:= False;
    if Edit_Type = 2 then
    begin
      for i:=0 to ControlCount-1 do              //遍历控件设置成只读
        if Controls[i] is TRKeyRzBtnEdit then
          (Controls[i] as TRKeyRzBtnEdit).Enabled:=False;
      edtDate.Enabled:= False;
      cbxType.Enabled:= False;
      chkIF_urgency.Enabled:= False;
      cbxRoSH.Enabled:= False;
      edtTax.Enabled:= False;
      btnCommit.Enabled:= False;
    end;
    rkySupplier.DisplayNoteField:= 'SUPPLIER_NAME';
  end;
end;

procedure TfrmINVTM_Mod29.LoadData;
var
  i:Integer;
  LSql:string;
  LCds:TClientDataSet;
begin
  if cds72.FieldByName('rkey204').AsInteger > 0 then
  begin
    LSql:=  'SELECT  dbo.Data0068.PO_REQ_NUMBER, dbo.Data0005.EMPLOYEE_NAME ' + #13+
            '      , dbo.Data0034.DEPT_NAME '+ #13+
            'FROM    dbo.Data0068 INNER JOIN '+  #13+
            '  dbo.Data0204 ON dbo.Data0068.RKEY = dbo.data0204.PURCHASE_REQ_PTR INNER JOIN'+ #13+
            '  dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY INNER JOIN'+  #13+
            '  dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE'+  #13+
            ' where data0204.rkey = ' + cds72.FieldByName('rkey204').AsString;
    LCds:= TClientDataSet.Create(Self);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        rkyReqNo.Text:= LCds.FieldByName('PO_REQ_NUMBER').AsString;
        rkyDepName.Text:= LCds.FieldByName('DEPT_NAME').AsString;
        rkyUser.Text:= LCds.FieldByName('EMPLOYEE_NAME').AsString;
      end;
    finally
      LCds.Free;
    end;
  end;

  for i := 0 to cbxFactory.Items.Count-1 do
    if cds72.FieldByName('WAREHOUSE_POINTER').AsInteger =
          Integer(cbxFactory.Items.Objects[i]) then cbxFactory.ItemIndex:= i;

  cbxType.ItemIndex:= cbxType.Items.IndexOf(Trim(cds72.FieldByName('DESCRIPTION2').AsString));
  cbxRoSH.ItemIndex:= cbxRoSH.Items.IndexOf(Trim(cds72.FieldByName('rohs').AsString));

  edtDate.Text:= cds72.FieldByName('DEL_DATE').AsString;
  edtUnTax.Text := FormatFloat('0.000000',cds72.FieldByName('UNIT_PRICE').Value);
  edtTax.Text := FormatFloat('0.0000',cds72.FieldByName('tax_price').Value);
end;

procedure TfrmINVTM_Mod29.rkyQuanExit(Sender: TObject);
var
  LTmp:Double;
begin
  inherited;
  if Trim(rkyQuan.Text) = '' then rkyQuan.Text:= '0';
  if TryStrToFloat(Trim(rkyQuan.Text),LTmp) then rkyQuan.Text:= FormatFloat('0.0000',LTmp);
end;

procedure TfrmINVTM_Mod29.rkyQuanKeyPress(Sender: TObject; var Key: Char);
begin
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',rkyQuan.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmINVTM_Mod29.rkySupplierButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  LFrm:= TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(29,StrToInt(rkySupplier.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds72.Edit;
      cds72.FieldByName('SUPPLIER_POINTER').Value := LFrm.cdsPick.FieldByName('RKEY').Value;
      cds72.Post;
      CURRENCY_PTR:= LFrm.cdsPick.FieldByName('CURRENCY_PTR').AsInteger;
      VMI:= LFrm.cdsPick.FieldByName('EDI_OUT_NEW_PO').AsString;
      VMI_VFrom:= LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_PO').AsInteger;
    end;
  finally
    LFrm.Free;
  end;
end;


procedure TfrmINVTM_Mod29.rkySupplierExit(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if CURRENCY_PTR = 0 then
  begin
    LSql:= 'SELECT CURRENCY_PTR FROM  Data0023 where rkey=' + cds72.FieldByName('SUPPLIER_POINTER').AsString;
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

//
//procedure TfrmINVTM_Mod29.Append28To17(ACds:TClientDataSet);
//begin
//  cdsINVT.Edit;
//
////  cdsINVT.FieldByName('SUPPLIER_PART_NO').Value := ACds.FieldByName('SUPPLIER_PART_NO').Value; //供应商材料型号（特殊要求）
////  cdsINVT.FieldByName('prot_report_ptr').Value := ACds.FieldByName('prot_report_ptr').Value;  //805环保测试报告指针
//
//  cdsINVT.FieldByName('extra_req').Value := ACds.FieldByName('SUPPLIER_PART_NO').Value; //特殊要求
//  cdsINVT.FieldByName('IF_CAF').Value := ACds.FieldByName('IF_CAF').Value;//耐CAF
//  cdsINVT.FieldByName('rohs').Value := ACds.FieldByName('rohs').Value;
//  cdsINVT.FieldByName('PURCHASE_UNIT_PTR').Value := ACds.FieldByName('PURCHASE_UNIT_PTR').Value; //28-02采购单位
//  cdsINVT.FieldByName('CONVERSION_FACTOR').Value := ACds.FieldByName('CONVERSION_FACTOR').Value;//转换率
//  cdsINVT.FieldByName('TAX_2').Value := ACds.FieldByName('TAX_2').Value; //增值税率
////  if cdsINVT.FieldByName('PREF_SUPPLIER_PTR').AsInteger =0 then
//    cdsINVT.FieldByName('PREF_SUPPLIER_PTR').Value := ACds.FieldByName('RKEY').Value;       //把供应商写入首选供应商（借存）
//  if cdsINVT.FieldByName('TAX_2').Value = 0 then
//  begin
//     cdsINVT.FieldByName('PRICE').Value:= FormatFloat('0.000000', ACds.FieldByName('PRICE_1').Value); //不含税单价
//     cdsINVT.FieldByName('tax_price').Value:= FormatFloat('0.0000',ACds.FieldByName('PRICE_1').Value); //含税单价
//  end
//  else if ACds.FieldByName('tax_flag').Value = 'N' then
//  begin
//     cdsINVT.FieldByName('PRICE').Value:= FormatFloat('0.000000', ACds.FieldByName('PRICE_1').Value);
//     cdsINVT.FieldByName('tax_price').Value:= FormatFloat('0.0000',ACds.FieldByName('PRICE_1').Value *
//            ( 1 + cdsINVT.FieldByName('TAX_2').Value*0.01));
//  end
//  else
//  begin
//     cdsINVT.FieldByName('tax_price').Value:= FormatFloat('0.0000', ACds.FieldByName('PRICE_1').Value);
//     cdsINVT.FieldByName('PRICE').Value:= FormatFloat('0.000000',ACds.FieldByName('PRICE_1').Value /
//            ( 1 + cdsINVT.FieldByName('TAX_2').Value*0.01));
//  end;
//  cdsINVT.Post;
//end;

end.
