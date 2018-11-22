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
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
   v_Field_List_CN,v_Field_List_EN:Variant;
   iType2:Integer;
  public
    { Public declarations }
    iItem:Integer;
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
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['本厂编号','客户型号','产品类别','工厂','订单新旧','预审指派时间','CAM指派时间','EQ状态']);
  v_Field_List_EN := VarArrayOf(['Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0008.PROD_CODE','data0015.warehouse_code','DATA0538.so_oldnew','DATA0538.YSZP_DATE','DATA0538.CAMZP_DATE','']);
//  v_Field_List_CN := VarArrayOf(['本厂编号','客户型号','产品类别','预审EQ状态','工厂','订单新旧','预审指派时间','CAM指派时间','CAM组EQ状态']);
//  v_Field_List_EN := VarArrayOf(['Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0008.PROD_CODE','DATA0538.YS_EQ_STATUS','data0015.warehouse_code','DATA0538.so_oldnew','DATA0538.YSZP_DATE','DATA0538.CAMZP_DATE','DATA0538.CAM_EQ_STATUS']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 1;
    ListBox3.OnClick(sender);
  end else ListBox3.ItemIndex:=iItem;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  edtValue.Text:='';
  ComboBox1.ItemIndex:=-1;
  dtpk1.Date:=Date-2;
  dtpk2.Date:=Date;
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
var i:integer;
begin
  edtValue.text:='';
  Button3.Enabled:=listbox3.ItemIndex in [4,5,6,7];
  BitBtn6.visible :=listbox3.ItemIndex in [2,3];
  edtValue.Visible := (listbox3.ItemIndex <=2) or (listbox3.ItemIndex =3);
  rgType.Visible := listbox3.ItemIndex in [4,7];
//  GroupBox4.Visible:=ListBox3.ItemIndex=3;
  GroupBox1.Visible:=listbox3.ItemIndex in [5,6];
  edtValue.ReadOnly:=listbox3.ItemIndex in [2,3];

  if listbox3.ItemIndex =4 then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('新单');
    rgType.Items.Add('旧单');
    rgType.ItemIndex:=0;
  end;
  if listbox3.ItemIndex =7 then
  begin
    rgType.Items.Clear;
    rgType.Items.Add('无');
    rgType.Items.Add('进行中');
    rgType.Items.Add('已完成');
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
  if (listbox3.itemindex < 3) and (trim(edtValue.Text)='') then exit;
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
  if listbox3.itemindex <= 2 then
  begin
    sgrid1.Cells[1,j]:=edtValue.Text;
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end
  else begin
    if listbox3.itemindex = 4 then
    begin
      sgrid1.Cells[1,j]:=rgType.Items[rgType.itemindex];
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = ''' +rgType.Items[rgType.itemindex]+'''';
    end
    else if listbox3.itemindex = 3 then
    begin
      sgrid1.Cells[1,j]:=edtValue.Text;
      sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='''+edtValue.Text+'''';
    end else
    if listbox3.itemindex in [5,6] then
    begin
      sgrid1.Cells[1,j]:='从:'+datetostr(dtpk1.Date)+'到:'+datetostr(dtpk2.Date);
      sgrid1.Cells[2,j]:=' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)>='''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTTm1.Time)+
                         ''' and isnull('+v_Field_List_EN[ListBox3.ItemIndex]+',0)<='''+datetostr(dtpk2.date)+formatdatetime(' hh:nn:ss',DTTm2.Time)+'''';
    end else if listbox3.itemindex = 7 then
    begin
      sgrid1.Cells[1,j]:=rgType.Items[rgType.itemindex];
      sgrid1.Cells[2,j]:=' and ((DATA0538.YS_EQ_STATUS = ' +Inttostr(rgType.itemindex)+') or (DATA0538.CAM_EQ_STATUS=' +Inttostr(rgType.itemindex)+'))';
//    end else if listbox3.itemindex = 3 then
//    begin
//       sTp:='';
//       for i:=0 to GroupBox4.ControlCount-1 do
//         if TCheckBox(GroupBox4.Controls[i]).Checked then
//           sTp:=sTp+inttostr(TCheckBox(GroupBox4.Controls[i]).Tag)+',';
//      if sTp<>'' then
//      begin
//        sgrid1.Cells[1,j]:=copy(sTp,1,length(sTp)-1);
//        sgrid1.Cells[2,j]:=' DATA0538.STATUS in ('+sTp+'159)';
//      end;
    end;
  end;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrmQuery.ComboBox3Change(Sender: TObject);
begin
//  if (ComboBox1.ItemIndex=0) then iType2:=0; //正常领料
//  if (ComboBox1.ItemIndex=1) then iType2:=1; //损耗领料
end;

procedure TFrmQuery.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

procedure TFrmQuery.ComboBox1Change(Sender: TObject);
begin
  Button3.Enabled:=ComboBox1.Text<>'';
end;

procedure TFrmQuery.BitBtn6Click(Sender: TObject);
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

end.
