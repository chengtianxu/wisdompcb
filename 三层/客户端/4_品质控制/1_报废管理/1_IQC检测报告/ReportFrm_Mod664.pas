unit ReportFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Datasnap.DBClient,
  Data.DB, Datasnap.Provider, Data.Win.ADODB, frxDesgn,uBaseFrm,frxChBox;

type
  TfrmReport_Mod664 = class(TForm)
    frxdbdtst493: TfrxDBDataset;
    repTongBan: TfrxReport;
    cds493: TClientDataSet;
    cds391: TClientDataSet;
    cds392: TClientDataSet;
    frxdbdtst391: TfrxDBDataset;
    frxdbdtst392: TfrxDBDataset;
    repTongZhiDan: TfrxReport;
    repGaoPingBan: TfrxReport;
    repCheLiang: TfrxReport;
    repDrill: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ARkey:string);
  end;

var
  frmReport_Mod664: TfrmReport_Mod664;

implementation

uses uCommFunc;

{$R *.dfm}

{ TfrmReport_Mod664 }

procedure TfrmReport_Mod664.GetData(ARkey: string);
var
  LSql493,LSql391,LSql392:string;
begin
  LSql493:= cds493.CommandText;
  LSql391:= cds391.CommandText + ' WHERE DATA0391.RKEY IN ( ' + ARkey + ' ) ';
  LSql392:= cds392.CommandText + ' WHERE DATA0392.rkey391 IN ( ' + ARkey + ' ) ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql391,LSql392]),[cds493,cds391,cds392]) then exit;
end;

end.
