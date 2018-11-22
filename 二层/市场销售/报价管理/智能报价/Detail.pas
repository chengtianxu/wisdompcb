unit Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls, ADODB, Grids,//syntax,
  DBGridEh, Menus, Provider, DBClient, ComCtrls;

type
  TfrmDetail = class(TForm)
    pnlAll: TPanel;
    pnlTop: TPanel;
    pnlTop_1: TPanel;
    pnlClient: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    pnlTools: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label5000: TLabel;
    DBEdit5: TDBEdit;
    btnLookCust: TBitBtn;
    GroupBox1: TGroupBox;
    DBEdit10: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    eh168: TDBGridEh;
    ehRFQParam: TDBGridEh;
    pnlDtl: TPanel;
    pnlDtlItem: TPanel;
    gbDtl: TGroupBox;
    btnAddPrice: TSpeedButton;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    edtStdEngAmount: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    Label30: TLabel;
    DBEdit30: TDBEdit;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    Label33: TLabel;
    DBEdit33: TDBEdit;
    pmOp: TPopupMenu;
    nNew: TMenuItem;
    pmSaveItem: TPopupMenu;
    N4: TMenuItem;
    DBComboBox1: TDBComboBox;
    N5: TMenuItem;
    sbtnNotes: TSpeedButton;
    Label5: TLabel;
    edtFilter: TEdit;
    ds166: TDataSource;
    ds169: TDataSource;
    ads165: TADODataSet;
    ads165rkey: TAutoIncField;
    ads165rfqno: TStringField;
    ads165rkey25: TIntegerField;
    ads165rkey167: TIntegerField;
    ads167: TADODataSet;
    ds167: TDataSource;
    ads167RKEY: TAutoIncField;
    ads167Status: TWordField;
    ads167Cust_Id: TStringField;
    ads167Cust_Name: TStringField;
    ads167Cust_Addr: TStringField;
    ads167SalesMan: TStringField;
    ads167Contact: TStringField;
    ads167Tel: TStringField;
    ads167Fax: TStringField;
    ads167Mail: TStringField;
    ads167ContractAmt: TBCDField;
    ads167CURR_CODE: TStringField;
    ads167Position: TStringField;
    ads167Notes: TStringField;
    ads167CreateId: TIntegerField;
    ads167CreateDate: TDateTimeField;
    ads167LastModifyId: TIntegerField;
    ads167LastModifyDate: TDateTimeField;
    ads167AuditId: TIntegerField;
    ads167AuditDate: TDateTimeField;
    ads167ColorTag: TWordField;
    ads168: TADODataSet;
    ds168: TDataSource;
    pgc1: TPageControl;
    eh169: TDBGridEh;
    ads168RKEY: TAutoIncField;
    ads168Flag: TWordField;
    ads168RKEY165: TIntegerField;
    ads168RFQNo: TStringField;
    ads168FileName: TStringField;
    ads168PartsId: TStringField;
    ads168BoardThick: TStringField;
    ads168Layers: TWordField;
    ads168SetSize: TStringField;
    ads168Qnty: TIntegerField;
    ads168UPS: TStringField;
    ads168Price: TBCDField;
    ads168EngAmount: TBCDField;
    ads168FLAmount: TBCDField;
    ads168TestAmount: TBCDField;
    ads168MakeAmount: TBCDField;
    ads168OtherAmount: TBCDField;
    ads168TotalAmount: TBCDField;
    ads168AftDiscountAmount: TBCDField;
    ads168Area: TBCDField;
    ads168DueDate: TDateTimeField;
    ads168File_Number: TStringField;
    ads168POType: TWordField;
    ads168LAM2: TStringField;
    ads168SurfaceDeal: TStringField;
    ads168WCCPTH: TStringField;
    ads168NCCPTH: TStringField;
    ads168Version: TStringField;
    ads168TZFL: TStringField;
    ads168StandardPrice: TBCDField;
    ads168XS_Add: TBCDField;
    ads168Price_Add: TBCDField;
    ads168AfterPrice: TBCDField;
    ads168StdEngAmount: TBCDField;
    ads168StdEngPrice: TBCDField;
    ads168StdArea: TBCDField;
    ads168GoldFingerAmount: TBCDField;
    ads168UrgentAmount: TBCDField;
    ads168Add_Percent: TBCDField;
    ads168Add_TotalAmount: TBCDField;
    ads168Discount: TBCDField;
    ads168UrgentDays: TWordField;
    ads168DueDays: TWordField;
    ads168Notes: TStringField;
    ads168rkey25: TIntegerField;
    ads168manu_part_number: TStringField;
    ads168manu_part_desc: TStringField;
    btnCalc: TSpeedButton;
    nCopyNow: TMenuItem;
    nCOpyHis: TMenuItem;
    ndelete: TMenuItem;
    edtMujufei: TDBEdit;
    lbl1: TLabel;
    btnCalcAll: TSpeedButton;
    ads167rkey10: TIntegerField;
    btn1: TBitBtn;
    ads167ContractNo: TStringField;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtEngAmount: TDBEdit;
    edtEngAmount1: TDBEdit;
    edtEngAmount2: TDBEdit;
    ads168EngAddPrecent: TBCDField;
    ads168EngAddValue: TBCDField;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure nNewClick(Sender: TObject);
    procedure sbtnCalcClick(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure btnLookCustClick(Sender: TObject);
    procedure sbtnNotesClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnAddPriceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ads168AfterScroll(DataSet: TDataSet);
    procedure ads168SetSizeChange(Sender: TField);
    procedure nCopyNowClick(Sender: TObject);
    procedure nCOpyHisClick(Sender: TObject);
    procedure pmOpPopup(Sender: TObject);
    procedure ndeleteClick(Sender: TObject);
    procedure btnCalcAllClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    procedure CalcBasePrice(AEdt: TDBEdit;ABaseType: Integer; BHasRate: Boolean = False);
    procedure CalcFinalyPrice;
    procedure CalcAutoPrice;
    procedure DS166AfterScroll(DataSet: TDataSet);
  public
    { Public declarations }
    F166List: TList;
    F169List: TList;
    procedure Add166(ARkey165: string;ARkey25: string = '');
    procedure Add169(ARkey165: string);
    procedure Add166SpecValue(LDS: TADODataSet;ARkey25: string);
    procedure Update167_04(v_seed: string);  //更新合同号
    procedure Update165_04(v_seed: string);  //更新合同号
    function Get167No: string;
    function GetRFQNO: string;
  end;
  
implementation

uses damo, common, Math, FindRFQ, FindCust, Pick_Item_Single, ConstVar,
  Calc;

{$R *.dfm}

procedure TfrmDetail.btnSaveClick(Sender: TObject);
begin
  if DBEdit4.Text = '' then
  begin
    ShowMessage('请选择客户');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmDetail.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmDetail.nNewClick(Sender: TObject);
var
  LInPut: PDlgInput;
  LFrm: TfrmPick_Item_Single;
  LSql: string;
begin
  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm.ADOConn;
  LInPut.Sqlstr := 'select rkey,manu_part_number,manu_part_desc from data0025 where manu_part_number like ' + QuotedStr('%' + edtFilter.Text + '%');
  LInPut.Fields := 'manu_part_number/本厂编号/200,manu_part_desc/客户型号/200';
  LFrm.InitForm_New(LInPut);
  try
    if LFrm.ShowModal = mrok then
    begin
      ads165.Append;
      ads165.FieldByName('rkey25').AsInteger := LFrm.adsPick1.fieldbyname('rkey').AsInteger;
      ads165.FieldByName('RFQNo').AsString := GetRFQNO;
      ads165.Post;

      ads168.Append;
      ads168.FieldByName('rkey25').AsInteger := ads165.FieldByName('rkey25').AsInteger;
      ads168.FieldByName('RfqNo').AsString := ads165.FieldByName('RFQNo').AsString;
      ads168.Post;

      LSql := 'SELECT (set_lngth* set_width / set_qty /100 /100 /100) as pcsare FROM data0025 where RKEY = ' + ads165.FieldByName('rkey25').AsString;
      if dm.SqlOpen(LSql) then
      begin
        ads168.Edit;
        ads168.FieldByName('setsize').AsString := FormatFloat('0.00000000',dm.qrytmp.fieldbyname('pcsare').AsFloat);
        ads168.Post;
      end;

      Add166('-1',ads165.FieldByName('rkey25').AsString);

      Add169('-1');
    end;
  finally
    LFrm.Free;
  end;
end;


procedure TfrmDetail.sbtnCalcClick(Sender: TObject);
begin
  CalcAutoPrice;
  CalcFinalyPrice;
end;

procedure TfrmDetail.Update167_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed,new_begin,old_begin:string;
  LSql: string;
begin
  LSql := 'select CONTROL_NO_LENGTH,SEED_VALUE,SEED_FLAG,Convert(varchar(8),getdate(),112) as StrDate from data0004 where SEED_MEAN =''合同评审编号''';
  old_begin:= Copy(v_seed,1,8);
  v_seed:= Copy(v_seed,9,Length(v_seed)-8);  //去掉前面的日期
  dm.OpenQuery(dm.aqTmp,[],LSql);
  new_begin:= dm.aqTmp.FieldByName('StrDate').Value;
  v_length := length(v_seed);

  if old_begin <> new_begin then
  begin
    for i:= v_length-1 downto 1 do
    begin
      new_seed:= new_seed + '0';
    end;
    new_seed:= new_begin + new_seed + '1';    //如果日期不同,流水号则重新开始
    dm.aqTmp.Edit;
    dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
    dm.aqTmp.Post;
  end
  else
  begin
    for i := v_length downto 1 do
    if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
    begin
      v_last:= floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
      new_seed:= new_begin + copy(v_seed,1,i) + copy(v_last,i+1,v_length-i);
      dm.aqTmp.Edit; //使前缀不变后缀加1
      dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
      dm.aqTmp.Post;
      break;
    end
    else
    if i=1 then //如果第一位仍然是数字
    begin
      v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
      new_seed := new_begin + copy(v_last,2,v_length);
      dm.aqTmp.Edit;
      dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
      dm.aqTmp.Post;
    end;
  end;
end;

procedure TfrmDetail.DBComboBox1DropDown(Sender: TObject);
begin
  dm.OpenQuery(dm.aqTmp,[],'Select CURR_CODE+'''+'_'+'''+CURR_NAME As CURR From Data0001');
  dm.aqTmp.First;
  DBComboBox1.Items.Clear;
  while not dm.aqTmp.Eof do
  begin
    DBComboBox1.Items.Add(dm.aqTmp.FieldByName('CURR').Value);
    dm.aqTmp.Next;
  end;
end;

procedure TfrmDetail.btnLookCustClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmFindCust, frmFindCust);
    dm.OpenQuery(dm.aqFindCust,[]);
    with frmFindCust do
    begin
      rdgCondition.Visible:= True;
      Label1.Caption:= '客户名称';
      DBGridEh1.Visible:= True;
      DBGridEh1.Align:= alClient;
      DBGridEh2.Visible:= False;
      if ShowModal = mrok then
      begin
        DBEdit4.Text:= dm.aqFindCust.FieldByName('CUST_CODE').AsString;
        DBEdit5.Text:= dm.aqFindCust.FieldByName('SALES_REP_NAME').AsString;
        DBEdit6.Text:= dm.aqFindCust.FieldByName('CUSTOMER_NAME').AsString;
        DBEdit7.Text:= dm.aqFindCust.FieldByName('BILLING_ADDRESS_1').AsString;
        DBEdit8.Text:= dm.aqFindCust.FieldByName('CONTACT_NAME_1').AsString;
        DBEdit9.Text:= dm.aqFindCust.FieldByName('CONT_PHONE_1').AsString;
        DBEdit10.Text:= dm.aqFindCust.FieldByName('FAX').AsString;
        if not (ads167.State in [dsInsert, dsEdit]) then ads167.Edit;
        ads167.FieldByName('CURR_CODE').Value:= dm.aqFindCust.FieldByName('CURR_CODE').Value;
      end;
    end;
  finally
    frmFindCust.Free;
  end;
end;

procedure TfrmDetail.sbtnNotesClick(Sender: TObject);
begin
  MessageDlg('*1. 绿色字体部分为手动输入,黑色字体部分为系统计算'+#13+
   '*2. Flag未勾选的不计算'+#13+
   '*3. RFQ资料中订单类型为新单的才计工程费,复投单与复投变更单不计工程费'+#13+#13+

   'a.  制板费 = 价格(Set)*成品数量'+#13+
   'a1. 价格(Set)=加成后单价*面积(set)'+#13+
   'a2. 加成后单价= 标准单价*(1+系数加成)+单价加成'+#13+#13+

   'b.  工程费 = 标准工程费+标准加成单价*超出面积'+#13+
   'b1. 超出面积=面积 - 加成面积界限'+#13+#13+

   'c.  其他费用 = 合同总值金额加成+合同总值比例加成'+#13+#13+

   'd.  折扣前总金额 = 制板费+工程费+菲林费+测试费+其他费用+金手指费+加急费'+#13+
   'd1. 折扣后总金额 = 折扣前总金额 - 折扣金额'+#13+#13+
   
   '*   以上金额均为(含税)',    mtInformation, [mbOK], 0);
end;

procedure TfrmDetail.btnPrintClick(Sender: TObject);
begin
  //frmContract.UseReport(dm.aqMainRKEY.Value, 1);
end;

procedure TfrmDetail.btnAddPriceClick(Sender: TObject);
var
  lCalc: TCalc;
  LValueStr,LAddStr,LValueStrTotal,LValueStrEng: string;
  LNum: Integer;
  
  LCurrRate: Single;
  LSql: string;
begin
  LSql := 'select BASE_TO_OTHER from data0001 where curr_code = ' + QuotedStr(ads167.fieldbyname('curr_code').AsString);
  dm.SqlOpen(LSql);
  if not dm.qrytmp.IsEmpty then
    LCurrRate := dm.qrytmp.fieldbyname('BASE_TO_OTHER').AsFloat
  else
    LCurrRate := 1;

  if ads168.IsEmpty then Exit;
  LNum := ads168.FieldByName('qnty').AsInteger;
  if LNum <= 0 then
  begin
    ShowMessage('请填写成品数量');
    Exit;
  end;

  while not eh169.DataSource.DataSet.IsEmpty do
    eh169.DataSource.DataSet.Delete;
    
  lCalc := TCalc.Create(dm.ADOConn);
  try
    //加价项添加和计算
    dm.adsLookUp164.First;
    while not dm.adsLookUp164.Eof do
    begin
      LAddStr := dm.adsLookUp164.fieldbyname('VisableStr').AsString;
      LValueStr := dm.adsLookUp164.fieldbyname('ValueStr').AsString;
      LValueStrTotal := dm.adsLookUp164.fieldbyname('TotalValueStr').AsString;
      LValueStrEng := dm.adsLookUp164.fieldbyname('EngValueStr').AsString;
      if StrToIntDef(lCalc.CalcStr(LAddStr,LNum,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString,IntToStr(ads167.fieldbyname('rkey10').asinteger)),-1) > 0 then
      begin
        with TADODataSet(eh169.DataSource.DataSet) do
        begin
          Append;
          fieldbyname('rkey164').AsInteger := dm.adsLookUp164.fieldbyname('rkey').AsInteger;
          fieldbyname('rkey165').AsInteger := ads168.fieldbyname('rkey165').AsInteger;
          if FieldByName('addtype').AsInteger = 0 then
            FieldByName('param_value').AsString := lCalc.CalcStr(LValueStr,LNum,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString,IntToStr(ads167.fieldbyname('rkey10').asinteger))
          else
            FieldByName('param_value').AsFloat := StrToFloat(lCalc.CalcStr(LValueStr,LNum,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString,IntToStr(ads167.fieldbyname('rkey10').asinteger))) / LCurrRate;

          if FieldByName('AddTypeEng').AsInteger = 0 then
            FieldByName('AddValueEng').AsString := lCalc.CalcStr(LValueStrEng,LNum,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString,IntToStr(ads167.fieldbyname('rkey10').asinteger))
          else
            FieldByName('AddValueEng').AsFloat := StrToFloat(lCalc.CalcStr(LValueStrEng,LNum,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString,IntToStr(ads167.fieldbyname('rkey10').asinteger))) / LCurrRate;

          if FieldByName('AddTypeTotal').AsInteger = 0 then
            FieldByName('AddValueTotal').AsString := lCalc.CalcStr(LValueStrTotal,LNum,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString,IntToStr(ads167.fieldbyname('rkey10').asinteger))
          else
            FieldByName('AddValueTotal').AsFloat := StrToFloat(lCalc.CalcStr(LValueStrTotal,LNum,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString,IntToStr(ads167.fieldbyname('rkey10').asinteger))) / LCurrRate;           

          Post;
        end;      
      end;
      dm.adsLookUp164.Next;
    end;
  finally
    lCalc.Free;
  end;
end;

function TfrmDetail.GetRFQNO: string;
var
  i,v_length:integer;
  v_last,new_seed:string;
  LSql: string;
  v_seed: string;
begin
  LSql := 'select CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG from data0004 where SEED_MEAN = ''RFQ编号''';
  dm.SqlOpen(LSql);
  v_seed := dm.qrytmp.fieldbyname('SEED_VALUE').AsString;


  v_length := length(v_seed);
  for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
  begin
    v_last:= floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+ ads165.RecordCount ); //后缀加1
    new_seed:= copy(v_seed,1,i) + copy(v_last,i+1,v_length-i);
    break;
  end
  else
  if i=1 then //如果第一位仍然是数字
  begin
    v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+ads165.RecordCount);
    new_seed := copy(v_last,2,v_length);
  end;
  Result := new_seed;
