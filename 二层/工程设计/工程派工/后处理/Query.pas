unit Query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Buttons, ComCtrls, Menus;

type
  TFrmQuery = class(TForm)
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    BitBtn7: TBitBtn;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
      iItem:Integer;
    AddSQLTxt:string;
  end;

var
  FrmQuery: TFrmQuery;

implementation

uses Pick_Item_Single,common,DAMO,ConstVar, Main;

{$R *.dfm}

procedure TFrmQuery.ListBox3Click(Sender: TObject);
var i:integer;
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [2,3] ;
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3];
  edtValue.Text:='';

end;

procedure TFrmQuery.Button3Click(Sender: TObject);
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
procedure TFrmQuery.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.edtValueChange(Sender: TObject);
begin
   Button3.Enabled:=true;
end;

procedure TFrmQuery.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    2:
    begin
      InputVar.Fields := 'PROD_CODE/产品类别代码/220,PRODUCT_NAME/产品类别名称/230';
      InputVar.Sqlstr :='select rKey,PROD_CODE,PRODUCT_NAME from data0008 order by PROD_CODE';
      inputvar.KeyField:='PROD_CODE';
    end;
    3:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/120,warehouse_name/工厂名称/300';
      InputVar.Sqlstr :='select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name from data0015';
      inputvar.KeyField:='warehouse_code';
    end;
  end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn :=DM.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     2:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']);
     3:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
    end;
    button3.SetFocus;
  end else edtValue.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;

  button3.Enabled:= trim(edtValue.Text) <> '';
end;



procedure TFrmQuery.FormCreate(Sender: TObject);
var i:integer;
begin
   v_Field_List_CN := VarArrayOf(['本厂编号','客户型号','产品类别','工厂']);
  v_Field_List_EN := VarArrayOf(['Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0008.PROD_CODE','data0015.warehouse_code']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
   ListBox3.ItemIndex := 1;
end;

end.
