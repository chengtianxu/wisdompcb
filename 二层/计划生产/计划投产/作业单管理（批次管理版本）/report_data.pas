unit report_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, StdCtrls, DBCtrls,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppProd,
  ppReport, ExtCtrls, Mask, Grids, DBGrids, ppVar, ppSubRpt, ppModule,
  raCodMod, ppEndUsr,raide, ppBarCod, jpeg;

type
  TForm_report = class(TForm)
    DataSource1: TDataSource;
    ADS25: TADODataSet;
    ads279: TADODataSet;
    ads38: TADODataSet;
    DataSource2: TDataSource;
    ads494: TADODataSet;
    ads192: TADODataSet;
    ads192ENG_CONTROL16: TWordField;
    ADS25RKEY: TIntegerField;
    ADS25DSDesigner: TStringField;
    ADS25DSDesigner2: TStringField;
    ADS25DSDesigner3: TStringField;
    ADS25DSDesigner4: TStringField;
    ADS25DSDesigner5: TStringField;
    ADS25DSDesigner6: TStringField;
    ADS25DSDesigner7: TStringField;
    ADS25DSDesigner8: TStringField;
    ADS25DSDesigner9: TDateTimeField;
    ADS25DSDesigner10: TStringField;
    ADS25DSDesigner11: TDateTimeField;
    ADS25DSDesigner12: TStringField;
    ADS25DSDesigner13: TDateTimeField;
    ADS25DSDesigner14: TStringField;
    ADS25DSDesigner15: TStringField;
    ADS25DSDesigner16: TWordField;
    ADS25SET: TStringField;
    ADS25PCS: TStringField;
    ADS25SPEL: TStringField;
    ADS25PCS2: TFloatField;
    ADS25SET2: TFloatField;
    ADS25SPEL2: TFloatField;
    ADS25DSDesigner17: TMemoField;
    ADS25DSDesigner18: TMemoField;
    ADS25DSDesigner19: TStringField;
    ADS25DSDesigner20: TFloatField;
    ADS25DSDesigner21: TIntegerField;
    ADS25DSDesigner22: TSmallintField;
    ADS25DSDesigner23: TSmallintField;
    ADS25DSDesigner24: TStringField;
    ADS25g: TBCDField;
    ADS25DSDesigner25: TIntegerField;
    ADS25DSDesigner26: TStringField;
    ADS25DSDesigner27: TStringField;
    ADS25DSDesigner28: TStringField;
    ADS25DSDesigner30: TStringField;
    ads279PARAMETER_NAME: TStringField;
    ads279PARAMETER_DESC: TStringField;
    ads279PARAMETER_VALUE: TStringField;
    ads279UNIT_CODE: TStringField;
    ADS25Field1: TWideStringField;
    ADS25Field2: TWideStringField;
    Memo1: TMemo;
    Memo2: TMemo;
    ads494PARAMETER_NAME: TStringField;
    ads494PARAMETER_DESC: TStringField;
    ads494PARAMETER_VALUE: TStringField;
    ads494UNIT_CODE: TStringField;
    ppReport1: TppReport;
    ads38DSDesigner: TStringField;
    ads38DSDesigner2: TStringField;
    ads38STEP_NUMBER: TSmallintField;
    ads38DSDesigner3: TStringField;
    ads38DSDesigner4: TStringField;
    ads38DSDesigner5: TBCDField;
    ads38DSDesigner6: TStringField;
    ads38SOURCE_PTR: TIntegerField;
    ads38WideStringField: TWideStringField;
    ppDB38: TppDBPipeline;
    ppDB25: TppDBPipeline;
    ads493: TADODataSet;
    ads493Company_Name: TStringField;
    ads493Company_Name2: TStringField;
    ads493Company_Name3: TStringField;
    ads493ship_address: TStringField;
    ads493Company_Icon: TBlobField;
    ads493SITE_INFO_ADD_1: TStringField;
    ads493SITE_INFO_ADD_2: TStringField;
    ads493SITE_INFO_ADD_3: TStringField;
    ads493SITE_INFO_PHONE: TStringField;
    DataSource5: TDataSource;
    ppDB493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ads192PPC_CONTROL9: TWordField;
    ads494seq_no: TSmallintField;
    ads06: TADODataSet;
    DataSource3: TDataSource;
    ads06DSDesigner: TStringField;
    ads06DSDesigner2: TStringField;
    ads06DSDesigner3: TStringField;
    ads06DSDesigner4: TStringField;
    ads06DSDesigner5: TDateTimeField;
    ads06DSDesigner6: TDateTimeField;
    ads06DSDesigner7: TFloatField;
    ads06DSDesigner8: TIntegerField;
    ads06DSDesigner9: TIntegerField;
    ads06DSDesigner10: TDateTimeField;
    ads06DSDesigner11: TStringField;
    ads06PAN: TIntegerField;
    ads06PANPCS: TFloatField;
    ads06DSDesigner12: TFloatField;
    ads06DSDesigner13: TStringField;
    ads06DSDesigner14: TWordField;
    ads06DSDesigner15: TStringField;
    ads06DSDesigner16: TStringField;
    ads06DSDesigner17: TStringField;
    ppDB06: TppDBPipeline;
    ads494step_number: TSmallintField;
    ads06PnlA: TIntegerField;
    ads06PnlB: TIntegerField;
    ads06DSDesigner18: TStringField;
    ads06DSDesigner19: TStringField;
    ads06BOM_PTR: TIntegerField;
    ads06PPC_FLAG: TSmallintField;
    ADS25BARCODE_FLAG: TWordField;
    ads06APCS: TIntegerField;
    ads06BPCS: TIntegerField;
    ADS25DSDesigner31: TStringField;
    ads06DSDesigner20: TStringField;
    ads06DSDesigner21: TStringField;
    ads06DSDesigner22: TStringField;
    ADS25NOPB_flag: TWordField;
    ADS30: TADODataSet;
    DataSource4: TDataSource;
    ppDB30: TppDBPipeline;
    ADS30DSDesigner: TSmallintField;
    ADS30DSDesigner2: TStringField;
    ADS30DSDesigner3: TStringField;
    ADS30DSDesigner4: TStringField;
    ADS30DSDesigner5: TStringField;
    ADS30DSDesigner7: TBCDField;
    ADS30DSDesigner8: TBCDField;
    ADS30DSDesigner9: TStringField;
    ADS30DSDesigner10: TStringField;
    ADS30DSDesigner11: TStringField;
    ADS30DSDesigner13: TBCDField;
    ADS30source_ptr: TIntegerField;
    ADS25DSDesigner32: TStringField;
    ADS25DSDesigner33: TWordField;
    ADS25DSDesigner34: TWordField;
    ADS25reach: TBooleanField;
    ads06PCS: TFloatField;
    ads06PAN2: TIntegerField;
    ppReport2: TppReport;
    ppDesigner2: TppDesigner;
    ppDB238: TppDBPipeline;
    ds238: TDataSource;
    ads238: TADODataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    SmallintField1: TSmallintField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    ads238WO_PTR: TIntegerField;
    ads06RKEY: TIntegerField;
    ppTitleBand4: TppTitleBand;
    ppHeaderBand4: TppHeaderBand;
    ppShape3: TppShape;
    ppDBMemo5: TppDBMemo;
    ppDBMemo7: TppDBMemo;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppLabel53: TppLabel;
    ppLine50: TppLine;
    ppLabel54: TppLabel;
    ppDBText45: TppDBText;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLine51: TppLine;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLine52: TppLine;
    ppDBImage2: TppDBImage;
    ppDBText49: TppDBText;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDBText50: TppDBText;
    ppLabel63: TppLabel;
    ppLine53: TppLine;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLabel64: TppLabel;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppDBText55: TppDBText;
    ppLabel68: TppLabel;
    ppDBText56: TppDBText;
    ppLabel69: TppLabel;
    ppDBText57: TppDBText;
    ppLabel70: TppLabel;
    ppDBText58: TppDBText;
    ppDBBarCode2: TppDBBarCode;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppImage3: TppImage;
    ppVariable4: TppVariable;
    ppImage4: TppImage;
    ppVariable5: TppVariable;
    ppDBText61: TppDBText;
    ppImage5: TppImage;
    ppDetailBand4: TppDetailBand;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppDBText62: TppDBText;
    ppDBMemo8: TppDBMemo;
    ppDBText63: TppDBText;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppVariable6: TppVariable;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppFooterBand2: TppFooterBand;
    ppLine63: TppLine;
    ppLabel71: TppLabel;
    ppDBText64: TppDBText;
    ppLabel72: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel73: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel74: TppLabel;
    ppDBText65: TppDBText;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape5: TppShape;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    raCodeModule5: TraCodeModule;
    ADS25DSDesigner35: TStringField;
    ADS25DSDesigner36: TStringField;
    ADS30DSDesigner6: TStringField;
    ADS30DSDesigner12: TStringField;
    ADS25DSDesigner4G: TStringField;
    ads06DSDesigner23: TStringField;
    ADS25DSDesigner29: TBlobField;
    ads06DSDesigner24: TStringField;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel12: TppLabel;
    ppLine8: TppLine;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine9: TppLine;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine10: TppLine;
    ppDBImage1: TppDBImage;
    ppDBText11: TppDBText;
    ppLabel13: TppLabel;
    ppLabel10: TppLabel;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    ppLine7: TppLine;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel15: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppDBText26: TppDBText;
    ppLabel29: TppLabel;
    ppDBText27: TppDBText;
    ppLabel30: TppLabel;
    ppDBText28: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBBarCode1: TppDBBarCode;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppImage1: TppImage;
    ppVariable2: TppVariable;
    ppImage2: TppImage;
    ppVariable3: TppVariable;
    ppDBText10: TppDBText;
    ppImage6: TppImage;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText69: TppDBText;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppVariable7: TppVariable;
    ppLabel95: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppLine16: TppLine;
    ppDBText6: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppDBText20: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppVariable1: TppVariable;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine2: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel23: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel24: TppLabel;
    ppDBText21: TppDBText;
    ppLabel27: TppLabel;
    ppLabel31: TppLabel;
    ppDBBarCode3: TppDBBarCode;
    ppLabel94: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppPageStyle1: TppPageStyle;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine13: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLine15: TppLine;
    ppLabel39: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppDBText29: TppDBText;
    ppLine38: TppLine;
    ppDBText30: TppDBText;
    ppLine39: TppLine;
    ppDBText31: TppDBText;
    ppLine40: TppLine;
    ppDBText32: TppDBText;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLine49: TppLine;
    ppLabel40: TppLabel;
    ppShape4: TppShape;
    ppLine18: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel86: TppLabel;
    ppLine32: TppLine;
    ppLabel87: TppLabel;
    ppLine70: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBMemo6: TppDBMemo;
    ppSummaryBand3: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel88: TppLabel;
    ppLine71: TppLine;
    ppImage7: TppImage;
    ppGroupFooterBand5: TppGroupFooterBand;
    raCodeModule3: TraCodeModule;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppDBText68: TppDBText;
    ppDBMemo4: TppDBMemo;
    raCodeModule1: TraCodeModule;
    ads29: TADODataSet;
    ads29DSDesigner7: TSmallintField;
    ads29DSDesigner: TStringField;
    ads29DSDesigner2: TStringField;
    ads29DSDesigner3: TStringField;
    ads29PTH: TStringField;
    ads29DSDesigner4: TStringField;
    ads29DSDesigner5: TStringField;
    ads29PCS: TStringField;
    ads29A: TStringField;
    ads29B: TStringField;
    ads29DSDesigner6: TStringField;
    ads29SE: TStringField;
    ads29DSDesigner8: TIntegerField;
    ads29DSDesigner9: TIntegerField;
    ds29: TDataSource;
    ppDB29: TppDBPipeline;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ds502: TDataSource;
    ads502: TADODataSet;
    ads502DSDesigner: TBlobField;
    ads502A: TBlobField;
    ads502B: TBlobField;
    ads502A2: TSmallintField;
    ads502B2: TSmallintField;
    ads502DSDesigner2: TFloatField;
    ads502DSDesigner3: TFloatField;
    ads502DSDesigner4: TIntegerField;
    ads502DSDesigner5: TFloatField;
    ads502DSDesigner6: TFloatField;
    ads502DSDesigner7: TBCDField;
    ads502A3: TFloatField;
    ads502A4: TFloatField;
    ads502APCS: TSmallintField;
    ads502B3: TFloatField;
    ads502B4: TFloatField;
    ads502BPCS: TSmallintField;
    ppDB502: TppDBPipeline;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppImage8: TppImage;
    ppImage9: TppImage;
    ppImage10: TppImage;
    ads06DSDesigner25: TIntegerField;
    ads06PCS2: TIntegerField;
    ads06DSDesigner26: TBCDField;
    ADS25DSDesigner37: TIntegerField;
    ads06DSDesigner27: TDateTimeField;
    ads494TaskTopLimt: TFloatField;
    ads494TaskLowLimt: TFloatField;
    ads494InnerTopLimt: TFloatField;
    ads494InnerLowLimt: TFloatField;
    ads494SpecialNote: TStringField;
    ADS25Ring: TBCDField;
    ADS25DSDesigner38: TWideStringField;
    ADS30DSDesigner14: TStringField;
    ADS30DSDesigner15: TStringField;
    ADS30DSDesigner16: TStringField;
    ADS30DSDesigner17: TStringField;
    ADS25Field: TStringField;
    ads06Field36: TStringField;
    spABC36: TADOStoredProc;
    ADS25DSDesigner210: TStringField;
    ppDBBarCode4: TppDBBarCode;
    ADS25DSDesigner39: TStringField;
    ads38DSDesigner7: TWideStringField;
    ads38DSDesigner8: TStringField;
    procedure ADS25CalcFields(DataSet: TDataSet);
    procedure ads38CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ads06CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses Dm,common, StrUtils;


