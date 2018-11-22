program WZSB_060;

uses
  Forms,
  UWZSB_060 in 'UWZSB_060.pas' {Main_Form},
  UQuery in 'UQuery.pas' {Query_Form},
  UDM in 'UDM.pas' {DM: TDataModule},
  UENC in 'UENC.pas' {NEC_Form},
  UPROD in 'UPROD.pas' {Prod_Form},
  UPRODS in 'UPRODS.pas' {ProdS_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产成品特殊出仓';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
