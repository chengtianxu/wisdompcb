program EP110;

uses
  Forms,
  main in 'main.pas' {Form1},
  ass_add in 'ass_add.pas' {form_add},
  ass_edit in 'ass_edit.pas' {Form_edit},
  damo in 'damo.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '固定资产类别';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(Tform_add, form_add);
  //Application.CreateForm(TForm_edit, Form_edit);
  Application.Run;
end.
