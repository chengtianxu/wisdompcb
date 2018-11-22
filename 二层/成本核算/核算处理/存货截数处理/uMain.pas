unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Menus, DB,
  Buttons,DateUtils, ComCtrls, Spin, ADODB,ComObj, Excel2000,ClipBrd;

type
  TFrmMain = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N3: TMenuItem;
    N8: TMenuItem;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    vprev: TLabel;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Panel1: TPanel;
    N9: TMenuItem;
    N15: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const;caption_:string);
  private
   sys_sortdate:tdatetime;
   OldGridWnd : TWndMethod;
   vearly_ptrvalue,Number : integer;
   sWORK_ORDER_NUMBER: string;
   procedure NewGridWnd (var Message : TMessage);   
   procedure closing();
   function find_cutdate(cutdate:tdatetime):boolean;
   function find_451enddate(cutdate:tdatetime):boolean;
   function find_invtcount():boolean;
   function find_wipcount():boolean;
   function find_fgcount():boolean;
   function find_qtyreject():boolean;
   function if_instock():boolean;
   function find_specfgout():boolean;
   function find_489_48:boolean;//查找在线有内层分配记录，但没有过数记录的作业单
   function find_489_06:Boolean; //查找有内层分配记录，但作业单为待发放状态

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses uDM, ufrmClose, ProgressBar, uShowMat, uShowWIP,  uShowFG,
  wip_invt,common;

{$R *.dfm}
function TFrmMain.if_instock():boolean;
begin
   with dm.Qery do
    begin
     close;
     sql.Clear;
     sql.Add('select data0056.rkey from data0056');
     sql.Add('inner join data0006 on Data0056.WO_PTR = Data0006.RKEY');
     sql.Add('INNER JOIN Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY');
     sql.Add('where data0056.TO_BE_STOCKED<>0');
     open;
    end;
    if not dm.Qery.IsEmpty then
     if_instock:=true
    else if_instock:=false;
end;

procedure TFrmMain.NewGridWnd(var Message: TMessage);
var IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else OldGridWnd(Message);
end;

function TFrmMain.find_specfgout():boolean;
begin
with dm.Qery do
 begin
  close;
  sql.Text:='SELECT rkey FROM Data0053'+#13+
            'WHERE (QTY_ALLOC > 0)';
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

function TFrmMain.find_451enddate(cutdate:tdatetime):boolean;
begin
with dm.Qery do
 begin
  close;
  sql.Text:='select end_date from data0451'+#13+
  'where end_DATE='''+datetostr(cutdate)+'''';
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

function TFrmMain.find_invtcount():boolean;
begin
with dm.Qery do
 begin
  close;
  sql.Text:='select rkey from data0092'+#13+
  'where status=''0''';
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

function TFrmMain.find_wipcount():boolean;
begin
with dm.Qery do
 begin
  close;
  sql.Text:='select rkey from data0400'+#13+
  'where status=0';
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

function TFrmMain.find_fgcount():boolean;
begin
with dm.Qery do
 begin
  close;
  sql.Text:='select rkey from data0214'+#13+
  'where status=''0''';
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

function TFrmMain.find_qtyreject():boolean;
begin
with dm.Qery do
 begin
  close;
  sql.Text:='select rkey from data0549'+#13+
  'where Status=0';//生产报废返审核申请未处理
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

