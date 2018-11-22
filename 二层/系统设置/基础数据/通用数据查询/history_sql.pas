unit history_sql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.StringGrid1DblClick(Sender: TObject);
begin
 if stringgrid1.Row<> stringgrid1.RowCount-1 then
  self.ModalResult:=mrok;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
 stringgrid1.ColWidths[0]:=stringgrid1.Width;
end;

procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then
  self.ModalResult:=mrcancel;
end;

end.
