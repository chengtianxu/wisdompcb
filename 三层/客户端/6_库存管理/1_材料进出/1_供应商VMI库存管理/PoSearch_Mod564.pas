unit PoSearch_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh,ucommfunc;

type
  LgetRefreshClick=procedure (cds:TClientDataSet) of object;

  TfrmPoSearch_Mod564 = class(TfrmBaseMain)
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure ehMainDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    refresh2:LgetRefreshClick;
    procedure GetData();override;
    procedure getRefreshClick(cds:TClientDataSet);
  end;

var
  frmPoSearch_Mod564: TfrmPoSearch_Mod564;

implementation
uses POruku_Mod564,VMIruku_Mod564;
{$R *.dfm}

procedure TfrmPoSearch_Mod564.Button2Click(Sender: TObject);
begin
  inherited;
  if frmVMIruku_Mod564 = nil then
  begin
    frmVMIruku_Mod564 := TfrmVMIruku_Mod564.Create(Self);
  end;
  frmVMIruku_Mod564 := TfrmVMIruku_Mod564.Create(pnlMain,FModID);

end;

procedure TfrmPoSearch_Mod564.cdsMainAfterScroll(DataSet: TDataSet);
var
  lsql:string;
begin
  inherited;
  if (ehMain.DataSource.DataSet.IsEmpty) then
  begin
    cdsDetail.Active:=False;
  end;
  lsql:='SELECT dbo.Data0071.RKEY as SOURCE_PTR, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
       +'        dbo.Data0071.QUAN_ORD, Data0071.QUAN_RECD, dbo.Data0071.REQ_DATE,'
       +'         dbo.Data0071.extra_req, dbo.Data0002.UNIT_NAME, dbo.Data0071.WO_PTR,'
       +'         dbo.Data0071.PURCHASE_UNIT_PTR, dbo.Data0071.TAX_2, data0017.STOCK_BASE,'
       +'         dbo.Data0071.CONVERSION_FACTOR, dbo.Data0071.INVT_PTR, data0017.CRITICAL_MATL_FLAG,'
       +'         dbo.Data0017.SHELF_LIFE, Data0002_1.UNIT_NAME AS pr_unitname, data0071.QUAN_IN_INSP,'
       +'         Data0017.INV_PART_NUMBER, Data0071.tax_price, data0071.avl_flag,'
       +'         dbo.Data0071.rohs,Data0071.QUAN_ORD-Data0071.QUAN_RECD as Ç·»õÊýÁ¿,'
       +'0 as QUANTITY,'''' as LOCATION,'''' as SUPPLIER3,'''' as SUPPLIER2,'
       +'convert(char(10),getdate(),120) as manu_date,0 as LOCATION_PTR,0 as mark,0 as Rkey391,'''' as BARCODE_ID,0 as QUAN_ON_HAND,0 as rkey'
       +'   FROM dbo.Data0017 INNER JOIN'
       +'         dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Data0071.INVT_PTR INNER JOIN'
       +'         dbo.Data0002 ON'
       +'         dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
       +'         dbo.Data0002 Data0002_1 ON dbo.Data0071.WO_PTR = Data0002_1.RKEY'
       +'   where data0071.PO_ptr='+Inttostr(Dataset.FieldByName('RKEY').AsInteger);
  gSvrintf.IntfGetDataBySql(lsql,cdsDetail)
end;

procedure TfrmPoSearch_Mod564.ehMainDblClick(Sender: TObject);
var LsName:string;
    i,j:Integer;
begin
  inherited;
  if frmPOruku_Mod564 = nil then
  begin
    frmPOruku_Mod564 := TfrmPOruku_Mod564.Create(Self);
    btnRefreshClick(nil);
