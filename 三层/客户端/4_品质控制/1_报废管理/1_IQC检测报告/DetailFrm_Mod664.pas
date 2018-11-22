unit DetailFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, RzDTP, RzDBDTP, Data.DB,
  Datasnap.DBClient,System.Math;

type
  TAfterPostData = procedure (ACds:TClientDataSet) of object;

  TfrmDetail_Mod664 = class(TfrmBaseEdit)
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
    Label12: TLabel;
    Label13: TLabel;
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
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtNO: TDBEdit;
    mmo1: TDBMemo;
    mmo2: TDBMemo;
    edtRecDate: TDBEdit;
    edtInvtNumber: TDBEdit;
    edtSupplier: TDBEdit;
    edtInvtName: TDBEdit;
    edtModel: TDBEdit;
    edtInvtDesc: TDBEdit;
    edtTong: TDBEdit;
    edtUnit: TDBEdit;
    edtCaiGouRen: TDBEdit;
    edtSGS: TDBEdit;
    edtSGSDate: TDBEdit;
    edtChiCun: TDBEdit;
    edtTongThink: TDBEdit;
    edtInvtThink: TDBEdit;
    edtPoCount: TDBEdit;
    edtGongCha: TDBEdit;
    edtBatch: TDBEdit;
    edtRec_Qty: TDBEdit;
    edtIQC_Qty: TDBEdit;
    cbbResult: TDBComboBox;
    edtCheckDate: TDBEdit;
    edtCheckUser: TEdit;
    cbbQuantity: TComboBox;
    cbbPackege: TComboBox;
    cbbHasReport: TComboBox;
    btnPO: TBitBtn;
    btnChecker: TBitBtn;
    edtPO: TEdit;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    cds392: TClientDataSet;
    cbxStandard: TCheckBox;
    chkif_halogen: TCheckBox;
    edtNotCheck: TEdit;
    dtpkDate: TDateTimePicker;
    edtExtraDate: TDBEdit;
    btnLeng: TBitBtn;
    procedure btnPOClick(Sender: TObject);
    procedure btnCheckerClick(Sender: TObject);
    procedure edtRec_QtyExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtRec_QtyKeyPress(Sender: TObject; var Key: Char);
    procedure edtIQC_QtyKeyPress(Sender: TObject; var Key: Char);
    procedure edtIQC_QtyExit(Sender: TObject);
    procedure edtCheckUserExit(Sender: TObject);
    procedure edtCheckDateExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure dtpkDateExit(Sender: TObject);
    procedure edtExtraDateExit(Sender: TObject);
    procedure dtpkDateChange(Sender: TObject);
    procedure edtPOExit(Sender: TObject);
    procedure btnLengClick(Sender: TObject);
  private
    { Private declarations }
    FEffDate:Integer;
    FRecQty:Currency;
    FType:string;  //材料类型为A
    function Get_Tolerance(AGroup,Athink:string):string;
    function GetLeng(ALeng:string): string;
    function GetTong(ATong:string):string;
    function CheckData(var AErrMsg:string):Boolean;
    function ExRoundTo(const AValue: Double; const ADigit: TRoundToRange;IsTruncate:boolean=false): Double;
    function UpDate04(ACds:TClientDataSet):Boolean;

  public
    { Public declarations }
    OpenType:Integer;     //0 新增  1 编辑  2 检查
    FAfterPost:TAfterPostData;
    procedure GetData(ARkey391:string);
    procedure LoadData();
    procedure InitUi();
  end;

var
  frmDetail_Mod664: TfrmDetail_Mod664;

implementation

uses uCommFunc,system.DateUtils, PoSearchFrm_Mod664
  ,System.StrUtils,uBaseSinglePickListFrm, MeasureFrm_Mod664;

{$R *.dfm}

{ TfrmDetail_Mod664 }

procedure TfrmDetail_Mod664.btnCheckerClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(664,1);
    if LFrm.ShowModal = mrOk then
    begin
      edtCheckUser.Text:=LFrm.cdsPick.FieldByName('empl_code').AsString;
      cdsDetail.Edit;
      cdsDetail.FieldByName('appr_user_ptr').Value:= LFrm.cdsPick.FieldByName('rkey').Value;
      cdsDetail.FieldByName('appr_date').Value:= gFunc.GetSvrDateTime();
      cdsDetail.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod664.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmDetail_Mod664.btnLengClick(Sender: TObject);
