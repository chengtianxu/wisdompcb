program WZPR133;

uses
  Forms,
  Main in 'Main.pas' {Form_Main},
  PoInWh in 'PoInWh.pas' {Form_PoIn},
  PoSearch in 'PoSearch.pas' {Form_PoSearch},
  DirectIn in 'DirectIn.pas' {Form_DirectIn},
  demo in 'demo.pas' {dm: TDataModule},
  OutWh in 'OutWh.pas' {Form_OutWh},
  Condition in 'Condition.pas' {Form_Condition},
  DeInEdit in 'DeInEdit.pas' {Form_DeInEdit},
  ReturnOut in 'ReturnOut.pas' {Form_ReturnOut},
  ReturnDetail in 'ReturnDetail.pas' {Form_ReturnDetail},
  SelectIn in 'SelectIn.pas' {Form_SelectIn},
  SelectOut in 'SelectOut.pas' {Form_SelectOut},
  SelectAll in 'SelectAll.pas' {Form_SelectAll},
  StockSearch in 'StockSearch.pas' {Form_StockSearch},
  Warehouse in 'Warehouse.pas' {Form_Warehouse},
  User in 'User.pas' {Form_User},
  PutOut in 'PutOut.pas' {Form_PutOut},
  Inventory in 'Inventory.pas' {Form_Inventory},
  InvGroup in 'InvGroup.pas' {Form_InvGroup},
  InvType in 'InvType.pas' {Form_InvType},
  Supply in 'Supply.pas' {Form_Supply},
  Location in 'Location.pas' {Form_Location},
  ReturnSearch in 'ReturnSearch.pas' {Form_ReturnSearch},
  Audit in 'Audit.pas' {Form_Audit},
  OutEdit in 'OutEdit.pas' {Form_OutEdit},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  form_main_in in 'form_main_in.pas' {Form_mainin},
  out_report in 'out_report.pas' {Form_outreport},
  Section in 'Section.pas' {Form_Section},
  ShowMat in 'ShowMat.pas' {Form_ShowMat},
  ShowSum in 'ShowSum.pas' {Form_ShowSum},
  InReport in 'InReport.pas' {Form_InReport},
  Remark in 'Remark.pas' {Form_Remark},
  put_total in 'put_total.pas' {Form7},
  rec_total in 'rec_total.pas' {Form6},
  invt_quan in 'invt_quan.pas' {Form4},
  BzReport in 'BzReport.pas' {Form_BzReport},
  qrcode in 'qrcode.pas',
  pasCode in 'pasCode.pas' {frmCode};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '供应商VMI库存管理';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
