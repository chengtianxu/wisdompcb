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
    N10: TMenuItem;
    N14: TMenuItem;
    N13: TMenuItem;
    N11: TMenuItem;
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
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const;caption_:string);
  private
   sys_sortdate:tdatetime;
   OldGridWnd : TWndMethod;
   vearly_ptrvalue : integer;
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
//     sql.Add('select data0056.rkey from data0056');
//     sql.Add('inner join data0006 on Data0056.WO_PTR = Data0006.RKEY');
//     sql.Add('INNER JOIN Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY');
//     sql.Add('where data0056.TO_BE_STOCKED<>0');
     sql.Add('select * from Data0492 where ORD_REQ_QTY<>0');
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
  SQL.Clear;
//  sql.Text:='SELECT rkey FROM Data0053'+#13+
//            'WHERE (QTY_ALLOC > 0)';
  SQL.Text:='select * from wzcp0060 where status in(1,2,5)';
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
  sql.Text:='select rkey from data0058'+#13+
  'where qty_reject=0 and ttype=0';//生产报废是否审核
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
var vleng: currency;
 rkey444: Integer;
begin
 try
  dm.Conn.BeginTrans;
  if not dm.DS444.Active then dm.DS444.Open;
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
   rkey444:= dm.DS444.fieldbyname('rkey').asinteger;
   
//    FrmProgress.Caption :='正在生成材料存货档案......';
    with dm.Qery445  do
    begin
     close ;
     sql.Clear;
     sql.Add('Select * from data0445 where rkey is null');
     prepared;
     open;
    end;
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert data0445(D0444_PTR,D0022_PTR,INVENT_PTR,RECD_DATE,QUANTITY,UNIT_PRICE,tax_2) ');
      SQL.Add('select :rkey444 ,data0022.rkey,data0022.inventory_ptr,data0456.ship_date, ');
      SQL.Add('data0022.quan_on_hand+data0022.quan_in_insp, ');
      SQL.Add('convert(float,data0022.tax_price*data0456.exch_rate/(1.0+data0022.tax_2*0.01)),data0022.tax_2');
      SQL.Add('from data0022 inner join data0456 on data0022.grn_ptr=data0456.rkey ');
      SQL.Add('where data0022.quan_on_hand+data0022.quan_in_insp>0');
      Parameters.ParamByName('rkey444').Value:= rkey444;
      ExecSQL;
    end;     

//    FrmProgress.Caption :='正在生成在制品存货档案......';
    with dm.Qery448 do
    begin
      close ;
      sql.Clear;
      sql.Add('Select * from data0448 where rkey is null');
      prepared;
      open;
    end;
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert Data0448(D0444_PTR,CUT_NO,SO_NO,CUSTOMER_PART_PTR,CUSTOMER_PTR,QUANTITY,UNIT_PRICE) ');
      SQL.Add('Select :rkey444 ,t492.CUT_NO,t70.sales_order,t8.RKEY,t10.RKEY,t492.WIP_QTY,t71.price ');
      SQL.Add('From Data0492 t492 inner join WZCP0070 t70 on t492.SO_NO = t70.sales_order ');
      SQL.Add('inner join Data0008 t8 on t492.BOM_PTR = t8.RKEY ');
      SQL.Add('inner join WZCP0071 t71 on t492.PRINTED_BY_PTR = t71.RKEY ');
      SQL.Add('Left join Data0010 t10 on t70.customer_ptr = t10.RKEY ');
      SQL.Add('Where t492.TSTATUS in(0,2) and t492.WIP_QTY>0');
      Parameters.ParamByName('rkey444').Value:= rkey444;
      ExecSQL;
    end;

//    FrmProgress.Caption :='正在生成产成品存货档案......';
    with dm.Qery449 do
    begin
      close ;
      sql.Clear;
      sql.Add('Select * from data0449 where rkey is null');
      prepared;
      open;
    end;
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert Data0449(D0444_PTR,proc_ptr,location_ptr,qty_on_hand) ');
      SQL.Add('select :rkey444 ,proc_ptr,location_ptr,qty_on_hand from wzcp0001 ');
      SQL.Add('where qty_on_hand>0');
      Parameters.ParamByName('rkey444').Value:= rkey444;
      ExecSQL;
    end;

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
//    with dm.adoupdate do
//    begin
//     close;
//     Parameters.ParamValues['@rkey444']:=dm.DS444RKEY.Value;
//     ExecProc;
//    end;

