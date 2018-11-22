unit Unit_numout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_numout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Edit6: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_numout: TForm_numout;

implementation
uses damo,remaout_form,unit_deptser,unit_outser;

{$R *.dfm}

procedure TForm_numout.Button1Click(Sender: TObject);
begin
 if trim(edit5.text)='' then
  begin
   showmessage('请选择领料部门！');
   edit5.SetFocus;
   exit;
  end;
 if (strtofloat(edit5.text)<=0) then
  begin
   showmessage('请输入出仓数量！');
   edit5.setfocus;
   exit;
  end
 else
  if strtofloat(edit5.text)>form_outser.ADOQuery1QUAN_ON_HAND.Value then
  begin
   showmessage('您输入的数量最多为'+form_outser.ADOQuery1QUAN_ON_HAND.AsString);
   edit5.SetFocus;
   exit;
  end;
 modalresult:=mrok;
end;
procedure TForm_numout.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_numout.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_numout.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit5.Text)='' then edit5.Text:='0';
end;

end.
