unit EditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmEdit = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnSave: TBitBtn;
    Label1: TLabel;
    edtExTernal_No: TEdit;
    Label2: TLabel;
    edtFacName: TEdit;
    Label3: TLabel;
    edtDeptName: TEdit;
    Label4: TLabel;
    edtSupplierRkey: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtRelPerson: TEdit;
    Label7: TLabel;
    edtRelPhone: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtPrice: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtBillKind: TEdit;
    Label14: TLabel;
    edtRecAddress: TEdit;
    Label15: TLabel;
    btnFacRkey: TBitBtn;
    btnDeptRkey: TBitBtn;
    btnSupplierRkey: TBitBtn;
    Label8: TLabel;
    mmoPayKindDesc: TMemo;
    mmoExTernal_Desc: TMemo;
    mmoRemark: TMemo;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label11: TLabel;
    edtPutIntoRkey: TEdit;
    btnPutIntoRkey: TBitBtn;
    lblOtherInfo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnFacRkeyClick(Sender: TObject);
    procedure btnDeptRkeyClick(Sender: TObject);
    procedure btnSupplierRkeyClick(Sender: TObject);
    procedure btnPutIntoRkeyClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtPriceKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEdit: TFrmEdit;

implementation

uses
  Damo, common, Pick_Item_Single, ConstVar;

{$R *.dfm}

procedure TFrmEdit.FormShow(Sender: TObject);
begin
  if DM.Ftag = 0 then  //新增状态
  begin
    DateTimePicker1.Date := Now;
    DateTimePicker2.Date := Now + 30;
    edtExTernal_No.Text := 'WF' + DateToStr(Now) + '_';
  end;
  if DM.Ftag in [1, 2] then  //修改状态
  begin
    if DM.Ftag = 2 then btnSave.Enabled := False;  //查看状态保存按钮不可用
    edtExTernal_No.Text := DM.qryMainExTernal_No.Value;
    edtFacName.Text := DM.qryMainWAREHOUSE_NAME.Value;
    btnFacRkey.Tag := DM.qryMainFacRkey.Value;
    edtDeptName.Text := DM.qryMainDept_Name.Value;
    btnDeptRkey.Tag := DM.qryMainDeptRkey.Value;
    edtSupplierRkey.Text := DM.qryMainSUPPLIER_NAME.Value;
    btnSupplierRkey.Tag := DM.qryMainSupplierRkey.Value;
    edtRecAddress.Text := DM.wdstrngfldMainRecAddress.Value;
    mmoExTernal_Desc.Text := DM.wdstrngfldMainExTernal_Desc.Value;
    mmoPayKindDesc.Text := DM.wdstrngfldMainPayKindDesc.Value;
    mmoRemark.Text := DM.wdstrngfldMainRemark.Value;
    DateTimePicker1.Date := DM.qryMainEnt_Date.Value;
    DateTimePicker2.Date := DM.qryMainFinishDate.Value;
    edtRelPerson.Text := DM.wdstrngfldMainRelPerson.Value;
    edtRelPhone.Text := DM.wdstrngfldMainRelPhone.Value;
    edtBillKind.Text := DM.wdstrngfldMainBillKind.Value;
    edtPrice.Text := DM.qryMainPrice.AsString;
    edtPutIntoRkey.Text := DM.qryMainCut_no.Value;
    btnPutIntoRkey.Tag := DM.qryMainPutIntoRkey.Value;
  end;
end;

