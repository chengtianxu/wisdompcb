unit ReportFrm_Mod353;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB, uCommFunc,
  Datasnap.DBClient, frxDesgn, Data.Win.ADODB, Datasnap.Provider;

type
  TFrmReport_Mod353 = class(TForm)
    cds209: TClientDataSet;
    cds493: TClientDataSet;
    frxdbdtst493: TfrxDBDataset;
    frxdbdtst209: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    cds493Company_Name: TStringField;
    cds493Company_Name2: TStringField;
    cds493Company_Name3: TStringField;
    cds493ship_address: TStringField;
    cds493Company_Icon: TBlobField;
    cds493SITE_INFO_ADD_1: TStringField;
    cds493SITE_INFO_ADD_2: TStringField;
    cds493SITE_INFO_ADD_3: TStringField;
    cds493SITE_INFO_PHONE: TStringField;
    cds209物品名称: TStringField;
    cds209物品规格: TStringField;
    cds209物品类别: TStringField;
    cds209供应商: TStringField;
    cds209联系人: TStringField;
    cds209联系电话: TStringField;
    cds209地址: TStringField;
    cds209装运日期: TDateTimeField;
    cds209采购订单号: TStringField;
    cds209入库单号: TStringField;
    cds209要求日期: TDateTimeField;
    cds209送货单号: TStringField;
    cds209订购数量: TFloatField;
    cds209订购单位: TStringField;
    cds209已接收数量: TBCDField;
    cds209接收单价: TBCDField;
    cds209退货数量: TFloatField;
    cds209退货人员: TStringField;
    cds209退货金额: TFloatField;
    cds209工厂名称: TStringField;
    cds209装运方法: TWideStringField;
    cds209退货备注: TWideStringField;
    cds209税率: TBCDField;
    cds209Rkey: TAutoIncField;
    cds209接收日期: TDateTimeField;
    cds209装运人员: TStringField;
  private
    { Private declarations }
  public
    procedure GetData(ARkey: string);
    { Public declarations }
  end;

var
  FrmReport_Mod353: TFrmReport_Mod353;

implementation

{$R *.dfm}

{ TFrmReport_Mod353 }

procedure TFrmReport_Mod353.GetData(ARkey: string);
begin
  gSvrIntf.IntfGetDataBySql(cds209.CommandText + ' and  Data0209.Rkey= ' + ARkey , cds209);
  gSvrIntf.IntfGetDataBySql(cds493.CommandText , cds493);
end;

end.
