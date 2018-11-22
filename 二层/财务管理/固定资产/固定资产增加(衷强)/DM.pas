unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB,variants,Math,mask,Dialogs,StrUtils;

type
  Tdmcon = class(TDataModule)
    ADOConnection1: TADOConnection;
    adsAssetList: TADODataSet;
    dsAssetList: TDataSource;
    ads517: TADODataSet;
    ds517: TDataSource;
    qryAssetType: TADOQuery;
    qryAssetAddType: TADOQuery;
    qryAssetStatus: TADOQuery;
    ads325: TADODataSet;
    ads326: TADODataSet;
    ds325: TDataSource;
    ds326: TDataSource;
    ads325rkey: TAutoIncField;
    ads325fasset_ptr: TIntegerField;
    ads325curr_ptr: TIntegerField;
    ads325d327_ptr: TIntegerField;
    ads325ex_rate: TFloatField;
    ads325orig_curr_orig_value: TBCDField;
    aqCurrency: TADOQuery;
    ads325Curr_Value: TFloatField;
    aqDepartment: TADOQuery;
    aqAcctItem: TADOQuery;
    ads517RKEY: TAutoIncField;
    ads517FASSET_CODE: TStringField;
    ads517FASSET_NAME: TStringField;
    ads517FASSET_DESC: TStringField;
    ads517FASSET_TYPE_PTR: TSmallintField;
    ads517DEPT_PTR: TIntegerField;
    ads517ALT_TYPE_PTR: TSmallintField;
    ads517STATUS_PTR: TSmallintField;
    ads517ORIGINAL_VALUE: TFloatField;
    ads517SUMMED_DEPRE: TFloatField;
    ads517NET_VALUE: TFloatField;
    ads517LOCATION: TStringField;
    ads517SURPLUS_RATE: TFloatField;
    ads517SURPLUS: TFloatField;
    ads517DEPRE_MTHD_PTR: TSmallintField;
    ads517EXPECTED_LIFE_MONTHS: TFloatField;
    ads517DEPRED_MONTHS: TFloatField;
    ads517LOADING_UNIT: TStringField;
    ads517MONTH_DEPRE_RATE: TFloatField;
    ads517MONTH_DEPRE_AMT: TBCDField;
    ads517DEPRE_ACCT_PTR: TIntegerField;
    ads517YEAR_ORGI_VALUE_OPEN: TFloatField;
    ads517YEAR_ORGI_VALUE_INCREASE: TFloatField;
    ads517YEAR_ORGI_VALUE_DECREASE: TFloatField;
    ads517YEAR_DEPRE_SUMMED_OPEN: TFloatField;
    ads517YEAR_DEPRE_SUMMED_INCREASE: TFloatField;
    ads517YEAR_DEPRE_SUMMED_DECREASE: TFloatField;
    ads517REMARK: TStringField;
    ads517active_flag: TBooleanField;
    ads517fasset_gl_ptr: TIntegerField;
    ads517faccu_depr_gl_ptr: TIntegerField;
    ads517depr_rate_method: TWordField;
    ads517voucher_ptr: TIntegerField;
    ads517id_code: TStringField;
    ads517ORIG_SUMMED_DEPRE: TFloatField;
    ads517orig_original_value: TFloatField;
    ads326rkey: TAutoIncField;
    ads326fasset_ptr: TIntegerField;
    ads326dept_ptr: TIntegerField;
    ads326FACCU_DEPT_GL_PTR: TIntegerField;
    ads326d327_ptr: TIntegerField;
    ads326PERCENTS: TFloatField;
    ads326AcctItemNo: TStringField;
    ads326AcctItemName: TStringField;
    qryTmp: TADOQuery;
    ads326Dept_Name: TStringField;
    ads517AcctItemNo: TStringField;
    ads517AcctItemName: TStringField;
    ads325Curr_Name: TStringField;
    ads04: TADODataSet;
    ads517FixItemNo: TStringField;
    ads517FixItemName: TStringField;
    qryTmp2: TADOQuery;
    ads517BOOK_DATE: TDateTimeField;
    ads517USER_DATE: TDateTimeField;
    ads517warehouse_ptr: TIntegerField;
    tmp: TADOQuery;
    ads517VOUCHER: TStringField;
    ads517supplier_name: TStringField;
    ads517orig_BOOK_DATE: TDateTimeField;
    aqDepartmentrKey: TAutoIncField;
    aqDepartmentDept_Code: TStringField;
    aqDepartmentDept_Name: TStringField;
    aqDepartmentdept_costname: TStringField;
    ads326dept_code: TStringField;
    ads326dept_costname: TStringField;
    procedure ads325curr_ptrChange(Sender: TField);
    procedure ads325CalcFields(DataSet: TDataSet);
    procedure ads325AfterPost(DataSet: TDataSet);
    procedure ads517DEPRE_MTHD_PTRGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ads517DEPRE_MTHD_PTRSetText(Sender: TField;
      const Text: String);
    procedure ads517NewRecord(DataSet: TDataSet);
    procedure ads517AfterScroll(DataSet: TDataSet);
    procedure ads517AfterOpen(DataSet: TDataSet);
    procedure ads517FASSET_TYPE_PTRGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ads517FASSET_TYPE_PTRSetText(Sender: TField;
      const Text: String);
    procedure ads517ALT_TYPE_PTRGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ads517ALT_TYPE_PTRSetText(Sender: TField;
      const Text: String);
    procedure ads517STATUS_PTRGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ads517STATUS_PTRSetText(Sender: TField; const Text: String);
    procedure ads326CalcFields(DataSet: TDataSet);
    procedure ds517StateChange(Sender: TObject);
    procedure ads325BeforeEdit(DataSet: TDataSet);
    procedure ads517CalcFields(DataSet: TDataSet);
    procedure ads517FASSET_TYPE_PTRChange(Sender: TField);
    procedure ads517EXPECTED_LIFE_MONTHSChange(Sender: TField);
    procedure ads517MONTH_DEPRE_RATEChange(Sender: TField);
    procedure ads517SURPLUS_RATEChange(Sender: TField);
    procedure ads517ORIGINAL_VALUEChange(Sender: TField);
    procedure ads517SUMMED_DEPREChange(Sender: TField);
    procedure ads517DEPRED_MONTHSChange(Sender: TField);
    procedure ads517MONTH_DEPRE_AMTChange(Sender: TField);
    procedure ads517DEPRED_MONTHSValidate(Sender: TField);
    procedure ads517SURPLUS_RATEValidate(Sender: TField);
    procedure ads517EXPECTED_LIFE_MONTHSValidate(Sender: TField);
    procedure ads517BeforePost(DataSet: TDataSet);
    procedure adsAssetListBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    function Calc_Month_Depr_Rate(iType:byte;Remain_Rate:double;Qty_Month:double):double;//计算月折旧率
    function Calc_Month_Depr_Qty(Qty_Total,Month_Depr_Rate:double):double;//计算月折旧额
  public
    { Public declarations }
    rkey417 : Integer;
    F_status : Integer;
    ads517FASSET_TYPE_PTR_oldV:integer;
    function SaveData(Enter_Mode:byte):boolean;
    function Delete_Asset(rKey:integer):boolean;//删除固定资产
    function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  dmcon: Tdmcon;

