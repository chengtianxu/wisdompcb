unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DBCtrls, Mask,
  Menus, ExtCtrls,QuickRpt;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
    Label6: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    CheckBox7: TCheckBox;
    N13: TMenuItem;
    Splitter1: TSplitter;
    Label8: TLabel;
    dtpk1: TDateTimePicker;
    Label9: TLabel;
    DTPk2: TDateTimePicker;
    N1: TMenuItem;
    CheckBox8: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure checkvar();
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpk1Exit(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    function if_receivd():boolean;
    function misc_ship_tax():double;
    function SmallTOBig(small:double):string;
    procedure N13Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }

    employee_name: string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
   v_employee: integer;
   sort_sysdate: tdatetime;
  end;

var
  Form1: TForm1;
  v_new_type:byte; //新建采购定单时0,新建标准定单...1,新建杂项采购定单
implementation
uses damo, supp_search, po_inspection,
  desi_report, desi_reportmic,common,
  desi_o_report, desi_o_reportmic, waifa_report;
{$R *.dfm}
procedure tform1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure tform1.checkvar();
begin
 dm.AQ0070.Close;
if not checkbox1.Checked then
 dm.AQ0070.Parameters[0].Value:=1
else
 dm.AQ0070.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.AQ0070.Parameters[1].Value:=2
else
 dm.AQ0070.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.AQ0070.Parameters[2].Value:=3
else
 dm.AQ0070.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.AQ0070.Parameters[3].Value:=4
else
 dm.AQ0070.Parameters[3].Value:=0;
if not checkbox5.Checked then
 dm.AQ0070.Parameters[4].Value:=5
else
 dm.AQ0070.Parameters[4].Value:=0;
if not checkbox6.Checked then
 dm.AQ0070.Parameters[5].Value:=6
else
 dm.AQ0070.Parameters[5].Value:=0;
if not checkbox7.Checked then
 dm.AQ0070.Parameters[6].Value:=7
else
 dm.AQ0070.Parameters[6].Value:=0;
if not checkbox8.Checked then
 dm.AQ0070.Parameters[7].Value:=8
