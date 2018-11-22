unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM1 = class(TDataModule)
    con1: TADOConnection;
    qrytmp: TADOQuery;
    adsFrmMain: TADODataSet;
    atncfldFrmMainRKEY: TAutoIncField;
    strngfldFrmMainWORK_ORDER_NUMBER: TStringField;
    strngfldFrmMainCUT_NO: TStringField;
    smlntfldFrmMainBEGIN_STEP_NO: TSmallintField;
    intgrfldFrmMainPANEL_A_B: TIntegerField;
    intgrfldFrmMainWHOUSE_PTR: TIntegerField;
    intgrfldFrmMainUSER_PTR: TIntegerField;
    intgrfldFrmMainEMPLOYEE_PTR: TIntegerField;
    intgrfldFrmMainBOM_PTR: TIntegerField;
    smlntfldFrmMainSUB_LEVELS: TSmallintField;
    wrdfldFrmMainPRIORITY_CODE: TWordField;
    smlntfldFrmMainENGG_STATUS: TSmallintField;
    smlntfldFrmMainPROD_STATUS: TSmallintField;
    smlntfldFrmMainENGG_PROD_FLAG: TSmallintField;
    fltfldFrmMainQUAN_SCH: TFloatField;
    fltfldFrmMainQUAN_REJ: TFloatField;
    fltfldFrmMainQUAN_PROD: TFloatField;
    intgrfldFrmMainPANELS: TIntegerField;
    fltfldFrmMainREMARK_PNLS: TFloatField;
    dtmfldFrmMainENT_DATETIME: TDateTimeField;
    dtmfldFrmMainSCH_COMPL_DATE: TDateTimeField;
    dtmfldFrmMainPROJ_START_DATE: TDateTimeField;
    dtmfldFrmMainPROJ_COMPL_DATE: TDateTimeField;
    dtmfldFrmMainCANCEL_HOLD_DATE: TDateTimeField;
    dtmfldFrmMainACT_COMPL_DATE: TDateTimeField;
    intgrfldFrmMainRMA_PTR: TIntegerField;
    fltfldFrmMainPARTS_PER_PANEL: TFloatField;
    intgrfldFrmMainEDITED_BY: TIntegerField;
    fltfldFrmMainPLANNED_QTY: TFloatField;
    dtmfldFrmMainRELEASE_DATE: TDateTimeField;
    intgrfldFrmMainTRAV_PRINTED_BY_PTR: TIntegerField;
    smlntfldFrmMainFLOW_NO: TSmallintField;
    smlntfldFrmMainWIPMAT_STATUS: TSmallintField;
    smlntfldFrmMainPPC_FLAG: TSmallintField;
    intgrfldFrmMainREFERENCE_PTR: TIntegerField;
    fltfldFrmMainpanel_ln: TFloatField;
    fltfldFrmMainpanel_wd: TFloatField;
    wrdfldFrmMainwtype: TWordField;
    wrdfldFrmMainput_type: TWordField;
    fltfldFrmMainMATL_COST: TFloatField;
    fltfldFrmMainOVHD_COST: TFloatField;
    strngfldFrmMainpnl_size: TStringField;
    intgrfldFrmMainfrom_wo_ptr: TIntegerField;
    intgrfldFrmMainQUAN_ALLREJ: TIntegerField;
    intgrfldFrmMainQUAN_ALLPNL: TIntegerField;
    strngfldFrmMainLOT_NUMBER: TStringField;
    strngfldFrmMainCUTNO_WO: TStringField;
    strngfldFrmMainLOTSTATUS: TStringField;
    strngfldFrmMainProdStatus: TStringField;
    intgrfldFrmMainRejPcs: TIntegerField;
    intgrfldFrmMainRejPnl: TIntegerField;
    strngfldFrmMainCut_NO_1: TStringField;
    strngfldFrmMainD492TType: TStringField;
    strngfldFrmMainSO_NO: TStringField;
    strngfldFrmMainManu_Part_Number: TStringField;
    strngfldFrmMainManu_Part_Desc: TStringField;
    strngfldFrmMainNowDept: TStringField;
    atncfldFrmMainNowDeptRKey: TAutoIncField;
    fltfldFrmMainOnlinePcs: TFloatField;
    intgrfldFrmMainOnlinePNL: TIntegerField;
    smlntfldFrmMainNowStep: TSmallintField;
    strngfldFrmMainAbbr_Name: TStringField;
    atncfldFrmMainBFGCRKey: TAutoIncField;
    adsTmpSql: TADODataSet;
    ads1: TADODataSet;
    ads1RKey: TAutoIncField;
    ads1WORK_ORDER_NUMBER: TStringField;
    ads1MANU_PART_NUMBER: TStringField;
    ads1MANU_PART_DESC: TStringField;
    ads1FGZ: TStringField;
    ads1ABBR_NAME: TStringField;
    ads1STEP: TSmallintField;
    ads1QTY_BACKLOG: TFloatField;
    ads1REFERENCE: TStringField;
    ads1DEPT_CODE: TStringField;
    ads1DEPT_NAME: TStringField;
    ds1: TDataSource;
    adsIN: TADODataSet;
    adsINMANU_PART_NUMBER: TStringField;
    adsINQTY_REJECT: TFloatField;
    adsINPANELS: TIntegerField;
    adsINREJ_CODE: TStringField;
    adsINREJECT_DESCRIPTION: TStringField;
    adsINWORK_ORDER_NUMBER: TStringField;
    adsINDEPT_NAME: TStringField;
    dsIN: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure QryTmpExec(ALS: TStringList);
    function SqlOpen(ASQL: TStringList; AQry: TADOQuery): Boolean;overload;
    function SqlOpen(ASQL: string; AQry: TADOQuery): Boolean;overload;
    function SqlExec(ASQL: TStringList; AQry: TADOQuery;out nEffect: Integer): Boolean;overload;
    function SqlExec(ASQL: string; AQry: TADOQuery;out nEffect: Integer): Boolean;overload;
    function SqlExec(ASQL: string; out nEffect: Integer): Boolean;overload;
    function SqlExec(ASQL: TStringList;out nEffect: Integer): Boolean;overload;


    procedure QryTmpOpen(ALS: TStringList);overload;
    procedure QryTmpOpen(ASql: string);overload;


    procedure ShowLSMSG(LS: TStrings);
  end;

