unit remaout_form2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls,
  Buttons, DBGrids;

type
  TForm_remaout2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dt1: TDateTimePicker;
    Edit2: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    key15: TLabel;
    key16: TLabel;
    edit1: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    key34: TLabel;
    DBGrid1: TDBGrid;
    sgrid1: TStringGrid;
    SGrid2: TStringGrid;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    MenuItem2: TMenuItem;
    N4: TMenuItem;
    Label7: TLabel;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_remaout2: TForm_remaout2;

implementation

uses main,damo,unit_outser,unit_numedit, Unit_numout, Unit_deptser,Unit_numout2
,common;
{$R *.dfm}

procedure TForm_remaout2.FormShow(Sender: TObject);
begin

 sgrid1.Cells[0,0]:='材料编码';
 sgrid1.Cells[1,0]:='材料规格';
 sgrid1.Cells[2,0]:='发放数量';
 sgrid1.Cells[3,0]:='供应商简称';
 sgrid1.Cells[4,0]:='配料单号';



 dt1.DateTime:=strtodatetime(form1.sys_time);
 dm.ADOQuery4.Open;
 edit1.text:=dm.ADOQuery4CUT_NO.AsString;
 //form_outser:=tform_outser.Create(self);
end;

procedure TForm_remaout2.N1Click(Sender: TObject);
begin
if (sgrid1.RowCount=2)and (trim(sgrid1.Cells[0,1])<>'') then
 begin
 sgrid1.Rows[1].Text:='';
 sgrid2.Rows[1].Text:='';
 end
else if sgrid1.RowCount>2 then
 begin
 form1.GridRemoveRow(sgrid1,sgrid1.Row+1);
 form1.GridRemoveRow(sgrid2,sgrid1.Row+1);
 end;

 ComboBox1.Enabled:=True;
 Edit3.Enabled:=True;
 ComboBox2.Enabled:=True;
 dt1.Enabled:=True;
 BitBtn1.Enabled:=True;
end;

