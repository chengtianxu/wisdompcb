unit PasReport_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.Provider, Data.DB,
  Data.Win.ADODB, frxClass, frxDBSet, Datasnap.DBClient,uBaseFrm,ucommfunc,
  frxDesgn;

type
  TfrmReport_Mod564 = class(TForm)
    con1: TADOConnection;
    qry1: TADOQuery;
    dtstprvdr1: TDataSetProvider;
    cds133: TClientDataSet;
    cds134: TClientDataSet;
    cds493: TClientDataSet;
    fdbs133: TfrxDBDataset;
    fdbs134: TfrxDBDataset;
    fdbs493: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    procedure frxReport1AfterPrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure GetData(ARkey: string);
  end;

var
  frmReport_Mod564: TfrmReport_Mod564;

implementation

{$R *.dfm}

{ TfrmReport_Mod564 }

procedure TfrmReport_Mod564.frxReport1AfterPrint(Sender: TfrxReportComponent);
var Lsq133:string;
    Lcds:TClientDataSet;
begin
  Lcds:=TClientDataSet.Create(Self);
  try
    Lsq133 := 'select * from data0133 where rkey = ' +cds133.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySql(Lsq133,Lcds);
    if not Lcds.IsEmpty then
    begin
      Lcds.Edit;
      Lcds.FieldByName('PRINTED').Value:='Y';//ÒÑ´òÓ¡
      Lcds.Post;
    end;
    if (Lcds.ChangeCount>0) then
    if gSvrIntf.IntfPostDataByTable('data0133',Lcds.delta) then
    begin
      Lcds.MergeChangeLog;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmReport_Mod564.GetData(ARkey: string);
var
  LSql133,LSql134,LSql493:string;
begin
  LSql493:= cds493.CommandText;
  LSql133:= cds133.CommandText + ' WHERE DATA0133.RKEY IN ( ' + ARkey + ' ) ';
  LSql134:= cds134.CommandText + ' WHERE DATA0134.GRN_PTR IN ( ' + ARkey + ' ) ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql133,LSql134]),[cds493,cds133,cds134]) then exit;
end;

end.
