program WZPR805;

uses
  Forms,
  FileGroup in 'FileGroup.pas' {FileGroup_f},
  TemporarilyBy in 'TemporarilyBy.pas' {TemporarilyBy_f},
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '供应商环保测试报告';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(TFileGroup_f, FileGroup_f);
  Application.Run;
end.
