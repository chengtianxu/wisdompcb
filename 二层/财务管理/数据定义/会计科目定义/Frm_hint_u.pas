unit Frm_hint_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TF_hint = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Panel1: TPanel;
    Animate2: TAnimate;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_hint: TF_hint;

implementation

{$R *.dfm}

end.
