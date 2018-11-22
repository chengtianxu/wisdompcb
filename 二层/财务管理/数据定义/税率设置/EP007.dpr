program EP007;

uses
  Forms,
  prodRSDesign in 'prodRSDesign.pas' {FrmProdRSDesign},
  NProdRSEdit in 'NProdRSEdit.pas' {FrmNProdRSEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '增值税税率表';
  Application.CreateForm(TFrmProdRSDesign, FrmProdRSDesign);
  Application.Run;
end.
