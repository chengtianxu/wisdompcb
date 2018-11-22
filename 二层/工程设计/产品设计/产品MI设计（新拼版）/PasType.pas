unit PasType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmType = class(TForm)
    rgType: TRadioGroup;
    btnConfirm: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmType: TfrmType;

implementation

{$R *.dfm}

end.
