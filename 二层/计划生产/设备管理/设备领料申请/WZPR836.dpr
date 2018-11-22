program WZPR836;

uses
  Forms,
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule},
  form_Picking in 'form_Picking.pas' {frm_Picking},
  form_AuthInfo in 'form_AuthInfo.pas' {frm_AuthInfo},
  form_Picking1 in 'form_Picking1.pas' {frm_Picking1},
  formSelectItem_private in 'formSelectItem_private.pas' {frmSelectItem_private},
  URep in 'URep.pas' {Report_Frm};

{$R *.res}

begin
  Application.Initialize;
 // Application.MainFormOnTaskbar := True;
  Application.Title := '设备领料申请';
  //  Application.CreateForm(TSingleDataSet_f, SingleDataSet_f);
//  Application.CreateForm(Tfrm_SetField, frm_SetField);
  //  Application.CreateForm(TfrmSelectItem, frmSelectItem);
//  Application.CreateForm(TfrmFindcds, frmFindcds);
//  Application.CreateForm(TSingleDataSet_f, SingleDataSet_f);
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(Tfrm_Picking, frm_Picking);
  Application.Run;
end.
