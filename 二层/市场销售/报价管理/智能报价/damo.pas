unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, ppEndUsr, ppDB, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppCtrls, jpeg, ppPrnabl, ppBands, ppCache,
  DBClient, ppStrtch, ppSubRpt, StdCtrls, ppMemo, Provider, ppVar;

type
  Tdm = class(TDataModule)
    ADOConn: TADOConnection;
    aqTmp: TADOQuery;
    aqGetDate: TADOQuery;
    aqParamName: TADOQuery;
    aqParamNameRKEY: TAutoIncField;
    aqParamNamePARAMETER_NAME: TStringField;
    aqParamNamePARAMETER_DESC: TStringField;
    aqParamNameUNIT_NAME: TStringField;
    aqParamNameDATA_TYPE: TWordField;
    aqParamNamemin_value: TFloatField;
    aqParamNamemax_value: TFloatField;
    acAddModel: TADOCommand;
    dsFindRFQ: TDataSource;
    aqFindRFQ: TADOQuery;
    aqFindRFQRKEY: TAutoIncField;
    aqFindRFQRFQNo: TStringField;
    aqFindRFQStatus: TWordField;
    aqFindRFQCust_Id: TStringField;
    aqFindRFQCust_Name: TStringField;
    aqFindRFQCust_Addr: TStringField;
    aqFindRFQSalesMan: TStringField;
    aqFindRFQTechContact: TStringField;
    aqFindRFQTel: TStringField;
    aqFindRFQMail: TStringField;
    aqFindRFQFileName: TStringField;
    aqFindRFQFilePath: TStringField;
    aqFindRFQPartsId: TStringField;
    aqFindRFQPOType: TStringField;
    aqFindRFQCreateId: TIntegerField;
    aqFindRFQCreateDate: TDateTimeField;
    aqFindRFQLastModifyId: TIntegerField;
    aqFindRFQLastModifyDate: TDateTimeField;
    aqFindRFQAuditId: TIntegerField;
    aqFindRFQAuditDate: TDateTimeField;
    aqFindRFQTPOType: TStringField;
    dsFindCust: TDataSource;
    aqFindCust: TADOQuery;
    aqFindCustCUST_CODE: TStringField;
    aqFindCustCUSTOMER_NAME: TStringField;
    aqFindCustBILLING_ADDRESS_1: TStringField;
    aqFindCustSALES_REP_NAME: TStringField;
    aqFindCustPHONE: TStringField;
    aqFindCustGEN_EMAIL_ADDRESS: TStringField;
    aqFindCustCURR_CODE: TStringField;
    aqFindCustFAX: TStringField;
    aqParamNameUNIT_CODE: TStringField;
    dsParamName: TDataSource;
    aqFindCustCONTACT_NAME_1: TStringField;
    aqFindCustCONT_PHONE_1: TStringField;
    dsEngStr: TDataSource;
    aqEngStr: TADOQuery;
    aqEngStrBoardType: TWordField;
    aqEngStrLayer: TWordField;
    aqEngStrEngAmount: TBCDField;
    aqEngStrAddEngAmount: TBCDField;
    aqEngStrstdArea: TBCDField;
    acAudit: TADOCommand;
    qrytmp: TADOQuery;
    adsLookup25: TADODataSet;
    adsLookup25rkey: TIntegerField;
    adsLookup25manu_part_number: TStringField;
    adsLookUp164: TADODataSet;
    adsLookUp164RKEY: TAutoIncField;
    adsLookUp164AddType: TWordField;
    adsLookUp164Code: TStringField;
    adsLookUp164VisableStr: TStringField;
    adsLookUp164ValueStr: TStringField;
    adsLookup25manu_part_desc: TStringField;
    dsRpt167: TDataSource;
    prprt1: TppReport;
    pdb167: TppDBPipeline;
    ppDesigner1: TppDesigner;
    adsRpt167: TADODataSet;
    adsRpt167RKEY: TIntegerField;
    strngfldRpt167ContractNo: TStringField;
    adsRpt167Status: TWordField;
    strngfldRpt167Cust_Id: TStringField;
    strngfldRpt167Cust_Name: TStringField;
    strngfldRpt167Cust_Addr: TStringField;
    strngfldRpt167SalesMan: TStringField;
    strngfldRpt167Contact: TStringField;
    strngfldRpt167Tel: TStringField;
    strngfldRpt167Fax: TStringField;
    strngfldRpt167Mail: TStringField;
    adsRpt167ContractAmt: TBCDField;
    strngfldRpt167CURR_CODE: TStringField;
    strngfldRpt167Position: TStringField;
    strngfldRpt167Notes: TStringField;
    adsRpt167CreateId: TIntegerField;
    adsRpt167CreateDate: TDateTimeField;
    adsRpt167LastModifyId: TIntegerField;
    adsRpt167LastModifyDate: TDateTimeField;
    adsRpt167AuditId: TIntegerField;
    adsRpt167AuditDate: TDateTimeField;
    adsRpt167ColorTag: TWordField;
    adsRpt165: TADODataSet;
    dsRpt165: TDataSource;
    adsRpt165RKEY: TAutoIncField;
    strngfldRpt165RFQNo: TStringField;
    adsRpt165rkey167: TIntegerField;
    adsRpt165Status: TWordField;
    strngfldRpt165Cust_Id: TStringField;
    strngfldRpt165Cust_Name: TStringField;
    strngfldRpt165Cust_Addr: TStringField;
    strngfldRpt165SalesMan: TStringField;
    strngfldRpt165TechContact: TStringField;
    strngfldRpt165Tel: TStringField;
    strngfldRpt165Mail: TStringField;
    strngfldRpt165FileName: TStringField;
    strngfldRpt165FilePath: TStringField;
    strngfldRpt165PartsId: TStringField;
    strngfldRpt165POType: TStringField;
    adsRpt165Layers_Info: TMemoField;
    adsRpt165IsUP: TBooleanField;
    adsRpt165CreateId: TIntegerField;
    adsRpt165CreateDate: TDateTimeField;
    adsRpt165LastModifyId: TIntegerField;
    adsRpt165LastModifyDate: TDateTimeField;
    adsRpt165AuditId: TIntegerField;
    adsRpt165AuditDate: TDateTimeField;
    adsRpt165rkey25: TIntegerField;
    pdb165: TppDBPipeline;
    adsRpt166: TADODataSet;
    adsRpt169: TADODataSet;
    dsrpt166: TDataSource;
    dsrpt169: TDataSource;
    pdb166: TppDBPipeline;
    pdb169: TppDBPipeline;
    adsRpt166RKEY: TAutoIncField;
    adsRpt166rkey165: TIntegerField;
    adsRpt166Param_ptr: TIntegerField;
    strngfldRpt166Param_Value: TStringField;
    strngfldRpt166PARAMETER_DESC: TStringField;
    strngfldPrt167CONTACT_NAME_1: TStringField;
    strngfldPrt167PHONE: TStringField;
    strngfldPrt167FAX_1: TStringField;
    adsRpt167nowtime: TDateTimeField;
    strngfldPrt167saleman: TStringField;
    strngfldPrt167salemanphone: TStringField;
    strngfldRpt165RfqPramMemo1: TStringField;
    strngfldRpt165RfqParamMemo2: TStringField;
    cdsRpt166: TClientDataSet;
    dsp1: TDataSetProvider;
    cdsRpt166RKEY: TAutoIncField;
    cdsRpt166rkey165: TIntegerField;
    cdsRpt166Param_ptr: TIntegerField;
    strngfldRpt166Param_Value1: TStringField;
    strngfldRpt166PARAMETER_DESC1: TStringField;
    strngfldRpt166Param_value2: TStringField;
    strngfldRpt166Param_value3: TStringField;
    adsrpt168: TADODataSet;
    dsrpt168: TDataSource;
    pdb168: TppDBPipeline;
    adsrpt168RKEY: TAutoIncField;
    adsrpt168Flag: TWordField;
    adsrpt168RKEY165: TIntegerField;
    adsrpt168Rkey25: TIntegerField;
    strngfldadsrpt168RFQNo: TStringField;
    strngfldadsrpt168FileName: TStringField;
    strngfldadsrpt168PartsId: TStringField;
    strngfldadsrpt168BoardThick: TStringField;
    adsrpt168Layers: TWordField;
    strngfldadsrpt168SetSize: TStringField;
    adsrpt168Qnty: TIntegerField;
    strngfldadsrpt168UPS: TStringField;
    adsrpt168Price: TBCDField;
    adsrpt168EngAmount: TBCDField;
    adsrpt168FLAmount: TBCDField;
    adsrpt168TestAmount: TBCDField;
    adsrpt168MakeAmount: TBCDField;
    adsrpt168OtherAmount: TBCDField;
    adsrpt168TotalAmount: TBCDField;
    adsrpt168AftDiscountAmount: TBCDField;
    adsrpt168Area: TBCDField;
    adsrpt168DueDate: TDateTimeField;
    strngfldadsrpt168File_Number: TStringField;
    adsrpt168POType: TWordField;
    strngfldadsrpt168LAM2: TStringField;
    strngfldadsrpt168SurfaceDeal: TStringField;
    strngfldadsrpt168WCCPTH: TStringField;
    strngfldadsrpt168NCCPTH: TStringField;
    strngfldadsrpt168Version: TStringField;
    strngfldadsrpt168TZFL: TStringField;
    adsrpt168StandardPrice: TBCDField;
    adsrpt168XS_Add: TBCDField;
    adsrpt168Price_Add: TBCDField;
    adsrpt168AfterPrice: TBCDField;
    adsrpt168StdEngAmount: TBCDField;
    adsrpt168StdEngPrice: TBCDField;
    adsrpt168StdArea: TBCDField;
    adsrpt168GoldFingerAmount: TBCDField;
    adsrpt168UrgentAmount: TBCDField;
    adsrpt168Add_Percent: TBCDField;
    adsrpt168Add_TotalAmount: TBCDField;
    adsrpt168Discount: TBCDField;
    adsrpt168UrgentDays: TWordField;
    adsrpt168DueDays: TWordField;
    strngfldadsrpt168Notes: TStringField;
    strngfldRpt166PARAMETER_DESC2: TStringField;
    strngfldRpt166PARAMETER_DESC3: TStringField;
    strngfldRpt166UNIT_CODE: TStringField;
    strngfldRpt166UNIT_CODE1: TStringField;
    strngfldRpt167CONT_PHONE_1: TStringField;
    strngfldRpt167EMAIL_FOR_CONTACT1: TStringField;
    prprt2: TppReport;
    phdrbnd3: TppHeaderBand;
    ppImage3: TppImage;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel37: TppLabel;
    pdbtxtRFQNo1: TppDBText;
    pdbtxtCust_Name2: TppDBText;
    pdbtxtCONTACT_NAME_2: TppDBText;
    pdbtxtCONT_PHONE_2: TppDBText;
    pdbtxtEMAIL_FOR_CONTACT2: TppDBText;
    pdbtxtnowtime1: TppDBText;
    pdbtxtsaleman1: TppDBText;
    pdbtxtsalemanphone1: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    pdtlbnd3: TppDetailBand;
    pdbtxtParam_value3: TppDBText;
    pdbtxtPARAMETER_DESC3: TppDBText;
    pdbtxtParam_Value1: TppDBText;
    pdbtxtPARAMETER_DESC1: TppDBText;
    pftrbnd2: TppFooterBand;
    ppPageStyle2: TppPageStyle;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel41: TppLabel;
    ppShape2: TppShape;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    pdbtxtCURR_CODE1: TppDBText;
    ppLabel64: TppLabel;
    ppShape3: TppShape;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    phdrbnd4: TppHeaderBand;
    pdtlbnd4: TppDetailBand;
    pdbtxtQnty2: TppDBText;
    ppLine35: TppLine;
    pdbtxtArea1: TppDBText;
    pdbtxtEngAmount: TppDBText;
    pdbtxtPrice1: TppDBText;
    pdbtxtMakeAmount1: TppDBText;
    pdbtxtTestAmount1: TppDBText;
    pdbtxtOtherAmount1: TppDBText;
    pdbtxtDueDate1: TppDBText;
    pdbtxtUrgentDays1: TppDBText;
    pdbtxtUrgentAmount1: TppDBText;
    pdbtxtAftDiscountAmount1: TppDBText;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppMemo2: TppMemo;
    ppShape6: TppShape;
    ppLine48: TppLine;
    pdbtxtCust_Name3: TppDBText;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppImage4: TppImage;
    strngfldRpt165Manu_Part_desc: TStringField;
    adslookup10: TADODataSet;
    IntegerField1: TIntegerField;
    strngfldads1cust_code: TStringField;
    adsRpt167EXCH_RATE: TFloatField;
    strngfldRpt167FED_TAX_ID_NO: TStringField;
    strngfldRpt167STATE: TStringField;
    strngfldRpt167LANGUAGE_FLAG: TStringField;
    phdrbnd1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    pdbtxtRFQNo: TppDBText;
    pdbtxtCust_Name: TppDBText;
    pdbtxtCONTACT_NAME_1: TppDBText;
    pdbtxtCONT_PHONE_1: TppDBText;
    pdbtxtEMAIL_FOR_CONTACT1: TppDBText;
    pdbtxtnowtime: TppDBText;
    pdbtxtsaleman: TppDBText;
    pdbtxtsalemanphone: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    pdbtxtManu_Part_desc: TppDBText;
    ppLabel86: TppLabel;
    pdtlbnd1: TppDetailBand;
    psbrprt1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    pdtlbnd2: TppDetailBand;
    pdbtxtPARAMETER_DESC: TppDBText;
    pdbtxtPARAMETER_DESC2: TppDBText;
    pdbtxtParam_Value: TppDBText;
    pdbtxtParam_value2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel36: TppLabel;
    ppLabel42: TppLabel;
    ppShape1: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppShape4: TppShape;
    ppLine12: TppLine;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppShape5: TppShape;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    pdbtxtQnty1: TppDBText;
    ppMemo1: TppMemo;
    pdbtxtQnty: TppDBText;
    pdbtxtArea: TppDBText;
    pdbtxtPrice: TppDBText;
    pdbtxtMakeAmount: TppDBText;
    pdbtxtTestAmount: TppDBText;
    pdbtxtOtherAmount: TppDBText;
    pdbtxtDueDate: TppDBText;
    pdbtxtUrgentDays: TppDBText;
    pdbtxtUrgentAmount: TppDBText;
    pdbtxtAftDiscountAmount: TppDBText;
    pdbtxtCURR_CODE: TppDBText;
    ppShape7: TppShape;
    ppLine1: TppLine;
    pdbtxtCust_Name1: TppDBText;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppImage2: TppImage;
    ppSystemVariable1: TppSystemVariable;
    pdbtxtEXCH_RATE: TppDBText;
    pdbtxtFED_TAX_ID_NO: TppDBText;
    pdbtxtSTATE: TppDBText;
    pdbtxtLANGUAGE_FLAG: TppDBText;
    pftrbnd1: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    wrdfldLookUp164AddTypeTotal: TWordField;
    wrdfldLookUp164AddTypeEng: TWordField;
    strngfldLookUp164TotalValueStr: TStringField;
    strngfldLookUp164EngValueStr: TStringField;
    procedure aqDetailCalcFields(DataSet: TDataSet);
    procedure adsRpt165AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FPrintTag: Integer;
  public
    { Public declarations }
    function SqlOpen(ASql: string): Boolean;
    function SqlExec(ASql: string): Boolean;
    procedure BeginPrint(ARkey167: string;ATag: Integer = 0);
    function OpenQuery(CName: TADOQuery; Params: array of string;
      sqlText: string=''; OpenType: Byte=0):Boolean;
  end;

