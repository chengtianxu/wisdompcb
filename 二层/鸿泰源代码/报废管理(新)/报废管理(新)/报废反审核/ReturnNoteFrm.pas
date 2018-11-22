unit ReturnNoteFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmNoteRetrun = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ShowReturnNoteFrm(AOwner: TComponent; out outS: string): Boolean;

implementation

{$R *.dfm}

function ShowReturnNoteFrm(AOwner: TComponent; out outS: string): Boolean;
var
  frmNoteRetrun: TfrmNoteRetrun;
begin
  frmNoteRetrun := TfrmNoteRetrun.Create(AOwner);
  try
    Result := frmNoteRetrun.ShowModal = mrOk;
    if Result then
    begin
      outS := frmNoteRetrun.edt1.Text;
    end
    else
    begin
      outS := '';
    end;
  finally
    FreeAndNil(frmNoteRetrun);
  end;
end;

procedure TfrmNoteRetrun.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
