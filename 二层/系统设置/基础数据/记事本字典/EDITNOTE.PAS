unit editnote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    aq04: TADOStoredProc;
    aq04CONTROL_NO_LENGTH: TSmallintField;
    aq04SEED_VALUE: TStringField;
    aq04SEED_FLAG: TWordField;
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure append_empl_code();
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    v_close:byte;
  public
    { Public declarations }
    function MemoLine: Integer;
    function LineLen(r: Integer): Integer;
    function NRows: Integer;
  end;

var
  Form2: TForm2;
 MaxCharsPerLine, MaxLines: Integer;
implementation
 uses main;
{$R *.dfm}

procedure TForm2.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
if SendMessage(Memo1.Handle,EM_LINEFROMCHAR,Memo1.SelStart,0)=4 then
    abort;
with Memo1 do begin
 case Key of
 ' '..#255: if (LineLen(MemoLine) >= MaxCharsPerLine) then
    Key := #0;
 #10, #13: if (NRows >= MaxLines) then
    Key := #0;
 #8: if (SelStart = SendMessage(Handle, EM_LINEINDEX, MemoLine, 0)) then
    Key := #0;
 end;
end;

end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 v_message:integer;
begin
 if form1.adotable1.State=dsinsert then
  begin
   form1.adotable1.Cancel;
   v_close:=1; //正常退出
   close;
  end;

if (form1.adotable1.Modified)  then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then      //no取消对当前记录的修改包括新增
   form1.adotable1.Cancel
  else
   if v_message=6 then     //yes对修改的记录存盘
    BitBtn1Click(Sender)
  else                    //cancel不存盘也不保存
    exit;
  end;
 v_close:=1; //正常退出
 form1.adotable1.Cancel;
 close;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 v_seed,v_last,new_seed:string;
 i,v_length:byte;
begin
 for i:=1 to 4 do
  form1.ADOTable1.fieldbyname('note_pad_line_'+inttostr(i)).asstring := Memo1.Lines[i-1];

 form1.ADOTable1NP_CODE.Value := maskedit1.Text;//保存编号

 if form1.ADOTable1.State = dsinsert then
  begin
   form1.ADOTable1.post;
 //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
if aq04seed_flag.Value<>1 then        //代码由控制码控制
 begin
  v_seed := trim(maskedit1.Text);     //处理代码04
  v_length :=length(v_seed);
  if v_seed>=trim(AQ04.FieldValues['seed_value']) then //如果代码是从04中取值
  for i := v_length downto 1 do                        //更新data0004
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
  begin
   v_last := floattostr(10000+
   strtofloat(copy(v_seed,i+1,v_length-i))+1);        //后缀加1
   new_seed := copy(v_seed,1,i)+copy(v_last,5-(v_length-i)+1,v_length-i);
   AQ04.Edit;                                        //使前缀不变后缀加1
   AQ04.FieldValues['seed_value'] := new_seed;
   AQ04.Post;
   break;
  end
 else
 if i=1 then         //如果第一位仍然是数字
  begin
   v_last := floattostr(100000+strtofloat(v_seed)+1);
   new_seed := copy(v_last,6-v_length+1,v_length);
   AQ04.Edit;
   AQ04.FieldValues['seed_value'] := new_seed;
   AQ04.Post;
  end;
end;
 //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   form1.ADOTable1.Append;
   form2.append_empl_code();
   memo1.Clear;
   memo1.SetFocus;
  end
 else   //编辑
  begin
   form1.ADOTable1.post;
   v_close:=1; //正常退出
   close;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 memo1.Clear;
end;



function tform2.NRows: integer;
begin
  with Memo1 do
    Result := 1 + SendMessage(Handle, EM_LINEFROMCHAR, GetTextLen-1, 0);
end;

function Tform2.LineLen(r: Integer): Integer;
var r1, r2: Integer;
begin
 with Memo1 do begin
  r1 := SendMessage(Handle, EM_LINEINDEX, r, 0);
  if (r < NRows-1) then
   r2 := SendMessage(Handle, EM_LINEINDEX, r+1, 0)-2 {-CR/LF}
  else
   r2 := GetTextLen;
 end;
 Result := r2-r1;
end;

function Tform2.MemoLine: Integer;
begin
 with Memo1 do
 Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

procedure TForm2.append_empl_code();
var
 i,j:byte;
 v_mask:string;
begin
  if AQ04.FieldValues['seed_flag']<>1 then
   begin
    maskedit1.text := trim(AQ04.Fieldvalues['seed_value']);
    if AQ04.FieldValues['seed_flag']=2  then
    for i:=length(maskedit1.Text) downto 1 do //设置掩码//找出第几位开始为前缀
    if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then
    begin                                     //不是数字字符就为前缀
     maskedit1.EditMask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
     v_mask := maskedit1.EditMask;
     for j:=1 to i do
      insert('\',v_mask,2*j-1);      //从奇数位插入
     maskedit1.EditMask := v_mask;
     maskedit1.text := trim(AQ04.Fieldvalues['seed_value']);
     break;
    end;
    if AQ04.FieldValues['seed_flag']=4 then
     maskedit1.Enabled := false;
   end
  else           //完全手工输入编号
   begin
    maskedit1.Text := '';
    maskedit1.SetFocus;
   end;          //以上对编号操作
END;

procedure TForm2.FormActivate(Sender: TObject);
var
 i,j:byte;
 v_mask:string;
begin
 aq04.Open;
if form1.ADOTable1.State=dsinsert then //新增
 begin
  append_empl_code();
 end
else                        //编辑
 begin
  maskedit1.Text := trim(form1.ADOTable1NP_CODE.Value);
 if aq04.FieldValues['seed_flag']=2  then             //固定前缀
  for i:=length(maskedit1.Text) downto 1 do
  if (maskedit1.Text[i]<'0') or (maskedit1.Text[i]>'9') then //找出第几位开始为前缀
   begin                         //不是数字字符就为前缀
    maskedit1.EditMask := copy(maskedit1.Text,1,i)+copy('99999',1,5-i)+';1; ';
    v_mask :=maskedit1.EditMask;
    for j:=1 to i do
    insert('\',v_mask,2*j-1);         //从奇数位插入
    maskedit1.EditMask  := v_mask;    //掩码赋值
    maskedit1.Text := trim(form1.ADOTable1NP_CODE.Value);
    break;
   end;
   if AQ04.FieldValues['seed_flag']=4 then
    maskedit1.Enabled :=false;
 end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
var
 v_end:string;
begin
 if trim(maskedit1.Text)='' then
  begin
   messagedlg('代码不能为空!',mtinformation,[mbok],0);
   maskedit1.SetFocus;
   exit;
  end
 else
 if aq04seed_flag.Value<>1 then //控制码从04中读取
  begin
   v_end:=copy(maskedit1.Text,length(trim(maskedit1.Text)),1);
   if (v_end<'0') or (v_end>'9') then
   begin
    application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
    maskedit1.SetFocus;
    exit;
   end;
  end;
 if trim(memo1.Text)='' then
  begin
   messagedlg('记事本内容不能为空!',mtinformation,[mbok],0);
   memo1.SetFocus;
  end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then
 form1.adotable1.Cancel; 
end;

Initialization
 MaxCharsPerLine := 70;
 MaxLines := 4;
end.
