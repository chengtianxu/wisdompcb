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
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    lab_rkey15: TLabel;
    procedure ListBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  Form_condition: TForm_condition;

implementation

uses common,Pick_Item_Single ,ConstVar, damo;

{$R *.dfm}

procedure TForm_condition.ListBox3Click(Sender: TObject);
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
 1:
 begin
  bitbtn6.Visible:=true;
 end;
 2:;
 3:bitbtn6.Visible:=true;
 4:;
 5:
 begin
  edit3.Visible:=false;
  combobox1.Visible:=true;
  button3.Enabled:=true;
  combobox1.Items.Clear;
  combobox1.Items.Add('正式订单');
  combobox1.Items.Add('备品订单');
  combobox1.ItemIndex:=0;
 end;
 6:
 begin
  edit3.Visible:=false;
  combobox1.Visible:=true;
  button3.Enabled:=true;
  combobox1.Items.Clear;
  combobox1.Items.Add('新单');
  combobox1.Items.Add('返单');
  combobox1.Items.Add('样板转生产');
  combobox1.Items.Add('返单有改');
  combobox1.ItemIndex:=0;
 end;
 7:
 begin
  edit3.Visible:=false;
  combobox1.Visible:=true;
  button3.Enabled:=true;
  combobox1.Items.Clear;
  combobox1.Items.Add('量产');
  combobox1.Items.Add('样板');
  combobox1.ItemIndex:=0;
 end;
 8:
 begin
 bitbtn6.Visible:=true;
 edit3.ReadOnly:=true;
 end;
 end;
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
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
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

procedure TForm_condition.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm_condition.update_sgrid(sgrid_row: byte);
begin

 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit3.Text);

 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and Data0060.SALES_ORDER like ''%'+edit3.Text+'%''';
 1:
 sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_number like ''%'+edit3.Text+'%''';

 2:
 sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_desc like ''%'+edit3.Text+'%''';

 3:
 sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE = '''+edit3.Text+'''';

 4:
  sgrid1.Cells[2,sgrid_row]:='and data0097.PO_NUMBER like ''%'+edit3.Text+'%''';
 5:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0060.so_style='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 6:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0060.SO_OLDNEW='''+combobox1.Text+'''';
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;

 7:
  begin
   sgrid1.Cells[2,sgrid_row]:='and Data0025.ttype = '+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 8:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0060.ship_reg_tax_id='+lab_rkey15.Caption;  
  end;

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

 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;

end;


procedure TForm_condition.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
case self.ListBox3.ItemIndex of
0:;
1:
  try
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
    'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
    InputVar.Sqlstr :=
'SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
      'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
      'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
      'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
      'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
      'dbo.Data0025.set_qty'+#13+
'FROM dbo.Data0025 INNER JOIN'+#13+
      'dbo.Data0008 ON'+#13+
      'dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'+#13+
      'dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
  'where PARENT_PTR is null'+#13+
'order by dbo.Data0025.MANU_PART_NUMBER';

    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='MANU_PART_NUMBER';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
      button3.SetFocus;
     end
    else
     edit3.SetFocus;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
2:;
3:
  try
    InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                        'abbr_name/简称/125';
    InputVar.Sqlstr :=
    'SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+#13+
    'data0010.abbr_name FROM dbo.Data0010'+#13+
    'order  by cust_code';
    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='CUST_CODE';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
      button3.SetFocus;
     end
    else
     edit3.SetFocus;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
8:
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

procedure TForm_condition.BitBtn1Click(Sender: TObject);
begin
//
end;

procedure TForm_condition.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if listbox3.ItemIndex=9 then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

end.
