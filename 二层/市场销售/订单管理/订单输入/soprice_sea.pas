unit soprice_sea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
 uses damo;
{$R *.dfm}

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.adoquery2.SQL.Text);
end;

end.
