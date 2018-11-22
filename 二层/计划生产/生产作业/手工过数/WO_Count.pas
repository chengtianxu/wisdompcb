unit WO_Count;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Mask, DBCtrls, Buttons, Grids,StrUtils,
  DBGrids,AdoDB, ComCtrls;

type
  TfrmWO_Count = class(TForm)
    Panel1: TPanel;
    Label15: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Label14: TLabel;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label1: TLabel;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit8: TDBEdit;
    DBEdit7: TDBEdit;
    rgType: TRadioGroup;
    btnOk: TBitBtn;
    Label11: TLabel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    edtNextStep: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label20: TLabel;
    ComboBox3: TComboBox;
    Label18: TLabel;
    ComboBox2: TComboBox;
    lv1: TListView;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure lv1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lv1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lv1Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
    r_type,clamp06:Integer;
    v_Pcs,v_PNL:integer;
    function Update_Data_New(rkey06:integer):boolean;
    //function Update_0048(From_Dept,Next_Dept,UserId,WType,PutType,Wo_ptr,StepNo:integer):boolean;
    function Update_0048(From_Dept,Next_Dept,UserId,WType,PutType,Wo_ptr,StepNo,rkey25:Integer):boolean;
    function Update_0048_2(From_Dept,Next_Dept,UserId,WType,PutType,Wo_ptr,StepNo:integer):boolean;
    function WoClamp(rkey06,clamp06:Integer):boolean;//合并作业单
    function check_woclamp(rkey06,clamp06:Integer):boolean;//判断是否可以合卡
    procedure Update_WIPMAT_STATUS(rKey06: Integer);
  public
    FaFct:array[0..9] of integer;
    vrKey_User:integer;//过数用户
    procedure enter(BShow: Boolean = True);
  end;

var
  frmWO_Count: TfrmWO_Count;

implementation
uses dm,MyClass,common,Dlg_Wo_Qty, main;
{$R *.dfm}

{ TfrmWO_Count }

procedure TfrmWO_Count.enter(BShow: Boolean = True);
var i,L:integer;
    WoNo:string;
    Item: TListItem;
begin
//  dmcon.aqNextStepNO.Close;
//  dmcon.aqNextStepNO.Parameters.ParamByName('F01').Value :=dmcon.adsWOInfo.fieldByname('Bom_ptr').Value;
//  dmcon.aqNextStepNO.Parameters.ParamByName('F02').Value :=dmcon.adsWOInfo.fieldByname('STEP').Value;
//  dmcon.aqNextStepNO.open;
//
//  if dmcon.aqNextStepNO.IsEmpty then //未能找到下一级,说明是最后的工序
//  begin
//    ShowMsg('已经过数到最后一道工序,请做入仓处理!',1);
//    abort;
//  end;
//
//  dmcon.NextStep_238.Close;
//  dmcon.NextStep_238.Parameters.ParamByName('F01').Value :=dmcon.adsWOInfo.fieldByname('rkey06').Value;
//  dmcon.NextStep_238.Parameters.ParamByName('F02').Value :=dmcon.adsWOInfo.fieldByname('STEP').Value;
//  dmcon.NextStep_238.open;
   WoNo:=frmMain.edtWoNo.Text;
  if dmcon.adsWOInfo.fieldByname('SETUP_TIME_PER_LOT').AsString<>'' then
    ComboBox3.Items.Append(dmcon.adsWOInfo.fieldByname('SETUP_TIME_PER_LOT').AsString);
  if dmcon.adsWOInfo.fieldByname('QUEUE_TIME').AsString<>'' then
    ComboBox3.Items.Append(dmcon.adsWOInfo.fieldByname('QUEUE_TIME').AsString);
  if dmcon.adsWOInfo.fieldByname('PROCESS_TIME').AsString<>'' then
    ComboBox3.Items.Append(dmcon.adsWOInfo.fieldByname('PROCESS_TIME').AsString);
  if dmcon.adsWOInfo.fieldByname('PROCESS_TIME_B').AsString<>'' then
    ComboBox3.Items.Append(dmcon.adsWOInfo.fieldByname('PROCESS_TIME_B').AsString);
  if ComboBox3.Items.Count>0 then ComboBox3.ItemIndex:=0;
  with dmcon.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from data0238 where wo_ptr='+dmcon.adsWOInfo.FieldByName('rkey06').AsString);
    Open;
  end;
  if dmcon.ADOQuery1.IsEmpty then
  begin
   with dmcon.ADOQuery1 do
   begin
     Close;
     SQL.Clear;
     sql.Add('select DEPT_PTR from data0038 where SOURCE_PTR='+dmcon.adsWOInfo.fieldByname('Bom_ptr').AsString);
     sql.Add('and STEP_NUMBER='+dmcon.adsWOInfo.fieldByname('STEP').AsString);
     Open;
   end;
   if dmcon.ADOQuery1.FieldByName('dept_ptr').Value<>dmcon.adsWOInfo.FieldByName('DEPT_PTR').Value then
   begin
    MessageDlg('当前工序步骤发生变化,产品流程有改动,不能过数!',mtInformation,[mbOK],1);
    Exit;
   end;
   dmcon.aqNextStepNO.Close;
   dmcon.aqNextStepNO.Parameters.ParamByName('F01').Value :=dmcon.adsWOInfo.fieldByname('Bom_ptr').Value;
   dmcon.aqNextStepNO.Parameters.ParamByName('F02').Value :=dmcon.adsWOInfo.fieldByname('STEP').Value;
   dmcon.aqNextStepNO.open;
   if dmcon.aqNextStepNO.IsEmpty then //未能找到下一级,说明是最后的工序
   begin
    ShowMsg('已经过数到最后一道工序,请做入仓处理!',1);
    abort;
   end;
   edtNextStep.Text := trim(dmcon.aqNextStepNO.fieldByName('DEPT_CODE').AsString)+'-'+trim(dmcon.aqNextStepNO.fieldByName('DEPT_NAME').AsString)+'-'+trim(dmcon.aqNextStepNO.fieldByName('STEP_NUMBER').AsString);
  end
  else
  begin
   dmcon.NextStep_238.Close;
   dmcon.NextStep_238.Parameters.ParamByName('F01').Value :=dmcon.adsWOInfo.fieldByname('rkey06').Value;
   dmcon.NextStep_238.Parameters.ParamByName('F02').Value :=dmcon.adsWOInfo.fieldByname('STEP').Value;
   dmcon.NextStep_238.open;
   edtNextStep.Text := trim(dmcon.NextStep_238.fieldByName('DEPT_CODE').AsString)+'-'+trim(dmcon.NextStep_238.fieldByName('DEPT_NAME').AsString)+'-'+trim(dmcon.NextStep_238.fieldByName('STEP_NUMBER').AsString);
  end;
