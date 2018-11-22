program FasDim;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  Dictionary in 'Dictionary.pas' {FrmDictionary},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_dec_u in 'Frm_dec_u.pas' {Frm_dec},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  Frm_find_u in 'Frm_find_u.pas' {Frm_find};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '固定资产减少';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
