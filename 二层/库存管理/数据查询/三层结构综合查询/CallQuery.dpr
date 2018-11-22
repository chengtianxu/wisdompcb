program CallQuery;

uses
  ShareMem,
  Forms,
  MIDASLIB,
  Unit2 in 'Unit2.pas' {frmQryMain},
  DmConn in 'DmConn.pas' {pdmConn: TDataModule},
  QueryStandard in 'QueryStandard.pas' {frmQueryStandard},
  ClassMstrlDtl in 'ClassMstrlDtl.pas' {frmClassMstrlDtl},
  dlgDataFilter in 'dlgDataFilter.pas' {frmdlgDataFilter},
  dlgRecordFind in 'dlgRecordFind.pas' {frmdlgRecordFind},
  Log in 'Log.pas' {frmLog},
  Qry250 in 'Qry250.pas',
  QryFieldsSet in 'QryFieldsSet.pas' {frmQryFieldsSet},
  MatrlInOut in 'MatrlInOut.pas' {frmMatrlInOut},
  QryDynamicModel in 'QryDynamicModel.pas' {frmQryDynamicModel},
  QryMatrlReceiving in 'QryMatrlReceiving.pas' {frmQryMatrlReceiving},
  QryColumnSet in 'QryColumnSet.pas' {frmQryColumnSet},
  qryHelp in 'qryHelp.pas' {frmqryHelp},
  POMatrl in 'POMatrl.pas' {frmPOMatrl},
  Qry_PO_Summarizing in 'Qry_PO_Summarizing.pas' {frmQry_PO_Summarizing},
  rptDesign in 'rptDesign.pas' {frmrptDesign},
  rpt_Group_Edt in 'rpt_Group_Edt.pas' {frmrpt_Group_Edt},
  rpt_Item_Edt in 'rpt_Item_Edt.pas' {frmrpt_Item_Edt},
  DecisionCubeBugWorkaround in 'DecisionCubeBugWorkaround.pas',
  Query_Param in 'Query_Param.pas' {frmQuery_Param};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '×ÛºÏ²éÑ¯';
  Application.CreateForm(TfrmQryMain, frmQryMain);
  Application.CreateForm(TpdmConn, pdmConn);
  Application.Run;
end.