//显示
  checkbox2.Checked:=not dmcon.adsWOInfo.fieldByName('ALLOW_SPLIT_LOTS').IsNull and
                        (dmcon.adsWOInfo.fieldByName('ALLOW_SPLIT_LOTS').AsString='Y');  //PNL清0
                        
  if  not checkbox2.Checked then checkbox2.Enabled:=false;
  v_Pcs:= dmcon.adsWOInfo.fieldByname('QTY_BACKLOG').Asinteger;
  v_PNL:= dmcon.adsWOInfo.fieldByname('PANELS').Asinteger;
  if (dmcon.adsWOInfo.FieldByName('prod_status').AsInteger = 4)  then //外发生产
    rgType.ItemIndex :=2;
  if (dmcon.adsWOInfo.FieldByName('TType').AsInteger=3) or (dmcon.adsWOInfo.FieldByName('WType').AsInteger >0) then //MRB返修,那么属于返工状态
    rgType.ItemIndex :=1;
    
  dmcon.tmp.Close;
  dmcon.tmp.SQL.Text:='select rkey,abbr_name from data0015 order by rkey';
  dmcon.tmp.Open;
  i:=0;
  while not dmcon.tmp.Eof do
  begin
    FaFct[i]:=dmcon.tmp.Fields[0].AsInteger;
    ComboBox1.Items.Append(dmcon.tmp.Fields[1].asstring);
    ComboBox2.Items.Append(dmcon.tmp.Fields[1].asstring);
    inc(i);
    dmcon.tmp.Next;
  end;

  dmcon.tmp.Close;
  dmcon.tmp.SQL.Text:='select loc_ptr from data0056 where Wo_ptr='+dmcon.adsWOInfo.FieldbyName('rKey06').Asstring;
  dmcon.tmp.Open;
  for i:=0 to 5 do
  begin
    if FaFct[i]=dmcon.tmp.Fields[0].AsInteger then  ComboBox1.ItemIndex:=i  ;//过数工厂
    if FaFct[i]=dmcon.adsWOInfo.FieldbyName('whouse_ptr').AsInteger then  ComboBox2.ItemIndex:=i  ;//下工序投产工厂
  end;
  r_type:=0;//正常过数(无合并需求)
  if (dmcon.adsWOInfo.FieldByName('cutno_wo').Value='') or (dmcon.adsWOInfo.FieldByName('parent_ptr').Value>0) then//合卡条件判断(内层工单，或外层工单无刻印内容)
  begin
   L:=Length(WoNo);
   with dmcon.WoClampIn do
   begin
    Close;
    if (dmcon.adsWOInfo.FieldByName('Wtype06').Value=3)and(dmcon.adsWOInfo.FieldByName('wtype').AsInteger>0) then //作业单为返工状态且返工还没结束
    begin
     with dmcon.tmp do
     begin
      Close;
      sql.Clear;
      SQL.Add('select max(step_number) as mstep from data0238 ');
      sql.Add('where data0238.wo_ptr='+dmcon.adsWOInfo.FieldbyName('rKey06').AsString);
      Open;
     end;
     if dmcon.NextStep_238.FieldByName('step_number').Value=dmcon.tmp.FieldByName('mstep').Value then //返工为最后一个工序时，步骤会发生变化
      Parameters[0].Value:=dmcon.adsWOInfo.FieldValues['wtype']
     else
      Parameters[0].Value:=dmcon.NextStep_238.FieldValues['step_number'];
    end
    else
    begin
     Parameters[0].Value:=dmcon.aqNextStepNO.FieldValues['step_number'];
    end;
    if (WoNo[L] in ['0'..'9']) then
    begin
     dmcon.WoClampIn.Filter:='work_order_number'+' like ''%'+LeftStr(WoNo, L)+'%''';
    end
    else
    begin
     dmcon.WoClampIn.Filter:='work_order_number'+' like ''%'+LeftStr(WoNo, L-1)+'%''';
    end;
    Open;
    if not dmcon.WoClampIn.IsEmpty then
    begin
     r_type:=1;
     CheckBox3.Enabled:=True;
     CheckBox3.Checked:=false;//默认过数不合卡由用户自行选择
     dmcon.WoClampIn.First;
     for i:=1 to dmcon.WoClampIn.RecordCount do
     begin
     item:=lv1.Items.Add;
     Item.SubItems.Add(dmcon.WoClampInWORK_ORDER_NUMBER.Value);
     Item.SubItems.Add(dmcon.WoClampInCUTNO_WO.Value);
     Item.SubItems.Add(dmcon.WoClampInQTY_BACKLOG.AsString);
     Item.SubItems.Add(dmcon.WoClampInPANELS.AsString);
     Item.SubItems.Add(dmcon.WoClampInSTEP.AsString);
     Item.SubItems.Add(dmcon.WoClampInrkey06.AsString);
     dmcon.WoClampIn.Next;
     end;
    end;
   end;
  end
  else
  begin
   with dmcon.WoClamp do //刻印内容不为空就得根据刻印内容那进行判断了
   begin
   Close;
   Parameters[0].Value:=dmcon.adsWOInfo.FieldValues['cutno_wo'];
    if (dmcon.adsWOInfo.FieldByName('Wtype06').Value=3)and(dmcon.adsWOInfo.FieldByName('wtype').AsInteger>0) then //作业单为返工状态且返工还没结束
    begin
     with dmcon.tmp do
     begin
      Close;
      sql.Clear;
      SQL.Add('select max(step_number) as mstep from data0238 ');
      sql.Add('where data0238.wo_ptr='+dmcon.adsWOInfo.FieldbyName('rKey06').AsString);
      Open;
     end;
     if dmcon.NextStep_238.FieldByName('step_number').Value=dmcon.tmp.FieldByName('mstep').Value then //返工为最后一个工序时，步骤会发生变化
      Parameters[1].Value:=dmcon.adsWOInfo.FieldValues['wtype']
     else
      Parameters[1].Value:=dmcon.NextStep_238.FieldValues['step_number'];
    end
    else
    begin
     Parameters[1].Value:=dmcon.aqNextStepNO.FieldValues['step_number'];
    end;
    Open;
   end;
   if not dmcon.WoClamp.IsEmpty then
   begin
    r_type:=1;
    CheckBox3.Enabled:=True;
    CheckBox3.Checked:=false;//默认过数不合卡由用户自行选择
    dmcon.WoClamp.First;
    for i:=1 to dmcon.WoClamp.RecordCount do
    begin
     item:=lv1.Items.Add;
     Item.SubItems.Add(dmcon.WoClampWORK_ORDER_NUMBER.Value);
     Item.SubItems.Add(dmcon.WoClampCUTNO_WO.Value);
     Item.SubItems.Add(dmcon.WoClampQTY_BACKLOG.AsString);
     Item.SubItems.Add(dmcon.WoClampPANELS.AsString);
     Item.SubItems.Add(dmcon.WoClampSTEP.AsString);
     Item.SubItems.Add(dmcon.WoClamprkey06.AsString);
     dmcon.WoClamp.Next;
    end;
   end;
  end;
  lv1.Enabled:=CheckBox3.Checked;
  if not BShow then
  r_type:=0;
  if BShow then ShowModal;
end;

procedure TfrmWO_Count.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWO_Count.btnOkClick(Sender: TObject);
var
 sql_text:string;
 rkey06:integer;
 i:Integer;
 lsresult:Boolean;
