program A_WZCX0492;

uses
  Forms,
  MainUNIT1 in 'MainUNIT1.pas' {MainForm1},
  DmUnit1 in 'DmUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  Pas_WorkDetails in 'Pas_WorkDetails.pas' {Frm_WorkDetails},
  PasViewSales in 'PasViewSales.pas' {frmViewSales},
  PasFieldShow in 'PasFieldShow.pas' {frmFieldShow};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '投产明细表';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TIf_Form1, If_Form1);
  Application.Run;
end.
