unit main_one;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBGridEh;

type
  TForm4 = class(TForm)
    ADOConnection1: TADOConnection;
    AQ415: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    AQ415number: TStringField;
    AQ415EMPLOYEE_NAME: TStringField;
    AQ415sys_date: TDateTimeField;
    AQ415quantity: TIntegerField;
    AQ415reference: TStringField;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ADOQuery1: TADOQuery;
    AQ415ABBR_NAME: TStringField;
    AQ415status: TWordField;
    AQ415rkey: TIntegerField;
    AQ415cust_code: TStringField;
    AQ415CUSTOMER_NAME: TStringField;
    N2: TMenuItem;
    Button2: TButton;
    AQ415auth_empl_ptr: TIntegerField;
    AQ415auth_date: TDateTimeField;
    n5: TMenuItem;
    AQ415qty_received: TIntegerField;
    AQ415MANU_PART_NUMBER: TStringField;
    AQ415MANU_PART_DESC: TStringField;
    ADOQuery2: TADOQuery;
    aq56: TADOQuery;
    aq56RKEY: TAutoIncField;
    aq56WO_PTR: TIntegerField;
    aq56DEPT_PTR: TIntegerField;
    aq56EMPLOYEE_PTR: TIntegerField;
    aq56STEP: TSmallintField;
    aq56QTY_BACKLOG: TFloatField;
    aq56PANELS: TIntegerField;
    aq56INTIME: TDateTimeField;
    aq56TDATE: TDateTimeField;
    aq56WTYPE: TSmallintField;
    AQ415AU_EMPLOYEE_NAME: TStringField;
    qry06: TADOQuery;
    qry06rkey: TAutoIncField;
    qry06WORK_ORDER_NUMBER: TStringField;
    qry06CUT_NO: TStringField;
    qry06PANEL_A_B: TIntegerField;
    qry06EMPLOYEE_PTR: TIntegerField;
    qry06BOM_PTR: TIntegerField;
    qry06PROD_STATUS: TSmallintField;
    qry06QUAN_SCH: TFloatField;
    qry06ENT_DATETIME: TDateTimeField;
    qry06PARTS_PER_PANEL: TFloatField;
    qry06RELEASE_DATE: TDateTimeField;
    qry06FLOW_NO: TSmallintField;
    qry06WIPMAT_STATUS: TSmallintField;
    qry06panel_ln: TFloatField;
    qry06panel_wd: TFloatField;
    qry06pnl_size: TStringField;
    qry06from_wo_ptr: TIntegerField;
    qry06BEGIN_STEP_NO: TSmallintField;
    aq56LOC_PTR: TIntegerField;
    qry06WHOUSE_PTR: TIntegerField;
    Button3: TButton;
    qry06LOT_NUMBER: TStringField;
    qry06CUTNO_WO: TStringField;
    aq56PUT_TYPE: TWordField;
    qry06wtype: TWordField;
    qry06SCH_COMPL_DATE: TDateTimeField;
    qry06RMA_PTR: TIntegerField;
    qry06REFERENCE_PTR: TIntegerField;
    AQ415v_status: TStringField;
    AQ415type: TWordField;
    AQ415v_type: TStringField;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AQ415CalcFields(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpk1Exit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure n5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private{ Private declarations }
    v_colwidth: array[0..8] of integer;
    PreColumn: TColumn;
    field_name: string;
    StartDate,EndDate:TDatetime;
    strSQLTxt:string;
    function account_maxdate:Tdatetime;  //获取最后的成本截数日期
    procedure get_maxstep(rkey25:integer;var dept_ptr,step_number:integer);
    procedure create_worknumber(long_datetime:tdatetime);
    function Get_Max_Number(strWoNO:String):string;
    function get_newwo_number(oldwo_number:string):string;
    procedure update_d60REPUT(rkey415:integer);
  public{ Public declarations }
   empl_ptr:integer;
  end;

var
  Form4: TForm4;

implementation

uses main, t_report,common,MyClass, PasQuery,Pick_Item_Single,ConstVar;

{$R *.dfm}
function TForm4.account_maxdate:Tdatetime;
begin
 with adoquery1 do
 begin
  close;
  sql.Text:='select max(fg_date) as maxdate from data0444 ';
  open;
  if not fieldbyname('maxdate').IsNull then
   result:=fieldvalues['maxdate']
  else
   result:=date()-3650;
 end;
end;

procedure TForm4.get_maxstep(rkey25:integer;var dept_ptr, step_number: integer);
begin
with adoquery2 do
begin
 close;
 sql.Text:='SELECT TOP 1 dbo.Data0038.DEPT_PTR, dbo.Data0038.STEP_NUMBER'+#13+
           'FROM dbo.Data0038 INNER JOIN'+#13+
      'dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
'WHERE (dbo.Data0038.SOURCE_PTR = '+inttostr(rkey25)+')'+#13+
      'AND (dbo.Data0034.BARCODE_ENTRY_FLAG = ''Y'')'+#13+
'ORDER BY dbo.Data0038.STEP_NUMBER DESC';
 open;
if not isempty then
 begin
  dept_ptr:=fieldvalues['DEPT_PTR'];
  step_number:= fieldvalues['STEP_NUMBER'];
 end
else
 begin
  dept_ptr:=0;
  step_number:=0;
 end;
end;
end;

function TForm4.Get_Max_Number(strWoNO:String):string;
  var
    sqlstr:string;
    AdoqryTmp:TAdoQuery;
begin
  try
    AdoqryTmp:=TAdoQuery.Create(nil);
    AdoqryTmp.Connection := ADOConnection1;
    sqlstr:='select Max(work_order_number) as F01 from data0006 where work_order_number like '''+strWoNO+'%''';
    AdoqryTmp.SQL.Clear;
    AdoqryTmp.SQL.Add(sqlstr);
    AdoqryTmp.Open;
    result := trim(AdoqryTmp.FieldByName('F01').AsString);
    AdoqryTmp.Close;
  finally
    AdoqryTmp.Free;
  end;
end;

function TForm4.get_newwo_number(oldwo_number:string): string;
var
  tmpstr,select_number:string;

  FX:Char;
begin
 FX:=UpCase(oldwo_number[length(oldwo_number)]);
 if FX in ['A'..'Z'] then //说明单号已经拆分过了
  select_number := copy(oldwo_number,1,length(oldwo_number)-1)
 else
  select_number := oldwo_number;

  tmpstr:=Get_Max_Number(select_number);  //得到当前最大的作业单编号
  FX:=UpCase(tmpstr[length(tmpstr)]);

  if FX in ['A'..'Y'] then
    Result := Copy(tmpstr,1,Length(tmpstr)-1)+succ(FX) //通过字母的ASCII码增长,来改变A,B,C赋值
  else             //如果最大作业单号最后一位是'Z',或者数据字,在最大作业单后加字母:A
    Result := tmpstr + 'A';
end;

procedure TForm4.create_worknumber(long_datetime:tdatetime);
var
 dept_ptr,step_number:integer;
begin
     dept_ptr:=0;
     step_number:=0;
     self.get_maxstep(adoquery1.FieldValues['CUST_PART_PTR'],dept_ptr,step_number);

     ADOQuery2.Close;
     adoquery2.SQL.Text:='select * from data0006'+#13+
     'where rkey='+adoquery1.Fieldbyname('WORK_ORDER_PTR').AsString;
     adoquery2.Open;
     adoquery2.Edit;
     adoquery2.FieldValues['QUAN_SCH']:=adoquery2.FieldValues['QUAN_SCH']-
                                          adoquery1.FieldValues['QUANTITY'];
     adoquery2.FieldValues['quan_prod']:=adoquery2.FieldValues['quan_prod']-
                                          adoquery1.FieldValues['QUANTITY'];
     adoquery2.Post;

     qry06.Close;
     qry06.Open;
     qry06.Append;
     qry06WORK_ORDER_NUMBER.Value:=
        self.get_newwo_number(ADOQuery2.fieldbyname('WORK_ORDER_NUMBER').AsString);
     qry06CUT_NO.Value:=ADOQuery2.FieldValues['cut_no'];
     qry06BEGIN_STEP_NO.Value:=step_number;
     qry06PANEL_A_B.Value:=ADOQuery2.FieldValues['PANEL_A_B'];
     qry06EMPLOYEE_PTR.Value:=Self.empl_ptr;      //发放人员05.rkey
     qry06BOM_PTR.Value:=ADOQuery1.FieldValues['CUST_PART_PTR'];
     qry06PROD_STATUS.Value:=5;                  //待入库
     qry06QUAN_SCH.Value:=adoquery1.FieldValues['QUANTITY'];
     qry06ENT_DATETIME.Value:=long_datetime;
     qry06PARTS_PER_PANEL.Value:=ADOQuery2.FieldValues['PARTS_PER_PANEL'];
     qry06RELEASE_DATE.Value:=long_datetime;
     qry06FLOW_NO.Value:=1;            //0:投产１:拆分新增
     qry06WIPMAT_STATUS.Value:=1;      //内层已分配
     qry06wtype.Value:=3;              //创建返工批次作业单
     qry06panel_ln.Value := ADOQuery2.FieldValues['panel_ln'];
     qry06panel_wd.Value := ADOQuery2.FieldValues['panel_wd'];
     qry06pnl_size.Value := ADOQuery2.FieldValues['pnl_size'];
     qry06from_wo_ptr.Value := ADOQuery2.FieldValues['rkey'];
// qry06RMA_PTR.Value := ADOQuery2.FieldValues['rkey']; //从那一作业单创建,正常重检拆分时不变，方便计算带入成本
     qry06REFERENCE_PTR.Value := ADOQuery1.FieldValues['rkey']; //库存53指针，代表从那一批次库存创建
     qry06WHOUSE_PTR.Value := adoquery1.FieldValues['WHSE_PTR'];
     qry06CUTNO_WO.Value := ADOQuery2.Fieldbyname('CUTNO_WO').AsString;
     if ADOQuery2.Fieldbyname('SCH_COMPL_DATE').AsVariant<>null then
     qry06SCH_COMPL_DATE.Value :=ADOQuery2.Fieldbyname('SCH_COMPL_DATE').AsDateTime;
     qry06.Post;

     aq56.Append;
     aq56WO_PTR.Value:=qry06rkey.Value;
     aq56DEPT_PTR.Value:=dept_ptr;
     aq56EMPLOYEE_PTR.Value:=empl_ptr;
     aq56STEP.Value:=step_number;
     aq56QTY_BACKLOG.Value:=ADOQuery1.FieldValues['QUANTITY'];
     aq56PANELS.Value:= 0;
     aq56INTIME.Value:=long_datetime;
     aq56TDATE.Value:=long_datetime;
     aq56PUT_TYPE.Value:=step_number; //正常重检
     aq56WTYPE.Value:=0;
     aq56LOC_PTR.Value:= ADOQuery1.FieldValues['WHSE_PTR'];
     aq56.Post;

     ADOQuery2.close;
     ADOQuery2.SQL.Text:='SELECT SOURCE_PTR, SOURCE_TYPE, EMPL_PTR, TDATE,'+#13+
               '[ACTION], Remark FROM Data0117'+#13+
               'where rkey is null';
     ADOQuery2.open;
     ADOQuery2.AppendRecord([qry06rkey.Value,2,
                            self.empl_ptr,
                            long_datetime,
                            4,'正常重检创建部份在线库存作业单:'+
                            ADOQuery1.FieldByName('QUANTITY').AsString]);

     ADOQuery2.close;
     ADOQuery2.SQL.Text:='SELECT SOURCE_PTR, SOURCE_TYPE, EMPL_PTR, TDATE,'+#13+
               '[ACTION], Remark FROM Data0117'+#13+
               'where rkey is null';
     ADOQuery2.open;
     ADOQuery2.AppendRecord([ADOQuery1.FieldValues['WORK_ORDER_PTR'],2,
                            self.empl_ptr,
                            long_datetime,
                            4,'正常重检减少在线作业单投产完工数量:'+
                            ADOQuery1.FieldByName('QUANTITY').AsString]);

     ADOQuery2.close;
     ADOQuery2.SQL.Text:='SELECT WHSE_PTR, LOC_PTR, WORK_ORDER_PTR, CUST_PART_PTR,'+#13+
               'QUANTITY, MFG_DATE,RMA_PTR,EMPLOYEE_PTR,DEPT_PTR FROM Data0053'+#13+
               'where rkey is null';
     ADOQuery2.open;
     ADOQuery2.AppendRecord([ADOQuery1.FieldValues['WHSE_PTR'],
                             ADOQuery1.FieldValues['LOC_PTR'],
                             ADOQuery1.FieldValues['WORK_ORDER_PTR'],
                             ADOQuery1.FieldValues['CUST_PART_PTR'],
                             -ADOQuery1.FieldValues['QUANTITY'],
                            long_datetime,
                            2,
                            self.empl_ptr,
                            ADOQuery1.FieldValues['rkey']]);   //从原来那个库存批次重检53.rkey
end;

procedure TForm4.FormShow(Sender: TObject);
var
 i:byte;

begin
if ADOConnection1.Connected then
 begin

//2014-11-18tang----
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  strSQLTxt:=AQ415.SQL.Text;
  StartDate:=getsystem_date(ADOQuery1,1)-30;
  EndDate:=getsystem_date(ADOQuery1,1);
  field_name := dbgrid1.Columns[0].FieldName;
  PreColumn := dbgrid1.Columns[0];
  dbgrid1.Columns[0].Title.Color := clred ;
  Label1.Caption:=preColumn.Title.Caption;
  AQ415.Close;
  AQ415.Parameters.ParamByName('dtpk1').Value:=StrToDateTime(formatdatetime('yyyy-MM-dd',StartDate)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm1.Time));
  AQ415.Parameters.ParamByName('dtpk2').Value:=StrToDateTime(formatdatetime('yyyy-MM-dd',EndDate)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm2.Time));
  AQ415.Open;
