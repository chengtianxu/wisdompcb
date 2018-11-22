program LZEmployee;

uses
  Forms,
  frm_main_u in 'frm_main_u.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  UQuery in 'UQuery.pas' {Query_Form},
  Madd in 'Madd.pas' {fm_madd},
  Emp in 'Emp.pas' {fm_emp},
  UpdateLZDate in 'UpdateLZDate.pas' {FrmUpdateLZDate},
  common in 'common.pas',
  u_infosend in 'u_infosend.pas' {frm_infosend},
  u_infohistory in 'u_infohistory.pas' {frm_infohistory};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¿Î÷∞µµ∞∏';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
