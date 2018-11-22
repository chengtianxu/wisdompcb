unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,DateUtils,math,
  ComObj,Excel2000,ClipBrd, DB, ADODB, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ProgressBar1: TProgressBar;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
   command_sql:widestring;
   v_colwidth: array of integer;
   dbgrid2_coltotal:integer;

   OldGridWnd : TWndMethod;
   procedure CopyDbDataToExcel(Args:array of const);
   procedure NewGridWnd (var Message : TMessage);
   function get_systemdate():tdatetime;
   function get_data444rkey(cut_date:tdatetime):integer;
   function get_MATL_DATE444(cut_date: tdatetime): tdatetime;
   function get_FG_DATE444(cut_date: tdatetime): tdatetime;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, term, select_calculate, status_bar, Unit_expense,common,
  costbalance;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

// user_ptr:='5';
// vprev:='4';
//  dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

function TForm1.get_systemdate: tdatetime;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='select getdate() as sys_date';
 open;
 result:=fieldvalues['sys_date'];
end;
end;

function TForm1.get_data444rkey(cut_date: tdatetime): integer;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='select rkey from data0444'+#13+
 'where cut_date='''+datetostr(cut_date)+'''';
 open;
 if not IsEmpty then
  result:=fieldvalues['rkey']
 else
  result:=0;
end;
end;

function TForm1.get_MATL_DATE444(cut_date: tdatetime): tdatetime;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='select MATL_DATE from data0444'+#13+
 'where cut_date='''+datetostr(cut_date)+'''';
 open;
 if not IsEmpty then
  result:=fieldvalues['MATL_DATE']
 else
  result:=null;
end;
end;

function TForm1.get_FG_DATE444(cut_date: tdatetime): tdatetime;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='select FG_DATE from data0444'+#13+
 'where cut_date='''+datetostr(cut_date)+'''';
 open;
 if not IsEmpty then
  result:=fieldvalues['FG_DATE']
 else
  result:=null;
end;
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure Tform1.CopyDbDataToExcel(Args:array of const);
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
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
close;
application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.AqD451RKEY.Value;
 dm.AqD451.Close;
 dm.AqD451.Open;
 if rkey>0 then
  dm.AqD451.Locate('rkey',rkey,[]);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;


procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
 if dm.ADOConnection1.Connected then
  begin
   command_sql:=dm.AqD451.CommandText;
   dm.AqD451.Close;
   dm.AqD451.CommandText:=dm.AqD451.CommandText+
   'and year(Data0451.closed_date) = '+inttostr(yearof(date()))+#13;
   dm.AqD451.Open;
   with form_condition do
   begin
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[0];
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and year(Data0451.closed_date) = '+inttostr(yearof(date()));
    sgrid1.Cells[1,sgrid1.RowCount-1]:=inttostr(yearof(date()));
    sgrid1.RowCount:=sgrid1.RowCount+1;
   end;

   dbgrid2_coltotal:=dbgrid1.Width;
   setlength(v_colwidth,dbgrid1.FieldCount);
   for i:=0 to high(v_colwidth) do v_colwidth[i] := dbgrid1.Columns[i].Width;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
 dbgrid1.Columns[i].Width:=v_colwidth[i]+
  round((dbgrid1.Width-dbgrid2_coltotal)*v_colwidth[i]/(dbgrid2_coltotal-28));
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin

if form_condition.ShowModal=mrok then
 begin
  dm.AqD451.Close;
  dm.AqD451.CommandText:=self.command_sql;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.AqD451.CommandText:=dm.AqD451.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  dm.AqD451.Open;
 end;

end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AqD451.CommandText);
end;

procedure TForm1.N1Click(Sender: TObject);
var
 star_datetime:tdatetime;
 rkey:integer;
begin
try
Application.CreateForm(Tform2, form2);
if form2.ShowModal=mrok then
begin
 dm.ADOConnection1.BeginTrans;
 try
 screen.Cursor:=  crHourGlass;
 form3:=tform3.Create(application);
 form3.Show;

 star_datetime:=now;
 dm.ADO451.Close;
 dm.ADO451.Parameters.ParamByName('rkey').Value:=null;
 dm.ADO451.Open;
 dm.ADO451.Append;
 dm.ADO451FM_DATE.Value:=strtodate(form2.edit1.text);
 dm.ADO451END_DATE.Value:=strtodate(form2.edit2.text);
 dm.ADO451ACTUAL_FM_DATE.AsString:=form2.Label2.Caption;
 dm.ADO451ACTUAL_END_DATE.AsString:=form2.Label4.Caption;
 dm.ADO451CLOSED_BY.AsString:=user_ptr;
 dm.ADO451CLOSED_DATE.Value:=self.get_systemdate;
 dm.ADO451.Post;        //1增加核算期间
 progressbar1.Position:=10;
 form3.Label1.Caption:='第一步:计算制造费用及标材料消耗...';
 form3.Label9.Caption:='10';
 form3.Refresh;
 //========================================================================
 with dm.aqdupdate do
 begin
  close;//2计算工序产出442,7增加制造费用424,6计算标准材料消耗447
  ProcedureName:='wzpr451;1';
  Parameters.Refresh;
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
  parameters.ParamValues['@fm_date']:=dm.ADO451ACTUAL_FM_DATE.Value;
  parameters.ParamValues['@end_date']:=dm.ADO451ACTUAL_END_DATE.Value;
  ExecProc;
 end;
 progressbar1.Position:=20;
 form3.Label1.Caption:='第二步:计算仓库材料进出存...';
 form3.Label9.Caption:='20';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
//========================================================================
 with dm.aqdupdate do
 begin
  close;//12增加及更新期初库存,本期入库,本期发放,报废,退货,盘点差异,期末库存数据(446)
  ProcedureName:='wzpr451;2';        //材料进出存平衡表
  Parameters.Refresh;
  parameters.ParamValues['@rkey444_fm_date']:=get_data444rkey(dm.ADO451FM_DATE.Value);
  parameters.ParamValues['@rkey444_end_date']:=get_data444rkey(dm.ADO451END_DATE.Value);
  parameters.ParamValues['@fm_date']:=get_MATL_DATE444(dm.ADO451FM_DATE.Value);
  parameters.ParamValues['@end_date']:=get_MATL_DATE444(dm.ADO451END_DATE.Value);
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
  ExecProc;
 end;
 progressbar1.Position:=40;
 form3.Label1.Caption:='第三步:计算工序实际材料消耗...';
 form3.Label9.Caption:='40';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
 //=============================================================================
 with dm.aqdupdate do
 begin
  close;//8生成期间工序材料成本汇总(454)与发放材料，期初期末在线材料，447标准材料有关
  ProcedureName:='wzpr451;3';
  Parameters.Refresh;
  parameters.ParamValues['@fm_date']:=dm.ADO451ACTUAL_FM_DATE.Value;
  parameters.ParamValues['@end_date']:=dm.ADO451ACTUAL_END_DATE.Value;
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
  parameters.ParamValues['@rkey444_fm_date']:=self.get_data444rkey(dm.ADO451FM_DATE.Value);
  parameters.ParamValues['@rkey444_end_date']:=self.get_data444rkey(dm.ADO451END_DATE.Value);
  ExecProc;
 end;
 progressbar1.Position:=50;
 form3.Label1.Caption:='第四步:工序材料消耗汇总...';
 form3.Label9.Caption:='50';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
//=============================================================================
 with dm.aqdupdate do
 begin
  close;
  ProcedureName:='wzpr451;4';
  Parameters.Refresh;
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
  ExecProc;   //9序生产材料总成本453，10工序杂项材料成本421，
 end;         //11行政部门领用材料成本422,13按材料类别更新材料成本452
 progressbar1.Position:=60;
 form3.Label1.Caption:='第五步:汇总期间材料消耗退货...';
 form3.Label9.Caption:='60';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
//=============================================================================
 with dm.aqdupdate do
 begin
  close;
  ProcedureName:='wzpr451;5';
  Parameters.Refresh;
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
  parameters.ParamValues['@fmdate']:=dm.ADO451FM_DATE.Value;
  parameters.ParamValues['@enddate']:=dm.ADO451END_DATE.Value;
  ExecProc;
 end;         //(14.1,14.2,15,16)更新材料成本451多个字段
 progressbar1.Position:=70;
 form3.Label1.Caption:='第六步:归集本期报废及入仓成品数据...';
 form3.Label9.Caption:='70';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Update;
//==========================================================================
 with dm.aqdupdate do
 begin
  close;
  ProcedureName:='wzpr451;6';
  Parameters.Refresh;
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
  parameters.ParamValues['@fm_date']:=dm.ADO451ACTUAL_FM_DATE.Value;
  parameters.ParamValues['@end_date']:=dm.ADO451ACTUAL_END_DATE.Value;
  ExecProc;   //17,新增期间品质报废成本441,18.增加本期返工过数成本411
 end;          //19本期过数入库的产成品(有作业单)
 progressbar1.Position:=80;
 form3.Label1.Caption:='第七步:归集仓库成品进出存平衡表...';
 form3.Label9.Caption:='80';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
//==========================================================================
 with dm.aqdupdate do
 begin//21增加及更新成品期初库存,本期入库,本期发放,转移,报废,盘点差异,期末库存数据(372)
  close;                     //成品进出存平衡表
  ProcedureName:='wzpr451;7';
  Parameters.Refresh;
  parameters.ParamValues['@rkey444_fm_date']:=get_data444rkey(dm.ADO451FM_DATE.Value);
  parameters.ParamValues['@rkey444_end_date']:=get_data444rkey(dm.ADO451END_DATE.Value);
  parameters.ParamValues['@fm_date']:=get_FG_DATE444(dm.ADO451FM_DATE.Value);
  parameters.ParamValues['@end_date']:=get_FG_DATE444(dm.ADO451END_DATE.Value);
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
  ExecProc;
 end;
 progressbar1.Position:=90;
 form3.Label1.Caption:='第八步:归集经过成本中心的过数...';
 form3.Label9.Caption:='90';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
//==========================================================================
 with dm.aqdupdate do   //增加经过成本中心过数记录的作业单成本410
 begin
  close;
  ProcedureName:='wzpr451;8';
  Parameters.Refresh;
  parameters.ParamValues['@rkey451']:=dm.ADO451RKEY.Value;
//  parameters.ParamValues['@fm_date']:=dm.ADO451ACTUAL_FM_DATE.Value;
//  parameters.ParamValues['@end_date']:=dm.ADO451ACTUAL_END_DATE.Value;
  ExecProc;
 end;
 progressbar1.Position:=100;
 dm.ADOConnection1.CommitTrans;
//==========================================================================
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='TRUNCATE TABLE  data0442';
    ExecSQL;          //删除本期存储的过数记录
  end;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='TRUNCATE TABLE  data0447';
    ExecSQL;          //删除本期存储的标准一类材料二类材料明细
  end;
//==========================================================================
// dm.ADOConnection1.CommitTrans;
 rkey:=dm.ADO451RKEY.Value;
 dm.ADOConnection1.Connected:=false;
 dm.ADOConnection1.Connected:=true;
 dm.AqD451.Close;
 dm.AqD451.Open;
 dm.AqD451.Locate('rkey',rkey,[]);
 dm.ADO451.Close;
 dm.aqdupdate.Close;
 dm.ADOQuery1.Close;

 screen.Cursor:=  crDefault;
 form3.Label1.Caption:='完成...';
 form3.Label9.Caption:='100';
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Update;
 form3.Free;

 progressbar1.Position:=0;
 messagedlg('期间成本核算完成!',mtinformation,[mbok],0)
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    form3.Free;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
end;
finally
 form2.Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 star_datetime:tdatetime;
begin
 if (dm.AqD451wo_ptr.Value=1) then //如果先前已核算订单成本
 begin
   messagedlg('作业单成本先前已核算过!', mtError,[mbCancel],0);
   exit;
 end;
 
 if HourSpan(get_systemdate,dm.AqD451.FieldByName('CLOSED_DATE').AsDateTime)>4.0 then
 begin
   MessageBox(Handle, '目前时间距离核算期间成本时间已超过4小时,请先删除核算期间重新核算!', '提示', MB_OK + MB_ICONINFORMATION);
   Abort;
 end;

 with dm.tmp do
 begin
  Close;
  SQL.Text:='SELECT data0060.sales_order,data0064.shipment_no'+#13+
   'FROM dbo.Data0064 INNER JOIN'+#13+
   'dbo.Data0052 ON dbo.Data0064.RKEY = dbo.Data0052.SO_SHP_PTR'+#13+
   'inner join data0060 on data0064.so_ptr=data0060.rkey'+#13+
   'WHERE (dbo.Data0064.DATE_ASSIGN > '+QuotedStr(FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.AqD451ACTUAL_FM_DATE.AsDatetime))+') and'+#13+
   '     (dbo.Data0064.DATE_ASSIGN <= '+QuotedStr(FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.AqD451ACTUAL_END_DATE.AsDatetime))+')'+#13+
   'and not exists(select rkey from data0372 where d0451_ptr='+dm.AqD451RKEY.AsString+' and'+#13+
   'Data0052.DATA0053_PTR=data0372.d0053_ptr)';
  Open;
 end;
 if not dm.tmp.IsEmpty then
  begin
   ShowMsg('成品进出存平衡表出现错误,下面的订单出库没有被记录到!'+
   dm.tmp.fieldbyname('sales_order').AsString+';'+dm.tmp.fieldbyname('shipment_no').AsString
   ,1);
   exit;
  end;

 with dm.tmp do
 begin
  Close;
  sql.Text:=
    'select data0453.cost_dept_ptr,data0453.warehouse_ptr,data0034.dept_code from data0453'+#13+
     'inner join data0034 on data0453.cost_dept_ptr=data0034.rkey'+#13+
    'where data0453.d0451_ptr='+dm.AqD451RKEY.AsString+' and'+#13+
          'data0453.actual_cost>0 and'+#13+
    'not exists(select * from (select dept_ptr,warehouse_ptr from data0424'+#13+
    '  where data0424.d0451_ptr='+dm.AqD451RKEY.AsString +#13+
    '  group by dept_ptr,warehouse_ptr) t'+#13+
    '  where t.dept_ptr=data0453.cost_dept_ptr and t.warehouse_ptr=data0453.warehouse_ptr)'+#13+
    'group by data0453.cost_dept_ptr,data0453.warehouse_ptr,data0034.dept_code';
  Open;       //有实际材料成本消耗没有对应的制造费用表(产出面积为零)
 end;
 if not dm.tmp.IsEmpty then
  begin
   ShowMsg('直接材料消耗没有相应的过数面积,下面成本中心材料无法分摊: '+
   dm.tmp.fieldbyname('dept_code').AsString
   ,1);
   exit;
  end;

if messagedlg('请确认制造费用是否已经输入?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
 try
 dm.ADOConnection1.BeginTrans;
 screen.Cursor:=  crSqlwait;
 form3:=tform3.Create(application);
 form3.Caption:='核算订单成本';
 form3.Show;
 form3.Update;
 star_datetime:=now;
 form3.Label1.Caption:='第一步:分配过数作业单的材料成本及制造费用...';
 with dm.aqdupdate do        //更新410中实际材料成本,分配的制造费用
  begin
   close;
   ProcedureName:='wzpr451;9';
   Parameters.Refresh;
   parameters.ParamValues['@rkey451']:=dm.AqD451RKEY.Value;
   ExecProc;
  end;
 progressbar1.Position:=10;
 //========================================================
 form3.Label1.Caption:='第二步:计算内层分配的成本...';
 form3.Label9.Caption:='20';

 form3.Image1.Visible := true;
 form3.Image2.Visible := true;
 form3.Image3.Visible := true;

 with dm.aqdupdate do
 begin
  Close;
  ProcedureName:='wzpr451;12';
  Parameters.Refresh;
  parameters.ParamValues['@fm_date']:=dm.AqD451ACTUAL_FM_DATE.Value;
  parameters.ParamValues['@end_date']:=dm.AqD451ACTUAL_END_DATE.Value;
  ExecProc;
 end;
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
 progressbar1.Position:=40;

//============================================================================
 form3.Label1.Caption:='第三步:计算期末完工入库作业单及库存实际成本...';
 form3.Label9.Caption:='40';
 form3.ProgressBar1.Position:=40;
 with dm.aqdupdate do
 begin
  close;                 //更新完工作业单成本及成品入库成本 06,53
  ProcedureName:='wzpr451;13';
  Parameters.Refresh;
  parameters.ParamValues['@rkey451']:=dm.AqD451RKEY.Value;
  //parameters.ParamValues['@rkey444_end_date']:=get_data444rkey(dm.AqD451END_DATE.Value);
  parameters.ParamValues['@fm_date']:=dm.AqD451ACTUAL_FM_DATE.Value;
  parameters.ParamValues['@end_date']:=dm.AqD451ACTUAL_END_DATE.Value;
  ExecProc;
 end;
 form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
 form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
 form3.Refresh;
 progressbar1.Position:=50;
 //=================================================================
 form3.Label1.Caption:='第四步:计算本期实际报废成本';
 form3.Label9.Caption:='50';
 form3.ProgressBar1.Position:=50;

 with dm.aqdupdate do   //更新本期实际报废成本441
 begin
  close;
  ProcedureName:='wzpr451;15';
  Parameters.Refresh;
  parameters.ParamValues['@rkey451']:=dm.AqD451RKEY.Value;
  ExecProc;
 end;

  progressbar1.Position:=70;
  form3.ProgressBar1.Position:=70;
  form3.Label9.Caption:='70';
  form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
  form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
  form3.Refresh;
   //=========================================================================

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update data0451'+#13+
              'set wo_ptr=1'+#13+
              'where rkey='+dm.AqD451RKEY.AsString;
    ExecSQL;          //修改期末作业单成本已核算
   end;

   progressbar1.Position:=100;
   form3.Label1.Caption:='完成...';
   form3.Label9.Caption:='100';
   form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
   form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
   dm.ADOConnection1.CommitTrans;
   screen.Cursor:=  crDefault;
   progressbar1.Position:=0;
   form3.Refresh;
   Sleep(2000);
   form3.Free;
   messagedlg('作业单成本核算完成!',mtinformation,[mbok],0);
   BitBtn2Click(Sender);

   dm.aqdupdate.Close;
   dm.ADOQuery1.Close;
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    screen.Cursor:=  crDefault;
    form3.Free;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
end;

end;

procedure TForm1.N3Click(Sender: TObject);
begin
if dm.AqD451CLOSED_BY.Value<>StrToInt(user_ptr) then
 begin
   showmsg('只能创建者本人才能删除核算记录!',1);
   exit;
 end;

 with dm.tmp do
  begin
   close;
   sql.Text:='SELECT max(OP_DATE) as max_date FROM Data0140';
   open;
  end;
 if DM.tmp.FieldByName('max_date').AsDateTime > dm.AqD451CLOSED_DATE.Value then
 begin
   showmsg('请先删除发出商品进出存最大结算日期!',1);
   exit;
 end;


 with dm.tmp do
  begin
   close;
   sql.Clear;
   sql.add('SELECT TOP 1 MATL_CST_IN_SFG_CLOSED,OVHD_CST_IN_SFG_CLOSED FROM DATA0451 ORDER BY RKEY DESC');
   open;
  end;
  if ((dm.tmp.FieldByName('MATL_CST_IN_SFG_CLOSED').AsFloat<>0) or (dm.tmp.FieldByName('OVHD_CST_IN_SFG_CLOSED').AsFloat<>0)) then
  begin
   showmsg('请先取消本期调整再删除核算期间!',1);
   exit;
  end;

 with dm.tmp do
  begin
   close;
   sql.Text:='SELECT max(rkey) as max_rkey FROM Data0451';
   open;
  end;
if DM.tmp.FieldByName('max_rkey').AsInteger=DM.AqD451RKEY.Value then
if messagedlg('确认要删除第'+dm.AqD451no.AsString+'项成本核算档案吗?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 try
 dm.ADOConnection1.BeginTrans;
 screen.Cursor:=  crappstart;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='update data0444'+#13+
  'set CLOSED=''N'''+#13+
   'where rkey='+inttostr(get_data444rkey(dm.AqD451END_DATE.Value));
  ExecSQL;          //修改期末截数为未核算
 end;

 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='delete data0451 where rkey='+dm.AqD451RKEY.AsString;
  ExecSQL;
 end;
 dm.ADOConnection1.CommitTrans;
 screen.Cursor:=  crDefault;
 messagedlg('核算期间被成功删除!',mtinformation,[mbok],0);
 dm.AqD451.Close;
 dm.AqD451.Open;
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end
else
else
 showmsg('核算记录的删除，只能从操作最后一笔记录!',1);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.AqD451.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n8.Enabled:=false;
  n9.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  n9.Enabled:=true;
  if dm.AqD451wo_ptr.Value=0 then
   n8.Enabled:=true
  else
   n8.Enabled:=false;
 end;  
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  try
   form_expense:=tform_expense.Create(application);
   form_expense.BitBtn1.Enabled:=false;
   form_expense.BitBtn2.Enabled:=false;
   form_expense.BitBtn5.Enabled:=false;
   form_expense.DBGridEh1.ReadOnly:=true;
   form_expense.ShowModal;
   dm.ADOD424.Close;   
  finally
   form_expense.Free;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  try
   form_expense:=tform_expense.Create(application);
   form_expense.ShowModal;
   dm.ADOD424.Close;
  finally
   form_expense.Free;
  end;
