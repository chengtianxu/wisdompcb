unit PasModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,Math, ComCtrls,Buttons,common,MyClass,DateUtils;

type
  TfrmModify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtPO: TEdit;
    btnPO: TBitBtn;
    Label2: TLabel;
    edtRepNo: TEdit;
    Label3: TLabel;
    edtSupplierName: TEdit;
    Label4: TLabel;
    edtINV_Name: TEdit;
    Label5: TLabel;
    edtModel: TEdit;
    Label6: TLabel;
    edtDESC: TEdit;
    Label7: TLabel;
    edtPerNO: TEdit;
    Label8: TLabel;
    edtRec_Qty: TEdit;
    Label9: TLabel;
    edtIQC_Qty: TEdit;
    Label10: TLabel;
    edtLength: TEdit;
    Label12: TLabel;
    edtTong: TEdit;
    Label13: TLabel;
    edtPartThick: TEdit;
    chkIsStandard: TCheckBox;
    Label14: TLabel;
    edtExtrlDate: TEdit;
    Label15: TLabel;
    cbbResult: TComboBox;
    Label16: TLabel;
    Memo1: TMemo;
    Label17: TLabel;
    edtChecker: TEdit;
    btnChecker: TBitBtn;
    Label18: TLabel;
    edtCheckDate: TEdit;
    Label19: TLabel;
    edtHT: TEdit;
    chklogen: TCheckBox;
    Label20: TLabel;
    edtSGS: TEdit;
    Label21: TLabel;
    edtSGSEffect: TEdit;
    Label11: TLabel;
    Memo2: TMemo;
    Label22: TLabel;
    edtOrderCount: TEdit;
    Label23: TLabel;
    edtCheckQty: TEdit;
    Label24: TLabel;
    edtthick_tolerance: TEdit;
    lb_INV_CODE: TLabel;
    lb_INV: TLabel;
    Label25: TLabel;
    edt_INV: TEdit;
    edt_Date: TEdit;
    Label26: TLabel;
    edtMake: TEdit;
    Label27: TLabel;
    edtUnit: TEdit;
    Label28: TLabel;
    edtPurchase: TEdit;
    Label29: TLabel;
    cbbCount: TComboBox;
    Label30: TLabel;
    cbbPage: TComboBox;
    Label31: TLabel;
    cbbHasReport: TComboBox;
    lbl1: TLabel;
    edt1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edtCheckDateEnter(Sender: TObject);
    procedure btnCheckerClick(Sender: TObject);
    procedure btnPOClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtRec_QtyKeyPress(Sender: TObject; var Key: Char);
    procedure edtRec_QtyExit(Sender: TObject);
    procedure edtCheckDateExit(Sender: TObject);
    procedure edtExtrlDateEnter(Sender: TObject);
    procedure edtExtrlDateExit(Sender: TObject);
    procedure edtIQC_QtyKeyPress(Sender: TObject; var Key: Char);
    procedure edtIQC_QtyExit(Sender: TObject);
    procedure edtMakeEnter(Sender: TObject);
    procedure edtMakeChange(Sender: TObject);
    procedure edtCheckerExit(Sender: TObject);
  private
    recQty:Double;
    effDate:Integer;
    function getleng(parLeng:string):string;
    function gettong(tong:string):string;
    function get_thick_tolerance(group:Integer;thick,tong:string):string;
    { Private declarations }
  public
    rkey391,status:Integer;
    { Public declarations }
  end;

var
  frmModify: TfrmModify;

implementation

uses DAMO,Pick_Item_Single,ConstVar, PasPOSel;

{$R *.dfm}

procedure TfrmModify.FormShow(Sender: TObject);
begin

