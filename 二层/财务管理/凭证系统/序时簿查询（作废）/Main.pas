unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Mask,
  Menus, ADODB, Buttons, Spin;

type
  TFrmMain = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    Edit1: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Edit4: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private

    { Private declarations }
    procedure update_sgrid(sgrid_row: byte);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses Datamodule,notelist,common,Pick_Item_Single,ConstVar, Frm_tree_u;

{$R *.dfm}
procedure TFrmMain.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 if listbox3.itemindex<7 then
   sgrid1.Cells[1,sgrid_row]:=trim(edit3.Text)
 else if listbox3.itemindex in [7,8] then
   sgrid1.Cells[1,sgrid_row]:=ComboBox1.Items[ComboBox1.ItemIndex]
 else
   sgrid1.Cells[1,sgrid_row]:=edit3.Text+' - '+edit1.Text;
 case listbox3.ItemIndex of
   0:sgrid1.Cells[2,sgrid_row]:='and Data0105.VOUCHER like ''%'+edit3.Text+'%''';
   1:sgrid1.Cells[2,sgrid_row]:='and Data0105.BATCH_NUMBER like ''%'+edit3.Text+'%''';
   2:sgrid1.Cells[2,sgrid_row]:='and Data0005.EMPLOYEE_NAME = '''+edit3.Text+'''';
   3:sgrid1.Cells[2,sgrid_row]:='and Data0005_1.EMPLOYEE_NAME = '''+edit3.Text+'''';
   4:sgrid1.Cells[2,sgrid_row]:='and Data0005_2.EMPLOYEE_NAME = '''+edit3.Text+'''';

   5:sgrid1.Cells[2,sgrid_row]:='and Data0105.rkey in (select distinct GL_HEADER_PTR from data0106 where DESCRIPTION like ''%'+edit3.Text+'%'')';
   6:sgrid1.Cells[2,sgrid_row]:='and Data0105.rkey in (select distinct d106.GL_HEADER_PTR from data0106 d106 inner join data0103 d103 on d106.GL_ACCT_NO_PTR=d103.rkey where d103.GL_ACC_NUMBER like ''%'+edit3.Text+'%'')';
   7:sgrid1.Cells[2,sgrid_row]:='and Data0105.rkey in (select distinct GL_HEADER_PTR from data0106 where D_C = '''+ComboBox1.Items[ComboBox1.ItemIndex]+''')';
   8:sgrid1.Cells[2,sgrid_row]:='and Data0105.rkey in (select distinct d106.GL_HEADER_PTR from data0106 d106 inner join data0001 d01 on d106.curr_ptr=d01.rkey where d01.curr_code= '''+ComboBox1.Items[ComboBox1.ItemIndex]+''')';
   9:sgrid1.Cells[2,sgrid_row]:='and Data0105.rkey in (select distinct GL_HEADER_PTR from data0106 where AMOUNT>='+edit3.Text+' and AMOUNT<='+edit1.Text+')';
 end;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
var
  year,month,day:word;
begin
  decodedate(now,year,month,day);
  spinedit1.text:=inttostr(year);
  spinedit2.text:=inttostr(month);
end;

procedure TFrmMain.CheckBox1Click(Sender: TObject);
begin
  with DM.Adodata0106 do
  begin
   close;
   if not Checkbox1.Checked  then
    parameters.ParamByName('vptr1').Value :=0
   else
    parameters.ParamByName('vptr1').Value :=9;
   if not Checkbox2.Checked  then
    parameters.ParamByName('vptr2').Value :=1
   else
    parameters.ParamByName('vptr2').Value :=9;
   if not Checkbox3.Checked  then
    parameters.ParamByName('vptr3').Value :=2
   else
    parameters.ParamByName('vptr3').Value :=9;
   if not Checkbox4.Checked  then
    parameters.ParamByName('vptr4').Value :=3
   else
    parameters.ParamByName('vptr4').Value :=9;
   if not Checkbox5.Checked  then
    parameters.ParamByName('vptr5').Value :=4
   ELSE
    parameters.ParamByName('vptr5').Value :=9;
  end;
end;

procedure TFrmMain.CheckBox6Click(Sender: TObject);
begin
  with DM.Adodata0106 do
  begin
   close;
   if not Checkbox6.Checked  then
    parameters.ParamByName('vstatus1').Value :=0
   else
    parameters.ParamByName('vstatus1').Value :=9;

   if not Checkbox9.Checked  then
    parameters.ParamByName('vstatus2').Value :=1
   else
    parameters.ParamByName('vstatus2').Value :=9;

   if not Checkbox10.Checked  then
    parameters.ParamByName('vstatus3').Value :=2
   else
    parameters.ParamByName('vstatus3').Value :=9;

   if not Checkbox7.Checked  then
    parameters.ParamByName('vstatus4').Value :=4
   else
    parameters.ParamByName('vstatus4').Value :=9;

   if not Checkbox8.Checked  then
    parameters.ParamByName('vstatus5').Value :=3
   else
    parameters.ParamByName('vstatus5').Value :=9;

   if not Checkbox11.Checked  then
    parameters.ParamByName('vstatus6').Value :=5
   else
    parameters.ParamByName('vstatus6').Value :=9;

  end;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  WITH DM.Adodata0106 do
  begin
    close;
    parameters.ParamByName('vfyear').Value :=strtoint(spinedit1.text);
    parameters.ParamByName('vperiod').Value :=strtoint(spinedit2.text);
    parameters.ParamByName('accnumber').Value :=trim(edit1.Text)+'%';
    open;
  end;
  if DM.Adodata0106.RecordCount=0 then
  begin
    messagedlg('没有符合条件的会计分录！',mtinformation,[mbok],0);
    exit;
  end;
  Application.CreateForm(TFrmList, FrmList);
  i:=1;
    FrmList.stringgrid1.Cells[1,0]:='凭证日期';
    FrmList.stringgrid1.Cells[0,0]:='凭证号';
    FrmList.stringgrid1.Cells[2,0]:='科目代号';
    FrmList.stringgrid1.Cells[3,0]:='科目名称';
    FrmList.stringgrid1.Cells[4,0]:='摘要';
    FrmList.stringgrid1.Cells[5,0]:='借方本币';
    FrmList.stringgrid1.Cells[6,0]:='贷方本币';
    FrmList.stringgrid1.Cells[7,0]:='输入';
    FrmList.stringgrid1.Cells[8,0]:='审核';
    FrmList.stringgrid1.Cells[9,0]:='过帐';
    FrmList.stringgrid1.Cells[10,0]:='货币';
    FrmList.stringgrid1.Cells[11,0]:='汇率';
  with DM.Adodata0106 do
  while not eof do
  begin
    FrmList.stringgrid1.rowcount:=i+1;
    FrmList.stringgrid1.Cells[1,i]:=fieldbyname('entered_dt').asstring;
    FrmList.stringgrid1.Cells[0,i]:=fieldbyname('voucher').asstring;
    FrmList.stringgrid1.Cells[2,i]:=fieldbyname('gl_acc_number').asstring;
    FrmList.stringgrid1.Cells[3,i]:=fieldbyname('self_desc').asstring;
    FrmList.stringgrid1.Cells[4,i]:=fieldbyname('description').asstring;
    if fieldbyname('d_c').asstring='D' then
      FrmList.stringgrid1.Cells[5,i]:=fieldbyname('amount').asstring
    else
      FrmList.stringgrid1.Cells[6,i]:=fieldbyname('amount').asstring;
    FrmList.stringgrid1.Cells[7,i]:=fieldbyname('operator').asstring;
    FrmList.stringgrid1.Cells[8,i]:=fieldbyname('auditor').asstring;
    FrmList.stringgrid1.Cells[9,i]:=fieldbyname('postman').asstring;
    FrmList.stringgrid1.Cells[10,i]:=fieldbyname('curr_code').asstring;
    FrmList.stringgrid1.Cells[11,i]:=fieldbyname('exch_rate').asstring;
    i:=i+1;
    next;
  end;
  FrmList.ShowModal ;
  FrmList.Free ;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  if DM.Adoconnection1.Connected then
   dm.ADOData0493.Open ;
end;

procedure TFrmMain.FormCreate(Sender: TObject);

begin
//  if not App_Init(dm.ADOConnection1) then
//  begin
//    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
//    application.Terminate;
//  end;
//  self.Caption :=Application.Title;


 rkey73:='2525';
 user_ptr := '100';
 vprev := '4';
end;

procedure TFrmMain.ListBox3Click(Sender: TObject);
begin
  Button3.Enabled:=false;
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit1.Text:='';
  BitBtn6.Visible:=listbox3.ItemIndex in [2,3,4,6];
  ComboBox1.Visible:=listbox3.ItemIndex in [7,8];
  if listbox3.ItemIndex=7 then
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Items.Append('D');
    ComboBox1.Items.Append('C');
    ComboBox1.ItemIndex:=0;
    Button3.Enabled:=true;
  end else if listbox3.ItemIndex=8 then begin
    ComboBox1.Items.Clear;
    Dm.tmp.Close;
    Dm.tmp.SQL.Text:='select curr_code from data0001 order by rkey';
    Dm.tmp.Open;
    while not Dm.tmp.Eof do
    begin
      ComboBox1.Items.Append(Dm.tmp.Fields[0].asstring);
      Dm.tmp.Next;
    end;
    ComboBox1.ItemIndex:=0;
    Button3.Enabled:=true;
  end;
  edit3.Visible:= not ComboBox1.Visible;
  Label3.Visible:= listbox3.ItemIndex=9;
  Edit1.Visible:= Label3.Visible;
end;

procedure TFrmMain.Button3Click(Sender: TObject);
var i:byte;
begin
  if (listbox3.itemindex=9) and (Edit1.Text='') and (Edit3.Text='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
    self.update_sgrid(i);
    exit;
  end;
  self.update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrmMain.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
    i:integer;
begin
  if ListBox3.ItemIndex=6 then
  begin
    if Frm_tree=nil then
    begin
      screen.Cursor:=crSQLWait;
      DM.tmp.Close;
      DM.tmp.SQL.Text:='SELECT Rkey, isnull(PARENT_PTR,0) PARENT ,GL_ACC_NUMBER+'' ''+GL_DESCRIPTION nm '+  //GL_ACC_NUMBER,GL_DESCRIPTION
                        'FROM Data0103  order by GL_ACC_NUMBER'; //where acc_Tp=1
      DM.tmp.Open;
      if DM.tmp.IsEmpty then
      begin
        DM.tmp.Close;
        showmessage('会计科目档案为空...');
        exit;
      end;
      Frm_tree:=TFrm_tree.Create(nil);
      Frm_tree.CreateTree(DM.tmp,0,false,'会计科目查找','所有科目');
      DM.tmp.Close;
      screen.Cursor:=crDefault;
    end;
    if Frm_tree.ShowModal=mrok then
    begin
      i:=pos(' ',Frm_tree.TreeView1.Selected.Text);
      edit3.Text:=copy(Frm_tree.TreeView1.Selected.Text,1,i-1);
    end;
    exit;
  end;

 frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
 try
   case self.ListBox3.ItemIndex of
   2,3,4:
   begin
    InputVar.Fields:='EMPL_CODE/员工代码/110,EMPLOYEE_NAME/员工姓名/200,abbr_name/简称/100';
    InputVar.Sqlstr:='SELECT dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,'+
    'data0005.ABBR_NAME FROM dbo.Data0005 order  by empl_code';
    inputvar.KeyField:='EMPL_CODE';
   end;
  end;

  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := dm.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
    button3.SetFocus;
  end
  else
    edit3.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; 
end;

end.
