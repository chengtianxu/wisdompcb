unit deptauth_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm_deptinfo = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_deptinfo: TForm_deptinfo;

implementation

uses damo;


{$R *.dfm}

procedure TForm_deptinfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then self.ModalResult := mrok;
end;

end.
