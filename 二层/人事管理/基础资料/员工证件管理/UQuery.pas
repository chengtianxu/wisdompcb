unit UQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, DBCtrlsEh, ComCtrls,
  Grids,DB, ADODB, Menus;

type
  TQuery_Form = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
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
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
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
    procedure ComboBox2Change(Sender: TObject);
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

uses dmo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TQuery_Form.FormShow(Sender: TObject);
var i:integer;
begin
  ListBox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['证书编号','员工姓名','失效日期','证书名称', '证书状态','部门','员工入职日期']);
  v_Field_List_EN := VarArrayOf(['Hrcertificate.code','Hrcertificate.employeeid','Hrcertificate.enddate',
                                 'Hrcertificate.datadetail_ptr' ,'Hrcertificate.status','v_employeemsg.departmentid','v_employeemsg.ondutytime']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  ComboBox2.Items.Clear;
  ComboBox1.Items.Clear;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT rkey,dictid,item FROM datadetail WHERE dictid in (select rkey from datadict where item=''证书名称'') '+#13;
    Open;
    First;
    while not Eof do
    begin
      ComboBox2.Items.Add(FieldByName('item').AsString);
      ComboBox1.Items.Add(FieldByName('rkey').AsString);
      Next;
    end;
  end;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select getdate() as sys_date';
    Open;
    DateTimePicker2.DateTime := StrToDateTime(fieldvalues['sys_date']);
  end;
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
    if (sgrid1.Cells[0,i]=listbox3.Items[listbox3.ItemIndex]) and (sgrid1.Cells[1,i]<>listbox3.Items[listbox3.ItemIndex]) then
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
        0:sgrid1.Cells[2,sgrid_row]:='and D.code = '''+edtValue.Text+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and D.code like ''%'+edtValue.Text+'%''';
      end;
    end;
    1:
    begin
      sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and D.employeeid = '''+inttostr(edtValue.tag)+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.chinesename like ''%'+edtValue.Text+'%''';
      end;
    end;
    2:
    begin
      sgrid1.Cells[1,sgrid_row]:=DateToStr(DateTimePicker2.Date);
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and D.enddate = '''+datetostr(DateTimePicker2.Date)+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and D.enddate > '''+datetostr(DateTimePicker2.Date)+'''';
        2:sgrid1.Cells[2,sgrid_row]:='and D.enddate < '''+datetostr(DateTimePicker2.Date)+'''';
        3:sgrid1.Cells[2,sgrid_row]:='and D.enddate like ''%'+datetostr(DateTimePicker2.Date)+'%''';
      end;
    end;
    3:
    begin
      sgrid1.Cells[1,sgrid_row]:=trim(ComboBox2.Text);
      sgrid1.Cells[2,sgrid_row]:='and datadetail.item = '''+Self.ComboBox2.Text+'''';
    end;
    4:
    begin
      sgrid1.Cells[1,sgrid_row]:= RadioGroup2.Items[RadioGroup2.ItemIndex];
      sgrid1.Cells[2,sgrid_row]:='and D.status = '''+inttostr(Self.RadioGroup2.ItemIndex+1)+'''';
    end;
    5:
    begin
      sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
      case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.departmentid = '''+inttostr(edtValue.tag)+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.departmentid in '+label3.Caption;
      end;
    end;
    6:
    begin
      sgrid1.Cells[1,sgrid_row]:=DateToStr(DateTimePicker2.Date);
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.ondutytime = '''+datetostr(DateTimePicker2.Date)+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.ondutytime > '''+datetostr(DateTimePicker2.Date)+'''';
        2:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.ondutytime < '''+datetostr(DateTimePicker2.Date)+'''';
        3:sgrid1.Cells[2,sgrid_row]:='and v_employeemsg.ondutytime like ''%'+datetostr(DateTimePicker2.Date)+'%''';
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
  BitBtn1.Visible := False;
  ComboBox2.Visible := False;
  DateTimePicker2.Visible := False;
  RadioGroup1.Visible := False;
  RadioGroup3.Visible := True;
  RadioGroup2.Visible := False;
  Button3.Enabled:= False;
  if ListBox3.ItemIndex = 0 then
  begin
    bitbtn1.Visible:=False;
    BitBtn2.Visible := False;
    ComboBox2.Visible:=False;
    RadioGroup3.Visible := False;
    RadioGroup1.Visible := True;
  end;
  if ListBox3.ItemIndex = 1 then
  begin
    bitbtn1.Visible:=True;
    BitBtn2.Visible := False;
    ComboBox2.Visible:=False;
    RadioGroup3.Visible := False;
    RadioGroup1.Visible := True;
  end;
  if ListBox3.ItemIndex in [2,6] then
  begin
    edtValue.Visible := False;
    BitBtn1.Visible := False;
    BitBtn2.Visible := False;
    ComboBox2.Visible := False;
    DateTimePicker2.Visible := False;
    RadioGroup1.Visible := False;
    RadioGroup3.Visible := False;
    DateTimePicker2.Visible := true;
    RadioGroup3.Visible := True;
    Button3.Enabled:= True;
  end;
  if ListBox3.ItemIndex = 3 then
  begin
    edtValue.Visible := False;
    BitBtn1.Visible := False;
    BitBtn2.Visible := False;
    ComboBox2.Visible := True;
    DateTimePicker2.Visible := False;
    RadioGroup1.Visible := False;
    RadioGroup3.Visible := False;
    Button3.Enabled:=ComboBox2.Text<>'';
  end;
  if ListBox3.ItemIndex = 4 then
  begin
    edtValue.Visible := False;
    BitBtn1.Visible := False;
    BitBtn2.Visible := False;
    ComboBox2.Visible := False;
    DateTimePicker2.Visible := False;
    RadioGroup1.Visible := False;
    RadioGroup3.Visible := False;
    RadioGroup2.Visible := True;
    Button3.Enabled:=RadioGroup2.ItemIndex<>-1;
  end;
  if ListBox3.ItemIndex = 5 then
  begin
    bitbtn2.Visible:=True;
    ComboBox2.Visible:=False;
    RadioGroup3.Visible := False;
    RadioGroup1.Visible := True;
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
    InputVar.AdoConn := DM.ADOConn;
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
end;

procedure TQuery_Form.ComboBox2Change(Sender: TObject);
begin
  Self.ComboBox1.ItemIndex := Self.ComboBox2.ItemIndex;
  Button3.Enabled:=ComboBox2.Text<>'';
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
    InputVar.AdoConn := DM.ADOConn;
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