implementation
uses common,MyClass,Detail_Edti,ConstVar;
{$R *.dfm}

procedure Tdmcon.ads325curr_ptrChange(Sender: TField);
begin
  if sender.IsNull then exit;
  if aqCurrency.Locate('rKey',ads325.FieldbyName('curr_ptr').AsInteger,[]) then
//  if ads325.FieldByName('curr_ptr').AsInteger <> aqCurrency.FieldByName('rKey').AsInteger then exit;
  ads325.FieldByName('Ex_Rate').Value := aqCurrency.FieldByName('Exch_Rate').Value;
end;

procedure Tdmcon.ads325CalcFields(DataSet: TDataSet);
begin
  if aqCurrency.Locate('rKey',DataSet.FieldbyName('curr_ptr').AsInteger,[]) then
    DataSet.FieldByName('Curr_Name').Value := aqCurrency.FieldByName('Curr_Name').AsString;
  DataSet.FieldByName('Curr_Value').Value := DataSet.fieldByName('Ex_Rate').AsFloat * DataSet.fieldByName('orig_curr_orig_value').AsFloat;
end;

procedure Tdmcon.ads325AfterPost(DataSet: TDataSet);
var
  tmpValue:Double;
begin
  tmpValue:=Get_Field_Total_Value(DataSet,'Curr_Value');
  ads517.Edit;
  ads517.FieldByName('ORIGINAL_VALUE').Value := tmpValue;
  ads517.FieldByName('orig_original_value').Value := tmpValue;
