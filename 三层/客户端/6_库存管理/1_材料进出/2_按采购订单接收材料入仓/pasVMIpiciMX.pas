unit pasVMIpiciMX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,uBaseSinglePickListFrm,uLookupDM,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Datasnap.DBClient;

type
  Tfrm_VMIpiciMX = class(TfrmBaseEdit)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    ehMain: TDBGridEh;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
  public
    { Public declarations }
    procedure GetData();
  end;

var
  frm_VMIpiciMX: Tfrm_VMIpiciMX;

implementation

{$R *.dfm}

procedure Tfrm_VMIpiciMX.Button1Click(Sender: TObject);
begin
  inherited;
  modalresult:=mrok;
end;

procedure Tfrm_VMIpiciMX.Button2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrm_VMIpiciMX.cdsMainAfterScroll(DataSet: TDataSet);
var
  lsql:string;
begin
  inherited;
  if (ehMain.DataSource.DataSet.IsEmpty) then
  begin
    cdsDetail.Active:=False;
  end;
  lsql:='SELECT dbo.Data0134.RKEY as rkey134, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
       +'        dbo.Data0134.QUANTITY as QUANTITY2, Data0134.QUAN_ON_HAND as VMI_ON_HAND, data0134.inventory_ptr,'
       +'         dbo.Data0002.UNIT_NAME,dbo.Data0134.SOURCE_PTR, data0134.unit_ptr as LOCATION_PTR_FROM,'
       +'         dbo.Data0017.SHELF_LIFE, Data0017.INV_PART_NUMBER, data0017.STOCK_BASE,'
       +'         dbo.Data0134.rohs,dbo.Data0134.price,data0134.TAX_PRICE,data0134.MANU_DATE as TDATE,'
       +'         DATA0134.TAX_2,DATA0134.EXPIRE_DATE,DATA0134.SUPPLIER2 as spec_place,data0134.cust_decl,'
       +'         DATA0134.BARCODE_ID,data0016.location,0 as QUAN_RTNED_FM_FACT,data0134.LOCATION_PTR,0 as Rkey,Data0134.QUAN_ON_HAND as QUAN_ON_HAND2,0 as QUANTITY'
       +'   FROM dbo.Data0134 INNER JOIN'
       +'         dbo.data0016 on data0134.location_ptr=data0016.rkey inner join'
       +'         dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
       +'         dbo.Data0002 ON'
       +'         dbo.Data0134.UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN'
       +'           DATA0071 ON DATA0134.SOURCE_PTR=DATA0071.RKEY'
       +'   where data0134.quan_on_hand>0 and data0134.GRN_PTR='+inttostr(Dataset.FieldByName('RKEY').AsInteger);
  gSvrintf.IntfGetDataBySql(lsql,cdsDetail)
end;

procedure Tfrm_VMIpiciMX.Edit1Change(Sender: TObject);
var
  LFilter: string;
begin
  if VarType(cdsMain.Data) = varEmpty then Exit;
  LFilter := Trim(Edit1.Text);

  if FHotColumn = nil then
    FHotColumn := ehMain.Columns[0];
  if Trim(LFilter) = '' then
  begin
      cdsMain.Filter := '';
      cdsMain.Filtered := False;
  end else
  begin
    if FHotColumn.Field.DataType in [ftString, ftWideString, ftMemo] then
    begin
      cdsMain.Filter := FHotColumn.FieldName + ' like ' + QuotedStr('%' + LFilter + '%');
      cdsMain.Filtered := True;
    end;
    // else
//    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftLargeint, ftAutoInc] then
//    begin
//      if FFilter2 <> '' then
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + LFilter + ' and ' + FFilter2
//      else
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + LFilter;
//      cdsMain.Filtered := True;
//    end else
//    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
//    begin
//      if FFilter2 <> '' then
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + QuotedStr(LFilter) + ' and ' + FFilter2
//      else
//        cdsMain.Filter := FHotColumn.FieldName + ' >= ' + QuotedStr(LFilter);
//      cdsMain.Filtered := True;
//    end;
  end;
end;
//begin
//  inherited;
//  if (Trim(Edit1.Text)<>'') then
//  begin
//    cdsMain.Filter := 'GRN_NUMBER like ' + QuotedStr('%' + Trim(Edit1.Text) + '%') + '';
//  end else
//    cdsMain.Filter :='';
//end;

procedure Tfrm_VMIpiciMX.ehMainTitleClick(Column: TColumnEh);
var
  LOP: TIndexOptions;
begin
  inherited;
  if cdsMain.State = dsInactive then Exit;
  if not Column.Field.IsBlob then { 不能给大二进制字段建立索引或排序 }
  begin
    if column.Title.SortMarker =smDownEh then
    begin
     column.Title.SortMarker:=smUpEh;
     lop:=[];
    end else
    begin
     column.Title.SortMarker:=smDownEh;
     LOP := [ixDescending];
    end;
    cdsMain.IndexDefs.Update;
    if cdsMain.IndexDefs.IndexOf('MainDefIndex') >= 0 then
      cdsMain.DeleteIndex('MainDefIndex');
    cdsMain.AddIndex('MainDefIndex', Column.FieldName, LOP, '');
    cdsMain.IndexName := 'MainDefIndex';
  end;
  Label1.Caption := Column.Title.Caption;
  FHotColumn := Column;
  Edit1.Text:='';
end;

procedure Tfrm_VMIpiciMX.GetData;
var Lsql:string;
begin
  Lsql:=cdsMain.CommandText;
  gSvrIntf.IntfGetDataBySql(Lsql,cdsMain);
  FHotColumn := ehMain.Columns[0];
end;

end.
