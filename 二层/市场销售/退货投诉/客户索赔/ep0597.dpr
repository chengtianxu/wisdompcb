program ep0597;

uses
  Forms,
  Umain in 'Umain.pas' {Form_main},
  Udemo in 'Udemo.pas' {DM: TDataModule},
  Unusual in 'Unusual.pas' {Frm_Unusual},
  UnDetail in 'UnDetail.pas' {Frm_UnDetail},
  UDepname in 'UDepname.pas' {Frm_depname},
  Uadd in 'Uadd.pas' {Form_add},
  Uaddmx in 'Uaddmx.pas' {Form_addmx},
  Uspzt in 'Uspzt.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form_Report},
  Usel in 'Usel.pas' {Form_sel},
  Uhelp in 'Uhelp.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Uweixin in 'Uweixin.pas' {Form5},
  Umoney_ft in 'Umoney_ft.pas' {Form_money},
  Uresponsibility in 'Uresponsibility.pas' {Form_FT};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∆∑÷ À˜≈‚…Í«Î';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TForm_sel, Form_sel);
  Application.Run;
end.
