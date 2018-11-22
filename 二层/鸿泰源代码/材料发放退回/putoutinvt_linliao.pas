unit putoutinvt_linliao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DBCtrls, Menus,
  ExtCtrls,math;

type
  TForm8 = class(TForm)
    StatusBar1: TStatusBar;
    SGrid1: TStringGrid;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Timer1: TTimer;
    SGrid2: TStringGrid;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit7: TEdit;
    Splitter1: TSplitter;
    BitBtn6: TBitBtn;
    CheckBox2: TCheckBox;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn7: TBitBtn;
    N7: TMenuItem;
    btn1: TSpeedButton;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  warehouse_ptr,dept_ptr,empl_ptr:integer;
  function find_soerror(var number:string):boolean;
  procedure update_grid1();
  procedure update_04(v_seed: string);
  procedure add_agrid1(qty:Double);
  function find_22rkey: boolean;
  function find_468rkey: boolean;
  function find_468status(number:string):boolean;
  public
    { Public declarations }
    procedure init;
  end;

var
  Form8: TForm8;

implementation

uses damo, warehouse_search, Prod_Resource, customer_search, main,
  stockinvt_quotasearch, putourinvt_report,common,
  Pick_Item_Single ,ConstVar, DB;

{$R *.dfm}

procedure tform8.init;
begin
    DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='select rkey,warehouse_code,warehouse_name,abbr_name from data0015';
  DM.ADOQuery1.Open;
  if DM.ADOQuery1.RecordCount=1 then
  begin
    edit3.text:=DM.ADOQuery1.FieldValues['warehouse_code'];
    label6.Caption:= DM.ADOQuery1.FieldValues['abbr_name'];
    Edit3.Tag:=dm.ADOQuery1.fieldbyname('rkey').AsInteger;
    self.warehouse_ptr:=DM.ADOQuery1.fieldbyname('rkey').AsInteger;
  end;
end;

procedure TForm8.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 dm.ado04.Close;
 dm.ado04.Open;
 if dm.ADO04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.Ado04.Edit; //使前缀不变后缀加1
    dm.ADO04SEED_VALUE.Value := new_seed;
    dm.Ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.Ado04.Edit;
     dm.ADO04SEED_VALUE.Value := new_seed;
     dm.Ado04.Post;
    end;
 end;
end;

procedure tForm8.update_grid1();
var
 i:integer;
begin
  dm.ado04.Close;
  dm.ado04.Open;
  edit1.Text:=dm.ado04SEED_VALUE.Value;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
   sgrid1.RowCount:=2;
   sgrid2.RowCount:=2;
   edit3.Enabled:=true;
   bitbtn3.Enabled:=true;
   edit2.Enabled:=true;
   bitbtn6.Enabled:=true;
   bitbtn7.Enabled:=false;
end;

