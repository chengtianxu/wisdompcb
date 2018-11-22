program EP080;

uses
  Forms,
  mic_category in 'mic_category.pas' {Form1},
  edit_mic in 'edit_mic.pas' {Form2},
  acc_search in 'acc_search.pas' {Form_account};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '杂项费用分类';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
