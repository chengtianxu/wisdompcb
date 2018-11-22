unit PasType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TFrmType = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmType: TFrmType;

implementation

{$R *.dfm}

procedure TFrmType.Button1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

end.