end;

procedure Tdmcon.ads517DEPRE_MTHD_PTRGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case sender.AsInteger of
   0 : text := '不计提折旧';
   1 : text := '平均年限法';
   2 : text := '工作量法';
   3 : text := '双倍余额递减法';
   4 : text := '年数总和法';
  end;
end;

procedure Tdmcon.ads517DEPRE_MTHD_PTRSetText(Sender: TField;
  const Text: String);
begin
  if text = '不计提折旧' then
    sender.Value := 0
  else if text = '平均年限法' then
    sender.Value := 1
  else if text = '工作量法' then
    sender.Value := 2
  else if text = '双倍余额递减法' then
    sender.Value := 3
  else if text = '年数总和法' then
    sender.Value := 4;
end;

procedure Tdmcon.ads517NewRecord(DataSet: TDataSet);
begin
  ads04.Close;
  ads04.Open;
  if ads04.FieldByName('Seed_Flag').AsInteger <> 1 then
    DataSet.FieldByName('FASSET_CODE').Value := ads04.fieldbyName('Seed_Value').AsString;
  DataSet.FieldByName('DEPRED_MONTHS').Value := 0;
  DataSet.FieldByName('DEPRE_MTHD_PTR').Value := 1;
end;

procedure Tdmcon.ads517AfterScroll(DataSet: TDataSet);
begin
  MyDataClass.OpenDataSetByPara(DataSet.fieldByName('rKey').AsInteger,ads325);
  MyDataClass.OpenDataSetByPara(DataSet.fieldByName('rKey').AsInteger,ads326);
end;

procedure Tdmcon.ads517AfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
    MyDataClass.OpenDataSetByPara(NULL,ads325);
    MyDataClass.OpenDataSetByPara(NULL,ads326);
  end;
end;

procedure Tdmcon.ads517FASSET_TYPE_PTRGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.IsNull then text :=''
  else
  begin
    if qryAssetType.Locate('rKey',ads517.FieldByName('FASSET_TYPE_PTR').AsInteger,[]) then
      text := trim(qryAssetType.FieldByName('Fasset_Type').Asstring)
    else
      text :='';
  end;
end;

procedure Tdmcon.ads517FASSET_TYPE_PTRSetText(Sender: TField;
  const Text: String);
begin
  if text = '' then
    sender.value := NULL
  else
  begin
    if not qryAssetType.Locate('Fasset_Type',text,[]) then
      sender.value := NULL
    else
      Sender.Value :=  qryAssetType.FieldByName('rKey').value;
  end;
end;

procedure Tdmcon.ads517ALT_TYPE_PTRGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.IsNull then text :=''
  else
  begin
    if qryAssetAddType.Locate('rKey',ads517.FieldByName('ALT_TYPE_PTR').AsInteger,[]) then
      text := trim(qryAssetAddType.FieldByName('Fasset_Alt_Type').Asstring)
    else
      text :='';
  end;
end;

procedure Tdmcon.ads517ALT_TYPE_PTRSetText(Sender: TField;
  const Text: String);
begin
  if text = '' then
    sender.value := NULL
  else
  begin
    if not qryAssetAddType.Locate('Fasset_Alt_Type',text,[]) then
      sender.value := NULL
    else
      Sender.Value :=  qryAssetAddType.FieldByName('rkey').value
  end;
end;

procedure Tdmcon.ads517STATUS_PTRGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if sender.IsNull then text :=''
  else
  begin
    if qryAssetStatus.Locate('rKey',ads517.FieldByName('STATUS_PTR').AsInteger,[]) then
      text := trim(qryAssetStatus.FieldByName('FAsset_Status').Asstring)
    else
      text :='';
  end;
