unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  TForm_condition = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label3: TLabel;
    procedure ListBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  Form_condition: TForm_condition;

implementation

uses common,Pick_Item_Single ,ConstVar,uDM,Frm_tree_u;

{$R *.dfm}

procedure TForm_condition.ListBox3Click(Sender: TObject);
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

procedure TForm_condition.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
end;

procedure TForm_condition.Edit3Change(Sender: TObject);
begin
  button3.Enabled:= trim(edit3.Text)<>'';
end;

procedure TForm_condition.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) and (button3.Enabled=true) then
   button3.SetFocus;
end;

procedure TForm_condition.SGrid1MouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    SGrid1.MouseToCell(x,y,column,row);
    if row<>0 then SGrid1.Row:=row;
  end;
end;

procedure TForm_condition.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_condition.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TForm_condition.update_sgrid(sgrid_row: byte);
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


procedure TForm_condition.Button3Click(Sender: TObject);
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


procedure TForm_condition.BitBtn6Click(Sender: TObject);
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
  InputVar.AdoConn := dm.ADOCnn;
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

procedure TForm_condition.BitBtn1Click(Sender: TObject);
var Y,M,D:word;
begin
 { DecodeDate(dtpk1.Date,Y, M, D);
  if (vprev<>'4') and  (Y<FY) then
    showmessage('您只有查询当前年度凭证权限,请与管理员联系!')
  else }
    ModalResult:=mrok;
end;

procedure TForm_condition.FormDestroy(Sender: TObject);
begin
  Frm_tree.Free;
end;

end.
