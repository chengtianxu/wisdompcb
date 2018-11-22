unit QuerySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus,DateUtils;

type
  TForm_Condition = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    BitBtn7: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure edtValueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    v_form:Byte;   //0:装运查找,1:退货查找

    { Public declarations }
  end;

var
  Form_Condition: TForm_Condition;

implementation
uses Demo,common,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TForm_Condition.Button3Click(Sender: TObject);
var
 i:byte;
 s:string;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex=4 then
  begin
    s:='';
    if CheckBox1.Checked then s:='0';
    if CheckBox2.Checked then begin if s='' then s:='1' else s:=s+',1'; end;
    if CheckBox3.Checked then begin if s='' then s:='2' else s:=s+',2'; end;
    if CheckBox4.Checked then begin if s='' then s:='3' else s:=s+',3'; end;
    if s='' then exit;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=s;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s+') ';
  end
  else
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm_Condition.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex=0 ;
  edtValue.Visible :=not (listbox3.ItemIndex in [4]) ;
  GroupBox1.Visible:=listbox3.ItemIndex=4;
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex in [4];
end;

procedure TForm_Condition.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (edtvalue.Text <> '') then
    Button3Click(sender);
end;

procedure TForm_Condition.Button4Click(Sender: TObject);
var
  i:Byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_Condition.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;

procedure TForm_Condition.edtValueChange(Sender: TObject);
begin
if edtvalue.Text <> '' then
 button3.Enabled:=true
else
 button3.Enabled:=false; 
end;

procedure TForm_Condition.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['本厂编号','返工代码', '返工异常等级', '申请工序','状态']);
  v_Field_List_EN := VarArrayOf(['data0025.manu_part_number','data0203.return_code',
             'data0203.v_ttype', 'data0034.dept_code','data0203.status']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-2; DateTimePicker2.Date:=date;
end;

procedure TForm_Condition.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'manu_part_number/本厂编号/200,manu_part_desc/客户型号/200';
    InputVar.Sqlstr := 'select manu_part_number,manu_part_desc from data0025 where tstatus=1 order by 1';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['manu_part_number'];
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm_Condition.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TForm_Condition.N1Click(Sender: TObject);
begin
if SGrid1.row=SGrid1.RowCount-1 then N1.Enabled:=False else N1.Enabled:=True;
end;

end.
