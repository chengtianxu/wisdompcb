unit total_count;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Grids, StdCtrls, ExtCtrls,ComObj, Excel2000;

type
  TForm6 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    StringGrid2: TStringGrid;
    Image1: TImage;
    Image2: TImage;
    Button3: TButton;
    procedure FormResize(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    v_colwidth: array[0..7] of integer;
  public
    { Public declarations }
     if_update: array of integer;
  end;

var
  Form6: TForm6;

implementation



{$R *.dfm}

procedure TForm6.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 7 do
 stringgrid1.ColWidths[i]:=self.v_colwidth[i]+round((stringgrid1.Width-738)*self.v_colwidth[i]/710);
end;


procedure TForm6.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm6.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if (arow=StringGrid1.RowCount-1) then canselect:=false;
if acol=7 then
 stringgrid1.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine]
else
 if acol=6 then
 stringgrid1.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing];
end;

procedure TForm6.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if stringgrid1.Col=7 then
  if if_update[stringgrid1.Row-1]=1 then
   if_update[stringgrid1.Row-1]:=2
  else
   if_update[stringgrid1.Row-1]:=1;
end;


procedure TForm6.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol=6) or (acol=5) then
 stringgrid1.Canvas.TextRect(rect,
 rect.right-stringgrid1.Canvas.TextWidth(stringgrid1.Cells[acol,arow])-2,
 rect.Top+2,
 stringgrid1.Cells[acol,aRow]);

if (acol=7) and (arow>0) and (arow<>stringgrid1.RowCount-1) then
 IF if_update[arow-1]=1 THEN
  Stringgrid1.Canvas.Draw(rect.Left+12,rect.Top+2,image1.Picture.Graphic)
 else
  Stringgrid1.Canvas.Draw(rect.Left+12,rect.Top+2,image2.Picture.Graphic);
end;

procedure TForm6.FormCreate(Sender: TObject);
var
i:byte;
begin
for i:=0 to 7 do
  self.v_colwidth[i]:=stringgrid1.ColWidths[i];
end;

procedure TForm6.Button3Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
  begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
  end;

  try
   XLApp := CreateOleObject('Excel.Application');
  except
   Screen.Cursor := crDefault;
   Exit;
  end;

 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := 1;

   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];

   for iCount := 0 to stringgrid1.ColCount - 2 do
    Sheet.Cells[1, iCount + 1 ] := stringgrid1.Cells[icount,0];

   for jcount :=1 to stringgrid1.RowCount-2 do
    for iCount := 0 to stringgrid1.ColCount - 2 do
     Sheet.Cells[jCount + 1, iCount + 1] := stringgrid1.Cells[iCount,jcount];

   XlApp.Visible := True;
   Screen.Cursor := crDefault;
end;

end.
