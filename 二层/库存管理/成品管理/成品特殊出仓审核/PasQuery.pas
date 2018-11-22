unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, Buttons, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmQuery = class(TForm)
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
    BitBtn7: TBitBtn;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
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
    DTTm1: TDateTimePicker;
    DTTm2: TDateTimePicker;
    procedure BitBtn7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;
    { Private declarations }
  public
    { Public declarations }
    iIndex:Integer;
  end;

var
  frmQuery: TfrmQuery;

implementation
uses Pick_Item_Single,ConstVar,common, main_one;

{$R *.dfm}

procedure TfrmQuery.BitBtn7Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    3,4:
    begin
      InputVar.Fields := 'EMPL_CODE/员工编号/220,EMPLOYEE_NAME/员工姓名/230';
      InputVar.Sqlstr :='select rKey,EMPL_CODE,EMPLOYEE_NAME from data0005 order by EMPL_CODE';
      inputvar.KeyField:='EMPL_CODE';
    end;
    5:
    begin
      InputVar.Fields := 'CUST_CODE/客户编号/150,ABBR_NAME/客户简称/250';
      InputVar.Sqlstr :='select rkey,CUST_CODE,ABBR_NAME from data0010 order by CUST_CODE';
      inputvar.KeyField:='CUST_CODE';
    end;
  end;
  inputvar.InPut_value:=edtValue.Text;
  InputVar.AdoConn :=Form4.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     3,4:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
     5:edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
    end;
  end else edtValue.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;

  button3.Enabled:= trim(edtValue.Text) <> '';
end;

procedure TfrmQuery.Button4Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuery.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmQuery.ListBox3Click(Sender: TObject);

begin
  edtValue.text:='';
  Button3.Enabled:=listbox3.ItemIndex in [0,1,2,3,4,5,6,7];
  BitBtn7.visible :=listbox3.ItemIndex in [3,4,5];
  edtValue.Visible := (listbox3.ItemIndex <=5) ;

  GroupBox1.Visible:=listbox3.ItemIndex = 6;
  GroupBox2.Visible:=listbox3.ItemIndex = 7;
  edtValue.ReadOnly:=listbox3.ItemIndex in [3,4,5];
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  iIndex:=listbox3.ItemIndex;
end;

procedure TfrmQuery.Button3Click(Sender: TObject);
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
  if listbox3.itemindex <=5 then
  begin
    sgrid1.Cells[1,j]:=edtValue.Text;
    sgrid1.Cells[2,j]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%''';
  end
  else begin
    if listbox3.itemindex = 6 then
    begin
       sTp:='';
       for i:=0 to GroupBox1.ControlCount-1 do
         if TCheckBox(GroupBox1.Controls[i]).Checked then
           sTp:=sTp+inttostr(TCheckBox(GroupBox1.Controls[i]).Tag)+',';
      if sTp<>'' then
      begin
        sgrid1.Cells[1,j]:=copy(sTp,1,length(sTp)-1);
        sgrid1.Cells[2,j]:=' and data0415.type in ('+sTp+'159)';
      end;
    end else if listbox3.itemindex = 7 then
    begin
       sTp:='';
       for i:=0 to GroupBox2.ControlCount-1 do
         if TCheckBox(GroupBox2.Controls[i]).Checked then
           sTp:=sTp+inttostr(TCheckBox(GroupBox2.Controls[i]).Tag)+',';
      if sTp<>'' then
      begin
        sgrid1.Cells[1,j]:=copy(sTp,1,length(sTp)-1);
        sgrid1.Cells[2,j]:=' and data0415.status in ('+sTp+'159)';
      end;
    end;
  end;
  if j=sgrid1.RowCount-1 then
    sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TfrmQuery.FormShow(Sender: TObject);
var i:Integer;
begin
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['出仓单号','本厂编号','客户型号','申请人','审核人','客户','出仓类型','状态']);
  v_Field_List_EN := VarArrayOf(['data0415.number','dbo.data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','Data0005.EMPL_CODE','Data0005_1.EMPL_CODE','Data0010.CUST_CODE','data0415.type','data0415.status']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iIndex=0) then
  begin
    ListBox3.ItemIndex := 3;
  end else ListBox3.ItemIndex:=iIndex;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
end;

procedure TfrmQuery.FormCreate(Sender: TObject);
begin
  iIndex:=0;
end;

end.
