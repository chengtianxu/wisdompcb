unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus;

type
  Tfm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    eh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    precolumn:Tcolumneh;
    sql_text:string;
    v_colwidth: array[0..8] of integer;
    procedure append_415(v_type:byte);
    procedure enter_detail;
    function set_lock:boolean;
  public
    { Public declarations }
  end;

var
  fm_main: Tfm_main;

implementation

uses damo,common, condition, detail, DB;

{$R *.dfm}

procedure Tfm_main.append_415(v_type: byte);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
     messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else
  begin
    fm_detail := Tfm_detail.Create(application);
    fm_detail.ttype:=v_type;
    fm_detail.v_modal:=1;   //新增
    dm.AQ04.Close;
    dm.AQ04.Open;
    if dm.aq04seed_flag.Value<>1 then
    begin
      fm_detail.MaskEdit1.Text:=dm.AQ04SEED_VALUE.Value;
      if dm.AQ04SEED_FLAG.Value=4 then
      fm_detail.maskedit1.Enabled := false;
    end;
    fm_detail.Edit2.Text:=datetimetostr(now);
    case v_type of
      1:fm_detail.edit1.Text:='直接出仓';
      2:fm_detail.edit1.Text:='委外退货';
      3:
      begin
        fm_detail.edit1.Text:='退货重检';
        fm_detail.BitBtn3.Visible:=true;
        fm_detail.Edit7.Visible:=true;
        fm_detail.Label10.Visible:=true;
      end;
      4:fm_detail.edit1.Text:='正常重检';
    end;
    if fm_detail.ShowModal=mrok then
    begin
      dm.ADS415.Close;
      dm.ADS415.Open;
      dm.ADS415.Locate('rkey',dm.AQ415rkey.Value,[]);
    end;
    fm_detail.Free;
  end;
end;

procedure Tfm_main.enter_detail;
begin
  fm_detail.MaskEdit1.Text:=dm.ADS415number.Value;
  fm_detail.Edit2.Text:=dm.ADS415.fieldbyname('sys_date').AsString;
  fm_detail.Edit3.Text:=dm.ADS415cust_code.Value;
  fm_detail.label4.Caption:=dm.ADS415customer_name.Value;
  fm_detail.Edit4.Text:=dm.ADS415manu_part_number.Value;
  fm_detail.label5.Caption:=dm.ADS415manu_part_desc.Value;
  fm_detail.Edit5.Text:=dm.ADS415reference.Value;
  fm_detail.Edit6.Text:=dm.ADS415.fieldbyname('quantity').AsString;
  fm_detail.Edit1.Text:=dm.ADS415v_type.value;
  fm_detail.rkey25:=dm.ADS415d25rkey.Value;
  fm_detail.Edit3.Enabled:=false;
  fm_detail.Edit4.Enabled:=false;
  fm_detail.BitBtn1.Enabled:=false;
  fm_detail.BitBtn2.Enabled:=false;

   dm.AQ04.Close;
   dm.AQ04.Open;
   if dm.AQ04SEED_FLAG.Value=4 then
     fm_detail.maskedit1.Enabled := false;

  fm_detail.BitBtn3.Enabled:=false;
  if (dm.ADS415type.Value=3) and (dm.ADS415rma_ptr.Value>0) then
  with dm.aqtmp do
  begin
   close;
   sql.Text:='select rkey,RMA_NUMBER  from data0098 where rkey='+dm.Ads415rma_ptr.AsString;
   open;
   fm_detail.edit7.Text:=fieldbyname('rma_number').AsString;
  end;

  with dm.aqtmp do
  begin
   close;
   sql.Text:='SELECT D06.WORK_ORDER_NUMBER as wo_number,D15.ABBR_NAME as whouse,'+
    'd16.location,D53.REFERENCE_NUMBER as place,d465.quantity,d465.reference,d53.RKEY,d465.rkey as d465rkey '+
    'FROM Data0465 d465 inner join Data0053 d53 on d465.d0053_ptr=d53.rkey '+
    'inner join Data0015 d15 on D53.WHSE_PTR=D15.RKEY '+
    'inner join Data0016 d16 on D53.LOC_PTR=D16.RKEY '+
    'left outer join Data0006 d06 on D53.WORK_ORDER_PTR=D06.RKEY '+
    'WHERE D465.heard_PTR='+dm.ADS415rkey.AsString+
    ' Order by D465.rkey ';
   open;
   while not Eof do
   begin
    fm_detail.sg1.Cells[0,fm_detail.sg1.RowCount-1]:=Fieldbyname('wo_number').AsString;
    fm_detail.sg1.Cells[1,fm_detail.sg1.RowCount-1]:=FieldValues['whouse'];
    fm_detail.sg1.Cells[2,fm_detail.sg1.RowCount-1]:=FieldValues['location'];
    fm_detail.sg1.Cells[3,fm_detail.sg1.RowCount-1]:=Fieldbyname('place').AsString;
    fm_detail.sg1.Cells[5,fm_detail.sg1.RowCount-1]:=Fieldbyname('quantity').AsString;
    fm_detail.sg1.Cells[6,fm_detail.sg1.RowCount-1]:=Fieldbyname('reference').AsString; //备注
    fm_detail.sg1.Cells[7,fm_detail.sg1.RowCount-1]:=Fieldbyname('RKEY').AsString; //库存rkey53
    fm_detail.sg1.Cells[8,fm_detail.sg1.RowCount-1]:=Fieldbyname('quantity').AsString; //存放原始出仓数量，编辑保存时判断用
    //以下填入库存待分配仓数量
    dm.aqtmp1.Close;
    dm.aqtmp1.SQL.text:='select qty_on_hand-qty_alloc as qty_aval from data0053 '+
      'where rkey='+Fieldbyname('RKEY').AsString;
    dm.aqtmp1.Open;
    fm_detail.sg1.Cells[4,fm_detail.sg1.RowCount-1]:=inttostr(dm.aqtmp1.FieldValues['qty_aval']+fieldvalues['quantity']);
    fm_detail.sg1.RowCount:=fm_detail.sg1.RowCount+1;
    next;
   end;
  end;
  
  if fm_detail.ShowModal=mrok then
  begin
   dm.ADS415.Close;
   dm.ADS415.Open;
   dm.ADS415.Locate('rkey',dm.AQ415rkey.Value,[]);
  end;

  with dm.aqtmp do
  begin
   Close;
   SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d415'')'+#13+
     ' select rkey from ##d415 where rkey='+dm.ADS415.fieldbyname('rkey').AsString+#13+
     ' else select top 0 * from data0415 ';
   Open;
   if not isempty then delete;
  end;
