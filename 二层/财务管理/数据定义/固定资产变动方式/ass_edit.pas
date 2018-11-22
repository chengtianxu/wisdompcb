unit ass_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_edit = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_edit: TForm_edit;

implementation
uses main,damo;

{$R *.dfm}

procedure TForm_edit.Button1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then exit;
 try
   dm.ADOConnection1.BeginTrans;
   with dm.ADOQuery1 do
   begin
    edit;
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
    messagedlg('e.message',mterror,[mbcancel],0);
    end;
  end;
  close;
end;

procedure TForm_edit.Button2Click(Sender: TObject);
begin
close;
end;

end.
