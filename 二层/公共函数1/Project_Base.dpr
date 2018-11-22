program Project_Base;

uses
  Forms,
  DM_f in 'DM_f.pas' {DM: TDataModule},
  base in 'base.pas' {Base_f},
  Findcds_unt in 'Findcds_unt.pas' {Findcds_frm},
  Toolbar in 'Toolbar.pas' {Toolbar_f},
  SingleDataSet in 'SingleDataSet.pas' {SingleDataSet_f},
  MultiDataSet in 'MultiDataSet.pas' {MultiDataSet_f},
  MC in 'MC.pas' {MC_f},
  SelectItem_unt in 'SelectItem_unt.pas' {SelectItem_frm};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFindcds_frm, Findcds_frm);
  Application.CreateForm(TToolbar_f, Toolbar_f);
  Application.CreateForm(TSingleDataSet_f, SingleDataSet_f);
  Application.CreateForm(TMultiDataSet_f, MultiDataSet_f);
  Application.CreateForm(TMC_f, MC_f);
  Application.CreateForm(TSelectItem_frm, SelectItem_frm);
  Application.Run;
end.