{$R *.dfm}

procedure TForm_report.ADS25CalcFields(DataSet: TDataSet);
var
 i:integer;
 s,unitcode:string;
 ltmp: string;
 Lstr: string;
begin
 ads279.Close;
 ads279.Parameters.ParamValues['rkey']:=ads06BOM_PTR.Value;
 if ads192ENG_CONTROL16.Value=1 then       //不显示为空的全局参数
  ads279.Parameters.ParamValues['value']:=''
 else
  ads279.Parameters.ParamValues['value']:='#@#@#';
 ads279.Open;

 s:='                     ';
 self.ads279.First;
 for i:=1 to ads279.RecordCount do
  begin
   if odd(ads279.RecordCount) then
   if i<=(ads279.RecordCount+1)/2 then
    begin
     if ads279UNIT_CODE.Value<>'无' then
      unitcode:=ads279UNIT_CODE.Value
     else
      unitcode:='';
     self.Memo1.Lines.add(
              trim(ads279parameter_desc.Value)+
              copy(s,1,21-length(trim(ads279PARAMETER_DESC.Value)))+
              trim(ads279PARAMETER_VALUE.Value)+unitcode);
    end
   else
    begin
     if ads279UNIT_CODE.Value<>'无' then
      unitcode:=ads279UNIT_CODE.Value
     else
      unitcode:='';
     self.Memo2.Lines.Add(
               trim(ads279parameter_desc.Value)+
               copy(s,1,21-length(trim(ads279parameter_desc.Value)))+
               trim(ads279PARAMETER_VALUE.Value)+UNITCODE);
    end
  else
   if i<=(ads279.RecordCount)/2 then
    begin
     if ads279UNIT_CODE.Value<>'无' then
      unitcode:=ads279UNIT_CODE.Value
     else
      unitcode:='';
     self.Memo1.Lines.add(
              trim(ads279parameter_desc.Value)+
              copy(s,1,21-length(trim(ads279PARAMETER_DESC.Value)))+
              trim(ads279PARAMETER_VALUE.Value)+UNITCODE);
    end
   else
    begin
     if ads279UNIT_CODE.Value<>'无' then
      unitcode:=ads279UNIT_CODE.Value
     else
      unitcode:='';
     self.Memo2.Lines.Add(
               trim(ads279parameter_desc.Value)+
               copy(s,1,21-length(trim(ads279parameter_desc.Value)))+
              trim(ads279PARAMETER_VALUE.Value)+UNITCODE);
    end;
   ads279.Next;
  end;