begin                                 
//  if dmcon.aqBasicParam.FieldByName('ppc_control23').AsInteger = 1 then //计工作量
  if IS_Stock_Inventorying then
  begin
   ShowMsg('在制品正在盘点，不能过数，请检查！',1);
   Exit;
  end;
  rkey06:=dmcon.adsWOInfo.FieldbyName('rKey06').AsInteger;
  lsresult:=True;
  if (ComboBox3.Items.Count>0) and (trim(ComboBox3.Text)='') then
  begin
    ShowMsg('请您选择过数拉线或设备!',1);
    exit;
  end;
  sql_text:='select step from data0056 where rkey='+dmcon.adsWOInfo.FieldByName('rkey').AsString;
  OpenQuery(dmcon.aqTmp,sql_text);

  if dmcon.aqTmp.FieldByName('step').AsInteger<>dmcon.adsWOInfo.FieldByName('step').AsInteger then
  begin
    ShowMsg('该在线作业单当前步骤已经不正确,可能有人已经过数!',1);
    exit;
  end;
  with dmcon.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from data0238 where wo_ptr='+dmcon.adsWOInfo.FieldByName('rkey06').AsString);
    Open;
  end;
  if dmcon.ADOQuery1.IsEmpty then
  begin
  sql_text:='select DEPT_PTR from data0038 where SOURCE_PTR='+dmcon.adsWOInfo.fieldByname('Bom_ptr').AsString+
            'and STEP_NUMBER='+dmcon.adsWOInfo.fieldByname('STEP').AsString;
  OpenQuery(dmcon.aqTmp,sql_text);
   if dmcon.aqTmp.FieldByName('dept_ptr').Value<>dmcon.adsWOInfo.FieldByName('dept_ptr').Value then
   begin
    MessageDlg('当前工序步骤发生变化,产品流程有改动,不能过数!',mtInformation,[mbOK],1);
    Exit;
   end;
  end;

  sql_text:='select prod_status from data0006 where rkey='+dmcon.adsWOInfo.FieldbyName('rKey06').AsString;
  OpenQuery(dmcon.aqTmp,sql_text);

  if dmcon.aqTmp.FieldByName('prod_status').AsInteger in [102,103] then
  begin
    ShowMsg('该在线作业单已暂缓!',1);
    exit;
  end;
  sql_text:='select wipmat_status from data0006 where rkey='+dmcon.adsWOInfo.FieldbyName('rKey06').AsString;
  OpenQuery(dmcon.aqTmp,sql_text);
  
  if dmcon.aqTmp.FieldByName('WIPMAT_STATUS').AsInteger=0 then
  begin
   ShowMsg('该在线作业单还没分配完,不能过数!',1);
   exit;
  end;

  if (r_type=1) and (CheckBox3.Checked) then //有合卡需求要判断是否选择了一个工单进行合卡
  begin
   for i:=0 to lv1.Items.Count-1 do
   begin
     if lv1.Items[I].Checked = true then
     begin
       clamp06:=StrToInt(lv1.Selected.SubItems.Strings[5]);//获取合卡母单的rkey值
       lsresult:=True;
       Break;
     end
     else
     begin
       lsresult:=False;
     end;
   end;
  end;
  if lsresult=False then
  begin
    MessageDlg('请选择一个工单合卡！',mtInformation,[mbOK],1);
    Exit;
  end;
  try
    if not dmcon.ADOConnection1.InTransaction then
      dmcon.ADOConnection1.BeginTrans;
    if Update_Data_new(rkey06) then
      dmcon.ADOConnection1.CommitTrans
    else
      dmcon.ADOConnection1.RollbackTrans;
  except
    on E: Exception do
    begin
     dmcon.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
  if (r_type=1) and (CheckBox3.Checked=true) then
  begin
   with dmcon.ADOQuery1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select from_wo_ptr from data0006');
     SQL.Add('where rkey='+inttostr(clamp06));
     Open;
   end;
   with dmcon.ADOQuery2 do
   begin
     Close;
     SQL.Clear;
     sql.Add('select from_wo_ptr from data0006');
     sql.Add('where rkey='+inttostr(rkey06));
     Open;
   end;
   if (rkey06=dmcon.ADOQuery1.FieldByName('from_wo_ptr').Value) or (dmcon.ADOQuery2.IsEmpty) then
   begin
     with dmcon.ADOQuery2 do
     begin
       Close;
       sql.Clear;
       sql.Add('select * from data0056 where wo_ptr='+inttostr(clamp06));
       Open;
     end;
     with dmcon.ADOQuery3 do
     begin
       Close;
       sql.Clear;
       SQL.Add('select * from data0006 where rkey='+inttostr(clamp06));
       Open;
     end;
    if (dmcon.ADOQuery2.FieldByName('TO_BE_STOCKED').Value>0) or (dmcon.ADOQuery3.FieldByName('QUAN_PROD').Value>0) then
    begin
      MessageDlg('在线子工单有待入库数量还没审核或有部分已完工,不能合卡!',mtInformation,[mbOK],1);
      Close;
      Exit;
    end;
    if WoClamp(clamp06,rkey06) then
    begin
     with dmcon.ADOQuery1 do
     begin
      Close;
      sql.Clear;
      sql.Text:=' insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('+IntToStr(rkey06)+',2,0,'+user_ptr+',getdate(),'+IntToStr(8)+','+QuotedStr('作业单'+dmcon.adsWOInfo.FieldValues['work_order_number']+'跟作业单'+lv1.Selected.SubItems.Strings[0]+'合并'+' '+'数量为：'+dbedit7.Text)+')';
      ExecSQL;
     end;
     ShowMessage('合并作业单成功，合并后的作业单号为：'+dmcon.adsWOInfo.FieldValues['work_order_number']);
    end;
   end
   else
   begin
    if WoClamp(rkey06,clamp06) then
    begin
     with dmcon.ADOQuery1 do
     begin
      Close;
      sql.Clear;
      sql.Text:=' insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('+IntToStr(clamp06)+',2,0,'+user_ptr+',getdate(),'+IntToStr(8)+','+QuotedStr('作业单'+dmcon.adsWOInfo.FieldValues['work_order_number']+'跟作业单'+lv1.Selected.SubItems.Strings[0]+'合并'+' '+'数量为：'+dbedit7.Text)+')';
      ExecSQL;
     end;
     ShowMessage('合并作业单成功，合并后的作业单号为：'+lv1.Selected.SubItems.Strings[0]);
    end;
   end;
  end;
  close;
end;
function TfrmWO_Count.Update_0048(From_Dept,Next_Dept,UserId,WType,PutType,Wo_ptr,StepNo,rkey25:integer):boolean;
var
  sqlstr:string;
  para_value:string;
  flow_no:Integer;
  jv:Extended;
  paigong:Boolean;
