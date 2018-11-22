unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, ExtCtrls, StdCtrls, ComCtrls,ComObj, Excel2000,ClipBrd,
  Menus, Buttons,DateUtils, DBGridEh;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    aq415: TADOQuery;
    DataSource1: TDataSource;
    aq415number: TStringField;
    aq415sys_date: TDateTimeField;
    aq415EMPLOYEE_NAME: TStringField;
    aq415QUANTITY: TIntegerField;
    aq415WORK_ORDER_NUMBER: TStringField;
    aq415CUST_CODE: TStringField;
    aq415WAREHOUSE_CODE: TStringField;
    aq415weight: TFloatField;
    aq415mianji: TFloatField;
    aq415type: TWordField;
    aq415status: TWordField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    ADOQuery1: TADOQuery;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    aq415MANU_PART_NUMBER: TStringField;
    aq415MANU_PART_DESC: TStringField;
    aq415CODE: TStringField;
    aq415LOCATION: TStringField;
    aq415reference: TStringField;
    aq415ABBR_NAME: TStringField;
    RadioGroup2: TRadioGroup;
    aq415mianji_1: TFloatField;
    aq415RMA_NUMBER: TStringField;
    Button3: TButton;
    DBGridEh1: TDBGridEh;
    aq415chengben: TFloatField;
    aq415Jechengben: TFloatField;
    aq415SAMPLE_NR: TStringField;
    aq415CUSTOMER_NAME: TStringField;
    aq415ABBR_NAME10: TStringField;
    aq415DSDesigner: TStringField;
    aq415DSDesigner2: TStringField;
    aq415SALES_ORDER: TStringField;
    aq415LATEST_PRICE: TFloatField;
    aq415amount: TFloatField;
    aq415bzchengben: TFloatField;
    aq415bzjechengben: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure item_Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    strSQL,Sqlstr:string;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    OldGridWnd : TWndMethod;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
 uses common, PasQuery;
{$R *.dfm}
procedure TForm1.item_click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if ADOConnection1.Connected then
    begin
      ShowMessage('程序在开发模式下运行，请在发布前关闭连接后编译！');
      rkey73 := '1';
      vprev := '4' ;
    end
  else
    if not app_init_2(ADOConnection1) then
      begin
        showmsg('程序起动失败请联系管理员!',1);
        application.Terminate;
      end;
  Caption:=application.Title;

// rkey73:='1752';
// user_ptr := '1752';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(aq415.SQL.Text);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    AQ415.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
  else
    AQ415.Filter:='';
  if aq415.IsEmpty then
   button2.Enabled:=false
  else
   button2.Enabled:=true;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  item:TMenuItem;
  i:Byte;
begin
  aq415.Close;
  aq415.Parameters.ParamByName('dtpk1').Value:=StrToDateTime(DateToStr(Now-1)+' 0:00:00');;
  aq415.Parameters.ParamByName('dtpk2').Value:=StrToDateTime(DateToStr(Now)+' 23:59:59');
  aq415.Open;

  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  Label1.Caption:=preColumn.Title.Caption;
  for i:=0 to DBGridEh1.FieldCount-1 do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=DBGridEh1.Columns[i].Title.Caption;
   if DBGridEh1.Columns[i].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   PopupMenu1.Items.Add(item);
  end;
  FrmQuery.iItem:=0;
  FrmQuery.iTrem:=0;
  FrmQuery.RadioGroup2.ItemIndex:=0;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
var
   i:Integer;
