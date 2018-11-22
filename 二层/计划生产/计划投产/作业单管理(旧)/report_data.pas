unit report_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, StdCtrls, DBCtrls,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppProd,
  ppReport, ExtCtrls, Mask, Grids, DBGrids, ppVar, ppSubRpt, ppModule,
  raCodMod, ppEndUsr,raide, ppBarCod;

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
    ADS25DSDesigner29: TStringField;
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
    ADS30DSDesigner6: TBCDField;
    ADS30DSDesigner7: TBCDField;
    ADS30DSDesigner8: TBCDField;
    ADS30DSDesigner9: TStringField;
    ADS30DSDesigner10: TStringField;
    ADS30DSDesigner11: TStringField;
    ADS30DSDesigner12: TBCDField;
    ADS30DSDesigner13: TBCDField;
    ADS30source_ptr: TIntegerField;
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
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppLine16: TppLine;
    ppDBText2: TppDBText;
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
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel5: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBMemo6: TppDBMemo;
    ppSummaryBand3: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel27: TppLabel;
    ppLine18: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    raCodeModule3: TraCodeModule;
    ppLabel35: TppLabel;
    ppDBText7: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppLabel36: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppLine13: TppLine;
    ppLabel24: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    raCodeModule1: TraCodeModule;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape4: TppShape;
    ppLine15: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine32: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
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
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppDBText10: TppDBText;
    ppDBText21: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ADS25DSDesigner32: TStringField;
    ADS25DSDesigner33: TWordField;
    ADS25DSDesigner34: TWordField;
    ADS25reach: TBooleanField;
    ppDB25ppField47: TppField;
    procedure ADS25CalcFields(DataSet: TDataSet);
    procedure ads38CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses Dm,common;


{$R *.dfm}

procedure TForm_report.ADS25CalcFields(DataSet: TDataSet);
var
 i:integer;
 s,unitcode:string;
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
self.ADS25Field2.Value:=memo2.Text

end;

procedure TForm_report.ads38CalcFields(DataSet: TDataSet);
var
 unitcode:string;
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
  if ads494UNIT_CODE.Value<>'无' then
   unitcode:=ads494UNIT_CODE.Value
  else
   unitcode:='';
  if trim(ads494PARAMETER_VALUE.Value)<>'' then
   self.ads38WideStringField.Value:=ads38WideStringField.Value+
                      trim(ads494PARAMETER_DESC.Value)+':'+
                      trim(ads494PARAMETER_VALUE.Value)+
                      unitcode+'    '
  else
   self.ads38WideStringField.Value:=ads38WideStringField.Value+
                      trim(ads494PARAMETER_DESC.Value)+':'+
                      '__'+
                      unitcode+'    ';
  ads494.Next;
 end;

  ads38WideStringField.Value:=
      ads38WideStringField.Value + ads38DSDesigner6.Value;
      
  if Trim(ads38DSDesigner3.Value)<>'' then
  ads38WideStringField.Value:=
      ads38WideStringField.Value +' 工具:'+ads38DSDesigner3.Value;


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

end.
