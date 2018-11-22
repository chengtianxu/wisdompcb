unit return_quan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    rkey76: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  requ_note: tstringlist;
implementation

uses mater_rej_search, note,damo, main,common;

{$R *.dfm}

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
 try
  form_marej := tform_marej.Create(application);
  form_marej.Edit1.Text := trim(edit3.Text);
  if form_marej.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit3.SetFocus;
   end
  else
  if form_marej.ShowModal = mrok then
   begin
    edit3.Text := form_marej.ADOQuery1.fieldbyname('code').AsString;
    edit3.Font.Color := clwindowtext;
    label4.Caption := form_marej.ADOQuery1.fieldbyname('reject_description').AsString;
    rkey76.Caption := form_marej.ADOQuery1.fieldbyname('rkey').AsString;
   end;
 finally
  form_marej.free;
 end;
end;

procedure TForm3.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit2.Text)>0 //小数点不能重复
  then abort;
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort;
end;

procedure TForm3.Edit2Exit(Sender: TObject);
begin
 if trim(edit2.Text) = '' then  edit2.Text := '0';
 if (strtofloat(edit2.Text) > strtofloat(edit1.Text)) and
    (activecontrol.Name<>'BitBtn3') then
  begin
   messagedlg('退还的数量不能大于可用的数量!',mterror,[mbcancel],0);
   edit2.SetFocus;
  end
 else
  edit2.Text := formatfloat('0.000',strtofloat(edit2.Text));
end;

procedure TForm3.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Bitbtn3')
   and (trim(edit3.Text)<>'') then
 try
  form_marej := tform_marej.Create(application);
  form_marej.Edit1.Text := trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_marej.ADOQuery1.fieldbyname('code').AsString))=0 then
  begin
   edit3.Text := form_marej.ADOQuery1.fieldbyname('code').AsString;
   edit3.Font.Color := clwindowtext;
   label4.Caption := form_marej.ADOQuery1.fieldbyname('reject_description').AsString;
   rkey76.Caption := form_marej.ADOQuery1.fieldbyname('rkey').AsString;
  end
 else
  begin
   messagedlg('拒收代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label4.Caption := '';
   edit3.SetFocus;
  end;
 finally
  form_marej.Free;
 end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
 if strtofloat(edit2.Text)=0 then
  begin
   messagedlg('退货数量为零!',mtinformation,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
 if edit3.Font.Color=clblue then
  begin
   messagedlg('拒收代码不能为空!',mtinformation,[mbok],0);
   edit3.SetFocus;
   exit;
  end;
//===========================================================
 with dm.ado95 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0209 where rkey is null');
   open;
   append;
   fieldvalues['TTYPE'] := 32;
   fieldvalues['GL_HDR_PTR'] := strtoint(rkey76.Caption);
   fieldvalues['srce_ptr'] := dm.AQ235rkey.Value;
   fieldbyname('user_ptr').AsString := rkey73;
   FieldValues['EMPL_PTR'] := form1.empl_ptr;
   fieldbyname('quantity').AsString := edit2.Text;
   Fieldvalues['TDATE'] := form1.sys_longdate;
   fieldvalues['PART_PTR']:=dm.aq235d0072_ptr.value;
   post;
  end;
//===========================================================
  if trim(requ_note.Text) <> '' then      //记事本只有新增一种情况
   with dm.ADO9511 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0011 where rkey is null');
     open;
     append;
     FieldValues['file_pointer'] := dm.ado95.FieldValues['rkey'];
     FieldValues['source_type'] := 209;
     for i:=1 to requ_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := requ_note.Strings[i-1];
     post;
    end;
//===========================================================
 ModalResult := mrok;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 requ_note:=tstringlist.Create;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
 requ_note.Free;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Memo1.Lines.Assign(requ_note);
 if edit_note.ShowModal=mrok then
   requ_note.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;

procedure TForm3.Edit3Click(Sender: TObject);
begin
 IF edit3.Font.Color = clwindowtext then
  begin
   edit3.Font.Color := clblue;
   edit3.SelectAll;
  end;
end;

end.
