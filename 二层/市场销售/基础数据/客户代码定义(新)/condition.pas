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
    CheckBox1: TCheckBox;
    procedure ListBox1Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
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
    begin
      sgrid1.Cells[2,sgrid_row]:=' and d10.customer_type='+inttostr(combobox1.ItemIndex+1);
      SGrid1.Cells[1,sgrid_row]:=combobox1.text;
    end;
    1:sgrid1.Cells[2,sgrid_row]:=' and d05.EMPL_CODE='''+edit1.text+'''';
    2:
    begin
      sgrid1.Cells[2,sgrid_row]:=' and d10.edi_in_logging='+inttostr(combobox1.ItemIndex);
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    3:sgrid1.Cells[2,sgrid_row]:=' and d250.country_code='''+edit1.Text+'''';
    4:
    begin
      sgrid1.Cells[2,sgrid_row]:=' and d10.credit_rating='+inttostr(combobox1.ItemIndex+1);
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    5:
    begin
      sgrid1.Cells[2,sgrid_row]:=' and d10.house_fixed='''+combobox1.Text+'''';
      sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
    6:
    begin
      if radiogroup1.ItemIndex=0 then
      begin
        sgrid1.Cells[2,sgrid_row]:=' and d10.cust_ent_date>='''+maskedit1.Text+'''';
        sgrid1.Cells[1,sgrid_row]:='>='+maskedit1.Text+'';
      end
      else
      begin
        sgrid1.Cells[2,sgrid_row]:=' and d10.cust_ent_date<='''+maskedit1.Text+'''';
        sgrid1.Cells[1,sgrid_row]:='<='+maskedit1.Text;
      end;
    end;
    7:
    begin
      if CheckBox1.Checked then
      begin
        SGrid1.Cells[1,sgrid_row]:= '是';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.EDI_FLAG_FOR_SOACK,0)=1';
      end
      else
      begin
        SGrid1.Cells[1,sgrid_row]:='否';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.EDI_FLAG_FOR_SOACK,0)=0';
      end;
    end;
    8:
    begin
      if CheckBox1.Checked then
      begin
        SGrid1.Cells[1,sgrid_row]:= '是';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.DO_SMOOTHING,0)=1';
      end
      else
      begin
        SGrid1.Cells[1,sgrid_row]:='否';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.DO_SMOOTHING,0)=0';
      end;
    end;
    9:
    begin
      if CheckBox1.Checked then
      begin
        SGrid1.Cells[1,sgrid_row]:= '是';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.COD_FLAG,''N'')=''Y''';
      end
      else
      begin
        SGrid1.Cells[1,sgrid_row]:='否';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.COD_FLAG,''N'')=''N''';
      end;
    end;
    10:
    begin
      if CheckBox1.Checked then
      begin
        SGrid1.Cells[1,sgrid_row]:= '是';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.QUOTE_FACTOR1,0)=1';
      end
      else
      begin
        SGrid1.Cells[1,sgrid_row]:='否';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.QUOTE_FACTOR1,0)=0';
      end;
    end;
    11:
    begin
      if CheckBox1.Checked then
      begin
        SGrid1.Cells[1,sgrid_row]:= '是';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.COFC_FILENAME,''N'')=''Y''';
      end
      else
      begin
        SGrid1.Cells[1,sgrid_row]:='否';
        SGrid1.Cells[2,sgrid_row]:=' and isnull(d10.COFC_FILENAME,''N'')=''N''';
      end;
    end;
    12:
    begin
      if CheckBox1.Checked then
      begin
        SGrid1.Cells[1,sgrid_row]:= '是';
        SGrid1.Cells[2,sgrid_row]:=' and d10.EDI_FLAG_FOR_INVOICE=1';
      end
      else
      begin
        SGrid1.Cells[1,sgrid_row]:='否';
        SGrid1.Cells[2,sgrid_row]:=' and d10.EDI_FLAG_FOR_INVOICE=0';
      end;
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
  CheckBox1.Visible:=False;
  label1.Caption:=listbox1.Items[listbox1.itemindex];
  case listbox1.ItemIndex of
    0:
    begin
      edit1.Visible:=false;
      combobox1.Visible:=true;
      combobox1.Style:=csdropdownlist;
      combobox1.Items.Clear;
      combobox1.Items.Add('正常');
      combobox1.Items.Add('新合作');
      combobox1.Items.Add('控制');
      combobox1.Items.Add('停用');
      combobox1.ItemIndex:=0;
      button1.Enabled:=true;
    end;
    1:bitbtn4.visible:=true;
    2:
    begin
      edit1.Visible:=false;
      combobox1.Visible:=true;
      combobox1.Style:=csdropdownlist;
      combobox1.Items.Clear;
      combobox1.Items.Add('N');
      combobox1.Items.Add('Y');
      combobox1.ItemIndex:=0;
      button1.Enabled:=true;
    end;
    3:bitbtn4.visible:=true;
    4:
    begin
      edit1.Visible:=false;
      combobox1.Visible:=true;
      combobox1.Style:=csdropdownlist;
      combobox1.Items.Clear;
      combobox1.Items.Add('优');
      combobox1.Items.Add('良');
      combobox1.Items.Add('差');
      combobox1.ItemIndex:=0;
      button1.Enabled:=true;
    end;
    5:
    begin
      edit1.Visible:=false;
      combobox1.Visible:=true;
      combobox1.Items.Clear;
      combobox1.Items.Add('自建');
      combobox1.Items.Add('租赁');
      combobox1.ItemIndex:=0;
      button1.Enabled:=true;
    end;
    6:
    begin
      edit1.Visible:=false;
      maskedit1.Visible:=true;
      radiogroup1.Visible:=true;
    end;
  else
    Edit1.Visible:=False;
    BitBtn4.Visible:=False;
    MaskEdit1.Visible:=False;
    ComboBox1.Visible:=False;
    RadioGroup1.Visible:=False;
    CheckBox1.Visible:=True;
    Button1.Enabled:=True;
    CheckBox1.Caption:=ListBox1.Items[ListBox1.ItemIndex];
  end;