procedure TForm_remaout2.ComboBox1Change(Sender: TObject);
begin
 with dm.ADOQ do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0015');
  sql.Add('where abbr_name ='''+trim(combobox1.Text)+'''');
  open;
  key15.Caption:=fieldbyname('rkey').AsString;
 end;
end;

procedure TForm_remaout2.ComboBox2Change(Sender: TObject);
begin
 with dm.ADOQ do
 begin
 close;
 sql.Clear;
 sql.Add('select rkey from data0016');
 sql.Add('where location='''+trim(combobox2.Text)+'''');
 open;
 self.key16.Caption:=fieldbyname('rkey').AsString;
 end;
end;

procedure TForm_remaout2.Button1Click(Sender: TObject);
var
 i:byte;
 v_total :integer;
begin
 try
  v_total:=0;
//============================判断输入编号是否重复==============================
    if form1.find_error(trim(edit1.text)) then
   if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.adoout04.Close;
    dm.adoout04.Open;
    edit1.Text:=dm.adoout04SEED_VALUE.Value;
   end
  else
   begin
    edit1.SetFocus;
    exit;
   end;


//form_outser.ADOQuery1.Cancel;

 dm.ADOConnection1.BeginTrans;  //开始一个会话期间
 if trim(sgrid1.Cells[0,1])<>'' then

 for i:=1 to sgrid1.RowCount-1 do  v_total:=v_total+strtoint(sgrid1.Cells[2,i]);


   //==========================增加data0558的记录=================================
 with dm.ADO558add do
 begin
  open;
  append;
  dm.ADO558addrema_number.Value:=edit1.Text;
  dm.ADO558addQUAN_ON_HAND.Value:=v_total;
  dm.ADO558addRKEY15.AsString:=self.key15.Caption;
  dm.ADO558addRKEY16.AsString:=self.key16.Caption;
  dm.ADO558addremark.Value:=edit2.Text;
  dm.ADO558addttype.Value:=2;
  dm.ADO558addkey34.AsString:=key34.Caption;
  dm.ADO558addtdate.Value:=dt1.DateTime;
  dm.ADO558addempl_by_ptr.AsString:= user_ptr;
  post;
 end;



 //form1.update_04out(edit1.Text);     //更新数据库data0004

 if trim(sgrid1.Cells[0,1])<>'' then
 for i:=1 to sgrid1.RowCount-1 do
 begin
 //=========================update data0556库存=================================
  with dm.ADOQ do
  begin
   close;
   sql.Clear;
   sql.Add('select quan_on_hand from data0556');
   sql.Add('where rkey='+sgrid2.Cells[0,i]);
   open;
   edit;
   dm.ADOQ.FieldByName('quan_on_hand').Value:=dm.ADOQ.FieldByName('quan_on_hand').Value
                                              -strtoint(SGrid1.Cells[2,i]) ;
   post;
 end;
 //=========================增加data0557的记录===================================
  with dm.ADO557add do
  begin
   open;
   append;
   dm.ADO557addD558_PTR.AsString:=dm.ADO558addRKEY.AsString;
   dm.ADO557addNUMBER.AsString:=sgrid1.Cells[2,i];
   dm.ADO557addD556_PTR.AsString:=sgrid2.Cells[0,i];
   dm.ADO557addquan_on_hand.Value:=dm.ADOQ.FieldByName('quan_on_hand').Value;
   post;
  end;



   // =========================修改data0468的已发数量===================================
  with  dm.ADOQuery5 do
  begin
      close;
      Parameters.ParamByName('rkey556').Value:=strtoint(sgrid2.Cells[0,i]);
      Open;
  end;




 end; //对应for语句的begin
 dm.ADOConnection1.CommitTrans;
 except
 on e:exception do
 begin
  showmessage(e.Message);
  dm.ADOConnection1.RollbackTrans;
 end;
end;
 modalresult:=mrok;

end;

procedure TForm_remaout2.sgrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
  {
if button=mbright then
 begin
  sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
 end; }
end;

procedure TForm_remaout2.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_remaout2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

dm.ADOQuery4.Close;

end;

procedure TForm_remaout2.BitBtn1Click(Sender: TObject);
begin
try
 form_deptser:=tform_deptser.Create(application);
 if form_deptser.ShowModal=mrok then
 begin
 edit3.Text:=form_deptser.ADOQuery1dept_name.Value;
 self.key34.Caption:=form_deptser.ADOQuery1rkey.AsString;
 sgrid1.Setfocus;
 end;
finally
form_deptser.Free;
end;
end;

procedure TForm_remaout2.Edit3Exit(Sender: TObject);
begin
 if trim(edit3.Text)<>'' then
 begin
  try form_deptser:=tform_deptser.create(application);
  if not form_deptser.ADOQuery1.Locate('dept_name',trim(edit3.Text),[]) then
   begin
   showmessage('请输入正确的部门名称！');
   edit3.SetFocus;
   end
 else
   self.key34.Caption:=form_deptser.ADOQuery1rkey.AsString;
 finally
 form_deptser.free;
 end;
 end;
end;

procedure TForm_remaout2.N4Click(Sender: TObject);
begin

 if edit3.Text='' then
 begin
     ShowMessage('请先选择领料部门!');
     exit;
 end;

try
 form_numout2:=tform_numout2.Create(application);
 //==================== 给form_numout初始化 ====================================
 with form_numout2 do
 begin

  edit1.Text:=dm.ADOQuery4MAT_CODE.Value;
  edit2.Text:=dm.ADOQuery4mat_desc.Value;
  edit7.Text:=dm.ADOQuery4quan_on_hand.AsString;
  
 end;
//=======================给form_remaout赋值=====================================
 if form_numout2.ShowModal=mrok then
 begin
  if (form_remaout2.SGrid1.RowCount>=2)and (form_remaout2.SGrid1.Cells[0,1]<>'') then
   begin

    form_remaout2.SGrid1.RowCount:=form_remaout2.SGrid1.RowCount+1;
    form_remaout2.SGrid2.RowCount:=form_remaout2.SGrid2.RowCount+1;
   end;
   with Form_remaout2 do
   begin

    sgrid1.Cells[0,sgrid1.RowCount-1]:=form_numout2.Edit1.Text;    //编码
    sgrid1.Cells[1,sgrid1.RowCount-1]:=form_numout2.edit2.Text ;   //规格
    sgrid1.Cells[2,sgrid1.RowCount-1]:=form_numout2.Edit5.Text ;   //发放数量
    sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ADOQuery4abbr_name.value ;   //供应商简称
    sgrid1.Cells[4,sgrid1.RowCount-1]:=dm.ADOQuery4CUT_NO.value ;   //配料单号
    sgrid2.Cells[0,sgrid1.RowCount-1]:=dm.ADOQuery4rkey556.AsString;
    sgrid2.Cells[1,sgrid1.RowCount-1]:=dm.ADOQuery4QUAN_ON_HAND.AsString;//记录仓库的库存量

    ComboBox1.Enabled:=false;
    Edit3.Enabled:=false;
    ComboBox2.Enabled:=false;
    dt1.Enabled:=false;
    BitBtn1.Enabled:=false;
   end;
  //self.ADOQuery1.Delete;
 end;
finally
  form_numout2.Free;
end;
end;

procedure TForm_remaout2.Edit4Change(Sender: TObject);
begin
if trim(Edit4.text)<>'' then
  dm.ADOQuery4.Filter:='CUT_NO'+' LIKE ''%'+TRIM(EDIT4.TEXT)+'%'''

 ELSE
  dm.ADOQuery4.FILTER:='';
end;

procedure TForm_remaout2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF (ssalt in shift) AND ((KEY=ORD('S')) OR (KEY=ORD('s'))) then showmessage(dm.ADOQuery4.SQL.Text);
end;

end.
