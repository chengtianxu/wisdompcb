unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh;

type
  TForm7 = class(TForm)
    dbgrdh1: TDBGridEh;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses
  damo;

{$R *.dfm}

procedure TForm7.btn1Click(Sender: TObject);
begin
 Close;
end;

end.