var
  dm: Tdm;

implementation

uses
  Dialogs;

{$R *.dfm}

procedure Tdm.aqDetailCalcFields(DataSet: TDataSet);
begin
//  aqDetail.FieldByName('DueArea').Value:= aqDetail.FieldByName('Qnty').Value*
//                                           aqDetail.FieldByName('Area').Value/10000;
//  if not aqDetail.fieldbyname('area').IsNull then
//  aqDetail.FieldByName('AllArea').AsFloat := aqDetail.fieldbyname('qnty').AsInteger * aqDetail.fieldbyname('area').AsFloat;
end;

function Tdm.OpenQuery(CName: TADOQuery; Params: array of string;
  sqlText: string; OpenType: Byte): Boolean;
var
  i: Byte;
begin
  try
    with CName do
    begin
      Close;
      if sqlText <> '' then
      begin
        SQL.Clear;
        SQL.Add(sqlText);
      end;
      if Parameters.Count > 0 then
      begin
        if Parameters.Count = Length(Params) then  //检查TADOQuery参数与传入参数个数是否匹配
          for i:= 0 to Parameters.Count-1 do
            Parameters[i].Value:= Params[i]
        else
          Raise Exception.Create('参数不匹配');
      end;
      if OpenType = 0 then Open else ExecSQL;
    end;
    Result:= True;
  except
    Result:= False;
    Abort;
  end;
