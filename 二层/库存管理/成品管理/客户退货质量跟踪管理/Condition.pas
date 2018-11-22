unit Condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls;

type
  TForm_Condition = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
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
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    GroupBox3: TGroupBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure edtValueChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var
  Form_Condition: TForm_Condition;

implementation

uses Demo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm_Condition.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['退货单号','客户代码','销售订单号', '客户PO号','退货状态','出仓状态','重检状态']);
  v_Field_List_EN := VarArrayOf(['data0098.RMA_NUMBER','data0010.cust_code',
             'data0060.sales_order', 'data0097.po_number','data0098.RMA_STATUS','Data0415.status','Data0414.status']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-2; DateTimePicker2.Date:=date;
end;

procedure TForm_Condition.Button3Click(Sender: TObject);
var
 i:byte;
 s1,s2,s3:string;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex=4 then
  begin
    s1:='';
    if CheckBox1.Checked then s1:='1';
    if CheckBox3.Checked then begin if s1='' then s1:='2' else s1:=s1+',2'; end;
    if CheckBox2.Checked then begin if s1='' then s1:='3' else s1:=s1+',3'; end;
    if CheckBox4.Checked then begin if s1='' then s1:='4' else s1:=s1+',4'; end;
    if s1='' then exit;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=s1;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s1+') ';
  end
  else
  if ListBox3.ItemIndex=5 then
  begin
       s2:='';
    if CheckBox5.Checked then s2:='1';
    if CheckBox7.Checked then begin if s2='' then s2:='2' else s2:=s2+',2'; end;
    if CheckBox6.Checked then begin if s2='' then s2:='3' else s2:=s2+',3'; end;
    if CheckBox9.Checked then begin if s2='' then s2:='4' else s2:=s2+',4'; end;
    if CheckBox8.Checked then begin if s2='' then s2:='5' else s2:=s2+',5'; end;
    if s2='' then exit;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=s2;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s2+') ';
  end
  else
  if ListBox3.ItemIndex=6 then
  begin
    s3:='';
    if CheckBox10.Checked then s3:='1';
    if CheckBox11.Checked then begin if s3='' then s3:='2' else s3:=s3+',2'; end;
    if CheckBox12.Checked then begin if s3='' then s3:='3' else s3:=s3+',3'; end;
    if s3='' then exit;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=s3;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s3+') ';
  end
  else
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;



procedure TForm_Condition.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex=1 ;
  edtValue.Visible :=not (listbox3.ItemIndex in [4,5,6]) ;
  GroupBox1.Visible:=listbox3.ItemIndex=4;
  GroupBox2.Visible:=listbox3.ItemIndex=5;
  GroupBox3.Visible:=listbox3.ItemIndex=6;
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex in [4,5,6];
end;

procedure TForm_Condition.Button4Click(Sender: TObject);
var
  i:Byte;
begin
  if sgrid1.RowCount <= 2 then exit;
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

procedure TForm_Condition.CheckBox1Click(Sender: TObject);
begin
 Button3.Enabled:=CheckBox1.Checked or CheckBox2.Checked or CheckBox3.Checked or CheckBox4.Checked;
end;

procedure TForm_Condition.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'cust_code/客户代码/200,ABBR_NAME/客户简称/200';
    InputVar.Sqlstr := 'select cust_code,ABBR_NAME from data0010 order by 1';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['cust_code'];
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm_Condition.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;



procedure TForm_Condition.PopupMenu1Popup(Sender: TObject);
begin
 N1.Enabled:=SGrid1.RowCount>2;
end;

end.
