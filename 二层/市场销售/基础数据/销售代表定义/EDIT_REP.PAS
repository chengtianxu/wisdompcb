unit edit_rep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ComCtrls, ExtCtrls, Grids,
  ValEdit, DB, ADODB, Menus, ImgList;


type
  TForm2 = class(TForm)
    HeaderControl1: THeaderControl;
    StatusBar1: TStatusBar;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label5: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Editor1: TValueListEditor;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    Edit2: TEdit;
    Label3: TLabel;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery2RKEY: TAutoIncField;
    ADOQuery2FILE_POINTER: TIntegerField;
    ADOQuery2SOURCE_TYPE: TSmallintField;
    ADOQuery2NOTE_PAD_LINE_1: TStringField;
    ADOQuery2NOTE_PAD_LINE_2: TStringField;
    ADOQuery2NOTE_PAD_LINE_3: TStringField;
    ADOQuery2NOTE_PAD_LINE_4: TStringField;
    ADOQuery2memo_text: TMemoField;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Editor1KeyPress(Sender: TObject; var Key: Char);
    procedure Editor1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Editor1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Editor1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  v_row:byte;
  v_edit:boolean;

implementation
uses main, curr_search, note, employee_search;

{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
var
 v_message:integer;
begin
 if form1.adotable1.State=dsinsert then
  begin
   form1.adotable1.Cancel;
   v_close:=1;//正常退出
   form1.Show;
   close;
  end;
if (form1.adotable1.Modified) or (v_edit) then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
   form1.adotable1.Cancel     //no取消对当前记录的修改包括新增
  else
   if v_message=6 then     //yes对修改的记录存盘
    BitBtn1Click(Sender)
   else                    //cancel不存盘也不保存
    exit;
  end;
  v_close:=1;//正常退出
  form1.Show;
  close;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 v_edit:=false; //将是否编辑状态设为false;
 notebook1.PageIndex:=1;
 treeview1.FullExpand;
 treeview1.Items[1].Selected:=true;
 dbedit3.SetFocus;

end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
CASE NODE.SelectedIndex of
0:notebook1.PageIndex:=0;
1:notebook1.PageIndex:=1;
2:notebook1.PageIndex:=2;
//3:notebook1.PageIndex:=3;
end;
headercontrol1.Sections[1].Text:=node.Text;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
try
 curr_form:=tcurr_form.Create(application);
 curr_form.Edit1.Text:=edit1.Text;
 if curr_form.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
   edit1.SetFocus;
  end
 else
  if curr_form.ShowModal=mrok then
   begin
    edit1.Text:=curr_form.ADOQuery1.FieldValues['curr_code'];
    edit1.font.Color:=clwindowtext;
    label8.Caption:=curr_form.ADOQuery1.FieldValues['curr_name'];
    form1.ADOTable1CURRENCY_PTR.Value:=curr_form.ADOQuery1.FieldValues['rkey'];
    treeview1.SetFocus;
   end
  else
   edit1.SetFocus;
finally
 curr_form.free;
end;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
   begin
    edit1.SelectAll;
    edit1.Font.Color:=clblue;
    label8.Caption:='  ';
   end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 form3.Caption:='销售代表记事本:'+form1.ADOTable1SALES_REP_NAME.Value;
 form3.ShowModal;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
if trim(dbedit3.Text)='' then
 begin
  showmessage('销售代表编号不能为空!且唯一');
  notebook1.PageIndex:=1;
  dbedit3.SetFocus;
  exit;
 end;
if trim(dbedit4.Text)='' then
 begin
  showmessage('销售代表姓名不能为空!');
  notebook1.PageIndex:=1;
  dbedit4.SetFocus;
  exit;
 end;
if trim(edit1.Text)='' then
 begin
  showmessage('货币不能为空!');
  notebook1.PageIndex:=1;
  edit1.SetFocus;
  exit;
 end;

try
 curr_form:=tcurr_form.Create(application);
 curr_form.Edit1.Text:=edit1.Text;
 if comparetext(trim(edit1.Text),trim(curr_form.ADOQuery1.FieldByname('curr_code').AsString))<>0 then
  begin
   messagedlg('请输入正确的货币代码!',mtwarning,[mbok],0);
   edit1.SetFocus;
   exit;
  end
 else
  form1.ADOTable1CURRENCY_PTR.Value:=curr_form.ADOQuery1.FieldValues['rkey'];
 finally
  curr_form.free;       //确定货币代码是否输入正确
 end;

 for i:=1 to 4 do
  begin                //拥金范围存盘
   if (stringgrid1.Cells[1,i]<>'') and (pos('无',stringgrid1.Cells[1,i])=0) then
    form1.ADOTable1.FieldByName('volume_'+inttostr(i)).AsString:=stringgrid1.Cells[1,i]
   else
    form1.ADOTable1.FieldValues['volume_'+inttostr(i)]:=0;
  end;

for i:=1 to 5 do      //拥金结构存盘
 if (stringgrid1.Cells[2,i]<>'') then
  form1.ADOTable1.FieldByName('commission_'+inttostr(i)).AsString:=stringgrid1.Cells[2,i]
 else
  form1.ADOTable1.FieldValues['commission_'+inttostr(i)]:=0;

 for i:=1 to 12 do    //销售预测存盘
  form1.ADOTable1.FieldByName('PROJECTION_'+inttostr(i)).AsString:=editor1.Cells[1,i];

 if form1.ADOTable1.State=dsedit then  //如果编辑状态
  begin
  if (not adoquery2.IsEmpty) and (trim(form3.Memo1.Text)<>'') then
   begin //原记录有记事本
    adoquery2.Edit;
    for i:=1 to 4 do
     adoquery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=form3.Memo1.Lines[i-1];
    adoquery2.Post;
   end
  else
   if (not adoquery2.IsEmpty) and (trim(form3.Memo1.Text)='') then
    begin
     adoquery2.Delete;   //如果原记录有记事本但被删除了
     form1.ADOTable1.fieldvalues['NOTE_PAD_PTR']:=null;
    end
   else
    if (adoquery2.IsEmpty) and (trim(form3.Memo1.Text)<>'') then
     begin    //如果原记录没有记事本，但新增了记事本
      adoquery2.Append;
      adoquery2.FieldByName('file_pointer').AsString:=form1.ADOTable1.fieldbyname('rkey').AsString;
      adoquery2.Fieldvalues['source_type']:=9;
      for i:=1 to 4 do
       adoquery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=form3.Memo1.Lines[i-1];
       adoquery2.Post;
       form1.ADOTable1NOTE_PAD_PTR.Value:=adoquery2.FieldValues['rkey'];
     end;
  try
   form1.ADOTable1.Post;
  except
   notebook1.PageIndex:=1;
   dbedit3.SetFocus;
   exit;
  end;
  v_close:=1;//正常退出
  form1.Show;
  close;
 end
else   //.........................如果新增状态
 begin
  try
   form1.ADOTable1.Post;
  except
   notebook1.PageIndex:=1;
   dbedit3.SetFocus;
   exit;
  end;
  if form3.Memo1.Lines.Count>0 then
   begin
    adoquery2.Append;
    adoquery2.FieldByName('file_pointer').AsString:=form1.ADOTable1.fieldbyname('rkey').AsString;
    adoquery2.Fieldvalues['source_type']:=9;
    for i:=1 to 4 do
    adoquery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=form3.Memo1.Lines[i-1];
    adoquery2.Post;
    form1.ADOTable1.Edit;
    form1.ADOTable1NOTE_PAD_ptr.Value:=adoquery2.FieldValues['rkey'];
    form1.ADOTable1.Post;
    form3.Memo1.Clear;
    form3.Memo2.Clear;
   end;
   form1.Adotable1.Append;
   form1.Adotable1currency_ptr.Value:=1;
   form1.Adotable1tooling_flag.Value:=0;
   form1.Adotable1rush_chrg_comm_flag.Value:=0;
   for i:=1 to 12 do editor1.Cells[1,i]:='0.00';
   for i:=1 to 5 do stringgrid1.Rows[i].Clear;
   stringgrid1.Cells[0,1]:='0';
   stringgrid1.Cells[1,1]:='无限制';
   stringgrid1.Cells[2,1]:='0.00';
   notebook1.PageIndex:=1;
   treeview1.Items[1].Selected:=true;
   dbedit3.SetFocus;
  end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (trim(edit1.Text)<>'')  then
try
 curr_form:=tcurr_form.Create(application);
 curr_form.Edit1.Text:=edit1.Text;
 if comparetext(trim(edit1.Text),trim(curr_form.ADOQuery1.Fieldbyname('curr_code').AsString))=0 then
  begin
   edit1.font.Color:=clwindowtext;
   label8.Caption:=curr_form.ADOQuery1.FieldValues['curr_name'];
   form1.ADOTable1CURRENCY_PTR.Value:=curr_form.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('请输入正确的货币代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
   exit;
  end;
finally
 curr_form.free;
end;

end;

procedure TForm2.FormShow(Sender: TObject);
var
i:byte;
begin
 stringgrid1.ColWidths[0]:=105;
 stringgrid1.ColWidths[1]:=105;
 stringgrid1.ColWidths[2]:=105;
 stringgrid1.Cells[0,0]:='从容量';
 stringgrid1.Cells[0,1]:='0';
 stringgrid1.Cells[1,0]:='至容量';
 stringgrid1.Cells[2,0]:='拥金%';
 stringgrid1.Cells[2,1]:='0.00';
 for i:=1 to 4 do
  if form1.adotable1.FieldValues['volume_'+inttostr(i)]<>null then
   if form1.adotable1.FieldValues['volume_'+inttostr(i)]>0 then
    begin
     stringgrid1.Cells[1,i]:=formatfloat('0',form1.adotable1.FieldValues['volume_'+inttostr(i)]);
     stringgrid1.Cells[2,i+1]:='0.00';
     stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
     if i=4 then
      stringgrid1.Cells[1,5]:='无限制';
    end
   else
    begin
     stringgrid1.Cells[1,i]:='无限制';
     break;
    end
  else
    begin
    stringgrid1.Cells[1,i]:='无限制';
    break;
    end;
  for i:=1 to 5 do
  if form1.ADOTable1.FieldValues['commission_'+inttostr(i)]<>null then
  if form1.ADOTable1.FieldValues['commission_'+inttostr(i)]>0 then
  stringgrid1.Cells[2,i]:=formatfloat('0.00',form1.ADOTable1.FieldValues['commission_'+inttostr(i)]);

  for i:=1 to 12 do
    if form1.ADOTable1.FieldValues['PROJECTION_'+inttostr(i)]<>null then
     editor1.Cells[1,i]:=formatfloat('0.00',form1.ADOTable1.FieldValues['PROJECTION_'+inttostr(i)])
    else
     editor1.Cells[1,i]:='0.00';

 with adoquery1 do   //查找货币代码
  begin               // 如果是在新增状态，已把currency_ptr指针赋值为1
   close;
   sql.text:='select curr_code,curr_name from data0001'+#13+
             'where rkey='+form1.ADOTable1CURRENCY_PTR.AsString;
   active:=true;
   edit1.Text:=FieldValues['curr_code'];
   edit1.Font.Color:=clwindowtext;
   label8.Caption:=FieldValues['curr_name'];
  end;

if form1.ADOTable1EMPLOYEE_PTR.Value>0 then
 with adoquery1 do   //查找货币代码
  begin               // 如果是在新增状态，已把currency_ptr指针赋值为1
   close;
   sql.text:='select empl_code,employee_name from data0005'+#13+
             'where rkey='+form1.ADOTable1EMPLOYEE_PTR.AsString;
   active:=true;
   edit2.Text:=FieldValues['empl_code'];
   label4.Caption:=FieldValues['employee_name'];
  end
 else
  begin
   edit2.Text:='';
   label4.Caption:='';
  end;

 with adoquery2 do   //查找员工的记事本资料
 begin
  if active=true then
   active:=false;
   Parameters[0].Value:=form1.ADOTable1NOTE_PAD_PTR.Value;
  active:=true;
 end;

if form1.ADOTable1.State=dsedit then //如果是编辑状态
 if not adoquery2.IsEmpty then      //如果该员工有记事本
  for i:=1 to 4 do
   begin
    form3.memo1.lines.add(adoquery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
    form3.memo2.lines.add(adoquery2.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
   end;
end;

procedure TForm2.Editor1KeyPress(Sender: TObject; var Key: Char);
begin
  if editor1.Cells[1,editor1.row]<>'' then  //输入数字不能大于1000
  if (strtofloat(editor1.Cells[1,editor1.row])>=1000000) and (key <> chr(8)) then
   abort;
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',editor1.Cells[1,editor1.row])>0
    then abort;
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
     abort;
 v_edit:=true;   //将是否编辑变量成为true;
end;

procedure TForm2.Editor1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 v_row:=editor1.Row;
if editor1.Cells[1,editor1.Row]='' then
   editor1.Cells[1,editor1.Row]:='0.00';
if (key=13) or (key=38) or (key=40) or (key=33) or (key=34)  then
  editor1.Cells[1,editor1.Row]:=formatfloat('0.00',strtofloat(editor1.Cells[1,editor1.Row]))
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
 i:byte;  
begin
 if (acol=1) and (arow=5) then  //第一列五行不准编辑  没有对应字段值
  canSelect:=false;
 if stringgrid1.Col=2 then  //如果是在第二列
  begin
   if stringgrid1.Cells[2,stringgrid1.Row]<>'' then
    stringgrid1.Cells[2,stringgrid1.Row]:=formatfloat('0.00',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]))
   else
    if stringgrid1.Cells[1,stringgrid1.Row]<>'' then
     stringgrid1.Cells[2,stringgrid1.Row]:='0.00';
  end
 else      //...............如果是在第一列
  begin  // 开始....2
   if (stringgrid1.Row>1) and (stringgrid1.Cells[1,stringgrid1.Row]<>'')
       and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0)  then
   begin   //...yes                       //如果不在第一行
    IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])<strtofloat(stringgrid1.Cells[1,stringgrid1.Row-1])) then
      begin   //向上比较
       stringgrid1.Cells[1,stringgrid1.Row]:=stringgrid1.Cells[1,stringgrid1.Row-1];
       stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
       if stringgrid1.Cells[2,stringgrid1.Row+1]='' then
          stringgrid1.Cells[2,stringgrid1.Row+1]:='0.00';
       if stringgrid1.Cells[1,stringgrid1.Row+1]='' then
          stringgrid1.Cells[1,stringgrid1.Row+1]:='无限制';
      end
   else      //向下比较
    begin  //yes
     for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
      begin
       if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'')  then
        begin
         IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
          begin
           stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
          end
         else
          stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
        end
       else
        begin
         stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
         stringgrid1.Cells[1,i]:='无限制';
         if stringgrid1.Cells[2,i]='' then
          stringgrid1.Cells[2,i]:='0.00';
         break;
        end;
      end;
    end;  //yes
  end     //...yes
  else    //如果当前行在第一行  或者不在第一行,但是当前行有'无限制',或者当前行是空行
   begin  //bbbyes
    for i:=stringgrid1.Row+1 to stringgrid1.RowCount-2 do
     begin
      if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'') and (pos('无',stringgrid1.Cells[1,i-1])=0) then
       begin
        IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
         begin
          stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
          stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
         end
        else
         stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
       end;
     end;
      if (stringgrid1.row=1) and (stringgrid1.Cells[1,2]='') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
       begin
        stringgrid1.Cells[1,stringgrid1.Row+1]:='无限制';
        if stringgrid1.Cells[2,stringgrid1.Row+1]='' then
         stringgrid1.Cells[2,stringgrid1.Row+1]:='0.00';
       end;
      if (stringgrid1.Cells[1,stringgrid1.Row]<>'') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
       stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
   end; //bbbyes
  end;  // 结束....2
