unit DateFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,uBaseFrm;

type
  TfrmDate_Mod29 = class(TfrmBase)
    Label1: TLabel;
    edtDate: TEdit;
    btnCommit: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCommitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDate_Mod29: TfrmDate_Mod29;

implementation

{$R *.dfm}

{ TfrmDate_Mod29 }

procedure TfrmDate_Mod29.btnCommitClick(Sender: TObject);
var
  LTmp:TDateTime;
begin
  if not TryStrToDateTime(Trim(edtDate.Text),LTmp) then
  begin
    ShowMessage('日期格式不对！应如：2016-11-01 08:00:00');
    edtDate.SetFocus;
    Exit;
  end;
  edtDate.Text:= DateTimeToStr(LTmp);
  ModalResult:= mrOk;
end;

end.