end;

procedure Tdmcon.ads517STATUS_PTRSetText(Sender: TField;
  const Text: String);
begin
  if text = '' then
    sender.value := NULL
  else
  begin
    if not qryAssetStatus.Locate('FAsset_Status',text,[]) then
      sender.value := NULL
    else
      Sender.Value :=  qryAssetStatus.FieldByName('rkey').value
  end;
end;

procedure Tdmcon.ads326CalcFields(DataSet: TDataSet);
begin
  if aqDepartment.Locate('rKey',DataSet.fieldbyName('Dept_ptr').AsInteger,[]) then
   begin
    DataSet.FieldByName('Dept_Name').AsString := aqDepartment.fieldByName('Dept_Name').AsString;
    ads326dept_code.Value:= Self.aqDepartmentDept_Code.Value;
    ads326dept_costname.Value:=self.aqDepartmentdept_costname.Value;
   end;
  if not aqAcctItem.Locate('rKey',DataSet.fieldbyName('FACCU_DEPT_GL_PTR').AsInteger,[]) then exit;
    DataSet.FieldByName('AcctItemNo').AsString := aqAcctItem.FieldByname('GL_ACC_NUMber').AsString;

  if trim(aqAcctItem.FieldByname('GL_DESCRIPTION').AsString) <> '' then
    DataSet.FieldByName('AcctItemName').AsString := aqAcctItem.FieldByname('GL_DESCRIPTION').AsString+'-'+
                                                    aqAcctItem.FieldByname('description_2').AsString
  else
    DataSet.FieldByName('AcctItemName').AsString := aqAcctItem.FieldByname('description_2').AsString
end;

procedure Tdmcon.ds517StateChange(Sender: TObject);
begin
  if frmDetail_Edti = nil then exit;
  frmDetail_Edti.btnSave.Enabled := ads517.State in dsEditModes;
end;

function Tdmcon.SaveData(Enter_Mode:byte): boolean;
var
  rKey:integer;
  Seed_Tmp,Seed_Tmp2:string;