begin
 paigong:=dmcon.adsWOInfo.FieldByName('if_paigong').Value;
 jv:=dmcon.adsWOInfo.FieldByName('datevalue').Value;
 dmcon.Para_Value.Close;
 dmcon.Para_Value.Parameters[0].Value:=rkey25;
 dmcon.Para_Value.Parameters[1].Value:=StepNo;
 dmcon.Para_Value.Open;
 para_value:=dmcon.Para_Valuenames_value.Value;
 if Length(para_value)>50 then
 begin
 para_value:='';
 end;
 with dmcon.tmp do
 begin
  close;
  SQL.Clear;
  SQL.Add('select Flow_No from data0056 where data0056.wo_ptr='+inttostr(Wo_ptr));
  Open;
 end;
 flow_no:=dmcon.tmp.FieldValues['flow_no'];
 sqlstr:=' insert into data0048(WO_PTR, FM_DEPT_PTR, TO_DEPT_PTR, INTIME, '+            //产量拉线
          ' OUTTIME, QTY_PROD, PANELS, STEP_NO, EMPL_PTR, WTYPE, put_type,warehouse_ptr,ACTION_REF,if_paigong,datevalue,flow_no) '+
          ' select Wo_ptr,'+IntToStr(From_Dept)+','+IntToStr(Next_Dept)+',case when assign_date is not null then assign_date ELSE INTIME end,getdate(),Qty_BackLog,Panels,'+IntToStr(StepNo)+','+IntToStr(UserId)+
          ' ,'+IntToStr(WType)+','+IntToStr(PutType)+','+inttostr(FaFct[ComboBox1.ItemIndex])+','''+ComboBox3.Text+''','+booltostr(paigong)+','+FloatToStr(jv)+','+inttostr(flow_no)+' from data0056 where Wo_ptr='+IntToStr(Wo_ptr);
 result := MyDataClass.ExecSql(sqlstr);
 if not result then
 ShowMsg('更新48表出错!',1);
end;

function TfrmWO_Count.Update_0048_2(From_Dept,Next_Dept,UserId,WType,PutType,Wo_ptr,StepNo:integer):boolean;
var
  sqlstr:string;
  flow_no:Integer;
  jv:Extended;
  paigong:Boolean;
begin
  paigong:=dmcon.adsWOInfo.FieldByName('if_paigong').Value;
  jv:=dmcon.adsWOInfo.FieldByName('datevalue').Value;
  with dmcon.ADOQuery1 do
 begin
   Close;
   sql.Clear;
   sql.Add('select old_step_no from data0238 where wo_ptr='+inttostr(Wo_ptr));
   SQL.Add('and dept_ptr='+inttostr(From_Dept));
   sql.Add('and step_number='+inttostr(StepNo));
   Open;
 end;
 if (not dmcon.ADOQuery1.IsEmpty) then
 begin
   StepNo:=dmcon.ADOQuery1.FieldByName('old_step_no').Value;
 end;
 with dmcon.tmp do
 begin
  close;
  SQL.Clear;
  SQL.Add('select Flow_No from data0056 where data0056.wo_ptr='+inttostr(Wo_ptr));
  Open;
 end;
 flow_no:=dmcon.tmp.FieldValues['flow_no'];
 sqlstr:=' insert into data0048(WO_PTR, FM_DEPT_PTR, TO_DEPT_PTR, INTIME, '+            //产量拉线
          ' OUTTIME, QTY_PROD, PANELS, STEP_NO, EMPL_PTR, WTYPE, put_type,warehouse_ptr,ACTION_REF,if_paigong,datevalue,flow_no) '+
          ' select Wo_ptr,'+IntToStr(From_Dept)+','+IntToStr(Next_Dept)+',case when assign_date is not null then assign_date ELSE INTIME end,getdate(),Qty_BackLog,Panels,'+IntToStr(StepNo)+','+IntToStr(UserId)+
          ' ,'+IntToStr(WType)+','+IntToStr(PutType)+','+inttostr(FaFct[ComboBox1.ItemIndex])+','''+ComboBox3.Text+''','+booltostr(paigong)+','+FloatToStr(jv)+','+inttostr(flow_no)+' from data0056 where Wo_ptr='+IntToStr(Wo_ptr);
 result := MyDataClass.ExecSql(sqlstr);
 if not result then
 ShowMsg('更新48表出错!',1);
end;

procedure TfrmWO_Count.DBGrid1DblClick(Sender: TObject);
var i,j:integer;
begin
  if v_PNL <= 0 then
  begin
    ShowMsg('无数量可以分配',1);
    exit;
  end;
  with TfrmDlg_WO_Qty.Create(application) do
  try
    Enter(v_Pcs,v_PNL,dmcon.adsEmployee.fieldByName('employee_name').AsString);
    if ShowModal = mrok then
    begin
      v_PCS:=v_PCS- strtoInt(edtPcs.Text);
      v_PNL:=v_PNL- strtoInt(edtPNl.Text);
    end;
  finally
    release;
  end;
end;

procedure TfrmWO_Count.N5Click(Sender: TObject);
var i,j:integer;
begin

end;

procedure TfrmWO_Count.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmcon do
  begin
    adsWOInfo.Close;
    aqNextStepNO.Close;
  end;
end;

procedure TfrmWO_Count.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SendMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, 0, 0);
  end;
  if (Key = #13) then Key := #0;

  inherited KeyPress(Key);
end;

procedure TfrmWO_Count.FormShow(Sender: TObject);
begin
 if dmcon.adsUserInfo.Active then
  CheckBox1.Enabled:= dmcon.adsUserInfo.fieldByName('OutSource').AsBoolean;
end;


procedure TfrmWO_Count.Update_WIPMAT_STATUS(rKey06: Integer);
type
  IntArr = array of Integer;

  procedure SetWIPMAT_STATUSFalse(ARkey06: Integer);
  var
    LS: TStringList;
    LQry: TADOQuery;
  begin
    LS := TStringList.Create;
    LQry := TADOQuery.Create(Self);
    try
      LS.Add('UPDATE Data0006 SET WIPMAT_STATUS = 0 WHERE RKey = ');
      LS.Add(IntToStr(ARkey06));
      dmcon.SQLExec(LQry,LS);
    finally
      LS.Free;
      LQry.Close;
      LQry.Free;
    end;
  end;
  function GetNowStep(ARkey06: Integer): Integer;
  var
    LS: TStringList;
    LQry: TADOQuery;
  begin
    Result := -1;
    LS := TStringList.Create;
    LQry := TADOQuery.Create(Self);
    try
      LS.Add('SELECT STEP FROM Data0056 WHERE WO_PTR = ');
      LS.Add(IntToStr(ARkey06));
      if not dmcon.SQLOpen(LQry,LS) then Exit;
      if LQry.IsEmpty then Exit;
      Result := LQry.fieldByName('STEP').AsInteger;
    finally
      LS.Free;
      LQry.Close;
      LQry.Free;
    end;
  end;
  procedure GetChildCombinStep(var Arr: IntArr; AParentRkey: Integer);
  var
    LS: TStringList;
    LQry: TADOQuery;
    I: Integer;
  begin
    LS := TStringList.Create;
    LQry := TADOQuery.Create(Self);
    try
      LS.Add('SELECT D06.BOM_PTR ,D25.BOM_STEP FROM Data0006 D06 ');
      LS.Add(' INNER JOIN Data0025 D25 ON D25.PARENT_PTR = D06.BOM_PTR ');
      LS.Add(' WHERE D06.RKey = ');
      LS.Add(IntToStr(AParentRkey));
      if not dmcon.SQLOpen(LQry,LS) then Exit;
      if LQry.IsEmpty then Exit;
      SetLength(Arr,LQry.RecordCount);
      LQry.First;
      for I := 0 to LQry.RecordCount - 1 do
      begin
        Arr[I] := LQry.fieldByName('BOM_STEP').AsInteger;
        LQry.Next;
      end;  
    finally
      LS.Free;
      LQry.Close;
      LQry.Free;
    end;
  end;
var
  LChildStep: IntArr;
  LParentNowStep: Integer;
  I: Integer;
begin
  LParentNowStep := GetNowStep(rKey06);
  if LParentNowStep = -1 then ShowMsg('06中没有找到记录',1);
  GetChildCombinStep(LChildStep,rKey06);
  for I := 0 to High(LChildStep) do
  begin
    if LParentNowStep = LChildStep[I] then
    begin
      SetWIPMAT_STATUSFalse(rKey06);
      Exit;
    end;
  end;
end;

function TfrmWO_Count.Update_Data_new(rkey06:integer): boolean;
var
  sqlstr,s:string;
  WType,PutType:Integer;
  FromDept,NextDept,rkey51,rkey54,jhzq:integer;
  jv:Extended;
  paigong:Boolean;
begin
  Result:=False;
  jhzq:=dmcon.adsWOInfo.FieldByName('交货周期').Value;
  if (dmcon.adsWOInfo.FieldByName('Wtype06').Value=3)and(dmcon.adsWOInfo.FieldByName('wtype').AsInteger>0) then
  begin
   with dmcon do
   begin
    if rgType.ItemIndex=0 then
      wType:= 0
    else
    if rgType.ItemIndex=1 then
      wType:= 2
    else
      wType:=3;
    sqlstr:=' SELECT D34.rKey,D34.DEPT_CODE, D34.DEPT_NAME,D238.STEP_NUMBER '+
            ' FROM dbo.Data0238 D238 INNER JOIN dbo.Data0034 D34 ON D238.DEPT_PTR = D34.RKEY '+
            ' WHERE D238.wo_ptr='+adsWOInfo.fieldByname('rkey06').Asstring+' and D238.Step_Number>'+adsWOInfo.fieldByname('STEP').Asstring+
            ' and D238.Step_Number <= '+dmcon.NextStep_238.fieldByName('STEP_NUMBER').AsString+
            ' order by Step_Number asc ';
    MyDataClass.OpenQuery(aqTmp,sqlstr);
    fromDept:=adsWoInfo.fieldbyName('dept_ptr').AsInteger;
    aqTmp.First;
    while not aqTmp.Eof do
    begin
      NextDept:=aqTmp.fieldbyName('rKey').AsInteger;
      sqlstr:=' select big_dept_ptr from data0034 where rkey in('+IntToStr(fromDept)+','+IntToStr(NextDept)+')'+
              ' group by big_dept_ptr ';
      MydataClass.OpenQuery(aqTmp2,sqlstr);
      if aqTmp2.RecordCount >1 then //不同的班组
        PutType:=1
      else
        PutType:=0;
      result := Update_0048_2(fromDept,nextDept,StrToInt(user_ptr),wType,PutType,rkey06,aqTmp.fieldbyName('Step_Number').AsInteger-1);
      if not result then break;
      fromDept:=aqTmp.fieldbyName('rKey').AsInteger;
      aqTmp.Next;
    end;
    if not result then exit;
//2.处理在线56表 DEPT_PTR：为下一步工序指针,STEP：为下一步步骤号,INTIME：为当前的过数时间
    if CheckBox2.Checked then s:=',panels=0' else s:='';
    sqlstr:=' update data0056 set dept_ptr='+NextStep_238.fieldByName('rKey').AsString+
            ' ,Step='+NextStep_238.fieldByName('STEP_NUMBER').AsString+s+
            ' ,loc_ptr='+inttostr(FaFct[ComboBox2.ItemIndex])+ //下工序工厂
            ' ,if_paigong=0,assign_cycle=0,assign_date=null,datevalue=0'+ //初始化派工相关信息
            ' ,InTime=getdate(),if_message=0,flow_no=0 where Wo_ptr='+inttostr(rkey06);

    sqlstr:= sqlstr +' update Data0056'
           +' set Data0056.step=Data0056.wtype'  //返工过数到最后一步，完成返工过数，进入到正常流程过数
           +' FROM Data0006 INNER JOIN'
                 +' Data0056 ON Data0006.RKEY = Data0056.WO_PTR '
           +' WHERE ('+NextStep_238.fieldByName('STEP_NUMBER').AsString +' IN'
                     +' (SELECT MAX(step_number)'
                    +' FROM data0238 INNER JOIN'
                          +' data0034 ON data0238.dept_ptr = data0034.rkey'
                    +' WHERE data0238.wo_ptr = data0006.rkey AND'
                          +' data0034.barcode_entry_flag = ''Y'')) AND'
                          +' (Data0006.RKEY ='+ inttostr(rkey06)+')';
    result := MyDataClass.ExecSql(sqlstr);
    if not result then
    begin
      ShowMsg('更新56表失败!',1);
      exit;
    end;
    //56增加派工相关信息
     with ADOQuery1 do
     begin
      Close;
      SQL.Clear;
      sql.Add('select top 1 isnull(rkey,0) as rkey from data0051 where ' +inttostr(jhzq)+ '>minvalue and '+inttostr(jhzq)+'<=maxvalue');
      Open;
     end;
     if ADOQuery1.IsEmpty then
     rkey51:=0
     else
     rkey51:=dmcon.ADOQuery1.fieldbyname('rkey').Value;
    if rkey51>0 then
    begin
     with ADOQuery2 do
     begin
      Close;
      SQL.Clear;
      sql.Add('select top 1 isnull(rkey,0) as rkey ,isnull(dateValue,0) as datevalue from data0054 where dept_ptr='+inttostr(NextDept));
      SQL.Add('and d051_ptr='+inttostr(rkey51));
      Open;
     end;
     if ADOQuery2.IsEmpty then
     begin
     rkey54:=0;
     jv:=0;
     end
     else
     begin
     rkey54:=ADOQuery2.fieldbyname('rkey').Value;
     jv:=ADOQuery2.fieldbyname('datevalue').Value;
     end;
     if rkey54>0 then
     begin
     sqlstr:=' update data0056 set if_paigong=1'+
            ' ,assign_cycle='+inttostr(jhzq)+
            ' ,assign_date=getdate()'+
            ' ,datevalue='+FloatToStr(jv)+' where Wo_ptr='+inttostr(rkey06);
      result := MyDataClass.ExecSql(sqlstr);
      if not result then
      begin
      ShowMsg('更新56表派工信息失败!',1);
      exit;
      end;
     end;
    end;
    //3.处理作业单状态
    if CheckBox1.Checked then//下一步工序是外发，那么要把作业单状态改为外发状态
      sqlstr:='update data0006 set prod_status=4 where rKey='+inttostr(rkey06)
    else                     //下一步工序不是外发，那么要把作业单状态改为正常状态
      sqlstr:='update data0006 set prod_status=3 where rKey='+inttostr(rkey06);
    result := myDataClass.ExecSql(sqlstr);
    if not result then
    begin
      ShowMsg('更新作业单状态失败!',1);
      exit;
    end;
    with dmcon.tmp do
    begin
      Close;
      sql.Clear;
      SQL.Add('select max(step_number) as mstep from data0238 ');
      sql.Add('where data0238.wo_ptr='+inttostr(rkey06));
      Open;
    end;
    if NextStep_238.fieldByName('STEP_NUMBER').Value=dmcon.tmp.FieldByName('mstep').Value then//判断是否返工已经结束
    begin
      with dmcon.ADOQuery1 do
      begin
       Close;
       sql.Clear;
       SQL.Add('select max(step_number) as mstep from data0038 inner join');
       SQL.Add('data0034 ON data0038.dept_ptr = data0034.rkey');
       sql.Add('WHERE data0038.source_ptr ='+adsWOInfo.fieldByName('bom_ptr').AsString+'AND');
       sql.Add('data0034.barcode_entry_flag = ''Y''');
       Open;
      end;
      if dmcon.ADOQuery1.FieldByName('mstep').Value=adsWOInfo.FieldByName('wtype').Value then //判断是否从最后一步返工的
      begin
       if adsWoInfo.FieldByName('Parent_ptr').AsInteger >0 then //内层产品
       begin
        with dmcon.ADOQuery2 do
        begin
         Close;
         SQL.Clear;
         sql.Text:='update data0006 set prod_status=6 where rkey='+inttostr(rkey06);
         ExecSQL;
        end;
       end
       else                                                     //外层产品
       begin
        with dmcon.ADOQuery3 do
        begin
         Close;
         SQL.Clear;
         sql.Text:='update data0006 set prod_status=5 where rkey='+IntToStr(rkey06);
         ExecSQL;
        end;
       end;
      end;
      with dmcon.tmp do
      begin
        Close;
        sql.Clear;
        sql.Text:='delete from data0238 where wo_ptr='+inttostr(rkey06);
        ExecSQL;
      end;
      with dmcon.tmp do
      begin
        Close;
        SQL.Clear;
        sql.Text:='update data0056 set wtype=0 where wo_ptr='+inttostr(rkey06);
        ExecSQL;
      end;
    end;
    Update_WIPMAT_STATUS(rkey06);
   end;
  end
  else
  begin
  if dmcon.aqNextStepNO.IsEmpty then exit;//未能找到下一级,说明是最后的工序