var
  LFrm:TfrmMeasure_Mod664;
  i:Integer;
begin
  inherited;
  LFrm:= TfrmMeasure_Mod664.Create(nil);
  try
    LFrm.GRkey391:= cdsDetail.FieldByName('rkey').AsInteger;
    LFrm.GetData;
    Lfrm.cdsMain.Data:= cds392.Data;
    if LFrm.ShowModal = mrOk then
    begin
      LFrm.cdsMain.First;
      while not LFrm.cdsMain.Eof do
      begin
        cds392.Locate('sr_no',LFrm.cdsMain.FieldByName('sr_no').AsInteger,[]);
        cds392.Edit;
        for I := 1 to 8 do
          cds392.FieldByName('value_' + IntToStr(i)).Value:= LFrm.cdsMain.FieldByName('value_' + IntToStr(i)).Value;
        cds392.Post;
        LFrm.cdsMain.Next;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod664.btnPOClick(Sender: TObject);
var
  LFrm:TfrmPoSearch_Mod664;
  LTemp:Currency;
begin
  inherited;
  LFrm:= TfrmPoSearch_Mod664.Create(nil);
  try
    if Trim(edtPO.Text) <> '' then LFrm.FWhere2:= ' AND data0070.PO_NUMBER like ''%'
              + Trim(edtPO.Text) + '%''';
    LFrm.GetData;

    if LFrm.ShowModal = mrOk then
    begin
      if LFrm.cdsMain.IsEmpty then Exit;

      cdsDetail.Append;
      cdsDetail.FieldByName('iqc_number').Value:= gFunc.Get04SeedValue('Data0391');
      cdsDetail.FieldByName('rkey71').Value:= LFrm.cdsMain.FieldByName('RKEY').Value;
      cdsDetail.FieldByName('rkey17').Value:= LFrm.cdsMain.FieldByName('RKEY17').Value;
      cdsDetail.FieldByName('REQ_DATE').Value:= LFrm.cdsMain.FieldByName('REQ_DATE').Value;
      cdsDetail.FieldByName('INV_PART_NUMBER').Value:= LFrm.cdsMain.FieldByName('INV_PART_NUMBER').Value;
      cdsDetail.FieldByName('ABBR_NAME').Value:= LFrm.cdsMain.FieldByName('ABBR_NAME').Value;
      cdsDetail.FieldByName('INV_NAME').Value:= LFrm.cdsMain.FieldByName('INV_NAME').Value;
      cdsDetail.FieldByName('supplier_model').Value:= LFrm.cdsMain.FieldByName('extra_req').Value;
      cdsDetail.FieldByName('INV_DESCRIPTION').Value:= LFrm.cdsMain.FieldByName('INV_DESCRIPTION').Value;
      cdsDetail.FieldByName('ht_remark').Value:= LFrm.cdsMain.FieldByName('HaTong').Value;
      cdsDetail.FieldByName('UNIT_NAME').Value:= LFrm.cdsMain.FieldByName('UNIT_NAME').Value;
      cdsDetail.FieldByName('purchase_name').Value:= LFrm.cdsMain.FieldByName('purchase_name').Value;
      cdsDetail.FieldByName('sgs_no').Value:= LFrm.cdsMain.FieldByName('SGS_NO').Value;
      if LFrm.cdsMain.FieldByName('TestDate').AsString = '' then cdsDetail.FieldByName('sgs_date').AsVariant:= null
      else  cdsDetail.FieldByName('sgs_date').Value:= LFrm.cdsMain.FieldByName('TestDate').Value;

      cdsDetail.FieldByName('part_size').Value:= GetLeng(LFrm.cdsMain.FieldByName('IES_PARAMETER_VALUE4').AsString);   //尺寸
      cdsDetail.FieldByName('tong_thickness').Value:= GetTong(LFrm.cdsMain.FieldByName('IES_PARAMETER_VALUE3').AsString);    //铜厚
      cdsDetail.FieldByName('part_thickness').Value:= LFrm.cdsMain.FieldByName('IES_PARAMETER_VALUE2').Value;              //板厚
      if (LFrm.cdsMain.FieldByName('IES_PARAMETER_VALUE3').AsString <> '') and
                  TryStrToCurr(LFrm.cdsMain.FieldByName('IES_PARAMETER_VALUE3').AsString,LTemp) then
        cdsDetail.FieldByName('thick_tolerance').Value:= Get_Tolerance(LFrm.cdsMain.FieldByName('GROUP_PTR').AsString    //厚度公差
                    ,LFrm.cdsMain.FieldByName('IES_PARAMETER_VALUE3').AsString);


      cdsDetail.FieldByName('QUAN_ORD').Value:= LFrm.cdsMain.FieldByName('QUAN_ORD').Value;
      cdsDetail.FieldByName('manufacture_TDATE').Value:= gFunc.GetSvrDateTime(dtdate);
      if LFrm.cdsMain.FieldByName('eff_Date').AsInteger <> 0 then
       cdsDetail.FieldByName('extrl_date').Value:= IncDay(cdsDetail.FieldByName('manufacture_TDATE').Value
                            ,LFrm.cdsMain.FieldByName('eff_Date').AsInteger);   //有效期  从17或28
      cdsDetail.FieldByName('if_halogen').Value:= LFrm.cdsMain.FieldByName('halogen').Value;   //无卤素
      cdsDetail.FieldByName('GROUP_PTR').Value:= LFrm.cdsMain.FieldByName('GROUP_PTR').Value;
      cdsDetail.Post;

      dtpkDate.Date:= cdsDetail.FieldByName('manufacture_TDATE').Value;
      FEffDate:= LFrm.cdsMain.FieldByName('eff_Date').AsInteger;
      edtPO.Text:= LFrm.cdsMain.FieldByName('PO_NUMBER').AsString;
      chkif_halogen.Checked:= LFrm.cdsMain.FieldByName('halogen').Value = 1 ;
      edtNotCheck.Text:= LFrm.cdsMain.FieldByName('NotCheck').AsString;
      FType:= LFrm.cdsMain.FieldByName('inv_group_name').AsString;    //材料类型
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod664.btnSaveClick(Sender: TObject);
var
  LErrMsg:string;
  LSql04,LSql391,LSql71,LSql392:string;
  LCds04,LCds391,LCds71,LCds392:TClientDataSet;
  LField:TField;
  LData:OleVariant;
  i:Integer;
