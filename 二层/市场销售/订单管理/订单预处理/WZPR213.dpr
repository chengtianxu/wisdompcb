program WZPR213;

uses
  Forms,
  main in 'main.pas' {Form_Main},
  demo in 'demo.pas' {DM: TDataModule},
  condition in 'condition.pas' {Form_Condition},
  detail in 'detail.pas' {Form_Detail},
  custpart in 'custpart.pas' {Form_Custpart},
  soprint in 'soprint.pas' {Form_SoPrint},
  cust_search in 'cust_search.pas' {Frm_Cust},
  PasSelectDate in 'PasSelectDate.pas' {frmSelectDate};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∂©µ•‘§¥¶¿Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TfrmSelectDate, frmSelectDate);
  Application.Run;
end.
