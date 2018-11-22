program EP305;

uses
  Forms,
  Main in 'Main.pas' {Form_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  Insert1 in 'Insert1.pas' {Form_Insert1},
  Insert2 in 'Insert2.pas' {Form_Insert2},
  Customer in 'Customer.pas' {Form_Customer};

{$R *.res}

begin
  Application.Initialize;
  Application.Title:='装运方法和国家区域定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
