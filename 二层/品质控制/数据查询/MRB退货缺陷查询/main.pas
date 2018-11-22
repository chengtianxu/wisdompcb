unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    ComboBox1: TComboBox;
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
    RadioGroup1: TRadioGroup;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SGrid1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses customer_search,  prodcode_search, product_search,
  rej_search,common, reject_day, reject_month, 
  reject_rejectcode, reject_prodcode, reject_custcode, reject_product;

{$R *.dfm}

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
button3.Enabled:=false;
bitbtn6.Visible:=false;
combobox1.Visible:=false;
radiogroup3.Visible:=false;

case listbox3.ItemIndex of
 0:bitbtn6.Visible:=true;
 1:
 begin
  edit3.Visible:=false;
  combobox1.Visible := true;
  button3.Enabled := true;
  combobox1.Items.Clear;
  combobox1.Items.Add('工厂报废');
  combobox1.Items.Add('供应商报废');
  combobox1.Items.Add('客户报废');
  combobox1.Items.Add('市场报废');
  combobox1.Items.Add('其它');  
  combobox1.ItemIndex:=0;
 end;
 2:bitbtn6.Visible:=true;
 3:bitbtn6.Visible:=true;
 4:bitbtn6.Visible:=true;

 5:;

 6:
 begin
  edit3.Visible:=false;
  combobox1.Visible:=true;
  button3.Enabled:=true;
  combobox1.Items.Clear;
  combobox1.Items.Add('量产');
  combobox1.Items.Add('样板');
  combobox1.ItemIndex:=0;
 end;

 7:
 begin
 radiogroup3.Visible:=true; 
 end;

 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
  dtpk2.Date:=getsystem_date(adoquery1,1);
  dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm1.SGrid1Click(Sender: TObject);
begin
if button3.Enabled then button3click(sender);
end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm1.update_sgrid(sgrid_row: byte);
begin

 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;

 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and Data0039.REJ_CODE = '''+edit3.Text+'''';
 1:
  BEGIN
  sgrid1.Cells[2,sgrid_row]:='and data0039.REJ_TYPE = '+inttostr(combobox1.ItemIndex);
  sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  END;
 2:
 sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE = '''+edit3.Text+'''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0008.prod_code = '''+edit3.Text+'''';
 4:
 sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_number like ''%'+edit3.Text+'%''';
 5:
 sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_desc like ''%'+edit3.Text+'%''';
 6:
  begin
   sgrid1.Cells[2,sgrid_row]:='and Data0025.ttype = '+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 7: 
 begin
  sgrid1.Cells[1,sgrid_row]:=
         radiogroup3.Items[radiogroup3.itemindex]+edit3.Text;
  case radiogroup3.ItemIndex of
  0:sgrid1.Cells[2,sgrid_row]:='and data0025.layers = '+edit3.Text;
  1:sgrid1.Cells[2,sgrid_row]:='and data0025.layers > '+edit3.Text;
  2:sgrid1.Cells[2,sgrid_row]:='and data0025.layers <> '+edit3.Text;
  end;
 end;

 end;

end;


procedure TForm1.Button3Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
    self.update_sgrid(i);
    exit;
   end;

 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;

end;


procedure TForm1.BitBtn6Click(Sender: TObject);
begin
case self.ListBox3.ItemIndex of
0:
begin
 Form_rej :=tForm_rej.Create(application);
 if Form_rej.ShowModal=mrok then
  begin
   edit3.Text:=Form_rej.AQ39REJ_CODE.Value;
   button3.SetFocus;
  end;
 Form_rej.Free
end;

2:
begin
 Form_customer :=tForm_customer.Create(application);
 if Form_customer.ShowModal=mrok then
  begin
   edit3.Text:=Form_customer.ads10CUST_CODE.Value;
   button3.SetFocus;
  end;
 Form_customer.Free
end;
3:
begin
 Form_prodcode :=tForm_prodcode.Create(application);
 if Form_prodcode.ShowModal=mrok then
  begin
   edit3.Text:=Form_prodcode.adoquery1PROD_CODE.Value;
   button3.SetFocus;
  end;
 Form_prodcode.Free
end;
4:
begin
 Form_product :=tForm_product.Create(application);
 if Form_product.ShowModal=mrok then
  begin
   edit3.Text:=Form_product.ads50MANU_PART_NUMBER.Value;
   button3.SetFocus;
  end;
 Form_product.Free
end;

end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
case radiogroup1.ItemIndex of
0:
 try
  form2:=tform2.Create(application);
  screen.Cursor:=crAppstart;
  with form2.ADOQuery1 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
   Parameters.ParamValues['dtpk1']:=dtpk1.Date;
   Parameters.ParamValues['dtpk2']:=dtpk2.Date;
   open;
  end;
  form2.ShowModal;
 finally
  form2.Free;
  screen.Cursor:=crDefault;
 end;
1:
 try
  form3:=tform3.Create(application);
  screen.Cursor:=crAppstart;
  with form3.ADOQuery1 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
   Parameters.ParamValues['dtpk1']:=dtpk1.Date;
   Parameters.ParamValues['dtpk2']:=dtpk2.Date;

   open;
  end;
  form3.ShowModal;
 finally
  form3.Free;
  screen.Cursor:=crDefault;
 end;

2:
 try
  form5:=tform5.Create(application);
  screen.Cursor:=crAppstart;
  with form5.ADOQuery1 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
   Parameters.ParamValues['dtpk1']:=dtpk1.Date;
   Parameters.ParamValues['dtpk2']:=dtpk2.Date;

   open;
  end;
  form5.ShowModal;
 finally
  form5.Free;
  screen.Cursor:=crDefault;
 end;
3:
 try
  form6:=tform6.Create(application);
  screen.Cursor:=crAppstart;
  with form6.ADOQuery1 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
   Parameters.ParamValues['dtpk1']:=dtpk1.Date;
   Parameters.ParamValues['dtpk2']:=dtpk2.Date;

   open;
  end;
  form6.ShowModal;
 finally
  form6.Free;
  screen.Cursor:=crDefault;
 end;
4:
 try
  form7:=tform7.Create(application);
  screen.Cursor:=crAppstart;
  with form7.ADOQuery1 do
   begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
   Parameters.ParamValues['dtpk1']:=dtpk1.Date;
   Parameters.ParamValues['dtpk2']:=dtpk2.Date;

   open;
   end;
  form7.ShowModal;
 finally
  form7.Free;
  screen.Cursor:=crDefault;
 end;
5:
 try
  form8:=tform8.Create(application);
  screen.Cursor:=crAppstart;
  with form8.ADOQuery1 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-2,sgrid1.Cells[2,i]);
   Parameters.ParamValues['dtpk1']:=dtpk1.Date;
   Parameters.ParamValues['dtpk2']:=dtpk2.Date;

   open;
  end;
  form8.ShowModal;
 finally
  form8.Free;
  screen.Cursor:=crDefault;
 end;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init(self.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
  self.caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if listbox3.ItemIndex=9 then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

end.
