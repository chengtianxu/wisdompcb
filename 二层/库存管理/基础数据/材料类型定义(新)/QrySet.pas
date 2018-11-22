unit QrySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, Menus, ExtCtrls;

type
  TQry = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    BitBtn7: TBitBtn;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  Qry: TQry;

implementation

uses common, damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TQry.Button3Click(Sender: TObject);
var
  i:integer;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];

  if listbox3.ItemIndex=2 then
   begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.text;

    if ComboBox1.ItemIndex=0 then
         sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]
                                          +' = ''P'''
    else
         sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]
                                          +' = ''M''';
   end
  else
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    case radiogroup3.ItemIndex of
    1:sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    0:sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
    end;
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TQry.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Text:='';
  
  edtValue.Visible := listbox3.ItemIndex<>2 ;
  Button3.Enabled:= listbox3.ItemIndex in [2];
  combobox1.Visible:=listbox3.ItemIndex in [2];
  RadioGroup3.Visible:=listbox3.ItemIndex<>2 ;
  BitBtn7.Visible:=ListBox3.ItemIndex in[0,3];
  
end;

procedure TQry.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;

end;

procedure TQry.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TQry.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['类别代码','类别名称','类型','组别代码']);
  v_Field_List_EN := VarArrayOf(['data0496.GROUP_NAME','data0496.GROUP_DESC','data0496.ttype','data0019.inv_group_name']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
end;

procedure TQry.edtValueChange(Sender: TObject);
begin
  button3.Enabled:=trim(edtValue.Text)<>'' ;
end;

procedure TQry.N1Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;  
end;

procedure TQry.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
   case self.ListBox3.ItemIndex of
    0:
     begin
      InputVar.Fields := 'GROUP_NAME/类别代码/210,GROUP_DESC/类别名称/200';
      InputVar.Sqlstr :='select RKEY,GROUP_NAME,GROUP_DESC from dbo.Data0496';
      inputvar.KeyField:='GROUP_NAME';
      button3.Enabled;
     end;
    3:
     begin
      InputVar.Fields := 'inv_group_name/组别代码/210,inv_group_desc/组别名称/200';
      InputVar.Sqlstr :='select rkey,inv_group_name,inv_group_desc from dbo.Data0019';
      inputvar.KeyField:='inv_group_name';
      button3.Enabled;
     end;
   end;
   inputvar.InPut_value:=edtValue.Text;
   InputVar.AdoConn := dm.ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
    case self.ListBox3.ItemIndex of
     0:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['GROUP_NAME']);
     3:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['inv_group_name']);
    end;
   button3.SetFocus;
   end else edtValue.SetFocus;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

procedure TQry.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n1.Enabled:=false
 else
  n1.Enabled:=true;
end;

end.

