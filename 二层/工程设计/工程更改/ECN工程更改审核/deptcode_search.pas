unit deptcode_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TForm_deptcode = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADODataSet;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1PRINTING_RESOURCE: TStringField;
    StringGrid1: TStringGrid;
    Image1: TImage;
    Image2: TImage;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_deptcode: TForm_deptcode;

implementation

uses DAMO;



{$R *.dfm}

procedure TForm_deptcode.FormCreate(Sender: TObject);
var
 i:integer;
begin
 adoquery1.Open;

stringgrid1.RowCount:=adoquery1.RecordCount+1;
stringgrid1.Cells[0,0]:='工序代码';
stringgrid1.Cells[1,0]:='工序名称';
stringgrid1.Cells[2,0]:='负责人';
stringgrid1.Cells[3,0]:='选择';
for i:=1 to adoquery1.RecordCount do
begin
 stringgrid1.Cells[0,i]:=self.ADOQuery1DEPT_CODE.Value;
 stringgrid1.Cells[1,i]:=self.ADOQuery1DEPT_NAME.Value;
 stringgrid1.Cells[2,i]:=self.ADOQuery1PRINTING_RESOURCE.Value;
 stringgrid1.Cells[3,i]:='0';
 adoquery1.Next;
end;

end;

procedure TForm_deptcode.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (acol=3) then
 stringgrid1.Canvas.TextRect(rect,
        rect.Left+10,
        rect.Top+2,
        stringgrid1.Cells[acol,aRow]);

if (acol=3) and (arow>0) then
 IF strtoint(stringgrid1.Cells[acol,arow])=0 THEN
  Stringgrid1.Canvas.Draw(rect.Left+8,rect.Top,image1.Picture.Graphic)
 else
  Stringgrid1.Canvas.Draw(rect.Left+8,rect.Top,image2.Picture.Graphic);
end;

procedure TForm_deptcode.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
 stringgrid1.MouseToCell(x,y,column,row);
 if (button=mbleft) and (row > 0) and (column = 3) then //标题点击不算
 begin
  IF strtoint(stringgrid1.Cells[3,stringgrid1.row])=0 THEN //选中
   begin
    stringgrid1.Cells[3,stringgrid1.row]:='1';
    edit1.Text:=inttostr(strtoint(edit1.Text)+1);
    if not button1.Enabled then button1.Enabled:=true;
   end
  else        //放弃
   begin
    stringgrid1.Cells[3,stringgrid1.row]:='0';
    edit1.Text:=inttostr(strtoint(edit1.Text)-1);
    if strtoint(edit1.Text)=0 then button1.Enabled:=false;
   end;
 end;
end;

end.
