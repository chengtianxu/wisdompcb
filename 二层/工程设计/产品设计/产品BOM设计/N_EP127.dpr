program N_EP127;

uses
  Forms,
  Bom_Edit in 'Bom_Edit.pas' {frmBom_Edit},
  main_127 in 'main_127.pas' {frmmain_127},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  Dm in 'Dm.pas' {dmcon: TDataModule},
  PickBOMPart in 'PickBOMPart.pas' {frmPickBOMPart},
  product_MIDetail in 'product_MiDetail.pas' {Form2},
  flowpara_edit in 'flowpara_edit.pas' {Form_flowpara},
  PickEngNote in 'PickEngNote.pas' {frmPickEngNote},
  FileReadWriteUnitClass in 'FileReadWriteUnitClass.pas',
  drcacle in 'drcacle.pas' {Form_drcalc},
  Pick_BOM_Item in 'Pick_BOM_Item.pas' {frmPickBomItem1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品BOM设计';
  Application.CreateForm(Tdmcon, dmcon);
  Application.CreateForm(Tfrmmain_127, frmmain_127);
  Application.Run;
end.
