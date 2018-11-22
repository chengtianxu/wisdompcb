unit PasshuReport_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.Win.ADODB, frxDesgn,uBaseFrm,ucommfunc;

type
  TfrmshuReport_Mod564 = class(TForm)
    con1: TADOConnection;
    qry1: TADOQuery;
    dtstprvdr1: TDataSetProvider;
    cds493: TClientDataSet;
    fdbs493: TfrxDBDataset;
    cds149: TClientDataSet;
    fdbs149: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    cds724: TClientDataSet;
    fdbs724: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
     procedure GetData(ARkey: string);
  end;

var
  frmshuReport_Mod564: TfrmshuReport_Mod564;

implementation

{$R *.dfm}

{ TfrmshuReport_Mod564 }

procedure TfrmshuReport_Mod564.GetData(ARkey: string);
var
  LSql149,LSql493,LSql724:string;
begin
  LSql493:= cds493.CommandText;
  LSql149:= cds149.CommandText + ' and data0724.rkey= ' + ARkey + ' ';
  LSql724:= cds724.CommandText + ' and data0724.rkey= ' + ARkey + ' ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql149,LSql724]),[cds493,cds149,cds724]) then exit;
end;

end.