//    FrmProgress.free ;
    messagedlg('已经正确生成'+datetostr(strtodatetime(StatusBar1.Panels[1].text))+'的存货档案！',mtinformation,[mbok],0);
    dm.Conn.CommitTrans;
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

procedure TFrmMain.N2Click(Sender: TObject);//截数处理
begin
 if self.find_specfgout then
  messagedlg('成品仓特殊出仓,但尚未完成审核的成品!',mterror,[mbcancel],0)
 else if self.if_instock then
  messagedlg('成品仓有等待过数入仓,但尚未完成审核的成品!',mterror,[mbcancel],0)
 else if self.find_invtcount then
  messagedlg('对不起原材料盘点未结束不能截数!',mterror,[mbcancel],0)
// else if self.find_wipcount then
//  messagedlg('对不起在制盘点未结束不能截数!',mterror,[mbcancel],0)
 else if self.find_fgcount then
  messagedlg('对不起产成盘点未结束不能截数!',mterror,[mbcancel],0)
// else if find_qtyreject then
//  messagedlg('对不起在线产品有报废申请但未审核的情况不能截数!',mterror,[mbcancel],0)
 else
 try
  Application.CreateForm(TfrmClose, frmClose);
  if frmClose.ShowModal=mrok then
   if self.find_cutdate(frmclose.DateTimePicker1.Date) then
    messagedlg('对不起,截数日期已经存在!',mterror,[mbcancel],0)
   else begin
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
   sql.Add('Select t10.CUST_CODE,t10.ABBR_NAME,t448.CUT_NO,t448.SO_NO, ');
   sql.Add('t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC,t448.QUANTITY,t448.UNIT_PRICE ');
   sql.Add('From Data0448 t448 ');
   sql.Add('INNER JOIN Data0492 t492 ON t448.CUT_NO = t492.CUT_NO ');
   sql.Add('INNER JOIN WZCP0070 t70 ON t448.SO_NO = t70.sales_order ');
   sql.Add('INNER JOIN Data0008 t8 ON t448.CUSTOMER_PART_PTR = t8.RKEY ');
   sql.Add('INNER JOIN WZCP0071 t71 ON t70.rkey = t71.so_ptr and t8.RKEY = t71.prod_ptr ');
   sql.Add('INNER JOIN Data0010 t10 ON t70.customer_ptr = t10.RKEY and t448.CUSTOMER_PTR = t10.RKEY ');
   sql.Add('Where t448.d0444_ptr='+dm.DS444.fieldbyname('rkey').asstring);
   sql.Add('ORDER BY t10.CUST_CODE,t448.CUT_NO,t8.PROD_CODE');
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
   sql.Add('Select t8.PROD_CODE,t8.PRODUCT_NAME,t8.PRODUCT_DESC, ');
   sql.Add('t16.CODE,t16.LOCATION,t449.qty_on_hand ');
   sql.Add('From Data0449 t449 ');
   sql.Add('INNER JOIN Data0008 t8 ON t449.proc_ptr = t8.RKEY ');
   sql.Add('INNER JOIN Data0016 t16 ON t449.location_ptr = t16.RKEY ');
   sql.Add('Where t449.d0444_ptr='+dm.DS444.fieldbyname('rkey').asstring);
   sql.Add('order by t8.PROD_CODE,t16.CODE');
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
 if dm.DS444CLOSED.Value ='Y' then
 begin
  n3.Enabled:=false;
  n10.Enabled:=false;
  n9.Enabled:=false;
 end
 else begin
  n3.Enabled:=true;
  n10.Enabled:=true;
  n9.Enabled:=true;
 end;
end;
//更新原料
procedure TFrmMain.N14Click(Sender: TObject);
var vleng:currency;
 rkey444:Integer;