procedure TFrmEdit.btnSaveClick(Sender: TObject);
begin
  if Trim(edtExTernal_No.Text) = '' then
  begin
    ShowMessage('外发编号不能为空！');
    edtExTernal_No.SetFocus;
    Exit;
  end;
  if Trim(edtFacName.Text) = '' then
  begin
    ShowMessage('工厂不能为空！');
    edtFacName.SetFocus;
    Exit;
  end;
  if Trim(edtDeptName.Text) = '' then
  begin
    ShowMessage('部门不能为空！');
    edtDeptName.SetFocus;
    Exit;
  end;
  if Trim(edtSupplierRkey.Text) = '' then
  begin
    ShowMessage('外发供应商不能为空！');
    edtSupplierRkey.SetFocus;
    Exit;
  end;
  if Trim(edtPutIntoRkey.Text) = '' then
  begin
    ShowMessage('生产单号不能为空！');
    edtPutIntoRkey.SetFocus;
    Exit;
  end;
  if Trim(edtPrice.Text) = '' then
  begin
    ShowMessage('外发价格不能为空！');
    edtPrice.SetFocus;
    Exit;
  end;
  with DM.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select Max(FG_DATE) FG_DATE from data0444';
    Open;
    if DateTimePicker1.Date < FieldByName('FG_DATE').AsDateTime then
    begin
      ShowMessage('当前申请日期小于最后一次截数日期，无法保存...');
      Exit;
    end;
  end;
  with DM.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select ISSUE_DATE from data0492 where rkey=' + IntToStr(btnPutIntoRkey.Tag);
    Open;
    if DateTimePicker1.DateTime < FieldByName('ISSUE_DATE').AsDateTime then
    begin
      ShowMessage('投产日期小于外发申请日期，请检查...');
      Exit;
    end;
  end;

  DM.qryWZCP0088.Close;
  if DM.Ftag = 1 then DM.qryWZCP0088.Parameters.ParamByName('Rkey88').Value := DM.qryMainrkey.Value;
  DM.qryWZCP0088.Open;
  if DM.Ftag = 0 then DM.qryWZCP0088.Append;
  if DM.Ftag = 1 then DM.qryWZCP0088.Edit;

  with DM.qryWZCP0088 do
  begin
    FieldByName('ExTernal_No').Value := Trim(edtExTernal_No.Text);
    FieldByName('ExTernal_Desc').Value := Trim(mmoExTernal_Desc.Text);
    FieldByName('Price').Value := StrToFloat(edtPrice.Text);
    FieldByName('Ent_Date').Value := DateTimePicker1.Date;
    FieldByName('Ent_UserRkey').Value := StrToInt(user_ptr);
    FieldByName('FacRkey').Value := btnFacRkey.Tag;
    FieldByName('DeptRkey').Value := btnDeptRkey.Tag;
    FieldByName('SupplierRkey').Value := btnSupplierRkey.Tag;
    FieldByName('RelPerson').Value := Trim(edtRelPerson.Text);
    FieldByName('RelPhone').Value := Trim(edtRelPhone.Text);
    FieldByName('BillKind').Value := Trim(edtBillKind.Text);
    FieldByName('PayKindDesc').Value := Trim(mmoPayKindDesc.Text);
    FieldByName('RecAddress').Value := Trim(edtRecAddress.Text);
    FieldByName('FinishDate').Value := DateTimePicker2.Date;
    FieldByName('Remark').Value := Trim(mmoRemark.Text);
    FieldByName('PutIntoRkey').Value := btnPutIntoRkey.Tag;
    Post;
    Requery();
    ShowMessage('保存成功！');
    ModalResult := mrOk;
  end;
end;

procedure TFrmEdit.btnFacRkeyClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/300,';
  InputVar.Sqlstr := 'select Rkey, WAREHOUSE_CODE, WAREHOUSE_NAME, ENG_NAME, ABBR_NAME from data0015';
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtFacName.Text := trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME']);
      btnFacRkey.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmEdit.btnDeptRkeyClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'dept_code/部门代码/100,dept_name/部门名称/300,';
  InputVar.Sqlstr := 'select Rkey, dept_code, dept_name from data0034 where dept_code in '
      + ' (''05'',''07'',''21'',''37'') ';
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtDeptName.Text := trim(frmPick_Item_Single.adsPick.FieldValues['dept_name']);
      btnDeptRkey.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmEdit.btnSupplierRkeyClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'code/供应商代码/150,supplier_name/供应商名称/250,';
  InputVar.Sqlstr := 'select rkey, code, supplier_name, ABBR_NAME, Billing_address_1, ANALYSIS_CODE1, Contact_name_1, cont_phone_1 from data0023';
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtSupplierRkey.Text := trim(frmPick_Item_Single.adsPick.FieldValues['supplier_name']);
      btnSupplierRkey.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
      if not frmPick_Item_Single.adsPick.FieldByName('Billing_address_1').IsNull then
        edtRecAddress.Text :=  trim(frmPick_Item_Single.adsPick.FieldValues['Billing_address_1']);
      if not frmPick_Item_Single.adsPick.FieldByName('ANALYSIS_CODE1').IsNull then
        edtBillKind.Text := trim(frmPick_Item_Single.adsPick.FieldValues['ANALYSIS_CODE1']);
      if not frmPick_Item_Single.adsPick.FieldByName('Contact_name_1').IsNull then
        edtRelPerson.Text := trim(frmPick_Item_Single.adsPick.FieldValues['Contact_name_1']);
      if not frmPick_Item_Single.adsPick.FieldByName('cont_phone_1').IsNull then
        edtRelPhone.Text := trim(frmPick_Item_Single.adsPick.FieldValues['cont_phone_1']);
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmEdit.btnPutIntoRkeyClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'CUT_NO/生产单号/100,PROD_CODE/产品编码/100,PRODUCT_NAME/产品名称/150,';
  InputVar.Sqlstr := 'select data0492.rkey, CUT_NO, SO_NO, data0008.PROD_CODE, data0008.PRODUCT_NAME from data0492 '
    + ' inner join data0008 on data0492.BOM_PTR=data0008.rkey'
    + ' where data0492.tstatus in (0,2)';
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtPutIntoRkey.Text := trim(frmPick_Item_Single.adsPick.FieldValues['CUT_NO']);
      btnPutIntoRkey.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
      lblOtherInfo.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']) + ', '
        + trim(frmPick_Item_Single.adsPick.FieldValues['PRODUCT_NAME']);
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmEdit.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEdit.edtPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '.', #8, #13]) then
  begin
    Key := #0;
    ShowMessage('只能输入数字');
  end;

  if (Pos( '.',edtPrice.Text) <> 0) and (Key = '.') then
  begin
    Key := #0;
    MessageBeep(1);
  end;
end;

end.