begin
  inherited;
  LErrmsg:='';
  if not CheckData(LErrMsg) then
  begin
    ShowMessage(LErrMsg);
    Exit;
  end;

  case OpenType of
    0:
    begin
      if cdsDetail.FieldByName('manufacture_TDATE').Value = gFunc.GetSvrDateTime(dtdate) then
      begin
        if MessageDlg('制造日期为当前日期，请确认制造日期是否正确？',mtWarning,[mbYes,mbNo],0)=mrno then Exit;
      end;
      LSql04:= 'select * from data0004 where table_name = ''Data0391''';
      LSql391:= ' SELECT * FROM DATA0391 WHERE 1=0';
      LSql71:=' SELECT * FROM DATA0071 WHERE RKEY='+ cdsDetail.FieldByName('rkey71').AsString;
      LSql392:= ' SELECT * FROM DATA0392 WHERE 1 = 0';
      LCds04:= TClientDataSet.Create(self);
      LCds391:= TClientDataSet.Create(Self);
      LCds71:= TClientDataSet.Create(Self);
      LCds392:= TClientDataSet.Create(Self);
      try
        if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql04,LSql391,LSql71,LSql392]),[LCds04,LCds391,LCds71,LCds392]) then Exit;
        if LCds04.FieldByName('SEED_VALUE').AsString <> Trim(edtNO.Text) then
        begin
          cdsDetail.Edit;
          cdsDetail.FieldByName('iqc_number').Value:= LCds04.FieldByName('SEED_VALUE').AsString;
          cdsDetail.Post;
        end;
        if not UpDate04(LCds04) then
        begin
          ShowMessage('更新04表失败');
          Exit;
        end;                                  //更新04

        LCds391.Append;                       //391
        for LField in LCds391.Fields do
        begin
          if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
          if cdsDetail.FindField(LField.FieldName) <> nil then
          begin
            LField.Value := cdsDetail.FindField(LField.FieldName).Value;
          end;
        end;

        LCds391.FieldByName('package_qualified').Value:= cbbPackege.ItemIndex;
        LCds391.FieldByName('qty_qualified').Value:= cbbQuantity.ItemIndex;
        LCds391.FieldByName('hasheepreport').Value:= cbbHasReport.ItemIndex;
        LCds391.FieldByName('appl_user_ptr').Value:= StrToInt(gvar.rkey05);
        LCds391.FieldByName('appl_date').Value:= gFunc.GetSvrDateTime();
        if cbxStandard.Checked then LCds391.FieldByName('if_standard').Value:= '是'
        else LCds391.FieldByName('if_standard').Value:= '否';
        LCds391.FieldByName('status').Value:= 1;
        LCds391.FieldByName('stock_over').Value:= 0;
        LCds391.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
        LCds391.Post;

        if Trim(FType) = 'A' then  //为板料类
        begin
          for i := 1 to 5 do
          begin
            LCds392.Append;
            LCds392.FieldByName('sr_no').Value:= i;
            LCds392.FieldByName('D391_IDKey').Value:= LCds391.FieldByName('IDKey').Value;
            LCds392.Post;
          end;
        end;

        if not LCds71.IsEmpty then            //71
        begin
          LCds71.Edit;
          LCds71.FieldByName('QUAN_REJD').Value:= LCds71.FieldByName('QUAN_REJD').Value +
                      ExRoundTo(LCds391.FieldByName('rece_qty').Value,4);
          LCds71.Post;
        end;

        LData:= VarArrayCreate([0,3],varVariant);
        if LCds04.ChangeCount > 0 then LData[0]:= LCds04.Delta;
        if LCds391.ChangeCount > 0 then LData[1]:= LCds391.Delta;
        if LCds392.ChangeCount > 0 then LData[2]:= LCds392.Delta;
        if LCds71.ChangeCount > 0 then LData[3]:= LCds71.Delta;
        if gSvrIntf.IntfPostModData('',664,LData) then
        begin
          if LCds04.ChangeCount > 0 then  LCds04.MergeChangeLog;
          if LCds391.ChangeCount > 0 then  LCds391.MergeChangeLog;
          if cds392.ChangeCount > 0 then   cds392.MergeChangeLog;
          if LCds71.ChangeCount > 0 then   LCds71.MergeChangeLog;
          ShowMessage('保存成功！');
          if Assigned(FAfterPost) then FAfterPost(nil);
          Close;
        end;
      finally
        LCds04.Free;
        LCds391.Free;
        LCds71.Free;
        LCds392.Free;
      end;
    end;
    1:
    begin
      LSql391:= ' SELECT * FROM DATA0391 WHERE rkey=' + cdsDetail.FieldByName('rkey').AsString;
      LSql71:=' SELECT * FROM DATA0071 WHERE RKEY='+ cdsDetail.FieldByName('rkey71').AsString;
      LSql392:= ' SELECT * FROM DATA0392 WHERE rkey391=' + cdsDetail.FieldByName('rkey').AsString;;
      LCds391:= TClientDataSet.Create(Self);
      LCds71:= TClientDataSet.Create(Self);
      try
        if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql391,LSql71]),[LCds391,LCds71]) then Exit;
        LCds391.Edit;                       //391
        for LField in LCds391.Fields do
        begin
          if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
          if cdsDetail.FindField(LField.FieldName) <> nil then
          begin
            LField.Value := cdsDetail.FindField(LField.FieldName).Value;
          end;
        end;

        LCds391.FieldByName('package_qualified').Value:= cbbPackege.ItemIndex;
        LCds391.FieldByName('qty_qualified').Value:= cbbQuantity.ItemIndex;
        LCds391.FieldByName('hasheepreport').Value:= cbbHasReport.ItemIndex;
        LCds391.FieldByName('appl_user_ptr').Value:= StrToInt(gvar.rkey05);
        LCds391.FieldByName('appl_date').Value:= gFunc.GetSvrDateTime();
        if cbxStandard.Checked then LCds391.FieldByName('if_standard').Value:= '是'
        else LCds391.FieldByName('if_standard').Value:= '否';
        LCds391.FieldByName('status').Value:= 1;
        LCds391.Post;

        if Trim(FType) = 'A' then
        begin

        end;

        if not LCds71.IsEmpty then            //71
        begin
          if ExRoundTo(StrToFloat(Trim(edtRec_Qty.Text)),4) <> ExRoundTo(FRecQty,4) then
          begin
            LCds71.Edit;
            LCds71.FieldByName('QUAN_REJD').Value:= LCds71.FieldByName('QUAN_REJD').Value +
                        (ExRoundTo(LCds391.FieldByName('rece_qty').Value,4) -  ExRoundTo(FRecQty,4));
            LCds71.Post;
          end;
        end;

        LData:= VarArrayCreate([0,3],varVariant);
        if LCds391.ChangeCount > 0 then LData[1]:= LCds391.Delta;
        if Cds392.ChangeCount > 0 then LData[2]:= Cds392.Delta;
        if LCds71.ChangeCount > 0 then LData[3]:= LCds71.Delta;
        if gSvrIntf.IntfPostModData('',664,LData) then
        begin
          if LCds391.ChangeCount > 0 then  LCds391.MergeChangeLog;
          if cds392.ChangeCount > 0 then   cds392.MergeChangeLog;
          if LCds71.ChangeCount > 0 then   LCds71.MergeChangeLog;
          ShowMessage('保存成功！');
          if Assigned(FAfterPost) then FAfterPost(nil);
          Close;
        end;
      finally
        LCds391.Free;
        LCds71.Free;
      end;
    end;
  end;