begin
 try
  Application.CreateForm(TfrmClose, frmClose);
  frmClose.Label1.Visible :=false;
  frmClose.DateTimePicker1.Visible :=false;
  if frmClose.ShowModal=mrok then
  begin
  if messagedlg('是否确认要用当前的存货数据覆盖'+
    dm.DS444MATL_DATE.AsString+'的原材料存货的档案吗？',
     mtconfirmation,[mbYes,mbNo],0)=mryes then
   begin
    dm.Conn.BeginTrans ;
    with dm.Qery445  do
     begin
      close ;
      sql.Clear;
      sql.Add('delete data0445 where d0444_ptr='+dm.DS444RKEY.AsString);
      ExecSQL;
     end;

    dm.DS444.edit ;
    dm.DS444.FieldByName('matl_date').AsString:=frmClose.edit1.text;
    dm.DS444.Post ;
    
    rkey444:= dm.DS444RKEY.Value;
//    Application.CreateForm(TFrmProgress, FrmProgress);
//    FrmProgress.Show ;

//    FrmProgress.Caption :='正在生成材料存货档案......';
    with dm.Qery445  do
    begin
      close ;
      sql.Clear;
      sql.Add('Select * from data0445 where d0444_ptr='+dm.DS444RKEY.AsString);
      open;
    end;
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert data0445(D0444_PTR,D0022_PTR,INVENT_PTR,RECD_DATE,QUANTITY,UNIT_PRICE,tax_2) ');
      SQL.Add('select :rkey444 ,data0022.rkey,data0022.inventory_ptr,data0456.ship_date, ');
      SQL.Add('data0022.quan_on_hand+data0022.quan_in_insp, ');
      SQL.Add('convert(float,data0022.tax_price*data0456.exch_rate/(1.0+data0022.tax_2*0.01)),data0022.tax_2');
      SQL.Add('from data0022 inner join data0456 on data0022.grn_ptr=data0456.rkey ');
      SQL.Add('where data0022.quan_on_hand+data0022.quan_in_insp>0');
      Parameters.ParamByName('rkey444').Value:= rkey444;
      ExecSQL;
    end;

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
    dm.Conn.CommitTrans;
    FrmProgress.free ;
    messagedlg('已经正确生成'+datetostr(strtodatetime(StatusBar1.Panels[1].text))+'的存货档案！',mtinformation,[mbok],0);
   end;
  end;
  frmClose.Free ;
 except
  on E: Exception do
   begin
    dm.Conn.RollbackTrans;
    messagedlg(E.Message ,mtinformation,[mbok],0);
   end;
 end;
end;

procedure TFrmMain.N13Click(Sender: TObject);//更新在制品
var vleng:currency;
 rkey444:Integer;
begin
 try
  Application.CreateForm(TfrmClose, frmClose);
  frmClose.Label1.Visible :=false;
  frmClose.DateTimePicker1.Visible :=false;
  if frmClose.ShowModal=mrok then
  begin
    if messagedlg('是否确认要用当前的存货数据覆盖'+
        dm.DS444WIP_DATE.AsString+'的原在制品的档案吗？',
        mtconfirmation,[mbYes,mbNo],0)=mrYes then
   begin
    dm.Conn.BeginTrans ;
    with dm.Qery448  do
     begin
      close ;
      sql.Clear;
      sql.Add('delete data0448 where d0444_ptr='+dm.DS444RKEY.AsString);
      execsql;
     end;
    dm.DS444.edit ;
    dm.DS444.FieldByName('wip_date').AsString:=frmClose.edit1.text;
    dm.DS444.Post ;
    rkey444:= dm.DS444.fieldbyname('rkey').asinteger;

//    Application.CreateForm(TFrmProgress, FrmProgress);
//    FrmProgress.Show ;
//    FrmProgress.Caption :='正在生成在制品存货档案......';
    with dm.Qery448  do
    begin
      close ;
      sql.Clear;
      sql.Add('Select * from data0448 where d0444_ptr='+dm.DS444RKEY.AsString);
      open;
    end;
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert Data0448(D0444_PTR,CUT_NO,SO_NO,CUSTOMER_PART_PTR,CUSTOMER_PTR,QUANTITY,UNIT_PRICE) ');
      SQL.Add('Select :rkey444 ,t492.CUT_NO,t70.sales_order,t8.RKEY,t10.RKEY,t492.WIP_QTY,t71.price ');
      SQL.Add('From Data0492 t492 inner join WZCP0070 t70 on t492.SO_NO = t70.sales_order ');
      SQL.Add('inner join Data0008 t8 on t492.BOM_PTR = t8.RKEY ');
      SQL.Add('inner join WZCP0071 t71 on t70.rkey = t71.so_ptr and t8.RKEY = t71.prod_ptr ');
      SQL.Add('Left join Data0010 t10 on t70.customer_ptr = t10.RKEY ');
      SQL.Add('Where t492.TSTATUS in(0,2) and t492.WIP_QTY>0');
      Parameters.ParamByName('rkey444').Value:= rkey444;
      ExecSQL;
    end;

    dm.Conn.CommitTrans;
