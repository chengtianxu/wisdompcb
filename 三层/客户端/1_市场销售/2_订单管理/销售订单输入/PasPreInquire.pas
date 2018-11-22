unit PasPreInquire;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmPreInquire = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreInquire: TfrmPreInquire;

implementation

{$R *.dfm}

end.