begin
  result:=false;
  while not result do
  begin
   if Enter_Mode = em_Add then //处理资产卡号
    begin
      ads04.Close;
      ads04.Open;
      if ads04.FieldByName('Seed_Flag').AsInteger <> 1 then //需要处理卡号
       begin
        if uppercase(trim(ads517.FieldByName('FASSET_CODE').Asstring)) <> uppercase(trim(ads04.fieldbyName('Seed_Value').AsString)) then
        begin
          Seed_Tmp:= ads04.fieldbyName('Seed_Value').AsString;
         // if not Msg_Dlg_Ask('卡号已经发生了变化,使用新卡号并保存吗?','提示',1) then exit;
          ads517.Edit;
          ads517.FieldByName('FASSET_CODE').Value := Seed_Tmp;
        end
        else
          Seed_Tmp:= trim(ads517.FieldByName('FASSET_CODE').Asstring);
       end;                                         //得到最新的卡片编号

      qryAssetType.Close;
      qryAssetType.Open;
      if qryAssetType.Locate('rKey',ads517.FieldByName('FASSET_TYPE_PTR').AsInteger,[]) then
       begin
        if uppercase(trim(ads517.FieldByName('id_code').Asstring)) <> uppercase(trim(qryAssetType.fieldbyName('preChar1').AsString)) then
        begin
          Seed_Tmp2:= qryAssetType.fieldbyName('preChar1').AsString;
         // if not Msg_Dlg_Ask('固定资产编号已经发生了变化,自动使用新编号并保存吗?','提示',1) then exit;
          //ads517.FieldByName('id_code').Value := Seed_Tmp2;
        end
        else
          Seed_Tmp2:= trim(ads517.FieldByName('id_code').Asstring);
       end;                       //得到最新的资产编号
    end;

    ads517.Edit;
    ads517.FieldByName('ORIG_SUMMED_DEPRE').Value := ads517.FieldByName('SUMMED_DEPRE').value;
    ads517.Post;
    try
      ADOConnection1.BeginTrans;
      ads517.UpdateBatch(arAll);
      rKey:= ads517.FieldByName('rKey').AsInteger;
      MyDataClass.UpdateValueToField(ads325,rKey,'Fasset_ptr');
      ads325.UpdateBatch(arall);
      MyDataClass.UpdateValueToField(ads326,rKey,'Fasset_ptr');
      ads326.UpdateBatch(arall);
      if (Enter_Mode = em_Add) and (ads04.FieldByName('Seed_Flag').AsInteger <> 1) then //处理资产卡号
       begin
        if not Update_Seed(27,Seed_Tmp) then       //更新04初始值
        begin
          ShowMsg('update Seed error',1);
          abort;
        end;
       end;
      if (Enter_Mode = em_Add) then         //更新data0514固定资产类别初始值
       begin
         
        if not Update_Asset_ID_Code(ads517.FieldByName('FASSET_TYPE_PTR').AsInteger,Seed_Tmp2) then
        begin
          ShowMsg('update Asset ID error',1);
          abort;
        end;
       end;
                                //2008.08.07 YYY
      if (Enter_Mode = em_Edit) and (dmcon.ads517FASSET_TYPE_PTR_oldV<>dmcon.ads517FASSET_TYPE_PTR.Value) then
      begin
        qryAssetType.Close;
        qryAssetType.Open;
        if qryAssetType.Locate('rKey',ads517.FieldByName('FASSET_TYPE_PTR').AsInteger,[]) then
        Update_Asset_ID_Code(ads517.FieldByName('FASSET_TYPE_PTR').AsInteger,qryAssetType.fieldbyName('preChar1').AsString);
      end ;

      if dmcon.ads517faccu_depr_gl_ptr.Value>0 then   //增加对417的更新//设备编码外键  2017-3-3
       with Tmp do
       begin
         Close;
         sql.Text:='update data0417 set id_code='''','+
                 'active_flag=3 from data0417  '+
                 'where data0417.rkey='+inttostr(rKey417);

         ExecSQL;
       end;

      if dmcon.ads517faccu_depr_gl_ptr.Value>0 then   //增加对417的更新//设备编码外键
       with qryTmp do
       begin
         Close;
         sql.Text:='update data0417 set id_code=data0517.FASSET_CODE,'+
                 'active_flag=4 from data0417 inner join data0517 on '+
                 'data0417.rkey=data0517.faccu_depr_gl_ptr '+
                 'where data0517.rkey='+inttostr(rKey)+' and data0417.active_flag=3';
         ExecSQL;
       end;

      ADOConnection1.CommitTrans;
      MyDataclass.OpenDataSetByPara(rKey,dmcon.ads517);
      result := true;
    except
      on E: Exception do
       begin
        ADOConnection1.RollbackTrans;
        result := True;
        ads517.edit;
        ShowMsg(E.Message, 1);
        Abort;
       end;
    end;

  end;
end;

procedure Tdmcon.ads325BeforeEdit(DataSet: TDataSet);
begin
  ads517.Edit;
end;

procedure Tdmcon.ads517CalcFields(DataSet: TDataSet);
begin
  if aqAcctItem.Locate('rKey',DataSet.fieldbyName('DEPRE_ACCT_PTR').AsInteger,[]) then
  begin                             //累计折旧科目
    DataSet.FieldByName('AcctItemNo').AsString := aqAcctItem.FieldByname('GL_ACC_NUMber').AsString;
    DataSet.FieldByName('AcctItemName').AsString := aqAcctItem.FieldByname('description_2').AsString;
  end;
  if aqAcctItem.Locate('rKey',DataSet.fieldbyName('fasset_gl_ptr').AsInteger,[]) then
  begin                           //固定资产科目
    DataSet.FieldByName('FixItemNo').AsString := aqAcctItem.FieldByname('GL_ACC_NUMber').AsString;
    DataSet.FieldByName('FixItemName').AsString := aqAcctItem.FieldByname('description_2').AsString;
  end

end;

procedure Tdmcon.ads517FASSET_TYPE_PTRChange(Sender: TField);
begin
  if qryAssetType.Locate('rKey',ads517.FieldByName('FASSET_TYPE_PTR').AsInteger,[]) then
  begin
    ads517.FieldByName('SURPLUS_RATE').Value :=  qryAssetType.FieldByName('Expected_surplus_rate').ASFloat;
    ads517.FieldByName('EXPECTED_LIFE_MONTHS').Value :=  qryAssetType.FieldByName('Expected_life').ASFloat;
    ads517.FieldByName('id_code').Value :=  qryAssetType.FieldByName('preChar1').Asstring;
  end;
end;

function Tdmcon.Calc_Month_Depr_Rate(iType: byte;
  Remain_Rate: double; Qty_Month: double): double;
begin
//月折旧率 ＝ （1－净残值率） / 预计使用月份
  if Qty_Month >0 then
    result := common.ExRoundTo((100-remain_Rate)/Qty_Month,4)
  else
    result :=0;
end;

function Tdmcon.Calc_Month_Depr_Qty(Qty_Total,
  Month_Depr_Rate: double): double;
begin
//	月折旧额 ＝ 月折旧率 × 固定资产原值
  result := Qty_Total*Month_Depr_Rate/100;
end;

procedure Tdmcon.ads517EXPECTED_LIFE_MONTHSChange(Sender: TField);
begin
  if Sender.IsNull then exit;
  ads517.FieldByName('MONTH_DEPRE_RATE').ASFloat :=     //月折旧率
    Calc_Month_Depr_Rate(1,ads517.FieldByName('SURPLUS_RATE').ASFloat,ads517.FieldByName('EXPECTED_LIFE_MONTHS').ASFloat);
end;

procedure Tdmcon.ads517MONTH_DEPRE_RATEChange(Sender: TField);
begin
  if Sender.IsNull or (ads517.fieldByName('EXPECTED_LIFE_MONTHS').AsFloat=0) then exit;                      //原值*（1-残值率)/预计折旧月份  jacky zhong 2016-4-20
  ads517.FieldByName('MONTH_DEPRE_AMT').ASFloat := RoundTo(ads517.fieldByName('ORIGINAL_VALUE').AsFloat*(1-ads517.fieldByName('SURPLUS_RATE').AsFloat/100)/ads517.fieldByName('EXPECTED_LIFE_MONTHS').AsFloat,-2);
//  ads517.FieldByName('MONTH_DEPRE_AMT').ASFloat := Calc_Month_Depr_Qty(ads517.fieldByName('ORIGINAL_VALUE').AsFloat,ads517.fieldByName('MONTH_DEPRE_RATE').AsFloat);
end;

procedure Tdmcon.ads517SURPLUS_RATEChange(Sender: TField);
begin
  ads517EXPECTED_LIFE_MONTHSChange(Sender);
  ads517.FieldByName('SURPLUS').Value := ads517.fieldByName('ORIGINAL_VALUE').AsFloat*ads517.fieldByName('SURPLUS_RATE').AsFloat/100;
end;

procedure Tdmcon.ads517ORIGINAL_VALUEChange(Sender: TField);
begin
  ads517MONTH_DEPRE_RATEChange(sender);
  ads517SURPLUS_RATEChange(Sender);
  ads517SUMMED_DEPREChange(sender);
end;

procedure Tdmcon.ads517SUMMED_DEPREChange(Sender: TField);
begin
  ads517.FieldByName('NET_VALUE').AsFloat := ads517.FieldByName('ORIGINAL_VALUE').AsFloat - ads517.FieldByName('SUMMED_DEPRE').AsFloat;
end;

procedure Tdmcon.ads517DEPRED_MONTHSChange(Sender: TField);
begin
  //Jacky Zhong 2016-04-20
  if ads517.fieldByName('EXPECTED_LIFE_MONTHS').AsFloat =0 then
    ads517.FieldByName('SUMMED_DEPRE').AsFloat := 0
  else
    ads517.FieldByName('SUMMED_DEPRE').AsFloat := RoundTo(ads517.FieldByName('DEPRED_MONTHS').AsFloat*(ads517.fieldByName('ORIGINAL_VALUE').AsFloat*(1-ads517.fieldByName('SURPLUS_RATE').AsFloat/100)/ads517.fieldByName('EXPECTED_LIFE_MONTHS').AsFloat),-2);
//  * ads517.FieldByName('MONTH_DEPRE_AMT').AsFloat;
end;

procedure Tdmcon.ads517MONTH_DEPRE_AMTChange(Sender: TField);
begin
//  ads517DEPRED_MONTHSChange(sender);
end;

procedure Tdmcon.ads517DEPRED_MONTHSValidate(Sender: TField);
begin
  if Sender.IsNull then exit;
  if ads517.FieldByName('EXPECTED_LIFE_MONTHS').AsFloat = 0 then exit;
  if sender.ASFloat > ads517.FieldByName('EXPECTED_LIFE_MONTHS').AsFloat then
  begin
    ShowMsg('当前已计提月份必须小于等于预计计提月份',1);
    abort;
  end                           
  else if sender.ASFloat <0 then
  begin
    ShowMsg('当前已计提月份不能小于零',1);
    abort;
  end;
end;

procedure Tdmcon.ads517SURPLUS_RATEValidate(Sender: TField);
begin
  if (Sender.ASFloat <0) or (Sender.ASFloat >100) then
  begin
    ShowMsg('预计净残值率必须在0~100范围内',1);
    abort;
  end;
end;

procedure Tdmcon.ads517EXPECTED_LIFE_MONTHSValidate(Sender: TField);
begin
  if sender.IsNull then exit;
  if ads517.FieldByName('EXPECTED_LIFE_MONTHS').ASFloat <=0 then
  begin
    ShowMsg('预计计提月份必须大于零',1);
    abort;
  end
  else if ads517.FieldByName('EXPECTED_LIFE_MONTHS').ASFloat <= ads517.FieldByName('DEPRED_MONTHS').ASFloat then
  begin
    ShowMsg('预计计提月份必须大于已计提月份',1);
    abort;
  end
end;

function Tdmcon.Delete_Asset(rKey: integer): boolean;
var
  sqlstr:string;
begin
  sqlstr:=' SELECT top 1 Data0528.D0517_ptr, data0327.fasset_ptr'+#13 +
          ' FROM Data0517 LEFT OUTER JOIN'+#13 +
          ' data0327 ON Data0517.RKEY = data0327.fasset_ptr LEFT OUTER JOIN'+#13 +
          ' Data0528 ON Data0517.RKEY = Data0528.D0517_ptr'+#13 +
          ' WHERE (Data0517.rkey ='+dmcon.adsAssetList.fieldByName('rKey').AsString+')';
  MyDataClass.OpenQuery(dmcon.qryTmp,sqlstr);
 if (dmcon.qryTmp.FieldByName('D0517_ptr').AsVariant<>null) or
    (dmcon.qryTmp.FieldByName('fasset_ptr').AsVariant<>null) or
    (dmcon.adsAssetList.FieldByName('active_flag').Asboolean=false) then
 begin
   ShowMsg('固定资产已经计提折旧,或是不存在,不能删除',1);
   result := false;
   exit;
 end
 else
 begin
   sqlstr:=' delete from data0326 where fasset_ptr='+IntToStr(rKey)+#13+
           ' delete from data0325 where fasset_ptr='+IntToStr(rKey)+#13+
           ' delete from data0517 where rkey='+IntToStr(rKey);
   if not MyDataClass.ExecSql(sqlstr,true) then
   begin
     ShowMsg('删除固定资产失败,请检查',1);
     result := false;
     exit
   end
   else
     result := true;
 end;
end;



procedure Tdmcon.ads517BeforePost(DataSet: TDataSet);
var
  tmpQty:double;
begin
    if trim(ads517.FieldByName('FASSET_CODE').AsString)='' then
    begin
      ShowMsg('资产ID号不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('FASSET_NAME').AsString)='' then
    begin
      ShowMsg('资产名称不能为空!',1);
      abort;
    end;
    if ads517.FieldByName('FASSET_TYPE_PTR').IsNull then
    begin
      ShowMsg('无效的资产类别!',1);
      abort;
    end;
    if trim(ads517.FieldByName('id_code').AsString)='' then
    begin
      ShowMsg('无效的资产编号!',1);
      abort;
    end;
    if ads517.FieldByName('ALT_TYPE_PTR').IsNull then
    begin
      ShowMsg('无效的增加方式!',1);
      abort;
    end;
    if ads517.FieldByName('STATUS_PTR').IsNull then
    begin
      ShowMsg('无效的使用状况!',1);
      abort;
    end;
    if trim(ads517.FieldByName('LOCATION').AsString)='' then
    begin
      ShowMsg('存放位置不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('ORIGINAL_VALUE').AsString)='' then
    begin
      ShowMsg('原值不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('EXPECTED_LIFE_MONTHS').AsString)='' then
    begin
      ShowMsg('预计使用月份不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('DEPRED_MONTHS').AsString)='' then
    begin
      ShowMsg('当前已使用月份不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('SURPLUS_RATE').AsString)='' then
    begin
      ShowMsg('预计净残值率不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('SURPLUS').AsString)='' then
    begin
      ShowMsg('净残值不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('MONTH_DEPRE_RATE').AsString)='' then
    begin
      ShowMsg('月折旧率不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('MONTH_DEPRE_AMT').AsString)='' then
    begin
      ShowMsg('月折旧额不能为空!',1);
      abort;
    end;
    if trim(ads517.FieldByName('DEPRE_ACCT_PTR').AsString)='' then
    begin
      ShowMsg('累计折旧科目不能为空!',1);
      abort;
    end;
    if ads326.IsEmpty then
    begin
      ShowMsg('折旧部门不能为空!',1);
      abort;
    end;
    tmpQty:=Get_Field_Total_Value(dmcon.ads326,'PERCENTS');
    if tmpQty<>100 then
    begin
      ShowMsg('折旧部门百分比分摊必须等于100%,请确认!',1);
      abort;
    end;
    
    if F_status <> 6 then
      if (not Check_Acct_Depr_Date(dmcon.ads517.fieldByName('BOOK_DATE').AsDatetime))  then
      begin
        abort;
      end;
end;

procedure Tdmcon.adsAssetListBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

function Tdmcon.GetNo(edt: TMaskEdit; ikey: string; tp: integer): boolean;
var i,iL:integer;
    s,sL:string;
    B:boolean;
    table_name:string;
begin
  result:=false;
  tmp.Close;
  tmp.SQL.Text:='select SEED_VALUE,seed_flag,table_name  from data0004  where rkey ='+ikey;
  tmp.Open;
  if tmp.IsEmpty or (tmp.Fields[1].AsInteger=1) then exit;

  s:=trim(tmp.Fields[0].AsString);
  table_name:=trim(tmp.Fields[2].AsString);
  if tmp.Fields[1].AsInteger=2 then        //固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL:=length(s);
    for i:=iL downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
    edt.editmask:=copy(s,1,i)+'!'+copy('9999999999',i+1,iL-i)+';1;_';
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=s
    else begin
      tmp.Close;
      tmp.SQL.Text:='select top 1 number from '+table_name+' where number='''+edt.Text+'''';
      tmp.Open;
      if not tmp.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      tmp.Close;
      tmp.SQL.Text:='select top 1 number from '+table_name+' order by number desc';
      tmp.Open;
      if tmp.IsEmpty or (tmp.Fields[0].AsString<=edt.Text) then
      begin
        tmp.Close;
        tmp.SQL.Text:='update data0004 set SEED_VALUE='''+copy(edt.Text,1,i)+rightstr('00000'+inttostr(strtoint(rightstr(edt.Text,length(edt.Text)-i))+1),length(edt.Text)-i)+
                         '''  where rkey='+ikey;
        tmp.ExecSQL;
      end;

    end;
  end else if tmp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=tmp.Fields[0].AsString
    else begin
      tmp.Close;
      tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
      if tmp.ExecSQL=0  then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end;
    end;
  end else if tmp.Fields[1].AsInteger=4 then begin  //只能系统产生
    edt.ReadOnly:=true;
    if tp=0 then
      edt.Text:=tmp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;

      B:=true;
      while B do
      begin
        tmp.Close;
        tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                         'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
        if tmp.ExecSQL=0 then
        begin
          tmp.Close;
          tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey ='+ikey;
          tmp.Open;
          edt.Text:=tmp.Fields[0].AsString;
        end else
          B:=false;
      end;
    end;
  end ;
  result:=true;

end;

end.
