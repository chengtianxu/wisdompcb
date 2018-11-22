unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ComCtrls, ExtCtrls, Buttons,DateUtils;

type
  TForm1 = class(TForm)
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
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    lab_rkey15: TLabel;
    RadioGroup2: TRadioGroup;
    procedure N1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   sql_text:string;
   procedure update_sgrid(sgrid_row: byte);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses common,Pick_Item_Single ,ConstVar,Datamodule,Frm_tree_u, PasEntries;

{$R *.dfm}
procedure TForm1.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 if listbox3.itemindex in [0,1,2,3,4,5,6,10,11] then
   sgrid1.Cells[1,sgrid_row]:=trim(edit3.Text)
 else if listbox3.itemindex in [7,8] then
   sgrid1.Cells[1,sgrid_row]:=ComboBox1.Items[ComboBox1.ItemIndex]
 else
   sgrid1.Cells[1,sgrid_row]:=edit3.Text+' - '+edit1.Text;
 case listbox3.ItemIndex of
   0:
   begin
     if (RadioGroup2.ItemIndex=0) then sgrid1.Cells[2,sgrid_row]:='and Data0105.VOUCHER = '''+edit3.Text+'''' else
     sgrid1.Cells[2,sgrid_row]:='and Data0105.VOUCHER like ''%'+edit3.Text+'%''';
   end;
   1:
   begin
     if (RadioGroup2.ItemIndex=0) then sgrid1.Cells[2,sgrid_row]:='and Data0105.BATCH_NUMBER = '''+edit3.Text+'''' else
     sgrid1.Cells[2,sgrid_row]:='and Data0105.BATCH_NUMBER like ''%'+edit3.Text+'%''';
   end;
   2: sgrid1.Cells[2,sgrid_row]:='and Data0005.EMPLOYEE_NAME = '''+edit3.Text+'''';
   3: sgrid1.Cells[2,sgrid_row]:='and Data0005_1.EMPLOYEE_NAME = '''+edit3.Text+'''';
   4: sgrid1.Cells[2,sgrid_row]:='and Data0005_2.EMPLOYEE_NAME = '''+edit3.Text+'''';
   5:
   begin
     if (RadioGroup2.ItemIndex=0) then sgrid1.Cells[2,sgrid_row]:='and data0106.DESCRIPTION = '''+edit3.Text+'''' else
     sgrid1.Cells[2,sgrid_row]:=' and data0106.DESCRIPTION like ''%'+edit3.Text+'%''';
   end;
   6:
   begin
     if (RadioGroup2.ItemIndex=0) then sgrid1.Cells[2,sgrid_row]:='and data0103.GL_ACC_NUMBER = '''+edit3.Text+'''' else
     sgrid1.Cells[2,sgrid_row]:=' and data0103.GL_ACC_NUMBER like ''%'+edit3.Text+'%''';
   end;
   7:sgrid1.Cells[2,sgrid_row]:=' and Data0106.D_C = '''+ComboBox1.Items[ComboBox1.ItemIndex]+'''';
   
   8:sgrid1.Cells[2,sgrid_row]:=' and data0106.CURR_PTR= '+InttoStr(ComboBox1.ItemIndex+1)+'';
   9:sgrid1.Cells[2,sgrid_row]:=' and data0106.AMOUNT>='+edit3.Text+' and data0106.AMOUNT<='+edit1.Text+'';
   10:
   begin
     if (RadioGroup2.ItemIndex=0) then sgrid1.Cells[2,sgrid_row]:='and Data0105.CUSTOMER_PTR = '''+edit3.Text+'''' else
     sgrid1.Cells[2,sgrid_row]:='and Data0105.CUSTOMER_PTR like ''%'+edit3.Text+'%''';
   end;
   11:
   begin
     if (RadioGroup2.ItemIndex=0) then sgrid1.Cells[2,sgrid_row]:='and Data0105.SUPP_PTR = '''+edit3.Text+'''' else
     sgrid1.Cells[2,sgrid_row]:='and Data0105.SUPP_PTR like ''%'+edit3.Text+'%''';
   end;
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then
  begin
    SGrid1.Rows[1].Clear;
    exit;
  end;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:Integer;
    Type3:string;
begin
  if Edit3.Visible and (trim(Edit3.Text)='') then exit;
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