//先处理48,后处理56
//1.新增产品流转记录48,  判断当前过数工序和下一道工序之间是否存在不需要过数的工序，
//如果有，那么每个工序都插入一条48的记录。
//判断作业单投产状态,先判断配料单492,如果状态属于MRB返修,代表返工
   with dmcon do
   begin
    if rgType.ItemIndex=0 then
      wType:= 0
    else
    if rgType.ItemIndex=1 then
      wType:= 2
    else
      wType:=3;

    sqlstr:=' SELECT D34.rKey,D34.DEPT_CODE, D34.DEPT_NAME, D38.STEP_NUMBER '+
            ' FROM dbo.Data0038 D38 INNER JOIN dbo.Data0034 D34 ON D38.DEPT_PTR = D34.RKEY '+
            ' WHERE D38.Source_ptr='+adsWOInfo.fieldByname('Bom_ptr').Asstring+' and D38.Step_Number>'+adsWOInfo.fieldByname('STEP').Asstring+
            ' and D38.Step_Number <= '+aqNextStepNO.fieldByName('STEP_NUMBER').AsString+
            ' order by Step_Number asc ';
    MyDataClass.OpenQuery(aqTmp,sqlstr);
    fromDept:=adsWoInfo.fieldbyName('dept_ptr').AsInteger;
    aqTmp.First;
    while not aqTmp.Eof do
    begin
      NextDept:=aqTmp.fieldbyName('rKey').AsInteger;
      sqlstr:=' select big_dept_ptr from data0034 where rkey in('+IntToStr(fromDept)+','+IntToStr(NextDept)+')'+
              ' group by big_dept_ptr ';
      MydataClass.OpenQuery(aqTmp2,sqlstr);
      if aqTmp2.RecordCount >1 then //不同的班组
        PutType:=1
      else
        PutType:=0;
      result := Update_0048(fromDept,nextDept,StrToInt(user_ptr),wType,PutType,rkey06,aqTmp.fieldbyName('Step_Number').AsInteger-1,dmcon.adsWOInfo.FieldByName('BOM_PTR').Value);
      if not result then break;
      fromDept:=aqTmp.fieldbyName('rKey').AsInteger;
      aqTmp.Next;
    end;
    if not result then exit;
