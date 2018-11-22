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
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
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
    procedure CheckBox1Click(Sender: TObject);
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
button3.Enabled:=false;
bitbtn6.Visible:=false;
combobox1.Visible:=false;
groupbox1.Visible:=false;
case listbox3.ItemIndex of
 0:;
 1:
 begin
  bitbtn6.Visible:=true;
 end;
 2:;
 3:bitbtn6.Visible:=true;
 4:
 begin
  edit3.Visible:=false;
  groupbox1.Visible:=true;
 end;
 5:
 begin
  edit3.Visible:=false;
  combobox1.Visible:=true;
  button3.Enabled:=true;
  combobox1.Items.Clear;
  combobox1.Items.Add('已审核');
  combobox1.Items.Add('未审核');
  combobox1.ItemIndex:=0;
 end;
 6:
 begin
  edit3.Visible:=false;
  combobox1.Visible:=true;
  button3.Enabled:=true;
  combobox1.Items.Clear;
  combobox1.Items.Add('外层');
  combobox1.Items.Add('内层');
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
var
   s,s1:string;
begin

 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=trim(edit3.Text);

 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and Data0492.CUT_NO like ''%'+edit3.Text+'%''';
 1:
 sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_number like ''%'+edit3.Text+'%''';

 2:
 sgrid1.Cells[2,sgrid_row]:='and data0025.manu_part_desc like ''%'+edit3.Text+'%''';

 3:
 sgrid1.Cells[2,sgrid_row]:='and Data0005.EMPL_CODE = '''+edit3.Text+'''';

 4:
  begin
    s1:= '';
    s := '';
    if CheckBox1.Checked then
      begin
        s1 := s1 + CheckBox1.Caption  + ';' ;
        if s = '' then
         s := '0'
        else
         s := s + ',0';
      end;
    if CheckBox2.Checked then
      begin
        s1 := s1 + CheckBox2.Caption + ';'  ;
        if s = '' then
            s := '1'
        else
            s := s + ',1';
      end;
    if CheckBox3.Checked then
     begin
      s1 := s1 + CheckBox3.Caption  + ';' ;
      if s = '' then
          s := '2'
      else
          s := s + ',2';
     end;
    if CheckBox4.Checked then
      begin
        s1 := s1 + CheckBox4.Caption + ';'  ;
        if s = '' then
            s := '3'
        else
            s := s + ',3';
      end;
    if CheckBox5.Checked then
      begin
        s1 := s1 + CheckBox5.Caption + ';'  ;
        if s = '' then
            s := '4'
        else
            s := s + ',4';
      end; {}
    s := '('+s+')';
    sgrid1.Cells[1,sgrid_row] := s1;
    sgrid1.Cells[2,sgrid_row]:=' and data0492.ttype in ' + s;
  end;
 5:
  begin
   sgrid1.Cells[2,sgrid_row]:='and data0492.tstatus='+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
  end;
 6:
  begin
    sgrid1.Cells[1,sgrid_row] := ComboBox1.Text;
    if ComboBox1.ItemIndex = 1 then     //内层
     sgrid1.Cells[2,sgrid_row]:=' and (DATA0025.PARENT_PTR > 0) '
    else
     sgrid1.Cells[2,sgrid_row]:=' and (DATA0025.PARENT_PTR is null)';
  end;

 7:
  begin
   sgrid1.Cells[2,sgrid_row]:='and Data0025.ttype = '+inttostr(combobox1.ItemIndex);
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
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

3:
  try
    InputVar.Fields := 'EMPL_CODE/员工代码/150,EMPLOYEE_NAME/员工名称/250';

    InputVar.Sqlstr :='SELECT RKEY, EMPL_CODE, EMPLOYEE_NAME FROM dbo.Data0005 order by 2';
    inputvar.InPut_value:=edit3.Text;
    inputvar.KeyField:='EMPL_CODE';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
      button3.SetFocus;
     end
    else
     edit3.SetFocus;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;

end;


end;

procedure TForm_condition.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if listbox3.ItemIndex=9 then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm_condition.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox2.Checked)
  or (CheckBox3.Checked) or (CheckBox4.Checked)
  or (CheckBox5.Checked) then
   button3.Enabled := true
  else
   button3.Enabled := false ;
end;

end.
