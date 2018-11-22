unit return_quan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrm_return_quan = class(TForm)
    BitBtn1: TBitBtn;
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
    Label5: TLabel;
    Memo1: TMemo;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_return_quan: Tfrm_return_quan;
  requ_note: tstringlist;
implementation

uses  damo, main,common, marej;

{$R *.dfm}

procedure Tfrm_return_quan.BitBtn3Click(Sender: TObject);
begin
 close;
end;

procedure Tfrm_return_quan.BitBtn4Click(Sender: TObject);
begin
 try
   frm_marej := Tfrm_marej.Create(application);
   frm_marej.ADS76.Close;
   frm_marej.ADS76.Open;
   frm_marej.Edit1.Text := trim(edit3.Text);
   if frm_marej.ADS76.IsEmpty then
   begin
     messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
     edit3.SetFocus;
   end
   else
   if frm_marej.ShowModal = mrok then
   begin
     edit3.Text := frm_marej.ADS76.fieldbyname('code').AsString;
     edit3.Font.Color := clwindowtext;
     label4.Caption := frm_marej.ADS76.fieldbyname('reject_description').AsString;
     rkey76.Caption := frm_marej.ADS76.fieldbyname('rkey').AsString;
   end;
 finally
  frm_marej.free;
 end;
end;

procedure Tfrm_return_quan.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = chr(46)) then
  if pos('.',edit2.Text)>0 //小数点不能重复
  then abort;
  if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort;
end;

procedure Tfrm_return_quan.Edit2Exit(Sender: TObject);
begin
  if trim(edit2.Text) = '' then
    edit2.Text := '0';
  if (strtofloat(edit2.Text) > strtofloat(edit1.Text)) and
    (activecontrol.Name<>'BitBtn3') then
    begin
      messagedlg('退还的数量不能大于可用的数量!',mterror,[mbcancel],0);
      edit2.SetFocus;
    end
  else
    edit2.Text := formatfloat('0.000',strtofloat(edit2.Text));
end;

procedure Tfrm_return_quan.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'BitBtn3')
   and (trim(edit3.Text)<>'') then
  try
   frm_marej := tfrm_marej.Create(application);
   frm_marej.ADS76.Close;
   frm_marej.ADS76.Open;
   frm_marej.Edit1.Text := trim(edit3.Text);
    if comparetext(trim(edit3.text),trim(frm_marej.ADS76.fieldbyname('code').AsString))=0 then
    begin
      edit3.Text := frm_marej.ADS76.fieldbyname('code').AsString;
      edit3.Font.Color := clwindowtext;
      label4.Caption := frm_marej.ADS76.fieldbyname('reject_description').AsString;
      rkey76.Caption := frm_marej.ADS76.fieldbyname('rkey').AsString;
    end
    else
    begin
     messagedlg('拒收代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label4.Caption := '';
     edit3.SetFocus;
    end;
  finally
    frm_marej.Free;
  end;
end;

procedure Tfrm_return_quan.BitBtn1Click(Sender: TObject);
var
//  i:byte;
  longtime : TDateTime;
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
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select quan_on_hand from data0235 where quan_on_hand ='+ Edit1.Text+' and rkey='+dm.ADS235RKEY.AsString;
    Open;
    if IsEmpty then
    begin
      messagedlg('库存已改变，请重新确认退货数量',mtinformation,[mbok],0);
      Edit1.Text :=  FieldByName('quan_on_hand').AsString;
      Edit2.SetFocus;
      Exit;
    end;
  end;
//===========================================================
  longtime := getsystem_date(DM.tmp,0);
  try
    DM.ADOConnection1.BeginTrans;
    with dm.tmp do
    begin
      close;
      SQL.Text := 'select * from data0209 where rkey is null';
      open;
      append;
      fieldvalues['TTYPE'] := 32;
      fieldvalues['GL_HDR_PTR'] := strtoint(rkey76.Caption);
      fieldvalues['srce_ptr'] := dm.ADS235RKEY.Value;
      fieldbyname('user_ptr').AsString := rkey73;
      FieldValues['EMPL_PTR'] := Frm_main.empl_ptr;
      fieldbyname('quantity').AsString := edit2.Text;
      Fieldvalues['TDATE'] := longtime;
      fieldvalues['PART_PTR']:=dm.ADS235D0072_PTR.value;
      fieldvalues['remark'] := Memo1.Lines.Text;
      post;
    end;
    with DM.tmp do
    begin
      close;
      SQL.Text := 'select quan_on_hand,quan_to_ship from data0235 where rkey='+dm.ADS235RKEY.AsString;
      open;
      Edit;
      FieldByName('quan_on_hand').Value := strtofloat(Edit1.Text) - strtofloat(Edit2.Text);
      FieldByName('quan_to_ship').Value := DM.ADS235quan_to_ship.Value + strtofloat(Edit2.Text);
      Post;
    end;
    DM.ADOConnection1.CommitTrans;
    ModalResult := mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;

  end;
//===========================================================
//  if trim(requ_note.Text) <> '' then      //记事本只有新增一种情况
//   with dm.ADO9511 do
//    begin
//     close;
//     sql.Clear;
//     sql.Add('select * from data0011 where rkey is null');
//     open;
//     append;
//     FieldValues['file_pointer'] := dm.ado95.FieldValues['rkey'];
//     FieldValues['source_type'] := 209;
//     for i:=1 to requ_note.Count do
//      FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := requ_note.Strings[i-1];
//     post;
//    end;
//===========================================================

end;

procedure Tfrm_return_quan.FormCreate(Sender: TObject);
begin
  requ_note:=tstringlist.Create;
end;

procedure Tfrm_return_quan.FormDestroy(Sender: TObject);
begin
  requ_note.Free;
end;

procedure Tfrm_return_quan.Edit3Click(Sender: TObject);
begin
  IF edit3.Font.Color = clwindowtext then
  begin
    edit3.Font.Color := clblue;
    edit3.SelectAll;
  end;
end;

end.