//2.处理在线56表 DEPT_PTR：为下一步工序指针,STEP：为下一步步骤号,INTIME：为当前的过数时间
    if CheckBox2.Checked then s:=',panels=0' else s:='';
    sqlstr:=' update data0056 set dept_ptr='+aqNextStepNO.fieldByName('rKey').AsString+
            ' ,Step='+aqNextStepNO.fieldByName('STEP_NUMBER').AsString+s+
            ' ,loc_ptr='+inttostr(FaFct[ComboBox2.ItemIndex])+ //下工序工厂
            ' ,if_paigong=0,assign_cycle=0,assign_date=null,datevalue=0'+//初始化派工信息
            ' ,InTime=getdate() ,if_message=0,flow_no=0 where Wo_ptr='+inttostr(rkey06);
    sqlstr:= sqlstr +' update Data0056'
           +' set Data0056.WTYPE = 0'  //工序最后一步过数工序PACK,改为正常生产状态
           +' FROM Data0006 INNER JOIN'
                 +' Data0056 ON Data0006.RKEY = Data0056.WO_PTR INNER JOIN'
                 +' Data0025 ON Data0006.BOM_PTR = Data0025.RKEY'
           +' WHERE ('+aqNextStepNO.fieldByName('STEP_NUMBER').AsString +' IN'
                     +' (SELECT MAX(step_number)'
                    +' FROM data0038 INNER JOIN'
                          +' data0034 ON data0038.dept_ptr = data0034.rkey'
                    +' WHERE data0038.source_ptr = data0025.rkey AND'
                          +' data0034.barcode_entry_flag = ''Y'' AND'
                          +' data0038.flow_no = data0056.flow_no)) AND (Data0006.RKEY ='+ inttostr(rkey06)+')';

    result := MyDataClass.ExecSql(sqlstr);
    if not result then
    begin
      ShowMsg('更新56表失败!',1);
      exit;
    end;
    //56增加派工相关信息
     with ADOQuery1 do
     begin
      Close;
      SQL.Clear;
      sql.Add('select top 1 isnull(rkey,0) as rkey from data0051 where ' +inttostr(jhzq)+ '>minvalue and '+inttostr(jhzq)+'<=maxvalue');
      Open;
     end;
     if ADOQuery1.IsEmpty then
     rkey51:=0
     else
     rkey51:=dmcon.ADOQuery1.fieldbyname('rkey').Value;
     if rkey51>0 then
     begin
      with ADOQuery2 do
      begin
      Close;
      SQL.Clear;
      sql.Add('select top 1 isnull(rkey,0) as rkey,isnull(dateValue,0) as datevalue from data0054 where dept_ptr='+inttostr(NextDept));
      SQL.Add('and d051_ptr='+inttostr(rkey51));
      Open;
      end;
      if ADOQuery2.IsEmpty then
      begin
      rkey54:=0;
      jv:=0;
      end
      else
      begin
      rkey54:=ADOQuery2.fieldbyname('rkey').Value;
      jv:=ADOQuery2.fieldbyname('datevalue').Value;
      end;
      if rkey54>0 then
      begin
      sqlstr:=' update data0056 set if_paigong=1'+
             ' ,assign_cycle='+inttostr(jhzq)+
             ' ,assign_date=getdate()'+
             ' ,datevalue='+FloatToStr(jv)+' where Wo_ptr='+inttostr(rkey06);
                  result := MyDataClass.ExecSql(sqlstr);
       if not result then
       begin
        ShowMsg('更新56表派工信息失败!',1);
        exit;
       end;
      end;
     end;
    //3.处理作业单状态
    if CheckBox1.Checked then//下一步工序是外发，那么要把作业单状态改为外发状态
      sqlstr:='update data0006 set prod_status=4 where rKey='+inttostr(rkey06)
    else                     //下一步工序不是外发，那么要把作业单状态改为正常状态
      sqlstr:='update data0006 set prod_status=3 where rKey='+inttostr(rkey06);
    result := myDataClass.ExecSql(sqlstr);
    if not result then
    begin
      ShowMsg('更新作业单状态失败!',1);
      exit;
    end;
   //4.处理作业单06表:当过数工序为最后一步工序时，如果是内层产品，就把作业单06状态更改为"待分配"（prod_status=6），如果是外层产品，作业单状态更改为"待入仓"（prod_status=5）
    sqlstr:=' SELECT 1 FROM dbo.Data0038 D38 INNER JOIN dbo.Data0034 D34 ON D38.DEPT_PTR = D34.RKEY '+
            ' WHERE D34.BARCODE_ENTRY_FLAG = '+QuotedStr('Y')+' and D38.Source_ptr='+adsWOInfo.fieldByname('Bom_ptr').Asstring+
            ' and D38.Step_Number>'+ dmcon.aqNextStepNO.FieldByName('STEP_NUMBER').AsString;
    if not MyDataClass.IsExists(sqlstr) then//过数的下一道工序是最后一道工序了,那么要把作业单状态改变
    begin
      if adsWoInfo.FieldByName('Parent_ptr').AsInteger >0 then //内层产品
        sqlstr:= ' Update data0006 set prod_status = 6 where rKey='+inttostr(rkey06)
      else                                                     //外层产品
        sqlstr:= ' Update data0006 set prod_status = 5 where rKey='+inttostr(rkey06);
      result := myDataClass.ExecSql(sqlstr);
      if not result then
      begin
        ShowMsg('更新作业单状态失败!',1);
        exit;
      end;
    end;
    Update_WIPMAT_STATUS(rkey06);
   end;
  end;
end;

procedure TfrmWO_Count.lv1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  LItem: TListItem;
  I: Integer;
