program PrgFD307;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_PrgType_u in 'Frm_PrgType_u.pas' {Frm_PrgType},
  Frm_edit_u in 'Frm_edit_u.pas' {Frm_edit},
  Frm_QrySet_u in 'Frm_QrySet_u.pas' {Frm_QrySet},
  Frm_fileEdt_u in 'Frm_fileEdt_u.pas' {Frm_fileEdt};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工艺文档管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
