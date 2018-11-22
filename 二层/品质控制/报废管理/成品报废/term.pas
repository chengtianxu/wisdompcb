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
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_condition: TForm_condition;

implementation

uses  Main, CustP_Search, location_search;

{$R *.dfm}

procedure TForm_condition.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;

 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+edit3.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_DESC LIKE ''%'+edit3.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid_row]:='and Data0006.WORK_ORDER_NUMBER LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0016.code LIKE ''%'+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE LIKE ''%'+edit3.Text+'%''';
 end;

end;

procedure TForm_condition.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
button3.Enabled:=false;
bitbtn6.Visible:=false;
case listbox3.ItemIndex of
 0:bitbtn6.Visible:=true;
 1:;
 2:;
 3:bitbtn6.Visible:=true;
 4:;
 end;
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+edit3.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.MANU_PART_DESC LIKE ''%'+edit3.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0006.WORK_ORDER_NUMBER LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0016.code = '''+edit3.Text+'''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.CUST_CODE = '''+edit3.Text+'''';
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
 end
else 
if button3.Enabled then button3.OnClick(sender);
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
0:
begin
FrmCustPart:=TFrmCustPart.Create(application);
 if FrmCustPart.showmodal=mrok then
  begin
   Edit3.text:=FrmCustPart.ADOQuery1manu_part_number.Value;
   button3.SetFocus;
  end;
FrmCustPart.Free;
end;
2:
 begin
 end;
3:
 begin
 form_lo:=tform_lo.Create(application);
 if form_lo.ShowModal=mrok then
 begin
  edit3.Text:=form_lo.ADOQuery1CODE.Value;
  button3.SetFocus; 
 end;
 form_lo.Free;
 end;
4:
 begin
 end;

end;
end;

procedure TForm_condition.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm_condition.Button1Click(Sender: TObject);
begin
 if sgrid1.RowCount=2 then
  messagedlg('请首先定义查询条件!',mterror,[mbcancel],0)
 else if (DateTimePicker1.Date+DateTimePicker2.Time) > (DateTimePicker3.Date+DateTimePicker4.Time) then
  messagedlg('完工时间范围错误，请重新输入!',mterror,[mbcancel],0)
 else
  self.ModalResult:=mrok;
end;

procedure TForm_condition.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime:=now;
  DateTimePicker3.DateTime:=DateTimePicker1.DateTime;
end;

end.
