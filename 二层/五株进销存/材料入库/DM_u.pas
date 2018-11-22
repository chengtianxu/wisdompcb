unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADOinvt_incept: TADOQuery;
    DS: TDataSource;
    ADOinvt_inceptrkey: TAutoIncField;
    ADOinvt_inceptGRN_NUMBER: TStringField;
    ADOinvt_inceptship_DATE: TDateTimeField;
    ADOinvt_inceptDELIVER_NUMBER: TStringField;
    ADOinvt_inceptPO_NUMBER: TStringField;
    ADOinvt_inceptGROUP_DESC: TStringField;
    ADOinvt_inceptINV_PART_NUMBER: TStringField;
    ADOinvt_inceptINV_NAME: TStringField;
    ADOinvt_inceptINV_DESCRIPTION: TStringField;
    ADOinvt_inceptUNIT_NAME: TStringField;
    ADOinvt_inceptQUANTITY: TBCDField;
    ADOinvt_inceptCODE: TStringField;
    ADOinvt_inceptABBR_NAME: TStringField;
    ADOinvt_inceptEMPLOYEE_NAME: TStringField;
    ADOinvt_inceptLOCATION: TStringField;
    ADOinvt_inceptWAREHOUSE_CODE: TStringField;
    ADOinvt_inceptincept_area: TFloatField;
    ADOinvt_inceptincept_weight: TFloatField;
    tmp: TADOQuery;
    ADOinvt_inceptunit_sq: TFloatField;
    ADOinvt_inceptunit_weight: TFloatField;
    procedure ADOinvt_inceptunit_sqChange(Sender: TField);
    procedure ADOinvt_inceptunit_weightChange(Sender: TField);
    procedure ADOinvt_inceptQUANTITYChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOinvt_inceptunit_sqChange(Sender: TField);
begin
  DM.ADOinvt_inceptincept_area.Value:=DM.ADOinvt_inceptQUANTITY.Value*dm.ADOinvt_inceptunit_sq.Value;
end;

procedure TDM.ADOinvt_inceptunit_weightChange(Sender: TField);
begin
  DM.ADOinvt_inceptincept_weight.Value:=DM.ADOinvt_inceptQUANTITY.Value*dm.ADOinvt_inceptunit_weight.Value;
end;

procedure TDM.ADOinvt_inceptQUANTITYChange(Sender: TField);
begin
  DM.ADOinvt_inceptincept_area.Value:=DM.ADOinvt_inceptQUANTITY.Value*dm.ADOinvt_inceptunit_sq.Value;
  DM.ADOinvt_inceptincept_weight.Value:=DM.ADOinvt_inceptQUANTITY.Value*dm.ADOinvt_inceptunit_weight.Value;
end;

end.
