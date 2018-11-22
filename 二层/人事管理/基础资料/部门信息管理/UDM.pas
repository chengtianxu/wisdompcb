unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB,MATH;

type
  TDM = class(TDataModule)
    con_dept: TADOConnection;
    qry_dept: TADOQuery;
    ds_dept: TDataSource;
    qry_deptrkey: TAutoIncField;
    qry_deptdepartmentname: TWideStringField;
    qry_deptdepartmentcode: TWideStringField;
    qry_deptsuperior: TIntegerField;
    qry_deptchargename: TWideStringField;
    qry_deptdepartmentration: TIntegerField;
    qry_deptdepartmentcount: TIntegerField;
    qry_deptscarcity: TIntegerField;
    ADOTMP: TADOQuery;
    qry_deptoverproofcount: TIntegerField;
    qry_deptmax_overproof_percent: TIntegerField;
    qry_deptpre_outduty: TIntegerField;
    qry_deptstr_proof_percent: TStringField;
    qry_deptstr_over_percent: TStringField;
    qry_deptdept_totalration: TIntegerField;
    qry_deptdept_totalcount: TIntegerField;
    qry_deptdept_total_outduty: TIntegerField;
    qry_deptinvalid: TBooleanField;
    procedure qry_deptPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qry_deptEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qry_deptCalcFields(DataSet: TDataSet);
    procedure qry_deptinvalidGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.qry_deptPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Abort;
end;

procedure TDM.qry_deptEditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Abort;
end;

procedure TDM.qry_deptCalcFields(DataSet: TDataSet);
begin
  qry_deptstr_proof_percent.Value :=
  inttostr(qry_deptmax_overproof_percent.Value)+'%';

  if ( dm.qry_deptdepartmentration.Value <> 0 )
  then
  dm.qry_deptstr_over_percent.Value :=
formatfloat('0.##',(100*dm.qry_deptoverproofcount.Value/(dm.qry_deptdepartmentration.Value)))+'%'
  else
   dm.qry_deptstr_over_percent.Value := '100%'  ;

end;

procedure TDM.qry_deptinvalidGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if   Sender.Value=True then
    Text:='Õ£”√'
  else
  if   Sender.Value=False then
    Text:='”––ß' ;
end;

end.
