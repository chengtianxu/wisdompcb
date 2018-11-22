unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADOinvt_issue: TADOQuery;
    DS: TDataSource;
    ADOinvt_issuerkey: TAutoIncField;
    ADOinvt_issueGROUP_DESC: TStringField;
    ADOinvt_issueINV_PART_NUMBER: TStringField;
    ADOinvt_issueINV_NAME: TStringField;
    ADOinvt_issueINV_DESCRIPTION: TStringField;
    ADOinvt_issueUNIT_NAME: TStringField;
    ADOinvt_issueQUANTITY: TBCDField;
    ADOinvt_issueGON_NUMBER: TStringField;
    ADOinvt_issueTDATE: TDateTimeField;
    ADOinvt_issuePO_NUMBER: TStringField;
    ADOinvt_issueCODE: TStringField;
    ADOinvt_issueABBR_NAME: TStringField;
    ADOinvt_issueEMPLOYEE_NAME: TStringField;
    ADOinvt_issueLOCATION: TStringField;
    ADOinvt_issueWAREHOUSE_CODE: TStringField;
    ADOinvt_issueDEPT_NAME: TStringField;
    ADOinvt_issueissue_EMPLOYEENAME: TStringField;
    ADOinvt_issueissue_area: TFloatField;
    ADOinvt_issueissue_weight: TFloatField;
    tmp: TADOQuery;
    ADOinvt_issueunit_sq: TFloatField;
    ADOinvt_issueunit_weight: TFloatField;
    ADOinvt_issue1: TADOQuery;
    ADOinvt_issue1rkey: TAutoIncField;
    ADOinvt_issue1GON_NUMBER: TStringField;
    ADOinvt_issue1TDATE: TDateTimeField;
    ADOinvt_issue1PO_NUMBER: TStringField;
    ADOinvt_issue1GROUP_DESC: TStringField;
    ADOinvt_issue1INV_PART_NUMBER: TStringField;
    ADOinvt_issue1INV_NAME: TStringField;
    ADOinvt_issue1INV_DESCRIPTION: TStringField;
    ADOinvt_issue1UNIT_NAME: TStringField;
    ADOinvt_issue1QUANTITY: TBCDField;
    ADOinvt_issue1CODE: TStringField;
    ADOinvt_issue1ABBR_NAME: TStringField;
    ADOinvt_issue1EMPLOYEE_NAME: TStringField;
    ADOinvt_issue1LOCATION: TStringField;
    ADOinvt_issue1WAREHOUSE_CODE: TStringField;
    ADOinvt_issue1DEPT_NAME: TStringField;
    ADOinvt_issue1issue_EMPLOYEENAME: TStringField;
    ADOinvt_issue1issue_area: TFloatField;
    ADOinvt_issue1issue_weight: TFloatField;
    ADOinvt_issue1unit_sq: TFloatField;
    ADOinvt_issue1unit_weight: TFloatField;
    ADOnum: TADOQuery;
    ADOnumgon_number: TStringField;
    procedure ADOinvt_issueunit_sqChange(Sender: TField);
    procedure ADOinvt_issueunit_weightChange(Sender: TField);
    procedure ADOinvt_issueQUANTITYChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOinvt_issueunit_sqChange(Sender: TField);
begin
  DM.ADOinvt_issueissue_area.Value:=DM.ADOinvt_issueQUANTITY.Value*dm.ADOinvt_issueunit_sq.Value;
end;

procedure TDM.ADOinvt_issueunit_weightChange(Sender: TField);
begin
  DM.ADOinvt_issueissue_weight.Value:=DM.ADOinvt_issueQUANTITY.Value*dm.ADOinvt_issueunit_weight.Value;
end;

procedure TDM.ADOinvt_issueQUANTITYChange(Sender: TField);
begin
  DM.ADOinvt_issueissue_area.Value:=DM.ADOinvt_issueQUANTITY.Value*dm.ADOinvt_issueunit_sq.Value;
  DM.ADOinvt_issueissue_weight.Value:=DM.ADOinvt_issueQUANTITY.Value*dm.ADOinvt_issueunit_weight.Value;
end;

end.
