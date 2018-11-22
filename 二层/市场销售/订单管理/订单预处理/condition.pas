unit condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_Condition = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    BitBtn7: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox1: TComboBox;
    edtValue: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
  private
   v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  Form_Condition: TForm_Condition;

implementation
uses Pick_Item_Single,ConstVar,common, demo;

{$R *.dfm}

procedure TForm_Condition.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['本厂编号','合同编号','客户型号', '客户物料编号','工厂','产品阶数']);
  v_Field_List_EN := VarArrayOf(['data0213.MANU_PART_NUMBER','data0213.PO_NUMBER','data0213.MANU_PART_DESC','data0213.ANALYSIS_CODE_2','data0015.WAREHOUSE_CODE','data0025.CPJS']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=getsystem_date(dm.ADOQuery1,1)-30;
  DateTimePicker2.Date:=getsystem_date(dm.ADOQuery1,1);
end;

procedure TForm_Condition.Button3Click(Sender: TObject);
var
 i,j:integer;
begin
  for i:=1 to sgrid1.RowCount-1 do
  begin
   if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
   begin
     j:=i;
     break;
   end;
   j:=sgrid1.RowCount-1;
  end;
  sgrid1.Cells[0,j]:=listbox3.Items[listbox3.itemindex];
  if (listbox3.itemindex <=4) then
  begin
    sgrid1.Cells[0,j]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,j]:=edtValue.Text;
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+Trim(edtValue.Text)+'%''';
  end;
  if (listbox3.itemindex =5) then
  begin
    if (Trim(combobox1.Text)='') then
    begin
      sgrid1.Cells[2,j]:=' and 1=1';
      sgrid1.Cells[1,j]:=combobox1.Text;
    end else
    begin
      sgrid1.Cells[2,j]:=' and data0025.CPJS like ''%'+combobox1.Text+'%''';
      sgrid1.Cells[1,j]:=combobox1.Text;
    end;
  end;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm_Condition.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Text:='';
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3,4];
  BitBtn7.visible :=False;
  ComboBox1.Visible:=False;
  if listbox3.ItemIndex=4 then
  begin
    edtValue.ReadOnly:=True;
    BitBtn7.visible :=True;
    ComboBox1.Visible:=False;
  end;
  if listbox3.ItemIndex=5 then
  begin
    ComboBox1.Visible:=True;
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csDropDown;
    dm.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
    dm.ADOQuery1.Open;
    while not dm.ADOQuery1.Eof do
    begin
      ComboBox1.Items.Add(dm.ADOQuery1.FieldBYName('tvalue').AsString);
      DM.ADOQuery1.Next;
    end;
    ComboBox1.ItemIndex:=-1;
    edtValue.Visible :=False;
    BitBtn7.visible :=False;
    Button3.Enabled:=true;
  end;
end;

procedure TForm_Condition.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_Condition.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TForm_Condition.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    4:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/120,warehouse_name/工厂名称/300';
      InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name from data0015';
      inputvar.KeyField:='warehouse_code';
    end;
  end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn :=DM.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
     edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
  end;
 finally
   frmPick_Item_Single.Free ;
 end;
  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TForm_Condition.edtValueChange(Sender: TObject);
begin
  if ((edtValue.Visible=True) and (Trim(edtValue.Text)<>'')) then Button3.Enabled:=True else Button3.Enabled:=False;
end;

end.