begin
 for i:=0 to DBGridEh1.FieldCount-1 do
  if RadioGroup2.ItemIndex=0 then     //不含板边
   if DBGridEh1.Columns[i].FieldName='mianji_1' then
    DBGridEh1.Columns[i].FieldName:='mianji'
   else
  else                                //含板边
   if DBGridEh1.Columns[i].FieldName='mianji' then
    DBGridEh1.Columns[i].FieldName:='mianji_1'
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j:integer;
    strText,sTemp:string;
    tmpAdo:TADOQuery;
    Date1,Date2:TDateTime;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  if StartDate > 100 then
    frmQuery.DTPk1.Date:= StartDate
  else
    frmQuery.DTPk1.Date:=now-7;
  if EndDate > 100 then
    frmQuery.DTPk2.Date:= EndDate
  else
    frmQuery.DTPk2.Date:=Now;
  frmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  Sqlstr:='';
  if frmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    strSQL:='SELECT data0415.number,data0415.sys_date,case data0415.status when 1 then '+#39+'待提交'+#39+' when 2 then '+#39+'待出仓'+#39+' when 3 then '+#39+'已出仓'+#39+' when 4 then '+#39+'已检视'+#39+''
            +'         when 5 then '+#39+'被退回'+#39+' else '+#39+'其他'+#39+' end  as 状态, '
            +'         case data0415.type when 1 then '+#39+'直接出仓'+#39+'when 2 then '+#39+'委外退货'+#39+' when 3 then '+#39+'退货重检'+#39+'when 4 then '+#39+'正常重检'+#39+'else '+#39+'其他'+#39+' end  as 出仓类型,'
            +'         Data0005.EMPLOYEE_NAME,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0025.SAMPLE_NR,'
            +'         Data0465.QUANTITY,Data0006.WORK_ORDER_NUMBER,Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,Data0010.ABBR_NAME as ABBR_NAME10,'
            +'         Data0015.WAREHOUSE_CODE,case when data0416.so_ptr is null then Data0025.LATEST_PRICE else data0060.PARTS_ALLOC/data0060.EXCH_RATE end as LATEST_PRICE,data0060.SALES_ORDER,'
            +'         case when data0416.so_ptr is null then Data0465.QUANTITY * Data0025.LATEST_PRICE else Data0465.QUANTITY *(data0060.PARTS_ALLOC/data0060.EXCH_RATE) end AS amount,'
            +'         Data0465.QUANTITY * Data0025.REPORT_UNIT_VALUE1 / 1000 AS weight,'
            +'         ROUND(Data0465.QUANTITY * Data0025.unit_sq, 4) AS mianji,'
            +'         data0415.type,data0415.status,Data0016.CODE,'
            +'         Data0016.LOCATION,data0415.reference,Data0023.ABBR_NAME, '
            +'                        CASE WHEN data0053.work_order_ptr > 0 THEN '
            +'  ROUND(Data0465.QUANTITY * Data0006.panel_ln * Data0006.panel_wd * 0.000001 / Data0006.PARTS_PER_PANEL, '
            +'                        4) ELSE ROUND(dbo.Data0465.QUANTITY * dbo.Data0025.unit_sq, 4) END AS mianji_1,Data0098.RMA_NUMBER, '
            +'    data0053.cost_pcs+data0053.matl_ovhd_pcs+data0053.OVHD_COST+data0053.PLANNED_QTY+data0053.ovhd1_pcs+data0053.outsource_pcs as chengben,'
            +'    ROUND(Data0465.QUANTITY *(data0053.cost_pcs+data0053.matl_ovhd_pcs+data0053.OVHD_COST+data0053.PLANNED_QTY+data0053.ovhd1_pcs+data0053.outsource_pcs),6) as Jechengben,'
            +' (ISNULL(dbo.Data0025.tot_accu_matl_per_sqft, 0) + ISNULL(dbo.Data0025.tot_accu_OVHD_per_sqft, 0))* dbo.Data0025.unit_sq AS bzchengben,'
            +'ROUND(dbo.Data0465.QUANTITY * ((ISNULL(dbo.Data0025.tot_accu_matl_per_sqft, 0)+ ISNULL(dbo.Data0025.tot_accu_OVHD_per_sqft, 0)) * dbo.Data0025.unit_sq), 6) AS bzjechengben'
            +'  FROM         dbo.Data0465 INNER JOIN '
            +'                        dbo.data0415 ON dbo.Data0465.heard_ptr = dbo.data0415.rkey  LEFT OUTER JOIN'
            +'                        dbo.Data0098 ON dbo.data0415.rma_ptr = dbo.Data0098.RKEY INNER JOIN '
            +'                        dbo.Data0005 ON dbo.data0415.empl_ptr = dbo.Data0005.RKEY INNER JOIN '
            +'                        dbo.Data0025 ON dbo.data0415.custpart_ptr = dbo.Data0025.RKEY INNER JOIN '
            +'                        dbo.Data0053 ON dbo.Data0465.D0053_PTR = dbo.Data0053.RKEY INNER JOIN '
            +'                        dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY INNER JOIN '
            +'                        dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY INNER JOIN '
            +'                        dbo.data0416 ON dbo.Data0053.NPAD_PTR = dbo.data0416.rkey INNER JOIN '
            +'                        dbo.Data0010 ON dbo.data0415.customer_ptr = dbo.Data0010.RKEY LEFT OUTER JOIN '
            +'                        dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY LEFT OUTER JOIN '
            +'                        dbo.Data0060 ON dbo.data0416.so_ptr = dbo.Data0060.RKEY LEFT OUTER JOIN '
            +'                        dbo.Data0023 ON dbo.Data0060.supplier_ptr = dbo.Data0023.RKEY '
            +'  where data0415.sys_date >= :dtpk1 and data0415.sys_date <= :dtpk2';
    Sqlstr:='';
    Date1:=StrToDateTime(datetostr(FrmQuery.DTPk1.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTtm1.Time));
    Date2:=StrToDateTime(datetostr(FrmQuery.DTPk2.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTtm2.Time));
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      aq415.DisableControls;
      aq415.Close;
      aq415.SQL.Clear;
      aq415.SQL.Text:=strSQL+' '+Sqlstr+' order by data0415.number select getdate()';
      aq415.Parameters.ParamByName('dtpk1').Value:=Date1;
      aq415.Parameters.ParamByName('dtpk2').Value:=Date2;
      StartDate:=FrmQuery.DTPk1.Date;
      EndDate:=FrmQuery.DTPk2.Date;
      aq415.Prepared;
//      ShowMessage(aq415.SQL.Text);
      aq415.Open;
    finally
      aq415.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    aq415.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    aq415.Sort:=Column.FieldName+' DESC';
  end;
  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(aq415.SQL.Text);
end;

end.