//    FrmProgress.free ;
    messagedlg('已经正确生成'+datetostr(strtodatetime(StatusBar1.Panels[1].text))+'的存货档案！',mtinformation,[mbok],0);
   end;
  end;
  frmClose.Free ;
 except
  on E: Exception do
   begin
    dm.Conn.RollbackTrans;
    messagedlg(E.Message ,mtinformation,[mbok],0);
   end;
 end;
end;

procedure TFrmMain.N11Click(Sender: TObject); //更新成品
var vleng:currency;
 rkey444:Integer;
begin
 try
  Application.CreateForm(TfrmClose, frmClose);
  frmClose.Label1.Visible :=false;
  frmClose.DateTimePicker1.Visible :=false;
  if frmClose.ShowModal=mrok then
  begin
    if messagedlg('是否确认要用当前的存货数据覆盖'+
     dm.DS444FG_DATE.AsString+'的原成品存货的档案吗？',
      mtconfirmation,[mbYes,mbNo],0)=mrYes then
     begin
    dm.Conn.BeginTrans ;
    with dm.Qery449 do
     begin
      close ;
      sql.Clear;
      sql.Add('delete data0449 where d0444_ptr='+dm.DS444RKEY.AsString);
      execsql;
     end;

    dm.DS444.edit ;
    dm.DS444.FieldByName('fg_date').AsString:=frmClose.edit1.text;
    dm.DS444.Post ;

    rkey444:= dm.DS444.fieldbyname('rkey').asinteger;
//    Application.CreateForm(TFrmProgress, FrmProgress);
//    FrmProgress.Show;
//    FrmProgress.Caption :='正在生成产成品存货档案......';
    with dm.Qery449 do
    begin
      close ;
      sql.Clear;
      sql.Add('Select * from data0449 where rkey is null');
      prepared;
      open;
    end;
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert Data0449(D0444_PTR,proc_ptr,location_ptr,qty_on_hand) ');
      SQL.Add('select :rkey444 ,proc_ptr,location_ptr,qty_on_hand from wzcp0001 ');
      SQL.Add('where qty_on_hand>0');
      Parameters.ParamByName('rkey444').Value:= rkey444;
      ExecSQL;
    end;

  dm.Conn.CommitTrans;
//  FrmProgress.free ;
  messagedlg('已经正确生成'+datetostr(strtodatetime(StatusBar1.Panels[1].text))+'的存货档案！',mtinformation,[mbok],0);
  end;
 end;
 frmClose.Free ;
 except
  on E: Exception do
   begin
    dm.Conn.RollbackTrans;
    messagedlg(E.Message ,mtinformation,[mbok],0);
   end;
 end;    
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
{$IFDEF Release}
  if not App_Init(dm.Conn) then
  begin
    ShowMsg('程序启动失败，请与系统管理员联系！','提示',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  dm.Conn.Connected:= False;
  dm.Conn.Connected:= True;
  vprev.Caption:= '4';  //4写银
  rkey73:='136';
  user_ptr:='169';
{$ENDIF}
  self.Caption :=Application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TFrmMain.N9Click(Sender: TObject);
begin
// if not self.find_451enddate(dm.DS444CUT_DATE.Value) then
// begin
   form_wipinvt:=tform_wipinvt.Create(application);
   dm.AD462.Close;
   dm.AD462.Parameters[0].Value:=dm.DS444RKEY.Value;
   dm.AD462.Open;
   dm.AD462.Filter:='';
   Form_wipinvt.ShowModal;
   dm.AD462.Close;
   form_wipinvt.Free;
// end
// else messagedlg('无法修改已经参与期间核算还未进行订单核算的记录！',mterror,[mbcancel],0);
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
