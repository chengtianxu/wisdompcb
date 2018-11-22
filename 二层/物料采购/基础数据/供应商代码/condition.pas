unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ExtCtrls, StdCtrls, Buttons, Mask, ComCtrls;

type
  Tcondition_form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DT1: TDateTimePicker;
    rgType: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    v_field_list,v_operator:variant;  //v_operator为运算符
    procedure update_sgrid(sgrid_row:byte);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  condition_form: Tcondition_form;

implementation
uses damo,common,pick_item_single,constvar;

{$R *.dfm}

procedure Tcondition_form.update_sgrid(sgrid_row:byte);
begin
  sgrid1.Cells[0,sgrid_row]:=label1.Caption;
  case listbox1.ItemIndex of
  0,1,2:
    begin
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+'='+inttostr(combobox1.ItemIndex);
    end;
  3:
    begin
      sgrid1.Cells[1,sgrid_row]:=v_operator[radiogroup1.itemindex]+quotedstr(formatdatetime(('yyyy-mm-dd'),dt1.date));
      sgrid1.Cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+v_operator[radiogroup1.itemindex]+quotedstr(formatdatetime(('yyyy-mm-dd'),dt1.date));
    end;
  4:begin
      sgrid1.Cells[1,sgrid_row]:=edit1.Text;
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+'='+''''+edit1.Text+'''';
    end;
  5:begin
      sgrid1.Cells[1,sgrid_row]:=rgType.Items[rgType.itemindex];
      sgrid1.cells[2,sgrid_row]:=' and '+v_field_list[listbox1.itemindex]+'=' +IntToStr(rgType.ItemIndex);
    end;
  end;
end;

procedure Tcondition_form.FormShow(Sender: TObject);
begin
  v_Field_List:=VarArrayOf(['d23.status','d23.brother_flag','d23.ttype','d23.suppier_ent_date','d250.country_code','d23.EDI_OUT_NEW_PO']);
  v_operator:=varArrayof(['>=','<=']);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox1.ItemIndex:=0;
  self.ListBox1click(sender);
end;

procedure Tcondition_form.ListBox1Click(Sender: TObject);
begin
  edit1.Text:='';
  edit1.Visible:=listbox1.ItemIndex=4;
  combobox1.Visible:=listbox1.ItemIndex in [0,1,2];
  dt1.Visible:=listbox1.ItemIndex=3;
  bitbtn4.Visible:=listbox1.ItemIndex=4;
  radiogroup1.Visible:=listbox1.ItemIndex=3;
  rgType.Visible := listbox1.ItemIndex = 5 ;
  label1.Caption:=listbox1.Items[listbox1.itemindex];
  case listbox1.ItemIndex of
  0:
    begin
      combobox1.Items.Clear;
      combobox1.Items.Add('有效');
      combobox1.Items.Add('无效');
    end;
  1:
    begin
      combobox1.Items.Clear;
      combobox1.Items.Add('否');
      combobox1.Items.Add('是');
    end;
  2:
    begin
      combobox1.Items.Clear;
      combobox1.Items.Add('材料供应商');
      combobox1.Items.Add('外发供应商');
      combobox1.Items.Add('两个都是');
    end;
  4:edit1.SetFocus;
  end;
  combobox1.ItemIndex:=0;
end;

procedure Tcondition_form.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    inputvar.Fields:='country_code/国家代码/130,country_name/国家名称/240';
    inputvar.Sqlstr:='select country_rkey,country_code,country_name from data0250 order by country_code';
    inputvar.KeyField:='country_code';
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
    begin
      edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['country_code']);
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
  if ((listbox1.ItemIndex=4) and (trim(edit1.Text)='')) or ((listbox1.ItemIndex<3) and (trim(combobox1.Text)=''))
     or ((listbox1.ItemIndex=3) and (dt1.Date<=strtodate('1900-01-01'))) then
    exit;
  for i:=1 to sgrid1.RowCount-1 do
    if sgrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex] then
      begin
        update_sgrid(i);
        exit;
      end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure Tcondition_form.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.Row = sgrid1.RowCount-1 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  if sgrid1.RowCount <= 2 then exit;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure Tcondition_form.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure Tcondition_form.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
  with dm.aqtmp do
  begin
    sql.Clear;
    sql.Add('select country_code from data0250 where country_code='''+trim(edit1.Text)+'''');
    open;
    if isempty then
    begin
      showmessage('国家代码输入错误，请重输！');
      edit1.Text:='';
      edit1.SetFocus;
    end;
    close;
  end;
end;

end.
