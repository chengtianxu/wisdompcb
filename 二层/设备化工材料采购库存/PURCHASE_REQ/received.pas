unit received;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TForm7 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses damo;

{$R *.dfm}

procedure TForm7.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then
  self.ModalResult:=mrcancel;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
dbgrid1.Columns[0].Width := 102;
dbgrid1.Columns[1].Width := 178;
dbgrid1.Columns[2].Width := 215;
dbgrid1.Columns[3].Width := 76;
dbgrid1.Columns[4].Width := 76;
end;

end.