function tForm8.find_soerror(var number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0457');
   sql.Add('where GON_NUMBER='''+number+'''');
   open;
   if not IsEmpty then
   begin
    dm.ado04.Close;
    dm.ado04.Open;
    number:=dm.ado04SEED_VALUE.Value;
    result := true;
   end;
  end;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
if sgrid1.RowCount>2 then
if messagedlg('你确定不保存此次发料就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 close
else
 dbgrid1.SetFocus
else
 close;
end;

procedure TForm8.BitBtn3Click(Sender: TObject);
begin
try
form_wh:=tform_wh.Create(application);
form_wh.Edit1.Text:=edit3.Text;
if form_wh.ShowModal=mrok then
 begin
  edit3.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
  label6.Caption:=form_wh.ADOQuery1ABBR_NAME.Value;
  self.warehouse_ptr:=form_wh.ADOQuery1RKEY.Value;
 end;
finally
form_wh.Free;
end;
end;

procedure TForm8.Edit3Exit(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015'+#13+
           'where WAREHOUSE_CODE='''+trim(edit3.Text)+'''';
  open;
 if IsEmpty then
  begin
   messagedlg('工厂编码输入错误!!',mterror,[mbcancel],0);
   edit3.SetFocus;
  end
 else
  if FieldValues['rkey']<>self.warehouse_ptr then
  begin
   label6.Caption:=FieldValues['ABBR_NAME'];
   self.warehouse_ptr:=FieldValues['rkey'];
  end;
 end;
end;

procedure TForm8.BitBtn4Click(Sender: TObject);
//var
// i:integer;
begin
{try
 form_dept:=tform_dept.Create(application);
 form_dept.Edit1.Text:=edit4.Text;
 if form_dept.ShowModal=mrok then
  begin
  if sgrid1.RowCount>2 then
   if messagedlg('已发放记录将被清除是否确认?',mtconfirmation,[mbyes,mbno],0) =mryes then
    begin
    edit4.Text:=form_dept.ADOQuery1dept_code.Value;
    label7.Caption:=form_dept.ADOQuery1dept_name.Value;
    self.dept_ptr:=form_dept.ADOQuery1rkey.Value;
    dm.ads468_268.Close;
    dm.ads468_268.Parameters.ParamValues['rkey34']:=self.dept_ptr;
    dm.ads468_268.Open;
    for i:=1 to sgrid1.RowCount-2 do
     sgrid1.Rows[i].Clear;
    sgrid1.RowCount:=2;
    end
   else
  else
   begin
   edit4.Text:=form_dept.ADOQuery1dept_code.Value;
   label7.Caption:=form_dept.ADOQuery1dept_name.Value;
   self.dept_ptr:=form_dept.ADOQuery1rkey.Value;
   dm.ads468_268.Close;
   dm.ads468_268.Parameters.ParamValues['rkey34']:=self.dept_ptr;
   dm.ads468_268.Open;
   end;
  end;
finally
 form_dept.Free;
end;
}
end;

procedure TForm8.BitBtn5Click(Sender: TObject);
begin
try
 form_employee:=Tform_employee.Create(application);
 form_employee.MaskEdit1.Text:=edit5.Text;
 if form_employee.ShowModal=mrok then
  begin
   edit5.Text:=form_employee.ADOQuery1EMPL_CODE.Value;
   label8.Caption:=form_employee.ADOQuery1EMPLOYEE_NAME.Value;
   self.empl_ptr:=form_employee.ADOQuery1RKEY.Value;
  end;
finally
 form_employee.Free;
end;
end;

procedure TForm8.Edit4Exit(Sender: TObject);
//var
// i:integer;
begin
{if trim(edit4.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,dept_code,dept_name,active_flag,is_cost_dept,ttype'+#13+
            'from data0034'+#13+
            'where dept_code='''+trim(edit4.Text)+'''';
  open;
  if IsEmpty then
  begin
   messagedlg('部门编码输入错误!!!',mterror,[mbcancel],0);
   edit4.SetFocus;
  end
  else
  if FieldValues['rkey']<>self.dept_ptr then
  if (FieldValues['is_cost_dept']=1) or
     (FieldValues['ttype'] = 5) or
     (FieldValues['ttype'] = 4) then
  begin

   if sgrid1.RowCount>2 then
    if messagedlg('已发放记录将被清除是否确认?',mtconfirmation,[mbyes,mbno],0) =mryes then
    begin
    label7.Caption:=form_dept.ADOQuery1dept_name.Value;
    self.dept_ptr:=form_dept.ADOQuery1rkey.Value;
    dm.ads468_268.Close;
    dm.ads468_268.Parameters.ParamValues['rkey34']:=self.dept_ptr;
    dm.ads468_268.Open;
    for i:=1 to sgrid1.RowCount-2 do
     sgrid1.Rows[i].Clear;
    sgrid1.RowCount:=2;
    end
    else
   else
    begin
   label7.Caption:=FieldValues['dept_name'];
   self.dept_ptr:=FieldValues['rkey'];
   dm.ads468_268.Close;
   dm.ads468_268.Parameters.ParamValues['rkey34']:=self.dept_ptr;
   dm.ads468_268.Open;
    end;
  end
  else
   begin
    messagedlg('该部门编码不是成本中心或者职能部门!!!',mterror,[mbcancel],0);
    edit4.SetFocus;
   end;
 end;
}
end;

procedure TForm8.Edit5Exit(Sender: TObject);
begin
if trim(edit5.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005'+#13+
            'where ACTIVE_FLAG=''Y'''+#13+
            'and EMPL_CODE='''+trim(edit5.Text)+'''';
  open;
 if IsEmpty then
  begin
   messagedlg('员工编码输入错误!!',mterror,[mbcancel],0);
   edit5.SetFocus;
  end
 else
  if FieldValues['rkey']<>self.empl_ptr then
  begin
   label8.Caption:=FieldValues['EMPLOYEE_NAME'];
   self.empl_ptr:=FieldValues['rkey'];
  end;
 end;
end;

procedure TForm8.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[2].Text:='发料日期:'+
 formatdatetime('yyyy-mm-dd HH:mm:ss',common.getsystem_date(dm.ADOQuery1,0));
end;

procedure TForm8.FormActivate(Sender: TObject);
begin
sgrid1.Cells[0,0]:='材料编码';
sgrid1.Cells[1,0]:='材料名称';
sgrid1.Cells[2,0]:='材料规格';
sgrid1.Cells[3,0]:='环保标识';
sgrid1.Cells[4,0]:='发放单位';
sgrid1.Cells[5,0]:='发放数量';
sgrid1.Cells[6,0]:='供应商';
sgrid1.Cells[7,0]:='原供应商';

sgrid2.Cells[0,0]:='17.rkey';
sgrid2.Cells[1,0]:='22.rkey';
sgrid2.Cells[2,0]:='标准成本';
sgrid2.Cells[3,0]:='468.rkey';

form7:=Tform7.Create(application);
end;

procedure TForm8.PopupMenu1Popup(Sender: TObject);
begin
if dm.ads468_268.IsEmpty then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
  n3.Enabled:=false;
  n6.Enabled:=false;
  n7.Enabled:=false;
  n10.Enabled:=false;
  n11.Enabled:=false;
 end
else
 begin
  n6.Enabled:=true;
  n7.Enabled:=true;  
  if dm.ads468_268STATUS.Value=0 then  //状态为有效
  begin
   if dm.ads468_268alloc.Value=0 then   //正常发放
    begin
     n1.Enabled:=true;
     n2.Enabled:=true;
     n10.Enabled:=false;
     n11.Enabled:=false;
    end
   else   //按分配发放
    begin
     n1.Enabled:=false;
     n2.Enabled:=false;
     if dm.ads468_268QUAN_ISSUED.Value = 0 then //未发放
      begin
       n10.Enabled:=true;
       n11.Enabled:=false;
      end
     else      //已发放
      begin
       n10.Enabled:=false;
       n11.Enabled:=true;
      end;
    end;
   n3.Enabled:=false;
  end
  else    //状态为无效
  begin
   n1.Enabled:=false;
   n2.Enabled:=false;
   n10.Enabled:=false;
   n11.Enabled:=false;
   n3.Enabled:=true;
  end;
 end;
end;

procedure TForm8.N2Click(Sender: TObject);
begin
dm.ads468_268.Edit;
dm.ads468_268STATUS.Value:=1;
dm.ads468_268.Post;
end;

procedure TForm8.N3Click(Sender: TObject);
begin
dm.ads468_268.Edit;
dm.ads468_268STATUS.Value:=0;
dm.ads468_268.Post;
end;

procedure TForm8.N1Click(Sender: TObject);
begin
  if edit3.Text='' then
    messagedlg('请首先输入发料工厂信息!',mterror,[mbcancel],0)
  else
  begin
    if bitbtn3.Enabled then
    begin
      dm.aq22.Close;
      dm.aq22.Open;
    end;

    Form7.ComboBox1.ItemIndex:=
    Form7.ComboBox1.Items.IndexOf(label6.Caption);
    dm.aq22.Filter:='warehouse_ptr='+inttostr(self.warehouse_ptr)
    +' and INVENTORY_PTR = '+dm.ads468_268INVENT_PTR.AsString;

    //  if not dm.aq22.IsEmpty then
    //  begin
    form7.v_type:=1;//按领料单发放
    Form7.ShowModal;
    if sgrid1.RowCount>2 then
    begin
      edit3.Enabled:=false;
      bitbtn3.Enabled:=false;
      edit2.Enabled:=false;
      bitbtn6.Enabled:=false;
    end;
    //  end
    //  else
    //  messagedlg('仓库没有找到该材料的库存!',mterror,[mbcancel],0)

  end;
end;

procedure TForm8.FormDestroy(Sender: TObject);
begin
form7.Free;
end;

procedure TForm8.N4Click(Sender: TObject);
var
 i:integer;
begin
if dm.ads468_268.Locate('rkey',strtoint(sgrid2.Cells[3,sgrid1.Row]),[]) then
 if dm.ads468_268alloc.Value > 0 then
  showmsg('按分配发放的材料不能单项删除,请从发放处整体取消发放!',1)
 else
 begin
  DM.aq22.Filter:='';
  if (dm.aq22.Locate('rkey',strtoint(sgrid2.Cells[1,sgrid1.Row]),[]))  then
  begin
   dm.aq22.Edit;
   dm.aq22QUAN_ON_HAND.Value:=dm.aq22QUAN_ON_HAND.Value+
                              strtocurr(sgrid1.Cells[5,sgrid1.Row]);
   dm.aq22.Post;
   dm.ads468_268.Edit;
   dm.ads468_268QUAN_ISSUED.Value:=dm.ads468_268QUAN_ISSUED.Value-
                               strtocurr(sgrid1.Cells[5,sgrid1.Row]);
   if dm.ads468_268STATUS.Value=1 then
   dm.ads468_268STATUS.Value:=0;
   dm.ads468_268.Post;

   for i:=sgrid1.Row to sgrid1.RowCount-2 do
    begin
     sgrid1.Rows[i]:=sgrid1.Rows[i+1];
     sgrid2.Rows[i]:=sgrid2.Rows[i+1];
    end;
   sgrid1.RowCount:=sgrid1.RowCount-1;
   sgrid2.RowCount:=sgrid2.RowCount-1;
   if sgrid1.RowCount<=2 then
   begin
    edit3.Enabled:=true;
    bitbtn3.Enabled:=true;
    edit2.Enabled:=true;
    bitbtn6.Enabled:=true;
   end;
  end
  else
   messagedlg('删除操作不成功!',mterror,[mbcancel],0);
 end
else
 messagedlg('删除操作不成功!',mterror,[mbcancel],0);
end;

procedure TForm8.PopupMenu2Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n4.Enabled:=false
else
 n4.Enabled:=true;
end;

procedure TForm8.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
 end;
end;

procedure TForm8.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ads468_268.IsEmpty then
if (dm.ads468_268STATUS.Value=0) and
   (dm.ads468_268quan_alloc.Value=0) then
    n1click(sender);
end;

procedure TForm8.BitBtn2Enter(Sender: TObject);
begin
if sgrid2.RowCount<=2 then
 begin
  messagedlg('没有发放的材料不能保存!!',mterror,[mbcancel],0);
  dbgrid1.SetFocus;
  exit;
 end;

if trim(edit2.Text)='' then
 begin
  messagedlg('领料单号不能为空!!',mterror,[mbcancel],0);
  edit2.SetFocus;
  exit;
 end;

 if trim(edit4.Text)='' then
 begin
  messagedlg('领料部门不能为空!!',mterror,[mbcancel],0);
  edit4.SetFocus;
  exit;
 end;

if trim(edit5.Text)='' then
 begin
  messagedlg('领料人员不能为空!!',mterror,[mbcancel],0);
  edit5.SetFocus;
  exit;
 end;
end;

function TForm8.find_468rkey: boolean;
var
 i :integer;
begin
 result:=false;
 for i:=1 to sgrid2.RowCount-2 do
 begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:='select data0468.rkey from data0468 inner join data0268'+#13+
             'on data0468.flow_no=data0268.rkey'+#13+
             'where data0468.status = 0'+#13+
             'and data0268.status = 2'+#13+
             'and data0468.rkey = '+sgrid2.Cells[3,i];
   open;
  end;
  if dm.ADOQuery1.IsEmpty then
   begin
    result := true;
    break;
   end;
 end;
end;

function TForm8.find_22rkey: boolean;
var
 i :integer;
begin
 result:=false;
 for i:=1 to sgrid2.RowCount-2 do
 begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:='select rkey from data0022'+#13+
             'where rkey ='+sgrid2.Cells[1,i];
   open;
  end;
  if dm.ADOQuery1.IsEmpty then
   begin
    result:=true;
    break;
   end;
 end;
end;

function TForm8.find_468status(number: string): boolean;
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select data0468.rkey from data0468 inner join data0268'+#13+
      'on data0468.flow_no=data0268.rkey'+#13+
     'where data0468.status=0'+#13+
    'and DATA0268.number='+quotedstr(trim(edit2.Text));
    open;
    if IsEmpty then
     result:=true
    else
     result:=false;
   end;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
var
 number:string;
 i:integer;
begin
  if dm.find_phycount(number) then
  begin
    messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:'+number,
    mtinformation,[mbcancel],0);
    exit;
  end;

  number:=trim(edit1.Text);
  if self.find_soerror(number) then
  begin
    edit1.Text:=number;
    messagedlg('出仓单号重复,可能有多台计算机同时新增,系统自动更新编号为:'+number,
          mtinformation,[mbok],0);
  end;

  if self.find_22rkey then
  begin
    messagedlg('材料发放不成功库存记录发生变化!请重新选择库存发放',mterror,[mbcancel],0);
    self.update_grid1;
    exit;
  end;

  if self.find_468rkey then
  begin
    messagedlg('材料发放不成功领料单状态发生变化!请重新选择库存发放',mterror,[mbcancel],0);
    self.update_grid1;
    exit;
  end;
{ TODO -owsp -c检查 : 增加对删除领料明细的检查 }
  dm.ADOConnection1.BeginTrans;
  try
    dm.ADO457.Close;
    dm.ADO457.Open;
    dm.ado457.Append;
    dm.ado457GON_NUMBER.Value:=edit1.Text;
    dm.ado457REF_NUMBER.Value:=edit2.Text;
    dm.ado457warehouse_ptr.Value:=self.warehouse_ptr;
    dm.ado457dept_ptr.Value:=self.dept_ptr;
    dm.ado457TTYPE.Value:=3;        //领料单发料
    dm.ado457CREATE_DATE.Value:=getsystem_date(dm.ADOQuery1,0);//长格式
    dm.ado457CREATE_BY.Value:=strtoint(user_ptr);
    dm.ado457RECD_BY.Value:=self.empl_ptr;
    dm.ado457cut_no.value:=edit7.text;
    dm.ado457.Post;
    dm.ado207.close;
    dm.ado207.Open;
    for i:=1 to sgrid2.RowCount-2 do
    dm.ado207.AppendRecord([strtoint(sgrid2.Cells[0,i]),    //材料17.rkey
                            dm.ado457rkey.Value,            //457.rkey
                            strtoint(sgrid2.Cells[1,i]),    //22.rkey
                            strtocurr(sgrid1.Cells[5,i]),   //数量
                            dm.ado457dept_ptr.Value,        //部门
                            dm.ado457CREATE_DATE.Value,     //日期 长格式
                            1,                              //类型
                            strtocurr(sgrid2.Cells[2,i]),   //标准成本
                            strtoint(sgrid2.Cells[3,i])]);  //468.rkey

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='update Data0022'+#13+
            'set QUAN_TO_BE_STOCKED=data0022.QUAN_TO_BE_STOCKED-d1.qty'+#13+
           'FROM dbo.Data0022 INNER JOIN'+#13+
           '(SELECT data0207.D0022_PTR, SUM(data0207.QUANTITY) AS qty'+#13+
           'FROM Data0207 inner join data0475'+#13+
             'on data0475.rkey468=data0207.D0468_PTR and ' +#13+
             'data0475.rkey22=data0207.D0022_PTR'+#13+
           'WHERE data0207.GON_PTR = '+dm.ado457rkey.AsString+#13+
           'GROUP BY data0207.D0022_PTR) d1 ON'+#13+
           'Data0022.RKEY = d1.D0022_PTR';
      execsql;     //减去22已分配的库存
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='update data0017'+#13+
      'set QUAN_ASSIGN=Data0017.QUAN_ASSIGN-d1.total_QUANTITY'+#13+
      'from data0017 inner join (select INVENTORY_PTR,sum(QUANTITY) as total_QUANTITY'+#13+
      'from data0207 inner join data0475' +#13+
         'on data0475.rkey468=data0207.D0468_PTR and ' +#13+
         'data0475.rkey22=data0207.D0022_PTR'+#13+
      'where data0207.gon_ptr='+dm.ado457rkey.AsString +#13+
      'group by INVENTORY_PTR ) as d1 on' +#13+
      'data0017.rkey=d1.INVENTORY_PTR';
      execsql;     //减去库存17中已分配的数量
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='delete data0475'+#13+
      'from data0475 inner join data0207'+#13+
      'on data0475.rkey468=data0207.D0468_PTR and ' +#13+
      'data0475.rkey22=data0207.D0022_PTR'+#13+
      'where data0207.gon_ptr='+dm.ado457rkey.AsString;
      execsql;     //删除分配记录
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='SELECT dbo.Data0022.RKEY'+#13+
           'FROM dbo.Data0022 INNER JOIN'+#13+
           '(SELECT data0207.D0022_PTR, SUM(QUANTITY) AS qty'+#13+
           'FROM dbo.Data0207'+#13+
           'WHERE data0207.GON_PTR = '+dm.ado457rkey.AsString+#13+
           'GROUP BY data0207.D0022_PTR) d1 ON'+#13+
      'Data0022.RKEY = d1.D0022_PTR AND Data0022.QUAN_ON_HAND-data0022.QUAN_TO_BE_STOCKED < d1.qty';
      open;
    end;
    if not dm.ADOQuery1.IsEmpty then
    begin
      dm.ads468_268.CancelBatch();
      dm.aq22.CancelBatch();
      dm.ADOConnection1.RollbackTrans;
      messagedlg('发料失败,可能多用户同时发放了同一批材料且导致库存出现负数!请重发', mterror,[mbcancel],0);
      self.update_grid1;
    end
    else
    begin
      dm.ads468_268.UpdateBatch();

      dm.aq22.CancelBatch();

      with dm.ADOQuery1 do
      begin
       close;
       sql.Text:='update Data0022'+#13+
              'set data0022.quan_on_hand=data0022.quan_on_hand-d1.qty'+#13+
             'FROM dbo.Data0022 INNER JOIN'+#13+
             '(SELECT data0207.D0022_PTR, SUM(QUANTITY) AS qty'+#13+
             'FROM dbo.Data0207'+#13+
             'WHERE data0207.GON_PTR = '+dm.ado457rkey.AsString+#13+
             'GROUP BY data0207.D0022_PTR) d1 ON'+#13+
             'dbo.Data0022.RKEY = d1.D0022_PTR';
       execsql;     //减去22库存
      end;

      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='update data0017'+#13+
        'set Data0017.QUAN_ON_HAND=Data0017.QUAN_ON_HAND-d1.total_QUANTITY'+#13+
        'from data0017 inner join (select INVENTORY_PTR,sum(QUANTITY) as total_QUANTITY'+#13+
        'from data0207 ' +#13+
        'where data0207.gon_ptr='+dm.ado457rkey.AsString +#13+
        'group by INVENTORY_PTR ) as d1 on' +#13+
        'data0017.rkey=d1.INVENTORY_PTR';
        execsql;     //减去库存17中的库数量
      end;

      if (self.CheckBox2.Checked) or (find_468status(trim(edit2.Text))) then
      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='update data0268'+#13+
          'set status=4'+#13+
        'where  DATA0268.number='+quotedstr(trim(edit2.Text));
        ExecSQL;
      end ;

      self.update_04(trim(edit1.Text));  //更新控制码
      dm.send_message(dm.ado457rkey.Value);
      dm.update_data0403(dm.ado457rkey.Value); //更新销售订单物料提前分配表403

      dm.ADOConnection1.CommitTrans;
      messagedlg('恭喜!发料成功!', mtinformation,[mbok],0);

      if checkbox1.Checked then      //准备打印报表
      begin
        Form_putoutintreport:=TForm_putoutintreport.Create(application);
        Form_putoutintreport.aq457.Close;
        Form_putoutintreport.aq457.Parameters[0].Value:=dm.ado457rkey.Value;
        Form_putoutintreport.aq457.Open;
        Form_putoutintreport.ado207.Open;
        Form_putoutintreport.ppReport1.Reset;
        Form_putoutintreport.ppReport1.Template.FileName :=
          stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_invtreport.rtm';
        Form_putoutintreport.ppReport1.Template.LoadFromFile;
        Form_putoutintreport.ppreport1.SaveAsTemplate:=false;
        Form_putoutintreport.ppReport1.Print;
        Form_putoutintreport.Free;
      end;      

      self.update_grid1;
      edit2.Text:='';
      edit2.SetFocus;
      edit4.Text:='';
      label7.Caption:='';
      edit7.Text:='';
      dm.ads468_268.Close;
      dm.aq22.close;
    end;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     dbgrid1.SetFocus;
    end;
  end;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dm.ads468_268.Active then dm.ads468_268.Close;
if dm.aq22.Active then dm.aq22.Close;
end;


procedure TForm8.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
    InputVar.Fields:='number/领料单号/100,DEPT_NAME/申请部门/100,'+
    'EMPLOYEE_NAME/申请人员/70,DATE/日期/100,reference/备注/100,'+
    'abbr_name/工厂简称/80,vttype/领料类型/80';

    InputVar.Sqlstr:=
    'SELECT  DATA0268.rkey, DATA0268.number, Data0034.DEPT_CODE,'+#13+
    'Data0034.DEPT_NAME, DATA0268.DATE, Data0005.EMPLOYEE_NAME,Data0005.EMPL_CODE,'+#13+
    'DATA0268.dept_ptr, DATA0268.EMPL_PTR, DATA0268.reference,'+#13+
    'data0015.WAREHOUSE_CODE,data0015.ABBR_NAME,data0268.warehouse_ptr,'+#13+
    'case data0268.TTYPE when 0 then ''部门领料'' when 1 then ''BOM领料'''+#13+
    'when 2 then ''维修'' when 3 then ''维护'' when 4 then ''工程'' when 5 then ''公用'' end as vttype'+#13+
    'FROM  DATA0268 INNER JOIN'+#13+
    'Data0034 ON dbo.DATA0268.dept_ptr = Data0034.RKEY INNER JOIN'+#13+
    'Data0005 ON dbo.DATA0268.EMPL_PTR = Data0005.RKEY inner join'+#13+
    'data0015 on data0268.warehouse_ptr = data0015.rkey'+#13+
    'where data0268.status=2 and data0268.allow_submit in (0,2)';

    inputvar.KeyField:='number';
    inputvar.InPut_value:=edit2.Text;
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['number']);
      edit4.Text:= frmPick_Item_Single.adsPick.Fieldbyname('DEPT_CODE').AsString;
      label7.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('DEPT_NAME').AsString;
      self.dept_ptr :=frmPick_Item_Single.adsPick.Fieldbyname('dept_ptr').AsInteger;

      edit3.Text:=frmPick_Item_Single.adsPick.Fieldbyname('WAREHOUSE_CODE').AsString;
      label6.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('ABBR_NAME').AsString;
      self.warehouse_ptr:=frmPick_Item_Single.adsPick.Fieldbyname('warehouse_ptr').AsInteger;

      edit5.Text:= frmPick_Item_Single.adsPick.Fieldbyname('EMPL_CODE').AsString;
      label8.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('EMPLOYEE_NAME').AsString;
      self.empl_ptr:=frmPick_Item_Single.adsPick.Fieldbyname('EMPL_PTR').AsInteger;
      edit7.Text:= frmPick_Item_Single.adsPick.Fieldbyname('reference').AsString;

      dm.ads468_268.Close;
      dm.ads468_268.Parameters.ParamValues['rkey268']:=
                       frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      dm.ads468_268.Open;
      bitbtn7.Enabled:=true;
      btn1.Enabled:=true;
      edit3.SetFocus;

    end
    else
      edit2.SetFocus;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end; //end try
end;

procedure TForm8.Edit2Exit(Sender: TObject);
begin
if trim(edit2.Text)='' then
 begin
  edit5.Text:='';
  label8.Caption:='';
  edit4.Text:='';
  label7.Caption:='';
  self.dept_ptr:=0;
  self.empl_ptr:=0;
  bitbtn7.Enabled:=false;
  btn1.Enabled:=False;
  if dm.ads468_268.Active then
  begin
   dm.ads468_268.CancelBatch();
   dm.ads468_268.Close;
   dm.ads468_268.Parameters.ParamValues['rkey268']:=0;
  end;
 end
else
if ActiveControl.Name<>'BitBtn6' then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
    'SELECT   DATA0268.rkey, dbo.DATA0268.number, dbo.Data0034.DEPT_CODE,'+#13+
    'Data0034.DEPT_NAME, DATA0268.DATE, Data0005.EMPLOYEE_NAME,Data0005.EMPL_CODE,'+#13+
    'DATA0268.dept_ptr, dbo.DATA0268.EMPL_PTR, dbo.DATA0268.reference,'+#13+
    'data0015.WAREHOUSE_CODE,data0015.ABBR_NAME,data0268.warehouse_ptr'+#13+
    'FROM   dbo.DATA0268 INNER JOIN'+#13+
    ' dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY INNER JOIN'+#13+
    ' dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = dbo.Data0005.RKEY INNER JOIN'+#13+
    'data0015 on data0268.warehouse_ptr = data0015.rkey'+#13+
    'where data0268.status=2 and data0268.allow_submit in (0,2)'+#13+
    'and DATA0268.number='+quotedstr(trim(edit2.Text));
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('领料单代码不正确',1);
    edit2.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey').AsInteger<>
       dm.ads468_268.Parameters.ParamValues['rkey268'] then
    begin

    edit3.Text:=dm.ADOQuery1.Fieldbyname('WAREHOUSE_CODE').AsString;
    label6.Caption:=dm.ADOQuery1.Fieldbyname('ABBR_NAME').AsString;
    self.warehouse_ptr:=dm.ADOQuery1.Fieldbyname('warehouse_ptr').AsInteger;

    edit4.Text:= dm.ADOQuery1.Fieldbyname('DEPT_CODE').AsString;
    label7.Caption:= dm.ADOQuery1.Fieldbyname('DEPT_NAME').AsString;
    label8.Caption:=dm.ADOQuery1.Fieldbyname('EMPLOYEE_NAME').AsString;
    edit5.Text:= dm.ADOQuery1.Fieldbyname('EMPL_CODE').AsString;
    self.dept_ptr:= dm.ADOQuery1.FieldByName('dept_ptr').AsInteger;
    self.empl_ptr:= dm.ADOQuery1.FieldByName('EMPL_PTR').AsInteger;
    dm.ads468_268.Close;
    dm.ads468_268.Parameters.ParamValues['rkey268']:=
                     dm.ADOQuery1.FieldByName('rkey').AsInteger;
    dm.ads468_268.Open;
    bitbtn7.Enabled:=true;
    btn1.Enabled:=true;
    end;
 end;
end;

procedure TForm8.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit3.SetFocus;
end;

procedure TForm8.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm8.N6Click(Sender: TObject);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='SELECT  Data0468.QUAN_ISSUED, DATA0268.number'+#13+
'FROM         dbo.Data0468 INNER JOIN'+#13+
'dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo.DATA0268.rkey'+#13+
'WHERE     ((dbo.Data0468.QUAN_ISSUED > 0) OR'+#13+
 '         (dbo.DATA0268.status <> 2))'+#13+
  'and DATA0268.number='+quotedstr(trim(edit2.Text));
  open;
 end;
if dm.ADOQuery1.IsEmpty then
 if messagedlg('申请单退回将是不可逆操作您确认?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='update data0268'+#13+
        'set status=3,'+#13+
        'auth_emplptr=null,'+#13+
        'auth_date=null'+#13+
      'where  DATA0268.number='+quotedstr(trim(edit2.Text));
      ExecSQL;
     end;
  self.update_grid1;
  edit2.Text:='';
  self.Edit2Exit(sender);
  edit2.SetFocus;
  messagedlg('申请单退回操作成功',mtconfirmation,[mbok],0);

  end
 else
else
 messagedlg('申领单状态或者数量发生变化，退回操作不成功',mterror,[mbcancel],0);

end;

procedure TForm8.add_agrid1(qty: Double);
begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=dm.aq22INV_PART_NUMBER.Value;
   sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.aq22INV_NAME.Value;
   sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.aq22INV_DESCRIPTION.Value;
   sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.aq22rohs.Value;
   sgrid1.Cells[4,sgrid1.RowCount-1]:=dm.aq22unit_name.Value;
   sgrid1.Cells[5,sgrid1.RowCount-1]:=floattostr(qty);
   sgrid1.Cells[6,sgrid1.RowCount-1]:=dm.aq22ABBR_NAME.Value;
   sgrid1.Cells[7,sgrid1.RowCount-1]:=dm.aq22SUPPLIER2.Value;

   sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.aq22INVENTORY_PTR.AsString;
   sgrid2.Cells[1,sgrid2.RowCount-1]:=dm.aq22RKEY.AsString;
   sgrid2.Cells[2,sgrid2.RowCount-1]:=dm.aq22STD_COST.AsString;
   sgrid2.Cells[3,sgrid2.RowCount-1]:=dm.ads468_268RKEY.AsString;
   sgrid1.RowCount:=sgrid1.RowCount+1;
   sgrid2.RowCount:=sgrid2.RowCount+1;

   dm.ads468_268.Edit;
   dm.ads468_268QUAN_ISSUED.Value:=dm.ads468_268QUAN_ISSUED.Value+qty;
   if (dm.ads468_268QUAN_ISSUED.Value>=dm.ads468_268QUAN_BOM.Value) then
   dm.ads468_268STATUS.Value:=1;      //468发放完毕状态
   dm.ads468_268.Post;

   dm.aq22.Edit;
   dm.aq22QUAN_ON_HAND.Value:=dm.aq22QUAN_ON_HAND.Value-qty;
   dm.aq22.Post;

end;

procedure TForm8.BitBtn7Click(Sender: TObject);
begin
if edit3.Text='' then
 messagedlg('请首先输入发料工厂信息!',mterror,[mbcancel],0)
else
begin
if not dm.aq22.Active then
begin
 dm.aq22.Close;
 dm.aq22.Open;
end;
 dm.ads468_268.First;
while not dm.ads468_268.Eof do
 begin

  if (dm.ads468_268alloc.Value > 0) and (dm.ads468_268QUAN_ISSUED.Value = 0) then
   self.N10Click(sender)
  else
   if (dm.ads468_268alloc.Value = 0) and
      (dm.ads468_268QUAN_BOM.Value > dm.ads468_268QUAN_ISSUED.Value)  then
    begin
     dm.aq22.Filter:='INVENTORY_PTR = '+dm.ads468_268INVENT_PTR.AsString+
                     ' and warehouse_ptr='+inttostr(Self.warehouse_ptr);
     dm.aq22.First;
     while not dm.aq22.Eof do
      begin
       if  ((dm.aq22EXPIRE_DATE.Value > getsystem_date(dm.ADOQuery1,1)) or (dm.aq22EXPIRE_DATE.Value=0) ) and
          (dm.aq22quan_hand.Value > 0)   then
        begin
         if dm.aq22quan_hand.Value >=
            dm.ads468_268QUAN_BOM.Value-dm.ads468_268QUAN_ISSUED.Value then
          begin
           self.add_agrid1(dm.ads468_268QUAN_BOM.Value-dm.ads468_268QUAN_ISSUED.Value);
           break;
          end
         else
          begin
           self.add_agrid1(dm.aq22quan_hand.Value);
          end;
        end
        else
        begin
          
          if (dm.aq22quan_hand.Value > 0) then
            ShowMessage(DM.aq22INV_PART_NUMBER.AsString+'有效期已过，请发放到材料检查后再发放');
        end;
       dm.aq22.Next;
      end;
    end;
  dm.ads468_268.Next;
 end;

 if sgrid1.RowCount>2 then
  begin
   edit3.Enabled:=false;
   bitbtn3.Enabled:=false;
   edit2.Enabled:=false;
   bitbtn6.Enabled:=false;
  end;
 end;
end;


procedure TForm8.N7Click(Sender: TObject);
begin
if not dbgrid1.DataSource.DataSet.IsEmpty then
Export_dbGrid_to_Excel(dbgrid1,edit2.Text);
end;



procedure TForm8.btn1Click(Sender: TObject);
begin
 if messagedlg('关闭领料申请单,将是不可逆操作您确认?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='update data0268'+#13+
        'set status=4,prted=1'+#13+
      'where  DATA0268.number='+quotedstr(trim(edit2.Text));
      ExecSQL;
     end;
  self.update_grid1;
  edit2.Text:='';
  self.Edit2Exit(sender);
  edit2.SetFocus;
  messagedlg('关闭领料申请单操作成功',mtconfirmation,[mbok],0);

  end;
end;

procedure TForm8.N10Click(Sender: TObject);
begin
if not dm.aq22.Active then
  begin
   dm.aq22.Close;
   dm.aq22.Open;
  end;

 DM.aq22.Filter:=''; 
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'+#13+
  'dbo.Data0017.INV_DESCRIPTION, dbo.Data0022.rohs, dbo.Data0002.UNIT_NAME,'+#13+
  'dbo.DATA0475.quan_alloc, dbo.Data0022.INVENTORY_PTR,'+#13+
  'dbo.Data0022.RKEY, dbo.Data0017.STD_COST, dbo.Data0022.SUPPLIER2,'+#13+
  'dbo.Data0023.ABBR_NAME'+#13+
  'FROM         dbo.DATA0475 INNER JOIN'+#13+
    'dbo.Data0022 ON dbo.DATA0475.rkey22 = dbo.Data0022.RKEY INNER JOIN'+#13+
    'dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'+#13+
    'dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'+#13+
    'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13+
    'dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY'+#13+
  'where DATA0475.rkey468='+dm.ads468_268RKEY.AsString;
  open;
 end;
 if not dm.ADOQuery1.IsEmpty then
 begin
  while not dm.ADOQuery1.Eof do
  begin
   sgrid1.Cells[0,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('INV_PART_NUMBER').AsString;
   sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('INV_NAME').AsString;
   sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('INV_DESCRIPTION').AsString;
   sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('rohs').AsString;
   sgrid1.Cells[4,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('unit_name').AsString;
   sgrid1.Cells[5,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('quan_alloc').AsString;
   sgrid1.Cells[6,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('ABBR_NAME').AsString;
   sgrid1.Cells[7,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('SUPPLIER2').AsString;

   sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('INVENTORY_PTR').AsString;
   sgrid2.Cells[1,sgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('RKEY').AsString;
   sgrid2.Cells[2,sgrid2.RowCount-1]:=dm.ADOQuery1.fieldbyname('STD_COST').AsString;
   sgrid2.Cells[3,sgrid2.RowCount-1]:=dm.ads468_268RKEY.AsString;
   sgrid1.RowCount:=sgrid1.RowCount+1;
   sgrid2.RowCount:=sgrid2.RowCount+1;
   if (dm.aq22.Locate('rkey',dm.ADOQuery1.fieldbyname('RKEY').Value,[]))  then
   dm.aq22.Edit;
   dm.aq22QUAN_ON_HAND.Value:=dm.aq22QUAN_ON_HAND.Value-
                               dm.ADOQuery1.fieldbyname('quan_alloc').Value;
   dm.aq22.Post;

   dm.ADOQuery1.Next;
  end;
   dm.ads468_268.Edit;
   dm.ads468_268QUAN_ISSUED.Value:=dm.ads468_268QUAN_ISSUED.Value+
                               dm.ads468_268quan_alloc.Value;
   dm.ads468_268quan_alloc.Value:=0;
   if dm.ads468_268QUAN_ISSUED.Value >= dm.ads468_268QUAN_BOM.Value then
   dm.ads468_268STATUS.Value:=1;      //468发放完毕状态
   dm.ads468_268.Post;
 end
  else
    showmsg('自动发放失败,可能被其用户发放或者取消分配了!',1);

  if sgrid1.RowCount>2 then
   begin
    edit3.Enabled:=false;
    bitbtn3.Enabled:=false;
    edit2.Enabled:=false;
    bitbtn6.Enabled:=false;
   end;
end;

procedure TForm8.N11Click(Sender: TObject);
var
 i,j:integer;
 find_468:boolean;
begin
 find_468:=true;
 DM.aq22.Filter:='';
   while find_468 do
   begin
    if sgrid2.RowCount>2 then
     begin
      for i:=1 to sgrid2.RowCount-2 do
      if strtoint(sgrid2.Cells[3,i])=dm.ads468_268RKEY.Value  then
      begin
       if (dm.aq22.Locate('rkey',strtoint(sgrid2.Cells[1,i]),[]))  then
        begin
         dm.aq22.Edit;
         dm.aq22QUAN_ON_HAND.Value:=dm.aq22QUAN_ON_HAND.Value+
                                    strtocurr(sgrid1.Cells[5,i]);
         dm.aq22.Post;
        end;
       for j:=i to sgrid2.RowCount-2 do
        begin
         sgrid1.Rows[j]:=sgrid1.Rows[j+1];
         sgrid2.Rows[j]:=sgrid2.Rows[j+1];
        end;
       sgrid1.RowCount:=sgrid1.RowCount-1;
       sgrid2.RowCount:=sgrid2.RowCount-1;

       break;
      end
      else
       if i=sgrid2.RowCount-2 then find_468:=false;
     end
    else
     find_468:=false;
   end;

  dm.ads468_268.Edit;
  dm.ads468_268quan_alloc.Value:=dm.ads468_268alloc.Value;
  dm.ads468_268QUAN_ISSUED.Value:=dm.ads468_268QUAN_ISSUED.Value-
                               dm.ads468_268alloc.Value;
  dm.ads468_268.Post;


 if sgrid1.RowCount <= 2 then
  begin
   edit3.Enabled:=true;
   bitbtn3.Enabled:=true;
   edit2.Enabled:=true;
   bitbtn6.Enabled:=true;
  end;
end;

procedure TForm8.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and             //如果是下箭头如果是最后一条记录
  (dm.ads468_268.RecNo=dm.ads468_268.RecordCount) then
   abort;

 if key=45 then abort; //insert键

 if (ssCtrl	in shift) and (key=46) then  //用户按下ctrl+del键
  abort
end;

end.

