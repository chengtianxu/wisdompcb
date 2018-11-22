unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, Menus;

type
  Tcondition_form = class(TForm)
    grp1: TGroupBox;
    listbox1: TListBox;
    label1: TLabel;
    combobox1: TComboBox;
    radiogroup1: TRadioGroup;
    grp2: TGroupBox;
    strngrd1: TStringGrid;
    bitbtn1: TBitBtn;
    bitbtn2: TBitBtn;
    bitbtn3: TBitBtn;
    edit1: TEdit;
    bitbtn4: TBitBtn;
    button1: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure listbox1Click(Sender: TObject);
    procedure button1Click(Sender: TObject);
    procedure combobox1Change(Sender: TObject);
    procedure edit1Change(Sender: TObject);
    procedure bitbtn4Click(Sender: TObject);
    procedure bitbtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edit1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure combobox1KeyPress(Sender: TObject; var Key: Char);
    procedure listbox1KeyPress(Sender: TObject; var Key: Char);
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

uses demo,ConstVar,Pick_Item_Single;

{$R *.dfm}

procedure Tcondition_form.listbox1Click(Sender: TObject);
begin
  combobox1.Visible:=true;
  edit1.Visible:=False;
  edit1.Text:='';
  bitbtn4.Visible:=false;
  radiogroup1.Visible:=false;
  button1.Enabled:=False;

  label1.Caption:=listbox1.Items[listbox1.itemindex];

 case listbox1.ItemIndex of
  0:
  begin
//   combobox1.Visible:=true;
   combobox1.Style:=csdropdownlist;
   combobox1.Items.Clear;
   combobox1.Items.Add('订单超投');
   combobox1.Items.Add('补料超投');
  end;
  1,2:
  begin
    combobox1.Visible:=False;
    edit1.Visible:=true;
    edit1.ReadOnly:=True;
    bitbtn4.Visible:=true;
  end;

  3:
  begin
   combobox1.Style:=csdropdownlist;
   combobox1.Items.Clear;
   combobox1.Items.Add('量板');
   combobox1.Items.Add('样板');
  end;
  4:
   begin
   combobox1.Visible:=False;
   edit1.Visible:=true;
   edit1.ReadOnly:=False;
//   edit1.Tag:=4;
  end;
  5:
  begin
   combobox1.Visible:=False;
   edit1.Visible:=true;
   edit1.ReadOnly:=False;
   radiogroup1.Visible:=true;
  end;


 end;
// if combobox1.Visible = True then
//  ActiveControl :=combobox1;
// if edit1.Visible =True then
// ActiveControl :=edit1;
end;

procedure Tcondition_form.button1Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to strngrd1.RowCount-2 do
   if strngrd1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
   begin
     update_sgrid(i);
     Exit;
   end;

  update_sgrid(strngrd1.RowCount-1);
  strngrd1.RowCount:=strngrd1.RowCount+1;

end;

procedure Tcondition_form.combobox1Change(Sender: TObject);
begin
  if combobox1.Text <>'' then
    button1.Enabled:=true
    else
    button1.Enabled:=False;
end;

procedure Tcondition_form.edit1Change(Sender: TObject);
begin
  if edit1.Text <>'' then
    button1.Enabled:=true
    else
    button1.Enabled:=False;
end;

