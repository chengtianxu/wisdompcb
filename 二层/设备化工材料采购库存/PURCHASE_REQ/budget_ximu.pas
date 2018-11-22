unit budget_ximu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    editor1: TStringGrid;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure editor1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
begin
 editor1.Cells[0,0] := '月份';
 editor1.Cells[1,0] := '限额';
 editor1.Cells[2,0] := '已被使用';
 editor1.Cells[0,1] := '1 月份';
 editor1.Cells[0,2] := '2 月份';
 editor1.Cells[0,3] := '3 月份';
 editor1.Cells[0,4] := '4 月份';
 editor1.Cells[0,5] := '5 月份';
 editor1.Cells[0,6] := '6 月份';
 editor1.Cells[0,7] := '7 月份';
 editor1.Cells[0,8] := '8 月份';
 editor1.Cells[0,9] := '9 月份';
 editor1.Cells[0,10] := '10月份';
 editor1.Cells[0,11] := '11月份';
 editor1.Cells[0,12] := '12月份';
 editor1.Cells[0,13] := '全年合计'; 
end;

procedure TForm5.editor1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
IF Acol>0 then
 editor1.Canvas.TextRect(rect,rect.right-editor1.Canvas.TextWidth(editor1.Cells[acol,arow])-2,rect.Top+2,editor1.Cells[acol,aRow]);
//上面代码为stringgrid控件的右对齐
end;

end.
