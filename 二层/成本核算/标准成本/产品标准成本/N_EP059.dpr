program N_EP059;

uses
  Forms,
  main_059 in 'main_059.pas' {frmmain_059},
  dm in 'dm.pas' {dmcon: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  flowpara_edit in 'flowpara_edit.pas' {Form_flowpara},
  product_MIDetail in 'product_MiDetail.pas' {Form2},
  qry492 in 'qry492.pas' {frmQry492};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品标准成本';
  Application.CreateForm(Tdmcon, dmcon);
  Application.CreateForm(Tfrmmain_059, frmmain_059);
  Application.Run;
end.
