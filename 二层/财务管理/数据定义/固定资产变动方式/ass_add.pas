unit ass_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_add = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_add: TForm_add;

implementation
uses main,damo;

{$R *.dfm}

procedure TForm_add.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm_add.Button1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then exit;
 try
   dm.ADOConnection1.BeginTrans;
   with dm.ADOQuery1 do
   begin
    append;
    if self.RadioButton1.Checked then fieldbyname('alt_flag').asinteger:=0
     else fieldbyname('alt_flag').asinteger:=1;
    fieldbyname('FASSET_ALT_TYPE').asstring:=edit1.text;
    prepared;
    post;
   end;
   dm.ADOConnection1.CommitTrans;
  except
    on e: exception do
    begin
    dm.ADOConnection1.RollbackTrans;
    dm.ADOQuery1.cancel;
    messagedlg(e.message,mterror,[mbcancel],0);
    end;
  end;
  close;
end;
end.