end;

function TfrmDetail_Mod664.CheckData(var AErrMsg:string): Boolean;
var
  LSql:string;
  LCds:TClientDataSet;
begin
  Result:= True;
  if Trim(edtPO.Text) = '' then AErrmsg:= '请先选择订单'+ #13;
//  if Trim(edtExtraDate.Text) = '' then AErrMsg:= AErrMsg + '有效期不能为空'+ #13;
  if Trim(edtRec_Qty.Text) = '' then
  begin
    cdsDetail.Edit;
    cdsDetail.FieldByName('rece_qty').Value:= 0;
    cdsDetail.Post;
  end;
  if Trim(edtIQC_Qty.Text) = '' then
  begin
    cdsDetail.Edit;
    cdsDetail.FieldByName('iqc_qty').Value:= 0;
    cdsDetail.Post;
  end;
  if Trim(edtRec_Qty.Text) = '0' then AErrMsg:= AErrMsg + '来料数量不能为0'+ #13;
  LSql:= 'select (QUAN_ORD - QUAN_REJD + '+ CurrToStr(FRecQty) +
          ') AS NOTCHECK_QTY FROM data0071 where rkey='+ cdsDetail.FieldByName('rkey71').AsString;
  LCds:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      if ExRoundTo(LCds.FieldByName('NOTCHECK_QTY').AsFloat,4) < ExRoundTo(StrToFloat((edtRec_Qty.Text)),4) then
        AErrMsg:= AErrMsg + '来料数量大于待检查数量，可能有其它人同时操作'+ #13;
    end;
    if Trim(AErrMsg) <> '' then Result := False;
  finally
    LCds.Free;
  end;
