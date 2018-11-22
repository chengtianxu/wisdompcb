program Pu597;

uses
  Forms,
  Umain in 'Umain.pas' {Form2},
  Upu597 in 'Upu597.pas' {DM: TDataModule},
  Uweixin in '..\客户索赔\Uweixin.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '品质索赔申请评审';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
