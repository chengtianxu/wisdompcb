unit PasParaEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmParaEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCalcel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtThink: TEdit;
    edtMid: TEdit;
    edtNormal: TEdit;
    edtSlot: TEdit;
    procedure edtThinkKeyPress(Sender: TObject; var Key: Char);
    procedure edtThinkExit(Sender: TObject);
  private
    { Private declarations }
  public
     recRkey:Integer;
    { Public declarations }
  end;

var
  frmParaEdit: TfrmParaEdit;

implementation

{$R *.dfm}

procedure TfrmParaEdit.edtThinkKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8,#46]) then Abort;
end;

procedure TfrmParaEdit.edtThinkExit(Sender: TObject);
var
  tmp:Currency;
begin
  if Trim((Sender as TEdit).Text)<>'' then
  begin
    if TryStrToCurr(Trim((Sender as TEdit).Text),tmp)=False then
    begin
      ShowMessage('不是有效的格式，请重新输入');
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
end;

end.
