program DormitoryMsg;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  U_DM in 'U_DM.pas' {DM: TDataModule},
  SelectItemUnit in 'SelectItemUnit.pas' {frmSelectItem},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工宿舍定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmSelectItem, frmSelectItem);
  //Application.CreateForm(TForm2, Form2);
//  Application.CreateForm(TForm3, Form3);
//  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
