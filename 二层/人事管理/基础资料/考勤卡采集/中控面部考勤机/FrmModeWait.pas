unit FrmModeWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TfrmWait = class(TForm)
    tmr1: TTimer;
    pb1: TProgressBar;
    lbl1: TLabel;
    lblNote: TLabel;
    pnl1: TPanel;
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ShowWaitFrm(AOwner: TComponent;ANote: string);
  procedure CloseWaitFrm;
implementation

{$R *.dfm}

var
  LgWaitFrm: TfrmWait = nil;

procedure ShowWaitFrm(AOwner: TComponent;ANote: string);
begin
  FreeAndNil(LgWaitFrm);
  LgWaitFrm := TfrmWait.Create(AOwner);
  LgWaitFrm.lblNote.Caption := ANote;
  try
    LgWaitFrm.ShowModal;
  finally
    FreeAndNil(LgWaitFrm);
  end;
end;

procedure CloseWaitFrm;
begin
  if Assigned(LgWaitFrm) then
    LgWaitFrm.ModalResult := mrOk;
end;


{ TfrmWait }

procedure TfrmWait.tmr1Timer(Sender: TObject);
begin
  if pb1.Position < pb1.Max then
    pb1.Position := pb1.Position + 1
  else
    pb1.Position := 0;
end;

end.