var
  DM1: TDM1;

implementation

uses
  Dialogs;

{$R *.dfm}

{ TDM1 }

procedure TDM1.ShowLSMSG(LS: TStrings);
var
  S: string;
  I: Integer;
begin
  for I := 0 to LS.Count - 1 do
    S := S + #13 + LS[I];
  ShowMessage(S);
end;

function TDM1.SqlExec(ASQL: TStringList; AQry: TADOQuery;out nEffect: Integer): Boolean;
begin
  nEffect := 0;
  try
    AQry.Close;
    AQry.Connection := con1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    nEffect := AQry.ExecSQL;
    Result := True;
  except
    AQry.Close;
    Result := False;
    ASQL.Add('´íÎó');
    ShowLSMSG(ASQL);
  end;
end;

function TDM1.SqlOpen(ASQL: TStringList; AQry: TADOQuery): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := con1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.Open;
    Result := True;
  except
    AQry.Close;
    Result := False;
    ASQL.Add('´íÎó!');
    ShowLSMSG(ASQL);
  end;
end;

function TDM1.SqlExec(ASQL: string; AQry: TADOQuery;
  out nEffect: Integer): Boolean;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASQL);
    Result := SqlExec(LS,AQry,nEffect);
  finally
    LS.Free;
  end;
end;

function TDM1.SqlOpen(ASQL: string; AQry: TADOQuery): Boolean;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASQL);
    Result := SqlOpen(LS,AQry);
  finally
    LS.Free;
  end;
end;

function TDM1.SqlExec(ASQL: string; out nEffect: Integer): Boolean;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(Self);
  try
    Result := SqlExec(ASQL,LQry,nEffect);
  finally
    LQry.Free;
  end;
end;

function TDM1.SqlExec(ASQL: TStringList; out nEffect: Integer): Boolean;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(Self);
  try
    Result := SqlExec(ASQL,LQry,nEffect);
  finally
    LQry.Free;
  end;
end;

procedure TDM1.QryTmpExec(ALS: TStringList);
begin
  qrytmp.Close;
  qrytmp.Prepared := False;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Assign(ALS);
  qrytmp.ExecSQL;
end;

procedure Tdm1.QryTmpOpen(ALS: TStringList);
begin
  qrytmp.Close;
  qrytmp.Prepared := False;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Assign(ALS);
  qrytmp.Open;
end;

procedure Tdm1.QryTmpOpen(ASql: string);
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASql);
    QryTmpOpen(LS);
  finally
    LS.Free;
  end;
end;

end.
