program ep135;

uses
  Forms,
  main in 'main.pas' {mainform},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {condition_form},
  detail in 'detail.pas' {cust_detail},
  location in 'location.pas' {ship_location},
  specific_note in 'specific_note.pas' {spec_note},
  Usms in 'Usms.pas' {SMS_Frm},
  note_information in 'note_information.pas' {Form11},
  Credit in 'Credit.pas' {CreditForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户信息管理';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(Tcondition_form, condition_form);
  Application.Run;
end.
