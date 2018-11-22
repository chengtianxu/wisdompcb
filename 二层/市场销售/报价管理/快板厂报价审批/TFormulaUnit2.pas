unit TFormulaUnit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VCLCom, StdVcl, bdemts, DataBkr, DBClient,Grids, DBGrids,
  DB, ADODB, Provider,variants,winsock,Midas,ComConst,StrUtils,DBTables;


type
   TMyFormula2 = class

   private
     ADoQuery1: TADoQuery;

   public
      Constructor Create(AdoConn: TAdoConnection);
      Destructor Destroy;override;

      //处理计算公式
      function ProcessMyFormula(const value:string):boolean;



   end;

implementation

{ TMyFormula2 }

constructor TMyFormula2.Create(AdoConn: TAdoConnection);
begin
   ADoQuery1 := TADoQuery.Create(nil) ;
   ADoQuery1.Connection := AdoConn ;

end;

destructor TMyFormula2.Destroy;
begin
  if ADoQuery1 <> nil then
      ADoQuery1.Free ;

  inherited;
end;
////处理计算公式
function TMyFormula2.ProcessMyFormula(const value: string): boolean;
const
   TOperator = ['+','-','*','/','(',')',',','''','>','<','='] ;
var
   s: widestring ;
   s1,s2:string ;
   i ,i1: integer ;
begin
   s := widestring(value) ;
   showmessage(s+'   '+inttostr(length(s))) ;
   i1 := 1;
   s2 := '';
   for i := 0 to length(s)-1 do
       begin
           s1 := s[i] ;
           s2 := s2 + s1 ;
           if char(s[i]) in TOperator then
               begin
                   showmessage(copy(s,i1,i-i1)) ;
                   s2 := '' ;
                   i1 := i + 1 ;
               end ;
       end ;


end;



end.
