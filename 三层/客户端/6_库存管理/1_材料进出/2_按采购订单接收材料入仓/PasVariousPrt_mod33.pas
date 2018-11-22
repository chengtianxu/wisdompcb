unit PasVariousPrt_mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxDesgn, frxClass, Datasnap.DBClient,
  frxDBSet, Datasnap.Provider, Data.DB, Data.Win.ADODB,uBaseFrm,ucommfunc;

type
  TfrmVariousPrt_mod33 = class(TForm)
    con1: TADOConnection;
    qry1: TADOQuery;
    dtstprvdr1: TDataSetProvider;
    f456: TfrxDBDataset;
    cds456: TClientDataSet;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    cds493s: TClientDataSet;
    fdb493: TfrxDBDataset;
    cds235: TClientDataSet;
    f235: TfrxDBDataset;
    procedure frxReport1AfterPrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure GetData(ARkey: string);
  end;

var
  frmVariousPrt_mod33: TfrmVariousPrt_mod33;

implementation

{$R *.dfm}

{ TfrmVariousPrt_mod33 }

procedure TfrmVariousPrt_mod33.frxReport1AfterPrint(
  Sender: TfrxReportComponent);
var Lsq456:string;
    Lcds:TClientDataSet;
begin
  Lcds:=TClientDataSet.Create(Self);
  try
    Lsq456 := 'select * from data0456 where rkey = ' +cds456.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySql(Lsq456,Lcds);
    if not Lcds.IsEmpty then
    begin
      Lcds.Edit;
      Lcds.FieldByName('PRINTED').Value:='Y';//ÒÑ´òÓ¡
      Lcds.Post;
    end;
    if (Lcds.ChangeCount>0) then
    if gSvrIntf.IntfPostDataByTable('data0456',Lcds.delta) then
    begin
      Lcds.MergeChangeLog;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmVariousPrt_mod33.GetData(ARkey: string);
var
  LSql493,LSql235,LSql456:string;
begin
  LSql493:= cds493s.CommandText;
  LSql235:= cds235.CommandText + ' where Data0235.GRN_PTR= ' + ARkey + ' ';
  LSql456:= cds456.CommandText + ' where Data0456.rkey= ' + ARkey + ' ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql235,LSql456]),[cds493s,cds235,cds456]) then exit;
end;

end.
