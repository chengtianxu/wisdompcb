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
    ads38Work_Para: TStringField;
    ADS25DSDesigner35: TStringField;
    ADS25DSDesigner36: TStringField;
    ADS30DSDesigner6: TStringField;
    ADS30DSDesigner12: TStringField;
    ads06DSDesigner23: TStringField;
    ADS25DSDesigner29: TBlobField;
    ads06DSDesigner24: TStringField;
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
    ads06DSDesigner25: TIntegerField;
    ads06PCS2: TIntegerField;
    ads06DSDesigner26: TBCDField;
    ADS25DSDesigner37: TIntegerField;
    ads06DSDesigner27: TDateTimeField;
    ADS25G2: TStringField;
    ADODataSet1: TADODataSet;
    SmallintField2: TSmallintField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DataSource6: TDataSource;
    DB2901: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
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
    ppLabel12: TppLabel;
    ppLine8: TppLine;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
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
    ppLabel11: TppLabel;
    ppLine7: TppLine;
    ppLabel15: TppLabel;
    ppDBText24: TppDBText;
    ppLabel28: TppLabel;
    ppDBText26: TppDBText;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText28: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBBarCode1: TppDBBarCode;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    ppDBText10: TppDBText;
    ppImage6: TppImage;
    ppDBText22: TppDBText;
    ppDBText27: TppDBText;
    ppDBText67: TppDBText;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel17: TppLabel;
    ppDBText8: TppDBText;
    ppLabel26: TppLabel;
    ppDBText9: TppDBText;
    ppLabel105: TppLabel;
    ppDBText23: TppDBText;
    ppLabel25: TppLabel;
    ppDBText25: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppLine16: TppLine;
    ppDBText5: TppDBText;
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
    ppLine96: TppLine;
    ppDBMemo9: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDBText6: TppDBText;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    ppLabel103: TppLabel;
    ppDBText16: TppDBText;
    ppLabel104: TppLabel;
    ppDBText18: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel16: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine13: TppLine;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLine15: TppLine;
    ppLabel24: TppLabel;
    ppLine73: TppLine;
    ppLabel84: TppLabel;
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
    ppDBText21: TppDBText;
    ppLine39: TppLine;
    ppDBText30: TppDBText;
    ppLine40: TppLine;
    ppDBText31: TppDBText;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText17: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLine49: TppLine;
    ppLabel27: TppLabel;
    ppShape4: TppShape;
    ppLine18: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel46: TppLabel;
    ppLine32: TppLine;
    ppLabel47: TppLabel;
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
    ppLabel35: TppLabel;
    ppLine71: TppLine;
    ppImage7: TppImage;
    ppGroupFooterBand5: TppGroupFooterBand;
    raCodeModule3: TraCodeModule;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLine93: TppLine;
    ppLine94: TppLine;
    ppSummaryBand5: TppSummaryBand;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppShape6: TppShape;
    ppLabel85: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppLine95: TppLine;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppHeaderBand7: TppHeaderBand;
    ppDetailBand7: TppDetailBand;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppLine99: TppLine;
    ppLine100: TppLine;
    ppLine101: TppLine;
    ppLine102: TppLine;
    ppLine103: TppLine;
    ppLine104: TppLine;
    ppLine105: TppLine;
    ppLine106: TppLine;
    ppLine107: TppLine;
    ppLine108: TppLine;
    ppSummaryBand7: TppSummaryBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLine109: TppLine;
    ppLine110: TppLine;
    ppLine111: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLine114: TppLine;
    ppLine115: TppLine;
    ppLine116: TppLine;
    ppLine117: TppLine;
    ppLine118: TppLine;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel36: TppLabel;
    ppDBText66: TppDBText;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppImage8: TppImage;
    ppImage9: TppImage;
    ppImage10: TppImage;
    ppDBText68: TppDBText;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppSummaryBand6: TppSummaryBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLabel86: TppLabel;
    ppLine72: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBMemo4: TppDBMemo;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ads06DSDesigner28: TMemoField;
    pfldDB06ppField40: TppField;
    procedure ADS25CalcFields(DataSet: TDataSet);
    procedure ads38CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
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

procedure TForm_report.ppReport1BeforePrint(Sender: TObject);
begin
//  ppImage7.Visible:=True;
//  ppImage7.Picture.Assign(Load_JPG_Pic_From_DB(ADS25DSDesigner29));
end;

end.
