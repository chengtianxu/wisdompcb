unit DetailFrm_Mod40;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , uBaseDBGridEhListFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uCommFunc, Datasnap.Provider,
  Data.Win.ADODB, uBaseMainFrm;

type
  TFrmDetail_Mod40 = class(TfrmBaseDBGridEhList)
    cdsMainINV_PART_NUMBER: TStringField;
    cdsMainINV_PART_DESCRIPTION: TStringField;
    cdsMainINV_NAME: TStringField;
    cdsMainABBR_NAME: TStringField;
    cdsMainQUAN_REJD: TFloatField;
    cdsMainUNIT_NAME: TStringField;
    cdsMainTDATE: TDateTimeField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainREFERENCE_NUMBER: TStringField;
    cdsMainSHIPPING_METHOD: TWideStringField;
    cdsMainTRAN_DATE: TDateTimeField;
    cdsMainv_state: TStringField;
    cdsMainExpr1: TStringField;
    cdsMainCODE: TStringField;
    cdsMainREJECT_DESCRIPTION: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    FRkey : string;
    procedure GetData();override;
    { Public declarations }
  end;

var
  FrmDetail_Mod40: TFrmDetail_Mod40;

implementation

{$R *.dfm}

{ TFrmDetail_Mod40 }

procedure TFrmDetail_Mod40.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmDetail_Mod40 := nil;
end;

procedure TFrmDetail_Mod40.GetData;
var
  Lsql:string;
begin
  Lsql := ' SELECT Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION, Data0017.INV_NAME, '+
          ' Data0023.ABBR_NAME, Data0096.QUAN_REJD, Data0002.UNIT_NAME, Data0005.EMPLOYEE_NAME,'+
          ' Data0096.TDATE, Data0096.REFERENCE_NUMBER, Data0096.SHIPPING_METHOD, Data0096.TRAN_DATE,'+
          ' case dbo.Data0096.status when ''1'' then ''已装运'' when ''0'' then ''未装运'' end  as ''v_state'','+
          ' tran_by.EMPLOYEE_NAME AS Expr1, Data0076.CODE, Data0076.REJECT_DESCRIPTION '+
          ' FROM Data0096 INNER JOIN '+
          ' Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY INNER JOIN '+
          ' Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN '+
          ' Data0456 ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN '+
          ' Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY INNER JOIN '+
          ' Data0076 ON Data0096.REJ_PTR = Data0076.RKEY INNER JOIN '+
          ' Data0002 ON Data0022.LOCATION_PTR_FROM = Data0002.RKEY INNER JOIN '+
          ' Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY left JOIN '+
          ' Data0005 AS tran_by ON Data0096.USER_PTR = tran_by.RKEY ' +
          ' where data0022.rkey='+FRkey;

  gSvrIntf.IntfGetDataBySql(Lsql,cdsMain);

  inherited;
end;



end.