end;

procedure TfrmDetail_Mod664.dtpkDateChange(Sender: TObject);
begin
  inherited;
  cdsDetail.Edit;
  cdsDetail.FieldByName('manufacture_TDATE').Value:= dtpkDate.Date;
  cdsDetail.Post;
end;

procedure TfrmDetail_Mod664.dtpkDateExit(Sender: TObject);
begin
  inherited;
  cdsDetail.Edit;
  if FEffDate = 0 then cdsDetail.FieldByName('extrl_date').AsVariant:= null
  else cdsDetail.FieldByName('extrl_date').Value:=DateTimeToStr(IncDay(dtpkDate.Date,FEffDate));
  cdsDetail.Post;
end;

procedure TfrmDetail_Mod664.edtCheckDateExit(Sender: TObject);
var
  LTemp:TDateTime;
begin
  inherited;
  if ((Sender as TEdit).Text<>'') and (TryStrToDateTime(Trim((Sender as TEdit).Text),LTemp)=False) then
  begin
    ShowMessage('输入的日期格式不对，应例如：2015-11-11 08:00:00');
    (Sender as TEdit).SetFocus;
    Exit;
  end;
end;

procedure TfrmDetail_Mod664.edtCheckUserExit(Sender: TObject);
var
  LSql: string;
  LCds: TClientDataSet;
