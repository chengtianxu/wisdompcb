unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMain = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lblRet: TLabel;
    mmo1: TMemo;
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function CmpBar(A,B: string): Boolean;
    procedure PlaySound(AOk: Boolean);
  end;

var
  frmMain: TfrmMain;

implementation

uses
  MMSystem;

{$R *.dfm}

function TfrmMain.CmpBar(A, B: string): Boolean;
begin
  mmo1.Lines.Add(A);
  mmo1.Lines.Add(B);
  mmo1.Lines.Add('----------');
  Result := A = B;
end;

procedure TfrmMain.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edt2.SetFocus;
end;

procedure TfrmMain.edt2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    try
    if CmpBar(edt1.Text,edt2.Text) then
    begin
      PlaySound(True);
      lblRet.Caption := '通过';
      lblRet.Color := clGreen;
    end else
    begin
      PlaySound(False);
      lblRet.Caption := '不相等';
      lblRet.Color := clRed;
    end;
    finally
      edt1.Text := '';
      edt2.Text := '';
      edt1.SetFocus;
    end;
  end;
end;

procedure TfrmMain.PlaySound(AOk: Boolean);
begin
  if AOk then
  begin
    sndPlaySound('PASS.wav',SND_ASYNC)
  end else
  begin
    sndPlaySound('ERROR.wav',SND_ASYNC)
  end;
end;

end.
