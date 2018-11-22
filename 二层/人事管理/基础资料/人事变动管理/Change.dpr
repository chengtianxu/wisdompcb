program Change;

uses
  Forms,
  main in 'main.pas' {fm_main},
  Madd in 'Madd.pas' {fm_madd},
  Qry in 'Qry.pas' {fm_qry},
  Emp in 'Emp.pas' {fm_emp},
  damo in 'damo.pas' {dm: TDataModule},
  UpdateLZDate in 'UpdateLZDate.pas' {FrmUpdateLZDate},
  SelectItemUnit in 'SelectItemUnit.pas' {frmSelectItem},
  formFind in 'formFind.pas' {frmFind},
  SelectItemUnit2 in 'SelectItemUnit2.pas' {frmSelectItem2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '人事变动管理';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfm_main, fm_main);
  Application.CreateForm(TfrmSelectItem, frmSelectItem);
  Application.CreateForm(TfrmFind, frmFind);
  Application.CreateForm(TfrmSelectItem2, frmSelectItem2);
  Application.Run;
end.
