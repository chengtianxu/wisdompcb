unit BOMBaoJiaEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, RzButton, ExtCtrls, RzPanel, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, DM, DataIntf, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit,
  RzLabel, Vcl.ComCtrls, RzDTP, RzDBDTP, Vcl.Buttons, RzRadGrp, RzDBRGrp,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.Menus, Vcl.DBCtrls, RzCmboBx, RzDBLbl, EhLibVCL,
  System.Generics.Collections, Bde.DBTables;

type
  TfrmEditBOMBaoJia = class(TForm)
    pnl1: TRzPanel;
    btnSvae: TRzButton;
    btnExit: TRzButton;
    cdsBP06: TClientDataSet;
    dsBP06: TDataSource;
    strngfldBP06IDKey: TStringField;
    strngfldBP06BPNO: TStringField;
    dtmfldBP06BPTime: TDateTimeField;
    intgrfldBP06EnableDays: TIntegerField;
    intgrfldBP06D10_Ptr: TIntegerField;
    intgrfldBP06D25_Ptr: TIntegerField;
    fmtbcdfldBP06Thickness: TFMTBCDField;
    intgrfldBP06D01_Ptr: TIntegerField;
    fmtbcdfldBP06CurRate: TFMTBCDField;
    intgrfldBP06SaleMan: TIntegerField;
    intgrfldBP06CreateMan: TIntegerField;
    dtmfldBP06CreateTime: TDateTimeField;
    mfldBP06YaHeTxt: TMemoField;
    blbfldBP06YaHeImg: TBlobField;
    cdsLookup10: TClientDataSet;
    cdsLookUp05: TClientDataSet;
    cdsLookUp01: TClientDataSet;
    strngfldLookup10CUST_CODE: TStringField;
    atncfldLookup10RKEY: TAutoIncField;
    strngfldLookup10CUSTOMER_NAME: TStringField;
    atncfldLookUp05RKEY: TAutoIncField;
    strngfldLookUp05EMPL_CODE: TStringField;
    strngfldLookUp05EMPLOYEE_NAME: TStringField;
    atncfldLookUp01RKEY: TAutoIncField;
    strngfldLookUp01CURR_CODE: TStringField;
    strngfldLookUp01CURR_NAME: TStringField;
    strngfldBP06cust_code: TStringField;
    intgrfldBP06Seqno: TIntegerField;
    strngfldBP06curr_name: TStringField;
    strngfldBP06salemanname: TStringField;
    cdsBP10: TClientDataSet;
    dsBP10: TDataSource;
    strngfldBP10IDKey: TStringField;
    strngfldBP10BP06_ptr: TStringField;
    strngfldBP10Param_Value: TStringField;
    intgrfldBP10D278_ptr: TIntegerField;
    strngfldBP10param_name: TStringField;
    strngfldBP10param_desc: TStringField;
    strngfldBP10datetype: TStringField;
    pm10: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    cdsBP11: TClientDataSet;
    dsBP11: TDataSource;
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
    strngfldBP07IDKey: TStringField;
    intgrfldBP07D34_ptr: TIntegerField;
    strngfldBP07BP06_ptr: TStringField;
    intgrfldBP07BeiShu: TIntegerField;
    intgrfldBP07Selforder: TIntegerField;
    strngfldBP07dept_code: TStringField;
    strngfldBP07dept_name: TStringField;
    pmbp07: TPopupMenu;
    mniN4: TMenuItem;
    mniN6: TMenuItem;
    cdsBP08: TClientDataSet;
    dsBP08: TDataSource;
    strngfldBP08IDKey: TStringField;
    strngfldBP08BP06_ptr: TStringField;
    strngfldBP08BP07_ptr: TStringField;
    intgrfldBP08D496_ptr: TIntegerField;
    intgrfldBP08D17_ptr: TIntegerField;
    strngfldBP08calcstr: TStringField;
    strngfldBP08MGroupname: TStringField;
    strngfldBP08MGroupDesc: TStringField;
    strngfldBP08MName: TStringField;
    mniN7: TMenuItem;
    opdg1: TOpenDialog;
    strngfldBP06manu_part_number: TStringField;
    strngfldBP06Pricetypename: TStringField;
    intgrfldBP08D34_ptr: TIntegerField;
    strngfldBP08dept_code: TStringField;
    strngfldBP08dept_name: TStringField;
    intgrfldBP08selforder: TIntegerField;
    fmtbcdfldBP08MUsePerPcs: TFMTBCDField;
    fmtbcdfldBP08MUsePrice: TFMTBCDField;
    fmtbcdfldBP08MStdPrice: TFMTBCDField;
    fmtbcdfldBP07AllP: TFMTBCDField;
    fltfldLookUp01BASE_TO_OTHER: TFloatField;
    fltfldBP06curr_rate: TFloatField;
    strngfldBP06bp00_ptr: TStringField;
    fmtbcdfldBP07P1: TFMTBCDField;
    fmtbcdfldBP07P2: TFMTBCDField;
    fmtbcdfldBP07P3: TFMTBCDField;
    fmtbcdfldBP07P4: TFMTBCDField;
    fmtbcdfldBP07P5: TFMTBCDField;
    strngfldBP07P2CalcStr: TStringField;
    strngfldBP07P3CalcStr: TStringField;
    strngfldBP07P4CalcStr: TStringField;
    strngfldBP07P5CalcStr: TStringField;
    pmbp08: TPopupMenu;
    mniN5: TMenuItem;
    fmtbcdfldBP06P1P2_Pcs: TFMTBCDField;
    fmtbcdfldBP06P3P4P5_Pcs: TFMTBCDField;
    fmtbcdfldBP06P1P2P3P4P5_Pcs: TFMTBCDField;
    fmtbcdfldBP06P1P2_M: TFMTBCDField;
    fmtbcdfldBP06P3P4P5_M: TFMTBCDField;
    fmtbcdfldBP06P1P2P3P4P5_M: TFMTBCDField;
    fmtbcdfldBP06baofeilv: TFMTBCDField;
    fmtbcdfldBP06xiaoshouzhekou: TFMTBCDField;
    fmtbcdfldBP06buhanshuijiage_Pcs: TFMTBCDField;
    fmtbcdfldBP06hanshuijiage_Pcs: TFMTBCDField;
    fmtbcdfldBP06buhanshuijiage_M: TFMTBCDField;
    fmtbcdfldBP06hanshuijiage_M: TFMTBCDField;
    strngfldBP06ORIG_CUSTOMER: TStringField;
    strngfldBP06PayMent: TStringField;
    intgrfldBP08beishu: TIntegerField;
    intgrfldBP06d264_ptr: TIntegerField;
    strngfldBP06ShenPiLiuCheng: TStringField;
    intgrfldBP06AuthStatus: TIntegerField;
    intgrfldBP08d28_ptr: TIntegerField;
    intgrfldBP08step_number: TIntegerField;
    fmtbcdfldBP06AllCost_M: TFMTBCDField;
    fmtbcdfldBP06zengzhishui_add: TFMTBCDField;
    fmtbcdfldBP06chanpinyongfu_add: TFMTBCDField;
    fmtbcdfldBP06xiaoshouquyu_add: TFMTBCDField;
    fmtbcdfldBP06dingdanshuliang_add: TFMTBCDField;
    fmtbcdfldBP06baofei_cost_pcs: TFMTBCDField;
    fmtbcdfldBP06baofei_cost_M: TFMTBCDField;
    fmtbcdfldBP06yunshu_cost_pcs: TFMTBCDField;
    fmtbcdfldBP06yunshu_cost_M: TFMTBCDField;
    fmtbcdfldBP06xiaoshou_cost_pcs: TFMTBCDField;
    fmtbcdfldBP06xiaoshou_cost_M: TFMTBCDField;
    fmtbcdfldBP06caiwu_cost_pcs: TFMTBCDField;
    fmtbcdfldBP06caiwu_cost_M: TFMTBCDField;
    fmtbcdfldBP06guanli_cost_pcs: TFMTBCDField;
    fmtbcdfldBP06guanli_cost_M: TFMTBCDField;
    fmtbcdfldBP06zhekou_cost_pcs: TFMTBCDField;
    fmtbcdfldBP06zhekou_cost_M: TFMTBCDField;
    intgrfldBP10ttype: TIntegerField;
    cdsBP10_Sale: TClientDataSet;
    dsBP10_Sale: TDataSource;
    strngfldBP10_SaleIDKey: TStringField;
    strngfldBP10_SaleBP06_ptr: TStringField;
    strngfldBP10_SaleParam_Value: TStringField;
    intgrfldBP10_SaleD278_ptr: TIntegerField;
    strngfldBP10_Saleparam_name: TStringField;
    strngfldBP10_Saleparam_desc: TStringField;
    strngfldBP10_Saledatetype: TStringField;
    intgrfldBP10_Salettype: TIntegerField;
    fmtbcdfldBP06yunshu_cost_calcret: TFMTBCDField;
    fmtbcdfldBP06xiaoshou_cost_calcret: TFMTBCDField;
    fmtbcdfldBP06caiwu_cost_calcret: TFMTBCDField;
    fmtbcdfldBP06guanli_cost_calcret: TFMTBCDField;
    fltfldBP06PAllAndBaoFei_Pcs: TFloatField;
    fltfldBP06PAllAndBaoFei_M: TFloatField;
    fltfldBP06Base_1_pcs: TFloatField;
    fmtbcdfldBP06jinglilv_add: TFMTBCDField;
    fmtbcdfldBP07zhekou_cost_pcs: TFMTBCDField;
    cdsBP08zhekou_cost_pcs: TFMTBCDField;
    strngfldBP08INV_PART_NUMBER: TStringField;
    strngfldBP08SUPPLIER_NAME: TStringField;
    fltfldBP08PRICE_1: TFloatField;
    dtmfldBP08TDATE: TDateTimeField;
    strngfldBP06Manu_part_desc: TStringField;
    strngfldBP06ANALYSIS_CODE_2: TStringField;
    strngfldBP06Customer_Name: TStringField;
    fltfldBP06AllYuJiMaoLiLv: TFloatField;
    cdsAllBomDept: TClientDataSet;
    dsAllBomDept: TDataSource;
    strngfldAllBomDeptIDKey: TStringField;
    intgrfldAllBomDeptD34_ptr: TIntegerField;
    strngfldAllBomDeptBP06_ptr: TStringField;
    intgrfldAllBomDeptBeiShu: TIntegerField;
    intgrfldAllBomDeptSelforder: TIntegerField;
    strngfldAllBomDeptdept_code: TStringField;
    strngfldAllBomDeptdept_name: TStringField;
    strngfldBP06BeiZhu: TStringField;
    pnl14: TPanel;
    pnl31: TPanel;
    pnl32: TPanel;
    spl7: TSplitter;
    pnl34: TPanel;
    pgcBom: TPageControl;
    tsAllParam: TTabSheet;
    tsDept: TTabSheet;
    tsAllBom: TTabSheet;
    pgcMI: TPageControl;
    ts4: TTabSheet;
    ts5: TTabSheet;
    pnl35: TPanel;
    pnl29: TPanel;
    btnReadMIStep: TSpeedButton;
    tvMI: TTreeView;
    pnl36: TPanel;
    spl8: TSplitter;
    lbl13: TLabel;
    pnl18: TPanel;
    spl3: TSplitter;
    pnl19: TPanel;
    lbl54: TLabel;
    ehAllParamSale: TDBGridEh;
    pnl17: TPanel;
    lbl37: TLabel;
    ehAllParamMI: TDBGridEh;
    pnl33: TRzPanel;
    pnl3: TRzPanel;
    btn8: TRzButton;
    btnLoadCut: TRzButton;
    pg1: TRzPageControl;
    tsTabSheet1: TRzTabSheet;
    img1: TImage;
    tsTabSheet2: TRzTabSheet;
    img2: TImage;
    tsTabSheet3: TRzTabSheet;
    img3: TImage;
    pnl4: TRzPanel;
    eh2: TDBGridEh;
    spl1: TSplitter;
    pnl5: TRzPanel;
    lbl16: TRzLabel;
    ehBP08: TDBGridEh;
    ehDeptParam: TDBGridEh;
    pnl11: TRzPanel;
    lbl38: TRzLabel;
    btnDeptBom: TSpeedButton;
    cbxDeptBomType: TRzComboBox;
    pg2: TRzPageControl;
    tsTabSheet4: TRzTabSheet;
    pnl7: TRzPanel;
    btn9: TRzButton;
    mmoYaHeTxt: TRzDBMemo;
    tsTabSheet5: TRzTabSheet;
    imgYaHe: TImage;
    pnl6: TRzPanel;
    btn10: TRzButton;
    chk1: TCheckBox;
    btn11: TRzButton;
    pnl20: TPanel;
    lbl66: TLabel;
    eh5: TDBGridEh;
    spl2: TSplitter;
    pnl21: TPanel;
    pnl23: TPanel;
    ehAllBomDept: TDBGridEh;
    tsAllCalc: TTabSheet;
    pnl16: TPanel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lblbaofei_cost_M: TDBText;
    lblbaofei_cost_pcs: TDBText;
    lblyunshu_cost_M: TDBText;
    lblyunshu_cost_pcs: TDBText;
    lblxiaoshou_cost_M: TDBText;
    lblxiaoshou_cost_pcs: TDBText;
    lblcaiwu_cost_pcs: TDBText;
    lblcaiwu_cost_M: TDBText;
    lblguanli_cost_pcs: TDBText;
    lblguanli_cost_M: TDBText;
    lblzhekou_cost_M1: TDBText;
    lblyunshu_cost_calcret: TDBText;
    lblxiaoshou_cost_calcret: TDBText;
    lblcaiwu_cost_calcret: TDBText;
    lblguanli_cost_calcret: TDBText;
    lblzhekou_cost_M: TDBText;
    lblzhekou_cost_pcs: TDBText;
    lbl30: TLabel;
    lbl20: TLabel;
    shp6: TShape;
    lbl62: TLabel;
    lbl63: TLabel;
    lbl64: TLabel;
    lbl65: TLabel;
    shp7: TShape;
    btn14: TRzButton;
    ts7: TTabSheet;
    pnl2: TRzPanel;
    lbl67: TLabel;
    btn1: TRzButton;
    btn2: TRzButton;
    tsCalcBom: TTabSheet;
    eh6: TDBGridEh;
    pnl8: TRzPanel;
    lbl19: TLabel;
    btn12: TRzButton;
    btn15: TRzButton;
    cdsBP09: TClientDataSet;
    strngfld1: TStringField;
    strngfld2: TStringField;
    strngfld3: TStringField;
    intgrfld1: TIntegerField;
    strngfld4: TStringField;
    strngfld5: TStringField;
    strngfld6: TStringField;
    strngfld7: TStringField;
    dsBP09: TDataSource;
    ehBP09: TDBGridEh;
    pnl25: TRzPanel;
    lbl17: TRzLabel;
    btnAllBomPickBom: TSpeedButton;
    cbxAllBomDeptBomType: TRzComboBox;
    pnl24: TPanel;
    btn16: TSpeedButton;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl25: TLabel;
    edtbaofeilv: TDBEdit;
    edtd: TDBEdit;
    edtd1: TDBEdit;
    edtd2: TDBEdit;
    edtd3: TDBEdit;
    edtd4: TDBEdit;
    edtd5: TDBEdit;
    lbl47: TLabel;
    lblP1P2_M1: TDBText;
    lbl48: TLabel;
    lblP3P4P5_M1: TDBText;
    lbl49: TLabel;
    lblbaofei_cost_M1: TDBText;
    lbl69: TLabel;
    lbl70: TLabel;
    edtP1P2_M: TDBEdit;
    edtP3P4P5_M: TDBEdit;
    lbl58: TLabel;
    lblAllYuJiMaoLiLv: TDBText;
    bvl1: TBevel;
    lbl72: TLabel;
    lbl34: TLabel;
    edtPAllAndBaoFei_Pcs: TDBEdit;
    lbl50: TLabel;
    lbl35: TLabel;
    lbl73: TLabel;
    edtbuhanshuijiage_Pcs1: TRzDBEdit;
    edtbuhanshuijiage_M1: TRzDBEdit;
    lbl75: TLabel;
    edthanshuijiage_Pcs1: TRzDBEdit;
    edthanshuijiage_M1: TRzDBEdit;
    intgrfldBP09d34_ptr: TIntegerField;
    strngfldBP09dept_name: TStringField;
    eh7: TDBGridEh;
    lbldingdanshuliang_add: TDBText;
    lblcurr_name: TDBText;
    lblzengzhishui_add: TDBText;
    btnViewMI: TSpeedButton;
    tsDrll: TTabSheet;
    eh3: TDBGridEh;
    cdsD29: TClientDataSet;
    dsD29: TDataSource;
    mmoBeiZhu: TDBMemo;
    updtsql1: TUpdateSQL;
    tsBaseInfo: TTabSheet;
    lbl4: TRzLabel;
    edtcust_code: TRzDBEdit;
    lbl44: TRzLabel;
    edtcustomerName: TRzDBEdit;
    lbl22: TRzLabel;
    edtsalemanname1: TRzDBEdit;
    lbl11: TRzLabel;
    edtcurr_name: TRzDBEdit;
    lbl23: TRzLabel;
    edtORIG_CUSTOMER: TRzDBEdit;
    lbl14: TRzLabel;
    edtsalemanname: TRzDBEdit;
    lbl8: TRzLabel;
    edtsalemanname2: TRzDBEdit;
    lbl5: TRzLabel;
    edtManu_Part_desc: TRzDBEdit;
    lbl10: TRzLabel;
    edtANALYSIS_CODE_2: TRzDBEdit;
    lbl21: TRzLabel;
    edtcust_code1: TRzDBEdit;
    lbl24: TRzLabel;
    edtORIG_CUSTOMER1: TRzDBEdit;
    lbl31: TRzLabel;
    edtORIG_CUSTOMER2: TRzDBEdit;
    strngfldBP06CustomContectPeop: TStringField;
    strngfldBP06CustomContectPhone: TStringField;
    strngfldBP06CustomContectEmail: TStringField;
    strngfldBP06Rpt_GongChengFei: TStringField;
    strngfldBP06Rpt_KaiLaFei: TStringField;
    strngfldBP06Rpt_MojuFei: TStringField;
    strngfldBP06Rpt_CeShiJiaFei: TStringField;
    strngfldBP06Rpt_ZuiXiaoDingDanShu: TStringField;
    strngfldBP06Rpt_CeShiFei: TStringField;
    strngfldBP06Rpt_ZhiBanFei: TStringField;
    grp1: TGroupBox;
    edtManu_part_desc1: TRzDBEdit;
    lbl32: TRzLabel;
    edtRpt_GongChengFei: TRzDBEdit;
    lbl51: TRzLabel;
    edtRpt_GongChengFei1: TRzDBEdit;
    lbl52: TRzLabel;
    grp2: TGroupBox;
    lbl33: TRzLabel;
    lbl36: TRzLabel;
    lbl45: TRzLabel;
    lbl46: TRzLabel;
    edtManu_part_desc2: TRzDBEdit;
    edtManu_part_desc3: TRzDBEdit;
    edtManu_part_desc4: TRzDBEdit;
    edtManu_part_desc5: TRzDBEdit;
    edtRpt_CeShiFei: TRzDBEdit;
    lbl55: TRzLabel;
    edtRpt_CeShiFei1: TRzDBEdit;
    lbl56: TRzLabel;
    strngfldBP06Rpt_YangpinShu: TStringField;
    strngfldBP06Rpt_YangpinMianji: TStringField;
    edtcurr_name1: TRzDBEdit;
    lbl9: TRzLabel;
    lbl6: TRzLabel;
    dtpBPTime: TRzDBDateTimePicker;
    edtEnableDays: TRzDBEdit;
    lbl2: TRzLabel;
    lbl53: TRzLabel;
    lbl3: TRzLabel;
    edtManuPartNum: TEdit;
    btn3: TSpeedButton;
    lbl1: TLabel;
    lbl7: TLabel;
    lbl57: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl12: TLabel;
    lbl18: TLabel;
    lbl61: TLabel;
    lblcurr_name1: TDBText;
    lbl68: TLabel;
    lbl15: TLabel;
    lblBenBiPrice: TLabel;
    lbl71: TLabel;
    lblBenBiPriceM: TLabel;
    cdsBP09Color: TStringField;
    lbl: TLabel;
    RzDBEdit1: TRzDBEdit;
    lbl74: TLabel;
    RzDBLabel1: TRzDBLabel;
    cdsBP06OrignPrice: TFMTBCDField;
    cdsBP06OrignZL: TFloatField;
    lbl76: TLabel;
    lblredline: TRzDBLabel;
    cdsBP06ReadLine: TFMTBCDField;
    edtOrignPrice_M: TRzDBEdit;
    fmtbcdfldBP06OrignPrice_M: TFMTBCDField;
    cdsBP06完成板厚mm: TStringField;
    cdsBP06bPCSPerSet: TStringField;
    cdsBP06bSet_L: TStringField;
    cdsBP06bSet_W: TStringField;
    cdsBP06bSurface: TStringField;
    cdsBP06bBPType: TStringField;
    cdsBP06bUseAge: TStringField;
    fltfldLookUp01QTE_BASE_TO_OTHER: TFloatField;
    fmtbcdfldBP06P1_M: TFMTBCDField;
    fmtbcdfldBP06P1_Pcs: TFMTBCDField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn22Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btnSvaeClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure cdsBP10AfterScroll(DataSet: TDataSet);
    procedure cdsBP10AfterPost(DataSet: TDataSet);
    procedure btn8Click(Sender: TObject);
    procedure cdsBP07AfterScroll(DataSet: TDataSet);
    procedure mniN4Click(Sender: TObject);
    procedure mniN6Click(Sender: TObject);
    procedure mniN7Click(Sender: TObject);
    procedure pmbp07Popup(Sender: TObject);
    procedure cdsBP09AfterScroll(DataSet: TDataSet);
    procedure eh3Columns2EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure cdsBP08CalcFields(DataSet: TDataSet);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure cdsBP06CalcFields(DataSet: TDataSet);
    procedure btn12Click(Sender: TObject);
    procedure ehParamGlobMIEnter(Sender: TObject);
    procedure cdsBP09AfterPost(DataSet: TDataSet);
    procedure btn13Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btnDeptBomClick(Sender: TObject);
    procedure mniN5Click(Sender: TObject);
    procedure pmbp08Popup(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure edthanshuijiage_PcsKeyPress(Sender: TObject; var Key: Char);
    procedure btn18Click(Sender: TObject);
    procedure btn19Click(Sender: TObject);
    procedure btnLoadCutClick(Sender: TObject);
    procedure edtmaolilvKeyPress(Sender: TObject; var Key: Char);
    procedure edtbuhanshuijiage_PcsKeyPress(Sender: TObject; var Key: Char);
    procedure cdsBP10_SaleAfterScroll(DataSet: TDataSet);
    procedure btn16Click(Sender: TObject);
    procedure cdsAllBomDeptAfterScroll(DataSet: TDataSet);
    procedure btnAllBomPickBomClick(Sender: TObject);
    procedure btnReadMIDepeParamClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnReadMIStepClick(Sender: TObject);
    procedure tvMIChange(Sender: TObject; Node: TTreeNode);
    procedure pgcBomChange(Sender: TObject);
    procedure btnViewMIClick(Sender: TObject);
    procedure cdsBP09CalcFields(DataSet: TDataSet);
    procedure ehBP09DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RzDBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FArrAfterScrollEvent: array of TDataSetNotifyEvent;
    FArrFilterStr: array of string;
    FArrFilterB: array of Boolean;
    FDSList: TList<TDataSet>;

    IBP06: IBOMPrice06;
    IBP10: IData;
    IBP10_Sale: IData;
    IBP11: IData;
    IBP07: IData;
    IBP09: IData;
    IBP08: IData;
    function CallPCBCut: Boolean;
    //function LocketByParamName(ADS: TClientDataSet;AParamName: string ): Boolean;
    procedure ReCalcByMaoLiLv(ASetW,ASetH: Double;ApostBy: Integer= 0);
    procedure DisableAllDS(ADSList: TList<TDataSet>);
    procedure EnableAllDS(ADSList: TList<TDataSet>);
    procedure InlineLoadCustInfo(ARkey10: string);
  public
    { Public declarations }
    FReadOnly: Boolean;
    FBCopy: Boolean;
    FIDKey: string;
    procedure GetData();
    procedure GetCopyData();
    procedure GetNewAddParam;//添加后来新增的全局和流程参数
    procedure AddBP06;
    procedure GetLookUpdata;
    function AddBOMDept(Adept_ptr: string; ABeiShu: Integer;AInsert: Boolean = False;ARestOrder: Boolean = True): string;
    procedure LoadFromPriceType(ABP00_ptr: string);
    function LoadCutParam(ARkey25: Integer): Boolean;
    function GetPcsSq: Double;
  end;

var
  frmEditBOMBaoJia: TfrmEditBOMBaoJia;

implementation
uses
  DBImpl, WZ_gUnit, Pick_Item_Single, BOMBaoJiaDeptAddParamFrm, System.IniFiles,
  Vcl.Imaging.jpeg, AddTypeDeptFrm, CalcIntf,CalcImpl, BOMBaoJiaInputPCsSize;
{$R *.dfm}

{ TfrmEditBOMBaoJia }
const
  SET_W = 'F ';
  SET_H = 'G ';
  PNLA_W = '6 ';
  PNLA_H = '7 ';
  SheetUseage = '5 ';
  JiaoHuo_W = 'SL';
  JiaoHuo_H = 'SW';
  TotalPcs = 'P ';
  PCSPerSet_A = 'JN';
  PnlA_Count = '1 ';
  PnlB_Count = '2 ';
  PnlA_SetCount = '3 ';
  PnlB_SetCount = '4 ';


function TfrmEditBOMBaoJia.AddBOMDept(Adept_ptr: string; ABeiShu: Integer;AInsert: Boolean = False;ARestOrder: Boolean = True): string;
var
  LCds: TClientDataSet;
  Ltmp: ITmp;
  LIDKeyBp02: string;
  Lbp07key: string;
  LSql: string;
begin
  LCds := TClientDataSet.Create(Self);
  Ltmp := TTmp.Create;
  try

    //bp07
    LCds.Data := Ltmp.SqlOpen('select * from bomprice02 where d34_ptr = ' + Adept_ptr);
    LIDKeyBp02 := LCds.FieldByName('idkey').AsString;
    if AInsert then
    begin
      cdsBP07.Insert;
    end else
    begin
      cdsBP07.Append;
    end;
    Lbp07key := IBP07.CreateKeyID;
    Result := Lbp07key;
    cdsBP07.FieldByName('IDKey').AsString := Lbp07key;
    cdsBP07.FieldByName('D34_ptr').AsString := Adept_ptr;
    cdsBP07.FieldByName('BP06_ptr').AsString := FIDKey;
    cdsBP07.FieldByName('BeiShu').AsInteger := ABeiShu;
    cdsBP07.FieldByName('p2calcstr').AsString := LCds.FieldByName('p2').AsString;
    cdsBP07.FieldByName('p3calcstr').AsString := LCds.FieldByName('p3').AsString;
    cdsBP07.FieldByName('p4calcstr').AsString := LCds.FieldByName('p4').AsString;
    cdsBP07.FieldByName('p5calcstr').AsString := LCds.FieldByName('p5').AsString;
    cdsBP07.FieldByName('selforder').AsInteger := 9999;
    cdsBP07.Post;
    if ARestOrder then
    begin

      cdsBP07.First;
      while not cdsBP07.Eof do
      begin
        cdsBP07.Edit;
        cdsBP07.FieldByName('selforder').AsInteger := cdsBP07.RecNo;
        cdsBP07.Post;
        cdsBP07.Next;
      end;
      cdsBP07.Locate('idkey',Lbp07key,[loCaseInsensitive]);

    end;
    //bp09
    LCds.Data := Ltmp.SqlOpen('select * from bomprice03 where bp02_ptr= ' + QuotedStr(LIDKeyBp02));
    while not LCds.Eof do
    begin
      cdsBP09.Append;
      cdsBP09.FieldByName('IDKey').AsString := IBP09.CreateKeyID;
      cdsBP09.FieldByName('BP06_ptr').AsString := FIDKey;
      cdsBP09.FieldByName('BP07_ptr').AsString := Lbp07key;
      cdsBP09.FieldByName('d34_ptr').AsString := Adept_ptr;
      cdsBP09.FieldByName('D278_ptr').AsInteger := lcds.FieldByName('d278_ptr').AsInteger;
      cdsBP09.FieldByName('Param_Value').AsString := LCds.FieldByName('Param_Value').AsString;
      cdsBP09.Post;
      LCds.Next;
    end;

    //bp08
    LSql := ' select bp15.*,bp04.calcstr,bp01.selforder from bomprice15 bp15 ' +
            ' inner join bomprice01 bp01 on bp01.idkey = bp15.bp01_ptr ' +
            ' inner join bomprice04 bp04 on bp04.d34_ptr = bp15.d34_ptr and bp04.d496_ptr = bp15.d496_ptr ' +
            ' where bp15.bp00_ptr= ' + QuotedStr(cdsBP06.FieldByName('bp00_ptr').AsString) + ' and bp15.d34_ptr = ' + Adept_ptr;
    LCds.Data := Ltmp.SqlOpen(LSql);
    while not LCds.Eof do
    begin
      cdsBP08.Append;
      cdsBP08.FieldByName('IDKey').AsString := IBP08.CreateKeyID;
      cdsBP08.FieldByName('BP06_ptr').AsString := FIDKey;
      cdsBP08.FieldByName('BP07_ptr').AsString := Lbp07key;
      cdsBP08.FieldByName('D496_ptr').AsInteger := lcds.FieldByName('D496_ptr').AsInteger;
      cdsBP08.FieldByName('d17_ptr').AsInteger := lcds.FieldByName('d17_ptr').AsInteger;
      cdsBP08.FieldByName('d28_ptr').AsInteger := lcds.FieldByName('d28_ptr').AsInteger;
      cdsBP08.FieldByName('step_number').AsInteger := LCds.FieldByName('selforder').AsInteger;
      cdsBP08.FieldByName('d34_ptr').AsString := Adept_ptr;
      cdsBP08.FieldByName('calcstr').AsString := lcds.FieldByName('calcstr').AsString;
      cdsBP08.FieldByName('selforder').AsInteger := cdsBP08.RecordCount + 1;
      cdsBP08.FieldByName('beishu').AsInteger := lcds.FieldByName('beishu').AsInteger;
      cdsBP08.Post;
      LCds.Next;
    end;

  finally
    LCds.Free;
  end;

end;

procedure TfrmEditBOMBaoJia.AddBP06;
var
  LSvrTime: TDateTime;
  LSeqNo: Integer;
begin
  LSvrTime := dm1.GetSvrNowTime;
  FIDKey := IBP06.CreateKeyID;
  cdsBP06.Append;
  cdsBP06.FieldByName('idkey').AsString := FIDKey;
  cdsBP06.FieldByName('BPNO').AsString := IBP06.CreateBPNO(LSeqNo);
  cdsBP06.FieldByName('seqno').AsInteger := -1;
  cdsBP06.FieldByName('BPTime').AsDateTime := LSvrTime;
  cdsBP06.FieldByName('EnableDays').AsInteger := 30;
  cdsBP06.Post;
end;

procedure TfrmEditBOMBaoJia.btn10Click(Sender: TObject);
var
  LJPEG: TJPEGImage;
begin
  if opdg1.Execute then
  begin
    if opdg1.FileName <> '' then
    begin
      LJPEG := TJPEGImage.Create;
      try
        try
          if LowerCase(ExtractFileExt(opdg1.FileName)) = '.bmp' then
          begin
            imgYaHe.Picture.LoadFromFile(opdg1.FileName);
          end;
          if (LowerCase(ExtractFileExt(opdg1.FileName)) = '.jpg') or (LowerCase(ExtractFileExt(opdg1.FileName)) = '.jpeg') then
          begin
            LJPEG.LoadFromFile(opdg1.FileName);
            imgYaHe.Picture.Bitmap.Assign(LJPEG);
          end;
        except
          ShowMessage('只能导入BMP或是JPEG格式的文件');
          Exit;
        end;
      finally
        LJPEG.Free;
      end;
    end;
  end;
end;

procedure TfrmEditBOMBaoJia.btn11Click(Sender: TObject);
begin
  imgYaHe.Picture := nil;
end;

procedure TfrmEditBOMBaoJia.btn12Click(Sender: TObject);
var
  LCalc: ICalc;
  LCdsDeptParam: TClientDataSet;
  LCStr: string;
  LRetStr: string;
  LCdsStdPrice: TClientDataSet;
  Ltmp: ITmp;
  LErrMsg: string;
  LCdsGParam: TClientDataSet;
  LCdsBomParam: TClientDataSet;
  I: Integer;
  LField: TField;
  LPcsS,LSetL,LSetW: Double;
  LPcsPerSet: Integer;
  LSql: string;
  lcdstmp: TClientDataSet;

begin
  LSetL := 0;
  LSetW := 0;
  LPcsPerSet := 1;

  {$REGION '通过全局参数算出 单个PCS的面积'}
  if dm1.cdsLookup278.Locate('parameter_name','bSet_L',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetL := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bSet_W',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetW := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bPCSPerSet',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LPcsPerSet := cdsBP10.FieldByName('param_value').AsInteger;
    end;
  end;
  LPcsS := LSetL * LSetW / LPcsPerSet;
  {$ENDREGION}

  LCalc := TCalc.Create;
  LCdsDeptParam := TClientDataSet.Create(Self);
  LCdsStdPrice := TClientDataSet.Create(Self);
  LCdsGParam := TClientDataSet.Create(Self);
  LCdsBomParam := TClientDataSet.Create(Self);
  lcdstmp := TClientDataSet.Create(self);
  Ltmp := TTmp.Create;
  LCdsDeptParam.Data := cdsBP09.Data;
  LCdsGParam.Data := cdsBP10.Data;
  cdsBP10_Sale.First;
  while not cdsBP10_Sale.Eof do
  begin
    LCdsGParam.Append;
    for I := 0 to LCdsGParam.Fields.Count - 1 do
    begin
      LField := cdsBP10_Sale.FindField(LCdsGParam.Fields[I].FieldName);
      if LField <> nil then
        LCdsGParam.Fields[I].Value := LField.Value;
    end;
    LCdsGParam.Post;
    cdsBP10_Sale.Next;
  end;
  try
    cdsBP08.DisableControls;
    cdsBP07.DisableControls;
    cdsBP07.First;
    while not cdsBP07.Eof do
    begin
      //工序参数
      LCdsDeptParam.Filter := 'bp07_ptr = ' + QuotedStr(cdsBP07.FieldByName('idkey').AsString);
      LCdsDeptParam.Filtered := True;
      //工序对应的主要材料
      cdsBP08.Filter := 'bp07_ptr = ' + QuotedStr(cdsBP07.FieldByName('idkey').AsString);
      cdsBP08.Filtered := True;
      cdsBP08.First;
      while not cdsBP08.Eof do
      begin
        LCdsBomParam.Data := Ltmp.SqlOpen('select data0278.rkey as d278_ptr,data0017.IES_PARAMETER_VALUE1 as param_value from data0278 ,data0017 where 1=0');
        LCdsBomParam.Fields[0].ReadOnly := False;
        LCdsBomParam.Fields[1].ReadOnly := False;
        //取得材料的BOM参数
        LSql := ' SELECT d278.rkey as d278_ptr,d499.SEQ_NO,d278.PARAMETER_NAME,d17.* FROM data0017 d17 ' +
                ' INNER JOIN data0496 d496 on d496.RKEY = d17.GROUP_PTR ' +
                ' INNER JOIN data0499 d499 ON d499.INV_GROUP_PTR = d17.GROUP_PTR ' +
                ' INNER JOIN data0278 d278 ON d499.PARAMETER_PTR = d278.RKEY ' +
                ' where d17.rkey = ' + IntToStr(cdsBP08.FieldByName('d17_ptr').AsInteger);
        lcdstmp.Data := Ltmp.SqlOpen(LSql);
        while not lcdstmp.Eof do
        begin
          I := lcdstmp.FieldByName('SEQ_NO').AsInteger;
          LCdsBomParam.Append;
          LCdsBomParam.FieldByName('d278_ptr').AsString := lcdstmp.FieldByName('d278_ptr').AsString;
          LCdsBomParam.FieldByName('param_value').AsString := lcdstmp.FieldByName('IES_PARAMETER_VALUE' + IntToStr(I)).AsString;
          LCdsBomParam.Post;
          lcdstmp.Next;
        end;

        //主材料的采购价格
        LSql := updtsql1.DeleteSQL.Text + ' where d28.rkey = ' + IntToStr(cdsBP08.FieldByName('d28_ptr').AsInteger);
        LCdsStdPrice.Data := Ltmp.SqlOpen(LSql);
        //主材料的材料价格计算公式
        LSql := 'select MP_Calcstr from bomprice04 where D34_ptr = ' + cdsBP07.FieldByName('d34_ptr').AsString +
                ' and d496_ptr = ' + cdsBP08.FieldByName('d496_ptr').AsString;
        lcdstmp.Data := Ltmp.SqlOpen(LSql);
        LCStr := UpperCase(lcdstmp.FieldByName('MP_Calcstr').AsString);
        LCStr := StringReplace(LCStr,'M.P',LCdsStdPrice.FieldByName('PRICE_1').AsString,[rfReplaceAll, rfIgnoreCase]);
        if LCalc.CalcStr(LCStr,LRetStr,LCdsGParam,LCdsDeptParam,LCdsBomParam,LErrMsg) then
        begin
          if StrToFloatDef(LRetStr,-999999) = -999999 then
          begin
            ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + '材料价格 计算公式 ' + LCStr + ' 的最后结果为 ' + LRetStr + '  错误,计算退出');
            Exit;
          end else
          begin
            cdsBP08.Edit;
            cdsBP08.FieldByName('MStdPrice').AsString := LRetStr;
            cdsBP08.Post;
          end;
        end else
        begin
          ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + '材料价格 计算公式错误 ' + #13 + LErrMsg );
          Exit;
        end;

        //材料消耗
        LCStr := cdsBP08.FieldByName('calcstr').AsString;
        if LCalc.CalcStr(LCStr,LRetStr,LCdsGParam,LCdsDeptParam,LCdsBomParam,LErrMsg) then
        begin
          if StrToFloatDef(LRetStr,-999999) = -999999 then
          begin
            ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 计算公式 ' + LCStr + ' 的最后结果为 ' + LRetStr + '  错误,计算退出');
            Exit;
          end else
          begin
            cdsBP08.Edit;
            cdsBP08.FieldByName('MUsePerPcs').AsString := LRetStr;
            cdsBP08.FieldByName('MUsePerPcs').Value := cdsBP08.FieldByName('MUsePerPcs').Value * cdsBP08.FieldByName('beishu').AsInteger;
            cdsBP08.FieldByName('MUsePrice').AsFloat := cdsBP08.FieldByName('MUsePerPcs').AsFloat * cdsBP08.FieldByName('MStdPrice').AsFloat;
            cdsBP08.FieldByName('MUsePrice_M').AsFloat := cdsBP08.FieldByName('MUsePrice').AsFloat / LPcsS * 1000000;
            cdsBP08.Post;
          end;
        end else
        begin
          ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 计算公式错误 ' + #13 + LErrMsg );
          Exit;
        end;
        cdsBP08.Next;
      end;
      cdsBP07.Next;
    end;
    ShowMessage('计算完毕');
  finally
    cdsBP08.Filtered := False;
    cdsBP08.EnableControls;
    cdsBP07.EnableControls;
    LCdsDeptParam.Free;
    lcdstmp.Free;
    LCdsStdPrice.Free;
    LCdsGParam.Free;
    LCdsBomParam.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btn13Click(Sender: TObject);
var
  LP1: Double;
  P2calcStr,P3CalcStr,p4CalcStr,p5CalcStr: string;
  LCdsDeptParam: TClientDataSet;
  LCdsGParam: TClientDataSet;
  LRetStr: string;
  lCalc: ICalc;
  lErrMsg: string;
  I: Integer;
  LField: TField;
  LPcsS,LSetL,LSetW: Double;
  LPcsPerSet: Integer;
begin

  LSetL := 0;
  LSetW := 0;
  LPcsPerSet := 1;

  {$REGION '通过全局参数算出 单个PCS的面积'}
  if dm1.cdsLookup278.Locate('parameter_name','bSet_L',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetL := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bSet_W',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetW := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bPCSPerSet',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LPcsPerSet := cdsBP10.FieldByName('param_value').AsInteger;
    end;
  end;
  LPcsS := LSetL * LSetW / LPcsPerSet;
  {$ENDREGION}

  LCdsDeptParam := TClientDataSet.Create(Self);
  LCdsDeptParam.Data := cdsBP09.Data;
  LCdsGParam := TClientDataSet.Create(Self);
  LCdsGParam.Data := cdsBP10.Data;
  cdsBP10_Sale.First;
  while not cdsBP10_Sale.Eof do
  begin
    LCdsGParam.Append;
    for I := 0 to LCdsGParam.Fields.Count - 1 do
    begin
      LField := cdsBP10_Sale.FindField(LCdsGParam.Fields[I].FieldName);
      if LField <> nil then
        LCdsGParam.Fields[I].Value := LField.Value;
    end;
    LCdsGParam.Post;
    cdsBP10_Sale.Next;
  end;

  cdsBP07.DisableControls;
  cdsBP08.DisableControls;
  cdsBP07.AfterScroll := nil;
  cdsBP07.First;
  try
    while not cdsBP07.Eof do
    begin
      LP1 := 0;
      cdsBP08.Filter := ' bp07_ptr = ' + QuotedStr(cdsBP07.FieldByName('idkey').AsString);
      cdsBP08.Filtered := True;
      cdsBP08.First;
      while not cdsBP08.Eof do
      begin
        LP1 := LP1 + cdsBP08.FieldByName('MUsePrice').AsFloat;
        cdsBP08.Next;
      end;
      cdsBP07.Edit;
      cdsBP07.FieldByName('p1').AsFloat := cdsBP07.FieldByName('beishu').AsInteger*LP1;
      cdsBP07.Post;


      //dept
      LCdsDeptParam.Filter := 'bp07_ptr = ' + QuotedStr(cdsBP07.FieldByName('idkey').AsString);
      LCdsDeptParam.Filtered := True;

      P2calcStr := cdsBP07.FieldByName('p2calcstr').AsString;
      P3calcStr := cdsBP07.FieldByName('p3calcstr').AsString;
      P4calcStr := cdsBP07.FieldByName('p4calcstr').AsString;
      P5calcStr := cdsBP07.FieldByName('p5calcstr').AsString;

      LCalc := TCalc.Create;
      if LCalc.CalcStr(P2calcStr,LRetStr,LCdsGParam,LCdsDeptParam,nil,lErrMsg) then
      begin
        if StrToFloatDef(LRetStr,-999999) = -999999 then
        begin
          ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 2类材料计算公式 ' + P2calcStr + ' 的最后结果为 ' + LRetStr + '  错误,计算退出');
          Exit;
        end else
        begin
          cdsBP07.Edit;
          cdsBP07.FieldByName('P2').AsFloat := cdsBP07.FieldByName('beishu').AsInteger * StrToFloat(LRetStr);
          cdsBP07.Post;
        end;
      end else
      begin
        ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 2类材料计算错误,计算退出' + #13 + lErrMsg);
        Exit;
      end;

      if LCalc.CalcStr(P3calcStr,LRetStr,LCdsGParam,LCdsDeptParam,nil,lErrMsg) then
      begin
        if StrToFloatDef(LRetStr,-999999) = -999999 then
        begin
          ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 人工费用计算公式 ' + P3calcStr + ' 的最后结果为 ' + LRetStr + '  错误,计算退出');
          Exit;
        end else
        begin
          cdsBP07.Edit;
          cdsBP07.FieldByName('P3').AsFloat := cdsBP07.FieldByName('beishu').AsInteger * StrToFloat(LRetStr);
          cdsBP07.Post;
        end;
      end else
      begin
        ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 人工费用计算错误,计算退出' + #13 + lErrMsg);
        Exit;
      end;

      if LCalc.CalcStr(P4calcStr,LRetStr,LCdsGParam,LCdsDeptParam,nil,lErrMsg) then
      begin
        if StrToFloatDef(LRetStr,-999999) = -999999 then
        begin
          ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 水电费用计算公式 ' + P4calcStr + ' 的最后结果为 ' + LRetStr + '  错误,计算退出');
          Exit;
        end else
        begin
          cdsBP07.Edit;
          cdsBP07.FieldByName('P4').AsFloat := cdsBP07.FieldByName('beishu').AsInteger * StrToFloat(LRetStr);
          cdsBP07.Post;
        end;
      end else
      begin
        ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 水电费用计算错误,计算退出' + #13 + lErrMsg);
        Exit;
      end;

      if LCalc.CalcStr(P5calcStr,LRetStr,LCdsGParam,LCdsDeptParam,nil,lErrMsg) then
      begin
        if StrToFloatDef(LRetStr,-999999) = -999999 then
        begin
          ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 折旧费用计算公式 ' + P5calcStr + ' 的最后结果为 ' + LRetStr + '  错误,计算退出');
          Exit;
        end else
        begin
          cdsBP07.Edit;
          cdsBP07.FieldByName('P5').AsFloat := cdsBP07.FieldByName('beishu').AsInteger * StrToFloat(LRetStr);
          cdsBP07.Post;
        end;
      end else
      begin
        ShowMessage('工序 ' + cdsBP07.FieldByName('dept_name').AsString + ' 折旧费用计算错误,计算退出' + #13 + lErrMsg);
        Exit;
      end;

      cdsBP07.Edit;
        cdsBP07.FieldByName('AllP').AsFloat :=
         cdsBP07.FieldByName('p1').AsFloat +
         cdsBP07.FieldByName('p2').AsFloat +
         cdsBP07.FieldByName('p3').AsFloat +
         cdsBP07.FieldByName('p4').AsFloat +
         cdsBP07.FieldByName('p5').AsFloat
        ;

      cdsBP07.FieldByName('AllP_M').AsFloat := cdsBP07.FieldByName('AllP').AsFloat / LPcsS *  1000000;
      cdsBP07.Post;

      cdsBP07.Next;
    end;
    ShowMessage('计算完毕');
  finally
    cdsBP07.AfterScroll := cdsBP07AfterScroll;
    cdsBP07.EnableControls;
    cdsBP08.EnableControls;
    LCdsDeptParam.Free;
    LCdsGParam.Free;
  end;

end;

procedure TfrmEditBOMBaoJia.btn14Click(Sender: TObject);
var
  LP1P2,LP3P4P5,LP1P2P3P4P5: Double;
  LPcsS,LSetL,LSetW: Double;
  LPcsPerSet: Integer;
  LCalc: ICalc;
  LTmpS: string;
  LRetStr: string;
  LgParam,LpParam: TClientDataSet;
  LCdsBP16: TClientDataSet;
  LTmp: ITmp;
  LCurr_Rate: Double;
  LCalcStr: string;
  LErrMsg: string;
  LTmpFloat: Double;
  I: Integer;
  LField: TField;
begin


  LSetL := 0;
  LSetW := 0;
  LPcsPerSet := 1;
  LP1P2 := 0;
  LP3P4P5 := 0;

  LCurr_Rate := cdsBP06.FieldByName('curr_rate').AsFloat;
  if LCurr_Rate = 0 then
    LCurr_Rate := 1;

  {$REGION '通过全局参数算出 单个PCS的面积'}
  if dm1.cdsLookup278.Locate('parameter_name','bSet_L',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetL := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bSet_W',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetW := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bPCSPerSet',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LPcsPerSet := cdsBP10.FieldByName('param_value').AsInteger;
    end;
  end;
  LPcsS := LSetL * LSetW / LPcsPerSet;
  {$ENDREGION}


  LgParam := TClientDataSet.Create(Self);
  LpParam := TClientDataSet.Create(Self);
  LCdsBP16 := TClientDataSet.Create(Self);
  LCalc := TCalc.Create;
  LTmp := TTmp.Create;
  try
    {$REGION '汇总工序成本p1p2p3p4p5'}
    cdsBP07.DisableControls;
    cdsBP07.AfterScroll := nil;
    cdsBP07.First;
    while not cdsBP07.Eof do
    begin
      LP1P2 := LP1P2 + cdsBP07.FieldByName('P1').AsFloat + cdsBP07.FieldByName('P2').AsFloat;
      LP3P4P5 := LP3P4P5 + cdsBP07.FieldByName('P3').AsFloat + cdsBP07.FieldByName('P4').AsFloat + cdsBP07.FieldByName('P5').AsFloat;
      cdsBP07.Next;
    end;
    LP1P2P3P4P5 := LP1P2 + LP3P4P5;

    cdsBP06.Edit;
    cdsBP06.FieldByName('P1P2_Pcs').AsFloat := LP1P2 / LCurr_Rate;
    cdsBP06.FieldByName('P3P4P5_Pcs').AsFloat := LP3P4P5 / LCurr_Rate;
    cdsBP06.FieldByName('P1P2P3P4P5_Pcs').AsFloat := LP1P2P3P4P5 / LCurr_Rate;

    cdsBP06.FieldByName('P1P2_M').AsString := FormatFloat('0.00000',(LP1P2 / LCurr_Rate * 1000000) / LPcsS);
    cdsBP06.FieldByName('P3P4P5_M').AsString := FormatFloat('0.00000',(LP3P4P5 / LCurr_Rate * 1000000) / LPcsS);
    cdsBP06.FieldByName('P1P2P3P4P5_M').AsString := FormatFloat('0.00000',(LP1P2P3P4P5 /LCurr_Rate * 1000000) / LPcsS);
    cdsBP06.Post;

    {$ENDREGION}

    {$REGION '计算公共公式'}
    LgParam.Data := cdsBP10.Data;
    LpParam.Data := cdsBP09.Data;
    cdsBP10_Sale.First;
    while not cdsBP10_Sale.Eof do
    begin
      LgParam.Append;
      for I := 0 to LgParam.Fields.Count - 1 do
      begin
        LField := cdsBP10_Sale.FindField(LgParam.Fields[I].FieldName);
        if LField <> nil then
          LgParam.Fields[I].Value := LField.Value;
      end;
      LgParam.Post;
      cdsBP10_Sale.Next;
    end;
    LCdsBP16.Data := LTmp.SqlOpen('select * from bomprice16');
    {$REGION '报废计算'}
    LCalcStr := LCdsBP16.FieldByName('baofeilv_calcstr').AsString;
    if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
    begin
      LTmpFloat := StrToFloatDef(LRetStr,-99999);
      if LTmpFloat = -99999 then
      begin
        ShowMessage('报废率计算结果:  ' + LRetStr + #13 + '不是数字计算中断');
        Exit;
      end;

      cdsBP06.Edit;
      cdsBP06.FieldByName('baofeilv').AsFloat := LTmpFloat;
      cdsBP06.FieldByName('baofei_cost_pcs').AsFloat := cdsBP06.FieldByName('P1P2P3P4P5_Pcs').AsFloat * LTmpFloat /100;
      cdsBP06.FieldByName('baofei_cost_M').AsFloat := cdsBP06.FieldByName('P1P2P3P4P5_M').AsFloat * LTmpFloat / 100;
      cdsBP06.Post;
    end else
    begin
      ShowMessage('报废率计算公式错误,计算中断。' + #13 + LErrMsg);
      Exit;
    end;
    {$ENDREGION}




      {$REGION '产品用途'}
      LCalcStr := LCdsBP16.FieldByName('chanpinyongtu_add_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('产品用途加成计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('chanpinyongtu_add').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('产品用途加成计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '销售区域'}
      LCalcStr := LCdsBP16.FieldByName('xiaoshouquyu_add_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('销售区域加成计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('xiaoshouquyu_add').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('销售区域加成计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '订单数量'}
      LCalcStr := LCdsBP16.FieldByName('dingdanshuliang_add_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('订单数量加成计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('dingdanshuliang_add').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('订单数量加成计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '毛利率加成'}
//      LCalcStr := LCdsBP16.FieldByName('maolilv_add_calcstr').AsString;
//      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
//      begin
//        LTmpFloat := StrToFloatDef(LRetStr,-99999);
//        if LTmpFloat = -99999 then
//        begin
//          ShowMessage('毛利率加成计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
//          Exit;
//        end;
//
//        cdsBP06.Edit;
//        cdsBP06.FieldByName('maolilv_add').AsFloat := LTmpFloat;
//          cdsBP06.FieldByName('chanpinyongtu_add').AsFloat +
//          cdsBP06.FieldByName('xiaoshouquyu_add').AsFloat +
//          cdsBP06.FieldByName('dingdanshuliang_add').AsFloat
//          ;
//        cdsBP06.Post;
//      end else
//      begin
//        ShowMessage('毛利率加成计算公式错误,计算中断！' + #13 + LErrMsg);
//        Exit;
//      end;

      {$ENDREGION}

      {$REGION '增值税加成'}
      LCalcStr := LCdsBP16.FieldByName('zengzhishui_add_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('增值税加成计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('zengzhishui_add').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('增值税加成计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}


      {$REGION '运输成本计算'}
      LCalcStr := LCdsBP16.FieldByName('yunshu_cost_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('运输成本计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('yunshu_cost_calcret').AsFloat := LTmpFloat;
        cdsBP06.FieldByName('yunshu_cost_pcs').AsFloat := LTmpFloat;
        cdsBP06.FieldByName('yunshu_cost_M').AsFloat := LTmpFloat * LPcsPerSet * 1000000 / (LSetL * LSetW);
        cdsBP06.Post;
      end else
      begin
        ShowMessage('运输成本计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '销售折扣率公式计算'}
      LCalcStr := LCdsBP16.FieldByName('xiaoshouzhekou_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('销售折扣率计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('xiaoshouzhekou').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('销售折扣率计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '财务费用公式计算'}
      LCalcStr := LCdsBP16.FieldByName('caiwu_cost_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('财务成本计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('caiwu_cost_calcret').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('财务成本计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '管理成本'}
      LCalcStr := LCdsBP16.FieldByName('guanli_cost_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('管理成本计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('guanli_cost_calcret').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('管理成本计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '营销成本'}
      LCalcStr := LCdsBP16.FieldByName('xiaoshou_cost_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('营销成本计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('xiaoshou_cost_calcret').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('营销成本计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      {$REGION '计算红线价格'}
      LCalcStr := LCdsBP16.FieldByName('redline').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        LTmpFloat := StrToFloatDef(LRetStr,-99999);
        if LTmpFloat = -99999 then
        begin
          ShowMessage('红线价格计算结果:  ' + LRetStr + #13 + '不是数字，错误！计算中断');
          Exit;
        end;

        cdsBP06.Edit;
        cdsBP06.FieldByName('redline').AsFloat := LTmpFloat;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('红线价格计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;
      {$ENDREGION}

      cdsBP06.Edit;
      LTmpFloat := cdsBP06.FieldByName('chanpinyongtu_add').AsFloat +
          cdsBP06.FieldByName('xiaoshouquyu_add').AsFloat +
          cdsBP06.FieldByName('dingdanshuliang_add').AsFloat;
      cdsBP06.FieldByName('buhanshuijiage_Pcs').Value := (cdsBP06.FieldByName('PAllAndBaoFei_Pcs').Value * (1+ LTmpFloat/100));

      cdsBP06.FieldByName('maolilv_add').AsFloat :=
      (1- cdsBP06.FieldByName('PAllAndBaoFei_pcs').AsFloat /
        cdsBP06.FieldByName('buhanshuijiage_pcs').AsFloat) * 100;

      cdsBP06.FieldByName('hanshuijiage_Pcs').Value := cdsBP06.FieldByName('buhanshuijiage_Pcs').Value *
          (1+ cdsBP06.FieldByName('zengzhishui_add').Value/100);


    if cdsBP06.FieldByName('OrignPrice').AsString = '' then
    begin
      cdsBP06.FieldByName('OrignPrice').value := cdsBP06.FieldByName('buhanshuijiage_Pcs').Value;
      //Exit;
    end;

    cdsBP06.Post;

      ReCalcByMaoLiLv(LSetL,LSetW,-1);

      {$REGION '计算报表用的到数据'}
      LCalcStr := LCdsBP16.FieldByName('Rpt_GongChengFei_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_GongChengFei').AsFloat :=  StrToFloatDef(LRetStr,0) / LCurr_Rate;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('工程费计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_KaiLaFei_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_KaiLaFei').AsFloat := StrToFloatDef(LRetStr,0) / LCurr_Rate;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('开拉费计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_MojuFei_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_MojuFei').AsFloat := StrToFloatDef(LRetStr,0) / LCurr_Rate;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('模具费计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_CeShiJiaFei_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_CeShiJiaFei').AsFloat := StrToFloatDef(LRetStr,0) / LCurr_Rate;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('测试架费计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_ZuiXiaoDingDanShu_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_ZuiXiaoDingDanShu').AsInteger := Trunc(StrToFloat(LRetStr));
        cdsBP06.Post;
      end else
      begin
        ShowMessage('最小订单计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_CeShiFei_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_CeShiFei').AsFloat := StrToFloatDef(LRetStr,0) / LCurr_Rate;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('测试费计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_ZhiBanFei_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_ZhiBanFei').AsFloat := StrToFloatDef(LRetStr,0) / LCurr_Rate;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('制板费计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_YangpinShu_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_YangpinShu').AsString := LRetStr;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('样品数计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      LCalcStr := LCdsBP16.FieldByName('Rpt_YangpinMianji_calcstr').AsString;
      if LCalc.CalcStr(LCalcStr,LRetStr,LgParam,LpParam,nil,LErrMsg) then
      begin
        cdsBP06.Edit;
        cdsBP06.FieldByName('Rpt_YangpinMianji').AsString := LRetStr;
        cdsBP06.Post;
      end else
      begin
        ShowMessage('样品面积计算公式错误,计算中断！' + #13 + LErrMsg);
        Exit;
      end;

      {$ENDREGION}

    {$ENDREGION}

    lblBenBiPrice.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_Pcs').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);
    lblBenBiPriceM.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_M').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);

    btnSvae.Enabled := True;
  finally
    LgParam.Free;
    LpParam.Free;
    LCdsBP16.Free;
    cdsBP07.EnableControls;
    cdsBP07.AfterScroll := cdsBP07AfterScroll;
    cdsBP07AfterScroll(cdsBP07);
  end;
end;

procedure TfrmEditBOMBaoJia.btn15Click(Sender: TObject);
var
  LTmp: ITmp;
  LCds: TClientDataSet;
begin
  cdsBP08.DisableControls;
  cdsBP08.Filtered := False;
  LTmp := TTmp.Create;
  LCds := TClientDataSet.Create(Self);
  try
    cdsBP08.First;
    while not cdsBP08.Eof do
    begin
      LCds.Data := LTmp.SqlOpen('select calcstr from bomprice04 where D34_ptr = ' + cdsBP08.FieldByName('D34_ptr').AsString + ' and d496_ptr = ' + cdsBP08.FieldByName('d496_ptr').AsString);
      cdsBP08.Edit;
      cdsBP08.FieldByName('calcstr').AsString := LCds.FieldByName('calcstr').AsString;
      cdsBP08.Post;
      cdsBP08.Next;
    end;
  finally
    //cdsBP08.Filtered := True;
    cdsBP08.EnableControls;
    LCds.Free;
  end;
  ShowMessage('更新完毕');
end;

procedure TfrmEditBOMBaoJia.btn16Click(Sender: TObject);
var
  ltmp: ITmp;
  LCds: TClientDataSet;
  LRecNO: Integer;
  LSql: string;
  LField: TField;
begin
  cdsAllBomDept.Close;
  cdsAllBomDept.CreateDataSet;

  ltmp := TTmp.Create;
  LCds := TClientDataSet.Create(self);
  cdsBP07.DisableControls;
  cdsBP07.AfterScroll := nil;
  LRecNO := cdsBP07.RecNo;
  cdsBP07.First;
  cdsAllBomDept.DisableControls;
  cdsAllBomDept.AfterScroll := nil;
  try
    while not cdsBP07.Eof do
    begin
      LSql := ' select d496.rkey,d496.GROUP_DESC from bomprice04 bp04 ' +
              ' INNER JOIN data0496 d496 ON d496.RKEY = bp04.D496_ptr ' +
              ' where bp04.d34_ptr = ' + IntToStr(cdsBP07.FieldByName('d34_ptr').AsInteger) +
              ' ORDER by bp04.D496_ptr asc' ;
      LCds.Data := ltmp.SqlOpen(LSql);
      if not LCds.IsEmpty then
      begin
        cdsAllBomDept.Append;
        for LField in cdsAllBomDept.Fields do
        begin
          if cdsBP07.FindField(LField.FieldName) <> nil then
            LField.Value := cdsBP07.FindField(LField.FieldName).Value;
        end;
        cdsAllBomDept.Post;
      end;
      cdsBP07.Next;
    end;
    cdsAllBomDeptAfterScroll(cdsAllBomDept);
  finally
    cdsBP07.RecNo := LRecNO;
    cdsBP07.AfterScroll := cdsBP07AfterScroll;
    cdsBP07.EnableControls;
    cdsAllBomDept.EnableControls;
    cdsAllBomDept.AfterScroll := cdsAllBomDeptAfterScroll;
    LCds.Free;
  end;

end;

procedure TfrmEditBOMBaoJia.btn17Click(Sender: TObject);
var
  LCds: TClientDataSet;
  LRec: Integer;
  Ltmp: IData;
  Lsql: string;
begin
  LRec := cdsBP07.RecNo;
  cdsBP07.DisableControls;
  cdsBP07.AfterScroll := nil;
  LCds := TClientDataSet.Create(Self);
  Ltmp := TTmp.Create;
  try
    cdsBP07.First;
    while not cdsBP07.Eof do
    begin
      Lsql := ' select * from bomprice02 where d34_ptr=' + cdsBP07.FieldByName('d34_ptr').AsString;
      Ltmp.SetSql(Lsql);
      LCds.Data := Ltmp.GetData;

      cdsBP07.Edit;
      cdsBP07.FieldByName('p2calcstr').AsString := LCds.FieldByName('P2').AsString;
      cdsBP07.FieldByName('p3calcstr').AsString := LCds.FieldByName('P3').AsString;
      cdsBP07.FieldByName('p4calcstr').AsString := LCds.FieldByName('P4').AsString;
      cdsBP07.FieldByName('p5calcstr').AsString := LCds.FieldByName('P5').AsString;
      cdsBP07.Post;

      cdsBP07.Next;
    end;
  finally
    LCds.Free;
    cdsBP07.EnableControls;
    cdsBP07.AfterScroll := cdsBP07AfterScroll;
  end;
  cdsBP07.RecNo := LRec;
  ShowMessage('更新完毕');
end;

procedure TfrmEditBOMBaoJia.btn18Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'CUST_CODE/客户代码/100,ABBR_NAME/客户简称/100,CUSTOMER_NAME/客户名称/200';
  LIn.Sqlstr := 'select RKEY,CUST_CODE,ABBR_NAME,CUSTOMER_NAME,ANALYSIS_CODE3, '+
                     'SALES_DISCOUNT from data0010 order by CUST_CODE';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP06.Edit;
      cdsBP06.FieldByName('ORIG_CUSTOMER').AsString := LFrm.adsPick1.FieldByName('ABBR_NAME').AsString;
      cdsBP06.FieldByName('xiaoshouzhekou').AsFloat := LFrm.adsPick1.FieldByName('SALES_DISCOUNT').AsFloat;
      cdsBP06.Post;

      //同步关联客户
      if dm1.cdsLookup278.Locate('PARAMETER_NAME','bOrigCust',[loCaseInsensitive]) then
      begin
        if cdsBP10_Sale.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsString,[loCaseInsensitive]) then
        begin
          cdsBP10_Sale.Edit;
          cdsBP10_Sale.FieldByName('Param_Value').AsString := LFrm.adsPick1.FieldByName('CUST_CODE').AsString;
          cdsBP10_Sale.Post;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btn19Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'CODE/流程代码/100,QTE_APPROV_DESC/流程描述/200';
  LIn.Sqlstr := 'select rkey, CODE, QTE_APPROV_DESC from data0264';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP06.Edit;
      cdsBP06.FieldByName('D264_ptr').AsString := LFrm.adsPick1.FieldByName('rkey').AsString;
//      cdsBP06.FieldByName('xiaoshouzhekou').AsFloat := LFrm.adsPick1.FieldByName('SALES_DISCOUNT').AsFloat;
      cdsBP06.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btnDeptBomClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
  lcds: TClientDataSet;
  Itmp: IData;
  LCbx: TRzComboBox;
begin
  LCbx := cbxDeptBomType;
  if (Sender as TSpeedButton).Name = 'btnDeptBom' then
    LCbx := cbxDeptBomType;
  if LCbx.ItemIndex = -1 then Exit;

  LIn.Fields := 'INV_PART_NUMBER/材料编码/150,INV_NAME/材料名称/100,INV_DESCRIPTION/规格型号/200,ABBR_NAME/供应商简称/100,SUPPLIER_PART_NO/供应商型号/100,PRICE_1/价格/100,TDATE/价格日期/80,STOCK_SELL/采购单位面积/80';
  LIn.Sqlstr := ' SELECT CASE WHEN d28.CURRENCY_PTR = 1 THEN CASE WHEN d28.tax_flag = ''Y'' THEN d28.PRICE_1 / (d28.TAX_2 /100 + 1.0) ELSE d28.PRICE_1 END ' +
              	' ELSE CASE WHEN d28.tax_flag =''Y'' THEN (d28.PRICE_1 * d01.BASE_TO_OTHER) / (d28.TAX_2 /100 + 1.0) ELSE d28.PRICE_1 * d01.BASE_TO_OTHER END END AS PRICE_1 ,d28.SUPPLIER_PART_NO,' +
                ' d17.rkey,d28.rkey as rkey28,d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION,d23.ABBR_NAME,d23.SUPPLIER_NAME,d28.TDATE,d28.SUPPLIER_PART_NO,d17.STOCK_SELL FROM data0017 d17 ' +
                ' INNER JOIN data0028 d28 on d17.RKEY = d28.INVENTORY_PTR ' +
                ' INNER JOIN data0023 d23 ON d28.SUPPLIER_PTR = d23.RKEY ' +
                ' INNER Join data0496 d496 on d17.group_ptr = d496.rkey ' +
                ' INNER JOIN Data0001 d01 ON d01.RKEY = d28.CURRENCY_PTR ' +
                ' where d17.group_ptr = ' + IntToStr(Integer(Lcbx.Items.Objects[Lcbx.ItemIndex])) +
                ' and d28.QTE_PRICE > 0 ' +
                //' and d496.quote_flag = 1 ' +
                ' and d28.AVL_FLAG <> ''N''' +
                ' and d17.STOP_PURCH <> ''Y''' +
                ' and d23.status = 0 and d17.ACTIVE_FLAG = ''Y''' +
                ' order by d23.ABBR_NAME desc,d28.tdate desc';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  lcds := TClientDataSet.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      Itmp := TTmp.Create;
      Itmp.SetSql('select * from bomprice04 where d34_ptr = ' + IntToStr(cdsBP07.FieldByName('d34_ptr').AsInteger));
      lcds.Data := Itmp.GetData;

      cdsBP08.Append;
      cdsBP08.FieldByName('idkey').AsString := IBP08.CreateKeyID;
      cdsBP08.FieldByName('bp06_ptr').AsString := cdsBP06.FieldByName('idkey').AsString;
      cdsBP08.FieldByName('bp07_ptr').AsString := cdsBP07.FieldByName('idkey').AsString;
      cdsBP08.FieldByName('d34_ptr').AsInteger := cdsBP07.FieldByName('d34_ptr').AsInteger;
      cdsBP08.FieldByName('d496_ptr').AsInteger := Integer(Lcbx.Items.Objects[Lcbx.ItemIndex]);
      cdsBP08.FieldByName('selforder').AsInteger := cdsBP08.RecordCount + 1;
      cdsBP08.FieldByName('d17_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsbp08.FieldByName('calcstr').AsString := lcds.FieldByName('calcstr').AsString;
      cdsBP08.FieldByName('d28_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey28').AsInteger;
      cdsBP08.FieldByName('step_number').AsInteger := cdsBP07.FieldByName('selforder').AsInteger;
      cdsBP08.FieldByName('beishu').AsInteger := 1;
      cdsBP08.Post;
    end;
  finally
    LFrm.Free;
    lcds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btnSvaeClick(Sender: TObject);
var
  LSeqNo: Integer;
  JpegImage: TJPEGImage;
  stream: TMemoryStream;
  LCdstmp: TClientDataSet;
  ltmp: ITmp;

  LP1_M,LP1_Pcs: Double;
begin
  if cdsBP06.FieldByName('OrignPrice').AsString = '' then
  begin
    ShowMessage('原单价格必须填写, 如果没折率则直接填写报价价格,请勿写在备注中.');
    Exit;
  end;

  {$REGION '总裁特批'}
//  if cdsBP06.FieldByName('redline').AsFloat <> 0 then
//  begin
//    if cdsBP06.FieldByName('Redline').AsFloat <= cdsBP06.FieldByName('buhanshuijiage_M').AsFloat then
//    begin
//      LCdstmp := TClientDataSet.Create(Self);
//      ltmp := TTmp.Create;
//      try
//        LCdstmp.Data := Ltmp.SqlOpen('select rkey, CODE, QTE_APPROV_DESC from data0264 where rkey = ' + IntToStr(cdsBP06.FieldByName('d264_ptr').AsInteger));
//        if LCdstmp.IsEmpty then
//        begin
//          ShowMessage('没有找到特批流程，报错失败');
//          Exit;
//        end;
//        if LCdstmp.FieldByName('code').AsString <> '99999' then
//        begin
//          ShowMessage('超过红线价格，请选择代码99999的总裁特批流程');
//          Exit;
//        end;
//      finally
//        LCdstmp.Free;
//      end;
//    end;
//  end;
  {$ENDREGION}

  jpegimage:=tjpegimage.Create;
  Stream:=TMemoryStream.Create;
  try
    jpegimage.Assign(imgYaHe.Picture.Bitmap);
    jpegimage.JPEGNeeded;
    jpegimage.SaveToStream(stream);
    Stream.Position :=0;
    cdsBP06.Edit;
    TBlobField(cdsBP06.FieldByName('yaheimg')).LoadFromStream(stream);
    cdsBP06.Post;
  finally
    stream.Clear;
    jpegimage.Free;
    stream.Free;
  end;



  {$REGION '取得最新货币汇率'}
  LCdstmp := TClientDataSet.Create(Self);
  ltmp := TTmp.Create;
  try
    LCdstmp.Data := Ltmp.SqlOpen('select CURR_CODE,RKEY,CURR_NAME,QTE_BASE_TO_OTHER,BASE_TO_OTHER from data0001 where rkey = ' + IntToStr(cdsBP06.FieldByName('d01_ptr').AsInteger));
    if LCdstmp.IsEmpty then
    begin
      ShowMessage('没有找到对应货币，保存失败');
      Exit;
    end;
    cdsBP06.Edit;
    cdsBP06.FieldByName('CurRate').AsFloat := LCdstmp.FieldByName('QTE_BASE_TO_OTHER').AsFloat;
    cdsBP06.Post;
  finally
    LCdstmp.Free;
  end;
  {$ENDREGION}



  {$REGION '计算P1_M,P1_Pcs'}
  LP1_M := 0;
  LP1_Pcs := 0;
  cdsBP08.DisableControls;
  cdsBP08.OnCalcFields := nil;
  try
    cdsBP08.First;
    while not cdsBP08.Eof do
    begin
      LP1_Pcs := LP1_Pcs + cdsBP08.FieldByName('MUsePrice').AsFloat;
      LP1_M := LP1_M + cdsBP08.FieldByName('MUsePrice_M').AsFloat;
      cdsBP08.Next;
    end;
  finally
    cdsBP08.EnableControls;
    cdsBP08.OnCalcFields := cdsBP08CalcFields;
  end;

  {$ENDREGION}

  cdsBP06.Edit;
  if Trim(edtManuPartNum.Text) = '' then cdsBP06.FieldByName('d25_ptr').Value := null;
  cdsBP06.FieldByName('P1_M').Value := LP1_M;
  cdsBP06.FieldByName('P1_Pcs').Value := LP1_Pcs;
  cdsBP06.FieldByName('createtime').AsDateTime := dm1.GetSvrNowTime;
  cdsBP06.FieldByName('createman').AsString := gUser.User_Ptr;
  if cdsBP06.FieldByName('seqno').AsInteger = -1 then
  begin
    cdsBP06.FieldByName('BPNO').AsString := IBP06.CreateBPNO(LSeqNo);
    cdsBP06.FieldByName('seqno').AsInteger := LSeqNo;
  end;

  cdsBP06.Post;

  cdsBP10_Sale.First;
  while not cdsBP10_Sale.Eof do
  begin
    if cdsBP10_Sale.FieldByName('BP06_ptr').AsString = '' then
    begin
      cdsBP10_Sale.Edit;
      cdsBP10_Sale.FieldByName('BP06_ptr').AsString := cdsBP06.FieldByName('idkey').AsString;
      cdsBP10_Sale.Post;
    end;
    cdsBP10_Sale.Next;
  end;

  cdsBP07.DisableControls;
  cdsBP07.AfterScroll := nil;
  cdsBP07.First;
  while not cdsBP07.Eof do
  begin
    cdsBP07.Edit;
    cdsBP07.FieldByName('selforder').AsInteger := cdsBP07.FieldByName('selforder').AsInteger + 10000;
    cdsBP07.Next;
  end;

  dm1.con1.BeginTrans;
  try
    if not PostdataByInterface(cdsBP06,IBP06) then Exit;
    if not PostdataByInterface(cdsbp10,IBP10) then Exit;
    if not PostdataByInterface(cdsBP10_Sale,IBP10_Sale) then Exit;
    if not PostdataByInterface(cdsBP11,IBP11) then Exit;
    if not PostdataByInterface(cdsBP07,IBP07) then Exit;
    if not PostdataByInterface(cdsBP09,IBP09) then Exit;
    if not PostdataByInterface(cdsBP08,IBP08) then Exit;
    cdsBP07.MergeChangeLog;
    //保存序号
    cdsBP07.First;
    while not cdsBP07.Eof do
    begin
      cdsBP07.Edit;
      cdsBP07.FieldByName('selforder').AsInteger := cdsBP07.FieldByName('selforder').AsInteger - 10000;
      cdsBP07.Next;
    end;
    if not PostdataByInterface(cdsBP07,IBP07) then Exit;

    dm1.spAfterSave.Parameters.ParamByName('@BP06IDKey').Value := cdsbp06.FieldByName('idkey').Value;
    dm1.spAfterSave.Parameters.ParamByName('@SaveType').Value := 0;
    dm1.spAfterSave.ExecProc;


    dm1.con1.CommitTrans;
    cdsbp06.MergeChangeLog;
    cdsbp10.MergeChangeLog;
    cdsBP10_Sale.MergeChangeLog;
    cdsBP11.MergeChangeLog;
    cdsBP07.MergeChangeLog;
    cdsBP09.MergeChangeLog;
    cdsBP08.MergeChangeLog;

    ShowMessage('保存成功');
    ModalResult := mrOk;
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      cdsBP07.EnableControls;
      cdsBP07.AfterScroll := cdsBP07AfterScroll;
      ShowMessage('保存失败');
    end;
  end;
end;

procedure TfrmEditBOMBaoJia.btnViewMIClick(Sender: TObject);
var
  LCds: TClientDataSet;
  LCdstmp: TClientDataSet;
  lcds38: TClientDataSet;
  lcds494: TClientDataSet;
  Ltmp: Itmp;
  LSql: string;
  FTOPRkey25: string;
  Lslist: TStringList;
  LRkey25Arr: string;
  LNode: TTreeNode;
  I: Integer;
  //LBp07Idkey: string;
begin
  FTOPRkey25 := cdsBP06.FieldByName('d25_ptr').AsString;
  if FTOPRkey25 = '' then Exit;
  //btnLoadCutClick(btnReadMIStep);

  tvMI.Items.Clear;
  //创建TREEVIEW树状节点
  LSql := ' ;WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) AS ' +
          '(' +
          ' SELECT RKey,1,MANU_PART_NUMBER,PARENT_PTR FROM Data0025 WHERE RKey = ' + FTOPRkey25 +
          ' UNION ALL ' +
          ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR ' +
          ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ' +
          ')' +
          ' SELECT * FROM CTE ORDER BY lv ASC';
  LCds := TClientDataSet.Create(Self);
  LCdstmp := TClientDataSet.Create(Self);
  lcds38 := TClientDataSet.Create(Self);
  lcds494 := TClientDataSet.Create(Self);
  Lslist := TStringList.Create;
  Ltmp := ttmp.Create;
  try
    LCds.Data := Ltmp.SqlOpen(LSql);
    if not lcds.IsEmpty then
    begin
      while not LCds.Eof do
      begin
        LRkey25Arr := LRkey25Arr + ',' + LCds.FieldByName('rkey').AsString;
        if (LCds.FieldByName('PARENT_PTR').IsNull) or (tvMI.Items.Count = 0) then
        begin
          LNode := tvMI.Items.AddChild(nil,LCds.FieldByName('MANU_PART_NUMBER').AsString);
          LNode.Data := Pointer(LNode.Level);
          Lslist.AddObject(LCds.FieldByName('rkey').AsString,LNode);
        end else
        begin
          for I := 0 to Lslist.Count - 1 do
          begin
            if Lslist[I] = LCds.FieldByName('PARENT_PTR').AsString then
            begin
              LNode := tvMI.Items.AddChild(lslist.Objects[I] as TTreeNode,LCds.FieldByName('MANU_PART_NUMBER').AsString);
              LNode.Data := Pointer(LNode.Level);
              Lslist.AddObject(LCds.FieldByName('rkey').AsString,LNode);
              Break;
            end;
          end;
        end;
        LCds.Next;
      end;
    end;
    tvMI.Items[0].Expand(True);
  finally
    LCds.Free;
    LCdstmp.Free;
    lcds38.Free;
    lcds494.Free;
    Lslist.Free;
  end;
//
end;

procedure TfrmEditBOMBaoJia.btnExitClick(Sender: TObject);
begin
  if not FReadOnly and (MessageBox(Handle,'确定不保存退出吗？','注意',MB_YESNO) <> IDYES) then
  begin
    Exit;
  end;
  Close;
end;

procedure TfrmEditBOMBaoJia.btn22Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'CUST_CODE/客户代码/150,CUSTOMER_NAME/客户名称/180';
  LIn.Sqlstr := 'select QTE_BASE_TO_OTHER,d01.BASE_TO_OTHER,CUST_CODE,d10.FED_TAX_ID_NO,d10.RKEY,CUSTOMER_NAME,SALES_REP_PTR,CURRENCY_PTR from data0010 d10 ' +
                ' left join data0001 d01 on d01.rkey = d10.CURRENCY_PTR';
  if (gUser.User_Permit = '2') or (gUser.User_Permit = '1') then
  begin
    LIn.Sqlstr := LIn.Sqlstr + ' inner join data0100 d100 on d10.rkey = d100.CUSTOMER_PTR where d100.CSI_PTR  = ' + gUser.User_Longin_Ptr + ' ';

  end;

  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      InlineLoadCustInfo(LFrm.adsPick1.FieldByName('rkey').AsString);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btn4Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
  LSql: string;
  LCds: TClientDataSet;
  Ltmp: ITmp;
begin
  if edtManuPartNum.Text <> '' then
    LSql := 'select manu_part_number,RKEY,manu_part_desc,CUSTOMER_PTR,ORIG_CUSTOMER,ANALYSIS_CODE_2  from data0025 where parent_ptr is null ' +
            ' and manu_part_number like ' + QuotedStr('%' + edtManuPartNum.Text + '%')
  else
    lsql := 'select manu_part_number,RKEY,manu_part_desc,CUSTOMER_PTR,ORIG_CUSTOMER,ANALYSIS_CODE_2  from data0025 where parent_ptr is null ';

  LCds := TClientDataSet.Create(Self);
  Ltmp := ttmp.Create;
  LIn.Fields := 'manu_part_number/本厂编号/150,manu_part_desc/客户型号/180,ANALYSIS_CODE_2/客户物料号/180';
  LIn.Sqlstr := LSql;
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      //edtManupartnumber.Text := LFrm.adsPick1.FieldByName('manu_part_number').AsString;
      cdsBP06.Edit;
      cdsBP06.FieldByName('d25_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsBP06.FieldByName('manu_part_desc').AsString := LFrm.adsPick1.FieldByName('manu_part_desc').AsString;
      cdsBP06.FieldByName('ANALYSIS_CODE_2').AsString := LFrm.adsPick1.FieldByName('ANALYSIS_CODE_2').AsString;
      cdsBP06.FieldByName('ORIG_CUSTOMER').AsString := LFrm.adsPick1.FieldByName('ORIG_CUSTOMER').AsString;
      cdsBP06.Post;
      edtManuPartNum.Text := LFrm.adsPick1.FieldByName('manu_part_number').AsString;
      InlineLoadCustInfo(LFrm.adsPick1.FieldByName('CUSTOMER_PTR').AsString);

      LSql := 'select cust_code from data0010 where ABBR_NAME = ' + QuotedStr(cdsBP06.FieldByName('ORIG_CUSTOMER').AsString);
      LCds.Data := Ltmp.SqlOpen(LSql);
      if not lcds.IsEmpty then
      begin
        //同步关联客户
        if dm1.cdsLookup278.Locate('PARAMETER_NAME','bOrigCust',[loCaseInsensitive]) then
        begin
          if cdsBP10_Sale.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsString,[loCaseInsensitive]) then
          begin
            cdsBP10_Sale.Edit;
            cdsBP10_Sale.FieldByName('Param_Value').AsString := LCds.FieldByName('cust_code').AsString;
            cdsBP10_Sale.Post;
          end;
        end;
      end;
    end;
  finally
    LFrm.Free;
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btn5Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'bpname/框架名称/400';
  LIn.Sqlstr := 'select bpname,idkey from bomprice00 order by bpname';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);

  cdsBP07.DisableControls;
  cdsBP07.AfterScroll := nil;
  cdsBP07.AfterPost := nil;

  cdsBP08.DisableControls;
  cdsBP08.AfterScroll := nil;
  cdsBP08.AfterPost := nil;
  cdsBP08.OnCalcFields := nil;

  cdsBP09.DisableControls;
  cdsBP09.AfterScroll := nil;
  cdsBP09.AfterPost := nil;
  cdsBP09.OnCalcFields := nil;

  cdsBP10.DisableControls;
  cdsBP10.AfterScroll := nil;

  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      if MessageBoxA(Handle,'是否载入报价模板?','提示',MB_YESNO) = IDYES then
      begin
        //edtD0346_ptr.Text := LFrm.adsPick1.FieldByName('row_name').AsString;
        cdsBP06.Edit;
        cdsBP06.FieldByName('bp00_ptr').AsString := LFrm.adsPick1.FieldByName('idkey').AsString;
        cdsBP06.Post;
        LoadFromPriceType(cdsBP06.FieldByName('bp00_ptr').AsString);
      end;
      ShowMessage('加载报价框架成功');
    end;
  finally
    cdsBP07.EnableControls;
    cdsBP07.AfterScroll := cdsBP07AfterScroll;


    cdsBP08.EnableControls;
    cdsBP08.OnCalcFields := cdsBP08CalcFields;

    cdsBP09.EnableControls;
    cdsBP09.AfterScroll := cdsBP09AfterScroll;
    cdsBP09.OnCalcFields := cdsBP09CalcFields;

    cdsBP10.EnableControls;
    cdsBP10.AfterScroll := cdsBP10AfterScroll;

    LFrm.Free;

  end;
end;

procedure TfrmEditBOMBaoJia.btn6Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'CURR_CODE/货币代码/150,CURR_NAME/货币名称/150';
  LIn.Sqlstr := 'select CURR_CODE,RKEY,CURR_NAME,BASE_TO_OTHER,QTE_BASE_TO_OTHER from data0001';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP06.Edit;
      cdsBP06.FieldByName('d01_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsBP06.FieldByName('CurRate').AsFloat := LFrm.adsPick1.FieldByName('QTE_BASE_TO_OTHER').AsFloat;
      cdsBP06.Post;

      //同步货币
      if dm1.cdsLookup278.Locate('PARAMETER_NAME','bCurrName',[loCaseInsensitive]) then
      begin
        if cdsBP10_Sale.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsString,[loCaseInsensitive]) then
        begin
          cdsBP10_Sale.Edit;
          cdsBP10_Sale.FieldByName('Param_Value').AsString := cdsBP06.FieldByName('curr_name').AsString;
          cdsBP10_Sale.Post;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btn7Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'EMPL_CODE/人员代码/150,EMPLOYEE_NAME/人员名称/150';
  LIn.Sqlstr := 'select EMPL_CODE,RKEY,EMPLOYEE_NAME from data0005';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP06.Edit;
      cdsBP06.FieldByName('saleman').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsBP06.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btn8Click(Sender: TObject);
  procedure SameQuanJu(AQuanJu,ACut: string);
  begin
    if ACut = '' then exit;

    if dm1.cdsLookup278.Locate('parameter_name',AQuanJu,[loCaseInsensitive]) then
    begin
      if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
      begin
        cdsBP10.Edit;
        cdsBP10.FieldByName('param_value').AsString := cdsBP11.FieldByName(acut).AsString;
        cdsBP10.Post;
      end;
    end;

  end;
var
  LIni: TIniFile;
  LTmp: ITmp;
  LCds: TClientDataSet;
  tmpS: string;
  LFrm: TfrmBOMPaoJiainPutPCSSize;
  LPCSPerSet: Integer;
  LPcsW,LPcsL: string;
  LSetW,LSetL: string;
begin
  LFrm := TfrmBOMPaoJiainPutPCSSize.Create(Self);
  if dm1.cdsLookup278.Locate('parameter_name','bPCS_L',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LFrm.edt1.Text := cdsBP10.FieldByName('param_value').AsString;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bPCS_W',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LFrm.edt2.Text := cdsBP10.FieldByName('param_value').AsString;
    end;
  end;

  if dm1.cdsLookup278.Locate('parameter_name','bSet_L',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LFrm.edtSetL.Text := cdsBP10.FieldByName('param_value').AsString;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bSet_W',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LFrm.edtSetW.Text := cdsBP10.FieldByName('param_value').AsString;
    end;
  end;



  if dm1.cdsLookup278.Locate('parameter_name','bPCSPerSet',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LFrm.edtPcsPerSet.Text := cdsBP10.FieldByName('param_value').AsString;
    end;
  end;
  try
    if LFrm.ShowModal = mrOk then
    begin
      //LPCSL := StrToIntDef(LFrm.edt1.Text,0);
      //LPCSW := StrToIntDef(LFrm.edt2.Text,0);
      LPCSPerSet := StrToInt(LFrm.edtPcsPerSet.Text);
      if dm1.cdsLookup278.Locate('parameter_name','bPCS_L',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := LFrm.edt1.Text;
          cdsBP10.Post;
          LPcsL := LFrm.edt1.Text;
        end;
      end;

      if dm1.cdsLookup278.Locate('parameter_name','bPCS_W',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := LFrm.edt2.Text;
          cdsBP10.Post;
          LPcsW := LFrm.edt2.Text;
        end;
      end;

      if dm1.cdsLookup278.Locate('parameter_name','bSet_W',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := LFrm.edtSetW.Text;
          cdsBP10.Post;
        end;
      end;

      if dm1.cdsLookup278.Locate('parameter_name','bSet_L',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := LFrm.edtSetL.Text;
          cdsBP10.Post;
        end;
      end;

      if dm1.cdsLookup278.Locate('parameter_name','bPCSPerSet',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsInteger := StrToInt(LFrm.edtPcsPerSet.Text);
          cdsBP10.Post;
        end;
      end;
    end else
      Exit;

    LSetW := LFrm.edtSetW.Text;
    LSetL := LFrm.edtSetL.Text;
  finally
    LFrm.Free;
  end;

  LTmp := TTmp.Create;
  LCds := TClientDataSet.Create(Self);
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+'PinBan.ini');
  try
    LIni.EraseSection('SheetList');
    LIni.EraseSection('DefDefCutParam');
    LIni.EraseSection('CutRet');
    LIni.EraseSection('DefCutParam');
    LCds.Data := LTmp.SqlOpen('select selected,Length,Width from data0503 order by rkey');
    while not LCds.Eof do
    begin
      tmpS := LCds.FieldByName('Length').AsString + 'x'+ LCds.FieldByName('width').AsString;
      if LCds.FieldByName('selected').AsBoolean then
        tmpS := tmpS + 'sY'
      else
        tmpS := tmpS + 'sN';
      LIni.WriteString('SheetList',IntToStr(LCds.RecNo),tmpS);
      LCds.Next;
    end;

    LCds.Data := LTmp.SqlOpen('Select cut_unit_tp,cut_l1_max,cut_l1_min,cut_w1_max,cut_w1_min,cut_l2_max,cut_l2_min,cut_w2_max,cut_w2_min,SPACE_L_Min,SPACE_w_Min,border_l_min,border_w_min from data0192');
    LIni.WriteString('DefCutParam','PnlSetW_A',LSetL);
    LIni.WriteString('DefCutParam','PnlSetH_A',LSetW);
    LIni.WriteString('DefCutParam','PnlMinW_A',LCds.FieldByName('cut_l1_min').AsString);
    LIni.WriteString('DefCutParam','PnlMaxW_A',LCds.FieldByName('cut_l1_max').AsString);
    LIni.WriteString('DefCutParam','PnlMinH_A',LCds.FieldByName('cut_w1_min').AsString);
    LIni.WriteString('DefCutParam','PnlMaxH_A',LCds.FieldByName('cut_w1_max').AsString);
    LIni.WriteString('DefCutParam','PnlBorderLeftRightW_A',LCds.FieldByName('border_w_min').AsString);
    LIni.WriteString('DefCutParam','PnlBorderTopBottomW_A',LCds.FieldByName('border_l_min').AsString);
    LIni.WriteString('DefCutParam','SetVerSpace_A',LCds.FieldByName('space_w_min').AsString);
    LIni.WriteString('DefCutParam','SetHorSpace_A',LCds.FieldByName('space_l_min').AsString);
    if CallPCBCut then
    begin
    //
      if cdsbp11.IsEmpty then
      begin
        cdsbp11.Append;
        cdsBP11.FieldByName('IDKey').AsString := IBP11.CreateKeyID;
        cdsBP11.FieldByName('BP06_ptr').AsString := FIDKey;
      end else
        cdsbp11.Edit;
      cdsBP11.FieldByName('SheetW').AsString := LIni.ReadString('CutRet','SheetW','0');
      cdsBP11.FieldByName('SheetH').AsString := LIni.ReadString('CutRet','SheetH','0');
      cdsBP11.FieldByName('SetW_A').AsString := LIni.ReadString('CutRet','SetW_A','0');
      cdsBP11.FieldByName('SetH_A').AsString := LIni.ReadString('CutRet','SetH_A','0');
      cdsBP11.FieldByName('PnlCount_A').AsString := LIni.ReadString('CutRet','PnlCount_A','0');
      cdsBP11.FieldByName('PnlW_A').AsString := LIni.ReadString('CutRet','PnlW_A','0');
      cdsBP11.FieldByName('PnlH_A').AsString := LIni.ReadString('CutRet','PnlH_A','0');
      cdsBP11.FieldByName('SetCountPerPnl_A').AsString := LIni.ReadString('CutRet','SetCountPerPnl_A','0');
      cdsBP11.FieldByName('SetHorSapce_A').AsString := LIni.ReadString('CutRet','SetHorSapce_A','0');
      cdsBP11.FieldByName('SetVerSapce_A').AsString := LIni.ReadString('CutRet','SetVerSapce_A','0');
      cdsBP11.FieldByName('PnlLeftRightBorderW_A').AsString := LIni.ReadString('CutRet','PnlLeftRightBorderW_A','0');
      cdsBP11.FieldByName('PnlTopBottomBorderW_A').AsString := LIni.ReadString('CutRet','PnlTopBottomBorderW_A','0');
      cdsBP11.FieldByName('SheetUseage').AsString := LIni.ReadString('CutRet','SheetUseage','0');
      cdsBP11.FieldByName('PnlCount_B').AsString := LIni.ReadString('CutRet','PnlCount_B','0');
      cdsBP11.FieldByName('PnlW_B').AsString := LIni.ReadString('CutRet','PnlW_B','0');
      cdsBP11.FieldByName('PnlH_B').AsString := LIni.ReadString('CutRet','PnlH_B','0');
      cdsBP11.FieldByName('SetCountPerPnl_B').AsString := LIni.ReadString('CutRet','SetCountPerPnl_B','0');
      cdsBP11.FieldByName('PnlLeftRightBorderW_B').AsString := LIni.ReadString('CutRet','PnlLeftRightBorderW_B','0');
      cdsBP11.FieldByName('PnlTopBottomBorderW_B').AsString := LIni.ReadString('CutRet','PnlTopBottomBorderW_B','0');
      TBlobField(cdsBP11.FieldByName('SheetImg')).LoadFromFile(LIni.ReadString('CutRet','SheetImg',''));
      TBlobField(cdsBP11.FieldByName('PnlAImg')).LoadFromFile(LIni.ReadString('CutRet','PnlImg_A',''));
      if LIni.ReadInteger('CutRet','PnlCount_B',0) > 0 then
        TBlobField(cdsBP11.FieldByName('PnlBImg')).LoadFromFile(LIni.ReadString('CutRet','PnlImg_B',''))
      else
        TBlobField(cdsBP11.FieldByName('PnlBImg')).Clear;
      cdsBP11.Post;
      img1.Picture.LoadFromFile(LIni.ReadString('CutRet','SheetImg',''));
      img2.Picture.LoadFromFile(LIni.ReadString('CutRet','PnlImg_A',''));
      if LIni.ReadInteger('CutRet','PnlCount_B',0) > 0 then
       img3.Picture.LoadFromFile(LIni.ReadString('CutRet','PnlImg_B',''))
      else
        img3.Picture := nil;


      LSetW := cdsBP11.FieldByName('SetW_A').AsString;
      LSetL := cdsBP11.FieldByName('SetH_A').AsString;
      //同步全局参数
      SameQuanJu('bPCS_L','');
      SameQuanJu('bPCS_W','');
      SameQuanJu('bPCSPerSet','');
      SameQuanJu('bSet_L','SetW_A');
      SameQuanJu('bSet_W','SetH_A');
      SameQuanJu('bPNlA_L','PnlW_A');
      SameQuanJu('bPNLA_W','PnlH_A');

      if dm1.cdsLookup278.Locate('parameter_name','bPCSPerA',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * LPCSPerSet);
          cdsBP10.Post;
        end;
      end;

      SameQuanJu('bPCSPerA','');
      SameQuanJu('bSetPerA','SetCountPerPnl_A');
      SameQuanJu('bPNLB_L','PnlW_B');
      SameQuanJu('bPNLB_W','PnlH_B');
      SameQuanJu('bPCSPerB','');
      if dm1.cdsLookup278.Locate('parameter_name','bPCSPerB',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_B').AsInteger * LPCSPerSet);
          cdsBP10.Post;
        end;
      end;
      SameQuanJu('bSetPerB','SetCountPerPnl_B');
      SameQuanJu('bSheet_L','SheetW');
      SameQuanJu('bSheet_W','SheetH');
      SameQuanJu('bPCSPerS','');
      if dm1.cdsLookup278.Locate('parameter_name','bPCSPerS',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * LPCSPerSet * cdsBP11.FieldByName('PnlCount_A').AsInteger +
                            cdsBP11.FieldByName('SetCountPerPnl_B').AsInteger * LPCSPerSet * cdsBP11.FieldByName('PnlCount_B').AsInteger);
          cdsBP10.Post;
        end;
      end;
      SameQuanJu('bSetPerS','');
      if dm1.cdsLookup278.Locate('parameter_name','bSetPerS',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * cdsBP11.FieldByName('PnlCount_A').AsInteger +
                            cdsBP11.FieldByName('SetCountPerPnl_B').AsInteger * cdsBP11.FieldByName('PnlCount_B').AsInteger);
          cdsBP10.Post;
        end;
      end;
      SameQuanJu('bPnlAPerS','PnlCount_A');
      SameQuanJu('bPnlBPerS','PnlCount_B');
      SameQuanJu('bUseAge','SheetUseage');

      if dm1.cdsLookup278.Locate('parameter_name','bPCSPerM',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsString :=
          FormatFloat('0.0000000',
          (cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * LPCSPerSet) /
          cdsBP11.FieldByName('PnlW_A').AsFloat/
          cdsBP11.FieldByName('PnlH_A').AsFloat*
          1000000);

          cdsBP10.Post;
        end;
      end;

      if dm1.cdsLookup278.Locate('parameter_name','bPnlA_S',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsFloat :=
            cdsBP11.FieldByName('PnlW_A').AsFloat *
            cdsBP11.FieldByName('PnlH_A').AsFloat;
          cdsBP10.Post;
        end;
      end;

      if dm1.cdsLookup278.Locate('parameter_name','bPcs_S',[loCaseInsensitive]) then
      begin
        if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10.Edit;
          cdsBP10.FieldByName('param_value').AsFloat :=
            StrToFloatDef(LSetW,0) * StrToFloatDef(LSetL,0) / LPCSPerSet;
          cdsBP10.Post;
        end;
      end;

    end;
  finally
    LIni.Free;
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btn9Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'CODE/层压代码/150,DESCRIPTION/层压名称/150';
  LIn.Sqlstr := 'select RECORD_KEY,CODE, DESCRIPTION, layers_info from data0193 where SPEC_RKEY <> ''Y''';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP06.Edit;
      cdsBP06.FieldByName('yahetxt').AsString := LFrm.adsPick1.FieldByName('layers_info').AsString;
      cdsBP06.Post;
    end;
  finally
    LFrm.Free;
  end;
end;


procedure TfrmEditBOMBaoJia.btnAllBomPickBomClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
  lcds: TClientDataSet;
  Itmp: IData;
  LCbx: TRzComboBox;
begin
  LCbx := cbxAllBomDeptBomType;
  if LCbx.ItemIndex = -1 then Exit;

  LIn.Fields := 'INV_PART_NUMBER/材料编码/150,INV_NAME/材料名称/100,INV_DESCRIPTION/规格型号/200,ABBR_NAME/供应商简称/100,SUPPLIER_PART_NO/供应商型号/100,PRICE_1/价格/100,TDATE/价格日期/80,STOCK_SELL/采购单位面积/80';
  LIn.Sqlstr := ' SELECT CASE WHEN d28.CURRENCY_PTR = 1 THEN CASE WHEN d28.tax_flag = ''Y'' THEN d28.PRICE_1 / (d28.TAX_2 /100 + 1.0) ELSE d28.PRICE_1 END ' +
              	' ELSE CASE WHEN d28.tax_flag =''Y'' THEN (d28.PRICE_1 * d01.BASE_TO_OTHER) / (d28.TAX_2 /100 + 1.0) ELSE d28.PRICE_1 * d01.BASE_TO_OTHER END END AS PRICE_1 ,d28.SUPPLIER_PART_NO,' +
                ' d17.rkey,d28.rkey as rkey28,d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION,d23.ABBR_NAME,d23.SUPPLIER_NAME,d28.TDATE,d28.SUPPLIER_PART_NO,d17.STOCK_SELL FROM data0017 d17 ' +
                ' INNER JOIN data0028 d28 on d17.RKEY = d28.INVENTORY_PTR ' +
                ' INNER JOIN data0023 d23 ON d28.SUPPLIER_PTR = d23.RKEY ' +
                ' INNER Join data0496 d496 on d17.group_ptr = d496.rkey ' +
                ' INNER JOIN Data0001 d01 ON d01.RKEY = d28.CURRENCY_PTR ' +
                ' where d17.group_ptr = ' + IntToStr(Integer(Lcbx.Items.Objects[Lcbx.ItemIndex])) +
                ' and d28.QTE_PRICE > 0 ' +
                //' and d496.quote_flag = 1 ' +
                ' and d28.AVL_FLAG <> ''N''' +
                ' and d17.STOP_PURCH <> ''Y''' +
                ' and d23.status = 0 and d17.ACTIVE_FLAG = ''Y''' +
                ' order by d23.ABBR_NAME desc,d28.tdate desc';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  lcds := TClientDataSet.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      Itmp := TTmp.Create;
      Itmp.SetSql('select * from bomprice04 where d34_ptr = ' + IntToStr(cdsAllBomDept.FieldByName('d34_ptr').AsInteger));
      lcds.Data := Itmp.GetData;

      cdsBP08.Append;
      cdsBP08.FieldByName('idkey').AsString := IBP08.CreateKeyID;
      cdsBP08.FieldByName('bp06_ptr').AsString := cdsBP06.FieldByName('idkey').AsString;
      cdsBP08.FieldByName('bp07_ptr').AsString := cdsAllBomDept.FieldByName('idkey').AsString;
      cdsBP08.FieldByName('d34_ptr').AsInteger := cdsAllBomDept.FieldByName('d34_ptr').AsInteger;
      cdsBP08.FieldByName('d496_ptr').AsInteger := Integer(Lcbx.Items.Objects[Lcbx.ItemIndex]);
      cdsBP08.FieldByName('selforder').AsInteger := cdsBP08.RecordCount + 1;
      cdsBP08.FieldByName('d17_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsbp08.FieldByName('calcstr').AsString := lcds.FieldByName('calcstr').AsString;
      cdsBP08.FieldByName('d28_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey28').AsInteger;
      cdsBP08.FieldByName('step_number').AsInteger := cdsAllBomDept.FieldByName('selforder').AsInteger;
      cdsBP08.FieldByName('beishu').AsInteger := 1;
      cdsBP08.Post;
    end;
  finally
    LFrm.Free;
    lcds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btnLoadCutClick(Sender: TObject);
var
  LCds: TClientDataSet;
  LTmp: ITmp;
begin
  if tvMI.Selected <> nil then
  begin
    LCds := TClientDataSet.Create(self);
    LTmp := ttmp.Create;
    try
      LCds.Data := LTmp.SqlOpen('select rkey from data0025 where manu_part_number = ' + QuotedStr(tvMI.Selected.Text));
      if not LCds.IsEmpty then
      begin
        if LoadCutParam(LCds.FieldByName('rkey').AsInteger) then
          ShowMessage('读取完成')
        else
          ShowMessage('读取失败');
      end;
    finally
      LCds.Free;
    end;
  end;

end;

procedure TfrmEditBOMBaoJia.btnReadMIDepeParamClick(Sender: TObject);
var
  LCds: TClientDataSet;
  LTmp: ITmp;
begin
  if cdsBP06.FieldByName('d25_ptr').AsInteger = 0 then
  begin
    ShowMessage('请选择本厂编号');
    Exit;
  end;

  LCds := TClientDataSet.Create(Self);
  LTmp := ttmp.Create;
  try
    {$REGION '加载工序'}
//    LSql := ' SELECT d34.DEPT_NAME,d38.DEPT_PTR,d38.STEP_NUMBER,d494.PARAMETER_PTR,d494.PARAMETER_VALUE,d278.PARAMETER_NAME,d278.PARAMETER_DESC FROM data0038 d38 ' +
//            ' INNER join data0034 d34 on d34.RKEY = d38.DEPT_PTR ' +
//            ' INNER JOIN data0494 d494 on d494.custpart_ptr = d38.SOURCE_PTR and d494.step_number = d38.STEP_NUMBER ' +
//            ' INNER join data0278 d278 on d278.RKEY = d494.PARAMETER_PTR ' +
//            ' WHERE d38.SOURCE_PTR = ' + cdsBP06.FieldByName('d25_ptr').AsString +
//            ' order by d38.STEP_NUMBER ASC ';
//    cdsD494.Data := LTmp.SqlOpen(LSql);
    {$ENDREGION}
  finally
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.btnReadMIStepClick(Sender: TObject);
var
  LCds: TClientDataSet;
  LCdstmp: TClientDataSet;
  lcdstmp2: TClientDataSet;
  lcds38: TClientDataSet;
  lcds494: TClientDataSet;
  Ltmp: Itmp;
  LSql: string;
  FTOPRkey25: string;
  Lslist: TStringList;
  LRkey25Arr: string;
  LNode: TTreeNode;
  I: Integer;
  LBp07Idkey: string;

begin
  if MessageBox(Handle,'导入会覆盖当前流程和参数，是否继续！','警告',MB_YESNO) <> IDYES then
  begin
    Exit;
  end;
  FTOPRkey25 := cdsBP06.FieldByName('d25_ptr').AsString;
  if FTOPRkey25 = '' then Exit;
  LoadCutParam(StrToInt(FTOPRkey25));

  tvMI.Items.Clear;
  //创建TREEVIEW树状节点
  LSql := ' ;WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) AS ' +
          '(' +
          ' SELECT RKey,1,MANU_PART_NUMBER,PARENT_PTR FROM Data0025 WHERE RKey = ' + FTOPRkey25 +
          ' UNION ALL ' +
          ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR ' +
          ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ' +
          ')' +
          ' SELECT * FROM CTE ORDER BY lv ASC';
  LCds := TClientDataSet.Create(Self);
  LCdstmp := TClientDataSet.Create(Self);
  LCdstmp.DisableControls;
  lcds38 := TClientDataSet.Create(Self);
  lcds38.DisableControls;
  lcds494 := TClientDataSet.Create(Self);
  lcds494.DisableControls;
  lcdstmp2 := TClientDataSet.Create(Self);
  lcdstmp2.DisableControls;
  Lslist := TStringList.Create;

  cdsBP07.DisableControls;
  cdsBP07.AfterScroll := nil;
  cdsBP07.AfterPost := nil;

  cdsBP08.DisableControls;
  cdsBP08.AfterScroll := nil;
  cdsBP08.AfterPost := nil;
  cdsBP08.OnCalcFields := nil;

  cdsBP09.DisableControls;
  cdsBP09.AfterScroll := nil;
  cdsBP09.AfterPost := nil;
  cdsBP09.OnCalcFields := nil;


  Ltmp := ttmp.Create;
  DisableAllDS(FDSList);
  try
    LCds.Data := Ltmp.SqlOpen(LSql);
    if not lcds.IsEmpty then
    begin
      while not LCds.Eof do
      begin
        LRkey25Arr := LRkey25Arr + ',' + LCds.FieldByName('rkey').AsString;
        if (LCds.FieldByName('PARENT_PTR').IsNull) or (tvMI.Items.Count = 0) then
        begin
          LNode := tvMI.Items.AddChild(nil,LCds.FieldByName('MANU_PART_NUMBER').AsString);
          LNode.Data := Pointer(LNode.Level);
          Lslist.AddObject(LCds.FieldByName('rkey').AsString,LNode);
        end else
        begin
          for I := 0 to Lslist.Count - 1 do
          begin
            if Lslist[I] = LCds.FieldByName('PARENT_PTR').AsString then
            begin
              LNode := tvMI.Items.AddChild(lslist.Objects[I] as TTreeNode,LCds.FieldByName('MANU_PART_NUMBER').AsString);
              LNode.Data := Pointer(LNode.Level);
              Lslist.AddObject(LCds.FieldByName('rkey').AsString,LNode);
              Break;
            end;
          end;
        end;
        LCds.Next;
      end;
    end;
    tvMI.Items[0].Expand(True);


    {$REGION '清空原有流程'}
    cdsBP08.Filtered := False;
    while not cdsBP08.IsEmpty do
      cdsBP08.Delete;

    cdsBP09.Filtered := False;
    while not cdsBP09.IsEmpty do
      cdsBP09.Delete;

    cdsBP07.AfterScroll := nil;
    cdsBP07.Filtered := False;
    while not cdsBP07.IsEmpty do
      cdsBP07.Delete;

    {$ENDREGION}

(*
    //添加流程
    LSql := ' ;WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) AS ' +
            '(' +
            ' SELECT RKey,1,MANU_PART_NUMBER,PARENT_PTR FROM Data0025 WHERE RKey = ' + FTOPRkey25 +
            ' UNION ALL ' +
            ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR ' +
            ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ' +
            ')' +
            ' SELECT * FROM CTE ORDER BY lv Desc';
    LCds.Data := Ltmp.SqlOpen(LSql);
    LCds.First;
*)
    LRkey25Arr := '(-1' + LRkey25Arr + ')';
    lcds38.Data := Ltmp.SqlOpen('select dept_ptr,step_number from data0038 where source_ptr in ' + LRkey25Arr + ' order by source_ptr desc,step_number asc');
    LCdstmp.Data := ltmp.SqlOpen('select idkey,d34_ptr from bomprice02');
    lcds494.Data := Ltmp.SqlOpen('select * from data0494 where custpart_ptr in ' + LRkey25Arr);
    lcds38.First;
    while not lcds38.Eof do
    begin
      if not LCdstmp.Locate('d34_ptr',lcds38.FieldByName('dept_ptr').AsInteger,[loCaseInsensitive]) then
      begin
        lcdstmp2.Data := Ltmp.SqlOpen('select dept_name from data0034 where rkey = ' + lcds38.FieldByName('dept_ptr').AsString);
        ShowMessage('工序[' + lcdstmp2.FieldByName('dept_name').AsString + ']没有找到，请用BOM成本中心添加 ' + #13 + '导入流程失败');
        Exit;
      end else
      begin
        LBp07Idkey := AddBOMDept(lcds38.FieldByName('dept_ptr').AsString,1,False,False);

        lcds494.Filter := 'step_number = ' + lcds38.FieldByName('step_number').AsString;
        lcds494.Filtered := True;

        cdsBP09.Filter := 'bp07_ptr = ' + QuotedStr(LBp07Idkey);
        cdsBP09.Filtered := True;

        lcds494.First;
        while not lcds494.Eof do
        begin
          if cdsBP09.Locate('d278_ptr',lcds494.FieldByName('PARAMETER_PTR').AsInteger,[loCaseInsensitive]) then
          begin
            cdsBP09.Edit;
            cdsBP09.FieldByName('param_value').Value := lcds494.FieldByName('PARAMETER_VALUE').Value;
            cdsBP09.Post;
          end;
          lcds494.Next;
        end;
      end;
      lcds38.Next;
    end;
    cdsBP07AfterScroll(cdsBP07);
    ShowMessage('读取完成');
    Exit;




    while not LCds.Eof do
    begin
      lcds38.Data := Ltmp.SqlOpen('select dept_ptr,step_number from data0038 where source_ptr = ' + LCds.FieldByName('rkey').AsString + ' order by step_number asc');
      lcds38.First;
      while not lcds38.Eof do
      begin
        LSql := 'select idkey,dept_name from bomprice02 right join data0034 on d34_ptr = rkey where rkey = ' + lcds38.FieldByName('dept_ptr').AsString;
        LCdstmp.Data := Ltmp.SqlOpen(LSql);
        if LCdstmp.FieldByName('idkey').AsString = '' then
        begin
          ShowMessage('工序[' + LCdstmp.FieldByName('dept_name').AsString + ']没有找到，请用BOM成本中心添加 ' + #13 + '导入流程失败');
          Exit;
        end else
        begin
          LBp07Idkey := AddBOMDept(lcds38.FieldByName('dept_ptr').AsString,1);
          //读取参数
          LSql := 'select * from data0494 where custpart_ptr = ' + LCds.FieldByName('rkey').AsString + ' and step_number = ' +
                  lcds38.FieldByName('step_number').AsString;
          lcds494.Data := Ltmp.SqlOpen(LSql);
          lcds494.First;
          cdsBP09.Filter := 'bp07_ptr = ' + QuotedStr(LBp07Idkey);
          cdsBP09.Filtered := True;
          while not lcds494.Eof do
          begin
            if cdsBP09.Locate('d278_ptr',lcds494.FieldByName('PARAMETER_PTR').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP09.Edit;
              cdsBP09.FieldByName('param_value').Value := lcds494.FieldByName('PARAMETER_VALUE').Value;
              cdsBP09.Post;
            end;
            lcds494.Next;
          end;

        end;
        lcds38.Next;
      end;
      LCds.Next;
    end;

  finally
    cdsBP07.First;
    while not cdsBP07.Eof do
    begin
      cdsBP07.Edit;
      cdsBP07.FieldByName('selforder').AsInteger := cdsBP07.RecNo;
      cdsBP07.Post;
      cdsBP07.Next;
    end;
      //cdsBP07.Locate('idkey',Lbp07key,[loCaseInsensitive]);

    cdsBP09.Filter := '';
    cdsBP09.Filtered := False;

    cdsBP07.EnableControls;
    cdsBP07.AfterScroll := cdsBP07AfterScroll;


    cdsBP08.EnableControls;
    cdsBP08.OnCalcFields := cdsBP08CalcFields;

    cdsBP09.EnableControls;
    cdsBP09.AfterScroll := cdsBP09AfterScroll;
    cdsBP09.OnCalcFields := cdsBP09CalcFields;

    EnableAllDS(FDSList);
    LCds.Free;
    lcds38.Free;
    LCdstmp.Free;
    lcds494.Free;
    Lslist.Free;
  end;
  cdsBP07AfterScroll(cdsBP07);
  ShowMessage('读取完成');
end;



function TfrmEditBOMBaoJia.CallPCBCut: Boolean;
type
  pfShowPCBCutFrm = function (AOwner: TComponent): Boolean;stdcall;
var
  pf: Pointer;
  hMod: HWND;
begin
  Result := False;
  with TResourceStream.Create(HInstance,'RC1',RT_RCDATA) do
  begin
    try
      SaveToFile(PChar(ExtractFilePath(ParamStr(0))+'WZPCBCut.dll'));
    finally
      Free;
    end;
  end;
  hMod := LoadLibrary(PChar(ExtractFilePath(ParamStr(0)) + 'WZPCBCut.dll'));
  if (hMod <> 0) and (hMod <> INVALID_HANDLE_VALUE) then
  begin
    pf := GetProcAddress(hMod,'ShowPCBCutFrm');
    if pf <> nil then
      Result := pfShowPCBCutFrm(pf)(nil);
    FreeLibrary(hMod);
  end
end;

procedure TfrmEditBOMBaoJia.cdsAllBomDeptAfterScroll(DataSet: TDataSet);
var
  LSql: string;
  LTmp: Itmp;
  LCds: TClientDataSet;
begin
  cbxAllBomDeptBomType.Items.Clear;
  LTmp := TTmp.Create;
  LSql := ' select d496.rkey,d496.GROUP_DESC from bomprice04 bp04 ' +
          ' INNER JOIN data0496 d496 ON d496.RKEY = bp04.D496_ptr ' +
          ' where bp04.d34_ptr = ' + IntToStr(cdsAllBomDept.FieldByName('d34_ptr').AsInteger) +
          ' ORDER by bp04.D496_ptr asc' ;
  LCds := TClientDataSet.Create(Self);
  try
    LCds.Data := LTmp.SqlOpen(LSql);
    while not LCds.Eof do
    begin
      cbxAllBomDeptBomType.Items.AddObject(LCds.FieldByName('GROUP_DESC').AsString,Pointer(LCds.FieldByName('rkey').AsInteger));
      LCds.Next;
    end;
    if cbxAllBomDeptBomType.Items.Count > 0 then
      cbxAllBomDeptBomType.ItemIndex := 0;
  finally
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.cdsBP06CalcFields(DataSet: TDataSet);
var
  Ltmp: ITmp;
  lcds: TClientDataSet;
begin
  lcds := TClientDataSet.Create(Self);
  Ltmp := TTmp.Create;
  try
    //25
    lcds.Data := Ltmp.SqlOpen('select manu_part_number from data0025 where rkey = ' + IntToStr(cdsBP06.FieldByName('d25_ptr').AsInteger));
    cdsBP06.FieldByName('manu_part_number').AsString := lcds.FieldByName('manu_part_number').AsString;

    //00
    lcds.Data := Ltmp.SqlOpen('select bpname from bomprice00 where idkey = ' + QuotedStr(cdsBP06.FieldByName('bp00_ptr').AsString));
    cdsBP06.FieldByName('pricetypename').AsString := lcds.FieldByName('bpname').AsString;

    lcds.Data := Ltmp.SqlOpen('select rkey, CODE, QTE_APPROV_DESC from data0264 where rkey = ' + IntToStr(cdsBP06.FieldByName('d264_ptr').AsInteger));
    cdsBP06.FieldByName('shenpiliucheng').AsString := lcds.FieldByName('QTE_APPROV_DESC').AsString;

    //pall +　报废
    cdsBP06.FieldByName('PAllAndBaoFei_Pcs').AsFloat :=
      cdsBP06.FieldByName('P1P2P3P4P5_Pcs').AsFloat + cdsBP06.FieldByName('baofei_cost_pcs').AsFloat;
    cdsBP06.FieldByName('PAllAndBaoFei_M').AsFloat :=
      cdsBP06.FieldByName('P1P2P3P4P5_M').AsFloat + cdsBP06.FieldByName('baofei_cost_M').AsFloat;

    cdsBP06.FieldByName('AllYuJiMaoLiLv').AsFloat :=
      cdsBP06.FieldByName('chanpinyongtu_add').AsFloat +
      cdsBP06.FieldByName('xiaoshouquyu_add').AsFloat +
      cdsBP06.FieldByName('dingdanshuliang_add').AsFloat;

    if cdsBP06.FieldByName('OrignPrice').AsFloat <> 0 then
    begin
      cdsBP06.FieldByName('OrignZL').AsFloat := cdsBP06.FieldByName('buhanshuijiage_Pcs').AsFloat / cdsBP06.FieldByName('OrignPrice').AsFloat * 100;
    end else
      cdsBP06.FieldByName('OrignZL').AsFloat := 0;
  finally
    lcds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.cdsBP07AfterScroll(DataSet: TDataSet);
var
  Itmp: IData;
  LSql: string;
  LCds: TClientDataSet;
begin
  if pgcBom.ActivePage <> tsDept then
    Exit;
  if cdsBP09.State in [dsEdit,dsInsert] then cdsBP09.Post;
  cdsBP09.Filter := 'bp07_ptr=' + QuotedStr(cdsBP07.FieldByName('IDkey').AsString);
  cdsBP09.Filtered := True;

  if cdsBP08.State in [dsEdit,dsInsert] then cdsBP08.Post;
  cdsBP08.Filter := 'bp07_ptr=' + QuotedStr(cdsBP07.FieldByName('IDkey').AsString);
  cdsBP08.Filtered := True;

  cbxDeptBomType.Items.Clear;
  Itmp := TTmp.Create;
  LSql := ' select d496.rkey,d496.GROUP_DESC from bomprice04 bp04 ' +
          ' INNER JOIN data0496 d496 ON d496.RKEY = bp04.D496_ptr ' +
          ' where bp04.d34_ptr = ' + IntToStr(cdsBP07.FieldByName('d34_ptr').AsInteger) +
          ' ORDER by bp04.D496_ptr asc' ;
  Itmp.SetSql(LSql);
  LCds := TClientDataSet.Create(Self);
  try
    LCds.Data := Itmp.GetData;
    while not LCds.Eof do
    begin
      cbxDeptBomType.Items.AddObject(LCds.FieldByName('GROUP_DESC').AsString,Pointer(LCds.FieldByName('rkey').AsInteger));
      LCds.Next;
    end;
    if cbxDeptBomType.Items.Count > 0 then
      cbxDeptBomType.ItemIndex := 0;
  finally
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.cdsBP08CalcFields(DataSet: TDataSet);
var
  LTmp: ITmp;
  LCds: TClientDataSet;
  LSql: string;
begin
  LTmp := TTmp.Create;
  LCds := TClientDataSet.Create(Self);
  try
    LSql := ' SELECT CASE WHEN d28.CURRENCY_PTR = 1 THEN CASE WHEN d28.tax_flag = ''Y'' THEN d28.PRICE_1 / (d28.TAX_2 /100 + 1.0) ELSE d28.PRICE_1 END ' +
           	' ELSE CASE WHEN d28.tax_flag =''Y'' THEN (d28.PRICE_1 * d01.BASE_TO_OTHER) / (d28.TAX_2 /100 + 1.0) ELSE d28.PRICE_1 * d01.BASE_TO_OTHER END END AS PRICE_1 ,' +
            ' d17.INV_PART_NUMBER,d17.INV_PART_DESCRIPTION,d23.ABBR_NAME,d23.SUPPLIER_NAME,d28.TDATE FROM data0017 d17 ' +
                ' INNER JOIN data0028 d28 on d17.RKEY = d28.INVENTORY_PTR ' +
                ' INNER JOIN data0023 d23 ON d28.SUPPLIER_PTR = d23.RKEY ' +
                ' INNER JOIN Data0001 d01 ON d01.RKEY = d28.CURRENCY_PTR ' +
                ' where d28.rkey = ' +  IntToStr(cdsBP08.FieldByName('d28_ptr').AsInteger);
    LCds.Data := LTmp.SqlOpen(LSql);
    cdsBP08.FieldByName('MName').AsString := LCds.FieldByName('INV_PART_DESCRIPTION').AsString;
    cdsBP08.FieldByName('INV_PART_NUMBER').AsString := LCds.FieldByName('INV_PART_NUMBER').AsString;
    cdsBP08.FieldByName('SUPPLIER_NAME').AsString := LCds.FieldByName('SUPPLIER_NAME').AsString;
    cdsBP08.FieldByName('PRICE_1').AsString := LCds.FieldByName('PRICE_1').AsString;
    cdsBP08.FieldByName('TDATE').AsString := LCds.FieldByName('TDATE').AsString;
  finally
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.cdsBP09AfterPost(DataSet: TDataSet);
begin
  cdsBP09AfterScroll(cdsBP09);
end;

procedure TfrmEditBOMBaoJia.cdsBP09AfterScroll(DataSet: TDataSet);
var
  Ltmp: ITmp;
  LCds: TClientDataSet;
begin
  LCds := TClientDataSet.Create(Self);
  Ltmp := TTmp.Create;
  try
    if pgcBom.ActivePage = tsDept then
    begin
      LCds.Data := Ltmp.SqlOpen('select tvalue from data0338 where parameter_ptr=' + IntToStr(cdsbp09.FieldByName('d278_ptr').AsInteger));
      ehDeptParam.Columns[1].PickList.Clear;
      while not LCds.Eof do
      begin
        ehDeptParam.Columns[1].PickList.Add(lcds.FieldByName('tvalue').AsString);
        LCds.Next;
      end;
    end;
    if pgcBom.ActivePage = tsAllParam then
    begin
      LCds.Data := Ltmp.SqlOpen('select tvalue from data0338 where parameter_ptr=' + IntToStr(cdsbp09.FieldByName('d278_ptr').AsInteger));
      ehBP09.Columns[2].PickList.Clear;
      while not LCds.Eof do
      begin
        ehBP09.Columns[2].PickList.Add(lcds.FieldByName('tvalue').AsString);
        LCds.Next;
      end;

    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.cdsBP09CalcFields(DataSet: TDataSet);
var
  LCds: TClientDataSet;
  LTmp: ITmp;
begin
  LCds := TClientDataSet.Create(Self);
  LTmp := ttmp.Create;
  try
    LCds.Data := LTmp.SqlOpen('select color from bomprice03 where D278_ptr = ' + IntToStr(cdsBP09.FieldByName('D278_ptr').AsInteger) + ' and d34_ptr = ' + IntToStr(cdsBP09.FieldByName('d34_ptr').AsInteger));
    if not LCds.IsEmpty then
      cdsBP09.FieldByName('color').AsString := LCds.FieldByName('Color').AsString;
  finally
    LCds.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.cdsBP10AfterPost(DataSet: TDataSet);
begin
  cdsBP10AfterScroll(DataSet);
end;

procedure TfrmEditBOMBaoJia.cdsBP10AfterScroll(DataSet: TDataSet);
var
  ITmp: TTmp;
  LCDS: TClientDataSet;
begin
  LCDS := TClientDataSet.Create(Self);
  ITmp := TTmp.Create;
  try
    if pgcBom.ActivePage = tsAllParam then
    begin
      ehAllParamMI.Columns[1].PickList.Clear;
      LCDS.Data := ITmp.SqlOpen('select tvalue from data0338 where parameter_ptr=' + IntToStr(cdsBP10.FieldByName('d278_ptr').AsInteger));
      while not LCDS.Eof do
      begin
        ehAllParamMI.Columns[1].PickList.Add(LCDS.FieldByName('tvalue').AsString);
        LCDS.Next;
      end;
    end;
  finally
    LCDS.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.cdsBP10_SaleAfterScroll(DataSet: TDataSet);
var
  ITmp: TTmp;
  LCDS: TClientDataSet;
begin
  LCDS := TClientDataSet.Create(Self);
  ITmp := TTmp.Create;
  try
    if pgcBom.ActivePage = tsAllParam then
    begin
      ehAllParamSale.Columns[1].PickList.Clear;
      LCDS.Data := ITmp.SqlOpen('select tvalue from data0338 where parameter_ptr=' + IntToStr(cdsBP10_Sale.FieldByName('d278_ptr').AsInteger));
      while not LCDS.Eof do
      begin
        ehAllParamSale.Columns[1].PickList.Add(LCDS.FieldByName('tvalue').AsString);
        LCDS.Next;
      end;
    end;
  finally
    LCDS.Free;
  end;
end;


procedure TfrmEditBOMBaoJia.chk1Click(Sender: TObject);
begin
  imgYaHe.Stretch := chk1.Checked;
end;

procedure TfrmEditBOMBaoJia.DisableAllDS(ADSList: TList<TDataSet>);
var
  I: Integer;
begin
  for I := 0 to ADSList.Count - 1 do
  begin
    if Assigned(ADSList[I].AfterScroll) then
      FArrAfterScrollEvent[I] := ADSList[I].AfterScroll;
    ADSList[I].AfterScroll := nil;
//
    FArrFilterStr[I] := ADSList[I].Filter;
    ADSList[I].Filter := '';
    FArrFilterB[I] := ADSList[I].Filtered;
    ADSList[I].DisableControls;
  end;
end;

procedure TfrmEditBOMBaoJia.edtbuhanshuijiage_PcsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if cdsBP06.State in [dsEdit,dsInsert] then cdsBP06.Post;
    cdsBP06.Edit;

    if cdsbp06.FieldByName('zengzhishui_add').AsFloat <> 0 then
    begin
      cdsBP06.FieldByName('hanshuijiage_Pcs').Value := cdsBP06.FieldByName('buhanshuijiage_Pcs').Value *
      (1+ cdsBP06.FieldByName('zengzhishui_add').Value/100);
    end else
    begin
      cdsBP06.FieldByName('hanshuijiage_Pcs').Value := cdsBP06.FieldByName('buhanshuijiage_Pcs').Value;
    end;


    //毛利率
    cdsBP06.FieldByName('maolilv_add').AsFloat :=
    (1- cdsBP06.FieldByName('PAllAndBaoFei_pcs').AsFloat /
      cdsBP06.FieldByName('buhanshuijiage_pcs').AsFloat) * 100;


    cdsBP06.Post;
    ReCalcByMaoLiLv(0,0,TRzDBEdit(Sender).Tag);
  end;
end;

procedure TfrmEditBOMBaoJia.edthanshuijiage_PcsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if cdsBP06.State in [dsEdit,dsInsert] then cdsBP06.Post;
    cdsBP06.Edit;


    if cdsbp06.FieldByName('zengzhishui_add').AsFloat <> 0 then
    begin
    cdsBP06.FieldByName('buhanshuijiage_pcs').Value :=
      cdsBP06.FieldByName('hanshuijiage_pcs').Value /
        (1 + cdsBP06.FieldByName('zengzhishui_add').Value / 100);
    end else
    begin
      cdsbp06.FieldByName('buhanshuijiage_pcs').Value := cdsbp06.FieldByName('hanshuijiage_pcs').Value;
    end;

    //毛利率
    cdsBP06.FieldByName('maolilv_add').AsFloat :=
    (1- cdsBP06.FieldByName('PAllAndBaoFei_pcs').AsFloat /
      cdsBP06.FieldByName('buhanshuijiage_pcs').AsFloat) * 100;

    cdsBP06.Post;

    ReCalcByMaoLiLv(0,0,TRzDBEdit(Sender).Tag);
  end;
end;

procedure TfrmEditBOMBaoJia.edtmaolilvKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  begin
    if cdsBP06.State in [dsEdit,dsInsert] then cdsBP06.Post;
    ReCalcByMaoLiLv(0,0);
  end;
end;

procedure TfrmEditBOMBaoJia.ehParamGlobMIEnter(Sender: TObject);
begin
  cdsBP10AfterScroll(cdsbp10);
end;

procedure TfrmEditBOMBaoJia.EnableAllDS(ADSList: TList<TDataSet>);
var
  I: Integer;
begin
  for I := 0 to ADSList.Count - 1 do
  begin
    ADSList[I].Filter := FArrFilterStr[I];
    ADSList[I].Filtered := FArrFilterB[I];
    ADSList[I].EnableControls;
    ADSList[I].AfterScroll := FArrAfterScrollEvent[I];
  end;
end;

procedure TfrmEditBOMBaoJia.eh3Columns2EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  if cdsBP08.IsEmpty then Exit;

  LIn.Fields := 'INV_PART_NUMBER/材料编码/150,INV_NAME/材料名称/100,INV_DESCRIPTION/规格型号/300,ABBR_NAME/供应商简称/100,SUPPLIER_NAME/供应商全称/150,PRICE_1/价格/100,TDATE/价格日期/120';
  LIn.Sqlstr := ' SELECT d17.rkey,d28.rkey as rkey28,d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION,d23.ABBR_NAME,d23.SUPPLIER_NAME,d28.PRICE_1,d28.TDATE FROM data0017 d17 ' +
                ' INNER JOIN data0028 d28 on d17.RKEY = d28.INVENTORY_PTR ' +
                ' INNER JOIN data0023 d23 ON d28.SUPPLIER_PTR = d23.RKEY ' +
                ' where d17.group_ptr = ' + cdsBP08.FieldByName('d496_ptr').AsString +
                ' order by d23.ABBR_NAME desc,d28.tdate desc';

  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP08.Edit;
      cdsBP08.FieldByName('d17_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsBP08.FieldByName('d28_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey28').AsInteger;
      cdsBP08.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.ehBP09DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
  var
  LEH: TDBGridEh;
begin
  LEH := sender as TDBGridEh;
  if cdsBP09.FieldByName('color').AsString <> '' then
    LEH.Canvas.Font.Color := StringToColor(cdsBP09.FieldByName('color').AsString);
  LEH.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmEditBOMBaoJia.FormCreate(Sender: TObject);
begin
  FDSList := TList<TDataSet>.Create;
  FDSList.Add(cdsBP06);
  FDSList.Add(cdsBP07);
  FDSList.Add(cdsBP08);
  FDSList.Add(cdsBP09);
  FDSList.Add(cdsBP10);
  FDSList.Add(cdsBP10_Sale);
  FDSList.Add(cdsBP11);

  SetLength(FArrAfterScrollEvent,FDSList.Count);
  SetLength(FArrFilterStr,FDSList.Count);
  SetLength(FArrFilterB,FDSList.Count);

  GetLookUpdata;
  IBP06 := TBP06.Create;
  IBP10 := TBP10.Create;
  IBP10_Sale := TBP10.Create;
  IBP11 := TBP11.Create;
  IBP07 := TBP07.Create;
  IBP09 := TBP09.Create;
  IBP08 := TBP08.Create;
end;

procedure TfrmEditBOMBaoJia.FormDestroy(Sender: TObject);
begin
  FDSList.Free;
end;

procedure TfrmEditBOMBaoJia.FormShow(Sender: TObject);
begin
  pgcBom.ActivePageIndex := 0;
  pg2.ActivePageIndex := 0;
  pgcMI.ActivePageIndex := 0;

  if FBCopy then
    GetCopyData
  else
    GetData;



  if gUser.User_Permit <> '8' then
  begin
  tsAllCalc.TabVisible := StrToIntdef(gUser.User_Permit,1) > 4;
  //DBText7.Visible := gUser.User_Permit = '4';
  eh5.FieldColumns['PRICE_1'].Visible := StrToIntdef(gUser.User_Permit,1) > 4;
  ehBP08.FieldColumns['PRICE_1'].Visible := StrToIntdef(gUser.User_Permit,1) > 4;
  end;

  if guser.User_Permit = '8' then
  begin
    pnl31.Visible := False;
    tsCalcBom.TabVisible := False;
    ts7.TabVisible := False;
    grp1.Visible := False;
    grp2.Visible := false;
  end;

end;


procedure TfrmEditBOMBaoJia.GetCopyData;
var
  LTmp: ITmp;
  LCds: TClientDataSet;
  LNewIDKey06: string;
  LField: TField;
  LSeqNo: Integer;
  LCdsBp09,LCdsBp08: TClientDataSet;
  //LSql: string;
begin
  //edtManuPartNum.Text := '';

  LNewIDKey06 := IBP06.CreateKeyID;

  LTmp := ttmp.Create;
  LCds := TClientDataSet.Create(Self);
  LCdsBp09 := TClientDataSet.Create(Self);
  LCdsBp08 := TClientDataSet.Create(Self);
  DisableAllDS(FDSList);
  try

    {$REGION '拷贝BP06'}
    //BP06
    LCds.Data := LTmp.SqlOpen('select * from bomprice06 where idkey = ' + QuotedStr(FIDKey));
    IBP06.SetSql('select * from bomprice06 where idkey = ' + QuotedStr(LNewIDKey06));
    cdsBP06.Data := IBP06.GetData;
    cdsBP06.Append;
    cdsBP06.FieldByName('IDKey').AsString := LNewIDKey06;
    cdsBP06.FieldByName('AuthStatus').AsInteger := 0;
    cdsBP06.FieldByName('CreateMan').AsString := gUser.User_Ptr;
    cdsBP06.FieldByName('BPNO').AsString := IBP06.CreateBPNO(LSeqNo);
    cdsBP06.FieldByName('Seqno').AsInteger := -1;
    cdsBP06.FieldByName('BPTime').AsDateTime := dm1.GetSvrNowTime;
    cdsBP06.FieldByName('Createtime').AsDateTime := dm1.GetSvrNowTime;
    for LField in cdsBP06.Fields do
    begin
      if StrInArr(LField.FieldName,['IDKey','AuthStatus','CreateMan','BPNO','Seqno','BPTime','CreateMan'])
        or LField.ReadOnly or (LField.FieldKind <> fkData) then
        Continue;
      LField.Value := LCds.FindField(LField.FieldName).Value;
    end;
    cdsBP06.Post;
    Load_JPG_Pic_From_DB(cdsBP06.FieldByName('yaheimg'),imgYaHe);
    {$ENDREGION}

    {$REGION '拷贝BP10'}
    //拷贝BP10
    LCds.Data := LTmp.SqlOpen('select * from bomprice10 where bp06_ptr = ' + QuotedStr(FIDKey) + ' and ttype = 4 order by d278_ptr asc');
    IBP10.SetSql('select * from bomprice10 where bp06_ptr = ' + QuotedStr(LNewIDKey06) + ' and ttype = 4 order by d278_ptr asc');
    cdsBP10.Data := IBP10.GetData;
    LCds.First;
    while not LCds.Eof do
    begin
      cdsBP10.Append;
      cdsBP10.FieldByName('IDKey').AsString := IBP10.CreateKeyID;
      cdsBP10.FieldByName('BP06_Ptr').AsString := LNewIDKey06;
      for LField in cdsBP10.Fields do
      begin
        if StrInArr(LField.FieldName,['IDKey','BP06_Ptr'])
          or LField.ReadOnly or (LField.FieldKind <> fkData)
        then
          Continue
        else
          LField.Value := LCds.FindField(LField.FieldName).Value;
      end;
      cdsBP10.Post;
      LCds.Next;
    end;
    {$ENDREGION}

    {$REGION '拷贝销售BP10'}
    //拷贝销售全局参数
    LCds.Data := LTmp.SqlOpen('select * from bomprice10 where bp06_ptr = ' + QuotedStr(FIDKey) + ' and ttype = 5 order by d278_ptr asc');
    IBP10_Sale.SetSql('select * from bomprice10 where bp06_ptr = ' + QuotedStr(LNewIDKey06) + ' and ttype = 5 order by d278_ptr asc');
    cdsBP10_Sale.Data := IBP10_Sale.GetData;
    LCds.First;
    while not LCds.Eof do
    begin
      cdsBP10_Sale.Append;
      cdsBP10_Sale.FieldByName('IDKey').AsString := IBP10_Sale.CreateKeyID;
      cdsBP10_Sale.FieldByName('BP06_Ptr').AsString := LNewIDKey06;
      for LField in cdsBP10_Sale.Fields do
      begin
        if StrInArr(LField.FieldName,['IDKey','BP06_Ptr'])
          or LField.ReadOnly or (LField.FieldKind <> fkData)
        then
          Continue
        else
          LField.Value := LCds.FindField(LField.FieldName).Value;
      end;
      cdsBP10_Sale.Post;
      LCds.Next;
    end;
    {$ENDREGION}

    {$REGION '拷贝BP11'}
    //拷贝BP11
    LCds.Data := LTmp.SqlOpen('select * from bomprice11 where bp06_ptr = ' + QuotedStr(FIDKey));
    IBP11.SetSql('select * from bomprice11 where bp06_ptr = ' + QuotedStr(LNewIDKey06));
    cdsBP11.Data := IBP11.GetData;
    LCds.First;
    while not LCds.Eof do
    begin
      cdsBP11.Append;
      cdsBP11.FieldByName('IDKey').AsString := IBP11.CreateKeyID;
      cdsBP11.FieldByName('BP06_Ptr').AsString := LNewIDKey06;
      for LField in cdsBP11.Fields do
      begin
        if StrInArr(LField.FieldName,['IDKey','BP06_Ptr'])
          or LField.ReadOnly or (LField.FieldKind <> fkData)
        then
          Continue
        else
          LField.Value := LCds.FindField(LField.FieldName).Value;
      end;
      cdsBP11.Post;
      LCds.Next;
    end;
    Load_JPG_Pic_From_DB(cdsBP11.FieldByName('SheetImg'),img1);
    Load_JPG_Pic_From_DB(cdsBP11.FieldByName('PnlAImg'),img2);
    Load_JPG_Pic_From_DB(cdsBP11.FieldByName('PnlBImg'),img3);
    {$ENDREGION}


    {$REGION '拷贝BP07'}

    //拷贝BP07
    LCds.Data := LTmp.SqlOpen('select * from bomprice07 where bp06_ptr = ' + QuotedStr(FIDKey) + ' order by selforder asc');
    IBP07.SetSql('select * from bomprice07 where bp06_ptr = ' + QuotedStr(LNewIDKey06) + ' order by selforder asc');
    cdsBP07.Data := IBP07.GetData;
    IBP08.SetSql('select * from bomprice08 where 1=0');
    cdsBP08.Data := IBP08.GetData;
    IBP09.SetSql('select * from bomprice09 where 1=0');
    cdsBP09.Data := IBP09.GetData;
    LCds.First;
    while not LCds.Eof do
    begin
      cdsBP07.Append;
      cdsBP07.FieldByName('IDKey').AsString := IBP07.CreateKeyID;
      cdsBP07.FieldByName('BP06_Ptr').AsString := LNewIDKey06;
      for LField in cdsBP07.Fields do
      begin
        if StrInArr(LField.FieldName,['IDKey','BP06_Ptr'])
          or LField.ReadOnly or (LField.FieldKind <> fkData)
        then
          Continue
        else
          LField.Value := LCds.FindField(LField.FieldName).Value;
      end;
      cdsBP07.Post;

      {$REGION '拷贝BP09'}
//      LSql := ' SELECT Selforder,BOMPrice09.* FROM BOMPrice09 ' +
//              ' INNER JOIN BOMPrice07 ON BP07_ptr = BOMPrice07.IDKey ' +
//              ' WHERE BOMPrice09.bp07_ptr = ' + QuotedStr(lcds.FieldByName('IDKey').AsString) +
//              ' ORDER BY Selforder ';

      //LCdsBp09.Data := LTmp.SqlOpen(LSql);
      LCdsBp09.Data := LTmp.SqlOpen('select * from bomprice09 where bp07_ptr =' + QuotedStr(lcds.FieldByName('IDKey').AsString));
      LCdsBp09.First;
      while not LCdsBp09.Eof do
      begin
        cdsBP09.Append;
        cdsBP09.FieldByName('IDKey').AsString := IBP09.CreateKeyID;
        cdsBP09.FieldByName('BP06_Ptr').AsString := LNewIDKey06;
        cdsBP09.FieldByName('BP07_Ptr').AsString := cdsBP07.FieldByName('IDKey').AsString;
        for LField in cdsBP09.Fields do
        begin
          if StrInArr(LField.FieldName,['IDKey','BP06_Ptr','BP07_Ptr'])
            or LField.ReadOnly or (LField.FieldKind <> fkData)
          then
            Continue
          else
            LField.Value := LCdsBp09.FindField(LField.FieldName).Value;
        end;
        cdsBP09.Post;

        LCdsBp09.Next;
      end;
      {$ENDREGION}

      {$REGION '拷贝BP08'}
      LCdsBp08.Data := LTmp.SqlOpen('select * from bomprice08 where bp07_ptr =' + QuotedStr(lcds.FieldByName('IDKey').AsString));
      LCdsBp08.First;
      while not LCdsBp08.Eof do
      begin
        cdsBP08.Append;
        cdsBP08.FieldByName('IDKey').AsString := IBP08.CreateKeyID;
        cdsBP08.FieldByName('BP06_Ptr').AsString := LNewIDKey06;
        cdsBP08.FieldByName('BP07_Ptr').AsString := cdsBP07.FieldByName('IDKey').AsString;
        for LField in cdsBP08.Fields do
        begin
          if StrInArr(LField.FieldName,['IDKey','BP06_Ptr','BP07_Ptr'])
            or LField.ReadOnly or (LField.FieldKind <> fkData)
          then
            Continue
          else
            LField.Value := LCdsBp08.FindField(LField.FieldName).Value;
        end;
        cdsBP08.Post;

        LCdsBp08.Next;
      end;

      {$ENDREGION}

      LCds.Next;
    end;
    {$ENDREGION}

    FIDKey := LNewIDKey06;

    //添加后来添加的参数
    GetNewAddParam;
  finally
    LCds.Free;
    LCdsBp09.Free;
    LCdsBp08.Free;
    EnableAllDS(FDSList);
  end;
  cdsBP07AfterScroll(cdsBP07);
  lblBenBiPrice.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_Pcs').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);
  lblBenBiPriceM.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_M').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);
end;

procedure TfrmEditBOMBaoJia.GetData;
var
  LTmp: ITmp;
  LCds: TClientDataSet;
  //LSql: string;
begin
  LTmp := ttmp.Create;
  LCds := TClientDataSet.Create(Self);
  //DisableAllDS(FDSList);
  try


    IBP06.SetSql('select * from bomprice06 where idkey = ' + QuotedStr(FIDKey));
    cdsBP06.Data := IBP06.GetData;
    Load_JPG_Pic_From_DB(cdsBP06.FieldByName('yaheimg'),imgYaHe);

    if cdsBP06.IsEmpty then
      AddBP06;



    cdsBP10.AfterPost := nil;
    cdsBP10.AfterScroll := nil;
    IBP10.SetSql('select * from bomprice10 where bp06_ptr = ' + QuotedStr(FIDKey) + ' and ttype = 4 order by d278_ptr asc');
    cdsBP10.Data := IBP10.GetData;
    cdsBP10.AfterPost := cdsBP10AfterPost;
    cdsBP10.AfterScroll := cdsBP10AfterScroll;



    cdsBP10_Sale.AfterScroll := nil;
    IBP10_Sale.SetSql('select * from bomprice10 where bp06_ptr = ' + QuotedStr(FIDKey) + ' and ttype = 5 order by d278_ptr asc');
    cdsBP10_Sale.Data := IBP10_Sale.GetData;
    cdsBP10_Sale.AfterScroll := cdsBP10_SaleAfterScroll;



    IBP11.SetSql('select * from bomprice11 where bp06_ptr = ' + QuotedStr(FIDKey));
    cdsBP11.Data := IBP11.GetData;
    Load_JPG_Pic_From_DB(cdsBP11.FieldByName('SheetImg'),img1);
    Load_JPG_Pic_From_DB(cdsBP11.FieldByName('PnlAImg'),img2);
    Load_JPG_Pic_From_DB(cdsBP11.FieldByName('PnlBImg'),img3);



    cdsBP07.AfterScroll := nil;
    IBP07.SetSql('select * from bomprice07 where bp06_ptr = ' + QuotedStr(FIDKey) + ' order by selforder asc');
    cdsBP07.Data := IBP07.GetData;
    cdsBP07.AfterScroll := cdsBP07AfterScroll;



    cdsBP09.AfterScroll := nil;
    cdsBP09.AfterPost := nil;
    IBP09.SetSql('select * from bomprice09 where bp06_ptr = ' + QuotedStr(FIDKey));
//    LSql := ' SELECT Selforder,BOMPrice09.* FROM BOMPrice09 ' +
//            ' INNER JOIN BOMPrice07 ON BP07_ptr = BOMPrice07.IDKey ' +
//            ' WHERE BOMPrice09.BP06_ptr = ' + QuotedStr(FIDKey) +
//            ' ORDER BY Selforder ';
//    IBP09.SetSql(LSql);
    cdsBP09.Data := IBP09.GetData;
    cdsBP09.AfterScroll := cdsBP09AfterScroll;
    cdsBP09.AfterPost := cdsBP09AfterPost;



    cdsBP08.OnCalcFields := nil;
    IBP08.SetSql('select * from bomprice08 where bp06_ptr = ' + QuotedStr(FIDKey) + ' order by bp07_ptr asc');
    cdsBP08.Data := IBP08.GetData;
    cdsBP08.OnCalcFields := cdsBP08CalcFields;



    //加载后来添加的参数

    GetNewAddParam;

  finally
    LCds.Free;
    //EnableAllDS(FDSList);
  end;
  edtManuPartNum.Text := cdsBP06.FieldByName('manu_part_number').AsString;
  lblBenBiPrice.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_Pcs').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);
  lblBenBiPriceM.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_M').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);
  //cdsBP07AfterScroll(cdsBP07);
end;

procedure TfrmEditBOMBaoJia.GetLookUpdata;
var
  LTmp: ITmp;
begin
  LTmp := TTmp.Create;
  cdsLookUp01.Data := LTmp.SqlOpen('select RKEY,CURR_CODE,CURR_NAME,BASE_TO_OTHER,QTE_BASE_TO_OTHER from data0001');
  cdsLookUp05.Data := LTmp.SqlOpen('select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005');
  cdsLookup10.Data := LTmp.SqlOpen('select CUST_CODE,RKEY,CUSTOMER_NAME from data0010');
end;

procedure TfrmEditBOMBaoJia.GetNewAddParam;
var
  LCds: TClientDataSet;
  LTmp: ITmp;
  LSql: string;
begin
  LCds := TClientDataSet.Create(Self);
  LTmp := ttmp.Create;
  try
    //取得后来新加的全局参数
//    LSql := ' SELECT BP05.d278_ptr FROM BOMPrice00 bp00 ' +
//            ' INNER JOIN BOMPrice05 bp05 on bp00.IDKey = bp05.BP00_Ptr ' +
//            ' WHERE bp00.IDKey = ' + QuotedStr(cdsBP06.FieldByName('BP00_Ptr').AsString);
    LSql := 'select rkey as d278_ptr from data0278 where BomPriceType =1';
    LCds.Data := LTmp.SqlOpen(LSql);
    cdsBP10.AfterScroll := nil;
    cdsBP10.AfterPost := nil;
    LCds.First;
    while not LCds.Eof do
    begin
      if not cdsBP10.Locate('d278_ptr',LCds.FieldByName('d278_ptr').AsInteger,[loCaseInsensitive]) then
      begin
        cdsBP10.Append;
        cdsBP10.FieldByName('idkey').AsString := IBP10.CreateKeyID;
        cdsBP10.FieldByName('BP06_ptr').AsString := FIDKey;
        cdsBP10.FieldByName('D278_ptr').AsString := LCds.FieldByName('d278_ptr').AsString;
        cdsBP10.FieldByName('TType').AsInteger := 4;
        cdsBP10.Post;
      end;
      LCds.Next;
    end;
    cdsBP10.AfterScroll := cdsBP10AfterScroll;
    cdsBP10.AfterPost := cdsBP10AfterPost;

    //加载销售类全局参数
    if LTmp.SqlOpen('select rkey from data0278 where BomPriceType =2',LCds) then
    begin
      cdsBP10_Sale.AfterScroll := nil;
      LCds.First;
      while not LCds.Eof do
      begin
        if not cdsBP10_Sale.Locate('d278_ptr',LCds.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
        begin
          cdsBP10_Sale.Append;
          cdsBP10_Sale.FieldByName('idkey').AsString := IBP10_Sale.CreateKeyID;
          cdsBP10_Sale.FieldByName('BP06_ptr').AsString := FIDKey;
          cdsBP10_Sale.FieldByName('D278_ptr').AsString := LCds.FieldByName('rkey').AsString;
          cdsBP10_Sale.FieldByName('TType').AsInteger := 5;
          cdsBP10_Sale.Post;
        end;
        LCds.Next;
      end;
      cdsBP10_Sale.AfterScroll := cdsBP10_SaleAfterScroll;
    end;


    //下面是加载工序参数中遗漏的,也就是后来添加的
    cdsBP07.AfterScroll := nil;
    cdsBP09.AfterScroll := nil;
    cdsBP09.AfterPost := nil;
    cdsBP07.First;
    LSql := ' SELECT bp03.D278_ptr,bp03.Param_Value,d34_ptr FROM BOMPrice03 BP03 where d34_ptr in (';
    while not cdsBP07.Eof do
    begin
      LSql := LSql + cdsBP07.FieldByName('d34_ptr').AsString + ',';
      cdsBP07.Next;
    end;
    LSql := LSql + '0)';

    LCds.Data := LTmp.SqlOpen(LSql);
    cdsBP07.First;
    while not cdsBP07.Eof do
    begin
      LCds.Filter := 'd34_ptr = ' + cdsBP07.FieldByName('d34_ptr').AsString;
      LCds.Filtered := True;
      LCds.First;

      while not LCds.Eof do
      begin
        if not cdsBP09.Locate('bp07_ptr;d278_ptr',VarArrayOf([cdsBP07.FieldByName('IDKey').AsString,LCds.FieldByName('D278_ptr').AsInteger]),[loCaseInsensitive]) then
        begin
          cdsBP09.Append;
          cdsBP09.FieldByName('IDKey').AsString := IBP09.CreateKeyID;
          cdsBP09.FieldByName('BP06_Ptr').AsString := FIDKey;
          cdsBP09.FieldByName('d34_ptr').AsString := cdsBP07.FieldByName('d34_ptr').AsString;
          cdsBP09.FieldByName('BP07_Ptr').AsString := cdsBP07.FieldByName('IDKey').AsString;
          cdsBP09.FieldByName('d278_ptr'). AsInteger:= LCds.FieldByName('D278_ptr').AsInteger;
          cdsBP09.FieldByName('param_value').AsString := LCds.FieldByName('param_value').AsString;
          cdsBP09.Post;
        end;
        lcds.Next;
      end;

      cdsBP07.Next;
    end;

//    while not cdsBP07.Eof do
//    begin
//      LSql := ' SELECT bp03.D278_ptr,bp03.Param_Value FROM BOMPrice03 BP03 ' +
//              ' INNER JOIN bomprice07 bp07 on bp07.D34_ptr = bp03.D34_ptr ' +
//              ' WHERE bp07.d34_ptr = ' + cdsBP07.FieldByName('d34_ptr').AsString;
//      LCds.Data := LTmp.SqlOpen(LSql);
//      while not LCds.Eof do
//      begin
//        if not cdsBP09.Locate('bp07_ptr;d278_ptr',VarArrayOf([cdsBP07.FieldByName('IDKey').AsString,LCds.FieldByName('D278_ptr').AsInteger]),[loCaseInsensitive]) then
//        begin
//          cdsBP09.Append;
//          cdsBP09.FieldByName('IDKey').AsString := IBP09.CreateKeyID;
//          cdsBP09.FieldByName('BP06_Ptr').AsString := FIDKey;
//          cdsBP09.FieldByName('d34_ptr').AsString := cdsBP07.FieldByName('d34_ptr').AsString;
//          cdsBP09.FieldByName('BP07_Ptr').AsString := cdsBP07.FieldByName('IDKey').AsString;
//          cdsBP09.FieldByName('d278_ptr'). AsInteger:= LCds.FieldByName('D278_ptr').AsInteger;
//          cdsBP09.FieldByName('param_value').AsString := LCds.FieldByName('param_value').AsString;
//          cdsBP09.Post;
//        end;
//        lcds.Next;
//      end;
//      cdsBP07.Next;
//    end;
    cdsBP07.AfterScroll := cdsBP07AfterScroll;
    cdsBP09.AfterScroll := cdsBP09AfterScroll;
    cdsBP09.AfterPost := cdsBP09AfterPost;

  finally
    LCds.Free;
  end;
end;

function TfrmEditBOMBaoJia.GetPcsSq: Double;
var
  LSetL,LSetW,LPcsS: Double;
  LPcsPerSet: Integer;

begin
  if dm1.cdsLookup278.Locate('parameter_name','bSet_L',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetL := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bSet_W',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LSetW := cdsBP10.FieldByName('param_value').AsFloat;
    end;
  end;
  if dm1.cdsLookup278.Locate('parameter_name','bPCSPerSet',[loCaseInsensitive]) then
  begin
    if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
    begin
      LPcsPerSet := cdsBP10.FieldByName('param_value').AsInteger;
    end;
  end;
  LPcsS := LSetL * LSetW / LPcsPerSet;
  Result := LPcsS;
end;

procedure TfrmEditBOMBaoJia.InlineLoadCustInfo(ARkey10: string);
var
  LSql: string;
  LTmp: ITmp;
  LCds: TClientDataSet;
begin
  LSql := 'select QTE_BASE_TO_OTHER,d10.CONTACT_NAME_1,d10.CONT_PHONE_1,d10.EMAIL_FOR_CONTACT1,d01.BASE_TO_OTHER,CUST_CODE,d10.FED_TAX_ID_NO,d10.RKEY,CUSTOMER_NAME,SALES_REP_PTR,CURRENCY_PTR from data0010 d10 ' +
                ' left join data0001 d01 on d01.rkey = d10.CURRENCY_PTR' +
                ' where d10.rkey = ' + IntToStr(StrToIntDef(ARkey10,0));
  LTmp := ttmp.Create;
  LCds := TClientDataSet.Create(nil);
  try
    LCds.Data := LTmp.SqlOpen(LSql);
    if not LCds.IsEmpty then
    begin
      cdsBP06.Edit;
      cdsBP06.FieldByName('d10_ptr').AsInteger := LCds.FieldByName('rkey').AsInteger;
      cdsBP06.FieldByName('d01_ptr').AsInteger := LCds.FieldByName('CURRENCY_PTR').AsInteger;
      cdsBP06.FieldByName('SaleMan').AsInteger := LCds.FieldByName('SALES_REP_PTR').AsInteger;
      cdsBP06.FieldByName('CurRate').AsFloat := LCds.FieldByName('QTE_BASE_TO_OTHER').AsFloat;
      cdsBP06.FieldByName('payment').AsString := LCds.FieldByName('FED_TAX_ID_NO').AsString;
      cdsBP06.FieldByName('Customer_Name').AsString := LCds.FieldByName('CUSTOMER_NAME').AsString;

      cdsBP06.FieldByName('CustomContectPeop').AsString := LCds.FieldByName('CONTACT_NAME_1').AsString;
      cdsBP06.FieldByName('CustomContectPhone').AsString := LCds.FieldByName('CONT_PHONE_1').AsString;
      cdsBP06.FieldByName('CustomContectEmail').AsString := LCds.FieldByName('EMAIL_FOR_CONTACT1').AsString;
      cdsBP06.Post;

      //同步客户代码
      if dm1.cdsLookup278.Locate('PARAMETER_NAME','bCustCode',[loCaseInsensitive]) then
      begin
        if cdsBP10_Sale.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsString,[loCaseInsensitive]) then
        begin
          cdsBP10_Sale.Edit;
          cdsBP10_Sale.FieldByName('Param_Value').AsString := cdsBP06.FieldByName('cust_code').AsString;
          cdsBP10_Sale.Post;
        end;
      end;
      //同步货币
      if dm1.cdsLookup278.Locate('PARAMETER_NAME','bCurrName',[loCaseInsensitive]) then
      begin
        if cdsBP10_Sale.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsString,[loCaseInsensitive]) then
        begin
          cdsBP10_Sale.Edit;
          cdsBP10_Sale.FieldByName('Param_Value').AsString := cdsBP06.FieldByName('curr_name').AsString;
          cdsBP10_Sale.Post;
        end;
      end;
    end;
  finally
    LCds.Free;
  end;


end;

function TfrmEditBOMBaoJia.LoadCutParam(ARkey25: Integer): Boolean;
  procedure SameQuanJu(AQuanJu,ACut: string);
  begin
    if ACut = '' then exit;

    if dm1.cdsLookup278.Locate('parameter_name',AQuanJu,[loCaseInsensitive]) then
    begin
      if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
      begin
        cdsBP10.Edit;
        cdsBP10.FieldByName('param_value').AsString := cdsBP11.FieldByName(acut).AsString;
        cdsBP10.Post;
      end;
    end;

  end;
var
  LCds: TClientDataSet;
  LTmp: ITmp;
  LSql: string;

  LPcsW,LPcsL,LPcsSQ: string;
  LSetW,LSetL: string;
  LPCSPerSet: Integer;
  LCPJS,LLAYERS: string;
begin
  Result := False;
  if ARkey25 = 0 then
  begin
    ShowMessage('请选择本厂编号');
    Exit;
  end;

  if cdsBP06.FieldByName('BP00_ptr').AsString = '' then
  begin
    ShowMessage('必须先选择一个报价框架才可以继续');
    Exit;
  end;

  LCds := TClientDataSet.Create(Self);
  LTmp := TTmp.Create;
  DisableAllDS(FDSList);
  try

    if ARkey25 > 0 then
    begin
      {$REGION '加载拼版'}
      LCds.Data := LTmp.SqlOpen('select * from data0502 where source_ptr = ' + IntToStr(ARkey25));
      if not LCds.IsEmpty then
      begin
        if cdsbp11.IsEmpty then
        begin
          cdsbp11.Append;
          cdsBP11.FieldByName('IDKey').AsString := IBP11.CreateKeyID;
          cdsBP11.FieldByName('BP06_ptr').AsString := FIDKey;
        end else
          cdsbp11.Edit;

        cdsBP11.FieldByName('SheetW').Value := LCds.FieldByName('sht_len').Value;
        cdsBP11.FieldByName('SheetH').Value := LCds.FieldByName('sht_wth').Value;
        cdsBP11.FieldByName('SetW_A').Value := LCds.FieldByName('unit_len').Value;
        cdsBP11.FieldByName('SetH_A').Value := LCds.FieldByName('unit_wth').Value;
        cdsBP11.FieldByName('PnlCount_A').Value := LCds.FieldByName('total_pnls_1').Value;
        cdsBP11.FieldByName('PnlW_A').Value := LCds.FieldByName('pnl_len').Value;
        cdsBP11.FieldByName('PnlH_A').Value := LCds.FieldByName('pnl_wth').Value;
        cdsBP11.FieldByName('SetCountPerPnl_A').Value := LCds.FieldByName('upanel').Value;
        cdsBP11.FieldByName('SetHorSapce_A').Value := LCds.FieldByName('minspace1').Value;
        cdsBP11.FieldByName('SetVerSapce_A').Value := LCds.FieldByName('minspace2').Value;
        cdsBP11.FieldByName('PnlLeftRightBorderW_A').Value := LCds.FieldByName('pnl_wthspace').Value;
        cdsBP11.FieldByName('PnlTopBottomBorderW_A').Value := LCds.FieldByName('pnl_lenspace').Value;
        cdsBP11.FieldByName('SheetUseage').Value := LCds.FieldByName('Tusage').Value;
        cdsBP11.FieldByName('PnlCount_B').Value := LCds.FieldByName('total_pnls_2').Value;
        cdsBP11.FieldByName('PnlW_B').Value := LCds.FieldByName('pnl_len_2').Value;
        cdsBP11.FieldByName('PnlH_B').Value := LCds.FieldByName('pnl_wth_2').Value;
        cdsBP11.FieldByName('SetCountPerPnl_B').Value := LCds.FieldByName('upanel_2').Value;
        //cdsBP11.FieldByName('PnlLeftRightBorderW_B').Value := LCds.FieldByName('').Value;
        //cdsBP11.FieldByName('PnlTopBottomBorderW_B').Value := LCds.FieldByName('').Value;
        cdsBP11.FieldByName('SheetImg').Value := LCds.FieldByName('sheet_BMP').Value;
        cdsBP11.FieldByName('PnlAImg').Value := LCds.FieldByName('pnl_bmp').Value;
        cdsBP11.FieldByName('PnlBImg').Value := LCds.FieldByName('pnl2_bmp').Value;
        Load_JPG_Pic_From_DB(cdsBP11.FieldByName('SheetImg'),img1);
        Load_JPG_Pic_From_DB(cdsBP11.FieldByName('PnlAImg'),img2);
        Load_JPG_Pic_From_DB(cdsBP11.FieldByName('PnlBImg'),img3);
        cdsBP11.Post;
      end;
      {$ENDREGION}


      {$REGION '加载写死的全局参数'}
      //PCS尺寸
      LSql := 'SELECT layers_image,layers_info,cpjs,LAYERS,set_qty,pcs_lngth,pcs_width,pcs_sq,spell_lngth,spell_width,spell_qty from data0025 where rkey=' + IntToStr(ARkey25);
      LCds.Data := LTmp.SqlOpen(LSql);
      LPcsW := LCds.FieldByName('pcs_width').AsString;
      LPcsL := LCds.FieldByName('pcs_lngth').AsString;
      LSetW := LCds.FieldByName('spell_width').AsString;
      LSetL := LCds.FieldByName('spell_lngth').AsString;
      LPcsSQ := LCds.FieldByName('pcs_sq').AsString;
      LPCSPerSet := LCds.FieldByName('spell_qty').AsInteger;
      LCPJS := LCds.FieldByName('cpjs').AsString;
      LLAYERS := LCds.FieldByName('LAYERS').AsString;
      //读取压合
      cdsBP06.Edit;
      cdsBP06.FieldByName('YaHeTxt').Value := LCds.FieldByName('layers_info').Value;
      cdsBP06.FieldByName('yaheimg').Value := LCds.FieldByName('layers_image').Value;
      cdsBP06.Post;
      Load_JPG_Pic_From_DB(cdsBP06.FieldByName('yaheimg'),imgYaHe);

      //加载全局
      LSql := ' select d279.parameter_ptr,d279.parameter_value,d278.SPEC_RKEY from data0279 d279 ' +
              ' inner join data0278 d278 on d278.rkey = d279.parameter_ptr ' +
              ' where d279.source_ptr = ' + IntToStr(ARkey25);
      LCds.Data := LTmp.SqlOpen(LSql);
      if not LCds.IsEmpty then
      begin
        cdsBP10.DisableControls;
        try
          if dm1.cdsLookup278.Locate('parameter_name','bPCS_W',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := LPcsW;
              cdsBP10.Post;
            end;
          end;
          if dm1.cdsLookup278.Locate('parameter_name','bPCS_L',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := LPcsL;
              cdsBP10.Post;
            end;
          end;
          if dm1.cdsLookup278.Locate('parameter_name','bPcs_S',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := LPcsSQ;
              cdsBP10.Post;
            end;
          end;
          if dm1.cdsLookup278.Locate('parameter_name','bPCSPerSet',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsInteger := LPCSPerSet;
              cdsBP10.Post;
            end;
          end;
          if dm1.cdsLookup278.Locate('parameter_name','cpjs',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := LCPJS;
              cdsBP10.Post;
            end;
          end;
          if dm1.cdsLookup278.Locate('parameter_name','LAYERS',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := LLAYERS;
              cdsBP10.Post;
            end;
          end;
          if dm1.cdsLookup278.Locate('parameter_name','bSet_L',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := LSetL;
              cdsBP10.Post;
            end;
          end;
          if dm1.cdsLookup278.Locate('parameter_name','bSet_W',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := LSetW;
              cdsBP10.Post;
            end;
          end;

          //SameQuanJu('bSet_L','SetW_A');
          //SameQuanJu('bSet_W','SetH_A');
          SameQuanJu('bPNlA_L','PnlW_A');
          SameQuanJu('bPNLA_W','PnlH_A');

          if dm1.cdsLookup278.Locate('parameter_name','bPCSPerA',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * LPCSPerSet);
              cdsBP10.Post;
            end;
          end;

          SameQuanJu('bPCSPerA','');
          SameQuanJu('bSetPerA','SetCountPerPnl_A');
          SameQuanJu('bPNLB_L','PnlW_B');
          SameQuanJu('bPNLB_W','PnlH_B');
          SameQuanJu('bPCSPerB','');
          if dm1.cdsLookup278.Locate('parameter_name','bPCSPerB',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_B').AsInteger * LPCSPerSet);
              cdsBP10.Post;
            end;
          end;

          SameQuanJu('bSetPerB','SetCountPerPnl_B');
          SameQuanJu('bSheet_L','SheetW');
          SameQuanJu('bSheet_W','SheetH');
          SameQuanJu('bPCSPerS','');

          if dm1.cdsLookup278.Locate('parameter_name','bPCSPerS',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * LPCSPerSet * cdsBP11.FieldByName('PnlCount_A').AsInteger +
                                cdsBP11.FieldByName('SetCountPerPnl_B').AsInteger * LPCSPerSet * cdsBP11.FieldByName('PnlCount_B').AsInteger);
              cdsBP10.Post;
            end;
          end;
          SameQuanJu('bSetPerS','');
          if dm1.cdsLookup278.Locate('parameter_name','bSetPerS',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsString := IntToStr(cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * cdsBP11.FieldByName('PnlCount_A').AsInteger +
                                cdsBP11.FieldByName('SetCountPerPnl_B').AsInteger * cdsBP11.FieldByName('PnlCount_B').AsInteger);
              cdsBP10.Post;
            end;
          end;
          SameQuanJu('bPnlAPerS','PnlCount_A');
          SameQuanJu('bPnlBPerS','PnlCount_B');
          SameQuanJu('bUseAge','SheetUseage');

          if dm1.cdsLookup278.Locate('parameter_name','bPCSPerM',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              try
                cdsBP10.Edit;
                cdsBP10.FieldByName('param_value').AsString :=
                FormatFloat('0.0000000',
                (cdsBP11.FieldByName('SetCountPerPnl_A').AsInteger * LPCSPerSet) /
                cdsBP11.FieldByName('PnlW_A').AsFloat/
                cdsBP11.FieldByName('PnlH_A').AsFloat*
                1000000);

                cdsBP10.Post;
              except
                ShowMessage('导入拼版失败，请确认MI是否有正确拼版数据,或选择其他层次导入');
                Exit;
              end;
            end;
          end;

          if dm1.cdsLookup278.Locate('parameter_name','bPnlA_S',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsFloat :=
                cdsBP11.FieldByName('PnlW_A').AsFloat *
                cdsBP11.FieldByName('PnlH_A').AsFloat;
              cdsBP10.Post;
            end;
          end;

          if dm1.cdsLookup278.Locate('parameter_name','bPcs_S',[loCaseInsensitive]) then
          begin
            if cdsBP10.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]) then
            begin
              try
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').AsFloat :=
                StrToFloatDef(LSetW,0) * StrToFloatDef(LSetL,0) / LPCSPerSet;
              cdsBP10.Post;
              except
                ShowMessage('导入拼版失败，请确认MI是否有正确拼版数据,或选择其他层次导入');
                Exit;
              end;
            end;
          end;

          cdsBP10.First;
          while not cdsBP10.Eof do
          begin
            if LCds.Locate('parameter_ptr',cdsBP10.FieldByName('d278_ptr').AsInteger,[loCaseInsensitive]) then
            begin
              cdsBP10.Edit;
              cdsBP10.FieldByName('param_value').Value := LCds.FieldByName('parameter_value').Value;
              cdsBP10.Post;
            end;
            cdsBP10.Next;
          end;
        finally
          cdsBP10.EnableControls;
        end;
      end;


      {$ENDREGION}

    end;
    Result := True;
  finally
    EnableAllDS(FDSList);
    LCds.Free;
  end;

end;

procedure TfrmEditBOMBaoJia.LoadFromPriceType(ABP00_ptr: string);
var
  Ltmp: ITmp;
  LCds: TClientDataSet;
begin
  DisableAllDS(FDSList);
  while not cdsBP07.IsEmpty do cdsBP07.Delete;
  while not cdsBP10.IsEmpty do cdsBP10.Delete;

  LCds := TClientDataSet.Create(Self);
  LCds.DisableControls;
  Ltmp := TTmp.Create;
  try
    //bp06
    LCds.Data := Ltmp.SqlOpen('select * from bomprice00 where idkey = ' + QuotedStr(ABP00_ptr));
    cdsBP06.Edit;
    cdsBP06.FieldByName('yahetxt').Value := LCds.FieldByName('yahetext').Value;
    cdsBP06.FieldByName('yaheimg').Value := LCds.FieldByName('yaheimg').Value;
    cdsBP06.Post;
    Load_JPG_Pic_From_DB(cdsBP06.FieldByName('yaheimg'),imgYaHe);

    //bp07
    LCds.Data := Ltmp.SqlOpen('select * from bomprice01 where bp00_ptr = ' + QuotedStr(ABP00_ptr) + 'order by selforder asc');
    while not LCds.Eof do
    begin
      AddBOMDept(LCds.FieldByName('d34_ptr').AsString,LCds.FieldByName('beishu').AsInteger,False,False);
      LCds.Next;
    end;
    cdsBP07.First;
    while not cdsBP07.Eof do
    begin
      cdsBP07.Edit;
      cdsBP07.FieldByName('selforder').AsInteger := cdsBP07.RecNo;
      cdsBP07.Post;
      cdsBP07.Next;
    end;


    //bp10
    //LCds.Data := Ltmp.SqlOpen('select * from bomprice05 where bp00_ptr = ' + QuotedStr(ABP00_ptr));
    LCds.Data := Ltmp.SqlOpen('select rkey from data0278 where BomPriceType =1');
    while not LCds.Eof do
    begin
      cdsbp10.Append;
      cdsbp10.FieldByName('idkey').AsString := IBP10.CreateKeyID;
      cdsbp10.FieldByName('bp06_ptr').AsString := FIDKey;
      cdsbp10.FieldByName('d278_ptr').AsInteger := LCds.FieldByName('rkey').AsInteger;
      cdsbp10.Post;
      LCds.Next;
    end;
  finally
    LCds.Free;
    EnableAllDS(FDSList);
  end;

end;

//function TfrmEditBOMBaoJia.LocketByParamName(ADS: TClientDataSet;
//  AParamName: string): Boolean;
//begin
//  Result := False;
//  if dm1.cdsLookup278.Locate('parameter_name',AParamName,[loCaseInsensitive]) then
//  begin
//    Result := ADS.Locate('d278_ptr',dm1.cdsLookup278.FieldByName('rkey').AsInteger,[loCaseInsensitive]);
//  end;
//end;

procedure TfrmEditBOMBaoJia.mniN1Click(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptAddParam;
begin
  LFrm := TfrmBOMBaoJiaDeptAddParam.Create(Self);
  try
    LFrm.FParamType := '2';
    if LFrm.ShowModal = mrOk then
    begin
      if cdsbp10.Locate('d278_ptr',LFrm.edt1.Tag,[loCaseInsensitive]) then
      begin
        ShowMessage('请勿重复添加参数');
        Exit;
      end;
      cdsbp10.Append;
      cdsbp10.FieldByName('idkey').AsString := IBP10.CreateKeyID;
      cdsbp10.FieldByName('bp06_ptr').AsString := FIDKey;
      cdsbp10.FieldByName('d278_ptr').AsInteger := LFrm.edt1.Tag;
      cdsbp10.FieldByName('param_value').AsString := LFrm.edt2.Text;
      cdsbp10.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.mniN2Click(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptAddParam;
begin
  LFrm := TfrmBOMBaoJiaDeptAddParam.Create(Self);
  try
    LFrm.btn1.Visible := False;
    LFrm.edt1.Tag :=  cdsbp10.FieldByName('d278_ptr').AsInteger;
    LFrm.edt1.Text := cdsbp10.FieldByName('param_name').AsString;
    LFrm.edt2.Text := cdsbp10.FieldByName('param_value').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      cdsbp10.Edit;
      cdsbp10.FieldByName('param_value').AsString := LFrm.edt2.Text;
      cdsbp10.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.mniN3Click(Sender: TObject);
begin
  cdsBP10.Delete;
end;

procedure TfrmEditBOMBaoJia.mniN4Click(Sender: TObject);
var
  LFrm: TfrmAddTypeDept;
begin
  LFrm := TfrmAddTypeDept.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      AddBOMDept(IntToStr(LFrm.edt1.Tag),LFrm.se1.Value,False);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditBOMBaoJia.mniN5Click(Sender: TObject);
begin
  cdsBP08.Delete;
end;

procedure TfrmEditBOMBaoJia.mniN6Click(Sender: TObject);
var
  LResetOrder: Boolean;
begin
  //删除p08
  cdsBP08.Filter := ' bp07_ptr = ' + QuotedStr(cdsBP07.FieldByName('idkey').AsString);
  cdsBP08.Filtered := True;
  while not cdsBP08.IsEmpty do
    cdsBP08.Delete;

  //删除bp09
  cdsBP09.Filter := ' bp07_ptr = ' + QuotedStr(cdsBP07.FieldByName('idkey').AsString);
  cdsBP09.Filtered := True;
  while not cdsBP09.IsEmpty do
    cdsBP09.Delete;


  if cdsBP07.RecNo <> cdsBP07.RecordCount then
  begin
    LResetOrder := True;
  end else
    LResetOrder := False;
  cdsBP07.Delete;
  if LResetOrder then
  begin
    cdsBP07.DisableControls;
    cdsBP07.AfterScroll := nil;
    try
      while not cdsBP07.Eof do
      begin
        cdsBP07.Edit;
        cdsBP07.FieldByName('selforder').AsInteger := cdsBP07.FieldByName('selforder').AsInteger - 1;
        cdsBP07.Post;
        cdsBP07.Next;
      end;
    finally
      cdsbp07.EnableControls;
      cdsBP07.AfterScroll := cdsBP07AfterScroll;
    end;
    cdsBP07AfterScroll(cdsBP07);
  end;

end;

procedure TfrmEditBOMBaoJia.mniN7Click(Sender: TObject);
var
  LFrm: TfrmAddTypeDept;
begin
  DisableAllDS(FDSList);
  LFrm := TfrmAddTypeDept.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      AddBOMDept(IntToStr(LFrm.edt1.Tag),LFrm.se1.Value,True);
    end;
  finally
    EnableAllDS(FDSList);
    LFrm.Free;
  end;
  cdsBP07AfterScroll(cdsBP07);
end;

procedure TfrmEditBOMBaoJia.pgcBomChange(Sender: TObject);
begin
  if pgcBom.ActivePage = tsDept then
  begin
    cdsBP08.Filtered := True;
    cdsBP07AfterScroll(cdsBP07);
  end;
  if (pgcBom.ActivePage = tsAllBom) or (pgcBom.ActivePage = tsCalcBom) then
  begin
    cdsBP08.Filtered := False;
    cbxAllBomDeptBomType.Items.Clear;
    cdsAllBomDept.Close;
    cdsAllBomDept.CreateDataSet;
  end;
  if pgcBom.ActivePage = tsAllParam then
  begin
    cdsBP09.Filtered := False;
  end;
end;

procedure TfrmEditBOMBaoJia.pmbp07Popup(Sender: TObject);
begin
  mniN6.Enabled := not cdsBP07.IsEmpty;
  mniN7.Enabled := not cdsBP07.IsEmpty;
end;

procedure TfrmEditBOMBaoJia.pmbp08Popup(Sender: TObject);
begin
  mniN5.Enabled := not cdsBP08.IsEmpty;
end;

procedure TfrmEditBOMBaoJia.ReCalcByMaoLiLv(ASetW,ASetH: Double;ApostBy: Integer);
var
  LTmpFloat: Double;

begin
  cdsBP10.DisableControls;
  cdsBP10.First;
  while not cdsBP10.Eof do
  begin
    if cdsBP10.FieldByName('Param_Name').AsString = 'bPcs_S' then
    begin
      LTmpFloat := cdsBP10.FieldByName('Param_Value').AsFloat;
      Break;
    end;
    cdsBP10.Next;
  end;
  cdsBP10.EnableControls;
  //不含税价格
  cdsBP06.Edit;
  if ApostBy = 0  then
  begin
    cdsBP06.FieldByName('buhanshuijiage_Pcs').Value := cdsBP06.FieldByName('PAllAndBaoFei_Pcs').Value /
     (1- cdsBP06.FieldByName('maolilv_add').Value / 100);
  end;
  cdsBP06.FieldByName('buhanshuijiage_M').Value := cdsBP06.FieldByName('PAllAndBaoFei_M').Value /
   (1- cdsBP06.FieldByName('maolilv_add').Value / 100);
  cdsBP06.Post;

  //含税价
  cdsBP06.Edit;

  if ApostBy = 0 then
  begin
    cdsBP06.FieldByName('hanshuijiage_Pcs').Value := cdsBP06.FieldByName('buhanshuijiage_Pcs').Value *
    (1+ cdsBP06.FieldByName('zengzhishui_add').Value/100);
  end;
  cdsBP06.FieldByName('hanshuijiage_M').Value := cdsBP06.FieldByName('buhanshuijiage_M').Value *
   (1+ cdsBP06.FieldByName('zengzhishui_add').Value/100);
  cdsBP06.Post;

    cdsBP06.Edit;
  //兄弟厂外发原单价格
    if cdsBP06.FieldByName('OrignPrice').AsString = '' then
    begin

      cdsBP06.FieldByName('OrignPrice').Value := cdsBP06.FieldByName('buhanshuijiage_Pcs').Value;
    end;
    cdsBP06.FieldByName('OrignPrice_M').Value := cdsBP06.FieldByName('OrignPrice').Value /
      (LTmpFloat / (100*100*100));

    cdsBP06.Post;
  //运输成本
  LTmpFloat := cdsBP06.FieldByName('yunshu_cost_calcret').Value;
  cdsBP06.Edit;
  cdsBP06.FieldByName('yunshu_cost_pcs').Value := cdsBP06.FieldByName('OrignPrice').Value * LTmpFloat / 100;;
  cdsBP06.FieldByName('yunshu_cost_M').Value := cdsBP06.FieldByName('OrignPrice_M').Value * LTmpFloat / 100;
  cdsBP06.Post;

  //销售折扣
  LTmpFloat := cdsBP06.FieldByName('xiaoshouzhekou').Value;
  cdsBP06.Edit;
  cdsBP06.FieldByName('zhekou_cost_pcs').Value := cdsBP06.FieldByName('OrignPrice').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_Pcs').Value * LTmpFloat / 100;
  cdsBP06.FieldByName('zhekou_cost_M').Value := cdsBP06.FieldByName('OrignPrice_M').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_M').Value * LTmpFloat / 100;
  cdsBP06.Post;

  //财务费用
  LTmpFloat := cdsBP06.FieldByName('caiwu_cost_calcret').Value;
  cdsBP06.Edit;
  cdsBP06.FieldByName('caiwu_cost_pcs').Value := cdsBP06.FieldByName('OrignPrice').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_Pcs').Value * LTmpFloat / 100;
  cdsBP06.FieldByName('caiwu_cost_M').Value :=  cdsBP06.FieldByName('OrignPrice_M').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_M').Value * LTmpFloat / 100;
  cdsBP06.Post;

  //管理成本
  LTmpFloat := cdsBP06.FieldByName('guanli_cost_calcret').Value;
  cdsBP06.Edit;
  cdsBP06.FieldByName('guanli_cost_pcs').Value := cdsBP06.FieldByName('OrignPrice').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_M').Value * LTmpFloat / 100;
  cdsBP06.FieldByName('guanli_cost_M').Value := cdsBP06.FieldByName('OrignPrice_M').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_M').Value * LTmpFloat / 100;
  cdsBP06.Post;

  //营销费用
  LTmpFloat := cdsBP06.FieldByName('xiaoshou_cost_calcret').Value;
  cdsBP06.Edit;
  cdsBP06.FieldByName('xiaoshou_cost_pcs').Value := cdsBP06.FieldByName('OrignPrice').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_M').Value * LTmpFloat / 100;
  cdsBP06.FieldByName('xiaoshou_cost_M').Value := cdsBP06.FieldByName('OrignPrice_M').Value * LTmpFloat / 100;//cdsBP06.FieldByName('buhanshuijiage_M').Value * LTmpFloat / 100;
  cdsBP06.Post;

  //总成本PCS
  cdsBP06.Edit;
  cdsBP06.FieldByName('AllCost_PCS').Value :=
    cdsBP06.FieldByName('PAllAndBaoFei_Pcs').Value +
    cdsBP06.FieldByName('yunshu_cost_pcs').Value + cdsBP06.FieldByName('xiaoshou_cost_pcs').Value +
    cdsBP06.FieldByName('caiwu_cost_pcs').Value + cdsBP06.FieldByName('guanli_cost_pcs').Value +
    cdsBP06.FieldByName('zhekou_cost_pcs').Value;
  //总成品M
  cdsBP06.FieldByName('AllCost_M').Value :=
    cdsBP06.FieldByName('PAllAndBaoFei_M').Value +
    cdsBP06.FieldByName('yunshu_cost_M').Value + cdsBP06.FieldByName('xiaoshou_cost_M').Value +
    cdsBP06.FieldByName('caiwu_cost_M').Value + cdsBP06.FieldByName('guanli_cost_M').Value +
    cdsBP06.FieldByName('zhekou_cost_M').Value;
  //净利率
  if cdsBP06.FieldByName('buhanshuijiage_Pcs').Value <> 0 then
  begin

    cdsBP06.FieldByName('jinglilv_add').Value :=
      (1 - cdsBP06.FieldByName('AllCost_PCS').Value / cdsBP06.FieldByName('OrignPrice').Value) * 100;

//  cdsBP06.FieldByName('jinglilv_add').Value :=
//    (1 - cdsBP06.FieldByName('AllCost_PCS').Value / cdsBP06.FieldByName('buhanshuijiage_Pcs').Value) * 100;
  end;
  cdsBP06.Post;


  lblBenBiPrice.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_Pcs').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);
  lblBenBiPriceM.Caption := FormatFloat('0.0000000',cdsBP06.FieldByName('buhanshuijiage_M').AsFloat * cdsBP06.FieldByName('curr_rate').AsFloat);
end;


procedure TfrmEditBOMBaoJia.RzDBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if cdsBP06.FieldByName('OrignPrice').AsFloat <> 0 then
    begin
      cdsBP06.FieldByName('OrignZL').AsFloat := cdsBP06.FieldByName('buhanshuijiage_Pcs').AsFloat / cdsBP06.FieldByName('OrignPrice').AsFloat * 100;
    end else
      cdsBP06.FieldByName('OrignZL').AsFloat := 0;
  end;
end;

procedure TfrmEditBOMBaoJia.tvMIChange(Sender: TObject; Node: TTreeNode);
var
  LTmp: TTmp;
  LSql: string;
  LCds: TClientDataSet;
begin
  if Node <> nil then
  begin
    LSql := 'select layers_image,layers_info from data0025 where manu_part_number = ' + QuotedStr(Node.Text);
    LTmp := TTmp.Create;
    LCds := TClientDataSet.Create(self);
    try
      LCds.Data := LTmp.SqlOpen(LSql);
      Load_JPG_Pic_From_DB(LCds.FieldByName('layers_image'),imgYaHe);
      mmoYaHeTxt.Text := LCds.FieldByName('layers_info').AsString;
    finally
      LCds.Free;
    end;

    LSql := 'select * from data0029 where source_ptr in (select rkey from data0025 where manu_part_number = ' + QuotedStr(Node.Text) + ') order by seq_no';
    LTmp := TTmp.Create;
    cdsD29.Data := LTmp.SqlOpen(LSql);
  end;
end;

end.
