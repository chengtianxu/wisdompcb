unit MulPrinUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TMulPrinForm1 = class(TForm)
    Label1: TLabel;
    StG1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    StG2: TStringGrid;
    Label2: TLabel;
    Button5: TButton;
    Button6: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MulPrinForm1: TMulPrinForm1;

implementation

{$R *.dfm}

procedure TMulPrinForm1.Button5Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TMulPrinForm1.Button1Click(Sender: TObject);
var
  i,j :integer;
begin
  if StG1.Row = 0 then exit;
  if StG1.Row = StG1.RowCount - 1 then exit;
  //n := 0;
  for j := StG1.Selection.Top to StG1.Selection.Bottom do
      begin
          if j <> StG1.RowCount - 1 then
              begin
                  StG2.RowCount := StG2.RowCount + 1;
                  StG2.Cells[0,StG2.RowCount - 2] := StG1.Cells[0,j];//StG1.Row] ;
              end ;
          //n := n + 1;
      end;
  //showmessage(inttostr(n)+'  '+inttostr(StG1.Selection.Top)+'  '+inttostr(StG1.Selection.Bottom));

  for i :=  StG1.Selection.Top  to StG1.RowCount - 2 do
      begin
           StG1.Cells[0,i] := StG1.Cells[0,i + 1 + StG1.Selection.Bottom - StG1.Selection.top] ;
      end;

  if StG1.Selection.Bottom = StG1.RowCount - 1 then
      StG1.RowCount := StG1.RowCount  - StG1.Selection.Bottom + StG1.Selection.top
  else
      StG1.RowCount := StG1.RowCount - 1 - StG1.Selection.Bottom + StG1.Selection.top;
  StG2.Cells[0,StG2.RowCount - 1] := '';


  {}
end;

procedure TMulPrinForm1.Button3Click(Sender: TObject);
var
  i,j :integer;
begin
  if StG2.Row = 0 then exit;
  if StG2.Row = StG2.RowCount - 1 then exit;
  for j:= StG2.Selection.Top to StG2.Selection.Bottom do
      begin
          if j <> StG2.RowCount - 1 then
              begin
                  StG1.RowCount := StG1.RowCount + 1;
                  StG1.Cells[0,StG1.RowCount - 2] := StG2.Cells[0,j];//StG2.Row] ;
              end ;
      end;
  for i :=  StG2.Selection.Top  to StG2.RowCount - 2 do
     begin
         StG2.Cells[0,i] := StG2.Cells[0,i + 1 + StG2.Selection.Bottom - StG2.Selection.top] ;
     end;
  if StG2.RowCount - 1 = StG2.Selection.Bottom then
      StG2.RowCount := StG2.RowCount - StG2.Selection.Bottom + StG2.Selection.top
  else
      StG2.RowCount := StG2.RowCount - 1 - StG2.Selection.Bottom + StG2.Selection.top ;
  StG1.Cells[0,StG1.RowCount - 1] := '';
end;

procedure TMulPrinForm1.Button2Click(Sender: TObject);
var
  i :integer;
begin
  //if StG1.Row = 0 then exit;
  if StG1.RowCount = 2 then exit;
  for i := 1 to StG1.RowCount - 2 do // StG1.Row
      begin
          StG2.RowCount := StG2.RowCount + 1;
          StG2.Cells[0,StG2.RowCount - 2] := StG1.Cells[0,i] ;
      end ;
  StG1.RowCount := 2 ;
  StG1.Cells[0,1] := '';

end;

procedure TMulPrinForm1.Button4Click(Sender: TObject);
var
  i :integer;
begin
  //if StG2.Row = 0 then exit;
  if StG2.RowCount = 2 then exit;
  for i :=  1  to StG2.RowCount - 2 do
      begin
          StG1.RowCount := StG1.RowCount + 1;
          StG1.Cells[0,StG1.RowCount - 2] := StG2.Cells[0,i] ;
      end;
  StG2.RowCount := 2;
  StG2.Cells[0,1] := '' ;

  

end;

end.