self.ADS25Field1.Value:=memo1.Text;
self.ADS25Field2.Value:=memo2.Text;

//临时增加压合程式
  ltmp := '';
    lstr := ADS25.fieldbyname('层压结构').AsString;
   if Pos('压合程式：',lstr) > 0 then
   begin
      for I := Pos('压合程式：',lstr) + Length('压合程式：') to Length(Lstr) do
      begin
        ltmp := ltmp + Lstr[i];
      end;
      ADS25.FieldByName('压合程式').AsString := ltmp;
   end;
end;

procedure TForm_report.ads38CalcFields(DataSet: TDataSet);
var
 unitcode:string;
 b: Boolean;
begin
if not ads494.Active then
 begin
  ads494.Close;
  ads494.Parameters.ParamValues['source_ptr']:=ads38SOURCE_PTR.Value;
  if ads192PPC_CONTROL9.Value=1 then       //不显示为空的制程参数在作业单上
   ads494.Parameters.ParamValues['value']:=''
  else
   ads494.Parameters.ParamValues['value']:='#@#@#';
  ads494.Open;
 end;
ads494.First;
ads494.Filter:='step_number='+ADS38STEP_NUMBER.AsString;
While not ads494.Eof do
 begin
   b := False;
  if ads494UNIT_CODE.Value<>'无' then
   unitcode:=ads494UNIT_CODE.Value
  else
   unitcode:='';
  if trim(ads494PARAMETER_VALUE.Value)<>'' then
   self.ads38WideStringField.Value:=ads38WideStringField.Value+
                      trim(ads494PARAMETER_DESC.Value)+':'+
                      trim(ads494PARAMETER_VALUE.Value)+
                      unitcode
  else
   self.ads38WideStringField.Value:=ads38WideStringField.Value+
                      trim(ads494PARAMETER_DESC.Value)+':'+
                      '＿＿'+
                      unitcode;

  if ads494.FieldByName('TaskTopLimt').AsString <> '' then
  begin
    if not B then
    begin
      b := True;
      self.ads38WideStringField.Value := self.ads38WideStringField.Value + '(';
    end;
    self.ads38WideStringField.Value := self.ads38WideStringField.Value + '规范上限:'+ads494.FieldByName('TaskTopLimt').AsString + ' ';
  end;
  if ads494.FieldByName('TaskLowLimt').AsString <> '' then
  begin
    if not B then
    begin
      b := True;
      self.ads38WideStringField.Value := self.ads38WideStringField.Value + '(';
    end;
    self.ads38WideStringField.Value := self.ads38WideStringField.Value + '规范下限:'+ads494.FieldByName('TaskLowLimt').AsString+ ' ';
  end;
  if ads494.FieldByName('InnerTopLimt').AsString <> '' then
  begin
    if not B then
    begin
      b := True;
      self.ads38WideStringField.Value := self.ads38WideStringField.Value + '(';
    end;
    self.ads38WideStringField.Value := self.ads38WideStringField.Value + '内控上限:'+ads494.FieldByName('InnerTopLimt').AsString+ ' ';
  end;
  if ads494.FieldByName('InnerLowLimt').AsString <> '' then
  begin
    if not B then
    begin
      b := True;
      self.ads38WideStringField.Value := self.ads38WideStringField.Value + '(';
    end;
    self.ads38WideStringField.Value := self.ads38WideStringField.Value + '内控下限:'+ads494.FieldByName('InnerLowLimt').AsString+ ' ';

  end;
  if ads494.FieldByName('SpecialNote').AsString <> '' then
  begin
    if not B then
    begin
      b := True;
      self.ads38WideStringField.Value := self.ads38WideStringField.Value + '(';
    end;
    self.ads38WideStringField.Value := self.ads38WideStringField.Value + '特别说明:'+ads494.FieldByName('SpecialNote').AsString+ ' ';
  end;
  if B then
    self.ads38WideStringField.Value := self.ads38WideStringField.Value + ')';

  self.ads38WideStringField.Value := self.ads38WideStringField.Value + '   ';

