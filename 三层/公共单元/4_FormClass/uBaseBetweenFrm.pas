unit uBaseBetweenFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmBaseBetween = class(TfrmBase)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnOK: TButton;
    btnClose: TButton;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBaseBetween.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmBaseBetween.btnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

end.