procedure Tcondition_form.update_sgrid(sgrid_row: byte);
begin
// strngrd1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
 strngrd1.Cells[0,sgrid_row]:=label1.Caption;
 case listbox1.ItemIndex of
 0:
  begin
  strngrd1.Cells[2,sgrid_row]:='and ct_TYPE='+IntToStr(combobox1.ItemIndex)+'';
  strngrd1.Cells[1,sgrid_row]:=combobox1.Text;
  end;

 1:
  BEGIN
  strngrd1.Cells[2,sgrid_row]:='and warehouse_code='''+trim(edit1.Text)+'''';
  strngrd1.Cells[1,sgrid_row]:=trim(edit1.Text);
  END;
 2:
  begin
  strngrd1.Cells[2,sgrid_row]:='and USER_LOGIN_NAME='''+trim(edit1.Text)+'''';
  strngrd1.Cells[1,sgrid_row]:=trim(edit1.Text);
  end;
 3:
 begin
  strngrd1.Cells[2,sgrid_row]:='and ttype='+IntToStr(combobox1.ItemIndex)+'';
  strngrd1.Cells[1,sgrid_row]:=combobox1.text;
 end;
 4:
  begin
  strngrd1.Cells[2,sgrid_row]:='and seq_no='+trim(edit1.Text)+'';
  strngrd1.Cells[1,sgrid_row]:=trim(edit1.Text);
  end;
 5:
 begin
  if radiogroup1.ItemIndex=0 then
   begin
    strngrd1.Cells[2,sgrid_row]:='and ct_area>='+trim(edit1.Text)+'';
    strngrd1.Cells[1,sgrid_row]:='>='+trim(edit1.Text)+'';
   end
  else
   begin
    strngrd1.Cells[2,sgrid_row]:='and ct_area<='+trim(edit1.Text)+'';
    strngrd1.Cells[1,sgrid_row]:='<='+trim(edit1.Text);
   end;
 end;
 end;
end;

procedure Tcondition_form.bitbtn4Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
   if listbox1.ItemIndex<2 then
   begin

    try

       InputVar.Fields := 'warehouse_code/工厂编号/175,abbr_name/工厂/175';
       InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name,warehouse_type,abbr_name from data0015';
       inputvar.InPut_value:=edit1.Text;
       InputVar.KeyField:='warehouse_code';
       InputVar.AdoConn := dm.con1;
       frmPick_Item_Single.InitForm_New(InputVar);

     if frmPick_Item_Single.ShowModal=mrok then
     edit1.Text :=frmPick_Item_Single.adsPick.fieldByName('warehouse_code').AsString;

    finally
       frmPick_Item_Single.Free ;
    end;

   end
   else
   begin
    try

       InputVar.Fields := 'USER_LOGIN_NAME/用户代码/180,USER_FULL_NAME/员工名称/180';
       InputVar.Sqlstr :='select RKEY,USER_LOGIN_NAME,USER_FULL_NAME from Data0073';
       inputvar.InPut_value:=edit1.Text;
       inputvar.KeyField:='USER_LOGIN_NAME';
       InputVar.AdoConn := dm.con1;
       frmPick_Item_Single.InitForm_New(InputVar);

     if frmPick_Item_Single.ShowModal=mrok then
     edit1.Text :=frmPick_Item_Single.adsPick.fieldByName('USER_LOGIN_NAME').AsString;

    finally
       frmPick_Item_Single.Free ;
    end;
   end;
   ActiveControl :=edit1;
end;

procedure Tcondition_form.bitbtn2Click(Sender: TObject);
var i:byte;
begin  //重置，即清空sgrid数据
  for i:=1 to strngrd1.RowCount-1 do
    strngrd1.Rows[i].Clear;
    strngrd1.RowCount:=2;
end;

procedure Tcondition_form.FormActivate(Sender: TObject);
begin
  strngrd1.Cells[0,0]:='条件名称';
  strngrd1.Cells[1,0]:='条件值';
  listbox1.ItemIndex:=0;
  self.ListBox1click(sender);
end;

procedure Tcondition_form.edit1KeyPress(Sender: TObject; var Key: Char);
var
  i : Integer;
begin
   case listbox1.ItemIndex of
    1,2,3:;
    4:
    begin
      if not (key in ['0'..'9',#8..#27]) then key := #0;
    end;
    5:
    begin
      if not((TryStrToInt(edit1.text,i)) and (Key = '.')) then      //当前按下的为"."并且输入框内容能转换为整型

     begin
     if not (Key in ['0'..'9',#8..#27]) then
      begin
        Key := #0;  //处理非数字
      end;
     end;
    end;
   end;
   if (Key=#13) and (button1.Enabled=true) then button1.Click;
end;

procedure Tcondition_form.N1Click(Sender: TObject);
var i:byte;
begin
  if strngrd1.RowCount>2 then
  begin
   for i:=strngrd1.Row to strngrd1.RowCount-2 do
    strngrd1.Rows[i].Text:=strngrd1.Rows[i+1].Text;
   strngrd1.RowCount:=strngrd1.RowCount-1;
  end
  else strngrd1.Rows[strngrd1.Row].Clear;
end;

procedure Tcondition_form.combobox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key=#13) and (button1.Enabled=true) then button1.Click;
end;

procedure Tcondition_form.listbox1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#1..#38,#40..#47]) then
 case listbox1.ItemIndex of
  1,2:
  ActiveControl :=bitbtn4;
  4,5:
  ActiveControl := edit1;
  0,3:
  ActiveControl :=combobox1;
 end;



end;

end.
