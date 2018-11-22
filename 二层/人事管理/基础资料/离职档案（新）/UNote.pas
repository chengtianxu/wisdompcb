unit UNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmNote = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    btns: TBitBtn;
    btnc: TBitBtn;
    chk1: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNote: TfrmNote;

implementation

{$R *.dfm}

end.
