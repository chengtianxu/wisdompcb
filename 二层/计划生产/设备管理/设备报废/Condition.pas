unit Condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Grids, ComCtrls;

type
  TForm_Condition = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
    var CanSelect: Boolean);
    procedure edtValueChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  Form_Condition: TForm_Condition;

implementation

uses demo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm_Condition.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['设备编号', '报废单号','部门负责人', '设备经理','工厂']);
  v_Field_List_EN := VarArrayOf(['data0417.fasset_code','data0574.allocate_number','data0574.outdeptname_empl',
             'data0574.out_equipment','data0015.abbr_name']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-15; DateTimePicker2.Date:=date;
end;

procedure TForm_Condition.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm_Condition.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Text:='';
  BitBtn1.Visible:=listbox3.ItemIndex=4 ;
end;

procedure TForm_Condition.Button4Click(Sender: TObject);
var
 i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_Condition.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TForm_Condition.edtValueChange(Sender: TObject);
begin
Button3.Enabled:=true;
end;

procedure TForm_Condition.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_Condition.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true; 
end;

procedure TForm_Condition.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'warehouse_code/工厂代码/200,abbr_name/工厂名称/200';
    InputVar.Sqlstr := 'select warehouse_code,abbr_name from data0015 order by 1';
    InputVar.AdoConn :=dm.ADOCon ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['abbr_name'];
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
