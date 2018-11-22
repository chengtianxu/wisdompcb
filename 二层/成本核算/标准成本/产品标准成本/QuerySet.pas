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
    ComboBox2: TComboBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure dtpk1KeyPress(Sender: TObject; var Key: Char);
    procedure edtValueChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
    FAc:array[0..5] of integer;
  public
    { Public declarations }
    fieldName:string;
  end;

var
  frmQuerySet: TfrmQuerySet;

implementation
uses common,dm;
{$R *.dfm}

procedure TfrmQuerySet.BitBtn6Click(Sender: TObject);
var
  tmpstr:string;
begin
  tmpstr:=Pick_Cust_ID(edtValue.Text,dmcon.ADOConnection1,2);
  if tmpstr <> '' then
    edtValue.Text := tmpstr;
  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TfrmQuerySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if (trim(edtValue.Text)='') and (ListBox3.ItemIndex<>4) then exit;
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
  end else begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TfrmQuerySet.FormShow(Sender: TObject);
var
  i:integer;
begin
  dmcon.tmp.Close;
  dmcon.tmp.sql.Text:='select rkey,abbr_name from data0015 order by 1';
  dmcon.tmp.Open;
  i:=0 ;
  while not dmcon.tmp.eof do
  begin
    ComboBox1.Items.Append(dmcon.tmp.fields[1].asstring);
    FAc[i]:=dmcon.tmp.fields[0].asinteger;
    inc(i);
    dmcon.tmp.next;
  end;
  if i>0 then ComboBox1.itemindex:=0;
  v_Field_List_CN := VarArrayOf(['本厂编号','客户代码','客户名称','客户型号','工厂']);
  v_Field_List_EN := VarArrayOf(['D25.MANU_PART_NUMBER','D10.CUST_CODE','D10.CUSTOMER_Name','D25.MANU_PART_DESC','d15.rkey']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  dtpk1.Date := Get_Month_First_Day(date);
  dtpk2.Date := date;
  listbox3.Selected[0]:=true;
  fieldName:='';
  ListBox3.OnClick(sender);
  ComboBox2.ItemIndex:=1;
end;

procedure TfrmQuerySet.ListBox3Click(Sender: TObject);
begin
  BitBtn6.visible := listbox3.ItemIndex = 1 ;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  ComboBox1.Visible:=ListBox3.ItemIndex=4;
  Button3.Enabled:=ListBox3.ItemIndex=4;
  edtValue.Visible:=ListBox3.ItemIndex<>4;
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

procedure TfrmQuerySet.edtValueChange(Sender: TObject);
begin
  if trim(edtValue.Text)<>'' then
   button3.Enabled:=true
  else
   button3.Enabled:=false;
end;

procedure TfrmQuerySet.Button1Click(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
    0: fieldName:='CUSTPART_ENT_DATE';
    1: fieldName:='LAST_MODIFIED_DATE';
  else fieldName:='AUDITED_DATE';
  end;
end;

end.
