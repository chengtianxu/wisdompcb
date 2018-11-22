unit Unit_numcat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_numcat = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Button2: TButton;
    Button1: TButton;
    key17: TLabel;
    Label4: TLabel;
    inv_code: TEdit;
    Edit7: TEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit9: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Edit5: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_numcat: TForm_numcat;

implementation
uses damo,unit_catser;

{$R *.dfm}

procedure TForm_numcat.BitBtn1Click(Sender: TObject);
begin
try
 form_catser:=tform_catser.Create(application);
 if form_catser.showmodal=mrok then
 begin
  edit7.Text:= form_catser.adoquery1INV_DESCRIPTION.AsString;
  inv_code.Text:= form_catser.adoquery1INV_PART_NUMBER.AsString;
  edit1.Text:=form_catser.adoquery1INV_PART_NUMBER.AsString;
  edit2.Text:=form_catser.adoquery1INV_DESCRIPTION.AsString;
  self.key17.Caption:=form_catser.adoquery1rkey.AsString;
  edit1.SetFocus;
 end;
finally
form_catser.Free;
end;
end;

procedure TForm_numcat.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_numcat.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_numcat.Button1Enter(Sender: TObject);
begin
  if strtofloat(edit3.Text)<=0 then
 begin
 showmessage('请输入余料长度！');
 edit3.SetFocus;
 exit;
 end ;

 if strtofloat(edit4.Text)<=0 then
 begin
 showmessage('请输入余料宽度！');
 edit4.SetFocus;
 exit;
 end ;
  {取消,余料不用限制输入价格
 if strtofloat(edit6.Text)<=0 then
 begin
 showmessage('请输入余料价格！');
 edit6.SetFocus;
 exit;
 end ;
 {}
 if edit1.Text='' then
 begin
  showmessage('请输入余料编号');
  edit1.SetFocus;
  exit;
 end; 
end;

procedure TForm_numcat.Edit1Exit(Sender: TObject);
begin
{ if (trim(edit1.Text)<>'')and(form_numcat.Caption='余料规格增加') then
 begin
  try
  form_catser:=tform_catser.Create(application);
  if form_catser.adoquery1.Locate('INV_PART_NUMBER',trim(edit1.Text),[])then
  begin
    inv_code.Text:=trim(edit1.Text);
    edit7.Text:=form_catser.adoquery1INV_DESCRIPTION.AsString;
    edit2.Text:=form_catser.adoquery1INV_DESCRIPTION.AsString;
    key17.Caption:=form_catser.adoquery1rkey.AsString;
    edit3.SetFocus;
  end
  else
   begin
    showmessage('请输入正确的余料编号!');
    edit1.SetFocus;
   end;
  finally
  form_catser.Free;
  end;
 end;
 }
end;


procedure TForm_numcat.edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_numcat.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8,#13]) then abort;
if pos('.',edit6.Text)>0 then
if key=#46 then abort;
end;

procedure TForm_numcat.edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)='' then edit3.Text:='0';
end;

procedure TForm_numcat.Edit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit6.Text)='' then edit6.Text:='0';
end;

procedure TForm_numcat.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)='' then edit4.Text:='0';
end;

end.