end;

function Tfm_main.set_lock:boolean;
begin
 result:=false;
  with dm.aqtmp do
  begin
   Close;
   SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d415'')'+#13+
     ' select rkey from ##d415 where rkey='+dm.ADS415.fieldbyname('rkey').AsString+#13+
     ' else select top 0 * from data0415 ';
   Open;
   if not isempty then
   begin
    messagedlg('当前出仓记录被其它用户锁定，无法编辑！',mtwarning,[mbok],0);
    exit;
   end
   else
   begin
    close;
    SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d415'')'+#13+
      ' begin set identity_insert ##d415 on '+#13+
      ' insert ##d415(rkey) values( '''+dm.ADS415.fieldbyname('rkey').AsString+''') '+
      ' set identity_insert ##d415 off end '+#13+
      ' else select rkey into ##d415 from data0415 where rkey='''+dm.ADS415.fieldbyname('rkey').AsString+'''';
    execsql;
    result:=true;
   end;
  end;
end;

procedure Tfm_main.FormCreate(Sender: TObject);
begin
 if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败，请与系统管理员联系！',1);
  application.Terminate;
 end;
{  
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  vprev:='4';
  user_ptr:='943';  }

 self.Caption:=application.Title;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

 sql_text:=dm.ads415.CommandText;  //记录ads10默认sql语句
 precolumn:=eh1.Columns[0]; //给precolumn赋初始值
end;

procedure Tfm_main.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure Tfm_main.BitBtn3Click(Sender: TObject);
var rkey415:integer;
begin
 if dm.ADS415.Active then
 begin
   rkey415:=dm.ADS415rkey.Value;
   dm.ADS415.Close;
   dm.ADS415.Open;
   if rkey415>0 then dm.ADS415.Locate('rkey',rkey415,[]);
 end;
end;

procedure Tfm_main.BitBtn4Click(Sender: TObject);
var i:byte;
begin
  if fm_condition.ShowModal=mrok then
  with dm.ads415 do
  begin
    close;
    commandtext:=sql_text; //恢复默认语句
    for i:=1 to fm_condition.SGrid1.RowCount-1 do
      CommandText:=CommandText+fm_condition.SGrid1.cells[2,i];
    parameters.ParamByName('dtpk1').Value:=fm_condition.dtpk1.Date;
    parameters.ParamByName('dtpk2').Value:=fm_condition.dtpk2.Date+1;    
    open;
  end;
end;

procedure Tfm_main.BitBtn2Click(Sender: TObject);
begin
 if not dm.ADS415.IsEmpty then
  export_dbgrideh_to_excel(eh1,'产品特殊出仓－数据导出'); 
end;

procedure Tfm_main.eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
   showmessage(dm.ADS415.CommandText); 
end;

procedure Tfm_main.eh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
   begin
    column.Title.SortMarker:=smdowneh;
    dm.ads415.IndexFieldNames:=column.FieldName+' DESC';
   end
  else
   begin
    column.Title.SortMarker:=smupeh;
    dm.ads415.IndexFieldNames:=column.FieldName;
   end;

  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
   begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit1.Text:='';
   end;
  edit1.SetFocus;
end;

procedure Tfm_main.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dm.ads415.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else dm.ads415.Filter:='';
end;

procedure Tfm_main.FormShow(Sender: TObject);
var i:byte;
begin
 for i:=0 to 8 do v_colwidth[i]:=eh1.Columns[i].Width;
 dm.ADS415.Parameters.ParamByName('dtpk1').Value:=datetostr(now-5);
 dm.ADS415.Parameters.ParamByName('dtpk2').Value:=datetostr(now+1);
 dm.ADS415.Open;
end;

procedure Tfm_main.FormResize(Sender: TObject);
var i:byte;
begin
for i:=0 to 8 do
  eh1.Columns[i].Width:=v_colwidth[i]+round((eh1.Width-738)*v_colwidth[i]/713);
end;

procedure Tfm_main.eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if (dm.ADS415status.Value = 1) then //未提交
  eh1.Canvas.Font.Color := cllime //clgreen 
 else if dm.ADS415status.Value = 5 then  //被退回
  eh1.Canvas.Font.Color := clred;
 eh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfm_main.N11Click(Sender: TObject);
begin
 append_415(1);
end;

procedure Tfm_main.N12Click(Sender: TObject);
begin
 append_415(2);
end;

procedure Tfm_main.N13Click(Sender: TObject);
begin
 append_415(3);  //退货重检MRB(&S)
end;

procedure Tfm_main.N14Click(Sender: TObject);
begin
 append_415(4);   //正常重检出仓(&F)
end;

procedure Tfm_main.N2Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
 else
 if set_lock then    //未锁定
 begin
  dm.AQ415.Close;
  dm.AQ415.Parameters[0].Value:=dm.ADS415rkey.Value;
  dm.AQ415.Open;

  if (dm.AQ415status.Value=2) or (dm.AQ415status.Value=3) or (dm.AQ415status.Value=4) then
  begin
   showmessage('出仓单状态发生变化，不允许编辑！确定需要修改请先将该出仓单退回。');//已提交、已检视或已出仓不能编辑
   exit;
  end;
  fm_detail:=Tfm_detail.Create(application);
  if dm.AQ415type.Value=3 then
   begin
    fm_detail.BitBtn3.Visible:=true;
    fm_detail.Edit7.Visible:=true;
    fm_detail.Label10.Visible:=true;
    if dm.AQ415rma_ptr.Value>0 then
    fm_detail.sg1.PopupMenu:=nil;
   end;
  fm_detail.v_modal:=2; //编辑
  enter_detail;
  fm_detail.Free;
 end;
end;

procedure Tfm_main.N3Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
 else begin
  dm.AQ415.Close;
  dm.AQ415.Parameters[0].Value:=dm.ADS415rkey.Value;
  dm.AQ415.Open;
  if (dm.AQ415status.Value=2) or (dm.AQ415status.Value=3) or (dm.AQ415status.Value=4) then
  begin
   showmessage('出仓单状态发生变化，不允许再提交！');//已提交、已检视或已出仓不能提交
   exit;
  end;
  dm.AQ415.Edit;
  dm.AQ415status.Value:=2;
  dm.AQ415.Post;
  bitbtn3.Click; //刷新
 end;
end;

procedure Tfm_main.N4Click(Sender: TObject);
begin
  fm_detail:=Tfm_detail.Create(application);
  fm_detail.v_modal:=3;  //检查
  fm_detail.btsave.Enabled:=false;
  fm_detail.Edit5.Enabled:=false;
  fm_detail.sg1.PopupMenu:=nil;
  fm_detail.SG1.Options:=fm_detail.SG1.Options-[goEditing]+[goRowselect];
  fm_detail.SG1.OnKeyPress:=nil;

  if dm.ADS415type.Value=3 then
  begin
    fm_detail.BitBtn3.Visible:=true;
    fm_detail.Edit7.Visible:=true;
    fm_detail.Label10.Visible:=true;
  end;
  enter_detail;
  fm_detail.Free;
end;

procedure Tfm_main.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0);
   exit;
  end;

  dm.AQ415.Close;
  dm.AQ415.Parameters[0].Value:=dm.ADS415rkey.Value;
  dm.AQ415.Open;
  if (dm.AQ415status.Value=2) or (dm.AQ415status.Value=3) or (dm.AQ415status.Value=4) then
  begin
   showmessage('出仓单状态发生变化，不允许删除！确定要删除请先将该出仓单退回。');
   exit;
  end
  else if messagedlg('您确定要删除选中的出仓申请单吗?',mtconfirmation,[mbyes,mbno],0)=mrYes then
   with dm.aqtmp do
   begin
    close;
    sql.Text:='update data0053 set qty_alloc=qty_alloc-data0465.QUANTITY '+
      'from data0465 inner join data0053 on data0465.d0053_ptr=data0053.rkey '+
      'where data0465.heard_ptr='+dm.ADS415rkey.AsString;
    ExecSQL;

    close;
    sql.Text:='delete from data0415 where rkey='+dm.ADS415rkey.AsString;
    ExecSQL;  //删除415出仓，并级联删除出仓子表465
    dm.ADS415.Close;
    dm.ADS415.Open;
   end;
end;

procedure Tfm_main.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADS415.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
 end
 else begin
  n2.Enabled:=dm.ADS415status.Value in [1,5];
  n3.Enabled:=dm.ADS415status.Value=1;
  n5.Enabled:=dm.ADS415status.Value in [1,5];
  n4.Enabled:=true;
 end;
end;


procedure Tfm_main.FormActivate(Sender: TObject);
begin
  WindowState:= wsMaximized;
end;

end.
