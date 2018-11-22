program ep015;

uses
  Forms,
  main in 'main.pas' {mainform},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {condition_form},
  detail in 'detail.pas' {detail_info},
  specical_note in 'specical_note.pas' {spec_note},
  Pick_WorkShop in 'Pick_WorkShop.pas' {frmPick_WorkShop},
  uAlter_Info in 'uAlter_Info.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '供应商信息管理';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(Tcondition_form, condition_form);
  Application.Run;
end.
