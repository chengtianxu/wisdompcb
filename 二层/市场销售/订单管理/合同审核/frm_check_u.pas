unit frm_check_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrm_check = class(TForm)
    RichEdit1: TRichEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    procedure RichEdit1Change(Sender: TObject);
    procedure RichEdit1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_check: TFrm_check;

implementation

{$R *.dfm}

procedure TFrm_check.RichEdit1Change(Sender: TObject);
begin
if RichEdit1.Text<>'' then button1.Enabled:=true;
if RichEdit1.Text='' then button1.Enabled:=false;
end;

procedure TFrm_check.RichEdit1Enter(Sender: TObject);
begin
//  RichEdit1.Text :=  Trim(RichEdit1.Text)+#13;
  RichEdit1.Text := stringreplace(Trim(RichEdit1.Text),' ','',[rfReplaceAll])+#13;
  RichEdit1.SetFocus ;
  RichEdit1.SelStart := length(RichEdit1.Text);
  RichEdit1.SelLength :=0;
end;

procedure TFrm_check.Button1Click(Sender: TObject);
var i:Integer;
begin
  for i :=1  to RichEdit1.Lines.Count do
  begin
    if (Length(Trim(RichEdit1.Lines[i]))=0) then
    begin
      RichEdit1.Lines.Delete(i);
    end;
  end;
  if  Length(Trim(RichEdit1.Lines[1]))<2 then RichEdit1.Lines.Delete(1);
  if  (Length(Trim(RichEdit1.Lines[1]))<2) and (RichEdit1.Lines.Count=2) then
  begin
    ShowMessage('审核意见不能少于两个字!');
    exit;
  end;
  Self.ModalResult:=mrok;
end;

end.