//    frmPOruku_Mod564.refresh:=getRefreshClick;
  end;
  frmPOruku_Mod564.GetData(cdsMain.FieldByName('rkey').AsString);
  frmPOruku_Mod564.LGRName:=frmPOruku_Mod564.update04('data0133',LsName);
  frmPOruku_Mod564.FEditType:=0;
  frmPOruku_Mod564.cds133.append;
  frmPOruku_Mod564.cds133.FieldByName('GRN_NUMBER').Value:=LsName;
  frmPOruku_Mod564.cds133.FieldByName('DELIVER_NUMBER').Value:='';
  frmPOruku_Mod564.cds133.FieldByName('warehouse_ptr').Value:=cdsMain.FieldByName('rkey15').Value;
  frmPOruku_Mod564.cds133.FieldByName('SUPP_PTR').Value:=cdsMain.FieldByName('rkey23').Value;
  frmPOruku_Mod564.cds133.FieldByName('currency_ptr').Value:=cdsMain.FieldByName('rkey01').Value;
  frmPOruku_Mod564.cds133.FieldByName('exch_rate').Value:=cdsMain.FieldByName('EXCHANGE_RATE').Value;
  frmPOruku_Mod564.cds133.FieldByName('PO_PTR').Value:=cdsMain.FieldByName('rkey').Value;
  frmPOruku_Mod564.cds133.FieldByName('TTYPE').Value:=1;
  frmPOruku_Mod564.cds133.FieldByName('CREATE_DATE').Value:=gFunc.GetSvrDateTime;
  frmPOruku_Mod564.cds133.FieldByName('CREATE_BY').Value:=gVar.rkey05;
  frmPOruku_Mod564.cds133.FieldByName('ship_DATE').Value:=gFunc.GetSvrDateTime;
  frmPOruku_Mod564.cds133.FieldByName('ship_BY').Value:='';
  frmPOruku_Mod564.cds133.FieldByName('REF_NUMBER').Value:='';
  frmPOruku_Mod564.cds133.FieldByName('idkey').Value := gFunc.CreateIDKey;
  frmPOruku_Mod564.cds133.FieldByName('PRINTED').Value := 'N';
  frmPOruku_Mod564.cds133.FieldByName('TSTATUS').Value := 0;
  frmPOruku_Mod564.cds133.Post;
  frmPOruku_Mod564.init;
  frmPOruku_Mod564.get_location;
  frmPOruku_Mod564.dtpReqDate.DateTime:=gFunc.GetSvrDateTime;
  frmPOruku_Mod564.CBloc.Visible:=False;
  i:=0;
  if not cdsDetail.IsEmpty then
  begin
    cdsDetail.First;
    while not cdsDetail.Eof do
    begin
      for j := 0 to frmPOruku_Mod564.str_list.Count -1 do
      begin
        if (cdsDetail.FieldByName(frmPOruku_Mod564.str_list.Values[frmPOruku_Mod564.StringGrid1.Cells[j,0]]).IsNull = False) then
          frmPOruku_Mod564.StringGrid1.Cells[j,i+1] := cdsDetail.FieldByName(frmPOruku_Mod564.str_list.Values[frmPOruku_Mod564.StringGrid1.Cells[j,0]]).Value;
      end;
      i:=i+1;
      frmPOruku_Mod564.StringGrid1.RowCount:=frmPOruku_Mod564.StringGrid1.RowCount+1;
      cdsDetail.Next;
    end;
  end;
  frmPOruku_Mod564.StringGrid1.RowCount:=frmPOruku_Mod564.StringGrid1.RowCount-1;
  frmPOruku_Mod564.Show;
end;

procedure TfrmPoSearch_Mod564.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPoSearch_Mod564 := nil;
end;

procedure TfrmPoSearch_Mod564.getdata;
begin
  FMainFrmSql := cdsMain.CommandText;

  FOrderby := ' order by data0070.rkey desc ';
  inherited;
end;

procedure TfrmPoSearch_Mod564.getRefreshClick(cds: TClientDataSet);
begin
  btnRefreshClick(nil);
end;

end.