end;

function Tdm.SqlExec(ASql: string): Boolean;
begin
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(ASql);
    qrytmp.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function Tdm.SqlOpen(ASql: string): Boolean;
begin
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(ASql);
    qrytmp.Open;
    Result := True;
  except
    Result := False;
  end;
end;

procedure Tdm.adsRpt165AfterScroll(DataSet: TDataSet);
var
  LName1,LName2,LValue1,LValue2: TStringList;
  LUnit1,LUnit2: TStringList;
  I: Integer;
begin
  if FPrintTag = 0 then
  begin
    adsrpt168.Close;
    adsrpt168.CommandText := 'select * from data0168 where rkey165 =' + adsRpt165.fieldbyname('rkey').AsString;
    adsrpt168.Open;
  end;

  adsRpt166.Close;
  adsRpt166.Parameters[0].Value := adsRpt165.fieldbyname('rkey').Value;
  adsRpt166.Open;

  cdsRpt166.First;
  while not cdsRpt166.IsEmpty  do
    cdsRpt166.Delete;

  LName1 := TStringList.Create;
  LName2 := TStringList.Create;
  LValue1 := TStringList.Create;
  LValue2 := TStringList.Create;
  LUnit1 := TStringList.Create;
  LUnit2 := TStringList.Create;
  try
    adsRpt166.First;
    while not adsRpt166.Eof do
    begin
      if adsRpt166.RecNo mod 2 = 1 then
      begin
        LName1.Add(adsRpt166.fieldbyname('parameter_desc').AsString);
        LValue1.Add(adsRpt166.fieldbyname('param_value').AsString);
        LUnit1.Add(adsRpt166.fieldbyname('unit_code').AsString);
      end else
      begin
        LName2.Add(adsRpt166.fieldbyname('parameter_desc').AsString);
        LValue2.Add(adsRpt166.fieldbyname('param_value').AsString);
        LUnit2.Add(adsRpt166.fieldbyname('unit_code').AsString);
      end;
      adsRpt166.Next;
    end;
    for I := 0 to LName1.Count - 1 do
    begin
      cdsRpt166.Append;
      cdsRpt166.FieldByName('parameter_desc').AsString := LName1[I];
      cdsRpt166.FieldByName('param_value').AsString := LValue1[I];
      if LUnit1[I] <> '无' then
        cdsRpt166.FieldByName('param_value').AsString := cdsRpt166.FieldByName('param_value').AsString + ' ' + LUnit1[I];
      if I <= LName2.Count - 1 then
      begin
        cdsRpt166.FieldByName('parameter_desc2').AsString := LName2[I];
        cdsRpt166.FieldByName('param_value2').AsString := LValue2[I];
        if LUnit2[I] <> '无' then
          cdsRpt166.FieldByName('param_value2').AsString := cdsRpt166.FieldByName('param_value2').AsString + ' ' + LUnit2[I];
      end;
      cdsRpt166.Post;
    end;
  finally
    LName1.Free;
    LName2.Free;
    LValue1.Free;
    LValue2.Free;
    LUnit1.Free;
    LUnit2.Free;
  end;
