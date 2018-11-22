unit QuerySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TfrmQuerySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValueKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;

  public
    FAc:array[0..5] of integer;
    { Public declarations }
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common,main_059_B;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var
  tmpstr:string;
begin
  tmpstr:=Pick_Cust_ID(edtValue.Text,frmmain_059B.ADOConnection1,2);
  if tmpstr <> '' then
    edtValue.Text := tmpstr;
  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var
 i:byte;
 s:string;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;//  if (trim(edtValue.Text)='') then exit;    //(ListBox3.ItemIndex<>5)and
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
    exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  if ListBox3.ItemIndex=4 then
   begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+inttostr(FAc[ComboBox1.ItemIndex]);
   end
  else
  if listbox3.itemindex=5 then
   begin
    s:='';
    if CheckBox1.Checked then s:='0';
    if CheckBox2.Checked then begin if s='' then s:='1' else s:=s+',1'; end;
    if CheckBox3.Checked then begin if s='' then s:='2' else s:=s+',2'; end;
    if CheckBox4.Checked then begin if s='' then s:='4' else s:=s+',4'; end;
    if s='' then exit;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=s;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s+') ';
   end
  else
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end;

  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.FormShow(Sender: TObject);
var
  i:integer;
begin
  v_Field_List_CN := VarArrayOf(['客户编号','客户名称','本厂编号','客户型号','工厂','BOM状态']);
  v_Field_List_EN := VarArrayOf(['D10.CUST_CODE','D10.CUSTOMER_Name','D25.MANU_PART_NUMBER','D25.MANU_PART_DESC','d15.rkey','D25.BOM_STATUS']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  dtpk1.Date := Get_Month_First_Day(date);;
  dtpk2.Date := date;
end;

procedure TfrmQuerySet.edtValueKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edtValue.Text)<>'' then
   button3.Enabled:=true
  else
   button3.Enabled:=false;
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  BitBtn6.visible := listbox3.ItemIndex = 0 ;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  ComboBox1.Visible:=ListBox3.ItemIndex=4;
  Button3.Enabled:=ListBox3.ItemIndex in [4,5];
  edtValue.Visible:=ListBox3.ItemIndex in[0,1,2,3];
  GroupBox1.Visible:= listbox3.ItemIndex = 5;
  edtValue.Text:='';
end;

procedure TfrmQuerySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button3Click(sender);
end;

procedure TfrmQuerySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
 if sgrid1.RowCount <= 2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuerySet.dtpk1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Button1.Click;
end;



procedure TfrmQuerySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

end.
