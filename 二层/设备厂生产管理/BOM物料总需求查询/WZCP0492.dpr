program WZCP0492;

uses
  Forms,
  Query_BOM in 'Query_BOM.pas' {Query_term},
  Query_DM in 'Query_DM.pas' {DM: TDataModule},
  QueryPick_CutnoShop in 'QueryPick_CutnoShop.pas' {QueryPick_Cutno},
  QueryPick_BOMShop in 'QueryPick_BOMShop.pas' {QueryPick_BOM},
  QueryPick_DemandShop in 'QueryPick_DemandShop.pas' {QueryPick_Demand};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BOM总需求查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TQuery_term, Query_term);
  Application.Run;
end.