end;

procedure TfrmDetail.FormCreate(Sender: TObject);
begin
  F166List := TList.Create;
  F169List := TList.Create;
end;

procedure TfrmDetail.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to F166List.Count - 1 do
  begin
    TADODataSet(F166List.Items[I]).Close;
    while TADODataSet(F166List.Items[I]).Fields.Count > 0 do
      TADODataSet(F166List.Items[I]).Fields.Remove(TADODataSet(F166List.Items[I]).Fields[0]);
    TADODataSet(F166List.Items[I]).Free;
  end;
  for I := 0 to F169List.Count - 1 do
  begin
    TADODataSet(F169List.Items[I]).Close;
    while TADODataSet(F169List.Items[I]).Fields.Count > 0 do
      TADODataSet(F169List.Items[I]).Fields.Remove(TADODataSet(F169List.Items[I]).Fields[0]);
    TADODataSet(F169List.Items[I]).Free;
  end;
end;

procedure TfrmDetail.Add169(ARkey165: string);
var
  LDS: TADODataSet;
  LField: TField;
  LSql: string;
begin
  LDS := TADODataSet.Create(Self);
  try
    LDS.Connection := dm.ADOConn;
    LDS.LockType := ltBatchOptimistic;
    LDS.CursorType := ctStatic;
    LSql := 'SELECT * from data0169 where rkey165 = ' + ARkey165;
    LDS.CommandText := LSql;

    LField := TIntegerField.Create(LDS);
    LField.FieldName := 'rkey165';
    LField.FieldKind := fkData;
    LField.DataSet := LDS;
    lds.Fields.Add(LField);

    LField := TIntegerField.Create(LDS);
    LField.FieldKind := fkData;
    LField.FieldName := 'rkey164';
    LField.DataSet := LDS;
    lds.Fields.Add(LField);

    LField := TStringField.Create(LDS);
    LField.FieldKind := fkData;
    LField.FieldName := 'Param_Value';
    LField.DataSet := LDS;
    lds.Fields.Add(LField);

    LField := TStringField.Create(LDS);
    LField.FieldKind := fkData;
    LField.FieldName := 'AddValueTotal';
    LField.DataSet := LDS;
    lds.Fields.Add(LField);

    LField := TStringField.Create(LDS);
    LField.FieldKind := fkData;
    LField.FieldName := 'AddValueEng';
    LField.DataSet := LDS;
    lds.Fields.Add(LField);        

    LField := TStringField.Create(LDS);
    LField.FieldKind := fkLookup;
    LField.FieldName := 'code';
    LField.KeyFields := 'rkey164';
    lfield.LookupDataSet := dm.adsLookUp164;
    LField.LookupKeyFields := 'rkey';
    LField.LookupResultField := 'code';
    LField.DataSet := LDS;
    LDS.Fields.Add(LField);

    LField := TIntegerField.Create(LDS);
    LField.FieldKind := fkLookup;
    LField.FieldName := 'addtype';
    LField.KeyFields := 'rkey164';
    lfield.LookupDataSet := dm.adsLookUp164;
    LField.LookupKeyFields := 'rkey';
    LField.LookupResultField := 'addtype';
    LField.DataSet := LDS;
    LDS.Fields.Add(LField);

    LField := TIntegerField.Create(LDS);
    LField.FieldKind := fkLookup;
    LField.FieldName := 'AddTypeTotal';
    LField.KeyFields := 'rkey164';
    lfield.LookupDataSet := dm.adsLookUp164;
    LField.LookupKeyFields := 'rkey';
    LField.LookupResultField := 'AddTypeTotal';
    LField.DataSet := LDS;
    LDS.Fields.Add(LField);

    LField := TIntegerField.Create(LDS);
    LField.FieldKind := fkLookup;
    LField.FieldName := 'AddTypeEng';
    LField.KeyFields := 'rkey164';
    lfield.LookupDataSet := dm.adsLookUp164;
    LField.LookupKeyFields := 'rkey';
    LField.LookupResultField := 'AddTypeEng';
    LField.DataSet := LDS;
    LDS.Fields.Add(LField);    

    LDS.Open;

    ds169.DataSet := LDS;
  finally
    F169List.Add(LDS);
  end;