end;

procedure TForm1.N10Click(Sender: TObject);
var
  rkey:Integer;
  difference:Double;
begin
  try
   costbalance_frm:=tcostbalance_frm.Create(application);
    with dm.tmp do
    begin
      close;
      sql.Clear;
      sql.Text:=
      'SELECT     dbo.Data0444.MATL_CST_IN_WIP_CLOSED, dbo.Data0444.OVHD_CST_IN_WIP_CLOSED,'+
      'dbo.Data0444.MATL_CST_IN_SFG_CLOSED, dbo.Data0444.OVHD_CST_IN_SFG_CLOSED, '+
      'data0451.dmatl_cst_out+data0451.dmatl_cst_in_dept_open-'+
      'data0451.dmatl_cst_in_dept_closed as matl_cost,isnull(data0451.ovhd3_cost,0) as ovhd3_cost, '+
      'isnull(data0451.ovhd_cst_in_wip_occured,0) as ovhd_cst_in_wip_occured, '+
      'isnull(data0451.ovhd1_cost,0) as ovhd1_cost, isnull(data0451.ovhd2_cost,0) as ovhd2_cost '+
      'FROM   dbo.Data0451 INNER JOIN '+
      'dbo.Data0444 ON dbo.Data0451.FM_DATE = dbo.Data0444.CUT_DATE '+
      'where Data0451.rkey='+dm.AqD451RKEY.AsString;
      open;
     costbalance_frm.Edit1.Text:=fieldbyname('MATL_CST_IN_WIP_CLOSED').AsString;
     costbalance_frm.Edit2.Text:=fieldbyname('OVHD_CST_IN_WIP_CLOSED').AsString;
     costbalance_frm.Edit12.Text:=fieldbyname('OVHD_CST_IN_SFG_CLOSED').AsString;
     costbalance_frm.Edit14.Text:=fieldbyname('MATL_CST_IN_SFG_CLOSED').AsString;
              //期初一类材料、费用、人工、二类材料
     costbalance_frm.Edit3.Text:=fieldbyname('matl_cost').AsString;   //本期投入材料成本
     costbalance_frm.Edit4.Text:=fieldbyname('ovhd_cst_in_wip_occured').AsString; //本期投入的制造费用
     costbalance_frm.Edit21.Text:=fieldbyname('ovhd1_cost').AsString;    //投入人工
     costbalance_frm.Edit24.Text:=fieldbyname('ovhd2_cost').AsString;    //投产二类材料

     costbalance_frm.Edit13.Text:=fieldbyname('ovhd3_cost').AsString;    //本期投入的带入成本


             //本期投入一类材料、制造费用、人工、二类材料
     difference:=fieldbyname('MATL_CST_IN_WIP_CLOSED').AsFloat+
                 fieldbyname('OVHD_CST_IN_WIP_CLOSED').AsFloat+
                 fieldbyname('OVHD_CST_IN_SFG_CLOSED').AsFloat+
                 fieldbyname('MATL_CST_IN_SFG_CLOSED').AsFloat+
                 fieldbyname('matl_cost').AsFloat+
                 fieldbyname('ovhd_cst_in_wip_occured').AsFloat+
                 fieldbyname('ovhd1_cost').AsFloat+
                 fieldbyname('ovhd2_cost').AsFloat;

    end;           //期初加本期投入：在制材料,人工,费用,二类材料

    with dm.tmp do
    begin
      close;
      sql.Clear;
      sql.Text:=
      'SELECT     dbo.Data0444.MATL_CST_IN_WIP_CLOSED, dbo.Data0444.OVHD_CST_IN_WIP_CLOSED,'+
      'dbo.Data0444.MATL_CST_IN_SFG_CLOSED, dbo.Data0444.OVHD_CST_IN_SFG_CLOSED '+
      'FROM   dbo.Data0451 INNER JOIN '+
      'dbo.Data0444 ON dbo.Data0451.END_DATE = dbo.Data0444.CUT_DATE '+
      'where Data0451.rkey='+dm.AqD451RKEY.AsString;
      open;
     costbalance_frm.Edit5.Text:=fieldbyname('MATL_CST_IN_WIP_CLOSED').AsString;
     costbalance_frm.Edit6.Text:=fieldbyname('OVHD_CST_IN_WIP_CLOSED').AsString;
     costbalance_frm.Edit16.Text:=fieldbyname('OVHD_CST_IN_SFG_CLOSED').AsString;//成本截数中直接人工
     costbalance_frm.Edit20.Text:=fieldbyname('MATL_CST_IN_SFG_CLOSED').AsString;//成本截数中二类材料

     difference:=difference-
                 fieldbyname('MATL_CST_IN_WIP_CLOSED').AsFloat-
                 fieldbyname('OVHD_CST_IN_WIP_CLOSED').AsFloat-
                 fieldbyname('OVHD_CST_IN_SFG_CLOSED').AsFloat-
                 fieldbyname('MATL_CST_IN_SFG_CLOSED').AsFloat;

    end;           //期末在制材料，人工，费用，外发成本

    with dm.tmp do
    begin
      close;
      sql.Text:='select sum(MATL_COST) as MATL_COST,sum(OVHD_COST) as OVHD_COST,'+
       'sum(scap_cost) as scap_cost,sum(OVHD1_COST) as OVHD1_COST, '+
       'sum(outsource_pcs) as outsource_pcs,'+
       'sum(PLANNED_QTY) as PLANNED_QTY,sum(outsource_cost) as outsource_cost '+
       'from data0464 where D0451_PTR='+dm.AqD451RKEY.AsString;
      open;
     costbalance_frm.Edit7.Text:=fieldbyname('MATL_COST').AsString;
     costbalance_frm.Edit8.Text:=fieldbyname('OVHD_COST').AsString;
     costbalance_frm.Edit9.Text:=fieldbyname('scap_cost').AsString;   //本期报废材料加带入成本
     costbalance_frm.Edit22.Text:=fieldbyname('OVHD1_COST').AsString;
     costbalance_frm.Edit23.Text:=fieldbyname('outsource_pcs').AsString;
                //本期完工的一类材料成本，直接人工，制造费用，二类材料
     costbalance_frm.Edit17.Text:=fieldbyname('PLANNED_QTY').AsString;   //本期完工中带入成本
     costbalance_frm.Edit18.Text:=fieldbyname('outsource_cost').AsString;  //本期报废带入成本

     difference:=difference-fieldbyname('MATL_COST').AsFloat-
                            fieldbyname('OVHD_COST').AsFloat-
                            fieldbyname('scap_cost').AsFloat-
                            fieldbyname('OVHD1_COST').AsFloat-
                            fieldbyname('outsource_pcs').AsFloat;

     if abs(difference)<0.01 then
       costbalance_frm.Edit10.Text:='0'
     else
       costbalance_frm.Edit10.Text:=FloatToStr(difference);

    end;
 //-----本期报废成本
   with dm.tmp do
    begin
      close;
      sql.Text:='select sum(TOT_STD_MATL_COST) as MATL_COST,sum(TOT_STD_OVHD_COST) as OVHD_COST,'+
       'sum(TOT_ovhd1_pcs) as OVHD1_COST, '+
       'sum(TOT_outsource_pcs) as outsource_pcs '+
       'from data0441 where D0451_PTR='+dm.AqD451RKEY.AsString+
       ' and data0441.if_stock=0';
      open;
     costbalance_frm.Edit25.Text:=fieldbyname('MATL_COST').AsString;
     costbalance_frm.Edit26.Text:=fieldbyname('OVHD_COST').AsString;
     costbalance_frm.Edit27.Text:=fieldbyname('OVHD1_COST').AsString;
     costbalance_frm.Edit28.Text:=fieldbyname('outsource_pcs').AsString;
                //本期报废的一类材料成本，制造费用，直接人工，二类材料
    end;
  //----本期差异
   costbalance_frm.Edit29.Text:=FloatToStr(
   StrToFloat(costbalance_frm.Edit1.Text)+
   StrToFloat(costbalance_frm.Edit3.Text)-
   StrToFloat(costbalance_frm.Edit5.Text)-
   StrToFloat(costbalance_frm.Edit7.Text)-
   StrToFloat(costbalance_frm.Edit25.Text));

   costbalance_frm.Edit30.Text:=FloatToStr(
   StrToFloat(costbalance_frm.Edit2.Text)+
   StrToFloat(costbalance_frm.Edit4.Text)-
   StrToFloat(costbalance_frm.Edit6.Text)-
   StrToFloat(costbalance_frm.Edit8.Text)-
   StrToFloat(costbalance_frm.Edit26.Text));

   costbalance_frm.Edit31.Text:=FloatToStr(
   StrToFloat(costbalance_frm.Edit12.Text)+
   StrToFloat(costbalance_frm.Edit21.Text)-
   StrToFloat(costbalance_frm.Edit16.Text)-
   StrToFloat(costbalance_frm.Edit22.Text)-
   StrToFloat(costbalance_frm.Edit27.Text));

   costbalance_frm.Edit32.Text:=FloatToStr(
   StrToFloat(costbalance_frm.Edit14.Text)+
   StrToFloat(costbalance_frm.Edit24.Text)-
   StrToFloat(costbalance_frm.Edit20.Text)-
   StrToFloat(costbalance_frm.Edit23.Text)-
   StrToFloat(costbalance_frm.Edit28.Text));
 //下面计算带入
   rkey:=get_data444rkey(dm.AqD451FM_DATE.Value);
    with dm.tmp do
    begin
      close;
      sql.Text:='select sum(data0448.QUANTITY*data0006.PLANNED_QTY) as MATL_COST '+
       'from data0448 inner join data0006 on data0448.WO_PTR=data0006.rkey '+
       'where data0448.D0444_PTR='+IntToStr(RKEY);
      open;
     costbalance_frm.Edit11.Text:=fieldbyname('MATL_COST').AsString;    //期初在制的带入成本
     difference:= fieldbyname('MATL_COST').AsFloat+strtofloat(costbalance_frm.Edit13.Text); //加上本期投产的带入成本
    end;

 { with dm.tmp do
    begin
      close;
      sql.Text:=
      'SELECT  Sum(dbo.Data0465.QUANTITY * '+
      '(Data0053.cost_pcs + Data0053.matl_ovhd_pcs + Data0053.OVHD_COST + '+
      'Data0053.PLANNED_QTY+data0053.ovhd1_pcs+data0053.outsource_pcs)) AS Jechengben '+
      'FROM  dbo.Data0465 INNER JOIN '+
      'dbo.data0415 ON dbo.Data0465.heard_ptr = dbo.data0415.rkey INNER JOIN '+
      'dbo.Data0053 ON dbo.Data0465.D0053_PTR = dbo.Data0053.RKEY '+
      'WHERE   (dbo.data0415.sys_date >= '+quotedstr(FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.AqD451ACTUAL_FM_DATE.AsDatetime))+') '+
      ' AND (dbo.data0415.sys_date <= '+quotedstr(FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.AqD451ACTUAL_END_DATE.AsDatetime))+') '+
      ' AND (dbo.data0415.type IN (3, 4))';
      open;
     costbalance_frm.Edit13.Text:=fieldbyname('Jechengben').AsString;
     difference:=difference+ fieldbyname('Jechengben').AsFloat;
    end;         //本期特殊出仓返回生产线上的成本 (本期投产带入成本)


    with dm.tmp do
    begin
      close;
      sql.Text:=
      'SELECT  Sum(dbo.Data0465.QUANTITY * '+
      '(isnull(data0025.tot_accu_matl_per_sqft,0)+ '+
      ' isnull(data0025.tot_accu_OVHD_per_sqft,0)) * isnull(data0025.unit_sq,0)) AS Jechengben '+
      'FROM  dbo.Data0465 INNER JOIN '+
      'dbo.data0415 ON dbo.Data0465.heard_ptr = dbo.data0415.rkey INNER JOIN '+
      'dbo.Data0025 ON dbo.Data0415.custpart_ptr = dbo.Data0025.RKEY '+
      'WHERE   (dbo.data0415.sys_date >= '+quotedstr(FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.AqD451ACTUAL_FM_DATE.AsDatetime))+') '+
      ' AND (dbo.data0415.sys_date <= '+quotedstr(FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.AqD451ACTUAL_END_DATE.AsDatetime))+') '+
      ' AND (dbo.data0415.type IN (3, 4))';
      open;
     costbalance_frm.Edit13.Text:=fieldbyname('Jechengben').AsString;
     difference:=difference+ fieldbyname('Jechengben').AsFloat;
    end;         //本期特殊出仓返回生产线上的成本 (本期投产带入成本)
  }
   with dm.tmp do
    begin
      close;
      sql.Text:=
     'select isnull(sum(data0441.qty_rejected*data0006.PLANNED_QTY),0) as reject_cost '+
     'from data0441 inner join data0006 '+
     'on data0441.wo_ptr=data0006.rkey '+
     'where data0441.d0451_ptr='+dm.AqD451RKEY.AsString+
     ' and if_stock=1'+     //本期在线特殊报废带入成本(非在制报废入库)
     ' and not exists(select rkey from data0053 where data0053.rkey58=data0441.rkey58)';
      Open;

      costbalance_frm.Edit13.Text:=
      FloatToStr(strtofloat(costbalance_frm.Edit13.Text)-fieldbyname('reject_cost').AsFloat);

      difference:=difference- fieldbyname('reject_cost').AsFloat;
    end; 

    rkey:=get_data444rkey(dm.AqD451END_DATE.Value);
    with dm.tmp do
    begin
      close;
      sql.Text:='select sum(data0448.QUANTITY*data0006.PLANNED_QTY) as MATL_COST '+
       'from data0448 inner join data0006 on data0448.WO_PTR=data0006.rkey '+
       'where data0448.D0444_PTR='+IntToStr(RKEY);
      open;
     costbalance_frm.Edit15.Text:=fieldbyname('MATL_COST').AsString;  //期末在制带入成本
     difference:=difference - fieldbyname('MATL_COST').AsFloat-
                StrToFloat(costbalance_frm.Edit17.Text)-
                StrToFloat(costbalance_frm.Edit18.Text);
    end;
    if abs(difference)<0.01 then
      costbalance_frm.Edit19.Text:='0'
    else
      costbalance_frm.Edit19.Text:=FloatToStr(difference);

    costbalance_frm.BitBtn2.Tag:=dm.AqD451RKEY.AsInteger;
    costbalance_frm.BitBtn3.Tag:=dm.AqD451RKEY.AsInteger;
   costbalance_frm.ShowModal;
  finally
   costbalance_frm.Free;
  end;
