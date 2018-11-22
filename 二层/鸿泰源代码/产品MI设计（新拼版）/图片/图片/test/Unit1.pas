unit Unit1;
//download by http://down.liehuo.net
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    fcheck,fnocheck:tbitmap;

implementation

{$R *.dfm}

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
  org: TPoint;
begin
 with Sender as TStringGrid do
    if (ACol = 7) and (ARow >= FixedRows) then //在第二列显示一个ComboBox
    begin
      perform(WM_CANCELMODE, 0, 0);
      R := CellRect(ACol, ARow);
      org := Self.ScreenToClient(ClientToScreen(R.topleft));
      with ComboBox1 do
      begin
        setbounds(org.X, org.Y, R.right - R.left, height);
        itemindex := Items.IndexOf(Cells[ACol, ARow]);
        Show;
        BringTofront;
        SetFocus;
        DroppedDown := true;
      end;
    end;

end;
procedure TForm1.ComboBox1Change(Sender: TObject);
begin
    stringgrid1.Cells[ stringgrid1.Col, stringgrid1.Row]:=Trim(ComboBox1.Text);//传值给StringGrid
end;

end.

