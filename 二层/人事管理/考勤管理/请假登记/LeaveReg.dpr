program LeaveReg;

uses
  Forms,
  main in 'main.pas' {Form_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  Reg in 'Reg.pas' {Form_Reg},
  Single in 'Single.pas' {Form_Single},
  Query in 'Query.pas' {Form_Query},
  common in 'D:\vss_lyh\程序公共单位\common.pas',
  Single1 in 'Single1.pas' {Form_Single1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '请假登记';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TForm_Single1, Form_Single1);
  Application.Run;
end.