begin
  LItem := lv1.GetItemAt(x,y);
  if LItem = nil then Exit;
  if LItem <> nil then
  begin
    for I := 0 to lv1.Items.Count - 1 do
    begin
      if lv1.Items[I] <> LItem then
        lv1.Items[I].Checked := False;
    end;
  end;
  LItem.Selected := True;
end;
procedure TfrmWO_Count.lv1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  LItem: TListItem;
  I: Integer;
begin
  LItem := Item;
  if LItem <> nil then
  begin
    for I := 0 to lv1.Items.Count - 1 do
    begin
      if lv1.Items[I] <> LItem then
        lv1.Items[I].Checked := False;
    end;
  end;
  LItem.Checked := not LItem.Checked;
end;

function TfrmWO_Count.check_woclamp(rkey06,clamp06:Integer):Boolean;//判断合并各个操作是否可正常进行
begin
  Result:=True;
  with dmcon.ADOQuery2 do //判断作业单分配0488表是否可以合并
  begin
    Close;
    sql.Clear;
    sql.Add('select * from data0488 where wo_ptr='+IntToStr(clamp06)+'order by rkey');
    Open;
  end;
  with dmcon.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from data0488 where wo_ptr='+IntToStr(rkey06)+'order by rkey');
    Open;
  end;
  if (dmcon.ADOQuery1.IsEmpty=False) and (dmcon.ADOQuery1.RecordCount<>dmcon.ADOQuery2.RecordCount) then
  begin
   MessageDlg('488记录存在差异，不能合并！请检查！',mtInformation,[mbok],1);
   Result:=False;
   Exit;
  end;
    with dmcon.ADOQuery2 do //判断0489表是否可以合并
  begin
    close;
    SQL.Clear;
    sql.Add('select * from data0489 where wo_ptr='+IntToStr(clamp06)+'order by TDATE');
    Open;
  end;
  with dmcon.ADOQuery1 do
  begin
    close;
    SQL.Clear;
    sql.Add('select * from data0489 where wo_ptr='+IntToStr(rkey06)+'order by TDATE');
    Open;
  end;
  if (dmcon.ADOQuery1.IsEmpty=False) and (dmcon.ADOQuery1.RecordCount<>dmcon.ADOQuery2.RecordCount) then
  begin
   MessageDlg('489记录存在差异，不能合并！请检查！',mtInformation,[mbok],1);
   Result:=False;
   Exit;
  end;
end;

