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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup3: TRadioGroup;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    ComboBox3: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
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
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
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

uses UDM,common,Pick_Item_Single,ConstVar, UQueDep;

{$R *.dfm}

procedure TQuery_Form.FormShow(Sender: TObject);
var i:integer;
    QueryTmp:TADOQuery;
begin
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['员工编号','员工姓名', '性别',
   '身份证号码','民族', '考勤卡号码','出生年月','到职日期','离职日期','婚姻状况' ,'部门',
   '职务','职级','政治面貌','文化程度','合同类型','联系电话', '宿舍编号', '是否离职', '出生月份']);
  v_Field_List_EN := VarArrayOf(['employeemsg.employeecode','employeemsg.chinesename',
  'employeemsg.sex','employeemsg.IDCard' ,'employeemsg.nation','employeemsg.Cardno','employeemsg.birthday','employeemsg.ondutytime','employeemsg.outdutytime',
  'employeemsg.marriage','employeemsg.departmentid','dbo.employeemsg.Position','dbo.employeemsg.Rank','employeemsg.Politics_face','employeemsg.education','employeemsg.employ_type'
  ,'employeemsg.phone','employeemsg.roomcode', 'status', 'month(birthday)']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  sgrid1.ColWidths[2]:= -1;
  ListBox3.ItemIndex := 0;
  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  with QueryTmp do
  begin
        close;
        SQL.Clear;
        sql.Text:='select getdate() as sys_date';
        open;
        DateTimePicker1.DateTime :=  StrToDateTime(fieldvalues['sys_date']);
        DateTimePicker2.DateTime :=  StrToDateTime(fieldvalues['sys_date']);
  end;
    QueryTmp.Free;
  ListBox3Click(nil);
end;

procedure TQuery_Form.Button4Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
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
                  0:sgrid1.Cells[2,sgrid_row]:='and employeemsg.employeecode = '''+edtValue.Text+'''';
                  1:sgrid1.Cells[2,sgrid_row]:='and employeemsg.employeecode like ''%'+edtValue.Text+'%''';
                end;
           end;
         1:
          begin
                 sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
                case radiogroup1.ItemIndex of
                    0:sgrid1.Cells[2,sgrid_row]:='and employeemsg.chinesename = '''+edtValue.Text+'''';
                    1:sgrid1.Cells[2,sgrid_row]:='and employeemsg.chinesename like ''%'+edtValue.Text+'%''';
                end;
          end;
          2:
          begin
                 sgrid1.Cells[1,sgrid_row]:=RadioGroup2.Items[RadioGroup2.ItemIndex];
                 sgrid1.Cells[2,sgrid_row]:='and employeemsg.sex = '''+inttostr(RadioGroup2.ItemIndex)+'''';
          end;
          3:
          begin
                sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
                case radiogroup3.ItemIndex of
                    0:sgrid1.Cells[2,sgrid_row]:='and employeemsg.IDCard = '''+edtValue.Text+'''';
                    1:sgrid1.Cells[2,sgrid_row]:='and employeemsg.IDCard > '''+edtValue.Text+'''';
                    2:sgrid1.Cells[2,sgrid_row]:='and employeemsg.IDCard < '''+edtValue.Text+'''';
                    3:sgrid1.Cells[2,sgrid_row]:='and employeemsg.IDCard like ''%'+edtValue.Text+'%''';
                end;
          end;
          4:
          begin
                sgrid1.Cells[1,sgrid_row]:=ComboBox3.Text;
                sgrid1.Cells[2,sgrid_row]:='and employeemsg.nation = '''+ComboBox3.Text+'''';
          end;
          5:
          begin
                sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
                case radiogroup3.ItemIndex of
                    0:sgrid1.Cells[2,sgrid_row]:='and employeemsg.Cardno = '''+edtValue.Text+'''';
                    1:sgrid1.Cells[2,sgrid_row]:='and employeemsg.Cardno > '''+edtValue.Text+'''';
                    2:sgrid1.Cells[2,sgrid_row]:='and employeemsg.Cardno < '''+edtValue.Text+'''';
                    3:sgrid1.Cells[2,sgrid_row]:='and employeemsg.Cardno like ''%'+edtValue.Text+'%''';
                end;
          end;
          6:
          begin
                sgrid1.Cells[1,sgrid_row]:='从 '+datetostr(DateTimePicker1.Date)+' 到 '+datetostr(DateTimePicker2.Date);
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.birthday >= '''+datetostr(DateTimePicker1.Date)+''' and employeemsg.birthday <= '''+datetostr(DateTimePicker2.Date)+'''';
          end;
          7:
          begin
                sgrid1.Cells[1,sgrid_row]:='从 '+datetostr(DateTimePicker1.Date)+' 到 '+datetostr(DateTimePicker2.Date);
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.ondutytime >= '''+datetostr(DateTimePicker1.Date)+''' and employeemsg.ondutytime <= '''+datetostr(DateTimePicker2.Date)+'''';
          end;
          8:
          begin
                sgrid1.Cells[1,sgrid_row]:='从 '+datetostr(DateTimePicker1.Date)+' 到 '+datetostr(DateTimePicker2.Date);
                sgrid1.Cells[2,sgrid_row]:=sgrid1.Cells[2,sgrid_row] + 'and employeemsg.outdutytime >= '''+datetostr(DateTimePicker1.Date)+''' and employeemsg.outdutytime <= '''+datetostr(DateTimePicker2.Date)+'''';
          end;
          9:
          begin
                sgrid1.Cells[1,sgrid_row]:= ComboBox1.Text;
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.marriage = '+inttostr(Integer(ComboBox1.Items.Objects[ComboBox1.itemindex]));
          end;
          10:
          begin
                sgrid1.Cells[1,sgrid_row]:= edtValue.Text;
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.departmentid = '+inttostr(edtValue.Tag);
          end;
          11:
          begin
                sgrid1.Cells[1,sgrid_row]:= ComboBox1.Text;
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.Position = '+inttostr(Integer(ComboBox1.Items.Objects[ComboBox1.itemindex]));
          end;
          12:
          begin
                sgrid1.Cells[1,sgrid_row]:= ComboBox1.Text;
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.Rank = '+inttostr(Integer(ComboBox1.Items.Objects[ComboBox1.itemindex]));
          end;
          13:
          begin
                sgrid1.Cells[1,sgrid_row]:= ComboBox1.Text;
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.Politics_face = '+ inttostr(Integer(ComboBox1.Items.Objects[ComboBox1.itemindex]));
          end;
          14:
          begin
                sgrid1.Cells[1,sgrid_row]:= ComboBox1.Text;
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.education = '+ inttostr(Integer(ComboBox1.Items.Objects[ComboBox1.itemindex]));
          end;
          15:
          begin
                sgrid1.Cells[1,sgrid_row]:= ComboBox1.Text;
                sgrid1.Cells[2,sgrid_row]:= 'and employeemsg.employ_type = '+ inttostr(Integer(ComboBox1.Items.Objects[ComboBox1.itemindex]));
          end;
          16:
          begin
                sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
                case radiogroup3.ItemIndex of
                    0:sgrid1.Cells[2,sgrid_row]:='and employeemsg.phone = '''+edtValue.Text+'''';
                    1:sgrid1.Cells[2,sgrid_row]:='and employeemsg.phone > '''+edtValue.Text+'''';
                    2:sgrid1.Cells[2,sgrid_row]:='and employeemsg.phone < '''+edtValue.Text+'''';
                    3:sgrid1.Cells[2,sgrid_row]:='and employeemsg.phone like ''%'+edtValue.Text+'%''';
                end;
          end;
          17:
          begin
                sgrid1.Cells[1,sgrid_row]:=trim(edtValue.Text);
                case radiogroup1.ItemIndex of
                    0:sgrid1.Cells[2,sgrid_row]:='and employeemsg.roomcode = '''+edtValue.Text+'''';
                    1:sgrid1.Cells[2,sgrid_row]:='and employeemsg.roomcode like ''%'+edtValue.Text+'%''';
                end;
          end;
          18:
          begin
                sgrid1.Cells[1,sgrid_row]:= ComboBox1.Text;
                if ComboBox1.Text = '是' then
                sgrid1.Cells[2,sgrid_row]:= ' and employeemsg.status = 2 ';
                if ComboBox1.Text = '否' then
                 sgrid1.Cells[2,sgrid_row]:= ' and employeemsg.status = 1 ';

          end;
          19:
          begin
                sgrid1.Cells[1,sgrid_row]:=trim(ComboBox1.Text);
                case radiogroup1.ItemIndex of
                  0:sgrid1.Cells[2,sgrid_row]:='and month(birthday) = '''+ComboBox1.Text+'''';
                end;
          end;
    end;
end;

procedure TQuery_Form.Button3Click(Sender: TObject);
begin
 update_sgrid;
end;

procedure TQuery_Form.ListBox3Click(Sender: TObject);
var
    QueryTmp:TADOQuery;
    i: Integer;
begin
      label8.Caption:=' '+listbox3.Items[listbox3.itemindex]+':  ';
      edtValue.Text:='';
      edtValue.Visible := False;
      BitBtn1.Visible := False;
      BitBtn2.Visible := False;
      RadioGroup1.Visible := False;
      RadioGroup2.Visible := False;
      RadioGroup3.Visible := False;
      ComboBox3.Visible := False;
      label1.Visible := False;
      label2.Visible := False;
      DateTimePicker1.Visible := False;
      DateTimePicker2.Visible := False;
      ComboBox1.Visible := False;
      Button3.Enabled := False;
      edtValue.OnKeyPress := nil;

  if ListBox3.ItemIndex in [0, 1] then
  begin
      edtValue.Visible := True;
      BitBtn1.Visible := True;
      RadioGroup1.Visible := True;
  end;
  if ListBox3.ItemIndex = 2 then
  begin
      RadioGroup2.Visible := True;
  end;
  if ListBox3.ItemIndex in [3,5] then
  begin
      edtValue.Visible := True;
      RadioGroup3.Visible := True;
      edtValue.OnKeyPress := Self.edtValueKeyPress;
  end;
  if ListBox3.ItemIndex = 4 then
  begin
        ComboBox3.Visible := True;
  end;
  if ListBox3.ItemIndex in [6,7,8] then
  begin
      label1.Visible := True;
      label2.Visible := True;;
      DateTimePicker1.Visible := True;
      DateTimePicker2.Visible := True;
      Button3.Enabled := True;
  end;
  if ListBox3.ItemIndex = 9 then
  begin
        QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOConnection1;
        ComboBox1.Items.Clear;
            with QueryTmp do
            begin
                Close;
                SQL.Clear;
                SQL.Text:='SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 11 '+#13;
                Open;
                first;
                while not Eof do
                begin
                      ComboBox1.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
                      Next;
                end;
            end;
        QueryTmp.Free;
        ComboBox1.Visible := True;
  end;
  if ListBox3.ItemIndex = 10 then
  begin
      edtValue.Visible := True;
      BitBtn2.Visible := True;
  end;
  if ListBox3.ItemIndex = 11 then
  begin
      QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOConnection1;
            with QueryTmp do
            begin
              ComboBox1.Items.Clear;
                Close;
                SQL.Clear;
                SQL.Text:='SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 1 '+#13;
                Open;
                first;
                while not Eof do
                begin
                      ComboBox1.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
                      Next;
                end;
            end;
        QueryTmp.Free;
        ComboBox1.Visible := True;
  end;
  if ListBox3.ItemIndex = 12 then
  begin
      QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOConnection1;
            with QueryTmp do
            begin
              ComboBox1.Items.Clear;
                Close;
                SQL.Clear;
                SQL.Text:= 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 2 '+#13;
                Open;
                first;
                while not Eof do
                begin
                      ComboBox1.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
                      Next;
                end;
            end;
        QueryTmp.Free;
        ComboBox1.Visible := True;
  end;
  
  if ListBox3.ItemIndex = 13 then
  begin
      QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOConnection1;
            with QueryTmp do
            begin
              ComboBox1.Items.Clear;
                Close;
                SQL.Clear;
                SQL.Text:= 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 4 '+#13;
                Open;
                first;
                while not Eof do
                begin
                      ComboBox1.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
                      Next;
                end;
            end;
        QueryTmp.Free;
        ComboBox1.Visible := True;
  end;
    if ListBox3.ItemIndex = 14 then
  begin
      QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOConnection1;
            with QueryTmp do
            begin
              ComboBox1.Items.Clear;
                Close;
                SQL.Clear;
                SQL.Text:= 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 3 '+#13;
                Open;
                first;
                while not Eof do
                begin
                      ComboBox1.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
                      Next;
                end;
            end;
        QueryTmp.Free;
        ComboBox1.Visible := True;
  end;
  if ListBox3.ItemIndex = 15 then
  begin
      QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOConnection1;
            with QueryTmp do
            begin
              ComboBox1.Items.Clear;
                Close;
                SQL.Clear;
                SQL.Text:= 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 5 '+#13;
                Open;
                first;
                while not Eof do
                begin
                      ComboBox1.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
                      Next;
                end;
            end;
        QueryTmp.Free;
        ComboBox1.Visible := True;
  end;
  if ListBox3.ItemIndex = 16 then
  begin
      edtValue.Visible := True;
      RadioGroup3.Visible := True;
  end;
  if ListBox3.ItemIndex = 17 then
  begin
      edtValue.Visible := True;
      RadioGroup1.Visible := True;
  end;
  if ListBox3.ItemIndex = 18 then
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Items.Add('是');
    ComboBox1.Items.Add('否');
    ComboBox1.Visible := True;
  end;
  if ListBox3.ItemIndex = 19 then
  begin
    ComboBox1.Items.Clear;
    for i := 1 to 12 do
    begin
      ComboBox1.Items.Add(IntToStr(i));
    end;
    ComboBox1.Visible := True;
  end;
end;

procedure TQuery_Form.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
      InputVar.Fields := 'employeecode/员工编号/200,chinesename/员工姓名/200';
      InputVar.Sqlstr :='select  rkey, chinesename, employeecode from dbo.employeemsg ';
      inputvar.KeyField:='chinesename';
      InputVar.AdoConn := DM.ADOConnection1;
      frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtValue.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      if  ListBox3.ItemIndex = 0  then
          edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['employeecode'];
      if  ListBox3.ItemIndex = 1  then
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
 { Self.ComboBox1.ItemIndex := Self.ComboBox2.ItemIndex;
  Button3.Enabled:=ComboBox2.Text<>'';     }

end;

procedure TQuery_Form.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

procedure TQuery_Form.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  QueDep_Form:=TQueDep_Form.Create(application);
  if Self.edtValue.Text <> '' then
    QueDep_Form.dep_name := Self.edtValue.Text;
   if (QueDep_Form.ShowModal=mrok)   then
   begin
       Self.edtValue.Tag :=  QueDep_Form.dep_rkey;
       Self.edtValue.Text :=  QueDep_Form.dep_name;
   end;
end;

procedure TQuery_Form.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TQuery_Form.ComboBox3Change(Sender: TObject);
begin
       Button3.Enabled:= ComboBox3.Text<>'';
end;

procedure TQuery_Form.ComboBox1Change(Sender: TObject);
begin
       Button3.Enabled:= ComboBox1.Text<>'';
end;

procedure TQuery_Form.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
      if not  (key in [ '0'..'9'])   then
        key:=char(0);
end;

end.
