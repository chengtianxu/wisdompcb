unit term;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus, DB, ADODB, ExtCtrls;

type
  TForm4 = class(TForm)
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
    Label7: TLabel;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    DTPk1: TDateTimePicker;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DTTm2: TDateTimePicker;
    Label4: TLabel;
    lab_rkey15: TLabel;
    rgType: TRadioGroup;
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SGrid1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses customer_search, empl_search, main,Pick_Item_Single,ConstVar;


{$R *.dfm}

procedure TForm4.update_sgrid(sgrid_row: byte);
begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;
 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and data0010.cust_code = '''+edit3.Text+'''';
 1:
  sgrid1.Cells[2,sgrid_row]:='and data0034.dept_code = '''+edit3.Text+'''';
 2:
  sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_NUMBER LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_DESC LIKE ''%'+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and DATEDIFF(day,Data0056.INTIME, GETDATE()) > '+trim(edit3.Text);
 5:
  sgrid1.Cells[2,sgrid_row]:='and DATEDIFF(hh,data0056.intime,getdate()) > '+trim(edit3.Text);
 6:
  sgrid1.Cells[2,sgrid_row]:='and data0006.work_order_number LIKE ''%'+edit3.Text+'%''';
 7:
  sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO LIKE ''%'+edit3.Text+'%''';
 8:
  sgrid1.Cells[2,sgrid_row]:='and data0060.SALES_ORDER LIKE ''%'+edit3.Text+'%''';
 9:
 begin
  sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
  sgrid1.Cells[2,sgrid_row]:='and data0060.STATUS ='+INTTOstr(combobox2.ItemIndex+1);
 end;
  10:
   begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
     sgrid1.Cells[2,sgrid1.RowCount-1]:=
     'and Data0006.RELEASE_DATE >= '''+datetostr(dtpk1.date)+
     formatdatetime(' hh:nn:ss',DTtm1.Time)+
     ''' and Data0006.RELEASE_DATE <= '''+datetostr(dtpk2.date)+
     formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
   end;
  11:
   sgrid1.Cells[2,sgrid_row]:='and data0492.WHOUSE_PTR = '+SELF.lab_rkey15.Caption;
 12:
 begin
   sgrid1.Cells[1,sgrid_row]:=rgType.Items[rgType.ItemIndex];
   if (rgType.ItemIndex=0) then
   sgrid1.Cells[2,sgrid_row]:=' and Data0056.wType ='+inttostr(rgType.ItemIndex)+''
   else
   sgrid1.Cells[2,sgrid_row]:=' and Data0056.wType >='+inttostr(rgType.ItemIndex)+'';
 end;
 13:
 begin
   sgrid1.Cells[1,sgrid_row]:=rgType.Items[rgType.ItemIndex];
   if (rgType.ItemIndex = 1) then
   sgrid1.Cells[2,sgrid_row]:=' and data0025.PARENT_PTR >0 '
   else
   sgrid1.Cells[2,sgrid_row]:=' and data0025.PARENT_PTR is null ';
 end;
 end;
end;

procedure TForm4.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
edit3.ReadOnly:=false;
button3.Enabled:=false;
bitbtn6.Visible:=false;
label7.Visible:=false;
label1.Visible:=false;
combobox2.Visible:=false;
label8.Visible:=true;
rgType.Visible:=False;

label3.Visible:=false;
label4.Visible:=false;
dtpk1.Visible:=false;
dtpk2.Visible:=false;
dttm1.Visible:=false;
dttm2.Visible:=false;

case listbox3.ItemIndex of
 0:bitbtn6.Visible:=true;
 1:begin
    bitbtn6.Visible:=true;
   end;
 2:begin

   end;
 3:begin

   end;
 4:begin
   label7.Visible:=true;
   label1.Visible:=true;
   label1.Caption:='天';
   end;
 5:
  begin
   label7.Visible:=true;
   label1.Visible:=true;
   label1.Caption:='小时';
  end;
 6:;
 7:;
 8:;
 9:
 begin
  combobox2.Visible:=true;
  edit3.Visible:=false;
  button3.Enabled:=true;
 end;
10:
 begin
  edit3.Visible:=false;
  button3.Enabled:=true;
  label8.Visible:=false;
  label3.Visible:=true;
  label4.Visible:=true;
  dtpk1.Visible:=true;
  dtpk2.Visible:=true;
  dttm1.Visible:=true;
  dttm2.Visible:=true;
 end;
11:
 begin
  bitbtn6.Visible:=true;
  edit3.ReadOnly:=true;
 end;
12:
begin
  rgType.Items.Clear;
  rgType.Items.Add('正常');
  rgType.Items.Add('返工');
  rgType.Visible:=True;
  rgType.ItemIndex:=0;
  button3.Enabled:=true;
end;
13:
begin
  rgType.Items.Clear;
  rgType.Items.Add('外层');
  rgType.Items.Add('内层');
  rgType.Visible:=True;
  rgType.ItemIndex:=0;
  button3.Enabled:=true;
end;
end;
end;

procedure TForm4.Button3Click(Sender: TObject);
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

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true; 
end;

procedure TForm4.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm4.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
  dtpk2.Date:=date();
  dtpk1.Date:=dtpk2.Date-15;
end;

procedure TForm4.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
case self.ListBox3.ItemIndex of
0:
 begin
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit3.Text:=form_customer.ADOQuery1cust_code.Value;
    button3.Enabled:=true;
   end;
  form_customer.Free;
 end;
1:
 begin
  form_technics:=tform_technics.Create(application);
  if form_technics.ShowModal=mrok then
   begin
    edit3.Text:=form_technics.ADOQuery1DEPT_CODE.Value;
    button3.Enabled:=true;
   end;
  form_technics.Free;
 end;
11:
try
 frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
 InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277,'+
                    'ABBR_NAME/工厂简称/100';
 InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015';
 InputVar.AdoConn := form1.ADOConnection1 ;
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

procedure TForm4.SGrid1Click(Sender: TObject);
begin
if button3.Enabled then button3click(sender);
end;

procedure TForm4.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

end.