end;

procedure TfrmDetail.ads168AfterScroll(DataSet: TDataSet);
begin
  if not ads168.IsEmpty and (ads168.RecNo > 0) then
  begin
    ds166.DataSet := TADODataSet(F166List.Items[ads168.RecNo-1]);
    ds169.DataSet := TADODataSet(F169List.Items[ads168.RecNo-1]);
  end;
end;

procedure TfrmDetail.CalcBasePrice(AEdt: TDBEdit;ABaseType: Integer; BHasRate: Boolean = False);
var
  LSql: string;
  LCalc: TCalc;
  LStr: string;
  LValue: string;
  LCurrRate: Single;
begin
  LSql := 'select BASE_TO_OTHER from data0001 where curr_code = ' + QuotedStr(ads167.fieldbyname('curr_code').AsString);
  dm.SqlOpen(LSql);
  if not dm.qrytmp.IsEmpty then
    LCurrRate := dm.qrytmp.fieldbyname('BASE_TO_OTHER').AsFloat
  else
    LCurrRate := 1;

  if not BHasRate then LCurrRate := 1;

  LCalc := TCalc.Create(dm.ADOConn);
  try
    LSql := 'select ValueStr from data0316 where spec_key = ' + IntToStr(ABaseType);
    if dm.SqlOpen(LSql) then
    begin
      if dm.qrytmp.IsEmpty then Exit;
      LStr := dm.qrytmp.fieldbyname('valuestr').AsString;
      LValue := LCalc.CalcStr(LStr,ads168.fieldbyname('Qnty').AsInteger,TADODataSet(ehRFQParam.DataSource.DataSet),ads168.fieldbyname('rkey25').AsString, IntToStr(ads167.fieldbyname('rkey10').asinteger));
      AEdt.DataSource.DataSet.Edit;
      if LValue = '' then
        AEdt.Field.AsInteger := 0
      else
        AEdt.Field.Value := StrToFloat(LValue) / LCurrRate;
      AEdt.DataSource.DataSet.Post;
    end;
  finally
    LCalc.Free;
  end;