begin
  inherited;
  if Trim(edtCheckUser.Text)<>'' then
  begin
    LSql:= 'select rkey,empl_code,employee_name from data0005 where active_flag=''Y'' '+ #13+
           ' and empl_code= '+ QuotedStr(Trim(edtCheckUser.Text));
    LCds:= TClientDataSet.Create(Self);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        cdsDetail.Edit;
        cdsDetail.FieldByName('appr_user_ptr').Value:= LCds.FieldByName('rkey').AsInteger;
        cdsDetail.FieldByName('appr_date').Value:= gFunc.GetSvrDateTime();
        cdsDetail.Post;
      end
      else
      begin
        ShowMessage('此员工离职或不存在');
        edtCheckUser.SetFocus;
        Exit;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmDetail_Mod664.edtExtraDateExit(Sender: TObject);
var
  LTemp:TDateTime;
begin
  inherited;
//  ShowMessage(Trim((Sender as TDBEdit).Text));
  if (Trim((Sender as TEdit).Text)<>'') and (TryStrTodate(Trim((Sender as TEdit).Text),LTemp)=False) then
  begin
    ShowMessage('输入的日期格式不对，应例如：2015-11-11');
    (Sender as TEdit).SetFocus;
    Exit;
  end;
end;

procedure TfrmDetail_Mod664.edtIQC_QtyExit(Sender: TObject);
begin
  inherited;
  if Trim(edtIQC_Qty.Text)='' then
   edtIQC_Qty.Text:='0'
  else
  begin
    if  StrToCurr(edtIQC_Qty.Text)>StrToCurr(edtRec_Qty.Text) then
    begin
      ShowMessage('抽检数量不能大于来料数量');
      edtIQC_Qty.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmDetail_Mod664.edtIQC_QtyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#8,#46]) then Abort;
end;

procedure TfrmDetail_Mod664.edtPOExit(Sender: TObject);
begin
  inherited;
  if (Trim(edtPO.Text) <> '') and (ActiveControl.Name <> 'btnPO') then
  begin
    ShowMessage('请从右侧按钮中选择订单明细！！');
    edtPO.SetFocus;
    exit;
  end;
end;

procedure TfrmDetail_Mod664.edtRec_QtyExit(Sender: TObject);
var
  LTemp:Extended;
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if Trim(edtRec_Qty.Text) <> '' then
  begin
    if TryStrToFloat(Trim(edtRec_Qty.Text),LTemp) then
    begin
      cdsDetail.Edit;
      cdsDetail.FieldByName('rece_qty').Value:= LTemp;
      cdsDetail.Post;

      LSql:= 'SELECT iqc_qty FROM data0393 WHERE GROUP_PTR= ' + cdsDetail.FieldByName('GROUP_PTR').AsString +
             ' and ' + Trim(edtRec_Qty.Text) + ' > begin_qty ' +
             ' and ' + Trim(edtRec_Qty.Text) + ' <= end_qty ';
      LCds:= TClientDataSet.Create(self);
      try
        if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
        if not LCds.IsEmpty then
        begin
          if LCds.FieldByName('iqc_qty').AsInteger=0 then
          begin
            cdsDetail.Edit;
            cdsDetail.FieldByName('iqc_qty').Value:= cdsDetail.FieldByName('rece_qty').Value;
            cdsDetail.Post;
          end
          else
          begin
            cdsDetail.Edit;
            cdsDetail.FieldByName('iqc_qty').Value:= LCds.FieldByName('iqc_qty').Value;
            cdsDetail.Post;
          end;
        end
        else
        begin
          cdsDetail.Edit;
          cdsDetail.FieldByName('iqc_qty').Value:= 0;
          cdsDetail.Post;
        end;
      finally
        LCds.Free;
      end;
    end
    else
    begin
      ShowMessage('输入的数据格式不对，请重新输入');
      edtIQC_Qty.Text:='0';
      edtRec_Qty.SetFocus;
      Exit;
    end;
  end
  else
  begin
    cdsDetail.Edit;
    cdsDetail.FieldByName('rece_qty').Value:= 0;
    cdsDetail.Post;
  end;