end;

procedure Tdm.BeginPrint(ARkey167: string;ATag: Integer = 0);
begin
  adsrpt168.Close;
  adsrpt166.Close;
  adsRpt165.Close;
  adsRpt167.Close;

  FPrintTag := ATag;
  adsRpt166.Close;
  adsRpt166.Parameters[0].Value := 0;
  adsRpt166.Open;
  cdsRpt166.Data := dsp1.Data;
  cdsRpt166.ProviderName := '';
  adsRpt166.Close;

  adsrpt167.close;
  adsrpt167.Parameters[0].Value := ARkey167;
  adsRpt167.Open;

  if ATag = 1 then
  begin
    adsrpt168.Close;
    adsrpt168.CommandText := 'select d168.* from data0168 d168 inner join data0165 d165 on d168.rkey165 = d165.rkey ' +
                              ' where d165.rkey167 = ' + ARkey167;
    adsrpt168.Open;
  end;

  adsRpt165.Close;
  adsRpt165.Parameters[0].Value := ARkey167;
  adsRpt165.Open;





  if ATag = 0 then
  begin
    prprt1.Reset;
    prprt1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'Rfq_Price_Rpt.rtm';           //R:\NIERP\Report\Manu_instruction.rtm
    prprt1.Template.LoadFromFile;
    prprt1.SaveAsTemplate:=false;
    prprt1.Print;
  end else
  if atag = 1 then
  begin
    prprt2.Reset;
    prprt2.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'Rfq_Price_Rpt2.rtm';           //R:\NIERP\Report\Manu_instruction.rtm
    prprt2.Template.LoadFromFile;
    prprt2.SaveAsTemplate:=false;
    prprt2.Print;      
  end else
  if atag = 2 then
  begin
    prprt1.Reset;
    prprt1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'Rfq_Price_Rpt3.rtm';           //R:\NIERP\Report\Manu_instruction.rtm
    prprt1.Template.LoadFromFile;
    prprt1.SaveAsTemplate:=false;
    prprt1.Print;
  end;

end;

end.





