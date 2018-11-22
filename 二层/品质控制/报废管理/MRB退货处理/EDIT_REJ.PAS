unit edit_rej;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses rej_search, damo, dispost;

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 try
  form_rej:=Tform_rej.Create(application);
  form_rej.Edit1.Text := trim(edit1.Text);
  if dm.AQ39.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
    exit;
   end;
  if form_rej.ShowModal=mrok then
   begin
    edit1.Text := trim(dm.AQ39REJ_CODE.Value);
    edit1.Font.Color := clwindowtext;
    label3.Caption := dm.AQ39REJECT_DESCRIPTION.Value;
    label5.Caption := dm.AQ39RKEY.AsString;
    edit2.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_rej.free;
 end;

end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color :=clblue;
  end;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
begin
 if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') and (trim(edit1.Text)<>'') then
 try
  form_rej:=Tform_rej.Create(application);
  form_rej.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(dm.AQ39.Fieldbyname('REJ_CODE').AsString))=0 then
   begin
    edit1.Font.Color := clwindowtext;
    label3.Caption := dm.AQ39REJECT_DESCRIPTION.Value;
    label5.Caption := dm.AQ39RKEY.AsString;
   end
  else
   begin
    messagedlg('请输入正确的拒收品/不良品代码!',mterror,[mbcancel],0);
    edit1.SetFocus;
   end;
 finally
  form_rej.free;
 end
else
 label3.Caption:='';
end;

procedure TForm3.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then  //判断是否输入数字
    abort;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
if edit1.text<>'' then edit2.SetFocus; 
end;

procedure TForm3.Edit2Exit(Sender: TObject);
begin
 if trim(edit2.Text)='' then  edit2.Text := '0';
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('请输入报废代码!');
  edit1.SetFocus;
 end
else
if (strtoint(edit2.Text)<=0) or (strtoint(edit2.Text)>dm.ADO414qty_rece.Value-form2.quantityed) then
 begin
  showmessage('可报废数量必需大于 0 小于 '+inttostr(dm.ADO414qty_rece.Value-form2.quantityed));
  edit2.SetFocus;
 end
else
 self.ModalResult:=mrok;
end;

procedure TForm3.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TForm3.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then edit3.SetFocus;
end;

procedure TForm3.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

end.