function TfrmWO_Count.WoClamp(rkey06,clamp06:Integer):Boolean;
begin
  Result:=False;
 if check_woclamp(rkey06,clamp06) then
 begin
 dmcon.ADOConnection1.BeginTrans;
 try
  with dmcon.ADOQuery1 do //修改两张合并工单06表
  begin
   Close;
   sql.Clear;
   SQL.Add('select * from data0006 where rkey='+IntToStr(rkey06));
   Open;
  end;
  with dmcon.ADOQuery2 do
  begin
   Close;
   sql.Clear;
   SQL.Add('select * from data0006 where rkey='+IntToStr(clamp06));
   Open;
  end;
  dmcon.ADOQuery2.Edit;//合并母单数量增加
  dmcon.ADOQuery2.FieldByName('quan_sch').Value:=dmcon.ADOQuery2.FieldByName('quan_sch').Value+dmcon.ADOQuery1.FieldByName('quan_sch').Value;
  dmcon.ADOQuery2.FieldByName('quan_rej').Value:=dmcon.ADOQuery2.FieldByName('quan_rej').Value+dmcon.ADOQuery1.FieldByName('quan_rej').Value;
  dmcon.ADOQuery2.FieldByName('QUAN_PROD').Value:=dmcon.ADOQuery2.FieldByName('quan_prod').Value+dmcon.ADOQuery1.FieldByName('quan_prod').Value;
  dmcon.ADOQuery2.FieldByName('panels').Value:=dmcon.ADOQuery2.FieldByName('panels').Value+dmcon.ADOQuery1.FieldByName('panels').Value;
  dmcon.ADOQuery2.Post;
  dmcon.ADOQuery1.Edit;//子单数量清0
  dmcon.ADOQuery1.FieldByName('prod_status').Value:=202;
  dmcon.ADOQuery1.FieldByName('quan_sch').Value:=0;
  dmcon.ADOQuery1.FieldByName('quan_rej').Value:=0;
  dmcon.ADOQuery1.FieldByName('quan_prod').Value:=0;
  dmcon.ADOQuery1.FieldByName('panels').Value:=0;
  dmcon.ADOQuery1.Post;
  with dmcon.ADOQuery1 do//修改报废记录工单指针
  begin
   Close;
   sql.Clear;
   sql.Add('update data0058 set wo_ptr='+IntToStr(clamp06)+' where wo_ptr='+IntToStr(rkey06));
   ExecSQL;
  end;
  with dmcon.ADOQuery1 do//修改成品库存指针
  begin
   Close;
   sql.Clear;
   sql.Add('update data0053 set WORK_ORDER_PTR='+IntToStr(clamp06)+' where WORK_ORDER_PTR='+IntToStr(rkey06));
   ExecSQL;
  end;
  with dmcon.ADOQuery1 do //修改母单56表在线数量（加上子单的数量）并删除子单在线作业单
  begin
   Close;
   sql.Clear;
   SQL.Add('select * from data0056 where wo_ptr='+IntToStr(rkey06));
   Open;
  end;
 with dmcon.ADOQuery2 do
 begin
  Close;
  sql.Clear;
  SQL.Add('select * from data0056 where wo_ptr='+IntToStr(clamp06));
  Open;
 end;
 dmcon.ADOQuery2.Edit; //母单在线作料单相关数量增加
 dmcon.ADOQuery2.FieldByName('QTY_BACKLOG').Value:=dmcon.ADOQuery2.FieldByName('QTY_BACKLOG').Value+dmcon.ADOQuery1.FieldByName('QTY_BACKLOG').Value;
 dmcon.ADOQuery2.FieldByName('TO_BE_STOCKED').Value:=dmcon.ADOQuery2.FieldByName('TO_BE_STOCKED').Value+dmcon.ADOQuery1.FieldByName('TO_BE_STOCKED').Value;
 dmcon.ADOQuery2.FieldByName('panels').Value:=dmcon.ADOQuery2.FieldByName('panels').Value+dmcon.ADOQuery1.FieldByName('panels').Value;
 dmcon.ADOQuery2.FieldByName('TO_BE_CANCD').Value:=dmcon.ADOQuery2.FieldByName('TO_BE_CANCD').Value+dmcon.ADOQuery1.FieldByName('TO_BE_CANCD').Value;
 dmcon.ADOQuery2.Post;
 with dmcon.ADOQuery3 do //子单在线工单删除
 begin
  Close;
  sql.Clear;
  SQL.Add('delete from data0056 where WO_PTR='+inttostr(rkey06));
  ExecSQL;
 end;
   with dmcon.ADOQuery3 do   //更改过数记录48表子工单合并时的作业单指针（合并过数记录）
   begin
     Close;
     sql.Clear;
     sql.Add('update data0048 set wo_ptr='+inttostr(clamp06));
     SQL.Add('where wo_ptr='+inttostr(rkey06));
     ExecSQL;
   end;
  with dmcon.ADOQuery2 do //合并作业单分配0488表
  begin
    Close;
    sql.Clear;
    sql.Add('select * from data0488 where wo_ptr='+IntToStr(clamp06)+'order by rkey');
    Open;
  end;
  with dmcon.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from data0488 where wo_ptr='+IntToStr(rkey06)+'order by rkey');
    Open;
  end;
  if dmcon.ADOQuery2.IsEmpty=False then
  begin
    dmcon.ADOQuery2.First;
    dmcon.ADOQuery1.First;
    while not dmcon.ADOQuery2.Eof do
    begin
     dmcon.ADOQuery2.Edit;
     dmcon.ADOQuery2.FieldByName('quan_req').Value:=dmcon.ADOQuery2.FieldByName('quan_req').Value+dmcon.ADOQuery1.FieldValues['quan_req'];
     dmcon.ADOQuery2.FieldByName('quan_issued').Value:=dmcon.ADOQuery2.FieldByName('quan_issued').Value+dmcon.ADOQuery1.FieldValues['quan_issued'];
     dmcon.ADOQuery2.Post;
     dmcon.ADOQuery2.MoveBy(1);
     dmcon.ADOQuery1.MoveBy(1);
    end;
  end;
  with dmcon.ADOQuery3 do
  begin
    Close;
    sql.Clear;
    SQL.Add('delete from data0488 where wo_ptr='+IntToStr(rkey06));
    ExecSQL;
  end;
  with dmcon.ADOQuery2 do //合并作业单分配0489表
  begin
    close;
    SQL.Clear;
    sql.Add('select * from data0489 where wo_ptr='+IntToStr(clamp06)+'order by TDATE');
    Open;
  end;
  with dmcon.ADOQuery1 do
  begin
    close;
    SQL.Clear;
    sql.Add('select * from data0489 where wo_ptr='+IntToStr(rkey06)+'order by TDATE');
    Open;
  end;
  if dmcon.ADOQuery2.IsEmpty=False then
  begin
    dmcon.ADOQuery2.First;
    dmcon.ADOQuery1.First;
    while not dmcon.ADOQuery2.Eof do
    begin
      dmcon.ADOQuery2.Edit;
      dmcon.ADOQuery2.FieldByName('QTY').Value:=dmcon.ADOQuery2.FieldByName('QTY').Value+dmcon.ADOQuery1.FieldByName('QTY').Value;
      dmcon.ADOQuery2.Post;
      dmcon.ADOQuery2.MoveBy(1);
      dmcon.ADOQuery1.MoveBy(1);
    end;
  end;
  with dmcon.ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from data0489 where wo_ptr='+inttostr(rkey06));
    ExecSQL;
  end;
  with dmcon.ADOQuery2 do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from data0410 where wo_ptr='+inttostr(rkey06));
    Open;
  end;
  if not dmcon.ADOQuery2.IsEmpty then
  begin
    dmcon.ADOQuery2.First;
    while not dmcon.ADOQuery2.Eof do
    begin
     with dmcon.ADOQuery1 do
     begin
       Close;
       sql.Clear;
       SQL.Add('select * from data0410 where wo_ptr='+inttostr(clamp06));
       SQL.Add('and D0451_ptr='+dmcon.ADOQuery2.FieldByName('D0451_ptr').AsString);
       SQL.Add('and step='+dmcon.ADOQuery2.FieldByName('step').AsString);
       sql.Add('and dept_ptr='+dmcon.ADOQuery2.FieldByName('dept_ptr').AsString);
       Open;
     end;
     if not dmcon.ADOQuery1.IsEmpty then
     begin
       dmcon.ADOQuery1.Edit;
       dmcon.ADOQuery1.FieldByName('QTY').Value:=dmcon.ADOQuery1.FieldByName('QTY').Value+dmcon.ADOQuery2.FieldByName('QTY').Value;
       dmcon.ADOQuery1.FieldByName('MATL_AMOUNT').Value:=dmcon.ADOQuery1.FieldByName('MATL_AMOUNT').Value+dmcon.ADOQuery2.FieldByName('MATL_AMOUNT').Value;
       dmcon.ADOQuery1.FieldByName('ovhd1_AMOUNT').Value:=dmcon.ADOQuery1.FieldByName('ovhd1_AMOUNT').Value+dmcon.ADOQuery2.FieldByName('ovhd1_AMOUNT').Value;
       dmcon.ADOQuery1.FieldByName('ovhd2_AMOUNT').Value:=dmcon.ADOQuery1.FieldByName('ovhd2_AMOUNT').Value+dmcon.ADOQuery2.FieldByName('ovhd2_AMOUNT').Value;
       dmcon.ADOQuery1.FieldByName('ovhd3_AMOUNT').Value:=dmcon.ADOQuery1.FieldByName('ovhd3_AMOUNT').Value+dmcon.ADOQuery2.FieldByName('ovhd3_AMOUNT').Value;
       dmcon.ADOQuery1.Post;
     end
     else
     begin
      dmcon.ADOQuery2.Edit;
      dmcon.ADOQuery2.FieldByName('wo_ptr').Value:=clamp06;
      dmcon.ADOQuery2.Post;
     end;
     dmcon.ADOQuery2.MoveBy(1);
    end;
  end;
  with dmcon.ADOQuery3 do
  begin
    Close;
    sql.Clear;
    sql.Add('delete from data0410 where wo_ptr='+inttostr(rkey06));
    ExecSQL;
  end;
  dmcon.ADOConnection1.CommitTrans;
  Result:=True;
 except
  on E: Exception do
  begin
   Result:=False;
   if dmcon.ADOConnection1.InTransaction then
   dmcon.ADOConnection1.RollbackTrans;
   ShowMessage('作业单在此工序合并失败,请检查！');
  end;
 end;
 end;
end;

procedure TfrmWO_Count.lv1Exit(Sender: TObject);
var i,rkey06:Integer;
begin
 rkey06:=dmcon.adsWOInfo.FieldbyName('rKey06').AsInteger;
 for i:=0 to lv1.Items.Count-1 do
 begin
  if lv1.Items[I].Checked = true then
  begin
   clamp06:=StrToInt(lv1.Selected.SubItems.Strings[5]);//获取合卡母单的rkey值
  end;
 end;
 with dmcon.ADOQuery1 do
 begin
  Close;
  SQL.Clear;
  SQL.Add('select from_wo_ptr from data0006');
  SQL.Add('where rkey='+inttostr(clamp06));
  Open;
 end;
 with dmcon.ADOQuery2 do
 begin
  Close;
  SQL.Clear;
  sql.Add('select from_wo_ptr from data0006');
  sql.Add('where rkey='+inttostr(rkey06));
  Open;
 end;
 if (rkey06=dmcon.ADOQuery1.FieldByName('from_wo_ptr').Value) or (dmcon.ADOQuery2.IsEmpty) then
 begin
  with dmcon.tmpQry do
  begin
    Close;
    sql.Clear;
    SQL.Add('select rkey from data0448 where wo_ptr='+inttostr(clamp06));
    Open;
  end;
  if not dmcon.tmpQry.IsEmpty then
  begin
    lv1.Selected.Checked:=False;
   ShowMessage('当前所选合卡工单在期末在制品截数内不能合卡,请选择其他工单!');
  end;
 end
 else
 begin
 with dmcon.tmpQry do
  begin
    Close;
    sql.Clear;
    SQL.Add('select rkey from data0448 where wo_ptr='+inttostr(rkey06));
    Open;
  end;
  if not dmcon.tmpQry.IsEmpty then
  begin
    lv1.Selected.Checked:=False;
   ShowMessage('当前过数工单在期末在制品截数内不能合卡!');
  end;
 end;
end;

procedure TfrmWO_Count.CheckBox3Click(Sender: TObject);
begin
 if CheckBox3.Checked=False then
 begin
  lv1.Selected.Checked:=False;
  lv1.Enabled:=False;
 end
 else
 begin
  lv1.Enabled:=True;
 end;
end;

end.
