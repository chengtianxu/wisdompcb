unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFrmQuery = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel2: TPanel;
    StaticText2: TStaticText;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    ComboBox1: TComboBox;
    BitBtn7: TBitBtn;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   v_Field_List_CN,v_Field_List_EN:Variant;
   iType2,sRGroup:string;
  public
    { Public declarations }
    iItem:Integer;
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses Pick_Item_Single,ConstVar,common, damo;

{$R *.dfm}

procedure TFrmQuery.FormShow(Sender: TObject);
var i:integer;
begin
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['客户代码','本厂编号','客户型号','销售订单','客订单号','工厂','层数']);                                                                 
  v_Field_List_EN := VarArrayOf(['Data0010.CUST_CODE','Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','data0060.sales_order','data0097.po_number','data0015.WAREHOUSE_CODE','data0025.LAYERS']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
    BitBtn7.Visible:=True;
    Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  end else ListBox3.ItemIndex:=iItem;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  sRGroup:='=';
end;

procedure TFrmQuery.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    SGrid1.MouseToCell(x,y,column,row);
    if row<>0 then SGrid1.Row:=row;
  end;
end;

procedure TFrmQuery.ListBox3Click(Sender: TObject);
begin
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3,4,5,6];
  edtValue.Text:='';
  BitBtn7.Visible:=listbox3.ItemIndex in [0,5];
  edtValue.ReadOnly:=listbox3.ItemIndex in [0,5];
  RadioGroup1.Visible:=ListBox3.ItemIndex in [6];
  Button3.Enabled:= listbox3.ItemIndex in [0,1,2,3,4,5,6];
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  iItem:=listbox3.ItemIndex;
end;

procedure TFrmQuery.Button4Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case listbox3.ItemIndex of
      0:
      begin
        InputVar.Fields := 'cust_code/客户代码/150,customer_name/客户名称/250';
        InputVar.Sqlstr :='select rkey,cust_code,customer_name from data0010 order by cust_code';
        inputvar.KeyField:='cust_code';
      end;
      5:
      begin
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/150,WAREHOUSE_NAME/工厂名称/350';
        InputVar.Sqlstr :='select rkey,WAREHOUSE_CODE,WAREHOUSE_NAME from data0015 order by WAREHOUSE_CODE';
        inputvar.KeyField:='WAREHOUSE_CODE';
      end;
    end;
    InputVar.AdoConn:=dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if listbox3.ItemIndex=0 then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
      if ListBox3.ItemIndex=5 then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var i,j:byte;
    s:string;
begin
  if (edtValue.Visible and (trim(edtValue.Text)='')) then exit;
  if ListBox3.ItemIndex in [1,2,3,4] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=edtValue.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox3.ItemIndex in [0,5] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=edtValue.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'= '''+edtValue.Text+'''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'= '''+edtValue.Text+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [6] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
         if (RadioGroup1.ItemIndex=0) then
         begin
           sgrid1.Cells[1,i]:='等于'+edtValue.Text;
           sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+edtValue.Text+'';
         end else if (RadioGroup1.ItemIndex=1) then
         begin
            sgrid1.Cells[1,i]:='大于'+edtValue.Text;
            sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' > '+edtValue.Text+'';
         end else if (RadioGroup1.ItemIndex=2) then
         begin
            sgrid1.Cells[1,i]:='小于'+edtValue.Text;
            sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' < '+edtValue.Text+'';
         end;
      exit;
      end;
    if (RadioGroup1.ItemIndex=0) then
    begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:='等于'+edtValue.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+edtValue.Text+'';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end else if (RadioGroup1.ItemIndex=1) then
    begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:='大于'+edtValue.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'> '+edtValue.Text+'';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end else if (RadioGroup1.ItemIndex=2) then
    begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:='小于'+edtValue.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'< '+edtValue.Text+'';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end else
    begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:='等于'+edtValue.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'= '+edtValue.Text+'';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end;
  end;
end;

procedure TFrmQuery.edtValueChange(Sender: TObject);
begin
  if (Trim(edtValue.Text)<>'') then Button3.Enabled:=True;
end;

procedure TFrmQuery.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
 if listbox3.ItemIndex= listbox3.Items.IndexOf('层数') then
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

end.
