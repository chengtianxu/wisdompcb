unit Frm_QrySet_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TFrm_QrySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    ComboBox2: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;

  public
    { Public declarations }
  end;

var Frm_QrySet:TFrm_QrySet;
implementation

uses common, DM_u;
{$R *.dfm}

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  if ComboBox1.Visible and (ComboBox1.ItemIndex=-1) then exit;
  if ComboBox2.Visible and (ComboBox2.ItemIndex=-1) then exit;


  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];

  if listbox3.itemindex=2 then   //fac
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+ComboBox1.Text+'''';
  end
  else
  if listbox3.itemindex=1 then
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox2.Text;
    if ComboBox2.ItemIndex=0 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ''S'''
    else
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ''M''' ;
  end
  else
  if listbox3.itemindex=0 then
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
var i:integer;
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  ComboBox1.Visible :=listbox3.ItemIndex =2 ;   //fac
  ComboBox2.Visible :=listbox3.ItemIndex =1 ;   //type
  edtValue.Visible := listbox3.ItemIndex=0 ;
  edtValue.Text:='';
  Button3.Enabled:=listbox3.ItemIndex in [1,2];
end;

procedure TFrm_QrySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySet.ComboBox1Change(Sender: TObject);
begin
  Button3.Enabled:=true;
end;

procedure TFrm_QrySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QrySet.FormCreate(Sender: TObject);
var i:integer;
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey,warehouse_code from data0015';
  DM.tmp.Open;
  i:=0;
  while not DM.tmp.Eof do
  begin
    ComboBox1.Items.Append(DM.tmp.Fields[1].asstring);
    ComboBox1.ItemIndex:=0;
    DM.tmp.Next;
  end;

  v_Field_List_CN := VarArrayOf(['请购编号','请购类型','工厂']);
  v_Field_List_EN := VarArrayOf(['data0068.po_req_number','data0068.flag','data0015.warehouse_code']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-7; DateTimePicker2.Date:=date+1;
end;

end.
