unit RptDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, frxClass,
  frxDBSet, frxGZip, frxCrypt, frxDMPExport, frxExportText, Winapi.Windows,
  frxDesgn;

type
  TdmRpt = class(TDataModule)
    rpt1: TfrxReport;
    rptds493: TfrxDBDataset;
    cds493: TClientDataSet;
    ds493: TDataSource;
    strngfldcds493Company_Name: TStringField;
    strngfldcds493Company_Name2: TStringField;
    strngfldcds493Company_Name3: TStringField;
    strngfldcds493ship_address: TStringField;
    blbfldcds493Company_Icon: TBlobField;
    strngfldcds493SITE_INFO_ADD_1: TStringField;
    strngfldcds493SITE_INFO_ADD_2: TStringField;
    strngfldcds493SITE_INFO_ADD_3: TStringField;
    strngfldcds493SITE_INFO_PHONE: TStringField;
    cdsBP06: TClientDataSet;
    dsBP06: TDataSource;
    rptdsBP06: TfrxDBDataset;
    cdsB10: TClientDataSet;
    dsBP10: TDataSource;
    rptdsBP10: TfrxDBDataset;
    strngfldB10PARAMETER_DESC: TStringField;
    strngfldB10Param_Value: TStringField;
    strngfldB10UNIT_CODE: TStringField;
    cdsBP08: TClientDataSet;
    dsBP08: TDataSource;
    rptdsBP08: TfrxDBDataset;
    strngfldBP08GROUP_DESC: TStringField;
    strngfldBP08INV_NAME: TStringField;
    strngfldBP08INV_PART_DESCRIPTION: TStringField;
    fmtbcdfldBP08MStdPrice: TFMTBCDField;
    fmtbcdfldBP08MUsePerPcs: TFMTBCDField;
    fmtbcdfldBP08MUsePrice: TFMTBCDField;
    strngfldBP08ABBR_NAME: TStringField;
    cdsBP11: TClientDataSet;
    dsBP11: TDataSource;
    rptdsBP11: TfrxDBDataset;
    strngfldBP11IDKey: TStringField;
    strngfldBP11BP06_ptr: TStringField;
    fmtbcdfldBP11SheetW: TFMTBCDField;
    fmtbcdfldBP11SheetH: TFMTBCDField;
    fmtbcdfldBP11SetW_A: TFMTBCDField;
    fmtbcdfldBP11SetH_A: TFMTBCDField;
    intgrfldBP11PnlCount_A: TIntegerField;
    fmtbcdfldBP11PnlW_A: TFMTBCDField;
    fmtbcdfldBP11PnlH_A: TFMTBCDField;
    intgrfldBP11SetCountPerPnl_A: TIntegerField;
    fmtbcdfldBP11SetHorSapce_A: TFMTBCDField;
    fmtbcdfldBP11SetVerSapce_A: TFMTBCDField;
    fmtbcdfldBP11PnlLeftRightBorderW_A: TFMTBCDField;
    fmtbcdfldBP11PnlTopBottomBorderW_A: TFMTBCDField;
    fmtbcdfldBP11SheetUseage: TFMTBCDField;
    intgrfldBP11PnlCount_B: TIntegerField;
    fmtbcdfldBP11PnlW_B: TFMTBCDField;
    fmtbcdfldBP11PnlH_B: TFMTBCDField;
    intgrfldBP11SetCountPerPnl_B: TIntegerField;
    fmtbcdfldBP11PnlLeftRightBorderW_B: TFMTBCDField;
    fmtbcdfldBP11PnlTopBottomBorderW_B: TFMTBCDField;
    blbfldBP11SheetImg: TBlobField;
    blbfldBP11PnlAImg: TBlobField;
    blbfldBP11PnlBImg: TBlobField;
    cdsBP07: TClientDataSet;
    dsBP07: TDataSource;
    rptdsBP07: TfrxDBDataset;
    agrgtfldBP08SumBp08UsePrice: TAggregateField;
    strngfldBP07DEPT_NAME: TStringField;
    fmtbcdfldBP07P1: TFMTBCDField;
    fmtbcdfldBP07P2: TFMTBCDField;
    fmtbcdfldBP07P3: TFMTBCDField;
    fmtbcdfldBP07P4: TFMTBCDField;
    fmtbcdfldBP07P5: TFMTBCDField;
    fmtbcdfldBP07AllP: TFMTBCDField;
    agrgtfldBP07SumP1: TAggregateField;
    agrgtfldBP07SumP2: TAggregateField;
    agrgtfldBP07SumP3: TAggregateField;
    agrgtfldBP07SumP4: TAggregateField;
    agrgtfldBP07SumP5: TAggregateField;
    agrgtfldBP07SumAllP: TAggregateField;
    cdsCustomField: TClientDataSet;
    strngfldCustomFieldbPCSPerSet: TStringField;
    dsCustomField: TDataSource;
    rptdsCustomField: TfrxDBDataset;
    strngfldBP06IDKey: TStringField;
    strngfldBP06BPNO: TStringField;
    dtmfldBP06BPTime: TDateTimeField;
    intgrfldBP06EnableDays: TIntegerField;
    intgrfldBP06D10_Ptr: TIntegerField;
    intgrfldBP06D25_Ptr: TIntegerField;
    intgrfldBP06Layers: TIntegerField;
    cdsBP06Thickness: TFMTBCDField;
    intgrfldBP06D264_ptr: TIntegerField;
    strngfldBP06BP00_Ptr: TStringField;
    intgrfldBP06D01_Ptr: TIntegerField;
    cdsBP06CurRate: TFMTBCDField;
    strngfldBP06ORIG_CUSTOMER: TStringField;
    strngfldBP06payment: TStringField;
    intgrfldBP06SaleMan: TIntegerField;
    intgrfldBP06CreateMan: TIntegerField;
    dtmfldBP06CreateTime: TDateTimeField;
    cdsBP06YaHeTxt: TMemoField;
    cdsBP06YaHeImg: TBlobField;
    intgrfldBP06Seqno: TIntegerField;
    cdsBP06P1P2_Pcs: TFMTBCDField;
    cdsBP06P3P4P5_Pcs: TFMTBCDField;
    cdsBP06P1P2P3P4P5_Pcs: TFMTBCDField;
    cdsBP06P1P2_M: TFMTBCDField;
    cdsBP06P3P4P5_M: TFMTBCDField;
    cdsBP06P1P2P3P4P5_M: TFMTBCDField;
    cdsBP06baofeilv: TFMTBCDField;
    cdsBP06xiaoshouzhekou: TFMTBCDField;
    cdsBP06buhanshuijiage_Pcs: TFMTBCDField;
    cdsBP06hanshuijiage_Pcs: TFMTBCDField;
    cdsBP06buhanshuijiage_M: TFMTBCDField;
    cdsBP06hanshuijiage_M: TFMTBCDField;
    cdsBP06baofei_cost_pcs: TFMTBCDField;
    cdsBP06baofei_cost_M: TFMTBCDField;
    cdsBP06yunshu_cost_calcret: TFMTBCDField;
    cdsBP06yunshu_cost_pcs: TFMTBCDField;
    cdsBP06yunshu_cost_M: TFMTBCDField;
    cdsBP06xiaoshou_cost_calcret: TFMTBCDField;
    cdsBP06xiaoshou_cost_pcs: TFMTBCDField;
    cdsBP06xiaoshou_cost_M: TFMTBCDField;
    cdsBP06caiwu_cost_calcret: TFMTBCDField;
    cdsBP06caiwu_cost_pcs: TFMTBCDField;
    cdsBP06caiwu_cost_M: TFMTBCDField;
    cdsBP06guanli_cost_calcret: TFMTBCDField;
    cdsBP06guanli_cost_pcs: TFMTBCDField;
    cdsBP06guanli_cost_M: TFMTBCDField;
    cdsBP06zhekou_cost_pcs: TFMTBCDField;
    cdsBP06zhekou_cost_M: TFMTBCDField;
    cdsBP06AllCost_PCS: TFMTBCDField;
    cdsBP06AllCost_M: TFMTBCDField;
    cdsBP06maolilv_add: TFMTBCDField;
    cdsBP06zengzhishui_add: TFMTBCDField;
    cdsBP06chanpinyongtu_add: TFMTBCDField;
    cdsBP06xiaoshouquyu_add: TFMTBCDField;
    cdsBP06dingdanshuliang_add: TFMTBCDField;
    intgrfldBP06AuthStatus: TIntegerField;
    cdsBP06jinglilv_add: TFMTBCDField;
    strngfldBP06CUSTOMER_NAME: TStringField;
    strngfldBP06sale_man: TStringField;
    strngfldBP06MANU_PART_NUMBER: TStringField;
    strngfldBP06MANU_PART_DESC: TStringField;
    strngfldBP06ANALYSIS_CODE_3: TStringField;
    strngfldBP06create_man: TStringField;
    cdsBP06set_lngth: TBCDField;
    cdsBP06set_width: TBCDField;
    cdsBP06BPName: TWideStringField;
    strngfldBP06baojiadanwei: TStringField;
    strngfldBP06CURR_CODE: TStringField;
    strngfldBP06ANALYSIS_CODE_2: TStringField;
    strngfldCustomFieldbBPType: TStringField;
    cdsBP08MUsePrice_M: TFMTBCDField;
    cdsBP08SumBp08UserPrice_M: TAggregateField;
    cdsBP07SumAllP_M: TAggregateField;
    cdsBP07AllP_M: TFMTBCDField;
    cdsBP08Unit_Name: TStringField;
    cdsBP06beizhu: TStringField;
    cdsCustomFieldbSurface: TStringField;
    cdsBP09: TClientDataSet;
    dsBP09: TDataSource;
    frxDBBP09: TfrxDBDataset;
    cdsBP09DEPT_NAME: TStringField;
    cdsBP09PARAMETER_NAME: TStringField;
    cdsBP09PARAMETER_DESC: TStringField;
    cdsBP09Param_Value: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ABP06: string);
    procedure DesignRpt(ATag: Integer);
  end;