end;

procedure TfrmDetail.Add166(ARkey165: string;ARkey25: string = '');
var
  LSql: string;
  LDS: TADODataSet;
  LField: TField;
begin
  LDS := TADODataSet.Create(Self);
  try
    LDS.Connection := dm.ADOConn;
    LDS.LockType := ltBatchOptimistic;
    LDS.CursorType := ctStatic;
    LSql := 'select * from data0166 where rkey165 = ' + ARkey165;
    LDS.CommandText := LSql;

    LField := TIntegerField.Create(LDS);
    LField.FieldName := 'rkey165';
    LField.FieldKind := fkData;
    LField.DataSet := LDS;
    lds.Fields.Add(LField);

    LField := TIntegerField.Create(LDS);
    LField.FieldKind := fkData;
    LField.FieldName := 'Param_ptr';
    LField.DataSet := LDS;
    lds.Fields.Add(LField);

    LField := TStringField.Create(LDS);
    LField.FieldKind := fkData;
    LField.FieldName := 'Param_Value';
    LField.DataSet := LDS;
    lds.Fields.Add(LField);

    LField := TStringField.Create(LDS);
    LField.FieldKind := fkLookup;
    LField.FieldName := 'PARAMETER_NAME';
    LField.KeyFields := 'Param_ptr';
    lfield.LookupDataSet := dm.aqParamName;
    LField.LookupKeyFields := 'rkey';
    LField.LookupResultField := 'PARAMETER_NAME';
    LField.DataSet := LDS;
    LDS.Fields.Add(LField);

    LField := TStringField.Create(LDS);
    LField.FieldKind := fkLookup;
    LField.FieldName := 'PARAMETER_DESC';
    LField.KeyFields := 'Param_ptr';
    lfield.LookupDataSet := dm.aqParamName;
    LField.LookupKeyFields := 'rkey';
    LField.LookupResultField := 'PARAMETER_DESC';
    LField.DataSet := LDS;
    LDS.Fields.Add(LField);   

    LDS.AfterScroll := DS166AfterScroll;

    LDS.Open;

    if ARkey25 <> '' then
    begin
      //查看工序
      LSql := ' SELECT Data0278.RKEY,Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,data0279.PARAMETER_VALUE FROM Data0279 ' +
              ' inner JOIN Data0278 ON Data0278.RKEY = Data0279.PARAMETER_PTR ' +
              ' WHERE Data0279.SOURCE_PTR = ' + ARkey25 + ' AND (Data0278.RFQMiParam = 1 or  Data0278.RFQMustParam = 1)';
      dm.SqlOpen(LSql);
      while not dm.qrytmp.Eof do
      begin
        LDS.Append;
        LDS.FieldByName('param_ptr').AsInteger := dm.qrytmp.fieldbyname('rkey').AsInteger;
        LDS.FieldByName('rkey165').AsInteger := ads165.fieldbyname('rkey').AsInteger;
        LDS.fieldbyname('Param_Value').AsString := dm.qrytmp.fieldbyname('PARAMETER_VALUE').AsString;
        LDS.Post;
        dm.qrytmp.Next;
      end;

      //查看全局
      LSql := ' SELECT Data0278.RKEY,Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,d494.PARAMETER_VALUE FROM data0494 d494 ' +
              ' inner JOIN Data0278 ON Data0278.RKEY = d494.PARAMETER_PTR ' +
              ' WHERE d494.custpart_ptr = ' + ARkey25 + ' AND (Data0278.RFQMiParam = 1 or  Data0278.RFQMustParam = 1)';
      dm.SqlOpen(LSql);
      while not dm.qrytmp.Eof do
      begin
        if not LDS.Locate('param_ptr',dm.qrytmp.fieldbyname('rkey').AsInteger,[]) then
        begin
          LDS.Append;
          LDS.FieldByName('param_ptr').AsInteger := dm.qrytmp.fieldbyname('rkey').AsInteger;
          LDS.FieldByName('rkey165').AsInteger := ads165.fieldbyname('rkey').AsInteger;
          LDS.fieldbyname('Param_Value').AsString := dm.qrytmp.fieldbyname('PARAMETER_VALUE').AsString;
          LDS.Post;
        end;
        dm.qrytmp.Next;
      end;

      //必填项
      LSql := ' SELECT Data0278.RKEY,Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,0 FROM Data0278 ' +
              ' WHERE Data0278.RFQMustParam = 1 ';
      dm.SqlOpen(LSql);
      while not dm.qrytmp.Eof do
      begin
        if not LDS.Locate('param_ptr',dm.qrytmp.fieldbyname('rkey').AsInteger,[]) then
        begin
          LDS.Append;
          LDS.FieldByName('param_ptr').AsInteger := dm.qrytmp.fieldbyname('rkey').AsInteger;
          LDS.FieldByName('rkey165').AsInteger := ads165.fieldbyname('rkey').AsInteger;
          //LDS.fieldbyname('Param_Value').AsString := dm.qrytmp.fieldbyname('PARAMETER_VALUE').AsString;
          LDS.Post;
        end;
        dm.qrytmp.Next;
      end;

      //特殊赋值
      Add166SpecValue(LDS,ARkey25);
    end;
    
    ds166.DataSet := LDS;
  finally
    F166List.Add(LDS);
  end;
