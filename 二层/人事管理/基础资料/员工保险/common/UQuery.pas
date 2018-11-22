unit UQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, DBCtrlsEh, ComCtrls,
  Grids,DB, ADODB, Menus;

type
  TQuery_Form = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
      v_Field_List_CN,v_Field_List_EN:Variant;
      procedure update_sgrid;
      procedure update2_sgrid(sgrid_row: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Query_Form: TQuery_Form;

implementation


uses damo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TQuery_Form.FormShow(Sender: TObject);
var i:integer;
begin
 listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['员工姓名','员工状态','部门']);
  v_Field_List_EN := VarArrayOf(['employeecode','v_employeemsg.status','v_employeemsg.departmentid']);
  for i:= VarArrayLowBound(v_Field_List_CN,1)
  to VarArrayHighBound(v_Field_List_CN,1)
  do listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  ListBox3Click(nil);
end;

procedure TQuery_Form.Button4Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TQuery_Form.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TQuery_Form.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
     if (sgrid1.Cells[0,i]=listbox3.Items[listbox3.ItemIndex]) and
        (sgrid1.Cells[1,i]<>listbox3.Items[listbox3.ItemIndex]) then
         begin
             update2_sgrid(i);
             exit;
         end;
  //更新0列记录
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure  TQuery_Form.update2_sgrid(sgrid_row: integer);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  case listbox3.ItemIndex of
 0:
  begin
         sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
        case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and employeeid = '''+inttostr(edtValue.tag)+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.chinesename like ''%'+edtValue.Text+'%''';
        end;
  end;

  1: begin
         sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
        case radiogroup2.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.status = 1 ';
        1:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.status = 2 ';
        end;

    end;

  2: begin
        sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
        case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.departmentid ='+inttostr(edtValue.tag)+' ';
        1:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.departmentid in '+label3.Caption;
        end;
    end;
 end;  //end case
end;

procedure TQuery_Form.Button3Click(Sender: TObject);
begin
 update_sgrid;
end;

procedure TQuery_Form.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=' '+listbox3.Items[listbox3.itemindex]+':  ';
  edtValue.Text:='';
  edtValue.Visible := true;
  radiogroup1.Visible := False;
  radiogroup2.Visible := False;
  bitbtn2.Visible := False;
  bitbtn1.Visible := False;
  if ListBox3.ItemIndex = 0 then
  begin
  radiogroup1.Visible := true;
  radiogroup2.Visible := False;
  bitbtn2.Visible := False;
  bitbtn1.Visible := True;
  end;
  if ListBox3.ItemIndex = 1 then
  begin
  radiogroup1.Visible := False;
  radiogroup2.Visible := true;
  bitbtn2.Visible := False;
  bitbtn1.Visible := False;
  end;
  if ListBox3.ItemIndex = 2 then
  begin
  radiogroup1.Visible := true;
  radiogroup2.Visible := False;
  bitbtn2.Visible := true;
  bitbtn1.Visible := False;
  end;
end;

procedure TQuery_Form.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
      InputVar.Fields := 'chinesename/员工姓名/200,employeecode/员工编号/200';
      InputVar.Sqlstr :='select  rkey, chinesename, employeecode from dbo.employeemsg ';
      inputvar.KeyField:='chinesename';
      InputVar.AdoConn := dm.con1;
      frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['chinesename'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TQuery_Form.RadioGroup2Click(Sender: TObject);
begin
  Button3.Enabled:=RadioGroup2.ItemIndex<>-1;
      case radiogroup2.ItemIndex of
        0:edtValue.Text:= '在职';
        1:edtValue.Text:= '离职';
        end;
end;


procedure TQuery_Form.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

procedure TQuery_Form.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
      InputVar.Fields := 'departmentname/部门/400';
      InputVar.Sqlstr :='select  rkey,departmentname, dbo.get_departments(rkey)as departmentstring  from datadepartment';
      inputvar.KeyField:='部门';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
      label3.Caption := frmPick_Item_Single.adsPick.FieldValues['departmentstring'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
