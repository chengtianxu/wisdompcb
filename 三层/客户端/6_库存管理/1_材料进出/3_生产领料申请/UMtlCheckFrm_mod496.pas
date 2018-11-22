unit UMtlCheckFrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, Vcl.ExtCtrls, Vcl.Mask,
  RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Datasnap.DBClient, uCommFunc, System.DateUtils, System.StrUtils;

type
  TfrmMtlCheck = class;
  TFrmCallBack_Mod496 = procedure(AFrm: TfrmMtlCheck) of object;

  TfrmMtlCheck = class(TfrmBase)
    pnl1: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    grp2: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl8: TLabel;
    cbb_BZ: TComboBox;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    edt_AQty: TEdit;
    edt_GQty: TEdit;
    edt_SQty: TEdit;
    edt_CQty: TEdit;
    edt_phone_ProdNo: TRKeyRzBtnEdit;
    edt_ProdDesc: TRKeyRzBtnEdit;
    edt_UnitName: TRKeyRzBtnEdit;
    edt_vendor: TRKeyRzBtnEdit;
    edt_StockQty: TRKeyRzBtnEdit;
    cds468_Sel: TClientDataSet;
    ds468_Sel: TDataSource;
    mmo_remark: TMemo;
    edt_ReqQty: TRKeyRzBtnEdit;
    edt_ProdNo: TRKeyRzBtnEdit;
    procedure edt_phone_ProdNoButtonClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbb_BZChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_ProdNoButtonClick(Sender: TObject);
    procedure edt_ReqQtyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
    FParentCallBack: TFrmCallBack_Mod496;
    dept_ptr, wh_ptr: integer;
    Frkey17: string;
    ReqDate: TDateTime;
    procedure getdata;
    function GetContrlName(contrl_ptr: integer): string;
  end;

var
  frmMtlCheck: TfrmMtlCheck;

implementation

uses
  uBaseSinglePickListFrm, USelMtrlFrm_mod496;
{$R *.dfm}

procedure TfrmMtlCheck.btnOKClick(Sender: TObject);
begin
  inherited;

    if Trim(edt_ReqQty.Text) = '' then
  begin
    ShowMessage('请输入申领数量!');
    edt_ReqQty.SetFocus;
    exit;
  end;

  if StrToFloat(Trim(edt_ReqQty.Text))<0 then
  begin
  showmessage('申请数量不能为负数!');
  exit;
  end;



  if (Trim(cbb_BZ.Text) = '') and (cbb_BZ.items.count > 0) then
  begin
    ShowMessage('请选择领料标准!');
    cbb_BZ.SetFocus;
    exit;
  end;

  if   Trim(edt_StockQty.Text)<>'' then
  if StrToFloat(Trim(edt_ReqQty.Text)) > StrToFloat(Trim(edt_StockQty.Text))
  then
  begin
    ShowMessage('申领数量不能大于现有库存!');
    edt_ReqQty.SetFocus;
    exit;
  end;

   if FrmSelMaterial_mod496 = nil then
    begin
      FrmSelMaterial_mod496 := TFrmSelMaterial_mod496.Create(application);
      FrmSelMaterial_mod496.InitWithPickID(496, 5, Frkey17);
    end;

   if FrmSelMaterial_mod496.cdsPick.RecordCount>0 then
    FrmSelMaterial_mod496.cdsPick.delete;


  if Assigned(FParentCallBack) then
    FParentCallBack(Self);

end;

procedure TfrmMtlCheck.cbb_BZChange(Sender: TObject);
var
  AParamArr: OleVariant;
  cdsTemp: TClientDataSet;
