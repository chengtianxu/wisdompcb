unit edit_misc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm7 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
implementation
uses damo;
{$R *.dfm}

procedure TForm7.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0] := '行';
 stringgrid1.Cells[1,0] := '杂项费用';
 stringgrid1.Cells[2,0] := '记税';
 stringgrid1.Cells[3,0] := '金额';
end;

procedure TForm7.FormCreate(Sender: TObject);
var
 i:byte;
begin
 with dm.ADOQuery1 do
  begin
   active := false;
   sql.Clear;
   sql.Add('select rkey,MISC_CHARGE_CATEGORY,TAXABLE from data0199');
   sql.Add('order by rkey');
   active := true;
   stringgrid1.RowCount:=recordcount+2;
   for i:=1 to RecordCount do
   begin
    stringgrid1.Cells[0,i] := inttostr(i);
    stringgrid1.Cells[1,i] := fieldbyname('MISC_CHARGE_CATEGORY').AsString;
    StringGrid1.Cells[2,i] := fieldbyname('TAXABLE').AsString;
    StringGrid1.Cells[3,i] := '0.00';
    StringGrid1.Cells[4,i] := fieldbyname('rkey').AsString;
    next;
   end;
  end;
end;

procedure TForm7.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if stringgrid1.RowCount=2 then abort;
 if (length(stringgrid1.Cells[3,stringgrid1.row])>=9) and (key <> chr(8)) then
   abort;  //输入数字不能大于10位
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
 else
 if key = chr(46)  then
 if pos('.',stringgrid1.Cells[3,stringgrid1.row])>0 then     //判断是否重复输入小数点'.'
  abort;
end;

procedure TForm7.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (acol = 4) or (arow=stringgrid1.RowCount-1) then
 canselect:=false;
if stringgrid1.Cells[3,stringgrid1.Row]='' then
 stringgrid1.Cells[3,stringgrid1.Row]:='0';
stringgrid1.Cells[3,stringgrid1.Row]:=
  formatfloat('0.00',strtofloat(stringgrid1.Cells[3,stringgrid1.Row]));
end;

procedure TForm7.StringGrid1Exit(Sender: TObject);
begin
   if stringgrid1.Cells[3,stringgrid1.Row]='' then
    stringgrid1.Cells[3,stringgrid1.Row]:='0';
   stringgrid1.Cells[3,stringgrid1.Row]:=
   formatfloat('0.00',strtofloat(stringgrid1.Cells[3,stringgrid1.Row]));
end;

end.
