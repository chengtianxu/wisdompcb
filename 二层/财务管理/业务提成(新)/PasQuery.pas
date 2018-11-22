unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFrmQuery = class(TForm)
    Panel2: TPanel;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    rgType: TRadioGroup;
    edtValue: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    DTPk1: TDateTimePicker;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DTTm2: TDateTimePicker;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    GroupBox5: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label6: TLabel;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rgTypeExit(Sender: TObject);
  private
    { Private declarations }
   v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
    iItem,iSeleItem:Integer;
    AddSQLTxt:string;
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses Pick_Item_Single,ConstVar,common, PasDM;

{$R *.dfm}

procedure TFrmQuery.FormShow(Sender: TObject);
var i:integer;
begin
  AddSQLTxt:='';
  iSeleItem:=1;
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['票据编号','客户代码','操作员工','凭证编号','工厂代码','票据类型']);
  v_Field_List_EN := VarArrayOf(['Data0114.REFERENCE_NO','Data0010.CUST_CODE','Data0005.EMPL_CODE','Data0105.VOUCHER','data0015.warehouse_code','data0114.ttype']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 2;
    ListBox3.OnClick(sender);
  end else ListBox3.ItemIndex:=iItem;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  Button3.Enabled:=true;
  edtValue.Text:='';
  ComboBox1.ItemIndex:=-1;
  DTPk1.Date:=getsystem_date(DM.tmp,0)-3;
  DTPk2.Date:=getsystem_date(DM.tmp,0);
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
  edtValue.text:='';
  Button3.Enabled:=listbox3.ItemIndex in [1,2,4,5];
  BitBtn6.visible :=listbox3.ItemIndex in [1,2,4];
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3,4];
  rgType.Visible := listbox3.ItemIndex in [5] ;
  edtValue.ReadOnly:=listbox3.ItemIndex in [1,2,4,5];

  if listbox3.ItemIndex =5 then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('现银收款');
    rgType.Items.Add('预收帐款');
    rgType.Items.Add('转帐收款');
    rgType.ItemIndex:=0;
  end;
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

procedure TFrmQuery.Button3Click(Sender: TObject);
var i,j:byte;  //修改andy081028,相同的条件项可修改值，不需先删除再增加
    sTp:string;
begin
//  if (listbox3.itemindex < 3) and (trim(edtValue.Text)='') then exit;
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
  if (listbox3.itemindex =0) or (listbox3.itemindex =3) then
  begin
    sgrid1.Cells[1,j]:=edtValue.Text;
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end
  else if (listbox3.itemindex =5) then
  begin
      sgrid1.Cells[1,j]:=rgType.Items[rgType.ItemIndex];
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+inttostr(iSeleItem)+'';
  end
  else if (ListBox3.ItemIndex = 1) or (listbox3.itemindex = 2) or (ListBox3.ItemIndex=4) then
  begin
    sgrid1.Cells[1,j]:=edtValue.Text;
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
  end;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrmQuery.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

procedure TFrmQuery.BitBtn6Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    1:
    begin
      InputVar.Fields := 'CUST_CODE/客户编号/150,CUSTOMER_NAME/客户名称/350';
      InputVar.Sqlstr :='select rKey,CUST_CODE,CUSTOMER_NAME from data0010 order by CUST_CODE';
      inputvar.KeyField:='CUST_CODE';
    end;
    2:
    begin
      InputVar.Fields := 'EMPL_CODE/操作员工号/120,EMPLOYEE_NAME/操作员姓名/300';
      InputVar.Sqlstr :='select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005';
      inputvar.KeyField:='EMPL_CODE';
    end;
    4:
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
     1:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     2:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
     4:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
    end;
    button3.SetFocus;
  end else edtValue.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;

  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TFrmQuery.BitBtn1Click(Sender: TObject);
begin
  iItem:=ListBox3.ItemIndex;
end;

procedure TFrmQuery.rgTypeExit(Sender: TObject);
begin
  if rgType.ItemIndex=0 then iSeleItem:=1
  else if rgType.ItemIndex=1 then iSeleItem:=2
  else if rgType.ItemIndex=2 then iSeleItem:=5;
end;

end.