end;

procedure TfrmDetail_Mod664.edtRec_QtyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    edtIQC_Qty.SetFocus;
    Exit;
  end;
  if not CharInSet(Key,['0'..'9',#46,#8]) then   Abort  //判断是否输入数字
  else if Key = Chr(46)  then
   if pos('.',edtRec_Qty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

function TfrmDetail_Mod664.ExRoundTo(const AValue: Double;
  const ADigit: TRoundToRange; IsTruncate: boolean): Double;
var
  OldRoundMode:TFPURoundingMode;
  LFactor,Tmp: Double;
begin
  OldRoundMode:=GetRoundMode();
  if IsTruncate then
    begin
      SetRoundMode(rmTruncate);
      Result:=RoundTo(AValue,-ADigit);
    end
  else
    begin
      SetRoundMode(rmNearest);
      LFactor := IntPower(10, ADigit);
      Tmp:=AValue*LFactor;
      if abs(frac(trunc(Tmp*10)/10))=0.5 then
        if AValue<0 then
          SetRoundMode(rmDown)
        else
          SetRoundMode(rmUp);
      Result := Round(Tmp) / LFactor;
    end;
  SetRoundMode(OldRoundMode);
end;

procedure TfrmDetail_Mod664.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
  frmDetail_Mod664:= nil;
end;

procedure TfrmDetail_Mod664.GetData(ARkey391: string);
var
  LSql,LSql392:string;
begin
  LSql:= cdsDetail.CommandText +  ' WHERE dbo.DATA0391.RKEY = ' + ARkey391;
  LSql392:= ' SELECT * FROM DATA0392 WHERE rkey391= '+ ARkey391;
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql392]),[cdsDetail,cds392]) then
  begin
    ShowMessage('加载数据失败！');
    Exit;
  end;
  FRecQty:= 0;
end;

function TfrmDetail_Mod664.GetLeng(ALeng: string): string;
var
  LLeng:string;
begin //因为原始值不符合命名规范，可以把原始值加入到TStringList，然后用indexof 取出索引用case...of ..
  LLeng:= ALeng;
  if LLeng= '18*24' then LLeng:='457*610';
  if LLeng='30.3*48' then LLeng:='770*1219';
  if LLeng= '32.6*48' then LLeng:='828*1219';
  if LLeng= '32.8*49' then LLeng:='833*1245';
  if LLeng= '34.4*49' then LLeng:= '874*1245';
  if LLeng= '35*49' then LLeng:= '889*1245';
  if LLeng= '36*48' then LLeng:='914*1219';
  if LLeng='37*49' then LLeng:='940*1245';
  if LLeng= '40*48' then LLeng:='1016*1219';
  if LLeng= '40.5*49' then LLeng:='1029*1245';
  if LLeng= '41*49' then LLeng:='1041*1245';
  if LLeng= '42*48' then LLeng:='1067*1219';
  if LLeng= '42.5*48.5' then LLeng:='1080*1232';
  if LLeng= '43*49' then LLeng:='1092*1245';
  if LLeng= '49.2*49' then LLeng:= '1250*1245';
  if LLeng= '51*49' then LLeng:='1295*1245';
  if LLeng= '51.5*49' then LLeng:= '1308*1245';
  if LLeng= '51.6*49' then LLeng:='1310*1245';
  Result:= LLeng;
end;

function TfrmDetail_Mod664.GetTong(ATong: string): string;
var
  Lstrtong:string;
