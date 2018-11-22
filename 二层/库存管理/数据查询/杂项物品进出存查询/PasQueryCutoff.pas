unit PasQueryCutoff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBGridEh, Menus, DB, ADODB;

type
  TfrmQueryCutoff = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn5: TBitBtn;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    PopupMenu2: TPopupMenu;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Sqlstr,strSQL:string;
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
    procedure item_click(Sender: TObject);
  public
    StartDate,EndDate:TDateTime;
    { Public declarations }
  end;

var
  frmQueryCutoff: TfrmQueryCutoff;

implementation

uses damo,common, PasQuery;

{$R *.dfm}
procedure TfrmQueryCutoff.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TfrmQueryCutoff.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmQueryCutoff.Button2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption);
end;

procedure TfrmQueryCutoff.BitBtn5Click(Sender: TObject);
begin
  PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmQueryCutoff.FormShow(Sender: TObject);
var i:integer;
    item:TMenuItem;
begin
  strSQL:=DM.AdoQry256.SQL.Text;

  DM.AdoQry256.Close;
  dm.AdoQry256.Parameters.ParamByName('CutoffDate').Value:=FormatDateTime('yyyy-MM-dd',dm.AdoQry255CutoffDate.AsDateTime);
  DM.AdoQry256.Open;

  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  Label3.Caption:=preColumn.Title.Caption;
  for i:=0 to DBGridEh1.FieldCount-1 do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=DBGridEh1.Columns[i].Title.Caption;
   if DBGridEh1.Columns[i].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   PopupMenu2.Items.Add(item);
  end;
end;

procedure TfrmQueryCutoff.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.AdoQry256.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.AdoQry256.Sort:=Column.FieldName+' DESC';
  end;
  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    Label3.Caption:=column.Title.Caption;
    Edit3.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else Edit3.SetFocus;
end;

procedure TfrmQueryCutoff.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(DM.AdoQry256.SQL.Text);
end;

procedure TfrmQueryCutoff.Edit3Change(Sender: TObject);
begin
  if Trim(Edit3.Text)<>'' then
    DM.AdoQry256.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit3.Text)+'%'''
  else
    DM.AdoQry256.Filter:='';
end;

procedure TfrmQueryCutoff.BitBtn1Click(Sender: TObject);
var
  i:integer;

begin
  if FrmQuery=nil then
   FrmQuery:=TFrmQuery.Create(Application);

  frmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  Sqlstr:='';
  if frmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
  {  strSQL:='SELECT     dbo.Data0235.goods_name, dbo.Data0235.goods_guige, dbo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0016.LOCATION AS 仓库位置,'
           +'                        dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME, dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.CODE,'
           +'                         dbo.Data0023.ABBR_NAME AS 供应商简称, dbo.Data0235.unit_price AS 含税价, dbo.Data0456.exch_rate AS 汇率, dbo.Data0001.CURR_CODE AS 货币,'
           +'                         dbo.Data0235.state_tax, ROUND(dbo.Data0235.unit_price / (1 + dbo.Data0235.state_tax * 0.01), 3) AS 不含税价, dbo.Data0456.ship_DATE,'
           +'                         dbo.Data0235.QUAN_ON_HAND AS 当前库存数量, ROUND(dbo.Data0235.QUAN_ON_HAND * dbo.Data0235.unit_price, 3) AS 总金额, dbo.Data0235.REF_NUMBER,'
           +'                         dbo.Data0070.PO_NUMBER,dbo.Data0256.CutoffDate,dbo.Data0256.Stock,ROUND(dbo.Data0256.Stock * dbo.Data0235.unit_price, 3) AS 截数金额'
           +'   FROM         dbo.Data0256 INNER JOIN'
           +'                         dbo.Data0235 ON dbo.Data0256.Rkey235 = dbo.Data0235.Rkey INNER JOIN'
           +'                         dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
           +'                         dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'
           +'                         dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'
           +'                         dbo.Data0001 ON dbo.Data0001.RKEY = dbo.Data0456.currency_ptr INNER JOIN'
           +'                         dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY INNER JOIN'
           +'                         dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN'
           +'                         dbo.data0002 on dbo.data0235.unit_ptr=dbo.data0002.Rkey'
           +'   WHERE  dbo.Data0256.CutoffDate =:CutoffDate';
 }
    Sqlstr:='';

    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      DM.AdoQry256.DisableControls;
      DM.AdoQry256.Close;
      DM.AdoQry256.SQL.Clear;
      DM.AdoQry256.SQL.Text:=strSQL+' '+Sqlstr+'';
      DM.AdoQry256.Parameters.ParamByName('CutoffDate').Value:=FormatDateTime('yyyy-MM-dd',dm.AdoQry255CutoffDate.AsDateTime);

      DM.AdoQry256.Prepared;
      DM.AdoQry256.Open;
    finally
      DM.AdoQry256.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

end.
