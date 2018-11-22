unit Condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    Bevel1: TBevel;
    dtpk2: TDateTimePicker;
    dtpk1: TDateTimePicker;
    ComboBox2: TComboBox;
    Button2: TButton;
    Button1: TButton;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    lab_rkey15: TLabel;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label4: TLabel;
    Label3: TLabel;
    procedure update_sgrid(sgrid_row:byte);
    procedure FormActivate(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses demo,common,Pick_Item_Single ,ConstVar, customer, employee, prodcode;

{$R *.dfm}

procedure TForm3.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;

 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and Data0025.MANU_PART_NUMBER LIKE ''%'+edit3.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_DESC LIKE ''%'+edit3.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_code LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0005_2.empl_code LIKE ''%'+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and data0008.prod_code LIKE ''%'+edit3.Text+'%''';
 5:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0025.ONHOLD_SALES_FLAG='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 6:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0025.ttype='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 7:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0025.prod_route_ptr='+lab_rkey15.Caption;
  end;
 end;

end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
end;

procedure TForm3.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
edit3.ReadOnly:=false;
button3.Enabled:=false;
bitbtn6.Visible:=false;
combobox1.Visible:=false;
case listbox3.ItemIndex of
 0:;
 1:;
 2:bitbtn6.Visible:=true;
 3:bitbtn6.Visible:=true;
 4:bitbtn6.Visible:=true;

 5:begin          //销售状态有效；过期
    combobox1.Visible:=true;
    combobox1.Items.Clear;
    combobox1.Items.Add('有效');
    combobox1.Items.Add('过期');
    combobox1.ItemIndex:=0;
    edit3.Visible:=false;
    button3.Enabled:=true;
   end;
 6:begin          //产品属性量产；样板
    combobox1.Visible:=true;
    combobox1.Items.Clear;
    combobox1.Items.Add('量产');
    combobox1.Items.Add('样板');
    combobox1.ItemIndex:=0;
    edit3.Visible:=false;
    button3.Enabled:=true;
   end;
 7:
 begin
  bitbtn6.Visible:=true;
  edit3.ReadOnly:=true;
 end;
 end;
end;

procedure TForm3.Button3Click(Sender: TObject);
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0010.CUST_code LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0005_2.empl_code LIKE ''%'+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0008.prod_code LIKE ''%'+edit3.Text+'%''';
 5:
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.ONHOLD_SALES_FLAG='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
  end;
 6:
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.ttype='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
  end;
 7:
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.prod_route_ptr='+lab_rkey15.Caption;
  end;
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TForm3.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;



procedure TForm3.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
case self.ListBox3.ItemIndex of
2:
 begin
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
  begin
   edit3.Text:=form_customer.ads10CUST_CODE.Value;
   button3.Enabled:=true;
  end;
  form_customer.Free;
 end;
3:
 begin
  form_employee:=tform_employee.Create(application);
  if form_employee.ShowModal=mrok then
  begin
   edit3.Text:=form_employee.ADOQuery1EMPL_CODE.Value;
   button3.Enabled:=true;
  end;
  form_employee.Free;
 end;
4:
 begin
  Form_prodcode:=tForm_prodcode.Create(application);
  if Form_prodcode.ShowModal=mrok then
  begin
   edit3.Text:=Form_prodcode.ADOQuery1prod_code.Value;
   button3.Enabled:=true;
  end;
  Form_prodcode.Free;
 end;
7:
try
 frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
 InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277,'+
                    'ABBR_NAME/工厂简称/100';
 InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015';
 InputVar.AdoConn := DM.ADOConnection1 ;
 frmPick_Item_Single.InitForm_New(InputVar)  ;
if frmPick_Item_Single.ShowModal=mrok then
 begin
  lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
  edit3.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
  button3.Enabled:=true;
  button3.SetFocus;
 end;
finally
 frmPick_Item_Single.adsPick.Close;
 frmPick_Item_Single.Free ;
end;
end;
end;



procedure TForm3.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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



procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true;
end;

procedure TForm3.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

end.
