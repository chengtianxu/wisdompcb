unit PoSearch_Mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
//  LgetRefreshClick=procedure (cds:TClientDataSet) of object;
  TfrmPoSearch_Mod33 = class(TfrmBaseMain)
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    cdsDetail2: TClientDataSet;
    dsDetail2: TDataSource;
    Lcds: TClientDataSet;
    procedure Button2Click(Sender: TObject);
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ehMainDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    stock_flag:string;//接收数量不能大于订购数量
//    refresh:LgetRefreshClick;
    { Public declarations }
    procedure GetData();override;
    procedure getRefreshClick(cds:TClientDataSet);
  end;

var
  frmPoSearch_Mod33: TfrmPoSearch_Mod33;

implementation

{$R *.dfm}

uses Mainfrm_Mod33, POruku_Mod33;

{ TfrmPoSearch_Mod33 }

procedure TfrmPoSearch_Mod33.Button2Click(Sender: TObject);
begin
  inherited;
  if frmMain_Mod33 = nil then
  begin
    frmMain_Mod33 := TfrmMain_Mod33.Create(Self);
  end;
  frmMain_Mod33 := TfrmMain_Mod33.Create(pnlMain,FModID);
end;

procedure TfrmPoSearch_Mod33.cdsMainAfterScroll(DataSet: TDataSet);
var
  lsql,lsql2:string;
begin
  inherited;
  if (ehMain.DataSource.DataSet.IsEmpty) then
  begin
    cdsDetail.Active:=False;
    cdsDetail2.Active:=False;
  end;
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

  lsql2:='SELECT Data0072.DESCRIPTION as goods_name,Data0072.GUI_GE as goods_guige,data0072.rkey as SOURCE_PTR,'
         +'       Data0072.DESCRIPTION2 as goods_type,Data0072.QUAN_ORD,Data0072.tax_price as unit_price,'
         +'       Data0072.STATE_TAX,Data0072.DEL_DATE,Data0072.rohs,'
         +'       Data0072.UNIT_PTR,Data0002.UNIT_NAME,data0072.QUANTITY_RECEIVED,'
         +'       Data0072.QUAN_ORD - Data0072.QUANTITY_RECEIVED AS 欠货数量, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'
         +'       dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,data0072.reason,'
       +'0 as QUAN_RECD,'''' as LOCATION,'''' as REF_NUMBER,0 as unit_ptr,'
       +'convert(char(10),getdate(),120) as DATE_RECD,0 as LOCATION_PTR,0 as mark,0 as QUAN_ON_HAND,0 as rkey'
         +' FROM dbo.Data0072 INNER JOIN'
         +'       dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN'
         +'       dbo.Data0068 LEFT OUTER JOIN'
         +'       dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN'
         +'       dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RIGHT OUTER JOIN'
         +'       dbo.Data0204 ON dbo.Data0068.RKEY = dbo.Data0204.PURCHASE_REQ_PTR ON dbo.Data0072.rkey204 = dbo.Data0204.RKEY'
         +' where data0072.POPTR='+inttostr(Dataset.FieldByName('RKEY').AsInteger);
  if DataSet.FieldByName('PO_TYPE').Value='S' then
  begin
    gSvrintf.IntfGetDataBySql(lsql,cdsDetail);
    DBGridEh2.Visible:=False;
    DBGridEh1.Visible:=True;
  end;
  if DataSet.FieldByName('PO_TYPE').Value='M' then
  begin
    gSvrintf.IntfGetDataBySql(lsql2,cdsDetail2);
    DBGridEh2.Visible:=True;
    DBGridEh1.Visible:=False;
  end;
end;

procedure TfrmPoSearch_Mod33.ehMainDblClick(Sender: TObject);
var LsName:string;
    i,j:Integer;
    Lsql28:string;
