unit UReportOtheFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Data.DB, Data.Win.ADODB,
  frxClass, frxDBSet, Datasnap.DBClient,uCommFunc;

type
  TfrmReportOther_mod38 = class(TFrmBase)
    cds457: TClientDataSet;
    cds208: TClientDataSet;
    frxrprt2: TfrxReport;
    frxdbdtst457: TfrxDBDataset;
    frxdbdtst208: TfrxDBDataset;
    qry457: TADOQuery;
    qry208: TADOQuery;
    cds493: TClientDataSet;
    qry493: TADOQuery;
    strngfldqry493公司名称1: TStringField;
    strngfldqry493公司名称2: TStringField;
    strngfldqry493公司名称3: TStringField;
    strngfldqry493公司地址: TStringField;
    blbfldqry493公司图标: TBlobField;
    strngfldqry493公司位置1: TStringField;
    strngfldqry493公司位置2: TStringField;
    strngfldqry493公司位置3: TStringField;
    strngfldqry493电话: TStringField;
    frxdbdtst493: TfrxDBDataset;
    qry457RKEY: TAutoIncField;
    qry457GON_NUMBER: TStringField;
    qry457REF_NUMBER: TStringField;
    qry457CREATE_DATE: TDateTimeField;
    qry457ABBR_NAME: TStringField;
    qry457TTYPE: TSmallintField;
    qry457DEPT_CODE: TStringField;
    qry457DEPT_NAME: TStringField;
    qry457EMPLOYEE_NAME: TStringField;
    qry457发料人员: TStringField;
    qry457出仓类型: TStringField;
    qry457状态: TStringField;
    qry457备注: TStringField;
    qry208goods_name: TStringField;
    qry208goods_guige: TStringField;
    qry208goods_type: TStringField;
    qry208rohs: TStringField;
    qry208UNIT_NAME: TStringField;
    qry208rkey: TAutoIncField;
    qry208SOURCE_PTR: TIntegerField;
    qry208DEPT_PTR: TIntegerField;
    qry208GON_PTR: TIntegerField;
    qry208TRANSACTION_PTR: TIntegerField;
    qry208GL_HDR_PTR: TIntegerField;
    qry208TDATE: TDateTimeField;
    qry208QUANTITY: TFloatField;
    qry208RTN_QUANTITY: TFloatField;
    qry208D457_IDKey: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }

   procedure GetData(ARkey:string);
  end;

var
  frmReportOther_mod38: TfrmReportOther_mod38;

implementation

{$R *.dfm}

{ TfrmReportOther_mod38 }

procedure TfrmReportOther_mod38.GetData(ARkey: string);
var
  Lsql457, Lsql208,Lsql493: string;
begin

  Lsql457 := 'SELECT dbo.Data0457.RKEY, dbo.Data0457.GON_NUMBER,  '+
' dbo.Data0457.REF_NUMBER,'+
' dbo.Data0457.CREATE_DATE,'+
' dbo.Data0015.ABBR_NAME, data0457.TTYPE,'+
' dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'+
' dbo.Data0005.EMPLOYEE_NAME,'+
' Data0005_1.EMPLOYEE_NAME as 发料人员,'+
' case data0457.ttype when 1 then ''按配料单''   '+
' when 2 then ''部门'' when 3 then ''发料到车间''   '+
' when 4 then ''料退仓'' when 5 then ''杂项物品''   '+
' when 6 then ''项退仓'' '+
' end as 出仓类型,'+
' case data0457.status when 0 then ''审计''    ' +
' when 1 then ''审计'' '+
' end as 状态,Data0457.Cut_No as 备注   '+
' FROM dbo.Data0457 INNER JOIN '+
' dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN '+
' dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.RKEY INNER JOIN  '+
' dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.RKEY INNER JOIN  '+
' dbo.Data0005 Data0005_1 ON dbo.Data0457.CREATE_BY = Data0005_1.RKEY  '+
' where data0457.rkey='+ARKey;


  Lsql208 := ' select  b.goods_name ,b.goods_guige  ,b.goods_type  , b.rohs   , '+
' c.UNIT_NAME ,a.QUANTITY'+
 ' from data0208  a'+
'  inner join Data0235 b  on a.SOURCE_PTR=b.RKEY'+
'  inner join Data0002 c on b.unit_ptr=c.rkey'+
'  where a.GON_PTR= '+ARKey+'';

 Lsql493:=' SELECT Company_Name as 公司名称1, '+
' Company_Name2 as 公司名称2,'+
' Company_Name3 as 公司名称3,'+
' ship_address as 公司地址,'+
' Company_Icon as 公司图标,'+
' SITE_INFO_ADD_1 as 公司位置1,'+
' SITE_INFO_ADD_2 as 公司位置2,'+
' SITE_INFO_ADD_3 as 公司位置3,'+
' SITE_INFO_PHONE as 电话'+
' FROM DATA0493';

   gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([ Lsql457, Lsql208,Lsql493]),
    [ cds457, cds208,cds493]);
end;

end.