//  today:= getsystem_date(DM.adoTime,0);
//  dtpkEffectTo.Date:= IncYear(dtpkCheckDate.Date,3);

  if status=1 then
  begin
    frmModify.Caption:='新增';
    with dm.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select seed_value,seed_flag from data0004 where table_name=''data0391''';
      Open;
      if not IsEmpty then
      begin
        if FieldByName('seed_flag').Value<>1 then edtRepNo.Text:= FieldByName('seed_value').AsString;
        if FieldByName('seed_flag').Value=4 then edtRepNo.ReadOnly:=True;
      end;
    end;
  end;
  if (status=2) or (status=3) then
  begin
    frmModify.Caption:='编辑';
    edtPO.Enabled:=False;
    btnPO.Enabled:=False;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='SELECT  dbo.DATA0391.rkey, dbo.DATA0391.iqc_number, dbo.DATA0391.supplier_model, dbo.DATA0391.sgs_no, dbo.DATA0391.sgs_date,dbo.Data0002.UNIT_NAME, '+
                     ' dbo.DATA0391.rece_qty, dbo.DATA0391.iqc_qty, dbo.DATA0391.barch_no, dbo.DATA0391.appl_user_ptr, dbo.DATA0391.appl_date,purchase.employee_name as purchase_name, '+
                     ' dbo.DATA0391.appr_user_ptr, dbo.DATA0391.appr_date, dbo.DATA0391.auth_user_ptr, dbo.DATA0391.auth_date, dbo.DATA0391.if_halogen, '+
                     ' dbo.DATA0391.appearance, dbo.DATA0391.part_size, dbo.DATA0391.part_thickness, dbo.DATA0391.tong_thickness, dbo.DATA0391.thick_tolerance, '+
                     ' dbo.DATA0391.ht_remark, dbo.DATA0391.if_standard, dbo.DATA0391.extrl_date,dbo.DATA0391.manufacture_TDATE, dbo.DATA0391.remark, dbo.DATA0391.status, '+
                     ' dbo.DATA0391.judge_result, dbo.Data0070.PO_NUMBER, dbo.Data0023.CODE, dbo.Data0023.ABBR_NAME, dbo.Data0017.INV_NAME,dbo.Data0071.QUAN_ORD, '+
                     ' cast( dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_REJD + dbo.DATA0391.rece_qty as decimal(13, 4)) as CheckQty,data0017.group_ptr, '+
                     ' dbo.Data0017.INV_DESCRIPTION, dbo.DATA0391.rkey71, dbo.DATA0391.rkey17, dbo.Data0005.EMPLOYEE_NAME,D05_appr.employee_name as user_appr, '+
                     ' dbo.DATA0391.package_qualified,dbo.DATA0391.qty_qualified,dbo.DATA0391.hasheepreport,dbo.DATA0391.DELIVER_NUMBER,'+
                     '  CASE DATA0028.qte_price2 WHEN 0 THEN DATA0017.SHELF_LIFE ELSE DATA0028.qte_price2 END AS eff_Date '#13+
                 '  FROM   dbo.DATA0391 INNER JOIN  '+
                     ' dbo.Data0071 ON dbo.DATA0391.rkey71 = dbo.Data0071.RKEY INNER JOIN  '+
                     ' dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN   '+
                     ' dbo.Data0005 as purchase ON dbo.Data0070.employee_pointer = purchase.RKEY INNER JOIN  '+
                     ' dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '+
                     ' dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN   '+
                     ' dbo.Data0017 ON dbo.DATA0391.rkey17 = dbo.Data0017.RKEY INNER JOIN '+
                     ' dbo.Data0005 ON dbo.DATA0391.appl_user_ptr = dbo.Data0005.RKEY left join '+
					            'dbo.data0005 as D05_appr ON dbo.data0391.appr_user_ptr = D05_appr.rkey left join'+
                      ' dbo.Data0028 ON dbo.Data0071.INVT_PTR = dbo.Data0028.INVENTORY_PTR AND dbo.Data0070.SUPPLIER_POINTER = dbo.Data0028.SUPPLIER_PTR'+#13+
                 ' where dbo.DATA0391.rkey=' + IntToStr(rkey391);
      Open;
      if not IsEmpty then
      begin
        edtRepNo.Text:= FieldByName('iqc_number').AsString;
        edtPO.Text:= FieldByName('PO_NUMBER').AsString;
        edtPO.Tag:= FieldByName('rkey71').AsInteger;
        edtSupplierName.Text:= FieldByName('ABBR_NAME').AsString;
        edtOrderCount.Text:=FieldByName('QUAN_ORD').AsString;
        edtCheckQty.Text:=FieldByName('CheckQty').AsString;;
        edtINV_Name.Text:= FieldByName('INV_NAME').AsString;
        edtINV_Name.Tag:= FieldByName('rkey17').AsInteger;
        edt1.Text:= FieldByName('DELIVER_NUMBER').AsString;
        with DM.adoTime do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select data0071.REQ_DATE,data0017.INV_PART_NUMBER from data0071 '+
                    ' inner join data0017 on data0071.invt_ptr=data0017.rkey '+
                    ' where data0071.rkey= '+ DM.adoTmp.FieldByName('rkey71').AsString ;
          Open;
          if not IsEmpty then
          begin
            edt_INV.Text:= DM.adoTime.FieldByName('INV_PART_NUMBER').AsString;
            edt_Date.Text:= DM.adoTime.FieldByName('REQ_DATE').AsString
          end;
        end;
        edtHT.Text:= FieldByName('ht_remark').AsString;
        edtModel.Text:= FieldByName('supplier_model').AsString;
        edtDESC.Text:= FieldByName('INV_DESCRIPTION').AsString;
        edtUnit.Text:= FieldByName('unit_name').AsString;
        edtPurchase.Text:= FieldByName('purchase_name').AsString;
        edtSGS.Text:= FieldByName('sgs_no').AsString;
        edtSGSEffect.Text:= FieldByName('sgs_date').AsString;
        if FieldByName('if_halogen').AsInteger=1 then
         chklogen.Checked:= True
        else
         chklogen.Checked:=False;
        edtPerNO.Text:= FieldByName('barch_no').AsString;
        edtRec_Qty.Text:= FieldByName('rece_qty').AsString;
        recQty:= FieldByName('rece_qty').AsCurrency;
        edtIQC_Qty.Text:= FieldByName('iqc_qty').AsString;
        if FieldByName('qty_qualified').AsBoolean then cbbCount.ItemIndex:= 1
        else
        begin
          if FieldByName('qty_qualified').AsString='' then cbbCount.ItemIndex:= -1
          else cbbCount.ItemIndex:= 0;
        end;
        if FieldByName('package_qualified').AsBoolean then cbbPage.ItemIndex:= 1
        else
        begin
          if FieldByName('qty_qualified').AsString='' then cbbPage.ItemIndex:= -1
          else cbbPage.ItemIndex:= 0;
        end;
        if FieldByName('hasheepreport').AsBoolean then cbbHasReport.ItemIndex:= 1
        else
        begin
          if FieldByName('qty_qualified').AsString='' then cbbHasReport.ItemIndex:= -1
          else cbbHasReport.ItemIndex:= 0;
        end;

        edtLength.Text:= FieldByName('part_size').AsString;
        edtTong.Text:= FieldByName('tong_thickness').AsString;
        edtPartThick.Text:= FieldByName('part_thickness').AsString;
        edtthick_tolerance.Text:=FieldByName('thick_tolerance').AsString;
        Memo2.Lines.Text:= FieldByName('appearance').AsString;
        effDate:= FieldByName('eff_Date').AsInteger;
        edtMake.Text:= FieldByName('manufacture_TDATE').AsString;
        edtExtrlDate.Text:= FieldByName('extrl_date').AsString;
        if FieldByName('if_standard').AsString='是' then
         chkIsStandard.Checked:=True
        else
         chkIsStandard.Checked:=False;
        if FieldByName('judge_result').AsString='合格' then
         cbbResult.ItemIndex:=0
        else
         if FieldByName('judge_result').AsString='不合格'
          then cbbResult.ItemIndex:=1;
        edtChecker.Text:= FieldByName('user_appr').AsString;
        if FieldByName('appr_user_ptr').AsString<>'' then
         edtChecker.Tag:= FieldByName('appr_user_ptr').AsInteger;
        edtCheckDate.Text:= FieldByName('appr_date').AsString;
        Memo1.Lines.Text:= FieldByName('remark').AsString;
        if status=3 then
        begin
          Panel2.Enabled:=False;
          btnSave.Enabled:=False;
        end;
        edtRec_Qty.Tag:=FieldByName('group_ptr').AsInteger;
      end;
    end;
  end;
end;

procedure TfrmModify.edtCheckDateEnter(Sender: TObject);
begin
  if Trim((Sender as TEdit).Text)='' then
  (Sender as TEdit).Text:= FormatDateTime('yyyy-MM-dd hh:mm:ss',getsystem_date(DM.adoTime,0));
end;

procedure TfrmModify.edtCheckDateExit(Sender: TObject);
var
  temp:TDateTime;
begin
  if ((Sender as TEdit).Text<>'') and (TryStrToDateTime(Trim((Sender as TEdit).Text),temp)=False) then
  begin
    ShowMessage('输入的日期格式不对，应例如：2015-11-11 08:00:00');
    (Sender as TEdit).SetFocus;
    Exit;
  end;
end;

procedure TfrmModify.edtExtrlDateEnter(Sender: TObject);
begin
//  if Trim(edtExtrlDate.Text)='' then edtExtrlDate.Text:=FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1));
end;

procedure TfrmModify.edtExtrlDateExit(Sender: TObject);
var
  temp:TDateTime;
begin
  if (Trim((Sender as TEdit).Text)<>'') and (TryStrToDate(Trim((Sender as TEdit).Text),temp)=False) then
  begin
    ShowMessage('输入的日期格式不对，应例如：2015-11-11');
    (Sender as TEdit).SetFocus;
    Exit;
  end;
end;

procedure TfrmModify.btnCheckerClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'empl_code/工号/180,employee_name/姓名/250';
    InputVar.Sqlstr := 'select rkey,empl_code,employee_name from data0005 where active_flag=''Y''';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtChecker.Text:= frmPick_Item_Single.adsPick.fieldbyname('empl_code').AsString;
      edtChecker.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
    end;
    edtCheckDate.SetFocus;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModify.btnPOClick(Sender: TObject);