end;

procedure Tcondition_form.MaskEdit1Change(Sender: TObject);
begin
  button1.Enabled:=true;
end;

procedure Tcondition_form.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    if listbox1.ItemIndex=1 then
    begin
      inputvar.Fields:='EMPL_CODE/销售代表代码/130,EMPLOYEE_NAME/销售代表名称/240';
      inputvar.Sqlstr:='select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005 order by EMPL_CODE';
      inputvar.KeyField:='rep_code';
    end
    else
    begin
      inputvar.Fields:='country_code/国家代码/130,country_name/国家名称/240';
      inputvar.Sqlstr:='select country_rkey,country_code,country_name from data0250 order by country_code';
      inputvar.KeyField:='country_code';
    end;
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
    begin
      if listbox1.ItemIndex=1 then
        edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['EMPL_CODE'])
      else edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['country_code']);
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

procedure Tcondition_form.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then button1.Enabled:=true
  else button1.Enabled:=false;
end;

procedure Tcondition_form.Edit1Exit(Sender: TObject);
var sqlstr:string;
begin
  if listbox1.ItemIndex=1 then
    sqlstr:='select EMPL_CODE from data0005 where EMPL_CODE='''+trim(edit1.Text)+''''
  else sqlstr:='select country_code from data0250 where country_code='''+trim(edit1.Text)+'''';

  if trim(edit1.Text)<>'' then
  with dm.aqtmp do
  begin
    sql.Clear;
    sql.Add(sqlstr);
    open;
    if isempty then
    begin
      showmessage(label1.caption+'输入错误，请重新输入！');
      edit1.Text:='';
      edit1.SetFocus;
    end;
    close;
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

procedure Tcondition_form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     button1.SetFocus;
end;

end.
