unit Detail_Edti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, Mask, DBCtrls, Grids,db,adodb,
  DBGrids, DBGridEh;

type
  TfrmDetail_Edti = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnSave: TSpeedButton;
    btnExit: TSpeedButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBGridEh1: TDBGridEh;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    Label20: TLabel;
    DBEdit14: TDBEdit;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    GroupBox2: TGroupBox;
    DBGridEh2: TDBGridEh;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBComboBox1: TDBComboBox;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBText1: TDBText;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit9: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit18: TDBEdit;
    SpeedButton8: TSpeedButton;
    DBText2: TDBText;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label26: TLabel;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Label27: TLabel;
    DBEdit8: TDBEdit;
    DBEdit19: TDBEdit;
    EdtSupp: TEdit;
    EdtVou: TEdit;
    Edtid_code: TEdit;
    Edit1: TEdit;
    Label28: TLabel;
    BitBtn1: TBitBtn;
    Label29: TLabel;
    lbl1: TLabel;
    dtpCSRZ: TDateTimePicker;
    procedure btnExitClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
  private

    FAFc:array[0..9] of integer;
  public
    F_status:Integer;
    FchgMe:boolean;
    vEnterMode:byte;
    function Check_Before_Post:boolean;
    procedure Enter(Enter_Mode:byte;rKey:integer);
  end;

var
  frmDetail_Edti: TfrmDetail_Edti;

implementation
uses dm,MyClass,Common,ConstVar,Dlg_Curr_List,Dlg_Department,AcctSearch,Pick_Item_Single;
{$R *.dfm}

procedure TfrmDetail_Edti.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDetail_Edti.btnSaveClick(Sender: TObject);

begin
  if vEnterMode = em_add then
  begin
    dmcon.tmp.Close;
    dmcon.tmp.SQL.Text := 'select 1 from data0517 where FASSET_CODE = ' + QuotedStr(dmcon.ads517.fieldbyname('FASSET_CODE').AsString);
                    //      ' or id_code = ' + QuotedStr(dmcon.ads517.fieldbyname('id_code').AsString);
    dmcon.tmp.Open;
    if not dmcon.tmp.IsEmpty then
    begin
      dmcon.ads04.Close;
      dmcon.ads04.Open;
      if dmcon.ads04.FieldByName('Seed_Flag').AsInteger <> 1 then
      begin
        dmcon.ads517.Edit;
        dmcon.ads517.FieldByName('FASSET_CODE').Value := dmcon.ads04.fieldbyName('Seed_Value').AsString;
        dmcon.ads517.Post;
      end;
    end;
  
    dmcon.tmp.Close;
    dmcon.tmp.SQL.Text := 'select 1 from data0517 where id_code = ' + QuotedStr(dmcon.ads517.fieldbyname('id_code').AsString);
    dmcon.tmp.Open;

    if not dmcon.tmp.IsEmpty then
    begin
      ShowMessage('资产ID号 或 资产编号重复！禁止保存！');
      Exit;
    end;
    
  end;

  if (not (DateTimePicker1.DateTime <= dtpCSRZ.DateTime)) then
  begin
    ShowMessage('购入日期必须 小于等于 初始入账日期');
    Exit;
  end;
  if (not (dtpCSRZ.DateTime <= DateTimePicker2.DateTime)) then
  begin
    ShowMessage('初始入账日期必须小于等于入账日期');
    Exit;
  end;
  try
    if FchgMe then    //只修改备注
    begin
      try
        dmcon.ADOConnection1.BeginTrans;
        dmcon.F_status := F_status;
        dmcon.ads517.UpdateBatch(arAll);
        dmcon.tmp.Close;
        dmcon.tmp.SQL.Text:='update data0517 set remark='''+Memo1.Text+''',supplier_name='''+EdtSupp.Text+
                            ''',id_code='''+Edtid_code.Text+
                            ''',VOUCHER='''+EdtVou.Text+''' where rkey='+dmcon.ads517.FieldByName('rkey').AsString;
        dmcon.tmp.ExecSQL;
        if dmcon.ads517faccu_depr_gl_ptr.Value>0 then   //增加对417的更新//设备编码外键
         with dmcon.Tmp do
         begin
           Close;
           sql.Text:='update data0417 set id_code='''','+
                   'active_flag=3 from data0417  '+
                   'where data0417.rkey='+inttostr(dmcon.rKey417);

           ExecSQL;
         end;

        if dmcon.ads517faccu_depr_gl_ptr.Value>0 then   //增加对417的更新//设备编码外键
        with dmcon.Tmp do
        begin
          Close;
          sql.Text:='update data0417 set id_code=data0517.FASSET_CODE,'+
                   'active_flag=4 from data0417 inner join data0517 on '+
                   'data0417.rkey=data0517.faccu_depr_gl_ptr '+
                   'where data0517.rkey='+dmcon.ads517.FieldByName('rKey').AsString+' and data0417.active_flag=3';
          ExecSQL;
        end;
         dmcon.ADOConnection1.CommitTrans;
      except
         on E: Exception do
         begin
          dmcon.ADOConnection1.RollbackTrans;
          ShowMsg(E.Message, 1);
         end;
      end;

    end
    else
    begin

      dmcon.ads517.edit;
      dmcon.ads517.FieldByName('USER_DATE').Value :=DateTimePicker1.Date;
      dmcon.ads517.FieldByName('BOOK_DATE').Value :=DateTimePicker2.Date;
      dmcon.ads517.FieldByName('orig_BOOK_DATE').Value := dtpCSRZ.Date;
      dmcon.ads517.FieldByName('warehouse_ptr').Value:=FAfc[ComboBox1.ItemIndex];
      dmcon.ads517.Post;
      dmcon.SaveData(vEnterMode) ;
    end;
    close;
  except
    on E: Exception do begin
    showmessage('保存发生错误:'+E.Message);
    end;
  end;
