unit DMFrm;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDM1 = class(TDataModule)
    con1: TADOConnection;
    qrytmp: TADOQuery;
    cmd1: TADOCommand;
    adsMain: TADODataSet;
    adsMainRkey: TAutoIncField;
    adsMainCheckDate: TDateTimeField;
    adsMainOnDutyTime1: TDateTimeField;
    adsMainOffDutyTime1: TDateTimeField;
    adsMainOnDutyTime2: TDateTimeField;
    adsMainOffDutyTime2: TDateTimeField;
    adsMainOnDutyTime3: TDateTimeField;
    adsMainOffDutyTime3: TDateTimeField;
    adsMainYTNote: TWideStringField;
    fltfldMainSWT: TFloatField;
    fltfldMainOWT: TFloatField;
    fltfldMainRWT: TFloatField;
    fltfldMainROT: TFloatField;
    intgrfldMainClassID: TIntegerField;
    intgrfldMainRestType: TIntegerField;
    intgrfldMainlocked: TIntegerField;
    adsMainChineseName: TWideStringField;
    adsMainemployeecode: TWideStringField;
    intgrfldMainworkgroup: TIntegerField;
    adsMainaccountname: TWideStringField;
    adsMainXQ: TWideStringField;
    adsMaindepartmentname: TWideStringField;
    adsLookUpRestColor: TADODataSet;
    adsLookUpRestColorrkey: TAutoIncField;
    adsLookUpRestColorresttype_name: TWideStringField;
    adsLookUpRestColorcolor: TWideStringField;
    adsLookUpClass: TADODataSet;
    intgrfldLookUpClassrkey: TIntegerField;
    adsLookUpClassclassname: TWideStringField;
    adsLookClassGroupType: TADODataSet;
    adsLookClassGroupTyperkey: TAutoIncField;
    adsLookClassGroupTypeitem: TWideStringField;
    adsMainRestColor: TStringField;
    adsMainClassName: TStringField;
    adsMainclassgrouptype: TStringField;
    adsBanCi: TADODataSet;
    adsBanCirkey: TAutoIncField;
    adsBanCiontime1: TDateTimeField;
    adsBanCiouttime1: TDateTimeField;
    adsBanCiontime2: TDateTimeField;
    adsBanCiouttime2: TDateTimeField;
    adsBanCiontime3: TDateTimeField;
    adsBanCiouttime3: TDateTimeField;
    adsBanCiisextra1: TBooleanField;
    adsBanCiisextra2: TBooleanField;
    adsBanCiisextra3: TBooleanField;
    intgrfldBanCiaheadduty: TIntegerField;
    intgrfldBanCidelayduty: TIntegerField;
    adsBanCiisoverzero: TBooleanField;
    intgrfldBanCicardGap: TIntegerField;
    intgrfldBanCipasssegment: TIntegerField;
    intgrfldBanCiauto_overtime: TIntegerField;
    fltfldBanCiworktimesum: TFloatField;
    fltfldBanCiwork_rest: TFloatField;
    adsBanCiclassdesc: TWideStringField;
    fltfldBanCioverworktime: TFloatField;
    fltfldBanCioverwork_rest: TFloatField;
    intgrfldBanCiovertimetype: TIntegerField;
    adsBanCicreatedate: TDateTimeField;
    adsBanCiusername: TWideStringField;
    intgrfldBanCiclassstatus: TIntegerField;
    intgrfldBanCilocked: TIntegerField;
    fltfldBanCiedit_1: TFloatField;
    fltfldBanCiedit_2: TFloatField;
    fltfldBanCiedit_3: TFloatField;
    fltfldBanCiedit_4: TFloatField;
    fltfldBanCiedit_5: TFloatField;
    fltfldBanCiedit_6: TFloatField;
    fltfldBanCiedit_7: TFloatField;
    fltfldBanCiedit_8: TFloatField;
    fltfldBanCiedit_9: TFloatField;
    fltfldBanCiedit_10: TFloatField;
    fltfldBanCiedit_11: TFloatField;
    fltfldBanCiedit_12: TFloatField;
    fltfldBanCiedit_13: TFloatField;
    fltfldBanCiedit_14: TFloatField;
    fltfldBanCiedit_15: TFloatField;
    fltfldBanCiedit_16: TFloatField;
    adsBanCiedit_17: TBooleanField;
    adsBanCiedit_18: TBooleanField;
    adsBanCiedit_19: TBooleanField;
    adsBanCiedit_20: TBooleanField;
    adsBanCiedit_21: TBooleanField;
    adsBanCiedit_22: TBooleanField;
    adsBanCiedit_23: TBooleanField;
    adsBanCiedit_24: TBooleanField;
    adsBanCiedit_25: TBooleanField;
    adsBanCiedit_26: TBooleanField;
    adsBanCiedit_27: TBooleanField;
    adsBanCiedit_28: TBooleanField;
    adsBanCiedit_29: TBooleanField;
    adsBanCiedit_30: TBooleanField;
    adsBanCiedit_31: TBooleanField;
    adsBanCiedit_32: TBooleanField;
    adsBanCiedit_33: TBooleanField;
    intgrfldMainEmployeeID: TIntegerField;
    adsBanCiclassname: TWideStringField;
    spInit: TADOStoredProc;
    fltfldMainSumCN: TFloatField;
    fltfldMainSumCT: TFloatField;
    fltfldMainSumZN: TFloatField;
    fltfldMainSumZT: TFloatField;
    fltfldMainSumKN: TFloatField;
    fltfldMainSumKT: TFloatField;
    fltfldMainSumLN: TFloatField;
    fltfldMainSumLT: TFloatField;
    wdstrngfldMainitem: TWideStringField;
    adsLookUpClassclassstatus: TIntegerField;
    qryOUt: TADOQuery;
    qryOUtemployeeid: TIntegerField;
    qryOUtemployeecode: TWideStringField;
    qryOUtchinesename: TWideStringField;
    qryOUtondutytime: TDateTimeField;
    qryOUtposition_item: TWideStringField;
    qryOUtdepartmentname: TWideStringField;
    qryOUtmaxdate: TDateTimeField;
    procedure intgrfldMainRestTypeValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    
    function GetServerTime: TDateTime;
    function SqlOpen(ASql: string): Boolean;
    function SqlExec(ASql: string): boolean;
    procedure IniLookDB;
    procedure ADORefreshCurrent(DataSet: TADODataSet);
  end;

