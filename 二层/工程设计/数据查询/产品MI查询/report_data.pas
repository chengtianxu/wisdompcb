unit report_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, StdCtrls, DBCtrls,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppProd,
  ppReport, ExtCtrls, Mask, Grids, DBGrids, ppVar, ppSubRpt, ppModule,
  raCodMod, ppEndUsr,raide, jpeg;

type
  TForm_report = class(TForm)
    DataSource1: TDataSource;
    ADS25: TADODataSet;
    ads279: TADODataSet;
    ads38: TADODataSet;
    DataSource2: TDataSource;
    ads494: TADODataSet;
    ads192: TADODataSet;
    ads192ENG_CONTROL2: TWordField;
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
    DataSource3: TDataSource;
    ppDB25: TppDBPipeline;
    ppDB502: TppDBPipeline;
    ads29: TADODataSet;
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
    DataSource4: TDataSource;
    ppDB29: TppDBPipeline;
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
    ads29DSDesigner7: TSmallintField;
    ppDesigner1: TppDesigner;
    ads494step_number: TSmallintField;
    ADS25DSDesigner31: TWordField;
    ADS25DSDesigner32: TStringField;
    ads29SE: TStringField;
    ADS25barcode_flag: TWordField;
    ADS25NOPB_flag: TWordField;
    ADS30: TADODataSet;
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
    DataSource6: TDataSource;
    ppDB30: TppDBPipeline;
    ADS25DSDesigner33: TIntegerField;
    ADS25DSDesigner34: TWideStringField;
    ads29DSDesigner8: TIntegerField;
    ads29DSDesigner9: TIntegerField;
    ADS25DSDesigner35: TBlobField;
    strngfldADS25DSDesigner36: TStringField;
    ADS30DSDesigner6: TStringField;
    ADS30DSDesigner12: TStringField;
    ADS25DSDesigner4G: TStringField;
    ADS30coupon: TIntegerField;
    ads38grade_note: TWideStringField;
    ads494TaskTopLimt: TFloatField;
    ads494TaskLowLimt: TFloatField;
    ads494InnerTopLimt: TFloatField;
    ads494InnerLowLimt: TFloatField;
    ads494SpecialNote: TStringField;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
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
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine8: TppLine;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
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
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppDBText33: TppDBText;
    ppVariable1: TppVariable;
    ppImage5: TppImage;
    ppLabel59: TppLabel;
    ppDBText2: TppDBText;
    ppLabel56: TppLabel;
    ppLabel58: TppLabel;
    ppDBText48: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLine16: TppLine;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppDBText20: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppDBText21: TppDBText;
    ppDBMemo7: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppDBText9: TppDBText;
    ppLine5: TppLine;
    ppDBText10: TppDBText;
    ppLabel6: TppLabel;
    ppLine6: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine44: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppLine78: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppDBText32: TppDBText;
    ppLine66: TppLine;
    ppDBText34: TppDBText;
    ppLine67: TppLine;
    ppDBText35: TppDBText;
    ppLine68: TppLine;
    ppDBText36: TppDBText;
    ppLine69: TppLine;
    ppLine70: TppLine;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppLine19: TppLine;
    ppDBText47: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLine77: TppLine;
    ppShape3: TppShape;
    ppLabel42: TppLabel;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
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
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLabel54: TppLabel;
    ppLine61: TppLine;
    ppLabel55: TppLabel;
    ppLine62: TppLine;
    ppLine79: TppLine;
    ppLabel57: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppLine20: TppLine;
    ppLine7: TppLine;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine49: TppLine;
    ppDBText18: TppDBText;
    ppDBMemo8: TppDBMemo;
    ppSummaryBand4: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine48: TppLine;
    ppLabel17: TppLabel;
    ppDBText46: TppDBText;
    ppLabel23: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
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
    ppImage4: TppImage;
    ppGroupFooterBand5: TppGroupFooterBand;
    raCodeModule3: TraCodeModule;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLine47: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel39: TppLabel;
    ppLabel26: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppImage3: TppImage;
    ppLine50: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLine17: TppLine;
    ppLabel25: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ppLabel10: TppLabel;
    ppDBMemo4: TppDBMemo;
    raCodeModule4: TraCodeModule;
    ppLabel60: TppLabel;
    ppDBText31: TppDBText;
    ADS25DSDesigner29: TWideStringField;
    ADS30DSDesigner14: TStringField;
    ADS30DSDesigner15: TStringField;
    ADS30DSDesigner16: TStringField;
    ADS30DSDesigner17: TStringField;
    ppDB30ppField16: TppField;
    ppDB30ppField17: TppField;
    ppDB30ppField18: TppField;
    ppDB30ppField19: TppField;
    ADS25RoHS: TBooleanField;
    ADS25DSDesigner37: TStringField;
    ADS25DSDesigner38: TStringField;
    ppDB29ppField15: TppField;
    ads29DSDesigner10: TStringField;
    ADS25DSDesigner39: TStringField;
    ADS25DSDesigner40: TStringField;
    ADS25DSDesigner41: TWideStringField;
    ADS25REACH: TStringField;
    ADS25Ring: TBCDField;
    ppDB25ppField57: TppField;
    procedure ADS25CalcFields(DataSet: TDataSet);
    procedure ads38CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses damo;

{$R *.dfm}

procedure TForm_report.ADS25CalcFields(DataSet: TDataSet);
var
 i:integer;
 s,unitcode:string;
begin
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
var unitcode:string;
b: Boolean;
begin
ads494.Filter:='step_number='+ADS38STEP_NUMBER.AsString;
ads494.First;
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

  ads494.Next;
 end;
 ads38WideStringField.Value:=ads38WideStringField.Value + ads38DSDesigner6.Value +
 '    ' + ads38.fieldbyname('grade_note').AsString;
end;

end.
