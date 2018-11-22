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
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    edtValue: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var Frm_QrySet:TFrm_QrySet;
implementation

uses common,DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:integer;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
  sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [0,1,2] ;
  edtValue.Text:='';
  Button3.Enabled:=false;
end;

procedure TFrm_QrySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QrySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['材料编码','部门代码','产品编码','配料单号']);
  v_Field_List_EN := VarArrayOf(['data0017.INV_PART_NUMBER','Data0034.DEPT_CODE','Data0025.MANU_PART_NUMBER','data0492.CUT_NO']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-7; DateTimePicker2.Date:=date;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields := 'INV_PART_NUMBER/材料编码/150,INV_NAME/材料名称名称/200,INV_DESCRIPTION/材料规格/200';
      InputVar.Sqlstr :='SELECT INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION, RKEY FROM Data0017 order by 1';
      inputvar.KeyField:='INV_PART_NUMBER';
    end;
    1:
    begin
      InputVar.Fields := 'Dept_code/部门编码/150,dept_name/部门名称/200';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name '+
                        'from data0034 where (is_cost_dept=1)'+
                        'and (ACTIVE_FLAG=0) order by 1';
      inputvar.KeyField:='Dept_code';
    end;
    2:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编码/100,MANU_PART_DESC/客户型号/200,ANALYSIS_CODE_2/客户物料号/200';
      InputVar.Sqlstr :='SELECT RKEY,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,ANALYSIS_CODE_2 FROM Data0025 order by MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);

    if frmPick_Item_Single.ShowModal=mrok then
    begin
     case ListBox3.ItemIndex of
       0: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];
       1: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['Dept_code'];
       2: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER'];
     end;
     Button3.Enabled := true ;
    end;
 finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
 end;
end;

procedure TFrm_QrySet.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

end.