var
  temp:currency ;
begin
  try
    frmPOSel:=TfrmPOSel.Create(Application);
    if edtPO.Tag<>0 then frmPOSel.rkey71:=edtPO.Tag;
    if frmPOSel.ShowModal= mryes then
    begin
      with DM.adoPO do
      begin
        edtPO.Tag:= FieldByName('rkey').AsInteger;
        edtPO.Text:= FieldByName('PO_NUMBER').AsString;
        edtSupplierName.Text:= FieldByName('ABBR_NAME').AsString;
        edt_INV.Text:= FieldByName('INV_PART_NUMBER').AsString;
        edt_Date.Text:= FieldByName('REQ_DATE').AsString;
        edtINV_Name.Tag:= FieldByName('INVT_PTR').AsInteger;
        edtINV_Name.Text:=FieldByName('INV_NAME').AsString;
        edtOrderCount.Text:=FieldByName('QUAN_ORD').AsString;
        edtCheckQty.Text:=FieldByName('NotCheck').AsString;

     //   edtRec_Qty.Text:=FieldByName('NotCheck').AsString;
     //   edtRec_QtyExit(Sender);
        edtModel.Text:=FieldByName('extra_req').AsString;
        edtDESC.Text:=FieldByName('INV_DESCRIPTION').AsString;
        edtUnit.Text:= FieldByName('unit_name').AsString;
        edtPurchase.Text:= FieldByName('purchase_name').AsString;
        edtSGS.Text:=FieldByName('SGS_NO').AsString;
        if FieldByName('TestDate').AsString<>'' then
         edtSGSEffect.Text:=FormatDateTime('yyyy-MM-dd',FieldByName('TestDate').Value);
        if FieldByName('halogen').AsInteger=0 then    //无卤素
          chklogen.Checked:=False
        else
          chklogen.Checked:=True;
        edtHT.Text:=FieldByName('HaTong').AsString;     //是否含铜
        edtLength.Text:= getleng(FieldByName('IES_PARAMETER_VALUE4').AsString);
        edtTong.Text:=gettong(FieldByName('IES_PARAMETER_VALUE3').AsString);
        edtPartThick.Text:= FieldByName('IES_PARAMETER_VALUE2').AsString; //厚度
        if (edtPartThick.Text<>'') and trystrtocurr(trim(edtPartThick.Text),temp) then
        edtthick_tolerance.Text:=get_thick_tolerance(FieldByName('group_ptr').AsInteger,
                                                     edtPartThick.Text,edtHT.Text);
        edtRec_Qty.Tag:=FieldByName('group_ptr').AsInteger;
        edtMake.Text:= FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1));
        effDate:= FieldByName('eff_Date').AsInteger;
        if effDate = 0 then edtExtrlDate.Text:=''
        else edtExtrlDate.Text:= DateTimeToStr(IncDay(StrToDateTime(edtMake.Text),effDate));
      end;
      edtPerNO.SetFocus;
    end;
  finally
    frmPOSel.Free;
  end;
