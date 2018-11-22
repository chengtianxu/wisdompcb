unit SeleIQC_Mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ucommfunc, uBaseEditFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmSeleIQC_Mod33 = class(TfrmBaseEdit)
    DBGridEh1: TDBGridEh;
    cds391: TClientDataSet;
    ds391: TDataSource;
    procedure btnCloseClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(rk71:string;rk17:string);
  end;

var
  frmSeleIQC_Mod33: TfrmSeleIQC_Mod33;

implementation

{$R *.dfm}

procedure TfrmSeleIQC_Mod33.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSeleIQC_Mod33.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrok;
end;

procedure TfrmSeleIQC_Mod33.GetData(rk71, rk17: string);
var LSQL:string;
begin
  lSQL := 'SELECT  DATA0391.rkey, iqc_number, rkey71, rkey17, supplier_model, sgs_no, sgs_date, rece_qty, iqc_qty, barch_no, appl_user_ptr, appl_date, appr_user_ptr,'
          +' appr_date, auth_user_ptr, auth_date, if_halogen, appearance, part_size, part_thickness, tong_thickness, thick_tolerance, ht_remark, if_standard,'
          +' extrl_date, judge_result, remark, DATA0391.status, manufacture_TDATE, package_qualified, qty_qualified, hasheepreport, stock_over,data0071.extra_req'
          +' FROM DATA0391 inner join data0071 on data0391.rkey71=data0071.rkey inner join data0017 on data0391.rkey17=data0017.rkey where data0071.Rkey= '+rk71+' AND data0017.rkey='+rk17+' and stock_over=0 and (DATA0391.status=2 or data0391.status=1) order by data0391.auth_date';
  gSvrIntf.IntfGetDataBySql(lSQL,cds391);
end;

end.