begin
  inherited;

  if Trim(cbb_BZ.Text) = '' then
    exit;

  if Copy(cbb_BZ.Text, 0, 1) = 'V' then exit;

  cdsTemp := TClientDataSet.Create(nil);
  try
    try
      cds468_Sel.edit;
      cds468_Sel.FieldByName('control_ptr').value := cbb_BZ.Tag;
      cds468_Sel.FieldByName('control_name').value := GetContrlName(cbb_BZ.Tag);
      cds468_Sel.FieldByName('standards').value := cbb_BZ.Text;

      cds468_Sel.post;

      // 取得数量：
      if (Trim(cbb_BZ.Text) <> '') and (Copy(cbb_BZ.Text, 0, 1) <> 'V') and
        (Copy(cbb_BZ.Text, 0, 1) <> 'X') then
      begin

        AParamArr := varArrayCreate([0, 5], varVariant);
        AParamArr[0] := Copy(cbb_BZ.Text, 0, 1);
        AParamArr[1] := wh_ptr;
        AParamArr[2] := cbb_BZ.Tag;
        AParamArr[3] := dept_ptr;
        AParamArr[4] := ReqDate;
        AParamArr[5] := 0;
        if gSvrIntf.IntfspGetData('sp_GetEveryQty_3', AParamArr, cdsTemp) then
        begin
          edt_AQty.Text := cdsTemp.FieldByName('AllQty').value;
          edt_GQty.Text := cdsTemp.FieldByName('GetQty').value;
          edt_CQty.Text := cdsTemp.FieldByName('QCQty').value;
          // mmo_remark.Text:=cdsTemp.FieldByName('smessage').value;
        end;

        if cdsTemp.FieldByName('AllQty').value - cdsTemp.FieldByName('GetQty')
          .value < 0 then
          edt_SQty.Text := '0'
        else
          edt_SQty.Text := floatToStr(cdsTemp.FieldByName('AllQty').value -
            cdsTemp.FieldByName('GetQty').value);

        edt_ReqQty.SetFocus;
      end;
    except
      on e: Exception do
      begin
        ShowMessage('错误：' );
        exit;
      end;
    end;
  finally
    cdsTemp.Free;
  end;
end;

procedure TfrmMtlCheck.edt_phone_ProdNoButtonClick(Sender: TObject);
var
  // LFrm: TfrmSinglePickList;
  ssql, ssql2: string;
  AParamArr: OleVariant;
  cds136, cds589, cdsSP: TClientDataSet;
  // s:string;