end;

procedure TfrmDetail.DS166AfterScroll(DataSet: TDataSet);
var
  LDS: TADODataSet;
begin
  LDS := TADODataSet.Create(Self);
  try
    LDS.Connection := dm.ADOConn;
    LDS.CommandText := 'select TVALUE from data0338 where parameter_ptr = ' + IntToStr(DataSet.fieldbyname('param_ptr').AsInteger);
    LDS.Open;
    ehRFQParam.FieldColumns['Param_Value'].PickList.Clear;
    while not LDS.Eof do
    begin
      ehRFQParam.FieldColumns['Param_Value'].PickList.Add(LDS.FieldByName('TVALUE').AsString);
      LDS.Next;
    end;    
  finally
    LDS.Free;
  end;
end;

procedure TfrmDetail.ads168SetSizeChange(Sender: TField);
begin
  ads168.FieldByName('Area').AsString := FormatFloat('0.00000000',(ads168.FieldByName('qnty').AsInteger * ads168.FieldByName('setsize').AsFloat));
  
end;

procedure TfrmDetail.CalcFinalyPrice;
var
  LDS: TADODataSet;
  L1PrecentAdd,LTotalPrecentAdd,L1NumAdd,L2TotalValueAdd,LEngPrecentAdd,LEngValueAdd: Single;
begin
  L1PrecentAdd := 0;
  L1NumAdd := 0;
  LTotalPrecentAdd := 0;
  L2TotalValueAdd := 0;
  LEngPrecentAdd := 0;
  LEngValueAdd := 0;
  //加成类型(0:制板费单价比例加成; 1:制板费单价金额加成; 2:合同总值比例加成; 3:合同总值金额加成)
  LDS := TADODataSet(eh169.DataSource.DataSet);
  LDS.DisableControls;
  LDS.First;
  while not LDS.Eof do
  begin
    case LDS.FieldByName('addtype').AsInteger of
      0: L1PrecentAdd := L1PrecentAdd + LDS.fieldbyname('param_value').AsFloat;
      1: L1NumAdd := L1NumAdd + LDS.fieldbyname('param_value').AsFloat;
    end;
    case LDS.FieldByName('AddTypeTotal').AsInteger of
      0: LTotalPrecentAdd := LTotalPrecentAdd + LDS.fieldbyname('AddValueTotal').AsFloat;
      1: L2TotalValueAdd := L2TotalValueAdd + LDS.fieldbyname('AddValueTotal').AsFloat;
    end;
    case LDS.FieldByName('AddTypeEng').AsInteger of
      0: LEngPrecentAdd := LEngPrecentAdd + LDS.fieldbyname('AddValueEng').AsFloat;
      1: LEngValueAdd := LEngValueAdd + LDS.fieldbyname('AddValueEng').AsFloat;
    end;        
    LDS.Next;
  end;
  LDS.EnableControls;

  //制版费单价加成汇率




  //加成
  ads168.Edit;
  ads168.FieldByName('XS_Add').AsFloat := L1PrecentAdd;
  ads168.FieldByName('Price_Add').AsFloat := L1NumAdd;
  ads168.FieldByName('Add_Percent').AsFloat := LTotalPrecentAdd;
  ads168.FieldByName('Add_TotalAmount').AsFloat := L2TotalValueAdd;
  ads168.FieldByName('EngAddPrecent').AsFloat := LEngPrecentAdd;
  ads168.FieldByName('EngAddValue').AsFloat := LEngValueAdd;
  ads168.Post;

  
  //制版费
  ads168.Edit;
  ads168.FieldByName('AfterPrice').AsFloat := ads168.fieldbyname('StandardPrice').AsFloat *
    (1+ads168.fieldbyname('XS_Add').AsFloat) + ads168.fieldbyname('Price_Add').AsFloat;
  ads168.FieldByName('Price').AsFloat := ads168.fieldbyname('AfterPrice').AsFloat * ads168.fieldbyname('setsize').AsFloat;
  ads168.FieldByName('MakeAmount').AsFloat := ads168.fieldbyname('Price').AsFloat * ads168.fieldbyname('qnty').AsFloat;
  ads168.Post;

  //工程费
  ads168.Edit;
  ads168.FieldByName('EngAmount').AsFloat := ads168.fieldbyname('StdEngAmount').AsFloat *
    (1 + ads168.FieldByName('EngAddPrecent').AsFloat) + ads168.FieldByName('EngAddValue').AsFloat;
  ads168.Post;

  //总金额
  ads168.Edit;
  ads168.FieldByName('AftDiscountAmount').AsFloat :=(
    ads168.fieldbyname('MakeAmount').AsFloat + //制版费
    ads168.fieldbyname('EngAmount').AsFloat + //工程费
    ads168.fieldbyname('TestAmount').AsFloat + //测试费
    ads168.fieldbyname('UrgentAmount').AsFloat + //加急费
    ads168.fieldbyname('OtherAmount').AsFloat ) * //模具费
    (1+ads168.fieldbyname('Add_Percent').AsFloat) +  //总比例加成
    ads168.fieldbyname('Add_TotalAmount').AsFloat - //总金额加成
    ads168.fieldbyname('Discount').AsFloat; //折扣金额
  ads168.Post;