begin
  Lstrtong:='0';
  ATong:=UpperCase(ATong);
  if ATong='T/T' then Lstrtong:='12';
  if ATong='0.33/0.33' then Lstrtong:='12';
  if ATong='15/15' then Lstrtong:='15';
  if ATong='0.5/0.5' then Lstrtong:='17';
  if ATong='H/H' then Lstrtong:='17';
  if ATong='1/1' then Lstrtong:='35';
  if ATong='2/2' then Lstrtong:='70';
  if ATong='3/3' then Lstrtong:='105';
  if ATong='4/4' then Lstrtong:='140';
  if ATong='CL1/CL1' then Lstrtong:='35';
  if ATong='C1/C1' then Lstrtong:='35';
  if ATong='CLH/CLH' then Lstrtong:='17';
  if ATong='CH/CH' then Lstrtong:='17';
  if ATong='LP1/LP1-C' then Lstrtong:='35';
  Result:=Lstrtong;
end;

function TfrmDetail_Mod664.Get_Tolerance(AGroup,Athink: string): string;
var
  LSql:string;
  LCds: TClientDataSet;
begin
  Result:='';
  LSql:= ' SELECT b_l_tolerance,c_m_tolerance FROM data0394  '+ #13+
         ' WHERE GROUP_PTR= ' + AGroup +
         ' AND begin_qty<= ' + Athink +
         ' AND end_qty>= ' + Athink ;
//  ShowMessage(LSql);
  LCds:= TClientDataSet.Create(self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then Result:= LCds.FieldByName('c_m_tolerance').AsString;
  finally
    LCds.Free;
  end;
end;

procedure TfrmDetail_Mod664.InitUi;
begin
  if OpenType = 2 then
  begin
    pnl2.Enabled:= False;
    btnSave.Enabled:= False;
  end;
  
  edtPO.Enabled:= False;
  edtNO.Enabled:= False;
  btnPO.Enabled:= False;
end;

procedure TfrmDetail_Mod664.LoadData;
begin
  edtNotCheck.Text:= cdsDetail.FieldByName('NotCheck').AsString;
  edtCheckUser.Text:= cdsDetail.FieldByName('code_appr').AsString;
  edtPO.Text:= cdsDetail.FieldByName('PO_NUMBER').AsString;
  chkif_halogen.Checked:= cdsDetail.FieldByName('if_halogen').Value = 1;
  dtpkDate.Date:= cdsDetail.FieldByName('manufacture_TDATE').Value;
  FEffDate:= cdsDetail.FieldByName('eff_Date').AsInteger;
  cbxStandard.Checked:= cdsDetail.FieldByName('if_standard').AsString = '是';
  FRecQty:= cdsDetail.FieldByName('rece_qty').AsCurrency;
  btnLeng.Visible:= cdsDetail.FieldByName('inv_group_name').AsString = 'A';   //写死了
end;

function TfrmDetail_Mod664.UpDate04(ACds:TClientDataSet): Boolean;
var
 v_last,new_seed:string;
 LSeed:string;
 i,control_no:word;
begin
  Result:=False;
  LSeed:=ACds.FieldByName('SEED_VALUE').AsString;
  control_no := length(LSeed);
  if ACds.FieldByName('SEED_FLAG'). AsInteger <> 1 then
  begin
    for i := control_no downto 1 do
    begin
      if (copy(LSeed,i,1)<'0') or (copy(LSeed,i,1)>'9') then  //如果不是数字
      begin
        v_last := floattostr(power(10,control_no-1)+strtofloat(copy(LSeed,i+1,control_no-i))+1); //后缀加1
        new_seed := copy(LSeed,1,i)+copy(v_last,i+1,control_no-i);
        ACds.Edit; //使前缀不变后缀加1
        ACds.FieldByName('SEED_VALUE').Value := new_seed;
        ACds.Post;
        break;
      end
      else
      if i=1 then //如果第一位仍然是数字
      begin
         v_last := floattostr(power(10,control_no)+strtofloat(LSeed)+1);
         new_seed := copy(v_last,2,control_no);
         ACds.Edit;
         ACds.FieldByName('SEED_VALUE').Value := new_seed;
         ACds.Post;
      end;
      Result:= True;
    end;
  end;
end;

end.
