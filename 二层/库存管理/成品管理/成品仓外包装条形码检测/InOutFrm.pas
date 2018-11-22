unit InOutFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmInOut = class(TForm)
    btn1: TButton;
    btn2: TButton;
    rg1: TRadioGroup;
    lbl1: TLabel;
    edt1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInOut: TfrmInOut;

implementation

{$R *.dfm}

end.
