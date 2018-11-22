unit VMILogoCard_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxDesgn, frxClass, frxDBSet,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.Win.ADODB,ucommfunc,frxBarcode;

type
  TfrmVMILogoCard_Mod564 = class(TForm)
    con1: TADOConnection;
    qry1: TADOQuery;
    dtstprvdr1: TDataSetProvider;
    cds134: TClientDataSet;
    cds493s: TClientDataSet;
    fdb493: TfrxDBDataset;
    fdbs134: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    qry1rkey17: TAutoIncField;
    qry1rkey23: TAutoIncField;
    qry1条形码: TStringField;
    qry1供应商代码: TStringField;
    qry1供应商名称: TStringField;
    qry1供应商: TStringField;
    qry1材料名称: TStringField;
    qry1规格型号: TStringField;
    qry1材料编码: TStringField;
    qry1收入: TBCDField;
    qry1日期: TStringField;
    cds134rkey17: TAutoIncField;
    cds134rkey23: TAutoIncField;
    cds134条形码: TStringField;
    cds134供应商代码: TStringField;
    cds134供应商名称: TStringField;
    cds134供应商: TStringField;
    cds134材料名称: TStringField;
    cds134规格型号: TStringField;
    cds134材料编码: TStringField;
    cds134收入: TBCDField;
    cds134日期: TStringField;
    cds134结存: TFloatField;
    cdsQry1: TClientDataSet;
    procedure cds134CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure GetData(ARkey: string);
  end;

var
  frmVMILogoCard_Mod564: TfrmVMILogoCard_Mod564;

implementation

{$R *.dfm}

{ TfrmVMILogoCard_Mod564 }

procedure TfrmVMILogoCard_Mod564.cds134CalcFields(DataSet: TDataSet);
var Lsq:string;
begin
  Lsq:='select sum(data0134.quan_on_hand) as qty from data0134'
       +' inner join data0133 on data0134.grn_ptr=data0133.rkey'
       +' inner join data0023 on data0133.supp_ptr=data0023.rkey'
       +' inner join data0017 on data0134.INVENTORY_PTR=data0017.rkey'
       +' where data0017.rkey='+cds134rkey17.AsString+' and data0023.rkey='+cds134rkey23.AsString
       +' group by data0017.rkey,data0023.rkey';
  gSvrIntf.IntfGetDataBySql(Lsq,cdsQry1);
  cds134.FieldByName('结存').Value:=cdsQry1.FieldByName('qty').Value;
end;

procedure TfrmVMILogoCard_Mod564.GetData(ARkey: string);
var
  LSql493,LSql22:string;
begin
  LSql493:= cds493s.CommandText;
  LSql22:= cds134.CommandText + ' where data0134.rkey= ' + ARkey + ' ';
  if NOT gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql493,LSql22]),[cds493s,cds134]) then exit;
end;

end.
