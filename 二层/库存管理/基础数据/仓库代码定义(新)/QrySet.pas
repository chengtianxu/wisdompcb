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
    BitBtn7: TBitBtn;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
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
  if listbox3.ItemIndex=3 then
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.text;
    case radiogroup3.ItemIndex of
    0:sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]
                                          +' = '''+inttostr(ComboBox1.itemindex)+'''';
    1:sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]
                                          +' like ''%'+inttostr(ComboBox1.itemindex)+'%''';
    end;
  end else
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    case radiogroup3.ItemIndex of
    0:sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    1:sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
    end;
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TQry.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Text:='';
  BitBtn7.Visible:=listbox3.ItemIndex<>3 ;
  edtValue.Visible := listbox3.ItemIndex<>3 ;
  Button3.Enabled:= listbox3.ItemIndex in [3];
  combobox1.Visible:=listbox3.ItemIndex in [3];
  RadioGroup3.Visible:=listbox3.ItemIndex<>3 ;
  
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
  v_Field_List_CN := VarArrayOf(['仓库代码','仓库名称','工厂代码','类型']);
  v_Field_List_EN := VarArrayOf(['data0016.code','data0016.location','data0015.warehouse_code','data0016.location_type']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
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
      InputVar.Fields := 'code/仓库代码/210,location/仓库名称/200';
      InputVar.Sqlstr :='select rkey,code,location from data0016';
      inputvar.KeyField:='code';
      button3.Enabled;
     end;
    1:
     begin
      InputVar.Fields := 'code/仓库代码/210,location/仓库名称/200';
      InputVar.Sqlstr :='select rkey,code,location from data0016';
      inputvar.KeyField:='location';
     end;
    2:
     begin
      InputVar.Fields := 'warehouse_code/工厂代码/75,warehouse_name/工厂名称/180,abbr_name/工厂简称/80';
      InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name,abbr_name from data0015';
      inputvar.KeyField:='warehouse_code';
     end;
   end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['code']);
     1:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['location']);
     2:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
    end;
   button3.SetFocus;
  end else edtValue.SetFocus;
  finally
    frmPick_Item_Single.Free ;
  end;
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

end.

