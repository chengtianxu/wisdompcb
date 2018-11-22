program WZPR834;

uses
  Forms,
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule},
  formDeptPhone in 'formDeptPhone.pas' {frmDeptPhone};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '部门信息接收人设置';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(TfrmDeptPhone, frmDeptPhone);
  Application.Run;
end.