end;

function TfrmDetail.Get167No: string;
var
  LSql: string;
begin
  LSql := 'select CONTROL_NO_LENGTH,SEED_VALUE,SEED_FLAG,Convert(varchar(8),getdate(),112) as StrDate from data0004 where SEED_MEAN =''合同评审编号''';
  dm.OpenQuery(dm.aqTmp,[],LSql);
  //如合同号中的日期与实际日期不同,流水号从1开始
  if Copy(dm.aqTmp.FieldByName('SEED_VALUE').Value,1,8)<>dm.aqTmp.FieldByName('StrDate').Value then
    Update167_04(dm.aqTmp.FieldByName('SEED_VALUE').Value);

  Result := dm.aqTmp.FieldByName('SEED_VALUE').Value;
end;

procedure TfrmDetail.Update165_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
  LSql: string;
begin
  LSql := 'select CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG from data0004 where SEED_MEAN = ''RFQ编号''';
  dm.OpenQuery(dm.aqTmp,[],LSql);
  v_length := length(v_seed);
  for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
  begin
    v_last:= floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed:= copy(v_seed,1,i) + copy(v_last,i+1,v_length-i);
    dm.aqTmp.Edit; //使前缀不变后缀加1
    dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
    dm.aqTmp.Post;
    break;
  end
  else
  if i=1 then //如果第一位仍然是数字
  begin
    v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
    new_seed := copy(v_last,2,v_length);
    dm.aqTmp.Edit;
    dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
    dm.aqTmp.Post;
  end;
end;

procedure TfrmDetail.nCopyNowClick(Sender: TObject);
var
  LS: TStringList;
  I: Integer;
  LOldDS166,LOldDS169: TADODataSet;
  LNewDS166,LNEwDS169: TADODataSet;
begin
  LS := TStringList.Create;
  try
    ads165.Locate('RFQNO',ads168.fieldbyname('RFQNO').AsString,[]);
    LOldDS166 := TADODataSet(ehRFQParam.DataSource.DataSet);
    LOldDS169 := TADODataSet(eh169.DataSource.DataSet);
    //165
    for I := 0 to ads165.FieldCount - 1 do
    begin
      LS.Add(ads165.Fields[I].AsString);
    end;
    ads165.Append;
    for I := 0 to LS.Count - 1 do
    begin
      if  (upperCase(ads165.Fields[I].FieldName) <> 'RKEY') and
          (upperCase(ads165.Fields[I].FieldName) <> 'RFQNO')
      then
        ads165.Fields[I].AsString := LS[I];
    end;
    ads165.FieldByName('Rfqno').AsString := GetRFQNO;
    ads165.Post;

    //168
    LS.Clear;
    for I := 0 to ads168.FieldCount - 1 do
    begin
      LS.Add(ads168.Fields[I].AsString);
    end;
    ads168.Append;
    ads168.FieldByName('rkey25').AsInteger := ads165.FieldByName('rkey25').AsInteger;
    ads168.FieldByName('rkey165').AsInteger := ads165.RecordCount;
    ads168.FieldByName('RfqNo').AsString := ads165.FieldByName('RFQNo').AsString;     
    for I := 0 to LS.Count - 1 do
    begin
      if  (upperCase(ads168.Fields[I].FieldName) <> 'RKEY') and
          (upperCase(ads168.Fields[I].FieldName) <> 'RFQNO') and
          (upperCase(ads168.Fields[I].FieldName) <> 'RKEY25') and
          (upperCase(ads168.Fields[I].FieldName) <> 'RKEY165')
      then
      begin
        if LS[I] <> '' then
          ads168.Fields[I].Value := LS[I];
      end;
    end;
    ads168.Post;

    Add166('-1');
    Add169('-1');

    LNewDS166 := TADODataSet(F166List.Items[F166List.Count - 1]);
    LNEwDS169 := TADODataSet(F169List.Items[F169List.Count - 1]);

    if not LOldDS166.IsEmpty then
    begin
      LNewDS166.First;
      LOldDS166.First;
      while not LOldDS166.Eof do
      begin
        LNewDS166.Append;
        LNewDS166.FieldByName('param_ptr').AsInteger := LOldDS166.fieldbyname('param_ptr').AsInteger;
        LNewDS166.FieldByName('RKey165').AsInteger := ads165.RecordCount;
        for I := 0 to LNewDS166.FieldCount - 1 do
        begin
          if (UpperCase(LNewDS166.Fields[I].FieldName) <> 'RKEY165') and
             (UpperCase(LNewDS166.Fields[I].FieldName) <> 'PARAM_PTR') and
             (UpperCase(LNewDS166.Fields[I].FieldName) <> 'RKEY')
          then
            LNewDS166.Fields[I].Value := LOldDS166.Fields[I].Value;
        end;
        LOldDS166.Next;            
      end;
      LNewDS166.Post;
    end;

    if not LOldDS169.IsEmpty then
    begin
      LNEwDS169.First;
      LOldDS169.First;
      while not LOldDS169.Eof do
      begin
        LNEwDS169.Append;
        LNEwDS169.fieldbyname('Rkey164').AsInteger := LOldDS169.fieldbyname('Rkey164').AsInteger;
        LNewDS169.FieldByName('Rkey165').AsInteger := ads165.RecordCount;
        for I := 0 to LNEwDS169.FieldCount - 1 do
        begin
          if (UpperCase(LNEwDS169.Fields[I].FieldName) <> 'RKEY') and
             (UpperCase(LNEwDS169.Fields[I].FieldName) <> 'RKEY164') and
             (UpperCase(LNEwDS169.Fields[I].FieldName) <> 'RKEY165')
          then
            LNewDS169.Fields[I].Value := LOldDS169.Fields[I].Value;
        end;
        LOldDS169.Next;
      end;
      LNewDS169.Post;    
    end;
    
  finally
    LS.Free;
  end;
