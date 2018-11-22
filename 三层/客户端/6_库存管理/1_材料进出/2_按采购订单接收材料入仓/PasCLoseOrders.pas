unit PasCLoseOrders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Data.DB,
  Datasnap.DBClient;

type
  TfrmCLoseOrders = class(TfrmBaseEdit)
    ehMain: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();
  end;

var
  frmCLoseOrders: TfrmCLoseOrders;

implementation

{$R *.dfm}

{ TfrmCLoseOrders }

procedure TfrmCLoseOrders.Button1Click(Sender: TObject);
begin
  inherited;
  if (cdsMain.IsEmpty) then
  begin
    ShowMessage('请选择要关闭的单据');
    Edit1.SetFocus;
    Exit;
  end else modalresult:=mrok;
end;

procedure TfrmCLoseOrders.Button2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCLoseOrders.cdsMainAfterScroll(DataSet: TDataSet);
var lsql:string;
begin
  inherited;
  lsql:='SELECT dbo.Data0071.RKEY as SOURCE_PTR, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
        +'        dbo.Data0071.QUAN_ORD, Data0071.QUAN_RECD, dbo.Data0071.REQ_DATE,'
        +'        dbo.Data0071.extra_req, dbo.Data0002.UNIT_NAME, dbo.Data0071.WO_PTR,'
        +'        dbo.Data0071.PURCHASE_UNIT_PTR, dbo.Data0071.TAX_2, data0017.STOCK_BASE,'
        +'        dbo.Data0071.CONVERSION_FACTOR, dbo.Data0071.INVT_PTR, data0017.CRITICAL_MATL_FLAG,'
        +'        dbo.Data0017.SHELF_LIFE, Data0002_1.UNIT_NAME AS pr_unitname, data0071.QUAN_IN_INSP,'
        +'        Data0017.INV_PART_NUMBER, Data0071.tax_price, data0071.avl_flag,data0071.if_caf,'
        +'        dbo.Data0071.rohs,Data0071.QUAN_ORD-Data0071.QUAN_RECD as 欠货数量, dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME, dbo.Data0005.EMPL_CODE,'
        +'         dbo.Data0034.DEPT_CODE,Data0071.reason,Data0071.QUAN_RETN,'
       +'0 as QUANTITY,'''' as LOCATION,'''' as spec_place,'''' as SUPPLIER2,'
       +'convert(char(10),getdate(),120) as TDATE,0 as LOCATION_PTR,0 as mark,0 as Rkey391,'''' as BARCODE_ID,0 as QUAN_ON_HAND,0 as rkey'
        +'  FROM dbo.Data0017 INNER JOIN'
        +'        dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Data0071.INVT_PTR INNER JOIN'
        +'        dbo.Data0002 ON'
        +'        dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
        +'        dbo.Data0002 Data0002_1 ON dbo.Data0071.WO_PTR = Data0002_1.RKEY LEFT OUTER JOIN'
        +'        dbo.Data0068 LEFT OUTER JOIN'
        +'        dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN'
        +'        dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RIGHT OUTER JOIN'
        +'        dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY'
        +'  where data0071.PO_ptr='+inttostr(Dataset.FieldByName('RKEY').AsInteger);
    gSvrintf.IntfGetDataBySql(lsql,cdsDetail);
end;

procedure TfrmCLoseOrders.Edit1Change(Sender: TObject);
begin
  inherited;
  IF trim(EDIT1.TEXT)<>'' THEN
    cdsMain.Filter := 'PO_NUMBER like ''%'+trim(edit1.text)+'%'''
  ELSE
    cdsMain.FILTER := '';
end;

procedure TfrmCLoseOrders.GetData;
var Lsql:string;
begin
  Lsql:=cdsMain.CommandText;
  gSvrIntf.IntfGetDataBySql(Lsql,cdsMain);
end;

end.
