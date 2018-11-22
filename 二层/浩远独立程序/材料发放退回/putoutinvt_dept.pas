unit putoutinvt_dept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus, ComCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    SGrid1: TStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Edit6: TEdit;
    Label9: TLabel;
    BitBtn6: TBitBtn;
    StatusBar1: TStatusBar;
    SGrid2: TStringGrid;
    Timer1: TTimer;
    Edit7: TEdit;
    Label10: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure update_04(v_seed: string);
    procedure BitBtn1Click(Sender: TObject);
    procedure update_grid1();
    procedure Timer1Timer(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
   warehouse_ptr,dept_ptr,empl_ptr:integer;
   function find_soerror(var number:string):boolean;
   function find_22rkey():boolean;   
  public
    { Public declarations }
    procedure init;
  end;

var
  Form2: TForm2;
function Power(x, y : extended) : extended;
implementation

uses damo, warehouse_search, Prod_Resource, customer_search,
  stockinvt_search, main, putourinvt_report,common;

{$R *.dfm}

function TForm2.find_22rkey: boolean;
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


procedure Tform2.init;
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

procedure tform2.update_grid1();
var
 i:integer;
begin

  edit4.Text:='';
  edit5.Text:='';
  edit7.Text:='';
  label7.Caption:='';
  label8.Caption:='';
  dm.ado04.Close;
  dm.ado04.Open;
  edit1.Text:=dm.ado04SEED_VALUE.Value;
  for i:=1 to sgrid2.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
   sgrid1.RowCount:=2;
   sgrid2.RowCount:=2;
   edit3.Enabled:=true;
   bitbtn3.Enabled:=true;
end;

procedure TForm2.update_04(v_seed: string);
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

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
sgrid1.Cells[0,0]:='物料编码';
sgrid1.Cells[1,0]:='物料名称';
sgrid1.Cells[2,0]:='物料规格';
sgrid1.Cells[3,0]:='环保标识';
sgrid1.Cells[4,0]:='发放单位';
sgrid1.Cells[5,0]:='发放数量';

sgrid2.Cells[0,0]:='17.rkey';
sgrid2.Cells[1,0]:='22.rkey';
sgrid2.Cells[2,0]:='标准成本';
Form_stocksearch:=TForm_stocksearch.Create(application);

end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Form_stocksearch.Free;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
  if edit3.Text='' then
    messagedlg('请首先输入发料工厂信息!',mterror,[mbcancel],0)
  else
  begin
    if bitbtn3.Enabled then
    begin
      Form_stocksearch.aq22.Close;
      Form_stocksearch.aq22.Open
    end;
    Form_stocksearch.ComboBox1.ItemIndex:=
    Form_stocksearch.ComboBox1.Items.IndexOf(label6.Caption);
    Form_stocksearch.Edit1.Text := edit6.Text;
    if edit6.Text='' then Form_stocksearch.Edit1Change(nil);
    Form_stocksearch.parent_flag := 0;
    Form_stocksearch.ShowModal;
    if sgrid1.RowCount>2 then
    begin
      edit3.Enabled:=false;
      bitbtn3.Enabled:=false;
    end;
  end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
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

procedure TForm2.N1Click(Sender: TObject);
var
 i:word;
begin
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
 end;
end;

procedure TForm2.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
try
 form_dept:=tform_dept.Create(application);
 form_dept.Edit1.Text:=edit4.Text;
 if form_dept.ShowModal=mrok then
  begin
   edit4.Text:=form_dept.ADOQuery1dept_code.Value;
   label7.Caption:=form_dept.ADOQuery1dept_name.Value;
   self.dept_ptr:=form_dept.ADOQuery1rkey.Value;
   edit5.SetFocus;
  end
 else
  edit4.SetFocus;
finally
 form_dept.Free;
end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
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

procedure TForm2.Edit3Exit(Sender: TObject);
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

procedure TForm2.Edit4Exit(Sender: TObject);
begin
if (trim(edit4.Text)<>'') and (activecontrol.Name<>'BitBtn4') then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,dept_code,dept_name,active_flag,is_cost_dept,ttype'+#13+
            'from data0034'+#13+
           'WHERE (ACTIVE_FLAG=0) and'+#13+
          '(IS_cost_dept = 1 OR'+#13+
          'ttype = 4 OR'+#13+
          'ttype = 5)'+#13+
          'and dept_code='''+trim(edit4.Text)+''''+#13;
  open;
  if IsEmpty then
  begin
   messagedlg('部门编码输入错误!!!',mterror,[mbcancel],0);
   edit4.SetFocus;
  end
  else
  if FieldValues['rkey']<>self.dept_ptr then
  begin
   label7.Caption:=FieldValues['dept_name'];
   self.dept_ptr:=FieldValues['rkey'];
  end;
 end
else
if (trim(edit4.Text)='') and (activecontrol.Name<>'BitBtn4') then
  begin
   label7.Caption:='';
   self.dept_ptr:=0;
  end;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
if trim(edit5.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey, EMPL_CODE, EMPLOYEE_NAME from data0005'+#13+
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

procedure TForm2.BitBtn2Enter(Sender: TObject);
begin
if sgrid2.RowCount<=2 then
 begin
  messagedlg('没有发放的物料不能保存!!',mterror,[mbcancel],0);
  bitbtn6.SetFocus;
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

function tform2.find_soerror(var number:string):boolean;

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

procedure TForm2.BitBtn2Click(Sender: TObject);
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
    messagedlg('物料发放不成功库存记录发生变化!请重新选择库存发放',mterror,[mbcancel],0);
    self.update_grid1;
    exit;
  end;
  dm.ADOConnection1.BeginTrans;
  try
    dm.ADO457.Close;
    dm.ADO457.Open;
    dm.ado457.Append;
    dm.ado457GON_NUMBER.Value:=edit1.Text;
    dm.ado457REF_NUMBER.Value:=edit2.Text;
    dm.ado457warehouse_ptr.Value:=self.warehouse_ptr;
    dm.ado457dept_ptr.Value:=self.dept_ptr;
    dm.ado457TTYPE.Value:=2;
    dm.ado457CREATE_DATE.Value:=form1.sys_longdate;         //长格式
    dm.ado457CREATE_BY.Value:=strtoint(user_ptr);
    dm.ado457RECD_BY.Value:=self.empl_ptr;
    dm.ado457cut_no.value:=edit7.text;
    dm.ado457.Post;

    dm.ado207.close;
    dm.ado207.Open;
    for i:=1 to sgrid2.RowCount-2 do
    dm.ado207.AppendRecord([strtoint(sgrid2.Cells[0,i]),    //材料17.rkey
                            dm.ado457rkey.Value,            //457.rkey
                            strtoint(sgrid2.Cells[1,i]),    // 22.rkey
                            strtocurr(sgrid1.Cells[5,i]),   //数量
                            dm.ado457dept_ptr.Value,        //部门
                            dm.ado457CREATE_DATE.Value,     //日期 长格式
                            2,                              //类型
                            strtocurr(sgrid2.Cells[2,i])]); //标准成本

    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select data0207.D0022_PTR from data0207'+#13+
               'inner join data0022 on'+#13+
               'data0207.D0022_PTR=data0022.rkey'+#13+
               'where Data0022.QUAN_ON_HAND - data0022.QUAN_TO_BE_STOCKED < Data0207.QUANTITY'+#13+
               'and data0207.gon_ptr='+dm.ado457rkey.AsString;
     open;
    end;
    if not dm.ADOQuery1.IsEmpty then
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发', mterror,[mbcancel],0);
     self.update_grid1;
    end
    else
    begin

      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='update data0022'+#13+
        'set Data0022.QUAN_ON_HAND=Data0022.QUAN_ON_HAND-Data0207.QUANTITY'+#13+
               'from data0207 inner join data0022 on'+#13+
                 'data0207.D0022_PTR=data0022.rkey'+#13+
                 'where data0207.gon_ptr='+dm.ado457rkey.AsString;
        execsql;
      end;         //减去库存22中的库数量

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
        execsql;
      end;

      //减去库存17中的库数量
      self.update_04(trim(edit1.Text));  //更新控制码
      dm.send_message(dm.ado457rkey.Value);
      dm.ADOConnection1.CommitTrans;
      messagedlg('恭喜!发料成功!', mtinformation,[mbok],0);

      if checkbox1.Checked then
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
      //准备打印报表

      self.update_grid1;
      edit2.Text:='';
      edit2.SetFocus;
      self.Timer1Timer(sender);
    end;
  except
   on E: Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
      edit6.SetFocus;
    end;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if sgrid1.RowCount>2 then
if messagedlg('你确定不保存此次发料就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 close
else
 edit2.SetFocus
else
 close;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='SELECT GETDATE() AS sys_date,'+#13+
   'CONVERT(datetime, CONVERT(varchar, GETDATE(), 101), 101) AS sort_date';
  open;
  form1.sys_longdate:=fieldvalues['sys_date'];
  form1.sys_sortdate:=fieldvalues['sort_date'];
 end;
 StatusBar1.Panels[2].Text:='发料日期:'+
 formatdatetime('yyyy-mm-dd HH:mm:ss',form1.sys_longdate);
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;


end.