implementation

uses
  DataIntf, DBImpl;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmRpt }

procedure TdmRpt.DesignRpt(ATag: Integer);
var
  LFileName: string;
  LDesn: TfrxDesigner;
begin
  LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
               'BOMPriceRpt_1.fr3';
  LDesn := TfrxDesigner.Create(Self);
  try
    rpt1.Clear;
    rpt1.LoadFromFile(LFileName,True);
    rpt1.DesignReport();
  finally
    LDesn.Free;
  end;

end;

procedure TdmRpt.GetData(ABP06: string);
var
  LTmp: ITmp;
  LCds: TClientDataSet;
  LSql: string;
begin
  LTmp := TTmp.Create;
  LCds := TClientDataSet.Create(Self);
  try

    cds493.Data := LTmp.SqlOpen('select * from data0493');
    //BP06
    LSql := ' SELECT BP06.*,d05_1.EMPLOYEE_NAME as sale_man,d25.MANU_PART_NUMBER, ' +
            ' d25.ANALYSIS_CODE_3,d05_2.EMPLOYEE_NAME as create_man, ' +
            ' d25.set_lngth,d25.set_width,bp00.BPName,''PCS'' as baojiadanwei, ' +
            ' d01.CURR_CODE ' +
            ' FROM BOMPrice06 BP06 ' +
            ' LEFT JOIN data0010 d10 on d10.RKEY = BP06.d10_Ptr ' +
            ' LEFT JOIN data0005 d05_1 ON d05_1.RKEY = BP06.saleman ' +
            ' LEFT JOIN data0005 d05_2 ON d05_2.RKEY = BP06.createman ' +
            ' LEFT JOIN data0025 d25 ON BP06.D25_Ptr = d25.RKEY ' +
            ' LEFT JOIN BOMPrice00 bp00 ON BP06.BP00_Ptr = bp00.IDKey ' +
            ' LEFT JOIN data0001 d01 ON d01.RKEY = bp06.D01_Ptr ' +
            ' where bp06.idkey = ' + QuotedStr(ABP06);
    cdsBP06.Data := LTmp.SqlOpen(LSql);

    //bp10全局参数
    LSql := ' SELECT d278.PARAMETER_NAME,d278.PARAMETER_DESC,bp10.Param_Value,d02.UNIT_CODE FROM BOMPrice10 bp10 ' +
            ' INNER JOIN Data0278 d278 ON d278.RKEY = bp10.D278_ptr ' +
            ' INNER JOIN data0002 d02 ON d02.RKEY = d278.UNIT_PTR ' +
            ' where bp06_ptr = ' + QuotedStr(ABP06)+
            ' order by d278.rkey asc';
    cdsB10.Data := LTmp.SqlOpen(LSql);

    //BP08主要材料
    LSql := ' SELECT d02.Unit_Name,d496.GROUP_DESC, d17.INV_NAME, d23.ABBR_NAME,d17.INV_PART_DESCRIPTION,BP08.MStdPrice,bp08.MUsePerPcs,BP08.MUsePrice,bp08.MUsePrice_M FROM BOMPrice08 BP08 ' +
            ' INNER JOIN data0017 d17 ON d17.RKEY = BP08.D17_ptr ' +
            ' INNER JOIN data0028 d28 ON d28.RKEY = BP08.D28_ptr ' +
            ' INNER JOIN data0496 d496 ON d496.RKEY = BP08.D496_ptr ' +
            ' INNER JOIN data0023 d23 on d23.RKEY = d28.SUPPLIER_PTR ' +
            ' INNER JOIN data0002 d02 on d02.rkey = d17.PURCH_UNIT_PTR ' +
            ' where bp08.bp06_ptr = ' + QuotedStr(ABP06)+
            ' ORDER by BP08.Step_number ASC,BP08.selforder ASC ';
    cdsBP08.Data := LTmp.SqlOpen(LSql);

    //拼版
    LSql := 'select * from bomprice11 where bp06_ptr = ' + QuotedStr(ABP06);
    cdsBP11.Data := LTmp.SqlOpen(LSql);

    //BP07工序
    LSql := ' SELECT d34.DEPT_NAME,bp07.P1,bp07.P2,bp07.P3,bp07.P4,bp07.P5,bp07.AllP,bp07.AllP_M FROM bomprice07 bp07 ' +
            ' INNER JOIN data0034 d34 ON d34.RKEY = bp07.D34_ptr ' +
            ' WHERE bp07.AllP > 0.000000000001 and bp07.bp06_ptr = ' + QuotedStr(ABP06)+
            ' ORDER BY bp07.Selforder ASC ';
    cdsBP07.Data := LTmp.SqlOpen(LSql);

    //BP09工序的参数
    LSql := ' SELECT d34.DEPT_NAME,d278.PARAMETER_NAME,d278.PARAMETER_DESC,bp09.Param_Value ' +
            ' FROM bomprice07 bp07 ' +
