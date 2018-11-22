unit MainFrm_Mod725;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmMain_Mod725 = class(TfrmBaseMain)
    btnSummary: TBitBtn;
    procedure btnQryClick(Sender: TObject);
    procedure btnSummaryClick(Sender: TObject);
  private
  LEDate:TDateTime;
    { Private declarations }
  public
    procedure GetData;override;
    { Public declarations }
  end;

var
  frmMain_Mod725: TfrmMain_Mod725;

implementation

uses
  System.DateUtils,uCommFunc, QryItemFrm_Mod725;

{$R *.dfm}

{ TfrmMain_Mod725 }

procedure TfrmMain_Mod725.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Y1408.T_Date';
    cdsMainWhereInit.FieldByName('Oper').AsString := 'Çø¼ä';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-15)) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1));
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod725.btnSummaryClick(Sender: TObject);
var
  LFrm:TfrmQryItem_Mod725;
begin
  inherited;
  LFrm:= TfrmQryItem_Mod725.Create(Application);
  try
    LFrm.dtpk2.Date:= IncDay(gFunc.GetSvrDateTime(dtdate));
    LFrm.dtpk1.Date:= IncMonth(LFrm.dtpk2.Date);
    if LFrm.ShowModal= mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod725.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText;
  if Trim(FMainWhere) = '' then
  begin
//    LEDate:= gFunc.GetSvrDateTime();
//    FMainWhere:= ' AND Y1408.T_Date Between ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncMonth(LEDate,-3)))
//          + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,1)));
    FMainWhere:= ' and 1=0';
  end;
  inherited;
end;

end.
