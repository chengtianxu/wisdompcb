unit QrySet1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, Menus, ExtCtrls;

type
  TQry1 = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    BitBtn7: TBitBtn;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    ComboBox1: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  Qry1: TQry1;

implementation

uses common, damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TQry1.Button3Click(Sender: TObject);
var
  i:integer;
  j:Byte;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  {for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];}
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

  if listbox3.ItemIndex=2 then
  begin
    sgrid1.Cells[1,j]:=ComboBox1.text;
    case radiogroup3.ItemIndex of
    0:sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]
                                          +' = '''+inttostr(ComboBox1.itemindex)+'''';
    1:sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]
                                          +' like ''%'+inttostr(ComboBox1.itemindex)+'%''';
    end;
  end else
  begin
    sgrid1.Cells[1,j]:=edtValue.Text;
    case radiogroup3.ItemIndex of
    0:sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    1:sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
    end;
  end;
  //sgrid1.RowCount:=sgrid1.RowCount+1;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TQry1.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Text:='';
  BitBtn7.Visible:=listbox3.ItemIndex<>2 ;
  edtValue.Visible := listbox3.ItemIndex<>2 ;
  Button3.Enabled:= listbox3.ItemIndex in [2];
  combobox1.Visible:=listbox3.ItemIndex in [2];
  RadioGroup3.Visible:=listbox3.ItemIndex<>2 ;
end;
                                                                  
procedure TQry1.Button4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TQry1.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TQry1.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['收入/支出名称','科目编码','类别']);
  v_Field_List_EN := VarArrayOf(['data0520.NAME','data0103.GL_ACC_NUMBER','data0520.TTYPE']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
end;

procedure TQry1.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
   case self.ListBox3.ItemIndex of
    0,2:
     begin
      InputVar.Fields := 'NAME/收入支出名称/130,DESCRIPTION/说明/130,TTYPE/类别/130';
      InputVar.Sqlstr :='select rkey,NAME,DESCRIPTION,TTYPE from data0520';
      inputvar.KeyField:='NAME';
     end;
    1:
      begin
      InputVar.Fields := 'GL_ACC_NUMBER/科目编码/210,GL_DESCRIPTION/科目名称/210';
      InputVar.Sqlstr := 'select rkey,gl_acc_number,gl_description from data0103 where has_child=0 order by gl_acc_number';
      inputvar.KeyField:='curr_code';
      end;

   end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['NAME']);
     1:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['gl_acc_number']);
     2:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['TTYPE']);
    end;
   button3.SetFocus;
  end else edtValue.SetFocus;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TQry1.edtValueChange(Sender: TObject);
begin
  button3.Enabled:=trim(edtValue.Text)<>'' ;
end;

procedure TQry1.N1Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;  
end;

procedure TQry1.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

end.