end;

procedure TForm1.N11Click(Sender: TObject);
var
  star_datetime:TDateTime;
begin
  //先判断是否已进行作业单成本核算
if (dm.AqD451wo_ptr.Value=0) then //如果先前没有核算作业单成本
 begin
   messagedlg('请首先进行作业单成本核算!', mtError,[mbCancel],0);
   exit;
 end;
  //-------------------------------------------------
if (dm.AqD451CLOSED.Value='Y') then //如果先前已核算完工成本
 begin
   messagedlg('先前已核算过完工入库成本', mtError,[mbCancel],0);
   exit;
 end;
 //--------------------------------------------------
if messagedlg('请确认是否开始核算完工入库成本?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 try
   dm.ADOConnection1.BeginTrans;
   screen.Cursor:=  crSqlwait;
   form3:=tform3.Create(application);
   form3.Caption:='核算完工入库成本';
   form3.Show;
   form3.Update;
   star_datetime:=now;

   form3.Label1.Caption:='第一步:把报废成本,分配到本期完工成本中的带入成本...';
  //增加wxpr451;18分配，把报废成本中的当期材料,制造费用成本分摊到完工成本464中去
   with dm.aqdupdate do   //把报废成本分摊到完工成本464中去
   begin
    close;
    ProcedureName:='wzpr451;18';
    Parameters.Refresh;
    parameters.ParamValues['@d0451_ptr']:=dm.AqD451RKEY.Value;
    ExecProc;
   end;

   form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
   form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
   form3.Refresh;
   Self.ProgressBar1.Position:=30;
   form3.Label9.Caption:='30';
   form3.ProgressBar1.Position:=30;
 //=========================================================================
   form3.Label1.Caption:='第二步:将完工成本更新到库存成本';

   with dm.aqdupdate do
   begin                   //更新截数中的在制品,成品,半成品每PCS实际成本
    close;                 //更新完工成品材料成本,制造费用 464,372
    ProcedureName:='wzpr451;16';
    Parameters.Refresh;
    parameters.ParamValues['@rkey451']:=dm.AqD451RKEY.Value;
    parameters.ParamValues['@rkey444_end_date']:=get_data444rkey(dm.AqD451END_DATE.Value);
    parameters.ParamValues['@fm_date']:=dm.AqD451ACTUAL_FM_DATE.Value;
    parameters.ParamValues['@end_date']:=dm.AqD451ACTUAL_END_DATE.Value;
    ExecProc;
   end;

   form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
   form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
   form3.Refresh;
   self.ProgressBar1.Position:=45;
   form3.Label9.Caption:='45';
   form3.ProgressBar1.Position:=45;

//============================================================================
   form3.Label1.Caption:='第三步:把报废带入成本分摊到完工成本.';
   //增加wxpr451;19分配，把报废成本中的带入成本分摊到完工成本464中去
   with dm.aqdupdate do   //把报废成本分摊到完工成本464中去
   begin
    close;
    ProcedureName:='wzpr451;19';
    Parameters.Refresh;
    parameters.ParamValues['@d0451_ptr']:=dm.AqD451RKEY.Value;
    ExecProc;
   end;

   form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
   form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
   form3.Refresh;
   self.ProgressBar1.Position:=60;
   form3.Label9.Caption:='60';
   form3.ProgressBar1.Position:=60;

//============================================================================
   form3.Label1.Caption:='第四步:更新本期库存成本中的报废带入成本.';
   with dm.aqdupdate do
   begin                   //更新截数中的在制品,成品,半成品每PCS实际成本
    close;                 //更新完工成品材料成本,制造费用 464,372
    ProcedureName:='wzpr451;20';
    Parameters.Refresh;
    parameters.ParamValues['@rkey451']:=dm.AqD451RKEY.Value;
    parameters.ParamValues['@rkey444_fm_date'] :=get_data444rkey(dm.AqD451FM_DATE.Value);
    parameters.ParamValues['@rkey444_end_date']:=get_data444rkey(dm.AqD451END_DATE.Value);
    parameters.ParamValues['@fm_date']:=dm.AqD451ACTUAL_FM_DATE.Value;
    parameters.ParamValues['@end_date']:=dm.AqD451ACTUAL_END_DATE.Value;
    ExecProc;
   end;
   form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
   form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
   form3.Refresh;
   self.ProgressBar1.Position:=85;
   form3.Label9.Caption:='85';
   form3.ProgressBar1.Position:=85;
//============================================================================
   form3.Label1.Caption:='第五步:计算本期销售金额,销售面积...';

   with dm.aqdupdate do   //更新销售面积销售金额451
   begin
    close;
    ProcedureName:='wzpr451;14';
    Parameters.Refresh;
    parameters.ParamValues['@rkey451']:=dm.AqD451RKEY.Value;
    parameters.ParamValues['@fm_date']:=dm.AqD451ACTUAL_FM_DATE.Value;
    parameters.ParamValues['@end_date']:=dm.AqD451ACTUAL_END_DATE.Value;
    ExecProc;
   end;
   form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
   form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
   form3.Refresh;
   progressbar1.Position:=98;
   form3.Label9.Caption:='98';
   form3.ProgressBar1.Position:=98;
//================================================
   form3.Label1.Caption:='第六步：更新成本核算完成标识.';
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update data0444'+#13+
    'set CLOSED=''Y'''+#13+
     'where rkey='+inttostr(get_data444rkey(dm.AqD451FM_DATE.Value))+#13+
     'and closed=''N''';
    ExecSQL;          //修改期初截数为已核算(如果已核算则无需修改)
   end;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update data0444'+#13+
    'set CLOSED=''Y'''+#13+
     'where rkey='+inttostr(get_data444rkey(dm.AqD451END_DATE.Value));
    ExecSQL;          //修改期末截数为已核算
   end;

//   form3.Label5.Caption:=inttostr(MinutesBetween(now,star_datetime));
   form3.Label5.Caption:=inttostr(SecondsBetween(now,star_datetime) div 60);
   form3.Label6.Caption:=inttostr(SecondsBetween(now,star_datetime) mod 60);
   form3.Refresh;
   progressbar1.Position:=100;
   form3.Label9.Caption:='100';
   form3.ProgressBar1.Position:=100;

   dm.ADOConnection1.CommitTrans;
   screen.Cursor:=  crDefault;
   progressbar1.Position:=0;
   Sleep(2000);
   form3.Free;
   messagedlg('核算完工入库成本完成!',mtinformation,[mbok],0);
   BitBtn2Click(Sender);
   dm.aqdupdate.Close;
   dm.ADOQuery1.Close;
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    screen.Cursor:=  crDefault;
    form3.Free;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
 
end;

end.
