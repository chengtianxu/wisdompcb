unit Unit2;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes,Grids,QDBGrids,Types

   ,Graphics, Controls,
  Dialogs, ExtCtrls, StdCtrls, DBGridEh, Mask,
  DBCtrls, ComCtrls ;
//用下面的函数应该可以
type
  TWrapGrid =class(TCustomGrid)
  private
    { Private declarations }
  public
    { Public declarations }
    function GetColRectText(DBGrid: TDBGrid): string;overload;
    function GetColRectText(DBGrid: TDBGridEh): string;overload;
  end;


implementation

{ TWrapGrid }

function TWrapGrid.GetColRectText(DBGrid: TDBGrid): string;
var
 MCoord: TGridCoord;//TGridCoord;  TGridCoord
 P: TPoint;
begin
 GetCursorPos(P);
 P := DBGrid.ScreenToClient(P);
 MCoord.X  := DBGrid.MouseCoord(p.X,p.y).X ;
 MCoord.y  := DBGrid.MouseCoord(p.X,p.y).y ;
 //MCoord := DBGrid.MouseCoord(P.X, P.Y);

 if (MCoord.X >= 0) and (MCoord.Y >= 0) then
   Result := TWrapGrid(DBGrid).Text;
end;


function TWrapGrid.GetColRectText(DBGrid: TDBGridEh): string;
var
 MCoord: TGridCoord;//TGridCoord;  TGridCoord
 P: TPoint;
begin
 GetCursorPos(P);
 P := DBGrid.ScreenToClient(P);
 MCoord.X  := DBGrid.MouseCoord(p.X,p.y).X ;
 MCoord.y  := DBGrid.MouseCoord(p.X,p.y).y ;
 //MCoord := DBGrid.MouseCoord(P.X, P.Y);

 if (MCoord.X >= 0) and (MCoord.Y >= 0) then
   Result := TWrapGrid(DBGrid).Text;
end;

end.
 