begin
  // inherited;
  cds136 := TClientDataSet.Create(nil);
  cds589 := TClientDataSet.Create(nil);
  cdsSP := TClientDataSet.Create(nil);
  try
    if FrmSelMaterial_mod496 = nil then
    begin
      FrmSelMaterial_mod496 := TFrmSelMaterial_mod496.Create(self);
      FrmSelMaterial_mod496.InitWithPickID(496, 5, Frkey17);
    end;
    try
      if FrmSelMaterial_mod496.showmodal = mrok then
      begin

        // 取出物料对应的领料控制标准
        ssql := '  select    c.rkey,c.control_name, case when isfreq=1  then 1 else 0 end as ''1'', '
          + ' case when isMCount=1  then 2 else 0 end as ''2'',   ' +
          ' case when IsSTime=1  then 3 else 0 end as ''3'',  ' +
          ' case when IsFactor=1  then 4 else 0 end as ''4'',  ' +
          ' case when IsFormula=1  then 5 else 0 end as ''5''  ' +
          ' from  data0017 a                             ' +
          ' left join data0155 b  on a.rkey=invt_ptr     ' +
          ' left join data0136 c on b.control_ptr =c.rkey    ' +
          ' where a.rkey= ' +
          IntToStr(FrmSelMaterial_mod496.cdsPick.FieldByName('Rkey').AsInteger)
          + ' and c.DeptID_P= ' + IntToStr(dept_ptr) + ' ' +
          '  and c.warehouse_ptr=' + IntToStr(wh_ptr) + '  ';
        // showmessage(ssql);

        if not gSvrIntf.IntfGetDataBySql(ssql, cds136) then
        begin
          ShowMessage('取数据出错!');
          exit;
        end;

        ssql2 := 'select * from data0589 where fac_ptr=' + IntToStr(wh_ptr) +
          '  and cost_ptr=' + IntToStr(dept_ptr) + '';
        gSvrIntf.IntfGetDataBySql(ssql2, cds589);

        cbb_BZ.Text := '';
        cbb_BZ.items.clear;
        cbb_BZ.itemindex := -1;
        cbb_BZ.hint := '';
        cbb_BZ.Tag := 0;

        if (not cds136.isempty) then // 有标准
        begin

          cbb_BZ.Tag := cds136.FieldByName('rkey').AsInteger;

          if cds136.FieldByName('1').AsInteger = 1 then
          begin
            cbb_BZ.items.AddObject('1.按保养频率;', TObject(1));

          end;
          if cds136.FieldByName('2').AsInteger = 2 then
          begin
            cbb_BZ.items.AddObject('2.按员工人数;', TObject(2));

          end;
          if cds136.FieldByName('3').AsInteger = 3 then
          begin
            cbb_BZ.items.AddObject('3.按固定时间;', TObject(3));

          end;
          if cds136.FieldByName('4').AsInteger = 4 then
          begin
            cbb_BZ.items.AddObject('4.按生产因素;', TObject(4));

          end;
          if cds136.FieldByName('5').AsInteger = 5 then
          begin
            cbb_BZ.items.AddObject('5.按公式;', TObject(5));

          end;

          if cbb_BZ.items.count = 1 then
          begin
            cds468_Sel.edit;
            cds468_Sel.FieldByName('control_ptr').value := cbb_BZ.Tag;
            cds468_Sel.FieldByName('control_name').value :=
              GetContrlName(cbb_BZ.Tag);
            cds468_Sel.post;

            cbb_BZ.itemindex := 0;

            AParamArr := varArrayCreate([0, 5], varVariant);
            AParamArr[0] := Copy(cbb_BZ.Text, 0, 1);
            AParamArr[1] := wh_ptr;
            AParamArr[2] := cbb_BZ.Tag;
            AParamArr[3] := dept_ptr;
            AParamArr[4] := ReqDate;
            AParamArr[5] := 0;
            if gSvrIntf.IntfspGetData('sp_GetEveryQty_3', AParamArr, cdsSP) then
            begin
              edt_AQty.Text := cdsSP.FieldByName('AllQty').value;
              edt_GQty.Text := cdsSP.FieldByName('GetQty').value;
              edt_CQty.Text := cdsSP.FieldByName('QCQty').value;
            end;

            if cdsSP.FieldByName('AllQty').value - cdsSP.FieldByName('GetQty')
              .value < 0 then
              edt_SQty.Text := '0'
            else
              edt_SQty.Text := floatToStr(cdsSP.FieldByName('AllQty').value -
                cdsSP.FieldByName('GetQty').value);

          end
          else
            cbb_BZ.itemindex := -1;
        end
        else
        begin
          cbb_BZ.items.AddObject('V无领料标准;', TObject(0));
          cbb_BZ.itemindex := 0;

        end;

        edt_StockQty.Text := FrmSelMaterial_mod496.cdsPick.FieldByName
          ('qty').asstring;

        cds468_Sel.FieldByName('PRINTIT_S').ReadOnly := False;
        cds468_Sel.FieldByName('rkey17').ReadOnly := False;
        cds468_Sel.FieldByName('INV_PART_DESCRIPTION').ReadOnly := False;

        cds468_Sel.Append;
        cds468_Sel.FieldByName('rkey17').AsInteger :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('Rkey').AsInteger;
        cds468_Sel.FieldByName('INVENT_PTR').AsInteger :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('Rkey').AsInteger;
        cds468_Sel.FieldByName('inv_part_number').asstring :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('INV_PART_NUMBER').asstring;
        cds468_Sel.FieldByName('INV_PART_DESCRIPTION').asstring :=
          FrmSelMaterial_mod496.cdsPick.FieldByName
          ('INV_PART_DESCRIPTION').asstring;
        cds468_Sel.FieldByName('UNIT_name').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('UNIT_name').asstring;

        cds468_Sel.FieldByName('vendor').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('abbr_name').asstring;
        cds468_Sel.FieldByName('abbr_name').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('abbr_name').asstring;
        cds468_Sel.FieldByName('PRINTIT_S').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('XY').asstring;
        cds468_Sel.FieldByName('supplier_ptr').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('rkey23').AsInteger;
          cds468_Sel.FieldByName('IsIn').value :=strtofloat(edt_StockQty.Text); //用于保存当前库存

        if cds468_Sel.FieldByName('PRINTIT_S').value = 'VMI库存' then
          cds468_Sel.FieldByName('PRINTIT').value := 'Y'
        else
          cds468_Sel.FieldByName('PRINTIT').value := 'N';

        cds468_Sel.FieldByName('STEP').value := 0;
        cds468_Sel.post;

       // FrmSelMaterial_mod496.cdsPick.ReadOnly := False;
       // FrmSelMaterial_mod496.cdsPick.delete;
      //  FrmSelMaterial_mod496.cdsPick.ReadOnly := true;
        FrmSelMaterial_mod496.ModalResult := mrNone;
      end;

    except
      on e: Exception do
      begin
        ShowMessage('错误：');
        exit;
      end;
    end;

  finally
    cds136.Free;
    cds589.Free;
    cdsSP.Free;
  end;

end;

procedure TfrmMtlCheck.edt_ProdNoButtonClick(Sender: TObject);
var
  // LFrm: TfrmSinglePickList;
  ssql, ssql2: string;
  AParamArr: OleVariant;
  cds136, cds589, cdsSP: TClientDataSet;
   remark:string;
