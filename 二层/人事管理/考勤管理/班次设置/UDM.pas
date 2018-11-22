unit UDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Menus, DBGridEh, Buttons, ComCtrls,
  Mask, DBCtrls, DBCtrlsEh, ExtCtrls,StrUtils, DB, ADODB;

type
  TDM = class(TDataModule)
    qry_ruler: TADOQuery;
    ds_ruler: TDataSource;
    qry1: TADOQuery;
    ds1: TDataSource;
    wdstrngfldqry1item: TWideStringField;
    ADOSpecial: TADOQuery;
    ADOSpecialrkey: TAutoIncField;
    ADOSpecialisoverzero: TBooleanField;
    ADOSpecialedit_1: TFloatField;
    ADOSpecialedit_2: TFloatField;
    ADOSpecialedit_3: TFloatField;
    ADOSpecialedit_4: TFloatField;
    ADOSpecialedit_5: TFloatField;
    ADOSpecialedit_6: TFloatField;
    ADOSpecialedit_7: TFloatField;
    ADOSpecialedit_8: TFloatField;
    ADOSpecialedit_9: TFloatField;
    ADOSpecialedit_10: TFloatField;
    ADOSpecialedit_11: TFloatField;
    ADOSpecialedit_12: TFloatField;
    ADOSpecialedit_13: TFloatField;
    ADOSpecialedit_14: TFloatField;
    ADOSpecialedit_15: TFloatField;
    ADOSpecialedit_16: TFloatField;
    ADOSpecialedit_17: TBooleanField;
    ADOSpecialedit_18: TBooleanField;
    ADOSpecialedit_19: TBooleanField;
    ADOSpecialedit_20: TBooleanField;
    ADOSpecialedit_21: TBooleanField;
    ADOSpecialedit_22: TBooleanField;
    ADOSpecialedit_23: TBooleanField;
    ADOSpecialedit_24: TBooleanField;
    ADOSpecialedit_25: TBooleanField;
    ADOSpecialedit_26: TBooleanField;
    ADOSpecialedit_27: TBooleanField;
    ADOSpecialedit_28: TBooleanField;
    ADOSpecialedit_29: TBooleanField;
    ADOSpecialedit_30: TBooleanField;
    ADOSpecialedit_31: TBooleanField;
    ADOSpecialedit_32: TBooleanField;
    ADOSpecialedit_33: TBooleanField;
    qry_rulerrkey: TAutoIncField;
    qry_rulerclassname: TWideStringField;
    qry_rulerontime1: TDateTimeField;
    qry_rulerouttime1: TDateTimeField;
    qry_rulerontime2: TDateTimeField;
    qry_rulerouttime2: TDateTimeField;
    qry_rulerontime3: TDateTimeField;
    qry_rulerouttime3: TDateTimeField;
    qry_rulerisextra1: TBooleanField;
    qry_rulerisextra2: TBooleanField;
    qry_rulerisextra3: TBooleanField;
    qry_ruleraheadduty: TIntegerField;
    qry_rulerdelayduty: TIntegerField;
    qry_rulerisoverzero: TBooleanField;
    qry_rulercardGap: TIntegerField;
    qry_rulerpasssegment: TIntegerField;
    qry_rulerauto_overtime: TIntegerField;
    qry_rulerworktimesum: TFloatField;
    qry_rulerwork_rest: TFloatField;
    qry_rulerclassdesc: TWideStringField;
    qry_ruleroverworktime: TFloatField;
    qry_ruleroverwork_rest: TFloatField;
    qry_rulerovertimetype: TIntegerField;
    qry_rulercreatedate: TDateTimeField;
    qry_rulerusername: TWideStringField;
    qry_rulerclassstatus: TIntegerField;
    qry_rulerlocked: TIntegerField;
    qry_ruleredit_1: TFloatField;
    qry_ruleredit_2: TFloatField;
    qry_ruleredit_3: TFloatField;
    qry_ruleredit_4: TFloatField;
    qry_ruleredit_5: TFloatField;
    qry_ruleredit_6: TFloatField;
    qry_ruleredit_7: TFloatField;
    qry_ruleredit_8: TFloatField;
    qry_ruleredit_9: TFloatField;
    qry_ruleredit_10: TFloatField;
    qry_ruleredit_11: TFloatField;
    qry_ruleredit_12: TFloatField;
    qry_ruleredit_13: TFloatField;
    qry_ruleredit_14: TFloatField;
    qry_ruleredit_15: TFloatField;
    qry_ruleredit_16: TFloatField;
    qry_ruleredit_17: TBooleanField;
    qry_ruleredit_18: TBooleanField;
    qry_ruleredit_19: TBooleanField;
    qry_ruleredit_20: TBooleanField;
    qry_ruleredit_21: TBooleanField;
    qry_ruleredit_22: TBooleanField;
    qry_ruleredit_23: TBooleanField;
    qry_ruleredit_24: TBooleanField;
    qry_ruleredit_25: TBooleanField;
    qry_ruleredit_26: TBooleanField;
    qry_ruleredit_27: TBooleanField;
    qry_ruleredit_28: TBooleanField;
    qry_ruleredit_29: TBooleanField;
    qry_ruleredit_30: TBooleanField;
    qry_ruleredit_31: TBooleanField;
    qry_ruleredit_32: TBooleanField;
    qry_ruleredit_33: TBooleanField;
    qryClass: TADOQuery;
    qry2: TADOQuery;
    ADOConnection1: TADOConnection;
    ds2: TDataSource;
    qry3: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    time1, time2: Double;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  p: dword;
begin
  setlocaleInfo(locale_user_default,locale_stimeformat,pchar('HH:mm:ss'));
  sendmessagetimeout(hwnd_broadcast,wm_settingchange,0,0,smto_abortifhung,10,p);
end;

end.