//end tang-----------

//  dtpk2.Date := strtodate(datetostr(long_datetime));  //2014-11-18tang----
//  dtpk1.Date := dtpk2.Date-30;

  with adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    self.empl_ptr := fieldvalues['employee_ptr'];
   end;
  dtpk1exit(sender);
  for i:=0 to 8 do v_colwidth[i]:=dbgrid1.Columns[i].Width;
 end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm4.AQ415CalcFields(DataSet: TDataSet);
begin
//2014-11-18tang修改注释-------------------

//if self.AQ415type.Value=1 then
// AQ415v_type.Value:='直接出仓'
//else
//if self.AQ415type.Value=2 then
// AQ415v_type.Value:='委外退货'
//else
//if self.AQ415type.Value=3 then
// AQ415v_type.Value:='退货重检'
//else
//if self.AQ415type.Value=4 then
// AQ415v_type.Value:='正常重检';

//end 2014-11-18tang修改注释-------------------
end;

procedure TForm4.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 8 do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-800)*v_colwidth[i]/720);
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly=true) and
    (column.FieldName<>self.field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := Column;
  edit1.SetFocus;
  self.AQ415.Sort:=column.FieldName;
 end;

end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(aq415.SQL.Text);
end;

procedure TForm4.dtpk1Exit(Sender: TObject);
begin
//2014-11-18tang修改注释-------------------
// aq415.Close;
// aq415.Parameters[0].Value := dtpk1.Date;
// aq415.Parameters[1].Value := dtpk2.Date+1;
// aq415.Open;
end;

procedure TForm4.RadioGroup1Click(Sender: TObject);
begin
//2014-11-18tang修改注释-------------------
//if radiogroup1.ItemIndex<>4 then
// begin
//  with aq415 do
//  begin
//   close;
//   sql.Delete(sql.Count-2);
//   sql.Insert(sql.Count-1,'and data0415.type='+inttostr(radiogroup1.ItemIndex+1));
//   open;
//  end;
// end
//else
// begin
//  with aq415 do
//  begin
//   close;
//   sql.Delete(sql.Count-2);
//   sql.Insert(sql.Count-1,'');
//   open;
//  end;
// end;
end;

procedure TForm4.N3Click(Sender: TObject);
begin
form1:=tform1.Create(application);

 form1.ADO415.Close;
 form1.ADO415.Parameters[0].Value := self.AQ415rkey.Value;
 form1.ADO415.Open;
 if form1.ADO415type.Value=3 then   //退货重检
 begin
  form1.edit3.Visible:=true;
  form1.label3.Visible:=true;
 end;

 form1.BitBnpost.Enabled := false;
 form1.edit4.ReadOnly := true;
 form1.edit6.Enabled := false;
 form1.ShowModal;
form1.Free;
end;

procedure TForm4.Button2Click(Sender: TObject);
var
 rkey415:integer;
begin
 rkey415:=self.AQ415rkey.Value;
 AQ415.Close;
 AQ415.Open;
 if rkey415>0 then  AQ415.Locate('rkey',rkey415,[]);
end;

procedure TForm4.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (self.AQ415status.Value = 2) then
  DBGrid1.Canvas.Font.Color := cllime;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
 if not AQ415.IsEmpty then n3click(sender);
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 self.AQ415.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
else
 self.AQ415.Filter:='';
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
if aq415.IsEmpty then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
 end
else
 begin
  if self.AQ415status.Value=2 then//待审核
   begin
    n1.Enabled:=true;
    n2.Enabled:=false;
    n4.Enabled:=true;
    n5.Enabled:=false;
   end
  else //已出仓 or 已重检 3,4,5
   begin
    n1.Enabled:=false;
    if (AQ415status.Value=4) or (AQ415status.Value=5) then  //已重检
     n2.Enabled:=false  //取消审核
    else
     n2.Enabled:=true;
    n4.Enabled:=false;
    n5.Enabled:=true;
   end;
  n3.Enabled:=true;
 end;
end;

procedure TForm4.update_d60REPUT(rkey415: integer);
var
  lsql:string;
begin
   with adoquery2 do      //修改销售订单已提交入库数量
    begin
     LSql := ' update data0060 set REPUT_APPR_BY = REPUT_APPR_BY - t1.allqty ' +
              ' from data0060 d60 inner join' +
              ' (select d53.barcode_ptr,sum(d465.QUANTITY) as allqty ' +
              ' from data0465 d465 inner join ' +
              ' data0053 d53 on d465.d0053_ptr = d53.rkey inner join ' +
              ' Data0006 ON  d53.WORK_ORDER_PTR = Data0006.RKEY '+
              ' where d465.heard_ptr = ' + inttostr(rkey415) +
              ' group by d53.barcode_ptr) t1 on d60.rkey = t1.barcode_ptr';

     close;
     sql.Clear;
     SQL.Add(LSql);
     ExecSQL;
    end;
end;

procedure TForm4.N1Click(Sender: TObject);
var
 long_datetime:tdatetime;

begin
 if (strtoint(vprev) = 1) or (strtoint(vprev) = 3)  then
 begin
  ShowMsg('您只有只读权限!',1);
  exit;
 end;
 
if IS_FG_counting then
 begin
  ShowMsg('成品正在盘点,不能做审核出仓!',1);
  exit;
 end;

if (AQ415type.Value=4) and (IS_Stock_Inventorying)  then   //如果在制品正在盘点
 begin
  ShowMsg('在制品正在盘点,不能做正常重检增加在线数量!',1);
  exit;
 end;

with self.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Text:='select status from data0415 where rkey='+self.AQ415rkey.AsString+
            ' and status='+self.AQ415status.AsString;
  open;
  if isempty then
   begin
    ShowMsg('出仓单号状态发生变化,可能多人同时操作,操作失败!',1);
    exit;
   end;
 end;

 if (strtoint(vprev) = 4) and (AQ415type.Value <> 4)  then  //权限为４非正常正检不能操作
 begin
  ShowMsg('您没有非正常重检审核的权限!',1);
  exit;
 end;

 if (strtoint(vprev)=2) and (AQ415type.Value=4) then   //权限为2正常重检不能操作
 begin
  ShowMsg('您没有正常重检审核的权限!',1);
  exit;
 end;

try
 self.ADOConnection1.BeginTrans;
 aq415.Edit;
 self.AQ415auth_empl_ptr.Value:=self.empl_ptr;
 self.AQ415auth_date.Value:=getsystem_date(self.ADOQuery1,0);
 aq415status.Value:=3;
 if self.AQ415type.Value=4 then  //正常重检
  self.AQ415qty_received.Value:=self.AQ415quantity.Value;
 aq415.Post;
 long_datetime:=self.AQ415auth_date.Value;
 with adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0053');
   sql.Add('set qty_alloc=qty_alloc-data0465.QUANTITY,'); //更新53库存
   sql.Add('QTY_ON_HAND=QTY_ON_HAND-data0465.QUANTITY');
   sql.Add('from data0465,data0053');
   sql.Add('where data0465.d0053_ptr=data0053.rkey');
   sql.Add('and data0465.heard_ptr='+self.AQ415rkey.AsString);
   ExecSQL;
  end;

 with adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0025');                         //更新25库存
   sql.Add('set qty_on_hand=qty_on_hand-data0415.quantity');
   sql.Add('from data0025,data0415');
   sql.Add('where data0415.custpart_ptr=data0025.rkey');
   sql.Add('and data0415.rkey='+self.AQ415rkey.AsString);
   ExecSQL;
  end;

 if self.AQ415type.Value=4 then              //正常重检直接增加在线数量
 begin
 { with adoquery1 do
  begin
   close;
   sql.Text:=
   'SELECT   dbo.Data0053.WORK_ORDER_PTR, dbo.Data0053.CUST_PART_PTR,'+#13+
   'dbo.Data0053.WHSE_PTR, dbo.Data0053.LOC_PTR,'+#13+
   'SUM(dbo.Data0465.QUANTITY) AS QUANTITY,'+#13+
   'SUM(FLOOR(dbo.Data0465.QUANTITY / dbo.Data0006.PARTS_PER_PANEL)) AS panels'+#13+
   'FROM         dbo.Data0465 INNER JOIN'+#13+
   'dbo.Data0053 ON dbo.Data0465.D0053_PTR = dbo.Data0053.RKEY INNER JOIN'+#13+
   'dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY '+#13+
   'WHERE (dbo.Data0465.heard_ptr ='+aq415rkey.AsString+')'+#13+
   ' and (data0465.ttype =0)'+#13+   //出仓的库存没有进行成本核算记录
   'GROUP BY Data0053.WORK_ORDER_PTR,'+#13+
   'Data0053.CUST_PART_PTR, Data0053.WHSE_PTR, Data0053.LOC_PTR';
   open;

   while not eof do
   begin
    aq56.Close;
    aq56.Parameters.ParamValues['rkey06']:=FieldValues['WORK_ORDER_PTR'];
    aq56.Open;
   if aq56.IsEmpty then   //作业单无在线记录
    begin
     dept_ptr:=0;
     step_number:=0;
     self.get_maxstep(FieldValues['CUST_PART_PTR'],dept_ptr,step_number);
     aq56.Append;
     aq56WO_PTR.Value:=FieldValues['WORK_ORDER_PTR'];
     aq56DEPT_PTR.Value:=dept_ptr;
     aq56EMPLOYEE_PTR.Value:=empl_ptr;
     aq56STEP.Value:=step_number;
     aq56QTY_BACKLOG.Value:=FieldValues['QUANTITY'];
     aq56PANELS.Value:= FieldValues['panels'];
     aq56INTIME.Value:=long_datetime;
     aq56TDATE.Value:=long_datetime;
     aq56PUT_TYPE.Value:=step_number; //正常重检返工投产
     aq56WTYPE.Value:=0;           //不在返工中
     aq56LOC_PTR.Value:= FieldValues['WHSE_PTR'];
     aq56.Post;

     ADOQuery2.Close;
     adoquery2.SQL.Text:='select prod_status,quan_prod,wtype from data0006'+#13+
     'where rkey='+Fieldbyname('WORK_ORDER_PTR').AsString;
     adoquery2.Open;
     adoquery2.Edit;
     adoquery2.FieldValues['prod_status']:=5;//将出仓的作业单状态改为待入仓
     adoquery2.FieldValues['quan_prod']:=adoquery2.FieldValues['quan_prod']-
                                          FieldValues['QUANTITY'];
     adoquery2.Post;

     ADOQuery2.close;
     ADOQuery2.SQL.Text:='SELECT SOURCE_PTR, SOURCE_TYPE, EMPL_PTR, TDATE,'+#13+
               '[ACTION], Remark FROM Data0117'+#13+
               'where rkey is null';
     ADOQuery2.open;
     ADOQuery2.AppendRecord([FieldValues['WORK_ORDER_PTR'],2,
                            self.empl_ptr,
                            long_datetime,
                            4,'正常重检恢复作业单:'+aq56QTY_BACKLOG.AsString]);

     ADOQuery2.close;
     ADOQuery2.SQL.Text:='SELECT WHSE_PTR, LOC_PTR, WORK_ORDER_PTR, CUST_PART_PTR,'+#13+
               'QUANTITY, MFG_DATE,RMA_PTR,EMPLOYEE_PTR FROM Data0053'+#13+
               'where rkey is null';
     ADOQuery2.open;
     ADOQuery2.AppendRecord([FieldValues['WHSE_PTR'],
                             FieldValues['LOC_PTR'],
                             FieldValues['WORK_ORDER_PTR'],
                             FieldValues['CUST_PART_PTR'],
                             -aq56QTY_BACKLOG.Value,
                            long_datetime,
                            2,
                            self.empl_ptr]);
    end
   else
   if aq56PUT_TYPE.Value > 0  then   //作业单有在线的返工记录
    begin
     aq56.Edit;
     aq56QTY_BACKLOG.Value:=aq56QTY_BACKLOG.Value+FieldValues['QUANTITY'];
     aq56PANELS.Value:= aq56PANELS.Value+FieldValues['panels'];
     aq56TDATE.Value:=long_datetime;
     aq56.Post;

     ADOQuery2.Close;
     adoquery2.SQL.Text:='select prod_status,quan_prod from data0006'+#13+
     'where rkey='+Fieldbyname('WORK_ORDER_PTR').AsString;
     adoquery2.Open;
     adoquery2.Edit;
     adoquery2.FieldValues['quan_prod']:=adoquery2.FieldValues['quan_prod']-
                                          FieldValues['QUANTITY'];
     adoquery2.Post;

     ADOQuery2.close;
     ADOQuery2.SQL.Text:='SELECT SOURCE_PTR, SOURCE_TYPE, EMPL_PTR, TDATE,'+#13+
               '[ACTION], Remark FROM Data0117'+#13+
               'where rkey is null';
     ADOQuery2.open;
     ADOQuery2.AppendRecord([FieldValues['WORK_ORDER_PTR'],2,
                            self.empl_ptr,
                            long_datetime,
                            4,'正常重检增加在线返工作业单数量:'+
                            FieldByName('QUANTITY').AsString]);

     ADOQuery2.close;
     ADOQuery2.SQL.Text:='SELECT WHSE_PTR, LOC_PTR, WORK_ORDER_PTR, CUST_PART_PTR,'+#13+
               'QUANTITY, MFG_DATE,RMA_PTR,EMPLOYEE_PTR FROM Data0053'+#13+
               'where rkey is null';
     ADOQuery2.open;
     ADOQuery2.AppendRecord([FieldValues['WHSE_PTR'],
                             FieldValues['LOC_PTR'],
                             FieldValues['WORK_ORDER_PTR'],
                             FieldValues['CUST_PART_PTR'],
                             -FieldValues['QUANTITY'],
                            long_datetime,
                            2,
                            self.empl_ptr]);
    end
   else    //创建新的工单 (作业单有在线正常生产状态记录,返工的不能混在一起)
    begin
      self.create_worknumber(long_datetime);
    end;
   next;
  end;
  end;     }//with adoquery1 end  正常重检的库存产品，还没有进行成本截数核算
   //=========================================================================
  with adoquery1 do    //正常重检的库存产品，已经有进行成本截数核算
  begin
   close;
   sql.Text:=
   'SELECT  data0053.rkey,dbo.Data0053.WORK_ORDER_PTR, dbo.Data0053.CUST_PART_PTR,'+#13+
   'dbo.Data0053.WHSE_PTR, dbo.Data0053.LOC_PTR,'+#13+
   'dbo.Data0465.QUANTITY,data0006.WORK_ORDER_NUMBER'+#13+
   'FROM    dbo.Data0465 INNER JOIN'+#13+
   'dbo.Data0053 ON dbo.Data0465.D0053_PTR = dbo.Data0053.RKEY INNER JOIN'+#13+
   'dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY '+#13+
   'WHERE (dbo.Data0465.heard_ptr ='+aq415rkey.AsString+')';
//   'and (data0465.ttype =1)'+#13+              //出仓的库存已经进行成本核算记录
//   'GROUP BY Data0053.WORK_ORDER_PTR,'+#13+
//   'Data0053.CUST_PART_PTR, Data0053.WHSE_PTR, Data0053.LOC_PTR';
   open;
   while not eof do
   begin
     aq56.Close;
     aq56.Parameters.ParamValues['rkey06']:=FieldValues['WORK_ORDER_PTR'];
     aq56.Open;
     Self.create_worknumber(long_datetime);
     Next;
   end;
  end;

  with adoquery2 do
   begin
    close;
    sql.Text:= 'update data0492'+#13+
      'set data0492.FG_QTY=data0492.FG_QTY - d1.quantity,'+#13+
      'data0492.WIP_QTY=data0492.WIP_QTY + d1.quantity'+#13+
      'FROM dbo.data0492 INNER JOIN'+#13+
      '(SELECT Data0006.CUT_NO, SUM(dbo.Data0465.QUANTITY) AS quantity'+#13+
           'FROM Data0465 INNER JOIN Data0053 ON'+#13+
           'Data0465.D0053_PTR = Data0053.RKEY INNER JOIN'+#13+
           'Data0006 ON Data0053.WORK_ORDER_PTR = Data0006.RKEY'+#13+
           'where  Data0465.heard_ptr=' +aq415rkey.AsString+#13+
           'GROUP BY Data0006.CUT_NO) d1'+#13+
           'ON dbo.data0492.CUT_NO = d1.CUT_NO';
    ExecSQL;
   end;

  self.update_d60REPUT(AQ415rkey.Value);   //更新销售订单60表的提交入库数量

 end   //正常重检END
else
 if self.AQ415type.Value=3 then    //退货重检
 begin
  self.update_d60REPUT(AQ415rkey.Value);
 end;

 ADOConnection1.CommitTrans;
 if messagedlg('是否打印出仓单?',mtconfirmation,[mbyes,mbno],0)=mryes then
  n5click(sender);
except

 on E: Exception do
  begin
   ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
   ShowMsg('出错单号:'+ADOQuery1.FieldByName('WORK_ORDER_NUMBER').AsString,1);

  end;
end;
end;

procedure TForm4.N2Click(Sender: TObject);
begin
 if (strtoint(vprev) = 1) or (strtoint(vprev) = 3)  then
 begin
  ShowMsg('您只有只读权限!',1);
  exit;
 end;

 if IS_FG_counting then
 begin
  ShowMsg('成品正在盘点,不能做取消审核!',1);
  exit;
 end;

 if account_maxdate > AQ415auth_date.Value then
 begin
  ShowMsg('选择的出仓日期已小于成本核算日期,不能取消!',1);
  exit;
 end;

 with self.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Text:='select status from data0415 where rkey='+self.AQ415rkey.AsString;
  open;
  if not isempty then
  if fieldbyname('status').AsInteger<>self.AQ415status.Value then
   begin
    ShowMsg('出仓单号状态发生变化,可能多人同时操作,操作失败!',1);
    exit;
   end;
 end;

if (self.AQ415qty_received.Value<>0) then
 showmessage('不能被取消了,该批出仓已被返工或已被MRB处理!')
else
begin
 aq415.Edit;
 self.AQ415auth_empl_ptr.AsVariant:=NULL;
 self.AQ415auth_date.AsVariant:=NULL;
 aq415status.Value:=2;
 aq415.Post;
 with adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0053');
   sql.Add('set qty_alloc=qty_alloc+data0465.QUANTITY,');
   sql.Add('QTY_ON_HAND=QTY_ON_HAND+data0465.QUANTITY');
   sql.Add('from data0465,data0053');
   sql.Add('where data0465.d0053_ptr=data0053.rkey');
   sql.Add('and data0465.heard_ptr='+self.AQ415rkey.AsString);
   ExecSQL;
  end;

 with adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0025');                         //更新25库存
   sql.Add('set qty_on_hand=qty_on_hand+data0415.quantity');
   sql.Add('from data0025,data0415');
   sql.Add('where data0415.custpart_ptr=data0025.rkey');
   sql.Add('and data0415.rkey='+self.AQ415rkey.AsString);
   ExecSQL;
  end;

end;
end;

procedure TForm4.N4Click(Sender: TObject);
var
 str:string;
begin
 if (strtoint(vprev) = 1) or (strtoint(vprev) = 3)  then
 begin
  ShowMsg('您只有只读权限!',1);
  exit;
 end;

with self.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Text:='select status from data0415 where rkey='+self.AQ415rkey.AsString;
  open;
  if not isempty then
  if fieldbyname('status').AsInteger<>self.AQ415status.Value then
   begin
    ShowMsg('出仓单号状态发生变化,可能多人同时操作,操作失败!',1);
    exit;
   end;
 end;

if inputquery('退回原因','请输入退回原因:',str) then
 begin
  aq415.Edit;
  self.AQ415auth_empl_ptr.Value:=self.empl_ptr;
  self.AQ415auth_date.Value:=getsystem_date(ADOQuery1,1);
  aq415status.Value:=5;
  AQ415reference.Value:=str;
  aq415.Post;
 end;
end;

procedure TForm4.n5Click(Sender: TObject);
begin
  form_trp:=tform_trp.Create(application);
  form_trp.AQ415.Close;
  form_trp.AQ415.Parameters[0].Value:=self.AQ415rkey.Value;
  form_trp.AQ415.Open;
  form_trp.AQ465.Close;
  form_trp.AQ465.Parameters[0].Value:=self.AQ415rkey.Value;
  form_trp.Aq465.Open;
  form_trp.ppReport1.Reset;
  form_trp.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'Tout_warehoue.rtm';
  form_trp.ppReport1.Template.LoadFromFile;
  form_trp.ppReport1.SaveAsTemplate:=false;
  form_trp.ppReport1.Print;
  form_trp.AQ415.Close;
  form_trp.AQ415.Open;
  form_trp.Free;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 if not app_init_2(self.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;

//  rkey73:='1';
//  vprev:='4';

  MyDataClass :=TMyDataClass.Create(ADOConnection1);
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  self.field_name := 'number';
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
 MyDataClass.Free;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  form_trp:=tform_trp.Create(application);
  form_trp.ppReport1.Reset;
  form_trp.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'Tout_warehoue.rtm';
  form_trp.ppReport1.Template.LoadFromFile;
  form_trp.ppReport1.SaveAsTemplate:=false;
  Form_trp.ppDesigner1.ShowModal;
  Form_trp.Free;
end;

procedure TForm4.Button4Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if StartDate > 100 then
    FrmQuery.DateTimePicker1.Date:= StartDate
  else
    FrmQuery.DateTimePicker1.Date:=getsystem_date(ADOQuery1,1)-1;
  if EndDate > 100 then
    FrmQuery.DateTimePicker2.Date:= EndDate
  else
    FrmQuery.DateTimePicker2.Date:=getsystem_date(ADOQuery1,1);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iIndex;
  Sqlstr:='';
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;
    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      AQ415.DisableControls;
      AQ415.Close;
      AQ415.SQL.Clear;
      AQ415.SQL.Text:=strSQLTxt+' '+Sqlstr+' order by data0415.number';
      AQ415.Parameters.ParamByName('dtpk1').Value:=StrToDateTime(formatdatetime('yyyy-MM-dd',FrmQuery.DateTimePicker1.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm1.Time));
      AQ415.Parameters.ParamByName('dtpk2').Value:=StrToDateTime(formatdatetime('yyyy-MM-dd',FrmQuery.DateTimePicker2.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm2.Time));
      StartDate:=FrmQuery.DateTimePicker1.Date;
      EndDate:=FrmQuery.DateTimePicker2.Date;
      AQ415.Prepared;
      AQ415.Open;
    finally
      AQ415.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;



end.
