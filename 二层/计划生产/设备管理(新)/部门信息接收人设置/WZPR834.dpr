program WZPR834;

uses
  Forms,
  Main in 'Main.pas' {frm_Main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  information in 'information.pas' {frm_Information};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '部门信息接收人设置';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