var
  DM1: TDM1;

implementation

uses
  ADOInt, WZ_gUnit,common;

{$R *.dfm}

{ TDM1 }

procedure TDM1.ADORefreshCurrent(DataSet: TADODataSet);
begin
  with DataSet do
  begin
    CheckBrowseMode;
    UpdateCursorPos;
    try
     // ShowMessage(DM1.adsMain.CommandText);
      Recordset.Resync(AdAffectCurrent,AdResyncAllValues);
    finally
      Resync([]);
    end;
  end;
end;

function TDM1.GetServerTime: TDateTime;
begin
  if SqlOpen('select getdate() as svrdate') then
    Result := qrytmp.fieldbyname('svrdate').AsDateTime
  else
    Result := 0;
end;

procedure TDM1.IniLookDB;
begin
  adsLookUpRestColor.Open;
  adsLookUpClass.Open;
  adsLookClassGroupType.Open;
  adsBanCi.Open;
end;

function TDM1.SqlExec(ASql: string): boolean;
begin
  try
    cmd1.CommandText := ASql;
    cmd1.Execute;
    Result := True;
  except
    ShowMessage(ASql + #13#13 + '错误');
    Result := False;
  end;
end;

function TDM1.SqlOpen(ASql: string): Boolean;
begin
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(ASql);
    qrytmp.Open;
    Result := True;
  except
    ShowMessage(ASql + #13#13 + '错误');
    Result := False;
  end;
end;

procedure TDM1.intgrfldMainRestTypeValidate(Sender: TField);
var
  Lrkey1: Integer;
begin
  if vprev  = '2' then
  begin
    if adsLookUpRestColor.Locate('resttype_name','调休',[]) then
    begin
      Lrkey1 := adsLookUpRestColor.fieldbyname('rkey').AsInteger;
    end else
    begin
      Lrkey1 := -1;
    end;
    if (not Sender.IsNull) and (sender.AsInteger <> Lrkey1) then
    begin
      ShowMessage('权限2只能修改为调休或清空');
      Sender.Value := Sender.OldValue;
      Abort;
    end;
  end;
end;

end.