begin
  // inherited;
  cds136 := TClientDataSet.Create(nil);
  cds589 := TClientDataSet.Create(nil);
  cdsSP := TClientDataSet.Create(nil);

  try
    if FrmSelMaterial_mod496 = nil then
    begin
      FrmSelMaterial_mod496 := TFrmSelMaterial_mod496.Create(self);
      FrmSelMaterial_mod496.InitWithPickID(496, 5, Frkey17);
    end;
    try
      if FrmSelMaterial_mod496.showmodal = mrok then
      begin

        // 取出物料对应的领料控制标准
        ssql := '  select    c.rkey,c.control_name, case when isfreq=1  then 1 else 0 end as ''1'', '
          + ' case when isMCount=1  then 2 else 0 end as ''2'',   ' +
          ' case when IsSTime=1  then 3 else 0 end as ''3'',  ' +
          ' case when IsFactor=1  then 4 else 0 end as ''4'',  ' +
          ' case when IsFormula=1  then 5 else 0 end as ''5''  ' +
          ' from  data0017 a                             ' +
          ' left join data0155 b  on a.rkey=invt_ptr     ' +
          ' left join data0136 c on b.control_ptr =c.rkey    ' +
          ' where a.rkey= ' +
          IntToStr(FrmSelMaterial_mod496.cdsPick.FieldByName('Rkey').AsInteger)
          + ' and c.DeptID_P= ' + IntToStr(dept_ptr) + ' ' +
          '  and c.warehouse_ptr=' + IntToStr(wh_ptr) + '  ';
        // showmessage(ssql);

        if not gSvrIntf.IntfGetDataBySql(ssql, cds136) then
        begin
          ShowMessage('取数据出错!');
          exit;
        end;

        ssql2 := 'select * from data0589 where fac_ptr=' + IntToStr(wh_ptr) +
          '  and cost_ptr=' + IntToStr(dept_ptr) + '';
        gSvrIntf.IntfGetDataBySql(ssql2, cds589);

        cbb_BZ.Text := '';
        cbb_BZ.items.clear;
        cbb_BZ.itemindex := -1;
        cbb_BZ.hint := '';
        cbb_BZ.Tag := 0;

        if (not cds136.isempty) then // 有标准
        begin

          cbb_BZ.Tag := cds136.FieldByName('rkey').AsInteger;

          if cds136.FieldByName('1').AsInteger = 1 then
          begin
            cbb_BZ.items.AddObject('1.按保养频率;', TObject(1));

          end;
          if cds136.FieldByName('2').AsInteger = 2 then
          begin
            cbb_BZ.items.AddObject('2.按员工人数;', TObject(2));

          end;
          if cds136.FieldByName('3').AsInteger = 3 then
          begin
            cbb_BZ.items.AddObject('3.按固定时间;', TObject(3));

          end;
          if cds136.FieldByName('4').AsInteger = 4 then
          begin
            cbb_BZ.items.AddObject('4.按生产因素;', TObject(4));

          end;
          if cds136.FieldByName('5').AsInteger = 5 then
          begin
            cbb_BZ.items.AddObject('5.按公式;', TObject(5));

          end;

          if cbb_BZ.items.count = 1 then
          begin
            cds468_Sel.edit;
            cds468_Sel.FieldByName('control_ptr').value := cbb_BZ.Tag;
            cds468_Sel.FieldByName('control_name').value :=
              GetContrlName(cbb_BZ.Tag);
            cds468_Sel.post;

            cbb_BZ.itemindex := 0;

            AParamArr := varArrayCreate([0, 5], varVariant);
            AParamArr[0] := Copy(cbb_BZ.Text, 0, 1);
            AParamArr[1] := wh_ptr;
            AParamArr[2] := cbb_BZ.Tag;
            AParamArr[3] := dept_ptr;
            AParamArr[4] := ReqDate;
            AParamArr[5] := 0;
            if gSvrIntf.IntfspGetData('sp_GetEveryQty_3', AParamArr, cdsSP) then
            begin
              edt_AQty.Text := cdsSP.FieldByName('AllQty').value;
              edt_GQty.Text := cdsSP.FieldByName('GetQty').value;
              edt_CQty.Text := cdsSP.FieldByName('QCQty').value;
              remark:= cdsSP.FieldByName('smessage').value;
            end;

            if cdsSP.FieldByName('AllQty').value - cdsSP.FieldByName('GetQty')
              .value < 0 then
              edt_SQty.Text := '0'
            else
              edt_SQty.Text := floatToStr(cdsSP.FieldByName('AllQty').value -
                cdsSP.FieldByName('GetQty').value);

          end
          else
            cbb_BZ.itemindex := -1;
        end
        else
        begin
          cbb_BZ.items.AddObject('V无领料标准;', TObject(0));
          cbb_BZ.itemindex := 0;

        end;

        edt_StockQty.Text := FrmSelMaterial_mod496.cdsPick.FieldByName
          ('qty').asstring;


        cds468_Sel.FieldByName('PRINTIT_S').ReadOnly := False;
        cds468_Sel.FieldByName('rkey17').ReadOnly := False;
        cds468_Sel.FieldByName('INV_PART_DESCRIPTION').ReadOnly := False;

        cds468_Sel.Append;
        cds468_Sel.FieldByName('standards').value := cbb_BZ.text;       //201070317加
        cds468_Sel.FieldByName('rkey17').AsInteger :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('Rkey').AsInteger;
        cds468_Sel.FieldByName('INVENT_PTR').AsInteger :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('Rkey').AsInteger;
        cds468_Sel.FieldByName('inv_part_number').asstring :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('INV_PART_NUMBER').asstring;
        cds468_Sel.FieldByName('INV_PART_DESCRIPTION').asstring :=
          FrmSelMaterial_mod496.cdsPick.FieldByName
          ('INV_PART_DESCRIPTION').asstring;
        cds468_Sel.FieldByName('UNIT_name').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('UNIT_name').asstring;

        cds468_Sel.FieldByName('vendor').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('abbr_name').asstring;
        cds468_Sel.FieldByName('abbr_name').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('abbr_name').asstring;
        cds468_Sel.FieldByName('PRINTIT_S').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('XY').asstring;
        cds468_Sel.FieldByName('supplier_ptr').value :=
          FrmSelMaterial_mod496.cdsPick.FieldByName('rkey23').AsInteger;
          cds468_Sel.FieldByName('IsIn').value :=strtofloat(edt_StockQty.Text); //用于保存当前库存

       cds468_Sel.FieldByName('control_ptr').value := cbb_BZ.Tag;
            cds468_Sel.FieldByName('control_name').value :=
              GetContrlName(cbb_BZ.Tag);

       cds468_Sel.FieldByName('Runit').value :=
       FrmSelMaterial_mod496.cdsPick.FieldByName('rkey02').AsInteger; //20171110

        if cds468_Sel.FieldByName('PRINTIT_S').value = 'VMI库存' then
          cds468_Sel.FieldByName('PRINTIT').value := 'Y'
        else
          cds468_Sel.FieldByName('PRINTIT').value := 'N';

        cds468_Sel.FieldByName('remark').value :=remark;
          //ShowMessage(remark);
        cds468_Sel.FieldByName('STEP').value := 0;
        cds468_Sel.post;

      //  FrmSelMaterial_mod496.cdsPick.ReadOnly := False;
       // FrmSelMaterial_mod496.cdsPick.delete;
       // FrmSelMaterial_mod496.cdsPick.ReadOnly := true;
        FrmSelMaterial_mod496.ModalResult := mrNone;
      end;

    except
      on e: Exception do
      begin
        ShowMessage('错误：'+e.Message);
        exit;
      end;
    end;

  finally
    cds136.Free;
    cds589.Free;
    cdsSP.Free;
  end;

end;

procedure TfrmMtlCheck.edt_ReqQtyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if not CharInSet(Key, ['0' .. '9', #8, chr(VK_delete)]) then
    Key := Char(0);
end;

procedure TfrmMtlCheck.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmSelMaterial_mod496 := nil;
end;

function TfrmMtlCheck.GetContrlName(contrl_ptr: integer): string;
var
  Lcds136: TClientDataSet;
begin
  result := '';
  Lcds136 := TClientDataSet.Create(nil);
  try
  if gSvrIntf.IntfGetDataBySql('select control_name from data0136 where rkey=' +
    IntToStr(contrl_ptr) + ' ', Lcds136) then
    result := Lcds136.Fields[0].asstring;
  finally
    Lcds136.Free;
  end;

end;

procedure TfrmMtlCheck.getdata;
begin
  //
  if not gSvrIntf.IntfGetDataBySql(cds468_Sel.CommandText, cds468_Sel) then
    ShowMessage('数据处理错误!');
end;

end.
