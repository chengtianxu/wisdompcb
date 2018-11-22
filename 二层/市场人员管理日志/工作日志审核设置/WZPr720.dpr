program WZPr720;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_Edit_u in 'Frm_Edit_u.pas' {Frm_Edit},
  Frm_UserSelect_u in 'Frm_UserSelect_u.pas' {Frm_UserSelect};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '市场部日志权限设置';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
