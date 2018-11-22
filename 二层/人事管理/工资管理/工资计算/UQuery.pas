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
    procedure RadioGroup3Click(Sender: TObject);
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
  v_Field_List_CN := VarArrayOf(['类型',
  '部门','职务','姓名','入职日期','离职日期',
   '变值锁定','审核','是否在职']);
  v_Field_List_EN := VarArrayOf(['d.item',
  'b.departmentid',
  'e.item','b.chinesename','b.ondutytime',
  'b.outdutytime','a.can_change_flag','a.ischecked','b.status']);
  for i:= VarArrayLowBound(v_Field_List_CN,1)
  to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
   Self.ComboBox2.Items.Clear;
   Self.ComboBox1.Items.Clear;
    with DM.ADOTMP do
    begin
          Close;
          SQL.Clear;
          SQL.Text:='SELECT   rkey, dictid, item '+
           ' FROM  dbo.datadetail WHERE dictid = 2 '+#13;
          Open;
          first;
          while not Eof do
          begin
                ComboBox2.Items.Add(FieldByName('item').AsString);
                ComboBox1.Items.Add(FieldByName('rkey').AsString);
                Next;
          end;
    end;
    with dm.ADOTMP do
    begin
        close;
        SQL.Clear;
        sql.Text:='select getdate() as sys_date';
        open;
        DateTimePicker2.DateTime :=  StrToDateTime(fieldvalues['sys_date']);
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
 0:    //类型
  begin
        sgrid1.Cells[1,sgrid_row]:=trim(ComboBox2.Text);
        case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and d.item = '''+trim(ComboBox2.Text)+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and d.item like ''%'+trim(ComboBox2.Text)+'%''';
        end;
   end;
 1:   //部门
  begin
        sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
        case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and b.departmentid = '''+inttostr(edtValue.tag)+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and b.departmentid in '+label3.Caption;
        end;
  end;

  2:  //职务
   begin
        sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
        case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and e.item = '''+edtValue.Text+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and e.item like ''%'+edtValue.Text+'%''';
        end;
    end;
 3:  //工号姓名
  begin
        sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
        case radiogroup1.ItemIndex of
        0:sgrid1.Cells[2,sgrid_row]:='and b.chinesename = '''+edtValue.Text+'''';
        1:sgrid1.Cells[2,sgrid_row]:='and b.chinesename like ''%'+edtValue.Text+'%''';
        end;
    end;
 4:  //入职日期
 begin
      if radiogroup3.ItemIndex = 3 then
      sgrid1.Cells[1,sgrid_row]:='从'+DateToStr(dtpk1.Date)+'到'+DateToStr(dtpk2.Date)
      else
      sgrid1.Cells[1,sgrid_row]:=radiogroup3.Items.Strings[radiogroup3.ItemIndex]+DateToStr(DateTimePicker2.Date);
      case radiogroup3.ItemIndex of
      0:sgrid1.Cells[2,sgrid_row]:='and replace(convert(char(10),b.ondutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  = '''+datetostr(DateTimePicker2.Date)+'''';
      1:sgrid1.Cells[2,sgrid_row]:='and replace(convert(char(10),b.ondutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  > '''+datetostr(DateTimePicker2.Date)+'''';
      2:sgrid1.Cells[2,sgrid_row]:='and replace(convert(char(10),b.ondutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  < '''+datetostr(DateTimePicker2.Date)+'''';
      3:sgrid1.Cells[2,sgrid_row]:='and replace(convert(char(10),b.ondutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  between '''+datetostr(dtpk1.Date)+' and '''+datetostr(dtpk2.Date)+'''';
      end;
    end;
 5:  //离职日期
 begin
      if radiogroup3.ItemIndex = 3 then
      sgrid1.Cells[1,sgrid_row]:='从'+DateToStr(dtpk1.Date)+'到'+DateToStr(dtpk2.Date)
      else
      sgrid1.Cells[1,sgrid_row]:=radiogroup3.Items.Strings[radiogroup3.ItemIndex]+DateToStr(DateTimePicker2.Date);
      case radiogroup3.ItemIndex of
      0:sgrid1.Cells[2,sgrid_row]:='and  replace(convert(char(10),b.outdutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  = '''+datetostr(DateTimePicker2.Date)+'''';
      1:sgrid1.Cells[2,sgrid_row]:='and replace(convert(char(10),b.outdutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  > '''+datetostr(DateTimePicker2.Date)+'''';
      2:sgrid1.Cells[2,sgrid_row]:='and replace(convert(char(10),b.outdutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  < '''+datetostr(DateTimePicker2.Date)+'''';
      3:sgrid1.Cells[2,sgrid_row]:='and replace(convert(char(10),b.outdutytime,111),'+#39+'/'+#39+','+#39+'-'+#39+')  between '''+datetostr(dtpk1.Date)+''''+' and '''+datetostr(dtpk2.Date)+'''';
      end;
    end;
 6: //变值锁
    begin
          sgrid1.Cells[1,sgrid_row]:= RadioGroup2.Items[RadioGroup2.ItemIndex];
          sgrid1.Cells[2,sgrid_row]:='and a.can_change_flag = '''+inttostr((Self.RadioGroup2.ItemIndex+1) mod 2)+'''';
    end;
 7: //审核锁
    begin
          sgrid1.Cells[1,sgrid_row]:= RadioGroup2.Items[RadioGroup2.ItemIndex];
          sgrid1.Cells[2,sgrid_row]:='and a.ischecked = '''+inttostr((Self.RadioGroup2.ItemIndex+1) mod 2)+'''';
    end;
 8: //是否在职
    begin
          sgrid1.Cells[1,sgrid_row]:= RadioGroup2.Items[RadioGroup2.ItemIndex];
          sgrid1.Cells[2,sgrid_row]:='and b.status = '''+inttostr(Self.RadioGroup2.ItemIndex+1)+'''';
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
  if ListBox3.ItemIndex = 0 then   //类型//
  begin
        edtValue.Visible := False;
        BitBtn1.Visible := False;
        BitBtn2.Visible := False;
        ComboBox2.Visible := True;
        DateTimePicker2.Visible := False;
        RadioGroup1.Visible := False;
        RadioGroup3.Visible := False;
        Button3.Enabled:=ComboBox2.Text<>'';
        dtpk1.Visible := false;
        dtpk2.Visible := false;
        label1.Visible := false;
        label2.Visible := false;
  end;
  if ListBox3.ItemIndex in  [1] then
  begin
      bitbtn2.Visible:=True;
      ComboBox2.Visible:=False;
      RadioGroup3.Visible := False;
      RadioGroup1.Visible := True;
      dtpk1.Visible := false;
      dtpk2.Visible := false;
      label1.Visible := false;
      label2.Visible := false;
  end;
    if ListBox3.ItemIndex in  [2,3] then
  begin
      bitbtn1.Visible:=True;
      BitBtn2.Visible := False;
      ComboBox2.Visible:=False;
      RadioGroup3.Visible := False;
      RadioGroup1.Visible := True;
      dtpk1.Visible := false;
      dtpk2.Visible := false;
      label1.Visible := false;
      label2.Visible := false;
  end; 
  if ListBox3.ItemIndex in [4,5] then
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
        dtpk1.Visible := true;
        dtpk2.Visible := true;
        label1.Visible := true;
        label2.Visible := true;
  end;
  if ListBox3.ItemIndex in [6,7,8] then
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
end;

procedure TQuery_Form.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
      if ListBox3.ItemIndex = 2  then
      begin
        InputVar.Fields := 'item/职务/400';
        InputVar.Sqlstr :='select  rkey, item from dbo.datadetail where dictid=1 ';
        inputvar.KeyField:='item';
      end
      else
      begin
        InputVar.Fields := 'chinesename/员工姓名/200,employeecode/员工工号/200';
        InputVar.Sqlstr :='select  rkey, chinesename, employeecode from dbo.employeemsg ';
        inputvar.KeyField:='chinesename';
      end; 
      InputVar.AdoConn := DM.ADOConnection1;
      frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin  
      edtValue.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      if ListBox3.ItemIndex = 2  then
      edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['item']
      else
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
      InputVar.AdoConn := DM.ADOConnection1;
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

procedure TQuery_Form.RadioGroup3Click(Sender: TObject);
begin
case radiogroup3.ItemIndex of
0,1,2:
  begin
   dtpk1.Visible := false;
   dtpk2.Visible := false;
   label1.Visible := false;
   label2.Visible := false;
   datetimepicker2.Visible := true;
  end;
3:
  begin
   dtpk1.Visible := true;
   dtpk2.Visible := true;
   label1.Visible := true;
   label2.Visible := true;
   datetimepicker2.Visible := false;
  end;
end;
end;

end.
