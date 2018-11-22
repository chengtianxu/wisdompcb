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
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn7: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    rgtype: TRadioGroup;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;
     procedure update_sgrid(sgrid_row:byte);
  public
    { Public declarations }
  end;

var Frm_QrySet:TFrm_QrySet;
implementation

uses common,DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_QrySet.update_sgrid(sgrid_row: byte);
var
  s:string;
begin


 case   ListBox3.ItemIndex of
  0,1:
  begin
     sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
    if  rgType.ItemIndex = 0 then
    begin
      sgrid1.Cells[1,sgrid_row]:=' like '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''%'+edtValue.Text+'%'''
    end
     else
     begin
      sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
      sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''' ;
    end;
  end;

  2:
  begin
     sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
     sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
     sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''' ;
  end;

  3:
  begin
    s:='';
    if CheckBox1.Checked then
    s:='0';
    if CheckBox2.Checked then
    begin
    if s='' then s:='1' else s:=s+',1';
    end;
    if CheckBox3.Checked then
    begin
     if s='' then s:='2' else s:=s+',2';
    end;
    if s='' then Abort;
    sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid_row]:=s;
    sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in ('+s+') ';
  end;

  4:
  begin
    sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid_row]:=' = '+edtValue.Text;
    sgrid1.Cells[2,sgrid_row]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in'+
     '(select AUTH_GROUP_PTR from data0275 where USER_PTR='+inttostr(edtValue.Tag)+' )';
  end;
 end;
end;

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
   for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
     update_sgrid(i);
     exit;
   end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [2,4] ;
  edtValue.Visible := listbox3.ItemIndex<>3 ;
  GroupBox1.Visible:= not edtValue.Visible;
  rgtype.Visible :=ListBox3.ItemIndex in [0,1];
  edtValue.Text:='';
  edtValue.ReadOnly := listbox3.ItemIndex in [2,4];
  Button3.Enabled:= listbox3.ItemIndex=3;
end;

procedure TFrm_QrySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
  if SGrid1.Row =SGrid1.RowCount-1 then
    SGrid1.Row :=1;      //如果删除的是最后一行，则选中第一行
end;

procedure TFrm_QrySet.ComboBox1Change(Sender: TObject);
begin
  Button3.Enabled:=true;
end;

procedure TFrm_QrySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QrySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['审批代码','说明','部门代码','审批类别','人员代码']);
  v_Field_List_EN := VarArrayOf(['data0094.code','data0094.PURCHASE_APPROV_DESC','data0034.dept_code','data0094.type','Data0094.RKEY']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 case Self.ListBox3.ItemIndex of
 2:
  begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/150';
    InputVar.Sqlstr :='select rkey,dept_code,dept_name,case when ttype=4 then ''部门'' when ttype=5 then ''班组'' else ''工序'' end xz from data0034 where ttype in (4,5) or is_cost_dept=1';
    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['Dept_CODE'] ;
      Button3.Enabled := true ;
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
 4:
  begin
   frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
   try
    InputVar.Fields := 'USER_LOGIN_NAME/人员代码/120,USER_FULL_NAME/人员名称/250';
    InputVar.Sqlstr := 'select rKey,USER_LOGIN_NAME,USER_FULL_NAME from data0073  ORDER by USER_LOGIN_NAME';
    inputvar.KeyField:='USER_LOGIN_NAME';
    InputVar.AdoConn := dm.ADOCon ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
     begin
       edtValue.Text:=frmPick_Item_Single.adsPick.fieldbyname('USER_LOGIN_NAME').AsString;
       edtValue.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
     end;
   finally
    frmPick_Item_Single.Free;
   end;
  end;
 end;
end;

procedure TFrm_QrySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
    Button3Click(sender);
end;


end.
