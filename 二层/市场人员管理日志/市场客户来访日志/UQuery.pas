unit UQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Buttons, StdCtrls, Grids;

type
  TQuery_Form = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    BitBtn7: TBitBtn;
    DateTimePicker3: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
  v_Field_List_CN,v_Field_List_EN:Variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Query_Form: TQuery_Form;

implementation

uses common,UDM,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TQuery_Form.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'user_login_name/员工代码/200,user_full_NAME/员工姓名/200';
    InputVar.Sqlstr := 'select user_login_name,user_full_NAME from data0073 order by 1';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['user_login_name'];
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;
procedure TQuery_Form.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['来访日期','日志单号','客户名称', '来访人员','接待人员',
  '业务员代码','状态']);
  v_Field_List_EN := VarArrayOf(['data0722.VistDate','data0722.LogNo','data0722.CustName' ,'data0722.visitors','data0722.visitedMan','data0073.user_login_name','data0722.status']);

  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-15; DateTimePicker2.Date:=date; DateTimePicker3.Date:=date;
end;

procedure TQuery_Form.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TQuery_Form.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TQuery_Form.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  DateTimePicker3.Visible:=listbox3.ItemIndex in [0] ;
  BitBtn7.Visible:=listbox3.ItemIndex=5 ;
  edtValue.Visible :=not (listbox3.ItemIndex in [0,6]) ;
  GroupBox1.Visible:=listbox3.ItemIndex=6;
  edtValue.Text:='';

end;

procedure TQuery_Form.Button3Click(Sender: TObject);
var
 i:byte;
 s:string;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex=6 then
  begin
    s:='';
    if CheckBox1.Checked then s:='0';
    if CheckBox2.Checked then begin if s='' then s:='1' else s:=s+',1'; end;
    if CheckBox3.Checked then begin if s='' then s:='2' else s:=s+',2'; end;
     if s='' then exit;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=s;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s+') ';
  end else if listbox3.itemindex in [0] then
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:='>='+datetostr(DateTimePicker3.Date);
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'>='''+datetostr(DateTimePicker3.Date)+'''';
  end else begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TQuery_Form.N1Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

end.
