unit PasNote_information;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmNote_information = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNote_information: TfrmNote_information;

implementation

{$R *.dfm}

procedure TfrmNote_information.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