end;

procedure TForm2.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if stringgrid1.Col=2 then
 if stringgrid1.Cells[2,stringgrid1.row]<>'' then
 if (strtofloat(stringgrid1.Cells[2,stringgrid1.row])>=1000) and (key <> chr(8)) then
   abort; //第二列输入数字不能大于1000

 if stringgrid1.Col=1 then
  if (length(stringgrid1.Cells[1,stringgrid1.row])>=9) and (key <> chr(8)) then
   abort; //第-列输入数字不能大于100000000

 if (key = chr(46)) and (stringgrid1.Col=1) then abort;   //第一列不能输入小数点'.'

 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if (key = chr(46)) and (stringgrid1.Col=2) then
  if pos('.',stringgrid1.Cells[2,stringgrid1.row])>0
   then abort;//第二列小数点'.'不能重复

  if (stringgrid1.Row<>1) then
  if (stringgrid1.Cells[1,stringgrid1.Row-1]='无限制') or (stringgrid1.Cells[1,stringgrid1.Row-1]='') then
    abort;
  v_edit:=true;   //将是否编辑变量成为true;
end;

procedure TForm2.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=stringgrid1.RowCount-2 downto stringgrid1.Row do
  begin
   stringgrid1.Cells[0,i+1]:='';
   stringgrid1.Cells[1,i]:='';
   stringgrid1.Cells[2,i+1]:='';
   if i=stringgrid1.Row then
    stringgrid1.Cells[1,i]:='无限制';
  end;
 if stringgrid1.Cells[1,5]<>'' then
  stringgrid1.Cells[1,5]:='';
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if (stringgrid1.Cells[1,stringgrid1.Row]='') or (pos('无',stringgrid1.Cells[1,stringgrid1.Row])<>0) then
   n1.Enabled:=false else
   n1.Enabled:=true;
