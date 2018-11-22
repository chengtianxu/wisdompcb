unit auth_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm_auth_info = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_auth_info: TForm_auth_info;

implementation

uses damo;
{$R *.dfm}

procedure TForm_auth_info.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then close;
end;

end.