begin
  inherited;
  if frmPOruku_Mod33 = nil then
  begin
    frmPOruku_Mod33 := TfrmPOruku_Mod33.Create(Self);
    frmPOruku_Mod33.refresh:= getRefreshClick;
  end;
  frmPOruku_Mod33.stock_flag:=stock_flag;
  frmPOruku_Mod33.WindowState:= wsMaximized;
  frmPOruku_Mod33.GetData('0');
  frmPOruku_Mod33.LGRName:=frmPOruku_Mod33.update04('data0456',LsName);
  frmPOruku_Mod33.CBloc.Visible:=False;
  frmPOruku_Mod33.FEditType:=0;
  frmPOruku_Mod33.cds456.append;
  frmPOruku_Mod33.cds456.FieldByName('GRN_NUMBER').Value:=LsName;
  frmPOruku_Mod33.cds456.FieldByName('DELIVER_NUMBER').Value:='';
  frmPOruku_Mod33.cds456.FieldByName('warehouse_ptr').Value:=cdsMain.FieldByName('rkey15').Value;
  frmPOruku_Mod33.cds456.FieldByName('SUPP_PTR').Value:=cdsMain.FieldByName('rkey23').Value;
  frmPOruku_Mod33.cds456.FieldByName('currency_ptr').Value:=cdsMain.FieldByName('rkey01').Value;
  frmPOruku_Mod33.cds456.FieldByName('exch_rate').Value:=cdsMain.FieldByName('EXCHANGE_RATE').Value;
  frmPOruku_Mod33.cds456.FieldByName('PO_PTR').Value:=cdsMain.FieldByName('rkey').Value;
  if (cdsMain.FieldByName('PO_TYPE').Value='S') then
    frmPOruku_Mod33.cds456.FieldByName('TTYPE').Value:=1; //按PO生产物料入仓
  if (cdsMain.FieldByName('PO_TYPE').Value='M') then
    frmPOruku_Mod33.cds456.FieldByName('TTYPE').Value:=2;//非生产物料
  frmPOruku_Mod33.cds456.FieldByName('CREATE_DATE').Value:=gFunc.GetSvrDateTime;
  frmPOruku_Mod33.cds456.FieldByName('CREATE_BY').Value:=gVar.rkey05;
  frmPOruku_Mod33.cds456.FieldByName('ship_DATE').Value:=gFunc.GetSvrDateTime;
  frmPOruku_Mod33.cds456.FieldByName('ship_BY').Value:='';
  frmPOruku_Mod33.cds456.FieldByName('REF_NUMBER').Value:='';
  frmPOruku_Mod33.cds456.FieldByName('STATUS').Value:=1;
  frmPOruku_Mod33.cds456.FieldByName('idkey').Value := gFunc.CreateIDKey;
  if frmPOruku_Mod33.checkbox2.Checked then
    frmPOruku_Mod33.cds456.FieldByName('PRINTED').Value:='Y'
  else
    frmPOruku_Mod33.cds456.FieldByName('PRINTED').Value:='N';
  frmPOruku_Mod33.cds456.Post;
  frmPOruku_Mod33.get_location;
  frmPOruku_Mod33.dtpReqDate.DateTime:=gFunc.GetSvrDateTime;
  i:=0;
  if (cdsMain.FieldByName('PO_TYPE').Value='S') then
  begin
    frmPOruku_Mod33.if22or235:=22;
    frmPOruku_Mod33.init;
    frmPOruku_Mod33.StringGrid1.Visible:=True;
    frmPOruku_Mod33.StringGrid2.Visible:=False;
    frmPOruku_Mod33.Button2.Visible:=True;
    if not cdsDetail.IsEmpty then
    begin
      cdsDetail.First;
      while not cdsDetail.Eof do
      begin
        for j := 0 to frmPOruku_Mod33.str_list.Count -1 do
        begin
          if (cdsDetail.FieldByName(frmPOruku_Mod33.str_list.Values[frmPOruku_Mod33.StringGrid1.Cells[j,0]]).IsNull = False) then
            frmPOruku_Mod33.StringGrid1.Cells[j,i+1] := cdsDetail.FieldByName(frmPOruku_Mod33.str_list.Values[frmPOruku_Mod33.StringGrid1.Cells[j,0]]).Value;
        end;
        Lsql28:='select qte_price2 from data0028 where inventory_ptr = '
        + Trim(cdsDetail.FieldByName('INVT_PTR').AsString)
        +' and supplier_ptr='+cdsMain.FieldByName('rkey23').AsString;
        gSvrIntf.IntfGetDataBySql(Lsql28,Lcds);
        if not Lcds.IsEmpty then
        begin
          frmPOruku_Mod33.StringGrid1.Cells[frmPOruku_Mod33.str_list.IndexOfName('材料有效期'),i+1] := lcds.FieldByName('qte_price2').AsString;
        end;
        i:=i+1;
        frmPOruku_Mod33.StringGrid1.RowCount:=frmPOruku_Mod33.StringGrid1.RowCount+1;
        cdsDetail.Next;
      end;
    end;
    frmPOruku_Mod33.StringGrid1.RowCount:=frmPOruku_Mod33.StringGrid1.RowCount-1;
  end;
  if (cdsMain.FieldByName('PO_TYPE').Value='M') then
  begin
    frmPOruku_Mod33.if22or235:=235;
    frmPOruku_Mod33.init2;
    frmPOruku_Mod33.StringGrid1.Visible:=False;
    frmPOruku_Mod33.StringGrid2.Visible:=True;
    frmPOruku_Mod33.Button2.Visible:=False;
    if not cdsDetail2.IsEmpty then
    begin
      cdsDetail2.First;
      while not cdsDetail2.Eof do
      begin
        for j := 0 to frmPOruku_Mod33.str_list2.Count -1 do
        begin
          if (cdsDetail2.FieldByName(frmPOruku_Mod33.str_list2.Values[frmPOruku_Mod33.StringGrid2.Cells[j,0]]).IsNull = False) then
            frmPOruku_Mod33.StringGrid2.Cells[j,i+1] := cdsDetail2.FieldByName(frmPOruku_Mod33.str_list2.Values[frmPOruku_Mod33.StringGrid2.Cells[j,0]]).Value;
        end;
        i:=i+1;
        frmPOruku_Mod33.StringGrid2.RowCount:=frmPOruku_Mod33.StringGrid2.RowCount+1;
        cdsDetail2.Next;
      end;
    end;
    frmPOruku_Mod33.StringGrid2.RowCount:=frmPOruku_Mod33.StringGrid2.RowCount-1;
  end;
  if (frmPOruku_Mod33.CBloc.Visible) then frmPOruku_Mod33.CBloc.Visible:=False;
  if (frmPOruku_Mod33.ComboBox3.Visible) then frmPOruku_Mod33.ComboBox3.Visible:=False;
  frmPOruku_Mod33.Show;
end;

procedure TfrmPoSearch_Mod33.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPoSearch_Mod33 := nil;
end;

procedure TfrmPoSearch_Mod33.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;

  FOrderby := ' order by data0070.rkey desc ';
  inherited;
end;

procedure TfrmPoSearch_Mod33.getRefreshClick(cds: TClientDataSet);
begin
  btnRefreshClick(nil);
end;

end.