end;

procedure TfrmDetail_Edti.Enter(Enter_Mode: byte; rKey: integer);
var i:integer;
begin
  vEnterMode:=Enter_Mode;
  with dmcon do
   begin
    qryAssetType.close;
    qryAssetType.open;
    qryAssetType.first;
    DBComboBox2.Items.clear;
    while not qryAssetType.eof do            //类别
    begin
      DBComboBox2.Items.Add(trim(qryAssetType.fieldByName('Fasset_Type').AsString));
      qryAssetType.Next;
    end;

    qryAssetAddType.close;
    qryAssetAddType.open;
    DBComboBox3.Items.Clear;
    qryAssetAddType.First;
    while not qryAssetAddType.eof do begin    //增加方式
      DBComboBox3.Items.Add(trim(qryAssetAddType.fieldByName('Fasset_Alt_Type').AsString));
      qryAssetAddType.Next;
    end;

    qryAssetStatus.Close;
    qryAssetStatus.open;
    qryAssetStatus.First;
    while not qryAssetStatus.eof do begin    //使用状态
      DBComboBox4.Items.Add(trim(qryAssetStatus.fieldByName('FAsset_Status').AsString));
      qryAssetStatus.Next;
    end;

    aqCurrency.Close;
    aqCurrency.Open;
    aqDepartment.Close;
    aqDepartment.Open;
    aqAcctItem.Close;
    aqAcctItem.Open;
    tmp.Close;
    tmp.SQL.Text:='select rkey,abbr_name from data0015 order by rkey';
    tmp.Open;
    i:=0;
    while not tmp.Eof do
    begin
      FAFc[i]:=tmp.Fields[0].AsInteger;
      inc(i);
      ComboBox1.Items.Append(tmp.Fields[1].asstring);
      tmp.Next;
    end;
    tmp.Close;
   end;

  if F_status=4 then //浏览
   begin
    dmcon.ads517.LockType := ltReadOnly;
    Edit1.ShowHint:=false;
   end
  else
    dmcon.ads517.LockType := ltBatchOptimistic;
  if F_status=6 then
  begin
    DBEdit3.ReadOnly := True;
    DBEdit4.ReadOnly := True;
    DBEdit7.ReadOnly := True;
    DBEdit9.ReadOnly := True;
    DBEdit10.ReadOnly := True;
    DBEdit11.ReadOnly := True;
    DBEdit12.ReadOnly := True;
    DBEdit13.ReadOnly := True;
    DBEdit14.ReadOnly := True;
    DBEdit15.ReadOnly := True;
  end;
  SpeedButton1.Enabled := enter_mode <> em_browse;
  SpeedButton2.Enabled := enter_mode <> em_browse;
  SpeedButton3.Enabled := enter_mode <> em_browse;
  SpeedButton4.Enabled := enter_mode <> em_browse;
  SpeedButton5.Enabled := enter_mode <> em_browse;
  SpeedButton6.Enabled := enter_mode <> em_browse;
  SpeedButton7.Enabled := enter_mode <> em_browse;
  SpeedButton8.Enabled := enter_mode <> em_browse;
  DateTimePicker1.Enabled := enter_mode <> em_browse;
  DateTimePicker2.Enabled := enter_mode <> em_browse;
  dtpCSRZ.Enabled := DateTimePicker1.Enabled;
