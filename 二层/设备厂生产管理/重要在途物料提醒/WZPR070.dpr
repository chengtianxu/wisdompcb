program WZPR070;

uses
  Forms,
  Main_unt in 'Main_unt.pas' {Form1},
  Findcds_unt in 'Findcds_unt.pas' {Findcds_frm},
  SelectItem1_unt in 'SelectItem1_unt.pas' {SelectItem1_frm},
  SelectedDate_unt in 'SelectedDate_unt.pas' {SelectedDate_frm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '重要在途物料提醒';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