end;

procedure TForm2.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=8) or (key=46) then   //如果用户按del键或者back键
if (stringgrid1.Cells[1,stringgrid1.Row]='') and (stringgrid1.Col=1) then
   n1click(sender);  //调用删除菜单
end;

procedure TForm2.Editor1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button=mbLeft then
begin
  if editor1.Cells[1,v_Row]='' then
     editor1.Cells[1,v_Row]:='0';
  editor1.Cells[1,v_Row]:=formatfloat('0.00',strtofloat(editor1.Cells[1,v_row]));
end;
end;

procedure TForm2.Editor1Exit(Sender: TObject);
begin
if editor1.Cells[1,editor1.Row]='' then
   editor1.Cells[1,editor1.Row]:='0.00';
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i:byte;
begin
 for i:=1 to 5 do
  stringgrid1.Rows[i].Clear;
 form3.Memo1.Clear;
 form3.Memo2.Clear;
 v_close:=0;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then //正常退出
 begin
  form1.adotable1.Cancel;
  form1.Show;
 end;
end;

procedure TForm2.StringGrid1Exit(Sender: TObject);
var
 i:byte;
begin
 if stringgrid1.Col=2 then  //如果是在第二列
  begin
   if stringgrid1.Cells[2,stringgrid1.Row]<>'' then
    stringgrid1.Cells[2,stringgrid1.Row]:=formatfloat('0.00',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]))
   else
    if stringgrid1.Cells[1,stringgrid1.Row]<>'' then
     stringgrid1.Cells[2,stringgrid1.Row]:='0.00';
  end
 else      //...............如果是在第一列
  begin  // 开始....2
   if (stringgrid1.Row>1) and (stringgrid1.Cells[1,stringgrid1.Row]<>'')
       and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0)  then
   begin   //...yes                       //如果不在第一行
    IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])<strtofloat(stringgrid1.Cells[1,stringgrid1.Row-1])) then
      begin   //向上比较
       stringgrid1.Cells[1,stringgrid1.Row]:=stringgrid1.Cells[1,stringgrid1.Row-1];
       stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
       if stringgrid1.Cells[2,stringgrid1.Row+1]='' then
          stringgrid1.Cells[2,stringgrid1.Row+1]:='0.00';
       if stringgrid1.Cells[1,stringgrid1.Row+1]='' then
          stringgrid1.Cells[1,stringgrid1.Row+1]:='无限制';
      end
   else      //向下比较
    begin  //yes
     for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
      begin
       if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'')  then
        begin
         IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
          begin
           stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
          end
         else
          stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
        end
       else
        begin
         stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
         stringgrid1.Cells[1,i]:='无限制';
         if stringgrid1.Cells[2,i]='' then
          stringgrid1.Cells[2,i]:='0.00';
         break;
        end;
      end;
    end;  //yes
  end     //...yes
  else    //如果当前行在第一行  或者不在第一行,但是当前行有'无限制',或者当前行是空行
   begin  //bbbyes
    for i:=stringgrid1.Row+1 to stringgrid1.RowCount-2 do
     begin
      if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'') and (pos('无',stringgrid1.Cells[1,i-1])=0) then
       begin
        IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
         begin
          stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
          stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
         end
        else
         stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
       end;
     end;
      if (stringgrid1.row=1) and (stringgrid1.Cells[1,2]='') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
       begin
        stringgrid1.Cells[1,stringgrid1.Row+1]:='无限制';
        if stringgrid1.Cells[2,stringgrid1.Row+1]='' then
         stringgrid1.Cells[2,stringgrid1.Row+1]:='0.00';
       end;
      if (stringgrid1.Cells[1,stringgrid1.Row]<>'') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
       stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
   end; //bbbyes
  end;  // 结束....2
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
try
 form_employee:=tform_employee.Create(application);
 form_employee.MaskEdit1.Text:=edit2.Text;
 if form_employee.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
   edit2.SetFocus;
  end
 else
  if form_employee.ShowModal=mrok then
   begin
    edit2.Text:=form_employee.ADOQuery1EMPL_CODE.Value;
    label4.Caption:=form_employee.ADOQuery1EMPLOYEE_NAME.Value;
    form1.ADOTable1EMPLOYEE_PTR.Value:=form_employee.ADOQuery1RKEY.Value;
    treeview1.SetFocus;
   end
  else
   edit2.SetFocus;
finally
 form_employee.free;
end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and (trim(edit2.Text)<>'')  then
try
 form_employee:=tform_employee.Create(application);
 form_employee.MaskEdit1.Text:=edit2.Text;
 if comparetext(trim(edit2.Text),trim(form_employee.ADOQuery1EMPL_CODE.Value))=0 then
  begin
   label4.Caption:=form_employee.ADOQuery1EMPLOYEE_NAME.Value;
   form1.ADOTable1EMPLOYEE_PTR.Value:=form_employee.ADOQuery1RKEY.Value;
  end
 else
  begin
   messagedlg('请输入正确的员工代码!',mtinformation,[mbok],0);
   edit2.SetFocus;
  end;
finally
 form_employee.free;
end
else
if (activecontrol.Name<>'BitBtn5') and (trim(edit2.Text)='')  then
 begin
  label4.Caption:='';
  form1.ADOTable1EMPLOYEE_PTR.AsVariant:=null;
 end;
end;

end.
