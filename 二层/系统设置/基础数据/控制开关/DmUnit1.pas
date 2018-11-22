unit DmUnit1;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    TemADOQuery2: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1aptaxontax: TStringField;
    ADOQuery1artaxontax: TStringField;
    ADOQuery1ppc_control15: TWordField;
    ADOQuery1custcitool: TStringField;
    ADOQuery1custciprod: TStringField;
    ADOQuery1suplcimat: TStringField;
    ADOQuery1custciship: TStringField;
    ADOQuery1suplcimisc: TStringField;
    ADOQuery1ENG_CONTROL1: TWordField;
    ADOQuery1ENG_CONTROL2: TWordField;
    ADOQuery1ENG_CONTROL16: TWordField;
    ADOQuery1PPC_CONTROL9: TWordField;
    ADOQuery1cut_l1_max: TBCDField;
    ADOQuery1cut_l1_min: TBCDField;
    ADOQuery1cut_w1_max: TBCDField;
    ADOQuery1cut_w1_min: TBCDField;
    ADOQuery1cut_l2_max: TBCDField;
    ADOQuery1cut_l2_min: TBCDField;
    ADOQuery1cut_w2_max: TBCDField;
    ADOQuery1cut_w2_min: TBCDField;
    ADOQuery1space_l_min: TBCDField;
    ADOQuery1space_w_min: TBCDField;
    ADOQuery1Border_L_Min: TBCDField;
    ADOQuery1Border_W_Min: TBCDField;
    ADOQuery1suplstamat: TStringField;
    ADOQuery1SUPLSTAMISC: TStringField;
    ADOQuery1unit_ptr: TIntegerField;
    ADOQuery1custcoship: TStringField;
    ADOQuery1trans_pl: TWordField;
    ADOQuery1stock_in_flag: TStringField;
    ADOQuery1PPC_BY_CustP: TStringField;
    ADOQuery1PPC_CONTROL13: TWordField;
    ADOQuery1PPC_CONTROL18: TWordField;
    ADOQuery1PPC_CONTROL6: TWordField;
    ADOQuery1PPC_CONTROL7: TWordField;
    ADOQuery1PPC_CONTROL8: TWordField;
    ADOQuery1PPC_CONTROL10: TWordField;
    ADOQuery1PPC_control22: TWordField;
    ADOQuery1PPC_CONTROL25: TIntegerField;
    ADOQuery1PPC_CONTROL26: TFloatField;
    ADOQuery1COST_CONTROL1: TWordField;
    ADOQuery1ppc_control12: TWordField;
    ADOQuery1ppc_control23: TWordField;
    ADOQuery1custfedship: TIntegerField;
    ADOQuery1BALA_DAYS: TBCDField;
    ADOQuery1QA_CONTROL1: TWordField;
    ADOQuery1fg_scp_dept_ptr: TIntegerField;
    ADOQuery1EP000: TWordField;
    ADOQuery1SUPLFEDSHIP: TStringField;
    ADOQuery1SUPLFEDMAT: TStringField;
    ADOQuery1SUPLFEDMISC: TStringField;
    ADOQuery1SUPLSTASHIP: TStringField;
    ADOQuery1CUSTCOPROD: TStringField;
    ADOQuery1ENG_AUDIT_FLAG: TStringField;
    ADOQuery1CUSTCOTOOL: TStringField;
    ADOQuery1CUSTSTATOOL: TStringField;
    ADOQuery1QTE_CONTROL1: TWordField;
    ADOQuery1QTE_CONTROL4: TFloatField;
    ADOQuery1ISSUSE_AREA_DAY: TBCDField;
    ADOQuery1ppc_control_27: TBCDField;
    ADOQuery1fin_control1: TStringField;
    ADOQuery1PPC_CONTROL1: TWordField;
    ADOQuery1PRIOR_DAYS: TBCDField;
    ADOQuery1CUSTSTAPROD: TStringField;
    ADOQuery1CLOSE_DAYTH: TIntegerField;
    ADOQuery1CLOSE_HOURTH: TIntegerField;
    ADOQuery1PPC_CONTROL2: TWordField;
    ADOQuery1CUSTSTASHIP: TStringField;
    ADOQuery1PPC_CONTROL3: TWordField;
    ADOQuery1PPC_CONTROL4: TWordField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
