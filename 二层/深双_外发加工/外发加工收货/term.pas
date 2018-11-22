unit term;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus;

type
  TForm4 = class(TForm)
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DTPk6: TDateTimePicker;
    DTpk5: TDateTimePicker;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Edit3: TEdit;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte);
    procedure FormActivate(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    warehouse_ptr:integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses supplier_search,  inv_search, empl_search,constvar,pick_item_single,data_module;

{$R *.dfm}

procedure TForm4.update_sgrid(sgrid_row: byte);
var s,s1:string;
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;
 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:=' and WZDATA300.epiboly_number LIKE '''+edit3.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid_row]:=' and Data0023.code LIKE '''+edit3.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid_row]:=' and Data0034.dept_code LIKE '''+edit3.Text+'%''';
 3:begin
   sgrid1.Cells[1,sgrid_row]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
   sgrid1.Cells[2,sgrid_row]:=
   'and  WZDATA300.refer_date>='''+datetostr(dtpk5.date)+''' and WZDATA300.refer_date<='''+datetostr(dtpk6.date+1)+''''
  end;
 4:
  sgrid1.Cells[2,sgrid_row]:=' and Data0025.MANU_PART_NUMBER LIKE ''%'+trim(edit3.Text)+'%''';
 5:
  sgrid1.Cells[2,sgrid_row]:=' and Data0025.MANU_PART_DESC LIKE ''%'+trim(edit3.Text)+'%''';
 6:
  begin //投产类型
   s1:= '';
   s := '';
   if CheckBox2.Checked then
   begin
    s1 := s1 + CheckBox2.Caption  + ';' ;
    if s = '' then s := '1'
    else s := s + ',1';
   end;
   if CheckBox3.Checked then
   begin
    s1 := s1 + CheckBox3.Caption + ';'  ;
    if s = '' then s := '2'
    else s := s + ',2';
   end;
   if CheckBox4.Checked then
   begin
    s1 := s1 + CheckBox4.Caption  + ';' ;
    if s = '' then s := '3'
    else s := s + ',3';
   end;
   if CheckBox5.Checked then
   begin
    s1 := s1 + CheckBox5.Caption + ';'  ;
    if s = '' then s := '4'
    else s := s + ',4';
   end;
   if CheckBox6.Checked then
   begin
    s1 := s1 + CheckBox6.Caption + ';'  ;
    if s = '' then s := '5'
    else s := s + ',5';
   end; {}
   s := '('+s+')';
   sgrid1.Cells[1,sgrid_row] := s1;
   sgrid1.Cells[2,sgrid_row]:=' and wzdata300.status in ' + s;
  end;
 7:sgrid1.Cells[2,sgrid_row]:=' and wzdata300.warehouse_ptr = '+inttostr(warehouse_ptr)+' ';

 8:begin
   sgrid1.Cells[1,sgrid_row]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
   sgrid1.Cells[2,sgrid_row]:=
   'and  WZDATA303.SHIP_DATE>='''+datetostr(dtpk5.date)+''' and WZDATA303.SHIP_DATE<='''+datetostr(dtpk6.date+1)+''''
  end;

 end;
end;

procedure TForm4.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
button3.Enabled:=false;

label8.Visible:=true;
bitbtn6.Visible:=false;
label7.Visible:=false;
label9.Visible:=false;
dtpk5.Visible:=false;
dtpk6.Visible:=false;
groupbox1.Visible:=false;

case listbox3.ItemIndex of
 0:bitbtn6.Visible:=false;
 1:bitbtn6.Visible:=true;
 2:bitbtn6.Visible:=true;
 3:begin
    edit3.Visible:=false;
    label7.Visible:=true;
    label9.Visible:=true;
    dtpk5.Visible:=true;
    dtpk6.Visible:=true;
    button3.Enabled:=true;
   end;
 4:bitbtn6.Visible:=true;
 5:bitbtn6.Visible:=false;
 6:
  begin
   label8.Visible:=false;
   groupbox1.Visible:=true;
   bitbtn6.Visible:=false;
   edit3.Visible:=false;
   button3.Enabled:=true;
  end;
 7:
  begin
   bitbtn6.Visible:=true;
   edit3.Visible:=true;
  end;

 8:
  begin
    edit3.Visible:=false;
    label7.Visible:=true;
    label9.Visible:=true;
    dtpk5.Visible:=true;
    dtpk6.Visible:=true;
    button3.Enabled:=true;
  end;

 end;
end;

procedure TForm4.Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if trim(edit3.Text)<>'' then
  button3.Enabled:=true
 else button3.Enabled:=false;
end;

procedure TForm4.BitBtn6Click(Sender: TObject);
var inputvar: PDlgInput; //搜索
begin
case self.ListBox3.ItemIndex of
1:begin
 try
  Form_supp:=TForm_supp.Create(application);
  Form_supp.Edit1.Text := trim(edit3.Text);
  if Form_supp.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit3.SetFocus;
   end
  else
  if Form_supp.ShowModal=mrok then
   begin
    edit3.Text :=   Form_supp.ADOQuery1CODE.Value;
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
 finally
  Form_supp.free;
 end;
  end;
2:begin
 try
  form_technics:=Tform_technics.Create(application);
  form_technics.Edit1.Text := trim(edit3.Text);
  if form_technics.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit3.SetFocus;
   end
  else
  if form_technics.ShowModal=mrok then
   begin
    edit3.Text := form_technics.ADOQuery1DEPT_CODE.Value;
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else edit3.SetFocus;
 finally
  form_technics.free;
 end;
  end;
4:begin
 try
  form_inv := tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[0].Value:=trim(edit3.Text)+'%';
  form_inv.ADOQuery1.Open;
  if form_inv.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit3.SetFocus;
  end
  else
  if form_inv.ShowModal = mrok then
  begin
   edit3.Text := form_inv.ADOQuery1MANU_PART_NUMBER.Value;
   button3.Enabled:=true;
   button3.SetFocus;
  end;
 finally
  form_inv.free;
 end;
 end;

7:
 try
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  inputvar.Fields:='warehouse_code/工厂代码/130,warehouse_name/工厂名称/240';
  inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name from data0015 order by warehouse_code';
  inputvar.KeyField:='warehouse_code';
  inputvar.InPut_value:=edit3.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
  begin
   edit3.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
   warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
   button3.Enabled:=true;
   button3.SetFocus;
  end
  else edit3.SetFocus;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;

end;
end;

procedure TForm4.Button3Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
   self.update_sgrid(i);
   exit;
  end;
 self.update_sgrid(SGRID1.RowCount-1);

 sgrid1.RowCount:=sgrid1.RowCount+1;
 button1.Enabled:=true;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else n1.Enabled:=true; 
end;

procedure TForm4.SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
 if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if row<>0 then SGrid1.Row:=row;
 end;
end;

procedure TForm4.N1Click(Sender: TObject);
var i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
 if sgrid1.RowCount=2 then button1.Enabled:=false;
end;



procedure TForm4.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  listbox3.OnClick(sender);
end;

procedure TForm4.Edit3Exit(Sender: TObject);
begin
 if (trim(edit3.Text)<>'') and (listbox3.ItemIndex =7) then
  with dm.ADOQuery1 do
  begin
   Close;
   sql.Text:='select rkey,warehouse_code from data0015 where warehouse_code='''+trim(edit3.text)+'''';
   open;
   if isempty then
   begin
    showmessage('找不到您输入的工厂代码，请重输！');
    edit3.Text:='';
    edit3.SetFocus;
   end
   else warehouse_ptr:=fieldvalues['rkey'];
  end;
end;

procedure TForm4.CheckBox2Click(Sender: TObject);
begin
  if (CheckBox2.Checked) or (CheckBox3.Checked) or (CheckBox4.Checked)
     or (CheckBox5.Checked) or (CheckBox6.Checked) then
    button3.Enabled := true
  else button3.Enabled := false;
end;

end.
