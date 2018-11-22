unit term;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus, ExtCtrls;

type
  TForm_condition = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
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
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SGrid1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_condition: TForm_condition;

implementation

uses  damo, employee_search, rep_search;

{$R *.dfm}

procedure TForm_condition.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;

 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and Data0085.TNUMBER LIKE ''%'+edit3.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid_row]:='and data0085.REF_PART_NO LIKE ''%'+edit3.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid_row]:='and Data0085.CUST_PART_NO LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0085.CUST_NAME LIKE ''%'+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and data0005.empl_code = '''+edit3.Text+'''';
 5:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0085.ttype2='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 6:
  sgrid1.Cells[2,sgrid_row]:='and d05.EMPL_CODE = '''+edit3.Text+'''';
 7:
  sgrid1.Cells[2,sgrid_row]:='and Data0085.CUST_PART_DESC LIKE ''%'+edit3.Text+'%''';
 end;
end;

procedure TForm_condition.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
button3.Enabled:=false;
bitbtn6.Visible:=false;
combobox1.Visible:=false;
case listbox3.ItemIndex of
 0,1,2,3,7:;
 4:begin
    bitbtn6.Visible:=true;
   end;
 5:begin
    combobox1.Visible:=true;
    edit3.Visible:=false;
    button3.Enabled:=true;
   end;
 6:begin
    bitbtn6.Visible:=true;
   end;
 end;
end;

procedure TForm_condition.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm_condition.Button3Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
    self.update_sgrid(i);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0085.TNUMBER LIKE ''%'+edit3.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0085.REF_PART_NO LIKE ''%'+edit3.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0085.CUST_PART_NO LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0085.CUST_NAME LIKE ''%'+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0005.empl_code = '''+edit3.Text+'''';
 5:
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0085.ttype2='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
  end;
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and d05.EMPL_CODE = '''+edit3.Text+'''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0085.CUST_PART_DESC LIKE ''%'+edit3.Text+'%''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TForm_condition.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true; 
end;

procedure TForm_condition.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if row<>0 then SGrid1.Row:=row;
 end;
end;

procedure TForm_condition.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_condition.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
end;

procedure TForm_condition.BitBtn6Click(Sender: TObject);
begin
case self.ListBox3.ItemIndex of
4:
 try
  form_employee:=tform_employee.Create(application);
  if form_employee.ShowModal=mrok then
   begin
   edit3.Text:=form_employee.ADOQuery1EMPL_CODE.Value;
   button3.Enabled:=true;
   end
  else
   edit3.SetFocus;
 finally  
  form_employee.Free;
 end;
6:
 try
 application.CreateForm(tform_rep,form_rep);
 if form_rep.ShowModal=mrok then
  begin
   edit3.Text:=form_rep.ADOQuery1REP_CODE.Value;
   button3.Enabled:=true;
  end
 else
  edit3.SetFocus;
finally
 form_rep.Free;
end;

end;
end;

procedure TForm_condition.SGrid1Click(Sender: TObject);
begin
if button3.Enabled then button3.OnClick(sender);
end;

end.
