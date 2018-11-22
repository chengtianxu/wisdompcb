program Bar;

{$R 'CallerResource.res' 'CallerResource.rc'}

uses
  Forms,
  Frm_main in 'Frm_main.pas' {Form1},
  CmpHisFrm in 'CmpHisFrm.pas' {frmCmpHis};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '°ü×°ÌõÂë¼ì²â';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
