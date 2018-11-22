unit putoutmisc_dept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Menus, Grids, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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
    SGrid1: TStringGrid;
    Edit6: TEdit;
    BitBtn6: TBitBtn;
    SGrid2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Timer1: TTimer;
    Edit7: TEdit;
    Label10: TLabel;
    Edit8: TEdit;
    Label11: TLabel;
    BitBtn7: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure update_grid1();
    function find_soerror(var number:string):boolean;
    procedure update_04(v_seed: string);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
   warehouse_ptr,dept_ptr,empl_ptr:integer;    
  public
    { Public declarations }
    procedure init;
  end;

var
  Form3: TForm3;
  function Power(x, y : extended) : extended;
implementation

uses damo,  warehouse_search, Prod_Resource, customer_search,
  stockmisc_search, putoutmiscreport,common,Pick_Item_Single ,ConstVar, DB;

{$R *.dfm}

procedure tform3.init;
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

function tform3.find_soerror(var number:string):boolean;
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

procedure tform3.update_grid1();
var
 i:integer;
begin
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  label6.Caption:='';
  label7.Caption:='';
  label8.Caption:='';
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
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm3.update_04(v_seed: string);
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

procedure TForm3.Timer1Timer(Sender: TObject);
begin

 StatusBar1.Panels[2].Text:='发料日期:'+
 formatdatetime('yyyy-mm-dd HH:mm:ss',common.getsystem_date(dm.ADOQuery1,0));
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
if sgrid1.RowCount>2 then
if messagedlg('你确定不保存此次发料就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 close
else
 edit2.SetFocus
else
 close;
end;

procedure TForm3.N1Click(Sender: TObject);
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

procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;

procedure TForm3.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm3.Edit3Exit(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,WAREHOUSE_CODE,ABBR_NAME from data0015'+#13+
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

procedure TForm3.Edit4Exit(Sender: TObject);
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

procedure TForm3.Edit5Exit(Sender: TObject);
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

procedure TForm3.BitBtn3Click(Sender: TObject);
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

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
try
 form_dept:=tform_dept.Create(application);
 form_dept.Edit1.Text:=edit4.Text;
 if form_dept.ShowModal=mrok then
  begin
   edit4.Text:=form_dept.ADOQuery1dept_code.Value;
   label7.Caption:=form_dept.ADOQuery1dept_name.Value;
   self.dept_ptr:=form_dept.ADOQuery1rkey.Value;
  end
 else
  edit4.SetFocus; 
finally
 form_dept.Free;
end;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
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

procedure TForm3.BitBtn6Click(Sender: TObject);
begin
if edit3.Text='' then
 messagedlg('请首先输入发料工厂信息!',mterror,[mbcancel],0)
else
begin
 if bitbtn3.Enabled then
 begin
  Form_miscstock.aq235.Close;
  Form_miscstock.aq235.Open
 end;
 Form_miscstock.ComboBox1.ItemIndex:=
 Form_miscstock.ComboBox1.Items.IndexOf(label6.Caption);
 Form_miscstock.Edit1.Text:=edit6.Text;
 if edit6.Text='' then Form_miscstock.Edit1Change(nil);
 Form_miscstock.ShowModal;
 if sgrid1.RowCount>2 then
 begin
  edit3.Enabled:=false;
  bitbtn3.Enabled:=false;
 end;
end;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
sgrid1.Cells[0,0]:='物品名称';
sgrid1.Cells[1,0]:='物品规格';
sgrid1.Cells[2,0]:='物品类型';
sgrid1.Cells[3,0]:='环保标识';
sgrid1.Cells[4,0]:='发放单位';
sgrid1.Cells[5,0]:='发放数量';

sgrid2.Cells[0,0]:='235.rkey';

Form_miscstock:=TForm_miscstock.Create(application);
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
 Form_miscstock.Free;
end;

procedure TForm3.BitBtn2Enter(Sender: TObject);
begin
if sgrid1.RowCount<=2 then
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

procedure TForm3.BitBtn2Click(Sender: TObject);
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

  dm.ADOConnection1.BeginTrans;
  try
    dm.ADO457.Close;
    dm.ADO457.Open;
    dm.ado457.Append;
    dm.ado457GON_NUMBER.Value:=edit1.Text;
    dm.ado457REF_NUMBER.Value:=edit2.Text;
    dm.ado457warehouse_ptr.Value:=self.warehouse_ptr;
    dm.ado457dept_ptr.Value:=self.dept_ptr;
    dm.ado457TTYPE.Value:=5;
    dm.ado457CREATE_DATE.Value:=common.getsystem_date(dm.ADOQuery1,0);//长格式
    dm.ado457CREATE_BY.Value:=strtoint(user_ptr);
    dm.ado457RECD_BY.Value:=self.empl_ptr;
    dm.ado457cut_no.value:=edit7.text;
    if Trim(Edit8.Text) <> '' then
    dm.ado457cut_no492.Value:=Edit8.Text;      //生产单号
    dm.ado457.Post;

    dm.ado208.close;
    dm.ado208.Open;
    for i:=1 to sgrid1.RowCount-2 do
    dm.ado208.AppendRecord([strtoint(sgrid2.Cells[0,i]),  //235.rkey
                            dm.ado457dept_ptr.Value,      //部门
                            dm.ado457rkey.Value,          // 457.rkey
                            dm.ado457CREATE_DATE.Value,   //日期 长格式
                            strtocurr(sgrid1.Cells[5,i]),  //数量
                            null
                           ]);

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='select data0208.SOURCE_PTR from data0208'+#13+
               'inner join data0235 on'+#13+
               'data0208.SOURCE_PTR=data0235.rkey'+#13+
               'where Data0235.QUAN_ON_HAND < Data0208.QUANTITY'+#13+
               'and data0208.gon_ptr='+dm.ado457rkey.AsString;
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
        sql.Text:='update data0235'+#13+
        'set QUAN_ON_HAND=data0235.QUAN_ON_HAND-Data0208.QUANTITY'+#13+
               'from data0208 inner join data0235 on'+#13+
                 'data0208.SOURCE_PTR=data0235.rkey'+#13+
                 'where data0208.gon_ptr='+dm.ado457rkey.AsString;
        execsql;
      end;

      //减去库存235中的库数量

      self.update_04(trim(edit1.Text));  //更新控制码
      dm.ADOConnection1.CommitTrans;
      messagedlg('恭喜!发料成功!', mtinformation,[mbok],0);

      //准备打印报表
      if checkbox1.Checked then
      begin
        Form_putoutmiscreport:=TForm_putoutmiscreport.Create(application);
        Form_putoutmiscreport.aq457.Close;
        Form_putoutmiscreport.aq457.Parameters[0].Value:=dm.ado457rkey.Value;
        Form_putoutmiscreport.aq457.Open;
        Form_putoutmiscreport.ado208.Open;
        Form_putoutmiscreport.ppReport1.Reset;
        Form_putoutmiscreport.ppReport1.Template.FileName :=
          stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_miscreport.rtm';
        Form_putoutmiscreport.ppReport1.Template.LoadFromFile;
        Form_putoutmiscreport.ppreport1.SaveAsTemplate:=false;
        Form_putoutmiscreport.ppReport1.Print;
        Form_putoutmiscreport.Free;
      end;

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

procedure TForm3.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='cut_no/生产单号/100,PROD_CODE/产品编码/100,'+
  'PRODUCT_NAME/产品名称/70,PRODUCT_DESC/规格/100,DEPT_NAME/制造部门/100,'+
  'ISSUE_DATE/投产日期/80,ISSUED_QTY/投产数量/80';

  InputVar.Sqlstr:=
'SELECT     dbo.data0492.rkey, dbo.data0492.CUT_NO, dbo.data0492.SO_NO,'+#13+
'  Data0005.EMPLOYEE_NAME,data0492.ISSUED_QTY,data0492.ISSUE_DATE,data0492.mrb_ptr,'+#13+
'  data0492.SCH_COMPL_DATE, dbo.data0492.remark, dbo.Data0015.WAREHOUSE_CODE,'+#13+
' CASE data0492.TSTATUS WHEN 0 THEN ''已审核'' WHEN 2 THEN ''不审核'' END AS 生产状态,'+#13+
' CASE data0492.TTYPE WHEN 0 THEN ''正常'' WHEN 1 THEN ''补料'' WHEN 4 THEN ''按产品投产'' END AS 投产性质,'+#13+
'  Data0008.PROD_CODE, Data0008.PRODUCT_NAME, Data0008.PRODUCT_DESC, Data0034.DEPT_NAME,data0034.dept_code'+#13+
'FROM         dbo.data0492 INNER JOIN'+#13+
'    dbo.Data0005 ON dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY INNER JOIN'+#13+
'    dbo.Data0015 ON dbo.data0492.WHOUSE_PTR = dbo.Data0015.RKEY INNER JOIN'+#13+
'    dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo.Data0008.RKEY INNER JOIN'+#13+
'    dbo.Data0034 ON dbo.data0492.mrb_ptr = dbo.Data0034.RKEY'+#13+
'WHERE     (dbo.data0492.TSTATUS IN (0, 2))';

  inputvar.KeyField:='CUT_NO';
  inputvar.InPut_value:=edit8.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edit8.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cut_no']);
    edit7.Text:= frmPick_Item_Single.adsPick.Fieldbyname('PROD_CODE').AsString;
    if Edit4.Text='' then
    begin
     edit4.Text:=frmPick_Item_Single.adsPick.Fieldbyname('DEPT_CODE').AsString;
     label7.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('dept_name').AsString;
     self.dept_ptr:=frmPick_Item_Single.adsPick.Fieldbyname('mrb_ptr').AsInteger;
    end;
  end
  else edit8.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

end.