//
end;

procedure TfrmDetail.nCOpyHisClick(Sender: TObject);
var
  LInPut: PDlgInput;
  LFrm: TfrmPick_Item_Single;
  LSql: string;
  LRKey165: string;
  I: Integer;
  LField: TField;
  LNewDS166,LNEwDS169: TADODataSet;
begin
  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm.ADOConn;
  LInPut.Sqlstr := 'select d165.rkey,d165.RFQNo,d25.Manu_Part_number from data0165 d165 ' +
                   ' inner join data0025 d25 on d165.rkey25 = d25.rkey ' +
                   ' order by RFQNO asc';
  LInPut.Fields := 'RFQNo/RFQ号/200,Manu_Part_number/本厂编号/200';
  LFrm.InitForm_New(LInPut);
  try
    if LFrm.ShowModal = mrok then
    begin
      LRKey165 := LFrm.adsPick1.fieldbyname('RKey').AsString;

      //165
      LSql := 'select * from data0165 d165 where rkey = ' + LRKey165;
      dm.SqlOpen(LSql);
      if not dm.qrytmp.IsEmpty then
      begin
        ads165.Append;
        ads165.FieldByName('rkey25').AsInteger := dm.qrytmp.fieldbyname('rkey25').AsInteger;
        ads165.FieldByName('RFQNo').AsString := GetRFQNO;
        for I := 0 to dm.qrytmp.FieldCount - 1 do
        begin
          LField := ads165.FindField(dm.qrytmp.Fields[I].FieldName);
          if (LField <> nil) and
             (UpperCase(LField.FieldName) <> 'RKEY') and
             (UpperCase(LField.FieldName) <> 'RFQNO') and
             (UpperCase(LField.FieldName) <> 'RKEY25')
          then
          begin
            if dm.qrytmp.Fields[I].AsString <> '' then
              LField.Value := dm.qrytmp.Fields[I].Value;
          end;
        end;
        ads165.Post;
      end;

      //168
      LSql := 'select * from data0168 d168 where rkey165 = ' + LRKey165;
      dm.SqlOpen(LSql);
      if not dm.qrytmp.IsEmpty then
      begin
        ads168.Append;
        ads168.FieldByName('rkey25').AsInteger := ads165.FieldByName('rkey25').AsInteger;
        ads168.FieldByName('rkey165').AsInteger := ads165.RecordCount;
        ads168.FieldByName('RfqNo').AsString := ads165.FieldByName('RFQNo').AsString;
        for I := 0 to dm.qrytmp.FieldCount - 1 do
        begin
          LField := ads168.FindField(dm.qrytmp.Fields[I].FieldName);
          if (LField <> nil) and
             (UpperCase(LField.FieldName) <> 'RKEY') and
             (UpperCase(LField.FieldName) <> 'RFQNO') and
             (UpperCase(LField.FieldName) <> 'RKEY25') and
             (UpperCase(LField.FieldName) <> 'RKEY165')
          then
          begin
            if dm.qrytmp.Fields[I].AsString <> '' then
              LField.Value := dm.qrytmp.Fields[I].Value;
          end;
        end;
        ads168.Post;
      end;

      Add166('-1');
      Add169('-1');

      LNewDS166 := TADODataSet(ehRFQParam.DataSource.DataSet);
      LNEwDS169 := TADODataSet(eh169.DataSource.DataSet);

      LSql := 'select * from data0166 where rkey165 = ' + LRKey165;
      dm.SqlOpen(LSql);
      dm.qrytmp := dm.qrytmp;
      if not dm.qrytmp.IsEmpty then
      begin
        LNewDS166.First;
        dm.qrytmp.First;
        while not dm.qrytmp.Eof do
        begin
          LNewDS166.Append;
          LNewDS166.FieldByName('param_ptr').AsInteger := dm.qrytmp.fieldbyname('param_ptr').AsInteger;
          LNewDS166.FieldByName('RKey165').AsInteger := ads165.RecordCount;
          for I := 0 to dm.qrytmp.FieldCount - 1 do
          begin
            LField := LNewDS166.FindField(dm.qrytmp.Fields[I].FieldName);
            if (LField <> nil) and
               (UpperCase(LField.FieldName) <> 'RKEY165') and
               (UpperCase(LField.FieldName) <> 'PARAM_PTR') and
               (UpperCase(LField.FieldName) <> 'RKEY')
            then
            begin
              if dm.qrytmp.Fields[I].AsString <> '' then
                LField.Value := dm.qrytmp.Fields[I].Value;
            end;
          end;
          dm.qrytmp.Next;
        end;
        LNewDS166.Post;
      end;

      LSql := 'select * from data0169 where rkey165 = ' + LRKey165;
      dm.SqlOpen(LSql);
      if not dm.qrytmp.IsEmpty then
      begin
        LNEwDS169.First;
        dm.qrytmp.First;
        while not dm.qrytmp.Eof do
        begin
          LNEwDS169.Append;
          LNEwDS169.fieldbyname('Rkey164').AsInteger := dm.qrytmp.fieldbyname('Rkey164').AsInteger;
          LNewDS169.FieldByName('Rkey165').AsInteger := ads165.RecordCount;
          for I := 0 to dm.qrytmp.FieldCount - 1 do
          begin
            LField := LNEwDS169.FindField(dm.qrytmp.Fields[I].FieldName);
            if (LField <> nil) and
               (UpperCase(LField.FieldName) <> 'RKEY') and
               (UpperCase(LField.FieldName) <> 'RKEY164') and
               (UpperCase(LField.FieldName) <> 'RKEY165')
            then
            begin
              if dm.qrytmp.Fields[I].AsString <> '' then
                LField.Value := dm.qrytmp.Fields[I].Value;
            end;
          end;
          dm.qrytmp.Next;
        end;
        LNewDS169.Post;
      end;
    end;



  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail.pmOpPopup(Sender: TObject);
