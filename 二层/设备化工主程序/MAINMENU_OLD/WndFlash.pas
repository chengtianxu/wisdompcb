unit WndFlash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel;

type
  TFrmWndFlash = class(TForm)
    imgSplash: TImage;
    LMDSimpleLabel2: TLMDSimpleLabel;
    LMDSimpleLabel1: TLMDSimpleLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWndFlash: TFrmWndFlash;

implementation

{$R *.DFM}

end.
