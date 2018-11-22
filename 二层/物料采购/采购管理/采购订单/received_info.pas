unit received_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids;

type
  TForm19 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses damo;

{$R *.dfm}

procedure TForm19.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then
  self.ModalResult:=mrcancel;
end;

procedure TForm19.FormActivate(Sender: TObject);
begin
dbgrid1.Columns[0].Width := 102;
dbgrid1.Columns[1].Width := 178;
dbgrid1.Columns[2].Width := 215;
dbgrid1.Columns[3].Width := 76;
dbgrid1.Columns[4].Width := 76;
end;

end.
