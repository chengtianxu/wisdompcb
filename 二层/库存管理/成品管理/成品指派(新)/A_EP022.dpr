program A_EP022;

uses
  Forms,
  main in 'main.pas' {fm_main},
  detail in 'detail.pas' {fm_detail},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {fm_condition},
  note in 'note.pas' {fm_note},
  ModifyUnitWeight_U in 'ModifyUnitWeight_U.pas' {FrmModifyUnitWeight},
  Frm_YSCond_u in 'Frm_YSCond_u.pas' {Frm_YSCond},
  Frm_YSResult_u in 'Frm_YSResult_u.pas' {Frm_YSResult},
  cust_del in 'cust_del.pas' {Fcust_del},
  stock_search in 'stock_search.pas' {Form_Stock},
  ShowShipNoInfo in 'ShowShipNoInfo.pas' {frmShowShipNoInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售订单装运指派';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfm_main, fm_main);
  Application.CreateForm(Tfm_condition, fm_condition);

  Application.Run;
end.
