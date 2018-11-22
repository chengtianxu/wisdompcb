program ContractOfEmployee;

uses
  Forms,
  UMain in 'UMain.pas' {Main_Form},
  UDM in 'UDM.pas' {DM: TDataModule},
  UDetail in 'UDetail.pas' {Detail_Form},
  UQuery in 'UQuery.pas' {Query_Form},
  ufrmadmin in 'ufrmadmin.pas' {frmadmin};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工合同';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