function TFrmMain.find_cutdate(cutdate: tdatetime): boolean;
begin
with dm.Qery do
 begin
  close;
  sql.Text:='select cut_date from data0444'+#13+
  'where CUT_DATE='''+datetostr(cutdate)+'''';
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

procedure TFrmMain.CopyDbDataToExcel(Args:array of const;caption_:string);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := caption_;
   Sheet := XLApp.Workbooks[1].WorkSheets[caption_];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
 if  dm.Conn.Connected then
 begin
  
  with dm.Qery do
   begin
    close;
    sql.Text:='select year(getdate()) as yearof';
    open;
   end;
  spinedit1.Value :=dm.qery.FieldValues['yearof'];
  SpinEdit1Change(sender);
  dm.Qery192.Open;
  dm.QeryDate.Open;
  self.sys_sortdate:=dm.QeryDatevd.Value;
 end;
end;

procedure TFrmMain.closing();
var vleng:currency;
begin
  try
   dm.Conn.BeginTrans;
   dm.DS444.Append ;

   dm.DS444CUT_DATE.Value:=frmclose.DateTimePicker1.Date;
   dm.DS444.FieldByName('matl_date').AsString:=StatusBar1.Panels[1].text;
   dm.DS444.FieldByName('wip_date').AsString:=StatusBar1.Panels[1].text;
   dm.DS444.FieldByName('sfg_date').AsString:=StatusBar1.Panels[1].text;
   dm.DS444.FieldByName('fg_date').AsString:=StatusBar1.Panels[1].text;

   dm.DS444.FieldByName('tdate').AsString := StatusBar1.Panels[1].text;

   dm.DS444.FieldByName('cut_by').AsString:=user_ptr;
   dm.DS444.FieldByName('early_ptr').AsInteger := vearly_ptrvalue;

   dm.DS444CLOSED.Value:='N';
   dm.DS444.Post ;

   Application.CreateForm(TFrmProgress, FrmProgress);
   FrmProgress.Show ;
   FrmProgress.Caption :='正在生成材料存货档案......';

   with dm.Qery445  do       //期末成本截数库存材料明细445
   begin
     Close;
     SQL.Text := 'insert into Data0445(d0444_ptr,d0022_ptr,invent_ptr,recd_date,quantity,unit_price, '+
                 'TAX_2,EXPIRE_DATE,day366,day365_271,day270_181,day180_91,day90_31,day30) '+
                 '( select   '+  dm.DS444RKEY.AsString +
                 '  ,data0022.rkey, data0022.inventory_ptr, data0456.ship_date as tdate,  '+
                 '  data0022.quan_on_hand+data0022.quan_in_insp as quantity,  '+
                 '  convert(float,data0022.tax_price*data0456.exch_rate/(1.0+data0022.tax_2*0.01)) as unit_price, '+
                 '  data0022.tax_2, data0022.EXPIRE_DATE ,  '+
                 '  case when (DATEDIFF(day,GETDATE(),data0022.EXPIRE_DATE ) > 365) '+
                 '  then (data0022.quan_on_hand+data0022.quan_in_insp) end as day366,'+
                 '  case when (DATEDIFF(day, GETDATE(),data0022.EXPIRE_DATE ) > 270) and '+
                 '  (DATEDIFF(day,GETDATE(),data0022.EXPIRE_DATE) <= 365) '+
                 '  then (data0022.quan_on_hand+data0022.quan_in_insp) end as day365_271, '+
                 '  case when (DATEDIFF(day, GETDATE(),data0022.EXPIRE_DATE) > 180) and  '+
                 '  (DATEDIFF(day, GETDATE(),data0022.EXPIRE_DATE) <= 270)  '+
                 '  then (data0022.quan_on_hand+data0022.quan_in_insp) end as day270_181,'+
                 '  case when (DATEDIFF(day,GETDATE(),data0022.EXPIRE_DATE) > 90) and '+
                 '  (DATEDIFF(day, GETDATE(),data0022.EXPIRE_DATE) <= 180) '+
                 '  then (data0022.quan_on_hand+data0022.quan_in_insp) end as day180_91,'+
                 '  case when (DATEDIFF(day,GETDATE(),data0022.EXPIRE_DATE) > 30) and '+
                 '  (DATEDIFF(day,GETDATE(),data0022.EXPIRE_DATE) <= 90) '+
                 '  then (data0022.quan_on_hand+data0022.quan_in_insp) end as day90_31, '+
                 '  case when (DATEDIFF(day,GETDATE(),data0022.EXPIRE_DATE ) <=30) '+
                 '  then (data0022.quan_on_hand+data0022.quan_in_insp) end as day30 '+
                 '  from data0022  inner join data0456  on data0022.grn_ptr=data0456.rkey '+
                 '  where data0022.quan_on_hand+data0022.quan_in_insp > 0)' ;
//     ShowMessage(SQL.Text);
     ExecSQL;
   end;
   FrmProgress.progressbar1.position:=2;

   FrmProgress.Caption :='正在生成在制品存货档案......';
   with dm.Qery448 do   //期末在制品存货明细:Data0448
   begin
     Close;
     SQL.Text := 'insert into data0448(d0444_ptr,work_order_number,flow_no,dept_ptr,step,manu_part_ptr,customer_ptr,'+
                 'quantity,so_no,cut_no,indate,wo_ptr,unit_sq,unit_price,PROD_STATUS) '+
                 ' (SELECT '+  dm.DS444RKEY.AsString +
                 '  ,dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0056.FLOW_NO, dbo.Data0056.DEPT_PTR, '+
                 '  dbo.Data0056.STEP, dbo.Data0006.BOM_PTR, Data0492.COMPLETED as CUSTOMER_PTR, '+
                 '  (dbo.Data0056.QTY_BACKLOG+dbo.Data0056.TO_BE_STOCKED) as quantity, dbo.data0492.SO_NO,'+
                 '   dbo.data0492.CUT_NO, dbo.Data0056.INTIME,dbo.Data0056.WO_PTR, '+
                 '   dbo.Data0025.unit_sq, dbo.Data0025.LATEST_PRICE, data0006.PROD_STATUS '+
                 '  FROM dbo.Data0056 INNER JOIN  '+
                 '     dbo.Data0006 ON dbo.Data0056.WO_PTR = dbo.Data0006.RKEY INNER JOIN  '+
                 '     dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY LEFT OUTER JOIN  '+
                 '     dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO)' ;
     ExecSQL;
   end;
   FrmProgress.progressbar1.position:=4;

   FrmProgress.Caption :='正在生成产成品存货档案......';
   with dm.Qery449 do    //  期末成本截数库存成品明细:Data0449
   begin
     Close;
     SQL.Text := ' insert into data0449(d0444_ptr,work_order_number,customer_part_ptr,customer_ptr,'+
                 ' whouse_ptr,location_ptr,quantity,indate,unit_price,rma_number,unit_sq,wo_ptr,d0053_ptr)'+
                 ' (SELECT TOP 100 PERCENT  '+  dm.DS444RKEY.AsString +
                 '  ,dbo.Data0006.WORK_ORDER_NUMBER,dbo.Data0053.CUST_PART_PTR,dbo.Data0025.CUSTOMER_PTR,  '+
                 '  dbo.Data0053.WHSE_PTR,dbo.Data0053.LOC_PTR,dbo.Data0053.QTY_ON_HAND,dbo.Data0053.MFG_DATE,'+
                 '  dbo.Data0025.LATEST_PRICE, dbo.Data0053.REFERENCE_NUMBER,'+
                 '  dbo.Data0025.unit_sq,dbo.Data0053.WORK_ORDER_PTR, dbo.Data0053.RKEY '+
                 '  FROM dbo.Data0053 INNER JOIN  '+
                 '       dbo.Data0025 ON  dbo.Data0053.CUST_PART_PTR = dbo.Data0025.RKEY LEFT OUTER JOIN'+
                 '       dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY '+
                 '  WHERE (dbo.Data0053.QTY_ON_HAND > 0)) ';
     ExecSQL;
   end;

   FrmProgress.progressbar1.position:=6;
   //2017-7-20注释修改
//   with dm.Qery445  do
//    begin
//     close ;
//     sql.Clear;
//     sql.Add('Select * from data0445 where rkey is null');
//     prepared;
//     open;
//    end;
////
//    dm.Qery445.open;
//    dm.SP22.Close;
//    dm.SP22.Open ;
//    FrmProgress.Caption :='正在生成材料存货档案......';
//    with dm.SP22 do
//    while not eof do
//    begin
//      dm.Qery445.Append ;
//      dm.Qery445.FieldByName('d0444_ptr').Value:=dm.DS444RKEY.Value;
//      dm.Qery445.FieldByName('d0022_ptr').Value:=dm.SP22.fieldbyname('rkey').Value;
//      dm.Qery445.FieldByName('invent_ptr').Value:=dm.SP22.fieldbyname('inventory_ptr').Value;
//      dm.Qery445.FieldByName('recd_date').asstring:=dm.SP22.fieldbyname('tdate').asstring;
//      dm.Qery445.FieldByName('quantity').Value:=dm.SP22.fieldbyname('quantity').Value;
//      dm.Qery445.FieldByName('unit_price').Value:=dm.SP22.fieldbyname('unit_price').Value;
//      dm.Qery445.FieldByName('TAX_2').Value:=dm.SP22.fieldbyname('TAX_2').Value;
//
//      If dm.SP22EXPIRE_DATE.Value > sys_sortdate+365 then
//       dm.Qery445.FieldByName('day366').Value:=dm.SP22.fieldbyname('quantity').Value
//      else
//       If dm.SP22EXPIRE_DATE.Value > sys_sortdate+270 then
//        dm.Qery445.FieldByName('day365_271').Value:=dm.SP22.fieldbyname('quantity').Value
//       else
//       If dm.SP22EXPIRE_DATE.Value> sys_sortdate+180 then
//        dm.Qery445.FieldByName('day270_181').Value:=dm.SP22.fieldbyname('quantity').Value
//       else
//        If dm.SP22EXPIRE_DATE.Value>sys_sortdate+90 then
//         dm.Qery445.FieldByName('day180_91').Value:=dm.SP22.fieldbyname('quantity').Value
//       else
//        If dm.SP22EXPIRE_DATE.Value>sys_sortdate+30 then
//         dm.Qery445.FieldByName('day90_31').Value:=dm.SP22.fieldbyname('quantity').Value
//        else
//         dm.Qery445.FieldByName('day30').Value:=dm.SP22.fieldbyname('quantity').Value;
//
//      dm.Qery445.Post;
//      next;
//      vleng:=int(recno/recordcount*125);
//      FrmProgress.progressbar1.position:=strtoint(floattostr(vleng));
//    end;
////
//    FrmProgress.Caption :='正在生成在制品存货档案......';
//    with dm.Qery448 do
//    begin
//      close ;
//      sql.Clear;
//      sql.Add('Select * from data0448 where rkey is null');
//      prepared;
//      open;
//    end;
//    dm.SP56.Close;
//    dm.SP56.Open ;
//    with dm.SP56 do
//    while not eof do
//     begin
//      dm.Qery448.Append ;
//      dm.Qery448.FieldByName('d0444_ptr').asinteger:=dm.DS444.fieldbyname('rkey').asinteger;
//      dm.Qery448.FieldByName('work_order_number').asstring:=dm.SP56.fieldbyname('work_order_number').asstring;
//      dm.Qery448.FieldByName('flow_no').asstring:=dm.SP56.fieldbyname('flow_no').asstring;
//      dm.Qery448.FieldByName('dept_ptr').asstring:=dm.SP56.fieldbyname('dept_ptr').asstring;
//      dm.Qery448.FieldByName('step').asstring:=dm.SP56.fieldbyname('step').asstring;
//      dm.Qery448.FieldByName('manu_part_ptr').asstring:=dm.SP56.fieldbyname('bom_ptr').asstring;
//      dm.Qery448.FieldByName('customer_ptr').asstring:=dm.SP56.fieldbyname('customer_ptr').asstring;
//      dm.Qery448.FieldByName('quantity').asInteger:=
//       dm.SP56.fieldbyname('qty_backlog').asInteger+ dm.SP56.fieldbyname('to_be_stocked').asInteger;
//      dm.Qery448.FieldByName('so_no').asstring:=dm.SP56.fieldbyname('so_no').asstring;
//      dm.Qery448.FieldByName('cut_no').asstring:=dm.SP56.fieldbyname('cut_no').asstring;
//      dm.Qery448.FieldByName('indate').asstring:=Datetostr(dm.SP56.fieldbyname('intime').asdatetime);
//      dm.Qery448.FieldValues['wo_ptr']:=dm.SP56WO_PTR.Value;
//      dm.Qery448.FieldValues['unit_sq']:=dm.SP56unit_sq.Value;
//      dm.Qery448.FieldByName('unit_price').asstring:=dm.SP56LATEST_PRICE.AsString;
//      dm.Qery448.FieldValues['PROD_STATUS']:=dm.SP56PROD_STATUS.Value; //当时的作业单状态
//      dm.Qery448.Post;
//      next;
//      vleng:=int(recno/recordcount*125)+125;
//      FrmProgress.progressbar1.position:=strtoint(floattostr(vleng));
//     end;
//
//    FrmProgress.Caption :='正在生成产成品存货档案......';
//    with dm.Qery449 do
//     begin
//      close ;
//      sql.Clear;
//      sql.Add('Select * from data0449 where rkey is null');
//      prepared;
//      open;
//     end;
//    dm.SP53.Close;
//    dm.SP53.Open ;
//    with dm.SP53 do
//    while not eof do
//    begin
//      dm.Qery449.Append ;
//      dm.Qery449.FieldByName('d0444_ptr').asinteger:=dm.DS444.fieldbyname('rkey').asinteger;
//      dm.Qery449.FieldByName('work_order_number').asstring:=dm.SP53.fieldbyname('work_order_number').asstring;
//      dm.Qery449.FieldByName('customer_part_ptr').asstring:=dm.SP53.fieldbyname('cust_part_ptr').asstring;
//      dm.Qery449.FieldByName('customer_ptr').asstring:=dm.SP53.fieldbyname('customer_ptr').asstring;
//      dm.Qery449.FieldByName('whouse_ptr').asstring:=dm.SP53.fieldbyname('whse_ptr').asstring;
//      dm.Qery449.FieldByName('location_ptr').asstring:=dm.SP53.fieldbyname('loc_ptr').asstring;
//      dm.Qery449.FieldByName('quantity').asstring:=dm.SP53.fieldbyname('qty_on_hand').asstring;
//      dm.Qery449.FieldByName('indate').asstring:=dm.SP53.fieldbyname('mfg_date').asstring;
//      dm.Qery449.FieldByName('unit_price').asstring:=dm.SP53.fieldbyname('latest_price').asstring;
//      dm.Qery449.FieldByName('rma_number').asstring:=dm.SP53.fieldbyname('REFERENCE_NUMBER').asstring;
//      dm.Qery449.FieldValues['unit_sq']:=dm.SP53unit_sq.Value;
//      dm.Qery449.FieldValues['wo_ptr']:=dm.SP53WORK_ORDER_PTR.AsVariant;
//      dm.Qery449.FieldValues['d0053_ptr']:=dm.sp53rkey.value;
//      dm.Qery449.Post;
//      next;
//      vleng:=int(recno/recordcount*125)+375;
//      FrmProgress.progressbar1.position:=strtoint(floattostr(vleng));
//    end;

//    with dm.adoupdate do
//    begin
//     close;
//     Parameters.ParamValues['@rkey444']:=dm.DS444RKEY.Value;
//     ExecProc;
//    end;
    FrmProgress.Caption :='正在更新在制品448存货档案......';
    with dm.Qery do
    begin
      close;
      sql.Text:='update data0448'+#13+
      'set Data0448.STD_MATL_COST_PER_PCS= Data0460.TOT_ACCU_MATL_PER_SQFT * Data0448.unit_sq,'+#13+
      ' Data0448.STD_OVHD_COST_PER_PCS=  Data0460.TOT_ACCU_OVHD_PER_SQFT * Data0448.unit_sq'+#13+
      'FROM dbo.Data0460 RIGHT OUTER JOIN'+#13+
      ' Data0448 ON dbo.Data0460.BOM_PTR = Data0448.MANU_PART_PTR AND'+#13+
      ' Data0460.DEPT_PTR = Data0448.DEPT_PTR AND'+#13+
      ' Data0460.STEP = Data0448.STEP'+#13+
      'WHERE Data0448.D0444_PTR = '+dm.DS444RKEY.AsString;
      ExecSQL;
    end;
    FrmProgress.progressbar1.position:=8;

    FrmProgress.Caption :='正在更新成品449存货档案......';
    with dm.Qery do
    begin
     close;
     sql.Text:='update data0449'+#13+
    'set Data0449.STD_MATL_COST_PER_PCS= Data0025.tot_accu_matl_per_sqft * Data0449.unit_sq,'+#13+
    ' Data0449.STD_OVHD_COST_PER_PCS=Data0025.tot_accu_OVHD_per_sqft * Data0449.unit_sq'+#13+
    'FROM dbo.Data0449 INNER JOIN'+#13+
    'dbo.Data0025 ON'+#13+
    ' dbo.Data0449.CUSTOMER_PART_PTR = dbo.Data0025.rkey'+#13+
    'WHERE dbo.Data0449.D0444_PTR = '+dm.DS444RKEY.AsString;
     execsql;
    end;
    FrmProgress.progressbar1.position:=9;

    FrmProgress.Caption :='正在更新材料444存货档案......';
    with dm.Qery do
    begin
     close;
     sql.Text:='update data0444'+#13+
     'set Data0444.MATL_CST_IN_STOCK_CLOSED=d1.MATL_COST'+#13+
     'FROM Data0444 INNER JOIN'+#13+
      '(SELECT Data0445.D0444_PTR,'+#13+
      'SUM(Data0445.QUANTITY * Data0445.unit_price) AS MATL_COST'+#13+
             'FROM data0445'+#13+
           'where data0445.d0444_ptr='+dm.DS444RKEY.AsString+#13+
            'GROUP BY Data0445.D0444_PTR) d1 ON'+#13+
          'Data0444.RKEY = d1.D0444_PTR'+#13+
          'where data0444.rkey='+dm.DS444RKEY.AsString;
     ExecSQL;
    end;
    FrmProgress.progressbar1.position:=10;
    FrmProgress.free ;
    dm.Conn.CommitTrans;
    messagedlg('已经正确生成'+datetostr(strtodatetime(StatusBar1.Panels[1].text))+'的存货档案！',mtinformation,[mbok],0);
  except
    on E: Exception do
     begin
      dm.Conn.RollbackTrans;
      showmessage(E.Message);
      exit;
     end;
  end;
end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
begin
  dm.QeryDate.Close ;
  dm.QeryDate.Open ;
  self.StatusBar1.Panels[1].Text :=
   formatdatetime('yyyy-mm-dd HH:mm:ss',dm.QeryDatevdt.Value);
end;

function TFrmMain.find_489_48: boolean;
begin
  Number:=0;
  sWORK_ORDER_NUMBER:='';
  with dm.Qery do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT DISTINCT Data0006.WORK_ORDER_NUMBER FROM Data0056');
    sql.Add('INNER JOIN Data0006 ON Data0056.WO_PTR=Data0006.RKEY');
    sql.Add('INNER JOIN Data0489 ON Data0006.RKEY=Data0489.WO_PTR');
    sql.Add('WHERE Data0006.PROD_STATUS=3 AND NOT EXISTS(SELECT 1 FROM Data0048 WHERE Data0048.WO_PTR=Data0006.RKEY)');   //PROD_STATUS=3生产中
    open;
    Number:= RecordCount;
    First;
    while not Eof do
    begin
      if sWORK_ORDER_NUMBER='' then
        sWORK_ORDER_NUMBER:= FieldByName('WORK_ORDER_NUMBER').AsString
      else
        sWORK_ORDER_NUMBER:=sWORK_ORDER_NUMBER+#13+FieldByName('WORK_ORDER_NUMBER').AsString;
      Next;
    end;
    if isempty then
     result:=false
    else
     result:=true;
  end;
end;

function TFrmMain.find_489_06: Boolean;
begin
  Number:=0;
  sWORK_ORDER_NUMBER:='';
  with dm.Qery do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT DISTINCT Data0006.WORK_ORDER_NUMBER FROM Data0006');
    sql.Add('INNER JOIN Data0489 ON Data0006.RKEY=Data0489.WO_PTR');
    sql.Add('WHERE Data0006.PROD_STATUS=2 ');   //PROD_STATUS=2待发放
    open;
    Number:= RecordCount;
    First;
    while not Eof do
    begin
      if sWORK_ORDER_NUMBER='' then
        sWORK_ORDER_NUMBER:= FieldByName('WORK_ORDER_NUMBER').AsString
      else
        sWORK_ORDER_NUMBER:=sWORK_ORDER_NUMBER+#13+FieldByName('WORK_ORDER_NUMBER').AsString;
      Next;
    end;
    if isempty then
     result:=false
    else
     result:=true;
  end;
end;

procedure TFrmMain.N2Click(Sender: TObject);//截数处理
begin
  if self.find_specfgout then
    messagedlg('成品仓特殊出仓,但尚未完成审核的成品!',mterror,[mbcancel],0)
  else
  if self.if_instock then
    messagedlg('成品仓有等待过数入仓,但尚未完成审核的成品!',mterror,[mbcancel],0)
  else
  if self.find_invtcount then
    messagedlg('对不起原材料盘点未结束不能截数!',mterror,[mbcancel],0)
  else
  if self.find_wipcount then
    messagedlg('对不起在制盘点未结束不能截数!',mterror,[mbcancel],0)
  else
  if self.find_fgcount then
    messagedlg('对不起产成盘点未结束不能截数!',mterror,[mbcancel],0)
  else
  if find_qtyreject then
    messagedlg('对不起在线产品有报废返审申请但未处理完成不能截数!',mterror,[mbcancel],0)
  else
  if find_489_06 then
    messagedlg(Format('对不起内层分配有记录但作业单未能发放到产线不能截数！'+#13+#13+'%d个作业单号:'+#13+'%s',[Number,sWORK_ORDER_NUMBER])
                ,mterror,[mbcancel],0)
  else
  if find_489_48 then
    messagedlg(Format('对不起在线产品存在有内层分配记录但无过数记录的情况不能截数！'+#13+#13+'%d个作业单号:'+#13+'%s',[Number,sWORK_ORDER_NUMBER])
                ,mterror,[mbcancel],0)
  else
  try
    Application.CreateForm(TfrmClose, frmClose);
    if frmClose.ShowModal=mrok then
      if self.find_cutdate(frmclose.DateTimePicker1.Date) then
        messagedlg('对不起,截数日期已经存在!',mterror,[mbcancel],0)
      else
      begin
       vearly_ptrvalue := frmClose.early_ptrvalue ;
       closing();
      end;
    frmClose.Free ;
  except
    on E: Exception do
    begin
      showmessage(E.Message);
      exit;
    end;
  end;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
   
 with dm.Qery445 do        //原材料
  begin
   close ;
   LockType:=ltReadOnly;
   sql.Clear;
   sql.Add('SELECT TOP 100 PERCENT dbo.Data0445.RKEY, dbo.Data0017.INV_PART_NUMBER,');
   sql.Add('dbo.Data0022.BARCODE_ID, dbo.Data0017.INV_PART_DESCRIPTION,');
   sql.Add('dbo.Data0002.UNIT_CODE, dbo.Data0445.RECD_DATE, dbo.Data0445.QUANTITY,');
   sql.Add('ROUND(dbo.Data0445.UNIT_PRICE, 4) AS unit_price, dbo.Data0022.EXPIRE_DATE,');
   sql.Add('dbo.Data0016.LOCATION');
   sql.Add('FROM dbo.Data0445 INNER JOIN');
   sql.Add('dbo.Data0022 ON dbo.Data0445.D0022_PTR = dbo.Data0022.RKEY INNER JOIN');
   sql.Add('dbo.Data0017 ON dbo.Data0445.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN');
   sql.Add('dbo.Data0002 ON');
   sql.Add('dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN');
   sql.Add('dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY');
   sql.Add('where data0445.d0444_ptr='+ dm.DS444.fieldbyname('rkey').AsString);
   sql.Add(' order by data0017.inv_part_number');
   prepared;
   open;
  end;
 Application.CreateForm(TfrmshowMat, frmshowMat);
 frmshowMat.showmodal;
 dm.Qery445.Close;
 dm.Qery445.LockType:=ltOptimistic;
 frmshowMat.Free ;
end;
//在制品
procedure TFrmMain.N5Click(Sender: TObject);
begin
 with dm.Qery448 do
  begin
   close ;
   LockType:=ltReadOnly;
   sql.Clear;
   sql.Add('SELECT TOP 100 PERCENT dbo.Data0448.RKEY,dbo.Data0025.MANU_PART_NUMBER,');
   sql.Add('dbo.Data0025.MANU_PART_DESC,Data0034.DEPT_NAME,');
   sql.Add('dbo.Data0448.WORK_ORDER_NUMBER, dbo.Data0010.CUST_CODE, Data0034.DEPT_CODE,');
   sql.Add('dbo.Data0448.STEP,dbo.Data0448.SO_NO, dbo.Data0448.CUT_NO, dbo.Data0448.QUANTITY,');
   sql.Add('dbo.Data0448.INDATE');
   sql.Add('FROM dbo.Data0448 INNER JOIN');
   sql.Add('dbo.Data0025 ON');
   sql.Add('dbo.Data0448.MANU_PART_PTR = dbo.Data0025.RKEY INNER JOIN');
   sql.Add('dbo.Data0010 ON dbo.Data0448.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN');
   sql.Add('dbo.Data0034 ON dbo.Data0448.DEPT_PTR = dbo.Data0034.RKEY');
   sql.Add('where data0448.d0444_ptr='+dm.DS444.fieldbyname('rkey').asstring);
   sql.Add('ORDER BY Data0034.DEPT_CODE, dbo.Data0025.manu_PART_NUMBER, dbo.Data0448.WORK_ORDER_NUMBER');
   prepared;
   open;
  end;
 Application.CreateForm(TfrmshowWIP, frmshowWIP);
 frmshowWIP.showmodal;
 dm.Qery448.Close;
 dm.Qery448.LockType:=ltOptimistic;
 frmshowWIP.Free ;
end;

procedure TFrmMain.N6Click(Sender: TObject);   //产成品
begin
 with dm.Qery449  do
  begin
   close ;
   LockType:=ltReadOnly;   
   sql.Clear;
   sql.Add('SELECT TOP 100 PERCENT Data0449.RKEY, Data0449.WORK_ORDER_NUMBER,');
   sql.Add('Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,');
   sql.Add('Data0010.CUST_CODE, Data0449.QUANTITY, data0449.INDATE,');
   sql.Add('Data0016.LOCATION');
   sql.Add('FROM Data0449 INNER JOIN');
   sql.Add('Data0025 ON');
   sql.Add('Data0449.CUSTOMER_PART_PTR = Data0025.RKEY INNER JOIN');
   sql.Add('Data0010 ON Data0449.CUSTOMER_PTR = Data0010.RKEY INNER JOIN');
   sql.Add('Data0016 ON Data0449.LOCATION_PTR = Data0016.RKEY');

   sql.Add('where data0449.d0444_ptr='+dm.DS444.fieldbyname('rkey').asstring);
   sql.Add('order by data0025.manu_part_number,data0449.work_order_number');
   prepared;
   open;
  end;

 Application.CreateForm(TfrmshowFG, frmshowFG);
 frmshowFG.showmodal;
 dm.Qery449.Close;
 dm.Qery449.LockType:=ltOptimistic;
 frmshowFG.Free ;
end;
//删除档案
procedure TFrmMain.N3Click(Sender: TObject);
begin
if not self.find_451enddate(dm.DS444CUT_DATE.Value) then
 if messagedlg('确认要删除'+dm.DS444.fieldbyname('cut_date').asstring+'的存货档案吗？',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  begin
   dm.Conn.BeginTrans ;
  try
   dm.DS444.delete ;
   dm.Conn.CommitTrans;
   messagedlg('删除操作成功!',mtinformation,[mbok],0);
  except
   on E: Exception do
   begin
    dm.Conn.RollbackTrans;
    messagedlg(E.Message ,mtinformation,[mbok],0);
   end;
  end;
  end
 else
else messagedlg('无法删除已经参与期间核算还未进行订单核算的记录',mterror,[mbcancel],0);
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
 if dm.DS444.RecordCount=0 then
 begin
   N1.Enabled :=False;
 end
 else
 begin
   N1.Enabled := True;
 end;
 if dm.DS444CLOSED.Value ='N' then
 begin
  n3.Enabled:=true;
//  n10.Enabled:=true;
  n9.Enabled:=true;
 end
 else begin

  n3.Enabled:=false;
//  n10.Enabled:=false;
  n9.Enabled:=false;
 end;
//  if dm.DS444CLOSED.Value ='Y' then     //2017-7-20改
// begin
//     n3.Enabled:=false;
//  n10.Enabled:=false;
//  n9.Enabled:=false;
// end
// else begin
//    n3.Enabled:=true;
//  n10.Enabled:=true;
//  n9.Enabled:=true;
//
// end;

end;


procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.SpinEdit1Change(Sender: TObject);
begin
 dm.DS444.Close;
 dm.DS444.Parameters.ParamByName('vy').Value :=SpinEdit1.Value;
 dm.DS444.Open ;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.Conn) then
  begin
    ShowMsg('程序启动失败，请与系统管理员联系！','提示',1);
    application.Terminate;
  end; 
  self.Caption :=Application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TFrmMain.N9Click(Sender: TObject);
begin
 if dm.DS444.RecordCount=0 then Exit;
 if not self.find_451enddate(dm.DS444CUT_DATE.Value) then
 begin
   form_wipinvt:=tform_wipinvt.Create(application);
   dm.AD462.Close;
   dm.AD462.Parameters[0].Value:=dm.DS444RKEY.Value;
   dm.AD462.Open;
   dm.AD462.Filter:='';
   Form_wipinvt.ShowModal;
   dm.AD462.Close;
   form_wipinvt.Free;
 end
 else messagedlg('无法修改已经参与期间核算还未进行订单核算的记录！',mterror,[mbcancel],0);
end;

procedure TFrmMain.N15Click(Sender: TObject);
begin
 form_wipinvt:=tform_wipinvt.Create(application);
 dm.AD462.Close;
 dm.AD462.Parameters[0].Value:=dm.DS444RKEY.Value;
 dm.AD462.Open;
 dm.AD462.Filter:='';
 Form_wipinvt.DBGridEh1.PopupMenu:=nil;
 Form_wipinvt.ShowModal;
 dm.AD462.Close;
 form_wipinvt.Free;
end;

end.
