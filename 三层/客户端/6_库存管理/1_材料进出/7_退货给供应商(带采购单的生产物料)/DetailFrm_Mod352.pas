unit DetailFrm_Mod352;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , uBaseDBGridEhListFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uCommFunc, uBaseMainFrm;

type
  TFrmDetail_Mod352 = class(TfrmBaseDBGridEhList)
    cdsMaingoods_name: TStringField;
    cdsMaingoods_guige: TStringField;
    cdsMaingoods_type: TStringField;
    cdsMainABBR_NAME: TStringField;
    cdsMainQUANTITY: TFloatField;
    cdsMainUNIT_NAME: TStringField;
    cdsMainTDATE: TDateTimeField;
    cdsMainExpr1: TStringField;
    cdsMainremark: TWideStringField;
    cdsMainshipping_method: TWideStringField;
    cdsMaintran_date: TDateTimeField;
    cdsMainv_state: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
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
  FrmDetail_Mod352: TFrmDetail_Mod352;

implementation

{$R *.dfm}

{ TFrmDetail_Mod352 }

procedure TFrmDetail_Mod352.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmDetail_Mod352 := nil;
end;

procedure TFrmDetail_Mod352.GetData;
var
  Lsql:string;
begin
  Lsql :=' SELECT Data0235.goods_name, Data0235.goods_guige, Data0235.goods_type, Data0023.ABBR_NAME, '+
         ' dbo.Data0235.quan_to_ship, Data0209.QUANTITY, Data0002.UNIT_NAME, Data0005.EMPLOYEE_NAME AS Expr1, '+
         ' Data0209.TDATE, Data0209.remark, Data0209.shipping_method, Data0209.tran_date, '+
         ' case Data0209.status when ''1'' then ''已装运'' when ''0'' then ''未装运'' end  as ''v_state'','+
         ' tran_by.EMPLOYEE_NAME, Data0076.CODE, Data0076.REJECT_DESCRIPTION '+
         ' FROM Data0209 INNER JOIN '+
         ' Data0235 ON Data0209.SRCE_PTR = Data0235.RKEY INNER JOIN '+
         ' Data0005 ON Data0209.EMPL_PTR = Data0005.RKEY left JOIN '+
         ' Data0005 AS tran_by ON Data0209.tran_by_userptr = tran_by.RKEY INNER JOIN '+
         ' Data0076 ON Data0209.GL_HDR_PTR = Data0076.RKEY INNER JOIN '+
         ' Data0002 ON Data0235.unit_ptr = Data0002.RKEY INNER JOIN '+
         ' Data0456 ON Data0235.GRN_PTR = Data0456.RKEY INNER JOIN '+
         ' Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY ' +
         ' where Data0235.rkey ='+FRkey;
  gSvrIntf.IntfGetDataBySql(Lsql,cdsMain);
  inherited;
end;



end.
