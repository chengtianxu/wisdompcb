unit Result;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls,Math,Menus;
type
 TExcludeColumns = set of 0..255;
type
  TFrm_Result = class(TForm)
    Panel1: TPanel;
    SGrd: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    Popup1: TPopupMenu;
    procedure CheckBox1Click(Sender: TObject);
    procedure SetOptimalGridCellWidth(sg: TStringGrid;
  ExcludeColumns: TExcludeColumns);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrdMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Fitem_click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    FaWidth:array[0..79] of integer;
    v_RptType:Integer;
  public
    { Public declarations }
  end;

var
  Frm_Result: TFrm_Result;

implementation

uses common, Main;

{$R *.dfm}

procedure TFrm_Result.CheckBox1Click(Sender: TObject);
var
  i:integer;
  ExcludeColumns: TExcludeColumns;
begin
  for i:=0 to SGrd.ColCount-1 do
  begin
    if SGrd.ColWidths[i] < 0 then
      ExcludeColumns:=ExcludeColumns+[i];
  end;
  if CheckBox1.Checked then
    SetOptimalGridCellWidth(SGrd,ExcludeColumns)
  else
  begin
   for i:=0 to SGrd.ColCount-1 do
     if SGrd.ColWidths[i] > 0 then
       SGrd.ColWidths[i]:= FaWidth[i];
  end;
end;

procedure TFrm_Result.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Result.BitBtn2Click(Sender: TObject);
begin
  Export_Grid_to_Excel(SGrd,Application.Title);
end;

procedure TFrm_Result.SGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if ((Sender as TStringGrid).Cells[0,ARow]='') and (SGrd.RowCount>2) then
  begin
    Frm_Result.SGrd.Canvas.Font.Color:=clRed;
    Frm_Result.SGrd.Canvas.Brush.Color :=clMoneyGreen;
    Frm_Result.SGrd.Canvas.TextRect(rect,rect.Left,rect.Top,SGrd.Cells[acol,arow]);
    Frm_Result.SGrd.Canvas.FrameRect(Rect);
  end;
end;

procedure TFrm_Result.SGrdMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Column,Row: Longint;
begin
  SGrd.MouseToCell(X,Y,Column,Row);
end;

procedure TFrm_Result.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Frm_Main.i:=1;
end;

procedure TFrm_Result.FormShow(Sender: TObject);
var
  i:Byte;
  item:TMenuItem;
begin
  for i := 0 to SGrd.ColCount-1 do
  begin
    item:=TMenuItem.Create(self);
    item.Caption:=SGrd.Cells[i,0];
    item.Tag:=i;
    FaWidth[i]:=SGrd.ColWidths[i];
//    if ((v_RptType=1) and (i=8)) or ((v_RptType=1) and (i=15)) or ((v_RptType=1) and (i=19))  or ((v_RptType=1) and (i=29))  or ((v_RptType=1) and (i=30))then
//       SGrd.ColWidths[i]:=-1;
    item.Checked :=SGrd.ColWidths[i]>0 ;
    item.OnClick := Fitem_click ;
    Popup1.Items.Add(item);
  end;
end;

procedure TFrm_Result.Fitem_click(Sender: TObject);
begin
  if TMenuItem(sender).Checked then
    SGrd.ColWidths[TMenuItem(sender).Tag]:=-1
  else
    SGrd.ColWidths[TMenuItem(sender).Tag]:=FaWidth[TMenuItem(sender).Tag];
  TMenuItem(sender).Checked:=not TMenuItem(sender).Checked;
end;

procedure TFrm_Result.FormCreate(Sender: TObject);
begin
  v_RptType:=1;
end;

procedure TFrm_Result.SetOptimalGridCellWidth(sg: TStringGrid;
  ExcludeColumns: TExcludeColumns);
var
  i : Integer;
  j : Integer;
  max_width : Integer;
begin
  with sg do
  begin
    Canvas.Font.Assign(Font);
    for i := 0 to (ColCount - 1) do
    begin
      if i in ExcludeColumns then Continue;
      max_width := 0;
      for j := 0 to (RowCount - 1) do
        max_width := Math.Max(max_width,Canvas.TextWidth(Cells[i,j]));
      if max_width > 0 then
        ColWidths[i] := max_width + 4
      else
        ColWidths[i] := DefaultColWidth;
    end;
  end;
end;

procedure TFrm_Result.BitBtn4Click(Sender: TObject);
begin
  Popup1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

end.
