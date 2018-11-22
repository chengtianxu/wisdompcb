unit PasSo_report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Datasnap.DBClient,
  frxDesgn, Datasnap.Provider, Data.DB, Data.Win.ADODB,ucommfunc;

type
  TfrmSo_report = class(TForm)
    con1: TADOConnection;
    qry1: TADOQuery;
    dtstprvdr1: TDataSetProvider;
    cds493s: TClientDataSet;
    fdb493: TfrxDBDataset;
    cds60: TClientDataSet;
    fdb60: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    cds89: TClientDataSet;
    frxDBDataset1: TfrxDBDataset;
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure GetData(ARkey60,Arkey25: string);
  end;

var
  frmSo_report: TfrmSo_report;

implementation

{$R *.dfm}

{ TfrmSo_report }

procedure TfrmSo_report.frxReport1BeforePrint(Sender: TfrxReportComponent);
var
  i:word;
  s:string;
begin
  s:='                     ';
  i:=1;
  while not cds89.Eof do
//  begin
//
//  end;
// for i:=1 to cds89.RecordCount do
  begin
    if odd(cds89.RecordCount) then
    if i<=(cds89.RecordCount+1)/2 then
    begin
     TfrxMemoView(frxReport1.FindObject('Memo9')).Memo.Add(' '+trim(cds89.FieldByName('parameter_desc').Value)+
     copy(s,1,21-length(trim(cds89.FieldByName('parameter_desc').Value)))+
     trim(cds89.FieldByName('tvalue').AsString)+
     copy(s,1,20-length(trim(cds89.FieldByName('tvalue').Value)))+
      cds89.FieldByName('unit_name').AsString);
    end
    else
    begin
     TfrxMemoView(frxReport1.FindObject('Memo10')).Memo.Add(trim(cds89.FieldByName('parameter_desc').Value)+
     copy(s,1,21-length(trim(cds89.FieldByName('parameter_desc').Value)))+
     trim(cds89.FieldByName('tvalue').Value)+
     copy(s,1,20-length(trim(cds89.FieldByName('tvalue').Value)))+
     cds89.FieldByName('unit_name').Value);
    end
    else
    if i<=(cds89.RecordCount)/2 then
    begin
     TfrxMemoView(frxReport1.FindObject('Memo9')).Memo.Add(' '+trim(cds89.FieldByName('parameter_desc').Value)+
     copy(s,1,21-length(trim(cds89.FieldByName('parameter_desc').Value)))+
     trim(cds89.FieldByName('tvalue').Value)+
     copy(s,1,20-length(trim(cds89.FieldByName('tvalue').Value)))+
      cds89.FieldByName('unit_name').Value);
    end
    else
    begin
     TfrxMemoView(frxReport1.FindObject('Memo10')).Memo.Add(trim(cds89.FieldByName('parameter_desc').Value)+
     copy(s,1,21-length(trim(cds89.FieldByName('parameter_desc').Value)))+
     trim(cds89.FieldByName('tvalue').Value)+
     copy(s,1,20-length(trim(cds89.FieldByName('tvalue').Value)))+
     cds89.FieldByName('unit_name').Value);
    end;
    cds89.Next;
    i:=I+1;
  end;

//  TfrxMemoView(frxReport1.FindObject('Memo9')).Memo
//  TfrxMemoView(frxReport1.FindObject('Memo10')).Memo.Text:='yes';
  TfrxMemoView(frxReport1.FindObject('Memo9')).Memo.Text:='yes';
  //TfrxMemoView(frxReport1.FindObject('Memo28')).Memo.Text:='yes';
end;

procedure TfrmSo_report.GetData(ARkey60,Arkey25: string);
var
  LSql493,LSql60,Lsql89:string;
begin
  LSql493:= cds493s.CommandText;
  Lsql89:=cds89.CommandText+ ' where CUST_PART_PTR = ' + Arkey25 + ' ';
  LSql60:= cds60.CommandText + ' where data0060.rkey = ' + ARkey60 + ' ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql60,Lsql89]),[cds493s,cds60,cds89]) then exit;
end;

end.