begin
  nCopyNow.Enabled := not ads168.IsEmpty;
  ndelete.Enabled := not ads168.IsEmpty;
end;

procedure TfrmDetail.Add166SpecValue(LDS: TADODataSet;ARKey25: string);
var
  LSql: string;
  LStr,LStr2: string;
begin
  //表面处理
  LSql := ' SELECT d34_2.DEPT_NAME FROM Data0034 d34_1 ' +
          ' INNER JOIN Data0034 d34_2 ON d34_1.RKEY = d34_2.BIG_DEPT_PTR ' +
          ' INNER JOIN Data0038 d38 ON d38.DEPT_PTR = d34_2.RKEY ' +
          ' WHERE d34_1.TTYPE = 5 AND d34_1.DEPT_CODE = ' + QuotedStr('FINISH_') +
          ' and d38.SOURCE_PTR = ' + ARkey25;
  dm.SqlOpen(LSql);
  while not dm.qrytmp.Eof do
  begin
    if LStr = '' then LStr := dm.qrytmp.FieldByName('dept_name').AsString
    else
    begin
      LStr := LStr + '+' + dm.qrytmp.FieldByName('dept_name').AsString;
    end;
    dm.qrytmp.Next;
  end;

  //成型方式
  LSql := ' SELECT d34_2.DEPT_NAME FROM Data0034 d34_1 ' +
          ' INNER JOIN Data0034 d34_2 ON d34_1.RKEY = d34_2.BIG_DEPT_PTR ' +
          ' INNER JOIN Data0038 d38 ON d38.DEPT_PTR = d34_2.RKEY ' +
          ' WHERE d34_1.TTYPE = 5 AND d34_1.DEPT_CODE = ' + QuotedStr('ROUT_') +
          ' and d38.SOURCE_PTR = ' + ARkey25;
  dm.SqlOpen(LSql);
  while not dm.qrytmp.Eof do
  begin
    if LStr2 = '' then LStr2 := dm.qrytmp.FieldByName('dept_name').AsString
    else
    begin
      LStr2 := LStr2 + '+' + dm.qrytmp.FieldByName('dept_name').AsString;
    end;
    dm.qrytmp.Next;
  end;


  //SET_WTH,SET_LEN ,set_qty
  LSql := 'SELECT set_qty,set_lngth ,set_width from data0025 where rkey =' + ARkey25;
  dm.SqlOpen(LSql);

  //循环赋值
  LDS.First;
  while not LDS.Eof do
  begin
    if UpperCase(LDS.FieldByName('PARAMETER_NAME').AsString) = 'SET_WTH' then
    begin
      LDS.Edit;
      LDS.FieldByName('param_value').AsString := dm.qrytmp.fieldbyname('set_width').AsString;
      LDS.Post;
    end else
    if UpperCase(LDS.FieldByName('PARAMETER_NAME').AsString) = 'SET_LEN' then
    begin
      LDS.Edit;
      LDS.FieldByName('param_value').AsString := dm.qrytmp.fieldbyname('set_lngth').AsString;
      LDS.Post;
    end else
    if UpperCase(LDS.FieldByName('PARAMETER_NAME').AsString) = 'SET' then
    begin
      LDS.Edit;
      LDS.FieldByName('param_value').AsString := dm.qrytmp.fieldbyname('set_qty').AsString;
      LDS.Post;
    end else
    if UpperCase(LDS.FieldByName('PARAMETER_NAME').AsString) = '表面处理' then
    begin
      LDS.Edit;
      LDS.FieldByName('param_value').AsString := LStr;
      LDS.Post;
    end else
    if UpperCase(LDS.FieldByName('PARAMETER_NAME').AsString) = '成型方式' then
    begin
      LDS.Edit;
      LDS.FieldByName('param_value').AsString := LStr2;
      LDS.Post;
    end;

    LDS.Next;
  end;
end;


procedure TfrmDetail.ndeleteClick(Sender: TObject);
var
  LDS: TADODataSet;
begin
  if MessageBox(Handle,'删除后不可恢复,确定要删除吗？','提示',MB_YESNO) <> IDYES then
  begin
    Exit;
  end;

  LDS := TADODataSet(ehRFQParam.DataSource.DataSet);
  while not LDS.IsEmpty do
    LDS.Delete;

  LDS := TADODataSet(eh169.DataSource.DataSet);
  while not lds.IsEmpty do
    LDS.Delete;

  LDS := TADODataSet(ehRFQParam.DataSource.DataSet);
  LDS.Close;
  while LDS.Fields.Count > 0 do
    LDS.Fields.Remove(LDS.Fields[0]);
  LDS.Free;
  F166List.Delete(F166List.IndexOf(LDS));

  LDS := TADODataSet(eh169.DataSource.DataSet);
  LDS.Close;
  while LDS.Fields.Count > 0 do
    LDS.Fields.Remove(LDS.Fields[0]);
  LDS.Free;
  F169List.Delete(F169List.IndexOf(LDS));

  ads165.RecNo := ads168.RecNo;
  dm.SqlExec('delete from data0165 where rkey = ' + IntToStr(ads165.fieldbyname('rkey').AsInteger));

  ads168.Delete;
  ads165.Delete;
end;

procedure TfrmDetail.CalcAutoPrice;
begin

  //基价计算
  CalcBasePrice(DBEdit11,0,True);//0标准单价
  CalcBasePrice(edtStdEngAmount,1,True);//标准工程费
  CalcBasePrice(DBEdit29,7);//7加急天数
  CalcBasePrice(DBEdit30,8);//8交货天数
  CalcBasePrice(DBEdit22,2,True);//2测试费
  CalcBasePrice(DBEdit28,9,True);//9折扣金额
  CalcBasePrice(DBEdit25,4,True);//加急费

end;

procedure TfrmDetail.btnCalcAllClick(Sender: TObject);
begin
  CalcFinalyPrice;
end;

procedure TfrmDetail.btn1Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LInPut: PDlgInput;
begin

  LInPut.Sqlstr := 'select employee_name,phone from data0005 ';
  LInPut.AdoConn := dm.ADOConn;
  LInPut.Fields := 'employee_name/姓名/200,phone/联系电话/200';
  LInPut.KeyField := 'employee_name';
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LInPut);
    if LFrm.ShowModal = mrok then
    begin
      ads167.Edit;
      ads167.FieldByName('SalesMan').AsString := LFrm.adsPick1.fieldbyname('employee_name').AsString;
      ads167.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