//--下面注释的是以前的旧的
//  if ads494UNIT_CODE.Value<>'无' then
//   unitcode:=ads494UNIT_CODE.Value
//  else
//   unitcode:='';
//  if trim(ads494PARAMETER_VALUE.Value)<>'' then
//   self.ads38WideStringField.Value:=ads38WideStringField.Value+
//                      trim(ads494PARAMETER_DESC.Value)+':'+
//                      trim(ads494PARAMETER_VALUE.Value)+
//                      unitcode+'    '
//  else
//   self.ads38WideStringField.Value:=ads38WideStringField.Value+
//                      trim(ads494PARAMETER_DESC.Value)+':'+
//                      '__'+
//                      unitcode+'    ';
  ads494.Next;
 end;

  ads38WideStringField.Value:=         //加工序备注
      ads38WideStringField.Value + ads38DSDesigner6.Value;

  if  Trim(ads38DSDesigner7.Value)<>''  then     //；加等级指示
   ads38WideStringField.Value:=
      ads38WideStringField.Value +': '+ads38DSDesigner7.Value;

  if Trim(ads38DSDesigner3.Value)<>'' then   //加工具版本
   ads38WideStringField.Value:=
      ads38WideStringField.Value +'工具: '+ads38DSDesigner3.Value;


end;

procedure TForm_report.FormCreate(Sender: TObject);
begin
self.ads192.Open;
end;

procedure TForm_report.ppReport1PrintingComplete(Sender: TObject);
begin

ExecSql(dmcon.tmpQry,
'update data0006 set Trav_Printed_By_Ptr='+user_ptr+
',cancel_hold_date=getdate()'+            //更新打印人员及日期
' where rkey='+inttostr(self.ads06.Parameters[0].Value));

end;

procedure TForm_report.ppReport1BeforePrint(Sender: TObject);
begin
//  ppImage7.Visible:=True;
//  ppImage7.Picture.Assign(Load_JPG_Pic_From_DB(ADS25DSDesigner29));
end;

procedure TForm_report.ads06CalcFields(DataSet: TDataSet);
begin
  spABC36.Close;
  spABC36.Parameters.ParamByName('@Dec').Value := ads06.fieldbyname('rkey').AsInteger;
  spABC36.ExecProc;
  if spABC36.Parameters.ParamByName('@ret').Value = 1 then
  begin
    ads06.FieldByName('工单36码').AsString := RightStr('0000' + spABC36.Parameters.parambyname('@out_ABC36').Value,4);
  end;
end;

end.