else
 dm.AQ0070.Parameters[7].Value:=0;

 dm.AQ0070.Parameters[8].Value:= dtpk1.Date;
 dm.AQ0070.Parameters[9].Value:= dtpk2.Date;
 DM.AQ0070.open;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 checkvar();
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
try
 form_supp:=tform_supp.Create(application);
 form_supp.Edit1.Text := trim(edit1.Text);
 if form_supp.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end
 else
 if form_supp.ShowModal=mrok then
  begin
   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label7.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(19);
     sql.Insert(19,'and data0023.rkey='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
   dbgrid1.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 form_supp.free;
end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
 IF edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
   and (trim(edit1.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  form_supp.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label7.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   with dm.AQ0070 do
    begin
     close;
     sql.Delete(19);
     sql.Insert(19,'and data0023.rkey='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
     open;
    end;
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label7.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_supp.Free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')
  and (trim(edit1.Text)='') then
 with dm.AQ0070 do
  begin
   close;
   sql.Delete(19);
   sql.Insert(19,'');
   open;
   label7.Caption:='';
  end;
end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 v_bar:string;
begin
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
   bar1.SimpleText := copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
  if length(bar1.SimpleText)>5 then
   begin
    v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
    dm.aq0070.Filter := 'po_number like '''+trim(v_bar)+'%'''
   end
  else
   dm.aq0070.Filter :='';
 end
else
  begin
   bar1.SimpleText := bar1.SimpleText+key;
   v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
    dm.aq0070.Filter := 'po_number like '''+trim(v_bar)+'%'''
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ0070.IsEmpty then
 begin
  n3.Enabled := false;
  n13.Enabled := false;
  n1.Enabled := false;
 end
else
 begin
  n3.Enabled := true;
  n13.Enabled := true;
  if (dm.AQ0070PRINT_DATE.AsVariant = null) then
   n1.Enabled :=true
  else
   n1.Enabled := false;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);   //检查
begin
 try
  form13:=tform13.Create(application);
  dm.ADO70.Close;
  dm.ADO70.Parameters[0].Value := dm.AQ0070rkey.Value;
  dm.ADO70.Open;
  dm.ADO70PO_NUMBER.EditMask:='';
  form13.ShowModal;
 finally
  form13.free;
 end;
end;


procedure TForm1.FormCreate(Sender: TObject);

begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if dm.Adoconnection1.Connected then
 begin

  dtpk2.Date:=date();
  dtpk1.Date:=date()-30;

  dm.AQ0070.Close;
  dm.AQ0070.Parameters[0].Value := 1;
  dm.AQ0070.Parameters[1].Value := 2;
  dm.AQ0070.Parameters[2].Value := 3;
  dm.AQ0070.Parameters[3].Value := 4;
  dm.AQ0070.Parameters[4].Value := 0;
  dm.AQ0070.Parameters[5].Value := 6;
  dm.AQ0070.Parameters[6].Value := 7;
  dm.AQ0070.Parameters[7].Value := 8;
  dm.AQ0070.Parameters[8].Value:= dtpk1.Date;
  dm.AQ0070.Parameters[9].Value:= dtpk2.Date;
  dm.AQ0070.Open;

  dm.aq0017.Open;
  dm.AQ0001.Open;
  dm.AQ0024.Open;
  dm.AQ0199.Open;
  dm.AQ0493.Open;
  dm.aq0002.open;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0077');
   open;
   if isempty then
   begin
    messagedlg('采购审批人员不能为空记录,请运行材料采购审批授权!',mtinformation,[mbok],0);
    application.Terminate;
    exit;
   end;
  end;
 with dm.ADOQuery1 do
  begin                   //查找系统用户的员工指针
   active:=false;
   sql.Clear;             //给编辑人员赋值
   sql.Add('select data0073.employee_ptr,data0005.employee_name');
   sql.Add('from data0073 inner join data0005');
   sql.Add('on data0073.employee_ptr=data0005.rkey');
   sql.Add('where data0073.rkey='+rkey73);
   active:=true;
   v_employee:=fieldvalues['employee_ptr'];
   employee_name:=fieldvalues['employee_name']
  end;
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select v_dt = getdate()');
    active:=true;   //读取系统时间
    sort_sysdate := strtodate(datetostr(fieldvalues['v_dt']));//采购定单日期
   end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.AQ0070.SQL.Text);
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 checkbox1click(sender);
end;

procedure TForm1.dtpk1CloseUp(Sender: TObject);
begin
 dbgrid1.SetFocus;
end;

function tform1.if_receivd():boolean;
begin
 if_receivd:=false;
 if dm.AQ0070PO_TYPE.Value='S' then
  with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0071');
    sql.Add('where po_ptr='+dm.AQ0070rkey.AsString);
    sql.Add('and quan_recd>0');
    open;
    if not isempty then if_receivd:=true;
   end
 else
  with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0072');
    sql.Add('where poptr='+dm.AQ0070rkey.AsString);
    sql.Add('and QUANTITY_RECEIVED>0');
    open;
    if not isempty then if_receivd:=true;
   end;
end;


function tform1.misc_ship_tax():double;
var
 v_ship_tax,v_misc_tax,misc_base:single;
begin
 with dm.ADO200 do    //查找PO的杂项费用
  begin
   active:=false;
   Parameters[0].Value := dm.AQ0070rkey.Value;
   active:=true;
  end;
 v_ship_tax:=0;      //计算杂项与运输费用税金
 v_misc_tax:=0;
 misc_base:=0;
if dm.ADO70STATE_SHIP_TAX_FLAG.Value='Y' then
 v_ship_tax :=dm.ADO70SHIPPING_COST.Value*dm.ADO70FEDERAL_TAX.Value*0.01;
if dm.ADO70STATE_MISC_TAX_FLAG.Value='Y' then
 begin
  dm.ado200.First;
  while not dm.ADO200.Eof do
   begin
    if dm.ADO200TAXABLE.Value='Y' then
     misc_base := misc_base+ dm.ADO200AMOUNT.Value;
    dm.ADO200.Next;
   end;
  v_misc_tax := misc_base*dm.ADO70FEDERAL_TAX.Value*0.01;
 end;
 misc_ship_tax:=v_ship_tax+v_misc_tax;
 dm.ADO200.Close;
end;


function Tform1.SmallTOBig(small:double):string;
var
SmallMonth,BigMonth:string;
wei1,qianwei1:string[2];
qianwei,dianweizhi,qian:integer;
begin
 qianwei:=-2;
 Smallmonth:=formatfloat('0.00',small);
 dianweizhi :=pos('.',Smallmonth);{小数点的位置}
for qian:=length(Smallmonth) downto 1 do
begin
if qian<>dianweizhi then{如果读到的不是小数点就继续}
begin
case strtoint(copy(Smallmonth,qian,1)) of{位置上的数转换成大写}
 1:wei1:='壹'; 2:wei1:='贰';
 3:wei1:='三'; 4:wei1:='肆';
 5:wei1:='伍'; 6:wei1:='陆';
 7:wei1:='柒'; 8:wei1:='捌';
 9:wei1:='玖'; 0:wei1:='零';
end;
case qianwei of {判断大写位置，可以继续增大到real类型的最大值}
 -3:qianwei1:='厘';
 -2:qianwei1:='分';
 -1:qianwei1:='角';
 0 :qianwei1:='元';
 1 :qianwei1:='拾';
 2 :qianwei1:='佰';
 3 :qianwei1:='千';
 4 :qianwei1:='万';
 5 :qianwei1:='拾';
 6 :qianwei1:='佰';
 7 :qianwei1:='千';
 8 :qianwei1:='亿';
 9 :qianwei1:='十';
 10:qianwei1:='佰';
 11:qianwei1:='千';
end;
 inc(qianwei); //自动加1
 BigMonth :=wei1+qianwei1+BigMonth;{组合成大写金额}
end;
end;
 SmallTOBig:=BigMonth;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
 dm.ADO70.Close;
 dm.ADO70.Parameters[0].Value := dm.AQ0070rkey.Value;
 dm.ADO70.Open;
 with dm.ADO200 do    //查找PO的杂项费用
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70.FieldValues['rkey'];
   active:=true;
  end;
 with dm.ado107011 do //读取交货记事本
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70.FieldValues['rkey'];
   active:=true;
  end;
 with dm.ado7011 do //读取订单记事本
  begin
   active:=false;
   Parameters[0].Value := dm.ADO70.FieldValues['rkey'];
   active:=true;
  end;
   dm.AQ0015.Close;
   dm.AQ0015.Parameters[0].Value := dm.ADO70WAREHOUSE_POINTER.Value;
   dm.AQ0015.Open;

 if dm.AQ0070PO_TYPE.Value='S' then   //如果是标准的采购定单
  begin
   with dm.ADO71 do           //读取标准采购内容
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT * FROM data0071');
     sql.Add('where po_ptr='+dm.ADO70RKEY.AsString);
     active:=true;
    end;
   if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
    try
     form14:=tform14.Create(application);
     Form14.ppReport1.Print;    //列印标准发票
    finally
     form14.free;
     dm.AQ0015.Close;
    end
   else                               //国处采购
    try
     form17:=tform17.Create(application);
     Form17.ppReport1.Print;    //列印标准发票
    finally
     form17.free;
     dm.AQ0015.Close;
    end;
  end
else               //杂项采购订单
 if dm.AQ0070PO_TYPE.Value='M' then
 begin
  with dm.ADO72 do           //读取杂项采购内内容
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0072');
    sql.Add('where poptr='+dm.ADO70RKEY.AsString);
    active:=true;
   end;
  if dm.ADO70DISCOUNT2_DAYS.Value=0 then //国内采购
   try
    form15:=tform15.Create(application);
    Form15.ppReport1.Print;
   finally
    form15.free;
    dm.AQ0015.Close;
   end
  else                                      //国外采购
   try
    form18:=tform18.Create(application);
    Form18.ppReport1.Print;
   finally
    form18.free;
    dm.AQ0015.Close;
   end;
 end
 else
  begin
   with dm.ADO71 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT * FROM data0071');
     sql.Add('where po_ptr='+dm.AQ0070rkey.AsString);
     active:=true;
     if dm.ADO71.Filter <> '' then dm.ADO71.Filter := '';
    end;
   try
    form5:=tform5.Create(application);
    try
     if (dm.ADO70STATUS.Value=1) or (dm.ADO70STATUS.Value=2) or
       (dm.ADO70STATUS.Value=3) or (dm.ADO70STATUS.Value=4) or
       (dm.ADO70STATUS.Value=8) then
      begin                        //未审核的订单使签名不可风见
       form5.ppImage1.Visible :=false;
       form5.ppImage2.Visible :=false;
      end;
    except
    end;
    Form5.ppReport1.Print;
   finally
    form5.free;
    dm.AQ0015.Close;
   end;
  end;

 if messagedlg('将该PO标识为已打印吗？',mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
   dm.AQ0070.Edit;
   dm.AQ0070PRINT_DATE.Value :=sort_sysdate;
   dm.AQ0070.Post;
  end;

end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (dm.AQ0070PRINT_DATE.AsVariant <> null) then
  DBGrid1.Canvas.Font.Color := clred;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TForm1.N1Click(Sender: TObject);
 begin
  dm.AQ0070.Edit;
  dm.AQ0070PRINT_DATE.Value :=sort_sysdate;
  dm.AQ0070.Post;
 end;

procedure TForm1.FormResize(Sender: TObject);
begin
 dbgrid1.Columns[0].Width:=122+round((dbgrid1.Width-735)*122/705);
 dbgrid1.Columns[1].Width:=70+round((dbgrid1.Width-735)*70/705);
 dbgrid1.Columns[2].Width:=64+round((dbgrid1.Width-735)*64/705);
 dbgrid1.Columns[3].Width:=69+round((dbgrid1.Width-735)*69/705);
 dbgrid1.Columns[4].Width:=96+round((dbgrid1.Width-735)*96/705);
 dbgrid1.Columns[5].Width:=79+round((dbgrid1.Width-735)*79/705);
 dbgrid1.Columns[6].Width:=56+round((dbgrid1.Width-735)*56/705);
 dbgrid1.Columns[7].Width:=74+round((dbgrid1.Width-735)*74/705);
 dbgrid1.Columns[8].Width:=75+round((dbgrid1.Width-735)*75/705);
 
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if not dm.AQ0070.IsEmpty then n3click(sender);
end;

end.
