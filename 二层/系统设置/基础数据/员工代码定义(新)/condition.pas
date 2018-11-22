unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, Mask, Menus;

type
  Tcondition_form = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    SGrid1: TStringGrid;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    MaskEdit1: TMaskEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure ListBox1Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    dept_ptr:string;
    procedure update_sgrid(sgrid_row:byte);
  public
    { Public declarations }
  end;

var
  condition_form: Tcondition_form;

implementation
uses damo,common,pick_item_single,constvar;

{$R *.dfm}

procedure Tcondition_form.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit1.Text);
 case listbox1.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and employee_id='+dept_ptr;
 1:
  BEGIN
  sgrid1.Cells[2,sgrid_row]:='and gender='''+combobox1.text+'''';
  sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  END;
 2:
 begin
 sgrid1.Cells[2,sgrid_row]:='and school_age='''+combobox1.Text+'''';
 sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
 end;
 3:
 sgrid1.Cells[2,sgrid_row]:='and nation='''+edit1.Text+'''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and state='''+edit1.Text+'''';
 5:
 begin
  if radiogroup1.ItemIndex=0 then
   begin
    sgrid1.Cells[2,sgrid_row]:='and born>='''+maskedit1.Text+'''';
    sgrid1.Cells[1,sgrid_row]:='>='+maskedit1.Text+'';
   end
  else
   begin
    sgrid1.Cells[2,sgrid_row]:='and born<='''+maskedit1.Text+'''';
    sgrid1.Cells[1,sgrid_row]:='<='+maskedit1.Text;
   end;
 end;
 6:
 begin
  sgrid1.Cells[2,sgrid_row]:='and active_flag='''+combobox1.Text+'''';
  sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
 end;
 7:
  begin
   sgrid1.Cells[2,sgrid_row]:='and buyer_flag='''+combobox1.text+'''';
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 end;
end;

procedure Tcondition_form.ListBox1Click(Sender: TObject);
begin
  edit1.Visible:=true;
  edit1.Text:='';
  combobox1.Visible:=false;
  combobox1.Style:=csdropdown;
  maskedit1.Visible:=false;
  bitbtn4.Visible:=false;
  radiogroup1.Visible:=false;
  button1.Enabled:=false;

  label1.Caption:=listbox1.Items[listbox1.itemindex];
  case listbox1.ItemIndex of
  0:bitbtn4.Visible:=true;
  1:
  begin
    edit1.Visible:=false;
    combobox1.Visible:=true;
    combobox1.Style:=csdropdownlist;
    combobox1.Items.Clear;
    combobox1.Items.Add('男');
    combobox1.Items.Add('女');
    combobox1.ItemIndex:=0;
    button1.Enabled:=true;
  end;
  2:
  begin
    edit1.Visible:=false;
    combobox1.Visible:=true;
    combobox1.Items.Clear;
    combobox1.Items.Add('小学');
    combobox1.Items.Add('初中');
    combobox1.Items.Add('高中');
    combobox1.Items.Add('中专');
    combobox1.Items.Add('大专');
    combobox1.Items.Add('本科');
    combobox1.Items.Add('研究生');
    combobox1.Items.Add('博士生');
    combobox1.ItemIndex:=4;
    button1.Enabled:=true;
  end;
  3:;
  4:;
  5:
  begin
    edit1.Visible:=false;
    maskedit1.Visible:=true;
    radiogroup1.Visible:=true;
  end;
  6:
  begin
    edit1.Visible:=false;
    combobox1.Visible:=true;
    combobox1.Style:=csdropdownlist;
    combobox1.Items.Clear;
    combobox1.Items.Add('Y');
    combobox1.Items.Add('N');
    combobox1.ItemIndex:=0;
    button1.Enabled:=true;
  end;
  7:
  begin
    edit1.Visible:=false;
    combobox1.Visible:=true;
    combobox1.Style:=csdropdownlist;
    combobox1.Items.Clear;
    combobox1.Items.Add('Y');
    combobox1.Items.Add('N');
    combobox1.ItemIndex:=0;
    button1.Enabled:=true;
  end;
end;
end;

procedure Tcondition_form.MaskEdit1Change(Sender: TObject);
begin
  button1.Enabled:=true;
end;

procedure Tcondition_form.Edit1Change(Sender: TObject);
begin
  button1.Enabled:=true;
end;

procedure Tcondition_form.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    button1.setfocus;
end;

procedure Tcondition_form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    button1.SetFocus;
end;

procedure Tcondition_form.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    inputvar.Fields:='dept_code/部门代码/130,dept_name/部门名称/240,ctype/性质/100';
    inputvar.Sqlstr:='select rkey,dept_code,dept_name, '+
                     'CASE ttype WHEN 4 THEN ''行政部门'' '+
          'WHEN 5 THEN ''生产班组'' ELSE ''生产工序'' END AS ctype '+
          'from data0034 where ttype=4 or ttype=5 '+
          'or IS_cost_dept = 1 '+
          'order by ttype,dept_code';
    inputvar.InPut_value:=edit1.Text;
    inputvar.KeyField:='dept_code';
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
    begin
      edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['dept_code']);
      dept_ptr:=frmpick_item_single.adsPick.FieldValues['rkey']; //获得部门的rkey值
      button1.SetFocus;
    end
    else edit1.SetFocus;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure Tcondition_form.Button1Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
   begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure Tcondition_form.Edit1Exit(Sender: TObject);
var tmpstr:string;
begin
 if listbox1.ItemIndex=0 then
 begin
   tmpstr:=trim(edit1.Text);
   if tmpstr<>'' then
   with dm.aqtmp do
   begin
     sql.Clear;
     sql.Add('select rkey,dept_code,dept_name from data0034 where dept_code='+quotedstr(tmpstr));
     open;
     if not isempty then dept_ptr:=fieldbyname('rkey').AsString
     else
     begin
       showmessage('部门代码输入错误，请重新输入！');
       edit1.Text:='';
       edit1.SetFocus;
     end;
     close;
   end;
 end;
end;

procedure Tcondition_form.BitBtn2Click(Sender: TObject);
var i:byte;
begin  //重置，即清空sgrid数据
  for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure Tcondition_form.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名称';
  sgrid1.Cells[1,0]:='条件值';
  listbox1.ItemIndex:=0;
  self.ListBox1click(sender);
end;

procedure Tcondition_form.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount>2 then
  begin
   for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
   sgrid1.RowCount:=sgrid1.RowCount-1;
  end
  else sgrid1.Rows[sgrid1.Row].Clear;
end;

end.