//  BitBtn1.Enabled := enter_mode = em_Add;
  if F_status=4 then
    BitBtn1.Enabled := False;
  DBComboBox2.Enabled := enter_mode <> em_browse;
  DBComboBox3.Enabled := enter_mode <> em_browse;
  DBComboBox4.Enabled := enter_mode <> em_browse;
  ComboBox1.Enabled:=DBComboBox4.Enabled;
  MyDataclass.OpenDataSetByPara(rKey,dmcon.ads517);
  if enter_mode = em_Add then
  begin
    dmcon.ads517.Append;
    DateTimePicker2.date:= Get_Acct_Depr_Date;
    DateTimePicker1.Date:=DateTimePicker2.date;
    dtpCSRZ.Date := DateTimePicker1.Date;
    ComboBox1.ItemIndex:=0;
   dmcon.ads04.Close;
   dmcon.ads04.Open;
   if dmcon.ads04.FieldByName('Seed_Flag').AsInteger = 4 then
    dbedit1.Enabled:=false
   else
    dbedit1.Enabled:=true;
  end
  else
  begin
    DateTimePicker1.date:= dmcon.ads517.fieldbyName('USER_DATE').Asdatetime;
    DateTimePicker2.Date:=dmcon.ads517.fieldbyName('BOOK_DATE').Asdatetime;
    if dmcon.ads517orig_BOOK_DATE.IsNull then
      dtpCSRZ.Date := dmcon.ads517.fieldbyName('USER_DATE').Asdatetime
    else
      dtpCSRZ.Date := dmcon.ads517.fieldbyName('orig_BOOK_DATE').Asdatetime;
    dmcon.ads517FASSET_TYPE_PTR_oldV:=dmcon.ads517FASSET_TYPE_PTR.Value;
    for i:=0 to 9 do
    if dmcon.ads517.fieldbyName('warehouse_ptr').AsInteger=FAfc[i] then
    begin
      ComboBox1.ItemIndex:=i;
      break;
    end;
   if dmcon.ads517faccu_depr_gl_ptr.Value>0 then
   begin
    dmcon.tmp.Close;
    dmcon.tmp.SQL.Text:='select rkey,FASSET_CODE,FASSET_NAME from data0417 where rkey='+
                 dmcon.ads517faccu_depr_gl_ptr.AsString;
    dmcon.tmp.Open;
    if not dmcon.tmp.IsEmpty then
     begin
       edit1.Text:=dmcon.tmp.Fieldbyname('FASSET_CODE').AsString;
       Label29.Caption:=dmcon.tmp.Fieldbyname('FASSET_NAME').AsString;
       dmcon.rkey417 :=  dmcon.tmp.Fieldbyname('rkey').AsInteger;
       
     end;
   end;
  end;

  if FchgMe then
  begin
    Memo1.Visible:=true;
    Memo1.Text:=DBMemo1.Text;
    EdtSupp.Visible:=true;
    Edtid_code.Visible:=true;

    EdtSupp.Text:=DBEdit8.Text;
    Edtid_code.Text:=DBEdit2.Text;
    EdtVou.Visible:=true;
    EdtVou.Text:=DBEdit19.Text;

    btnSave.Enabled:=true;
  end;
  ShowModal;
