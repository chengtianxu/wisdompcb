unit uBaseEditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfrmBaseEdit = class(TfrmBase)
    pnlMain: TPanel;
    pnl1: TPanel;
    btnSave: TBitBtn;
    btnSaveAll: TBitBtn;
    btnCheck: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    pnl2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