end;

procedure TfrmModify.btnSaveClick(Sender: TObject);
var
  halogen,sgs_effectdate,extraeff:string;
  i,seedRkey:Integer;
begin
  if Trim(edtPO.Text)='' then
  begin
    ShowMessage('订单号不能为空');
    Exit;
  end;
//  if Trim(edtPerNO.Text)='' then
//  begin
//    ShowMessage('批号不能为空');
//    Exit;
//  end;
  if Trim(edtMake.Text)='' then
  begin
    ShowMessage('制造日期不能为空');
    edtMake.SetFocus;
    Exit;
  end;
//  if Trim(edtExtrlDate.Text)='' then
//  begin
//    ShowMessage('有效期不能为空');
//    edtExtrlDate.SetFocus;
//    Exit;
//  end;
  if Trim(edtRec_Qty.Text)='' then  edtRec_Qty.Text:='0';
  if Trim(edtIQC_Qty.Text)='' then  edtIQC_Qty.Text:='0';
  if Trim(edtRec_Qty.Text)='0' then
  begin
    ShowMessage('请输入来料数量');
    Exit;
  end;
  if chklogen.Checked then halogen:='1'
  else halogen:='0';
  if Trim(edtSGSEffect.Text)='' then  sgs_effectdate:='null'
  else sgs_effectdate:=QuotedStr(Trim(edtSGSEffect.Text));
  if (effDate = 0) and (Trim(edtExtrlDate.Text) = '') then extraeff:='null'
  else extraeff := QuotedStr(Trim(edtExtrlDate.Text));
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select (QUAN_ORD - QUAN_REJD + '+ FloatToStr(recQty) +') AS NOTCHECK_QTY FROM data0071 where rkey='+ IntToStr(edtPO.Tag);
    Open;
    if ExRoundTo(FieldByName('NOTCHECK_QTY').AsFloat,4) < ExRoundTo(StrToFloat((edtRec_Qty.Text)),4) then
    begin
      ShowMessage('来料数量大于待检查数量，可能有其它人同时操作，请确认后重新输入');
      edtRec_Qty.SetFocus;
      Exit;
    end;
  end;

  if status=1 then
  begin
    if cbbCount.Text='' then
    begin
      ShowMessage('数量是否合格不能为空');
      cbbCount.SetFocus;
      Exit;
    end;
    if cbbPage.Text='' then
    begin
      ShowMessage('包装是否合格不能为空');
      cbbPage.SetFocus;
      Exit;
    end;
    if cbbHasReport.Text='' then
    begin
      ShowMessage('是否有检验报告不能为空');
      cbbHasReport.SetFocus;
      Exit;
    end;
    if Trim(edtMake.Text)= FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1)) then
    begin
      if MessageDlg('制造日期为当前日期，请确认制造日期是否正确？',mtWarning,[mbYes,mbNo],0)=mrno then
      begin
        edtmake.SetFocus;
        exit;
      end;
    end;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,seed_value,seed_flag from data0004 where table_name=''data0391''';
      Open;
      if (FieldByName('seed_value').AsString<>edtRepNo.Text) and (FieldByName('seed_flag').AsInteger<>1) then
      begin
        if MessageDlg('IQC编号已经被使用，是否自动更新为新IQC编号？',mtWarning,[mbYes,mbNo],0)=mryes then
          edtRepNo.Text:= FieldByName('seed_value').AsString
        else exit;
      end;
      seedRkey:= FieldByName('rkey').AsInteger;
    end;
             //更新04表 插入391表  更新71表已申请检验数量
    try
      DM.ADOConnection1.BeginTrans;
      MyDataClass:=TMyDataClass.Create(DM.ADOConnection1);
      Update_Seed(seedRkey);
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='insert into Data0391(iqc_number, rkey71, rkey17, supplier_model, sgs_no, sgs_date, '+
                  ' rece_qty, iqc_qty, barch_no,appl_user_ptr, appl_date,if_halogen,ht_remark,part_size, '+
                  ' tong_thickness,part_thickness,thick_tolerance,manufacture_TDATE, extrl_date,status, '+
                  ' qty_qualified,package_qualified,hasheepreport,DELIVER_NUMBER)'+ #13+
                  ' values('+ QuotedStr(edtRepNo.Text) + ',' + IntToStr(edtPO.Tag) + ',' + IntToStr(edtINV_Name.Tag) + ',' +
                  QuotedStr(Trim(edtModel.Text)) + ',' + QuotedStr(Trim(edtSGS.Text)) + ',' + sgs_effectdate + ',' +
                  FloatToStr(ExRoundTo(StrToFloat(Trim(edtRec_Qty.Text)),4)) + ',' + Trim(edtIQC_Qty.Text) + ',' + QuotedStr(Trim(edtPerNO.Text)) + ',' +
                  user_ptr + ',getdate(),' + halogen + ',' +
                  QuotedStr(Trim(edtHT.Text)) + ',' + QuotedStr(Trim(edtLength.Text)) + ',' + Trim(edtTong.Text) + ',' +
                  QuotedStr(Trim(edtPartThick.Text)) + ',' + QuotedStr(Trim(edtthick_tolerance.Text))+ ',' +
                  QuotedStr(Trim(edtMake.Text))+',' + extraeff +',1,'+
                  IntToStr(cbbCount.ItemIndex) + ','+ IntToStr(cbbPage.ItemIndex)+','+ IntToStr(cbbHasReport.ItemIndex)+ ',' +
                  QuotedStr(Trim(edt1.Text)) +')';
//        ShowMessage(SQL.Text);
        ExecSQL;
      end;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0071 set QUAN_REJD= QUAN_REJD + ' + FloatToStr(ExRoundTo(StrToFloat(Trim(edtRec_Qty.Text)),4)) + ' where rkey=' + IntToStr(edtPO.Tag);
        ExecSQL;
      end;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey from data0391 where iqc_number=' + QuotedStr(edtRepNo.Text);
        Open;
        if not IsEmpty then
        begin
          rkey391:=FieldByName('rkey').AsInteger;
        end;
      end;
      with dm.adoTmp do
      begin
        Close;
        SQL.Clear;
        for i:=1 to 5 do
        begin
          SQL.Text:=SQL.Text + 'insert into data0392(rkey391,sr_no) values('+ IntToStr(rkey391) + ',' + IntToStr(i)+')' + #13;
        end;
        ExecSQL;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult:=mrYes;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
  if status=2 then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey, iqc_number, rkey71, rkey17, supplier_model, sgs_no, sgs_date, rece_qty, iqc_qty, barch_no, appl_user_ptr, '+
                  ' appl_date, appr_user_ptr, appr_date, auth_user_ptr, auth_date, if_halogen, appearance, part_size, part_thickness, '+
                  ' tong_thickness, thick_tolerance, ht_remark, if_standard, extrl_date,manufacture_TDATE, judge_result, remark, status, '+
                  ' qty_qualified,package_qualified,hasheepreport,DELIVER_NUMBER '+#13+
                  ' from data0391 '+ #13+
                  ' where rkey=' + IntToStr(rkey391);
        Open;
        Edit;
        FieldByName('barch_no').AsString:= trim(edtPerNO.Text);
        FieldByName('rece_qty').AsString:= trim(edtRec_Qty.Text);
        FieldByName('iqc_qty').AsString:= Trim(edtIQC_Qty.Text);
        FieldByName('appearance').AsString:=Trim(Memo2.Lines.Text);
        FieldByName('thick_tolerance').AsString:=Trim(edtthick_tolerance.Text);
        if chkIsStandard.Checked then
         FieldByName('if_standard').AsString:='是'
        else
         FieldByName('if_standard').AsString:='否';

        if cbbCount.ItemIndex=1 then FieldByName('qty_qualified').AsBoolean:= True
        else FieldByName('qty_qualified').AsBoolean:= False;

        if cbbPage.ItemIndex=1 then FieldByName('package_qualified').AsBoolean:= True
        else FieldByName('package_qualified').AsBoolean:= False;

        if cbbHasReport.ItemIndex=1 then FieldByName('hasheepreport').AsBoolean:= True
        else FieldByName('hasheepreport').AsBoolean:= False;

        if Trim(edtExtrlDate.Text)<>'' then
         FieldByName('extrl_date').AsDateTime:= StrToDate(Trim(edtExtrlDate.Text))
        else FieldByName('extrl_date').AsVariant := null;
        if Trim(edtMake.Text)<>'' then
         FieldByName('manufacture_TDATE').AsDateTime:= StrToDate(Trim(edtMake.Text));
        FieldByName('judge_result').AsString:= cbbResult.Text;
        FieldByName('remark').AsString:= Memo1.Lines.Text;
        if  Trim(edtChecker.Text)<>'' then
         FieldByName('appr_user_ptr').AsInteger:=edtChecker.Tag;
        if Trim(Trim(edtCheckDate.Text))<>'' then
         FieldByName('appr_date').AsDateTime:=StrToDateTime(edtCheckDate.Text);
        FieldByName('DELIVER_NUMBER').AsString := Trim(edt1.Text);
        Post;
      end ;
      
      if ExRoundTo(StrToFloat((edtRec_Qty.Text)),4)<> ExRoundTo(recQty,4) then
      begin
        if (StrToFloat(Trim(edtRec_Qty.Text))- recQty)>=0 then
        begin
          with DM.adoTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='update data0071 set QUAN_REJD= QUAN_REJD + ' + FloatToStr(Abs( StrToFloat(Trim(edtRec_Qty.Text))- recQty)) + ' where rkey=' + IntToStr(edtPO.Tag);
            ExecSQL;
          end;
        end
        else
        begin
          with DM.adoTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='update data0071 set QUAN_REJD= QUAN_REJD - ' + FloatToStr(Abs( StrToFloat(Trim(edtRec_Qty.Text))- recQty)) + ' where rkey=' + IntToStr(edtPO.Tag);
            ExecSQL;
          end;
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      ModalResult:=mrYes;
    except
      on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TfrmModify.edtRec_QtyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edtIQC_Qty.SetFocus;
    Exit;
  end;
  if not (Key in ['0'..'9',#8,#46]) then Abort;
end;


procedure TfrmModify.edtRec_QtyExit(Sender: TObject);
var
  temp:Extended;
begin
  if Trim(edtRec_Qty.Text)<>'' then
  begin
    if Pos('.',Trim(edtRec_Qty.Text))=1 then
    begin
      ShowMessage('输入的数据格式不对，请重新输入');
      edtIQC_Qty.Text:='';
      edtRec_Qty.SetFocus;
      Exit;
    end;
    if TryStrToFloat(Trim(edtRec_Qty.Text),temp) then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select iqc_qty from data0393 where GROUP_PTR='+inttostr(edtRec_Qty.Tag)+' and '+
                  Trim(edtRec_Qty.Text) + ' > begin_qty and '+ Trim(edtRec_Qty.Text) + ' <= end_qty ';
        Open;
        if not IsEmpty  then
        begin
          if FieldByName('iqc_qty').AsInteger=0 then
            edtIQC_Qty.Text:=edtRec_Qty.Text
          else
           edtIQC_Qty.Text:= FieldByName('iqc_qty').AsString;
        end
        else
         edtIQC_Qty.Text:='0';
      end;
    end
    else
    begin
      ShowMessage('输入的数据格式不对，请重新输入');
      edtIQC_Qty.Text:='0';
      edtRec_Qty.SetFocus;
      Exit;
    end;
  end;
end;

function TfrmModify.getleng(parLeng: string): string;
var
  leng:string;
begin //因为原始值不符合命名规范，可以把原始值加入到TStringList，然后用indexof 取出索引用case...of ..
  leng:=parLeng;
  if leng= '18*24' then leng:='457*610';
  if leng='30.3*48' then leng:='770*1219';
  if leng= '32.6*48' then leng:='828*1219';
  if leng= '32.8*49' then leng:='833*1245';
  if leng= '34.4*49' then leng:= '874*1245';
  if leng= '35*49' then leng:= '889*1245';
  if leng= '36*48' then leng:='914*1219';
  if leng='37*49' then leng:='940*1245';
  if leng= '40*48' then leng:='1016*1219';
  if leng= '40.5*49' then leng:='1029*1245';
  if leng= '41*49' then leng:='1041*1245';
  if leng= '42*48' then leng:='1067*1219';
  if leng= '42.5*48.5' then leng:='1080*1232';
  if leng= '43*49' then leng:='1092*1245';
  if leng= '49.2*49' then leng:= '1250*1245';
  if leng= '51*49' then leng:='1295*1245';
  if leng= '51.5*49' then leng:= '1308*1245';
  if leng= '51.6*49' then leng:='1310*1245';
  Result:= leng;
end;

function TfrmModify.gettong(tong: string): string;
var
  strtong:string;
begin
  strtong:='0';
  tong:=UpperCase(tong);
  if tong='T/T' then strtong:='12';
  if tong='0.33/0.33' then strtong:='12';
  if tong='15/15' then strtong:='15';
  if tong='0.5/0.5' then strtong:='17';
  if tong='H/H' then strtong:='17';
  if tong='1/1' then strtong:='35';
  if tong='2/2' then strtong:='70';
  if tong='3/3' then strtong:='105';
  if tong='4/4' then strtong:='140';
  if tong='CL1/CL1' then strtong:='35';
  if tong='C1/C1' then strtong:='35';
  if tong='CLH/CLH' then strtong:='17';
  if tong='CH/CH' then strtong:='17';
  if tong='LP1/LP1-C' then strtong:='35';
  Result:=strtong;
end;


procedure TfrmModify.edtIQC_QtyKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#46]) then Abort;
end;

procedure TfrmModify.edtIQC_QtyExit(Sender: TObject);
begin
  if Trim(edtIQC_Qty.Text)='' then
   edtIQC_Qty.Text:='0'
  else
   begin
     if  StrToFloat(edtIQC_Qty.Text)>StrToFloat(edtRec_Qty.Text) then
     begin
       edtIQC_Qty.SetFocus;
       ShowMsg('抽检数量不能大于来料数量',1);
     end;
   end;

end;

function TfrmModify.get_thick_tolerance(group: Integer;
  thick,tong: string): string;
begin
  Result:='';
 with dm.adoTmp do
  begin
    Close;
    SQL.Text:='select b_l_tolerance,c_m_tolerance from data0394 '+
              'where GROUP_PTR='+inttostr(group)+
              ' and begin_qty<='+thick+
              ' and end_qty>='+thick;
    Open;
    if not IsEmpty then
    begin
      Result:=fieldbyname('c_m_tolerance').AsString;
//     if (Pos('N',tong)>0) or (Pos('不',tong)>0) then
//      Result:=fieldbyname('c_m_tolerance').AsString
//     else
//      Result:=fieldbyname('b_l_tolerance').AsString
    end;
  end;
end;

procedure TfrmModify.edtMakeEnter(Sender: TObject);
begin
//  if Trim(edtMake.Text)='' then edtMake.Text:=FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1));
end;

procedure TfrmModify.edtMakeChange(Sender: TObject);
var
  tmp:TDateTime;
begin
  if (Trim(edtMake.Text)<>'') and (TryStrToDate(Trim(edtMake.Text),tmp)=True) then
  begin
    if effDate = 0 then edtExtrlDate.Text:= ''
    else edtExtrlDate.Text:=DateTimeToStr(IncDay(strtodatetime(Trim(edtMake.Text)),effDate-1));
  end;
end;

procedure TfrmModify.edtCheckerExit(Sender: TObject);
begin
  if Trim(edtChecker.Text)<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,empl_code,employee_name from data0005 where active_flag=''Y'' and empl_code= '+ QuotedStr(Trim(edtChecker.Text));
      Open;
      if not IsEmpty then
      begin
        edtChecker.Tag:= FieldByName('rkey').AsInteger;
        edtCheckDate.SetFocus;
      end
      else
      begin
        ShowMessage('此员工离职或不存在');
        edtChecker.SetFocus;
        Exit;
      end;
    end;
  end;
end;

end.
