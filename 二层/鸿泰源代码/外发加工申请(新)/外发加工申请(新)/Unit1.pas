unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh;

type
  TForm1 = class(TForm)
    dbgrdh1: TDBGridEh;
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
