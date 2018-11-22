program A_EP220;

{%ToDo 'A_EP220.todo'}

uses
  Forms,
  DefectsLib in 'DefectsLib.pas' {FrmDefectsLib},
  Main in 'Main.pas' {FrmMain},
  Prod_Resource in 'Prod_Resource.pas' {FrmProdResource},
  CustP_Search in 'CustP_Search.pas' {FrmCustPart},
  term in 'term.pas' {Form_condition},
  location_search in 'location_search.pas' {Form_lo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成品报废处理';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
