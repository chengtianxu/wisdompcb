program WZPR121;

uses
  Forms,
  UEP121 in 'UEP121.pas' {Main_Form},
  UDetail in 'UDetail.pas' {Detail_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TDetail_Form, Detail_Form);
  Application.Run;
end.