end;

procedure TfrmDetail_Edti.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  rKey:integer;
begin
  rKey:= dmcon.ads517.FieldByName('rKey').AsInteger;  
  dmcon.ads517.Close;
  dmcon.ads325.Close;
  dmcon.ads326.Close;
  if  (vEnterMode = em_Add) and ( rKey > 0 )then
  begin
    dmcon.adsAssetList.Close;
    dmcon.adsAssetList.Open;
    dmcon.adsAssetList.Locate('rKey',rKey,[]);
  end;
  frmDetail_Edti := nil;
end;

procedure TfrmDetail_Edti.btnCancelClick(Sender: TObject);
begin
  with dmcon do begin
    ads325.Cancel;
    ads326.Cancel;
    ads517.Cancel;
  end;
end;

function TfrmDetail_Edti.Check_Before_Post: boolean;
var
  tmpQty:double;
begin
  result := true;
  with dmcon do begin
    if trim(ads517.FieldByName('FASSET_CODE').AsString)='' then
    begin
      ShowMsg('资产ID号不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('id_code').AsString)='' then
    begin
      ShowMsg('无效的资产编号!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('FASSET_NAME').AsString)='' then
    begin
      ShowMsg('资产名称不能为空!',1);
      result := false;
      exit;
    end;
    if ads517.FieldByName('FASSET_TYPE_PTR').IsNull then
    begin
      ShowMsg('无效的资产类别!',1);
      result := false;
      exit;
    end;
    if ads517.FieldByName('ALT_TYPE_PTR').IsNull then
    begin
      ShowMsg('无效的增加方式!',1);
      result := false;
      exit;
    end;
    if ads517.FieldByName('STATUS_PTR').IsNull then
    begin
      ShowMsg('无效的使用状况!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('LOCATION').AsString)='' then
    begin
      ShowMsg('存放位置不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('ORIGINAL_VALUE').AsString)='' then
    begin
      ShowMsg('原值不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('EXPECTED_LIFE_MONTHS').AsString)='' then
    begin
      ShowMsg('预计使用月份不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('DEPRED_MONTHS').AsString)='' then
    begin
      ShowMsg('当前已使用月份不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('SURPLUS_RATE').AsString)='' then
    begin
      ShowMsg('预计净残值率不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('SURPLUS').AsString)='' then
    begin
      ShowMsg('净残值不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('MONTH_DEPRE_RATE').AsString)='' then
    begin
      ShowMsg('月折旧率不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('MONTH_DEPRE_AMT').AsString)='' then
    begin
      ShowMsg('月折旧额不能为空!',1);
      result := false;
      exit;
    end;
    if trim(ads517.FieldByName('DEPRE_ACCT_PTR').AsString)='' then
    begin
      ShowMsg('累计折旧科目不能为空!',1);
      result := false;
      exit;
    end;
    if ads326.IsEmpty then
    begin
      ShowMsg('折旧部门不能为空!',1);
      result := false;
      exit;
    end;
    tmpQty:=Get_Field_Total_Value(dmcon.ads326,'PERCENTS');
    if tmpQty<>100 then
    begin
      ShowMsg('折旧部门百分比分摊必须等于100%,请确认!',1);
      result := false;
      exit;
    end;
    if not Check_Acct_Depr_Date(dmcon.ads517.fieldByName('BOOK_DATE').AsDatetime) then
    begin
      result := false;
      exit;
    end;
  end;
end;

procedure TfrmDetail_Edti.SpeedButton2Click(Sender: TObject);
begin
  with TfrmDlg_Curr_List.Create(Application)do
  try
    Enter(em_Add);
    if ShowModal = mrok then
    begin
      dmcon.ads325.Append;
      dmcon.ads325.FieldByName('Curr_ptr').Value := dmcon.qryTmp.fieldByName('rKey').Value;
      dmcon.ads325.FieldByName('orig_curr_orig_value').value := StrToFloat(edtOrgValue.Text);
      dmcon.ads325.FieldByName('ex_rate').Value := StrToFloat(edtExchRate.Text);
      dmcon.ads325.Post;
    end;
  finally
    free;
  end;
end;

procedure TfrmDetail_Edti.SpeedButton3Click(Sender: TObject);
begin
  with TfrmDlg_Curr_List.Create(Application)do
  try
    Enter(em_edit);
    if ShowModal = mrok then
    begin
      dmcon.ads325.edit;
      dmcon.ads325.FieldByName('Curr_ptr').Value := dmcon.qryTmp.fieldByName('rKey').Value;
      dmcon.ads325.FieldByName('orig_curr_orig_value').value := StrToFloat(edtOrgValue.Text);
      dmcon.ads325.FieldByName('ex_rate').Value := StrToFloat(edtExchRate.Text);
      dmcon.ads325.Post;
    end;
  finally
    free;
  end;
end;

procedure TfrmDetail_Edti.SpeedButton4Click(Sender: TObject);
begin
  dmcon.ads325.delete;
end;

procedure TfrmDetail_Edti.DateTimePicker1Change(Sender: TObject);
begin
  dmcon.ads517.Edit;
  dmcon.ads517.FieldByName('USER_DATE').Value := DateTimePicker1.Date;
end;

procedure TfrmDetail_Edti.DateTimePicker2Change(Sender: TObject);
begin
  dmcon.ads517.Edit;
  dmcon.ads517.FieldByName('BOOK_DATE').Value := DateTimePicker2.Date;
end;

procedure TfrmDetail_Edti.SpeedButton5Click(Sender: TObject);
begin
  with TfrmDlg_Department.Create(Application)do
  try
    Enter(em_Add);
    if ShowModal = mrok then
    begin
      dmcon.ads326.Append;
      dmcon.ads326.FieldByName('dept_ptr').Value := rkey_Depart;
      dmcon.ads326.FieldByName('FACCU_DEPT_GL_PTR').Value := rKey_Acct;
      dmcon.ads326.FieldByName('PERCENTS').Value := StrToFloat(edtPercent.Text);
      dmcon.ads326.Post;
    end;
  finally
    free;
  end;
end;

procedure TfrmDetail_Edti.SpeedButton6Click(Sender: TObject);
begin
  with TfrmDlg_Department.Create(Application)do
  try
    Enter(em_Edit);
    if ShowModal = mrok then
    begin
      dmcon.ads326.edit;
      dmcon.ads326.FieldByName('dept_ptr').Value := rkey_Depart;
      dmcon.ads326.FieldByName('FACCU_DEPT_GL_PTR').Value := rKey_Acct;
      dmcon.ads326.FieldByName('PERCENTS').Value := StrToFloat(edtPercent.Text);
      dmcon.ads326.Post;
    end;
  finally
    free;
  end;
end;

procedure TfrmDetail_Edti.SpeedButton7Click(Sender: TObject);
begin
  dmcon.ads326.Delete;
end;

procedure TfrmDetail_Edti.SpeedButton1Click(Sender: TObject);

begin
  with TForm_Acct.Create(self) do
  try
    Enter(2);
    if ShowModal = mrok then
    begin
      dmcon.ads517.edit;
      dmcon.ads517.FieldByName('DEPRE_ACCT_PTR').Value := ADOQuery1.fieldByName('RKEY').Asinteger;
    end;
  finally
    free;
  end;
end;

procedure TfrmDetail_Edti.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if dmcon.ads517FASSET_TYPE_PTR.IsNull then
  begin
    ShowMessage('请选择资产类别');
    Key := #0;
    Exit;
  end;
  if Key = #13 then
  begin
    Key := #0;
    SendMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, 0, 0);
  end;
  if (Key = #13) then Key := #0;

  inherited KeyPress(Key);
end;

procedure TfrmDetail_Edti.SpeedButton8Click(Sender: TObject);
begin
  with TForm_Acct.Create(self) do
  try
    Enter(1);
    if ShowModal = mrok then
    begin
      dmcon.ads517.edit;
      dmcon.ads517.FieldByName('fasset_gl_ptr').Value := ADOQuery1.fieldByName('RKEY').Asinteger;
    end;
  finally
    free;
  end;
end;

procedure TfrmDetail_Edti.ComboBox1Change(Sender: TObject);
begin
  btnSave.Enabled:=true;
end;

procedure TfrmDetail_Edti.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='FASSET_CODE/设备编码/80,FASSET_NAME/设备名称/121,FASSET_DESC/规格/125,'+
                   'LOCATION/具体位置/100,PURCH_DATE/购入日期/120,FASSET_TYPE/类别/100';
  InputVar.Sqlstr:=
    'SELECT  DATA0417.FASSET_CODE, dbo.DATA0417.FASSET_NAME, dbo.DATA0417.FASSET_DESC,'+
    'DATA0417.LOCATION,DATA0417.PURCH_DATE, dbo.DATA0417.active_flag,Data0514.FASSET_TYPE,FASSET_TYPE_PTR,data0417.rkey '+
    'FROM  dbo.DATA0417 INNER JOIN '+
    'dbo.Data0514 ON dbo.DATA0417.FASSET_TYPE_PTR = dbo.Data0514.RKEY '+
    'WHERE  (dbo.DATA0417.active_flag = 3)';

  inputvar.KeyField:='FASSET_CODE';

  InputVar.AdoConn := dmcon.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit1.Text:=frmPick_Item_Single.adsPick.Fieldbyname('FASSET_CODE').AsString;
   Label29.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('FASSET_NAME').AsString;
   

   dmcon.ads517.Edit;

   dmcon.ads517faccu_depr_gl_ptr.Value:= frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
//   if dmcon.ads517FASSET_NAME.Value='' then
    if (F_status <> 4) and (F_status <> 6) then
      dmcon.ads517FASSET_NAME.Value:=  frmPick_Item_Single.adsPick.Fieldbyname('FASSET_NAME').AsString;

//   if dmcon.ads517FASSET_DESC.Value='' then
    if (F_status <> 4) and (F_status <> 6) then
      dmcon.ads517FASSET_DESC.Value:=  frmPick_Item_Single.adsPick.Fieldbyname('FASSET_DESC').AsString;
//   if dmcon.ads517LOCATION.Value='' then
    if (F_status <> 4) and (F_status <> 6) then
      dmcon.ads517LOCATION.Value:=  frmPick_Item_Single.adsPick.Fieldbyname('LOCATION').AsString;
    if (F_status <> 4) and (F_status <> 6) then
      dmcon.ads517FASSET_TYPE_PTR.Value:=  frmPick_Item_Single.adsPick.Fieldbyname('FASSET_TYPE_PTR').AsInteger;

  end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure TfrmDetail_Edti.Edit1DblClick(Sender: TObject);
begin
  if (vEnterMode=em_Edit) and (dmcon.ads517faccu_depr_gl_ptr.Value>0) then
   begin
      with dmcon.qryTmp do
       begin
         Close;
         sql.Text:='update data0417 '+
                 'set  active_flag=3,id_code='''' '+
                 'where rkey='+dmcon.ads517faccu_depr_gl_ptr.AsString+' and data0417.active_flag=4';
         ExecSQL;
       end;   

    dmcon.ads517.Edit;
    dmcon.ads517faccu_depr_gl_ptr.AsVariant:=null;
    Edit1.Text:='';
    label29.Caption:='';
    BitBtn1.Enabled:=true;
   end;
end;

end.
