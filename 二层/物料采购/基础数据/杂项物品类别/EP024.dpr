program EP024;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  AddItems in 'AddItems.pas' {FrmAddItems},
  EditItems in 'EditItems.pas' {FrmEditItems};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '杂项物品类别';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
