unit RemarkFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmNote = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    btnS: TBitBtn;
    btnC: TBitBtn;
    mmo1: TMemo;
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
