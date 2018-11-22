unit QrySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, Menus, ExtCtrls, ComCtrls;

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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  v_Field_List_CN := VarArrayOf(['出仓单号','装箱单','本厂编号','客户型号','类别代码','客户代码','客户简称','工厂代码','仓库','客户订单号','发货人员']);
  v_Field_List_EN := VarArrayOf(['product_issue.out_number','product_issue.delivery_no','product_issue.MANU_PART_NUMBER','product_issue.MANU_PART_DESC',
      'product_issue.PROD_CODE','product_issue.CUST_CODE','product_issue.ABBR_NAME','product_issue.WAREHOUSE_CODE',
      'product_issue.location','product_issue.PO_NUMBER','product_issue.employee_name']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  dtpk1.Date:=date-30;dtpk2.Date:=Date;
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

procedure TQry.Button1Click(Sender: TObject);
begin
  if ModalResult=mrok then
  begin
    dm.ADOS1.Close;
    dm.ADOS1.Parameters[0].Value:=dtpk1.Date;
    dm.ADOS1.Parameters[1].Value:=dtpk2.Date;
    dm.ADOS1.Open;
  end;
end;

end.

