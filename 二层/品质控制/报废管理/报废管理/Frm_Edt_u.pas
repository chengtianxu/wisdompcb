unit Frm_Edt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh, Mask, Menus,
  ActnList, ComCtrls;

type
  TFrm_Edt = class(TForm)
    BtSv: TBitBtn;
    BtClose: TBitBtn;
    Label1: TLabel;
    Edit1: TMaskEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BtWorkNo: TBitBtn;
    ActionList1: TActionList;
    ActSv: TAction;
    ActClose: TAction;
    CkBAudit: TCheckBox;
    Label10: TLabel;
    DtRej: TDateTimePicker;
    TmRej: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    Edit10: TEdit;
    Edit9: TEdit;
    Edit7: TEdit;
    Edit11: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label16: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    BtDefault: TBitBtn;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    Edit8: TMaskEdit;
    BitBtn3: TBitBtn;
    BtDept: TBitBtn;
    Edit6: TEdit;
    BitBtn5: TBitBtn;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    Edit12: TEdit;
    Label23: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtSvClick(Sender: TObject);
    procedure BtWorkNoClick(Sender: TObject);
    procedure BtDefaultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BtDeptClick(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    vrkey0039:integer;
    vrkey0006:integer;
    vqty_backlog,vpanels:integer;   //当前在线数 减 报废待审核数
    vreprkey0034:integer;
    FisEdit:boolean;
    FisInVld:boolean;
    FContrNo:boolean;
    Frkey06:integer;
    procedure GetBoxVals(wo_ptr1, wo_ptr2,step: integer);
    procedure Set_reprkey0034(const Value: integer);
    procedure Set_rkey0006(const Value: integer);
    procedure Set_rkey0039(const Value: integer);
    procedure SavValue;
  public
     EditMode:integer;        //0新增，１编辑，２检查
     qty_org_rej,PNL_org_rej:integer;
     step :integer;
     flow_no :integer;
     rkey0034:integer;
     key0058 :integer;

     smrb_no:string;
     FaFct:array[0..9] of integer;
     property rkey0006:integer write Set_rkey0006;
     property rkey0039:integer write Set_rkey0039;
     property reprkey0034:integer write Set_reprkey0034;
  end;


implementation

uses
   DM_u, ConstVar ,Pick_Item_Single ,Frm_WkP_u;

{$R *.dfm}


procedure TFrm_Edt.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(wm_nextdlgctl,0,0);
  end;
end;

procedure TFrm_Edt.SavValue;
var
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime;
begin
  dm.Get_ServerDatetime(valDateTime, valDate,valdt,valymd);
  if EditMode = 0 then
   begin
    dm.adoq0058.Close ;
    dm.adoq0058.Parameters.ParamValues['rkey0058']:=null;
    dm.adoq0058.Prepared ;
    dm.adoq0058.Open ;
    dm.adoq0058.Append ;
   end
  else
    dm.adoq0058.Edit ;

  dm.adoq0058warehouse_ptr.asinteger :=ComboBox2.Tag; //工厂
  dm.adoq0058wo_ptr.asinteger := vrkey0006;    //作业单号
  dm.adoq0058tran_ptr.asinteger := 0 ;         //成品入库后报废，在此为0

  dm.adoq0058mrb_no.asstring := Edit1.text;     //报废单号
  
  dm.adoq0058reject_ptr.AsInteger := vrkey0039;  //缺陷ptr

  if dm.ADOQ564834.Locate('step_no',strtoint(copy(ComboBox1.Text,1,3)),[]) then
    dm.adoq0058dept_ptr.asinteger := dm.ADOQ564834.fieldbyname('d0034_rkey').asinteger;  //申请部门ptr
  dm.adoq0058flow_no.asinteger := flow_no;   //
  dm.adoq0058step.asinteger := strtoint(copy(ComboBox1.Text,1,3));//申请工序的步骤号
  dm.adoq0058resp_dept_ptr.AsInteger := vreprkey0034;         //责任部门34.rkey

  dm.adoq0058qty_org_rej.AsInteger := strtointdef(edit4.Text,0) ; //申请报废数量
  dm.adoq0058panels.AsInteger := strtointdef(edit8.Text,0) ;      //报废panel数
  dm.adoq0058tdatetime.asdatetime := trunc(DtRej.Date)+frac(TmRej.Time);    //报废日期
  dm.adoq0058empl_ptr.asstring := user_ptrCaption;            //录入人
  dm.adoq0058StepNow.AsInteger := step;                       //报废时作业单所在当前步骤
  if CkBAudit.Checked then
   begin
    dm.ADOQ0058qty_reject.AsInteger := strtointdef(edit4.Text,0);   //报废审核数量pcs
    dm.ADOQ0058AUDIT_EMPL_PTR.AsString := user_ptrCaption ;
    dm.ADOQ0058AUDIT_DATETIME.AsDateTime := dm.adoq0058tdatetime.asdatetime ;
   end
  else
    dm.adoq0058qty_reject.AsInteger := 0;
  dm.ADOQ0058REFERENCE.Value:= Edit12.Text;

  DM.Tmp.Close;        //最后工序提交入库数，但仓库未审核
  DM.Tmp.SQL.Text:='SELECT a.QTY_BACKLOG,b.QUAN_ALLREJ, '+
                   'a.PANELS,b.QUAN_ALLpnl '+       //(冲压工序后实际PNl已不存在，但应有Virtual PNls)
                   'FROM dbo.Data0056 a inner join data0006 b '+
                   'on a.wo_ptr=b.rkey WHERE WO_PTR ='+inttostr(vrkey0006) ;

  DM.Tmp.Open;
  if DM.Tmp.Fields[0].AsInteger-DM.Tmp.Fields[1].AsInteger+qty_org_rej<strtoint(Edit4.Text) then
  begin
    showmessage('报废PCS超过当前在线可报废数量：'+inttostr(DM.Tmp.Fields[0].AsInteger-DM.Tmp.Fields[1].AsInteger)+',请修改!');
    Edit5.Text:=DM.Tmp.Fields[0].AsString;
    Edit9.Text:=DM.Tmp.Fields[2].AsString;
    Edit11.Text:=DM.Tmp.Fields[1].AsString+'PCS / '+DM.Tmp.Fields[3].AsString+'PNLS';
    Edit4.SetFocus;
    exit;
  end;
  if Edit9.Text<>'0' then
  begin
    if DM.Tmp.Fields[2].AsInteger-DM.Tmp.Fields[3].AsInteger+PNL_org_rej<strtoint('0'+Edit8.Text) then
    begin
      showmessage('报废PNLS超过当前在线可报废PNLS：'+inttostr(DM.Tmp.Fields[2].AsInteger-DM.Tmp.Fields[3].AsInteger)+',请修改!');
      Edit5.Text:=DM.Tmp.Fields[0].AsString;
      Edit9.Text:=DM.Tmp.Fields[2].AsString;
      Edit11.Text:=DM.Tmp.Fields[1].AsString+'PCS / '+DM.Tmp.Fields[3].AsString+'PNLS';
      Edit4.SetFocus;
      exit;
    end;

    if DM.Tmp.Fields[0].AsInteger-DM.Tmp.Fields[1].AsInteger+qty_org_rej-strtoint(Edit4.Text)<DM.Tmp.Fields[2].AsInteger-DM.Tmp.Fields[3].AsInteger+PNL_org_rej-strtoint('0'+Edit8.Text) then
    begin
      showmessage('报废后在线PNLS超过当前在线PCS,请修改!');
      Edit5.Text:=DM.Tmp.Fields[0].AsString;
      Edit9.Text:=DM.Tmp.Fields[2].AsString;
      Edit11.Text:=DM.Tmp.Fields[1].AsString+'PCS / '+DM.Tmp.Fields[3].AsString+'PNLS';
      Edit4.SetFocus;
      exit;
    end;

    if edit8.Enabled and ((DM.Tmp.Fields[0].AsInteger-DM.Tmp.Fields[1].AsInteger+qty_org_rej-strtoint(Edit4.Text))/strtoint(Edit10.Text)>DM.Tmp.Fields[2].AsInteger-DM.Tmp.Fields[3].AsInteger+PNL_org_rej-strtoint('0'+Edit8.Text)) then
    begin
      showmessage('报废后在线PNLS与当前在线PCS不符合逻辑,请修改!'+#13+'若当前工序在线PNL已不存在,PNL清零后再打报废.');
      Edit5.Text:=DM.Tmp.Fields[0].AsString;
      Edit9.Text:=DM.Tmp.Fields[2].AsString;
      Edit11.Text:=DM.Tmp.Fields[1].AsString+'PCS / '+DM.Tmp.Fields[3].AsString+'PNLS';
      Edit4.SetFocus;
      exit;
    end;
  end;

  try
    DM.ADOCon.BeginTrans;
    if (EditMode=0) and FContrNo then
    begin
      Edit1.text:=DM.Get_Data0004(1,Edit1.text);
      dm.adoq0058mrb_no.asstring := Edit1.text;     //报废单号
    end;
    smrb_no:=Edit1.text;

    dm.adoq0058.UpdateBatch;

    with DM.Tmp do
    begin
      Close;
      if CkBAudit.Checked then
       begin                        //配料表
        SQL.Text:='update data0492 set QTY_REJECT=QTY_REJECT+'+edit4.Text+            //已报废PCS
                                            ',WIP_QTY=WIP_QTY-'+edit4.Text+            //WIP数
                                            ' where cut_no in (SELECT CUT_NO '+
                                            'FROM Data0006 where rkey='+inttostr(vrkey0006)+')';

        ExecSQL;            //作业单
        SQL.Text:='update data0006 set QUAN_REJ=QUAN_REJ+'+edit4.Text+                 //已报废PCS
                                            ',QUAN_ALLREJ=QUAN_ALLREJ-'+inttostr(qty_org_rej)+  //待审报废PCS 直接审核
                                            ',QUAN_ALLpnl=QUAN_ALLpnl-'+inttostr(pnl_org_rej)+  //待审报废PCS 直接审核
                                            ' where rkey='+inttostr(vrkey0006);
        ExecSQL;            //WIP
        SQL.Text:='update data0056 set QTY_BACKLOG=QTY_BACKLOG-'+edit4.Text+   //在线PCS
                                            ',PANELS=PANELS-'+edit8.Text+             //在线PNLS
                                            ' where wo_ptr='+inttostr(vrkey0006)+' and QTY_BACKLOG>='+edit4.Text;
        if ExecSQL=0 then
        begin
          DM.ADOCon.RollbackTrans;
          showmessage('在线数据状态发生改变，审核失败');
          exit;
        end;

          //WIP过数  申请工序既报废截止，后工序实际未做，但有过数，因报废来不及输入电脑
        SQL.Text:='update data0048 set QTY_PROD=QTY_PROD-'+edit4.Text+      //报废前工序生产数应扣除
                                            ',QTY_REJECT=QTY_REJECT+'+edit4.Text+
                                            ',PANELS=PANELS-'+edit8.Text+           //在线                                                                                       //当前步骤
                                            ' where wo_ptr='+inttostr(vrkey0006)+' and Data0048.STEP_NO>='+copy(ComboBox1.Text,1,3)+' and Data0048.STEP_NO<'+copy(ComboBox1.Items[ComboBox1.Items.count-1],1,3);
        ExecSQL;
                                           //9:生产结束
        SQL.Text:='update data0006 set PROD_STATUS=9 FROM Data0006 a INNER JOIN Data0056 b ON a.RKEY=b.WO_PTR '+
                  'WHERE (b.TO_BE_STOCKED=0) AND (b.QTY_BACKLOG=0) AND (a.PROD_STATUS<>9)' ;
        ExecSQL;

        SQL.Text:='delete from data0056 where to_be_stocked=0 AND qty_backlog=0 and wo_ptr='+inttostr(vrkey0006);
        ExecSQL;
       end
      else
       begin                           //报废待审核数量                                  //old rej Qty
        SQL.Text:='update data0006 set QUAN_ALLREJ=QUAN_ALLREJ-'+inttostr(qty_org_rej)+'+'+edit4.Text+
                           ',QUAN_ALLpnl=QUAN_ALLPNL-'+inttostr(PNL_org_rej)+'+'+dm.adoq0058panels.AsString+
                                            ' where rkey='+inttostr(vrkey0006);
        ExecSQL;
       end;
    end;

    DM.ADOCon.CommitTrans ;
    FisEdit := true;
    if EditMode = 1 then  modalresult := mrok
    else begin
      edit3.Text := '';
      Label4.Caption := '';
      Label21.Caption := '';
      Edit4.Text := '';
      Edit8.Text := '';
      Edit6.Text := '';
      Label8.Caption := '';
      Edit2.SetFocus ;
      Edit1.text:=DM.Get_Data0004(0,Edit1.text);
    end;
  except
    on E: Exception do
    begin
      DM.ADOCon.RollbackTrans ;
      MessageDlg(E.Message,mtError, [mbOk], 0);
    end;
  end;
end;

procedure TFrm_Edt.BtSvClick(Sender: TObject);
begin
  if not BtSv.Enabled then exit;
  SelectNext(ActiveControl,true,true);
  if FisInVld then exit;
  FisInVld:=false;
  if trim(Edit1.Text) = '' then
  begin
    messagedlg('报废单号不能为空,请输入!',mtinformation,[mbOk],0);
    Edit1.Setfocus;
    exit;
  end;
  if combobox1.ItemIndex=-1 then
  begin
    messagedlg('请输入申请工序!',mtinformation,[mbOk],0);
    Combobox1.Setfocus;
    exit;
  end;

  if trim(Edit3.Text)='' then
  begin
    messagedlg('请输入缺陷代号!',mtinformation,[mbOk],0);
    Edit3.Setfocus;
    exit;
  end;
  if trim(Edit6.Text)='' then
  begin
    messagedlg('请输入责任部门!',mtinformation,[mbOk],0);
    btDept.Setfocus;
    exit;
  end;
  if trim(Edit4.Text) = '' then
  begin
    messagedlg('请输入报废数量!',mtinformation,[mbOk],0);
    Edit4.Setfocus;
    exit;
  end;
  if strtoint('0'+edit8.Text)>strtoint('0'+Edit4.Text) then
  begin
    messagedlg('报废PNLS不能大于报废PCS!',mtinformation,[mbOk],0);
    Edit4.Setfocus;
    exit;
  end;

  if strtointdef(edit4.Text,0) = 0 then
  begin
    messagedlg('报废数量不允许为0,若为0请删除此记录!' ,mtinformation,[mbok],0);
    Edit4.Text;
    exit;
  end;

  if edit8.Enabled and (strtoint('0'+edit8.Text)*strtoint(Edit10.Text)>strtoint('0'+Edit4.Text)) then
  begin
    if messagedlg('报废PNLS数与报废PCS数正确吗，请确认?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Edit4.Setfocus;
      exit;
    end;
  end;
  
  if strtoint(edit4.Text)>vqty_backlog+qty_org_rej then
  begin
    messagedlg('报废PCS数不能超过在线有效PCS!',mtinformation,[mbok],0);
    Edit4.Text;
    exit;
  end;
  
  if trim(edit8.Text) = '' then
      Edit8.Text := '0'
  else begin
    Edit8.Text :=trim(edit8.Text);
    if strtoint(edit8.Text)>vpanels+pnl_org_rej then
    begin
      messagedlg('报废PNLS数不能超过在线有效PNLS!',mtinformation,[mbok],0);
      edit8.Text;
      exit;
    end;
  end;
  SavValue;
end;

procedure TFrm_Edt.BtWorkNoClick(Sender: TObject);
var
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime ;
  InputVar: PDlgInput ;
  s:string;
  i:integer;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
   s :='SELECT Data0006.WORK_ORDER_NUMBER,Data0025.MANU_PART_NUMBER AS PartMANU_PART_NUMBER,'
               +'Data0025.MANU_PART_DESC AS PartMANU_PART_DESC,'
               +'Data0006.RKEY,data0056.REFERENCE, '
               +'Data0056.PANELS, Data0006.BOM_PTR,'
               +'Data0056.QTY_BACKLOG as QTY_BACKLOG,data0006.QUAN_ALLREJ,data0006.QUAN_ALLpnl,'
               +'Data0006.PARTS_PER_PANEL, Data0056.TO_BE_STOCKED,'
               +'Data0006.FLOW_NO, Data0056.RKEY AS d0056_rkey, Data0056.STEP,'
               +'Data0034.DEPT_CODE, Data0056.DEPT_PTR,'
               +'Data0034.DEPT_PTR AS deptptr,'
               +'isnull(d15_2.abbr_name,d15_1.abbr_name) abbr_name,'
               +'isnull(d15_2.rkey,d15_1.rkey) rkey15 '
        +'FROM Data0006 INNER JOIN '
               +'Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN '
               +'Data0056 ON Data0006.RKEY = Data0056.WO_PTR INNER JOIN '
               +'Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY inner join '
               +'data0492 on data0006.cut_no=data0492.cut_no inner join '
               +'data0015 d15_1 on data0492.whouse_ptr=d15_1.rkey left join '
               +'data0015 d15_2 on data0056.loc_ptr=d15_2.rkey';

  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/130,PartMANU_PART_NUMBER/本产编号/90,'+
    'PartMANU_PART_DESC/客户型号/130,step/步骤/10,dept_code/当前工序/30,'+
    'qty_backlog/WIP 数量/60,abbr_name/工厂/60,REFERENCE/周期/40';
    InputVar.Sqlstr := s ;
    InputVar.AdoConn := DM.ADOCon ;
    frmPick_Item_Single2.InitForm_New(InputVar)  ;
    if frmPick_Item_Single2.ShowModal = mrok then
    begin
      if frmPick_Item_Single2.adsPick.IsEmpty then exit;
      ComboBox2.Tag:=frmPick_Item_Single2.adsPick.fieldbyname('rkey15').asinteger;
      for i:=0 to 9 do
        if FaFct[i]=ComboBox2.Tag then begin ComboBox2.ItemIndex:=i;break;end;
      Edit11.Text := frmPick_Item_Single2.adsPick.fieldbyname('QUAN_ALLREJ').asstring+'PCS / '+frmPick_Item_Single2.adsPick.fieldbyname('QUAN_ALLpnl').asstring+'PNLS';
      Edit2.Text := frmPick_Item_Single2.adsPick.fieldbyname('work_order_number').asstring;
      Edit5.Text := frmPick_Item_Single2.adsPick.fieldbyname('qty_backlog').asstring;
      Edit9.Text := frmPick_Item_Single2.adsPick.fieldbyname('panels').asstring;
      Edit10.Text := frmPick_Item_Single2.adsPick.fieldbyname('parts_per_panel').asstring;
      Edit7.Text := frmPick_Item_Single2.adsPick.fieldbyname('dept_code').asstring;
      vqty_backlog := frmPick_Item_Single2.adsPick.fieldbyname('qty_backlog').asinteger-frmPick_Item_Single2.adsPick.fieldbyname('QUAN_ALLREJ').asinteger ;
      vpanels := frmPick_Item_Single2.adsPick.fieldbyname('panels').asinteger-frmPick_Item_Single2.adsPick.fieldbyname('QUAN_ALLpnl').asinteger ;
      step := frmPick_Item_Single2.adsPick.fieldbyname('step').asinteger;
      flow_no := frmPick_Item_Single2.adsPick.fieldbyname('flow_no').asinteger;
      Label11.Caption:=frmPick_Item_Single2.adsPick.fieldbyname('abbr_name').asstring;
      Edit12.Text :=frmPick_Item_Single2.adsPick.fieldbyname('REFERENCE').asstring;
      Label19.Caption:=frmPick_Item_Single2.adsPick.fieldbyname('PartMANU_PART_NUMBER').asstring;
      Label20.Caption:=frmPick_Item_Single2.adsPick.fieldbyname('PartMANU_PART_DESC').asstring;

      vrkey0006 := frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;

     // if Frkey06=vrkey0006 then abort;

      GetBoxVals(vrkey0006,vrkey0006,step);
      edit3.SetFocus;
      FisInVld:=false;
      Button1.Enabled:=Edit9.Text<>'0';
      if frmPick_Item_Single2.adsPick.fieldbyname('panels').AsInteger=0 then
      begin
        BitBtn3.Enabled:=false;
        BitBtn5.Enabled:=false;
        Edit8.Enabled:=false;
        Edit8.Text:='0';
      end else begin
        BitBtn3.Enabled:=true;
        BitBtn5.Enabled:=true;
        Edit8.Enabled:=true;
        Edit8.Text:='0';
      end;
      DM.Get_ServerDatetime(valDateTime, valDate,valdt,valymd);
      DtRej.Date:=valymd;
      TmRej.Time:=valymd;
      dm.Tmp1.Close ;
      dm.Tmp1.SQL.Text:='SELECT seed_value,QA_control1 from data0004,data0192 WHERE data0004.rkey=18';
      dm.Tmp1.Open ;                    //QA_control1 0:控制码作为掩码 1:日期作为前缀2:全局码 //2:完全手工控制
      if dm.Tmp1.FieldByName('qa_control1').AsInteger = 0 then
         Edit1.EditMask :=trim(dm.Tmp1.fieldbyname('seed_value').AsString)
      else if dm.Tmp1.FieldByName('qa_control1').AsInteger = 1 then
      begin
        Edit1.Text := valdt ;
      end else if dm.Tmp1.FieldByName('qa_control1').AsInteger=2 then
      begin
        Edit1.ReadOnly:=true;
        edit1.Text := dm.Get_Data0004(0) ;
        FContrNo:=true;
      end;
      dm.Tmp.Close ;
    end else
     edit2.SetFocus ;
  finally
    frmPick_Item_Single2.adsPick.Close;
    frmPick_Item_Single2.Free ;
  end;

end;

procedure TFrm_Edt.BtDefaultClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
  s := 'SELECT RKEY, REJ_CODE, REJECT_DESCRIPTION,'+
        'case rej_type when 0 then ''工厂报废'' '+
                      'when 1 then ''供应商报废'' '+
                      'when 2 then ''客户报废'' '+
                      'when 3 then ''市场报废'' '+
                      'when 4 then ''其它'' '+
        'end as rej_type FROM Data0039';

  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'REJ_CODE/缺陷代码/200,REJECT_DESCRIPTION/缺陷名称/300,rej_type/报废类别/200';
    InputVar.Sqlstr := s ;
    InputVar.AdoConn := DM.ADOCon ;
    frmPick_Item_Single2.InitForm_New(InputVar)  ;
    if frmPick_Item_Single2.ShowModal = mrok then
    begin
      if frmPick_Item_Single2.adsPick.IsEmpty then exit;
      Edit3.Text := frmPick_Item_Single2.adsPick.fieldbyname('REJ_code').asstring;
      label4.Caption := frmPick_Item_Single2.adsPick.fieldbyname('reject_description').asstring;
      Label21.Caption := frmPick_Item_Single2.adsPick.fieldbyname('rej_type').asstring;

      vrkey0039 := frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;
      FisInVld:=false;
      Edit6.SetFocus;
    end ;
  finally
    frmPick_Item_Single2.adsPick.Close;
    frmPick_Item_Single2.Free ;
  end;

end;

procedure TFrm_Edt.FormShow(Sender: TObject);
var
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime ;
  i:integer;
begin
  if (EditMode = 0) or (EditMode = 1) then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,abbr_name from data0015 order by rkey';
    DM.tmp.Open;
    i:=0;
    while not DM.tmp.Eof do
    begin
      FaFct[i]:=DM.tmp.Fields[0].AsInteger;
      ComboBox2.Items.Append(DM.tmp.Fields[1].asstring);
      if (EditMode = 1) and (DM.tmp.Fields[0].AsInteger=dm.ADOQAll2warehouse_ptr.AsInteger) then
       begin
         ComboBox2.ItemIndex:=i;
         ComboBox2.Tag:=dm.ADOQAll2warehouse_ptr.AsInteger;
       end;
      DM.tmp.Next;
      inc(i);
    end;
  end;

  if EditMode = 0 then
  begin
    caption:='新增';
    CkBAudit.Enabled:=(vprevCaption = '4');
    CkBAudit.Checked:=(vprevCaption = '4');

    DM.Get_ServerDatetime(valDateTime, valDate,valdt,valymd);
    DtRej.Date:=valymd;
    TmRej.DateTime:=valymd;
    dm.Tmp1.Close ;
    dm.Tmp1.SQL.Text:='SELECT seed_value,QA_control1 from data0004,data0192 WHERE data0004.rkey=18';
    dm.Tmp1.Open ;              //QA_control1 0:控制码作为掩码 1:日期作为前缀2:全局码
    Edit2.SetFocus;
    if dm.Tmp1.FieldByName('qa_control1').AsInteger = 0 then
       Edit1.EditMask :=trim(dm.Tmp.fieldbyname('seed_value').AsString)
    else
     if dm.Tmp1.FieldByName('qa_control1').AsInteger = 1 then
      begin
      Edit1.Text := valdt ;
      end
     else
     if dm.Tmp1.FieldByName('qa_control1').AsInteger=2 then
      begin
       edit1.Text := dm.Get_Data0004(0) ;
       Edit1.ReadOnly:=true;
       FContrNo:=true;
      end;
     dm.Tmp.Close ;
  end
  else
  if EditMode = 1 then
   begin
    caption:='编辑';    // Edit2.SetFocus;
    CkBAudit.Enabled:=(vprevCaption = '4');
    DtRej.Date:=dm.adoq0058.fieldbyname('TDATETIME').asdatetime;
    TmRej.Time:=dm.adoq0058.fieldbyname('TDATETIME').asdatetime;
    Edit1.Text := dm.ADOQALL2MRB_NO.AsString ;
    rkey0039 := dm.ADOQALL2REJECT_PTR.AsInteger ;
    rkey0034 := dm.ADOQALL2DEPT_PTR.AsInteger ;
    reprkey0034 := dm.ADOQALL2RESP_DEPT_PTR.AsInteger ;
    flow_no := dm.ADOQALL2FLOW_NO.AsInteger ;
    step := dm.adoq0058.fieldbyname('STEP').AsInteger ;
    rkey0006 := dm.ADOQALL2WO_PTR.AsInteger ;
    key0058 := dm.ADOQALL2RKEY.AsInteger ;
    Edit4.Text := dm.adoq0058.fieldbyname('QTY_ORG_REJ').AsString ;
    Edit8.Text := dm.adoq0058.fieldbyname('PANELS').AsString ;
    Edit8.Enabled:=Edit9.Text<>'0';
    BitBtn5.Enabled:=Edit8.Enabled;
    qty_org_rej := dm.adoq0058.fieldbyname('QTY_ORG_REJ').AsInteger ;
    pnl_org_rej := dm.adoq0058.fieldbyname('PANELS').AsInteger ;
    Label11.Caption:=dm.ADOQALL2abbr_name.AsString;
    Label19.Caption:=dm.ADOQAll2MANU_PART_NUMBER.AsString;
    Label20.Caption:=dm.ADOQAll2MANU_PART_DESC.AsString;
    Edit12.Text := dm.ADOQAll2REFERENCE.Value;
    ComboBox2.SetFocus;
   end
  else
   begin
    caption:='查看';
    BtSv.Enabled:=false;
    DtRej.Date:=dm.ADOQAll2TDATETIME.Value;
    TmRej.DateTime:=dm.ADOQAll2TDATETIME.Value;
    CkBAudit.Checked:=dm.ADOQALL2QTY_REJECT.AsInteger>0;
    CkBAudit.Enabled:=false;
    DtRej.Enabled:=False;
    TmRej.Enabled:=false;
    Edit1.Text := dm.ADOQALL2MRB_NO.AsString ;
    rkey0039 := dm.ADOQALL2REJECT_PTR.AsInteger ;       //缺陷
    rkey0034 := dm.ADOQALL2DEPT_PTR.AsInteger ;         //部门
    reprkey0034 := dm.ADOQALL2RESP_DEPT_PTR.AsInteger ;  //责任部门
    flow_no := dm.ADOQALL2FLOW_NO.AsInteger ;
    step := dm.ADOQALL2STEP.AsInteger ;
    rkey0006 := dm.ADOQALL2WO_PTR.AsInteger ;
    key0058 := dm.ADOQALL2RKEY.AsInteger ;
    Edit4.Text := dm.ADOQALL2QTY_ORG_REJ.AsString ;
    Edit8.Text := dm.ADOQALL2PANELS.AsString ;
    Label11.Caption:=dm.ADOQALL2abbr_name.AsString;
    Edit12.Text := dm.ADOQAll2REFERENCE.Value;
    Label19.Caption:=dm.ADOQAll2MANU_PART_NUMBER.AsString;
    Label20.Caption:=dm.ADOQAll2MANU_PART_DESC.AsString;
    ComboBox2.Items.Append(dm.ADOQAll2abbr_name.AsString);
    ComboBox2.ItemIndex:=0;
    ComboBox2.Enabled:=false;
    Edit12.ReadOnly:=true;
    Edit1.ReadOnly:=true;
    BtWorkNo.Enabled:=false;
    Edit2.ReadOnly:=true;
   end;
end;

procedure TFrm_Edt.GetBoxVals(wo_ptr1, wo_ptr2,step: integer);
var
  vDEPT_PTR_code:string;
  j,i:integer;
begin
  i:=0;
  if EditMode = 0 then
    vDEPT_PTR_code := ''
  else
    vDEPT_PTR_code := trim(dm.ADOQALL2DEPT_CODE.AsString);
  Combobox1.Items.Clear;
  with dm.ADOQ564834  do
  begin
    close;
    sql.Text:='select distinct data0048.step_no,data0034.rkey as d0034_rkey,data0034.dept_code,'+
              'data0034.dept_name,data0048.flow_no,data0048.wo_ptr '+
              'from data0048 INNER JOIN data0034 '+
              'on data0048.fm_dept_ptr=data0034.rkey '+
              'where data0048.wo_ptr=:vptr and data0048.step_no<=:step '+
              'union '+
              'select data0056.step as step_no,data0034.rkey as d0034_rkey,data0034.dept_code,'+
              'data0034.dept_name,data0056.flow_no,data0056.wo_ptr '+
              'from data0056 INNER JOIN data0034 '+
              'on data0056.dept_ptr = data0034.rkey '+
              'where data0056.wo_ptr=:vptr1 '+
              'order by step_no';
    parameters.ParamByName('vptr').Value := wo_ptr1;
    parameters.ParamByName('vptr1').Value := wo_ptr2;
    parameters.ParamByName('step').Value := step;
    open;
    while not Eof do
    begin
      if vDEPT_PTR_code = trim(Fieldbyname('dept_code').AsString) then  j := i;
      inc(i);
      combobox1.Items.Add(copy(inttostr(1000 + fieldbyname('step_no').Asinteger),2,3)+'.'+trim(Fieldbyname('dept_code').AsString));
      Next ;
    end ;
  end;

  if EditMode = 0 then
    combobox1.ItemIndex := combobox1.Items.Count - 1
  else
    combobox1.ItemIndex := j ;
end;

procedure TFrm_Edt.Edit3Exit(Sender: TObject);
begin
  if (Edit3.Text='') or (self.Activecontrol=BtDefault) or (self.Activecontrol=BtClose) then exit;
  dm.Tmp.Close ;
  dm.Tmp.SQL.Text:='SELECT RKEY, REJ_CODE, REJECT_DESCRIPTION,'+
        'case rej_type when 0 then ''工厂报废'' '+
                      'when 1 then ''供应商报废'' '+
                      'when 2 then ''客户报废'' '+
                      'when 3 then ''市场报废'' '+
                      'when 4 then ''其它'' '+
        'end as rej_type FROM Data0039 where REJ_code=''' + trim(edit3.Text) + '''';
  dm.Tmp.Open ;
  if dm.Tmp.IsEmpty then
  begin
    messagedlg('缺陷代号错误！',mtinformation,[mbok],0);
    Edit3.SetFocus ;
    FisInVld:=true;
    BtDefaultClick(nil);
  end else begin
    Edit3.Text := dm.Tmp.fieldbyname('REJ_code').asstring;
    label4.Caption := dm.Tmp.fieldbyname('reject_description').asstring;
    Label21.Caption :=dm.Tmp.fieldbyname('rej_type').asstring;
    vrkey0039 := dm.Tmp.fieldbyname('rkey').AsInteger ;
    FisInVld:=false;
  end;
  dm.Tmp.Close ;
end;

procedure TFrm_Edt.Edit2Exit(Sender: TObject);
var
 i:integer;
 valDateTime, valDate,valdt: string ;
  valymd:tdatetime ;
begin
  if (EditMode=2) or (Edit2.Text='') or (self.Activecontrol=BtWorkNo) or (self.Activecontrol=BtClose)  then exit;

  dm.Tmp.Close ;
  dm.Tmp.SQL.Text :='SELECT Data0006.WORK_ORDER_NUMBER,Data0025.MANU_PART_NUMBER AS PartMANU_PART_NUMBER,'
               +'Data0025.MANU_PART_DESC AS PartMANU_PART_DESC,'
               +'Data0006.RKEY,data0056.REFERENCE, '
               +'Data0056.PANELS, Data0006.BOM_PTR,'
               +'Data0056.QTY_BACKLOG as QTY_BACKLOG,data0006.QUAN_ALLREJ,data0006.QUAN_ALLpnl,'
               +'Data0006.PARTS_PER_PANEL, Data0056.TO_BE_STOCKED,'
               +'Data0006.FLOW_NO, Data0056.RKEY AS d0056_rkey, Data0056.STEP,'
               +'Data0034.DEPT_CODE, Data0056.DEPT_PTR,'
               +'Data0034.DEPT_PTR AS deptptr,'
               +'isnull(d15_2.abbr_name,d15_1.abbr_name) abbr_name,'
               +'isnull(d15_2.rkey,d15_1.rkey) rkey15 '
        +'FROM Data0006 INNER JOIN '
               +'Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN '
               +'Data0056 ON Data0006.RKEY = Data0056.WO_PTR INNER JOIN '
               +'Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY inner join '
               +'data0492 on data0006.cut_no=data0492.cut_no inner join '
               +'data0015 d15_1 on data0492.whouse_ptr=d15_1.rkey left join '
               +'data0015 d15_2 on data0056.loc_ptr=d15_2.rkey '
               +'where Data0006.WORK_ORDER_NUMBER ='''+trim(edit2.Text)+'''';

  dm.Tmp.Open ;
  if dm.Tmp.IsEmpty then
  begin
      Label11.Caption:='';
      messagedlg('作业单号错误！',mtinformation,[mbok],0);
      Edit2.SetFocus ;
      FisInVld:=true;
      BtWorkNoClick(nil);
  end else begin
    FisInVld:=false;
    ComboBox2.Tag:=dm.Tmp.fieldbyname('rkey15').asinteger;
    for i:=0 to 9 do
      if FaFct[i]=ComboBox2.Tag then begin ComboBox2.ItemIndex:=i;break;end;

    Edit11.Text := dm.Tmp.fieldbyname('QUAN_ALLREJ').asstring+'PCS / '+dm.Tmp.fieldbyname('QUAN_ALLpnl').AsString+'PNLS';
    Edit2.Text := dm.Tmp.fieldbyname('work_order_number').asstring;
    Edit5.Text := dm.Tmp.fieldbyname('qty_backlog').asstring;
    Edit9.Text := dm.Tmp.fieldbyname('panels').asstring;
    Edit10.Text := dm.Tmp.fieldbyname('parts_per_panel').asstring;
    Edit7.Text := dm.Tmp.fieldbyname('dept_code').asstring;
    
    Label11.Caption:=dm.Tmp.fieldbyname('abbr_name').asstring;
    Label19.Caption:=dm.Tmp.fieldbyname('PartMANU_PART_NUMBER').asstring;
    Label20.Caption:=dm.Tmp.fieldbyname('PartMANU_PART_DESC').asstring;
    Edit12.Text:= dm.Tmp.fieldbyname('REFERENCE').asstring;
                                        //0056在线pcs数                               0006报废待审核pcs数量
    vqty_backlog := dm.Tmp.fieldbyname('qty_backlog').asinteger-dm.Tmp.fieldbyname('QUAN_ALLREJ').asinteger;
    vpanels := dm.Tmp.fieldbyname('panels').asinteger-dm.Tmp.fieldbyname('QUAN_ALLpnl').asinteger;

    step := dm.Tmp.fieldbyname('step').asinteger;
    flow_no := dm.Tmp.fieldbyname('flow_no').asinteger;
    vrkey0006 := dm.Tmp.fieldbyname('rkey').AsInteger ;
    Button1.Enabled:=Edit9.Text<>'0';
    
    if Frkey06=vrkey0006 then abort;

    GetBoxVals(vrkey0006,vrkey0006,step);

    if dm.Tmp.fieldbyname('panels').AsInteger=0 then
     begin
      BitBtn3.Enabled:=false;
      BitBtn5.Enabled:=false;
      Edit8.Enabled:=false;
      Edit8.Text:='0';
     end
    else
     begin
      BitBtn3.Enabled:=true;
      BitBtn5.Enabled:=true;
      Edit8.Enabled:=true;
      Edit8.Text:='0';
     end;
  end;
  dm.Tmp.Close ;

  DM.Get_ServerDatetime(valDateTime, valDate,valdt,valymd);
  DtRej.Date:=valymd;
  TmRej.Time:=valymd;

  if Frkey06<>vrkey0006 then
   begin
    ComboBox1.ItemIndex:=-1;
    Edit3.Text:='';
    Edit6.Text:='';
    edit4.Text:='0';
    edit8.Text:='0';
   end;
end;

procedure TFrm_Edt.BitBtn3Click(Sender: TObject);
begin
  if TComponent(Sender).Tag=2 then
    Edit8.Text:= inttostr(trunc(strtoint('0'+Trim(edit4.Text))/strtoint(Trim(edit10.Text)))) 
  else
    Edit4.Text:= inttostr(trunc(strtoint('0'+Trim(edit8.Text))*strtoint(Trim(edit10.Text)))) ;
end;

procedure TFrm_Edt.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then abort;
end;

procedure TFrm_Edt.BtDeptClick(Sender: TObject);
begin
  with TFrm_WkP.Create(application) do
  try
    rkey0006 := vrkey0006 ;
    RadioGroup1Click(nil);
    if ShowModal = mrok then
     begin
      Edit6.Text := ADOQuery1.fieldbyname('dept_code').asstring;
      label8.Caption := ADOQuery1.fieldbyname('dept_name').asstring;
      vreprkey0034 := ADOQuery1.fieldbyname('rkey').AsInteger ;
      FisInVld := false;
      edit4.SetFocus;
     end;
  finally
    Free ;
  end;
end;


procedure TFrm_Edt.BtCloseClick(Sender: TObject);
begin
  if FisEdit then modalresult := mrok else modalresult := mrCancel;
end;


procedure TFrm_Edt.Set_reprkey0034(const Value: integer);
begin
  vreprkey0034 := value;
  dm.Tmp.Close ;
  dm.Tmp.SQL.Text:='SELECT DEPT_CODE,DEPT_NAME from data0034 WHERE rkey = '+inttostr(vreprkey0034);
  dm.Tmp.Open ;
  Edit6.Text := dm.Tmp.fieldbyname('DEPT_CODE').AsString;
  Label8.Caption := dm.Tmp.fieldbyname('DEPT_NAME').AsString;
  dm.Tmp.Close ;
end;

procedure TFrm_Edt.Set_rkey0006(const Value: integer);
begin
  vrkey0006 := value;
  dm.Tmp.Close ;
  dm.Tmp.SQL.Text:='SELECT Data0006.WORK_ORDER_NUMBER, Data0056.PANELS,'+
                          'Data0056.QTY_BACKLOG  AS QTY_BACKLOG,data0006.QUAN_ALLREJ,data0006.QUAN_ALLpnl,'+
                          'Data0006.PARTS_PER_PANEL, Data0056.TO_BE_STOCKED,'+
                          'Data0056.STEP, Data0034.DEPT_CODE, Data0056.DEPT_PTR,'+
                          'Data0034.DEPT_PTR AS deptptr, Data0034.DEPT_NAME '+
                          'FROM Data0034 RIGHT OUTER JOIN '+
                          'Data0056 ON '+
                          'Data0034.RKEY = Data0056.DEPT_PTR RIGHT OUTER JOIN '+
                          'Data0006 ON Data0056.WO_PTR = Data0006.RKEY '+
                          'where data0006.rkey ='+inttostr(vrkey0006);
  dm.Tmp.Open ;
  Edit11.Text := dm.Tmp.fieldbyname('QUAN_ALLREJ').asstring+'pcs / '+dm.Tmp.fieldbyname('QUAN_ALLpnl').AsString+'PNLS';
  Edit2.Text := dm.Tmp.fieldbyname('work_order_number').asstring;
  Edit5.Text := dm.Tmp.fieldbyname('qty_backlog').asstring;
  Edit9.Text := dm.Tmp.fieldbyname('panels').asstring;
  Edit10.Text := dm.Tmp.fieldbyname('parts_per_panel').asstring;
  Edit7.Text := dm.Tmp.fieldbyname('dept_code').asstring;
  vqty_backlog := dm.Tmp.fieldbyname('qty_backlog').asinteger-dm.Tmp.fieldbyname('QUAN_ALLREJ').asinteger;
  vpanels := dm.Tmp.fieldbyname('panels').asinteger-dm.Tmp.fieldbyname('QUAN_ALLpnl').asinteger;
  if dm.Tmp.fieldbyname('step').AsInteger<>0 then     //当前在线
    GetBoxVals(vrkey0006,vrkey0006,dm.Tmp.fieldbyname('step').AsInteger)
  else
    GetBoxVals(vrkey0006,vrkey0006,DM.ADOQAll2StepNow.AsInteger); //在线不存在
  dm.Tmp.Close ;
end;

procedure TFrm_Edt.Set_rkey0039(const Value: integer);
begin
  vrkey0039 := value;
  dm.Tmp.Close ;
  dm.Tmp.SQL.Text:='SELECT RKEY, REJ_CODE, REJECT_DESCRIPTION,'+
        'case rej_type when 0 then ''工厂报废'' '+
                      'when 1 then ''供应商报废'' '+
                      'when 2 then ''客户报废'' '+
                      'when 3 then ''市场报废'' '+
                      'when 4 then ''其它'' '+
        'end as rej_type FROM Data0039 WHERE rkey = '+inttostr(vrkey0039);
  dm.Tmp.Open ;
  edit3.Text := dm.Tmp.fieldbyname('REJ_CODE').AsString;
  Label4.Caption := dm.Tmp.fieldbyname('REJECT_DESCRIPTION').AsString;
  Label21.Caption :=dm.Tmp.fieldbyname('rej_type').asstring;
  dm.Tmp.Close ;
end;




procedure TFrm_Edt.Edit6Exit(Sender: TObject);
begin
  if (Edit6.Text='') or (self.Activecontrol=BtDefault) or (self.Activecontrol=BtClose) then exit;
  dm.Tmp.Close ;
  dm.Tmp.SQL.Text:='select rkey,dept_code,dept_name,CASE WHEN TTYPE = 1 THEN ''工序'' '+
                                                      'WHEN TTYPE = 4 THEN ''部门'' '+
                                                      'WHEN ttype = 5  THEN ''班组'' END AS typeNm ,ttype from data0034 '+
                   'where ttype in (1,4,5) and ACTIVE_FLAG=0 and dept_code=''' + trim(edit6.Text) + '''';

  dm.Tmp.Open ;
  if dm.Tmp.IsEmpty then
  begin
    messagedlg('责任部门错误！',mtinformation,[mbok],0);
    Edit6.SetFocus ;
    FisInVld:=true;
    BtDeptClick(nil);
  end else begin
    FisInVld:=false;
    Edit6.Text := dm.Tmp.fieldbyname('dept_code').asstring;
    label8.Caption := dm.Tmp.fieldbyname('dept_name').asstring;
    vreprkey0034 := dm.Tmp.fieldbyname('rkey').AsInteger ;
  end;
  dm.Tmp.Close ;
end;

procedure TFrm_Edt.Edit2Enter(Sender: TObject);
begin
  Frkey06:=vrkey0006;
end;

procedure TFrm_Edt.ComboBox2Change(Sender: TObject);
begin
  ComboBox2.Tag:=FaFct[ComboBox2.ItemIndex];
end;

procedure TFrm_Edt.Button1Click(Sender: TObject);
begin
  if MessageBox(handle,pchar('您确定当前工序:'+Edit7.Text+'已不存在PNLS了吗?'),pchar('PNL清零提示'),MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)<>IDYES	then exit;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='update data0056 set PANELS=0 where wo_ptr='+inttostr(vrkey0006);
  DM.Tmp.ExecSQL;
  Edit9.Text:='0';
  Edit8.Text:='0';
  Edit8.Enabled:=false;
  BitBtn5.Enabled:=false;
end;

end.