' INNER JOIN data0034 d34 ON d34.RKEY = bp07.D34_ptr ' +
' INNER JOIN BOMPrice09 bp09 ON bp09.BP07_ptr = bp07.IDKey ' +
' INNER JOIN Data0278 d278 ON d278.RKEY = bp09.D278_ptr ' +
' WHERE bp07.AllP > 0.000000000001 and bp07.bp06_ptr = ' + QuotedStr(ABP06) +
' ORDER BY bp07.Selforder ASC ';
    cdsBP09.Data := LTmp.SqlOpen(LSql);

    //自定义字段
    cdsCustomField.CreateDataSet;
    LSql := ' SELECT d278.PARAMETER_NAME,d278.PARAMETER_DESC,bp10.Param_Value,d02.UNIT_CODE FROM BOMPrice10 bp10 ' +
            ' INNER JOIN Data0278 d278 ON d278.RKEY = bp10.D278_ptr ' +
            ' INNER JOIN data0002 d02 ON d02.RKEY = d278.UNIT_PTR ' +
            ' where bp06_ptr = ' + QuotedStr(ABP06)+ ' and d278.PARAMETER_NAME IN (' + QuotedStr('bPCSPerSet') + ',' + QuotedStr('bBPType') + ',' + QuotedStr('bSurface') + ') and BomPriceType in (1,2)' +
            ' order by d278.rkey asc';
    LCds.Data := LTmp.SqlOpen(LSql);
    if not LCds.IsEmpty then
    begin
      cdsCustomField.Append;
      if LCds.Locate('PARAMETER_NAME','bPCSPerSet',[loCaseInsensitive]) then
      begin
        cdsCustomField.FieldByName('bPCSPerSet').AsString := LCds.FieldByName('Param_Value').AsString;
      end;
      if LCds.Locate('PARAMETER_NAME','bBPType',[loCaseInsensitive]) then
      begin
        cdsCustomField.FieldByName('bBPType').AsString := LCds.FieldByName('Param_Value').AsString;
      end;
      if LCds.Locate('PARAMETER_NAME','bSurface',[loCaseInsensitive]) then
      begin
        cdsCustomField.FieldByName('bSurface').AsString := LCds.FieldByName('Param_Value').AsString;
      end;
      cdsCustomField.Post;
    end;

  finally
    LCds.Free;
  end;
end;


end.
