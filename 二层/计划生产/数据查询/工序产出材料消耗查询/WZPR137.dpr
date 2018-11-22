program WZPR137;

uses
  Forms,
  UWZ137 in 'UWZ137.pas' {Query_Form},
  UDM137 in 'UDM137.pas' {DM: TDataModule},
  UD137 in 'UD137.pas' {Main_form},
  UInv in 'UInv.pas' {Inv_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WZPR137';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_form, Main_form);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.CreateForm(TInv_Form, Inv_Form);
  Application.Run;
end.