procedure TForm1.ListBox3Click(Sender: TObject);
begin
//  Button3.Enabled:=false;
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit1.Text:='';
  BitBtn6.Visible:=listbox3.ItemIndex in [2,3,4,6,10,11];
  RadioGroup2.Visible:=listbox3.ItemIndex in [0,1,5,6,10,11];
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
  Button3.Enabled:=true;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
    i:integer;
begin
  if ListBox3.ItemIndex=6 then
  begin
//    if Frm_tree=nil then
//    begin
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
//    end;
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
    InputVar.Sqlstr:='SELECT dbo.Data0005.Rkey,dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,'+
    'data0005.ABBR_NAME FROM dbo.Data0005 order  by empl_code';
    inputvar.KeyField:='EMPL_CODE';
   end;
    10:
    begin
      InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                        'from data0010 order by cust_code';
      inputvar.KeyField:='cust_code';
    end;
    11:
    begin
      InputVar.Fields := 'CODE/供应商代码/100,SUPPLIER_NAME/供应商名称/250';
      InputVar.Sqlstr :='select RKEY,CODE,SUPPLIER_NAME '+
                        'from data0023 order by CODE';
      inputvar.KeyField:='CODE';
    end;
 end;

  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := dm.ADOCnn;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    if listbox3.ItemIndex in [2,3,4] then
    begin
      edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
    end else
    if ListBox3.ItemIndex in [10] then
    begin
      edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
    end else
    if ListBox3.ItemIndex in [11] then
    begin
      edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
    end;
    lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
    button3.SetFocus;
  end
  else
    edit3.SetFocus;


 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; 
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormShow(Sender: TObject);
var i:integer;
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
  dtpk1.Date:=StartOfTheMonth(Now);
  dtpk2.Date:=Now;
  sql_text:=dm.ADODS106.SQL.Text;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i:Integer;
    Sqlstr:string;
begin
  with DM.ADODS106 do
  begin
   close;
   DM.ADODS106.SQL.Clear;
   DM.ADODS106.SQL.Text:=sql_text;
   if not Checkbox1.Checked  then
    Parameters.ParamByName('vptr1').Value :=0
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

   if not Checkbox10.Checked  then                 //特殊转帐凭证
    Parameters.ParamByName('vptr5').Value :=4
   else
    parameters.ParamByName('vptr5').Value :=9;

   //凭证状态(审核
   if not Checkbox5.Checked  then
     parameters.ParamByName('vstatus1').Value :=0
   else
     parameters.ParamByName('vstatus1').Value :=9;

   if not Checkbox6.Checked  then
     parameters.ParamByName('vstatus1').Value :=0
   else
     parameters.ParamByName('vstatus1').Value :=9;

   if not Checkbox7.Checked  then
     parameters.ParamByName('vstatus2').Value :=4
   else
     parameters.ParamByName('vstatus2').Value :=9;

   if not Checkbox8.Checked  then
     parameters.ParamByName('vstatus3').Value :=3
   else
     parameters.ParamByName('vstatus3').Value :=9;

   if not Checkbox9.Checked  then
     parameters.ParamByName('vstatus4').Value :=1
   else
     parameters.ParamByName('vstatus4').Value :=9;

   if not Checkbox10.Checked  then
     parameters.ParamByName('vstatus5').Value :=2
   else
     parameters.ParamByName('vstatus5').Value :=9;
   if not Checkbox11.Checked  then
     parameters.ParamByName('vstatus6').Value :=5
   else
     parameters.ParamByName('vstatus6').Value :=9;
    Sqlstr:='';
    for i:=1 to SGrid1.RowCount-2 do
    if sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+sgrid1.Cells[2,i];
    SQL.Insert(sql.Count,Sqlstr);
   parameters.ParamByName('vDt1').Value :=dtpk1.Date;
   parameters.ParamByName('vDt2').Value :=dtpk2.Date+1;
   screen.Cursor:=crSQLWait;
   Prepared;
   open;
   screen.Cursor:=crDefault;
 end;
  if FrmEntries=nil then  FrmEntries:=TFrmEntries.Create(Application);
  with TFrmEntries.Create(nil) do
  begin
    if showmodal=mrok then
    begin
    
    end;
    Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.ADOCnn) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;

// rkey73:='2525';
// user_ptr := '100';
// vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

end.
