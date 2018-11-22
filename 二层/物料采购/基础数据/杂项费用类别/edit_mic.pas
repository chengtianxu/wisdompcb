unit edit_mic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
   v_close:byte; 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses mic_category, acc_search;
{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
 dbedit1.SetFocus;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 edit1.Text := '';
 edit1.Font.Color := clblue;
 label3.Caption := '';
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
try
 form_account:=tform_account.Create(application);
 form_account.Edit1.Text:=trim(edit1.Text);
 if form_account.ADOQuery1.IsEmpty then
  begin
   showmessage('没有查找到相关数据!');
   edit1.SetFocus;
  end
 else
 if form_account.ShowModal=mrok then
  begin
   form1.aq0199.FieldValues['gen_led_ACCTptr']:=form_account.adoquery1.FieldValues['rkey'];
   edit1.Text:=form_account.adoquery1.FieldValues['gl_acc_number'];
   edit1.Font.Color:=clwindowtext;
   label3.Caption:='    '+form_account.adoquery1.FieldValues['gl_description'];
   dbcheckbox1.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 form_account.free;
end;

end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color:=clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 v_close:=1;
 form1.aq0199.Cancel;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
IF trim(DBEDIT1.Text) = '' then
 begin
  messagedlg('类别名称不能为空!',mtwarning,[mbok],0);
  dbedit1.SetFocus;
 end
else
 begin
  v_close:=1;
  form2.ModalResult := mrok;
 end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
    and (trim(edit1.Text)<>'') then
 try
  form_account := Tform_account.Create(Application);
  form_account.Edit1.Text:=trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_account.ADOQuery1.Fieldbyname('gl_acc_number').AsString))=0 then
  begin
   edit1.Font.Color:=clwindowtext;
   label3.Caption := form_account.ADOQuery1.FieldValues['gl_description'];
   form1.aq0199.FieldValues['gen_led_acctptr'] := form_account.ADOQuery1rkey.Value;
  end
 else
  begin
   messagedlg('帐目编号不正确,请重新输入或选择',mtinformation,[mbok],0);
   label3.Caption:='';
   edit1.SetFocus;
  end;
 finally
  form_account.free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
    and (trim(edit1.Text)='') then
  form1.aq0199.FieldValues['gen_led_acctptr'] :=null;

end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then
  form1.aq0199.Cancel;
end;

end.
