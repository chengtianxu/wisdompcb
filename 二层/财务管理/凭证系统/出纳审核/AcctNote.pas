unit AcctNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Menus, Mask, ComCtrls,
  ToolWin,DateUtils, ADODB, RpCon, RpConDS, RpBase, RpSystem, RpDefine,
  RpRave;

type
  TFrmAcctNote = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel2: TPanel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TMaskEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    ttype: TLabel;
    N4: TMenuItem;
    N5: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    StringGrid1: TStringGrid;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label1: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    Panel3: TPanel;
    N6: TMenuItem;
    N7: TMenuItem;
    SpeedButton7: TSpeedButton;
    Edit15: TEdit;
    Label29: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);

    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);

  private

   procedure calu();//计算本币、原币

   procedure recalculation();
   //修改
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmAcctNote: TFrmAcctNote;

implementation

uses  uMain, uDM;

{$R *.dfm}



procedure TFrmAcctNote.calu();
begin
 if  (stringgrid1.col=4) and (Stringgrid1.Cells[3,Stringgrid1.row]<>'') and
       (Stringgrid1.Cells[4,Stringgrid1.row]<>'') then
    begin
      Stringgrid1.Cells[5,Stringgrid1.row] :=
      floattostr(StrToFloat(Stringgrid1.Cells[4,Stringgrid1.row])/StrToFloat(Stringgrid1.Cells[3,Stringgrid1.row]));
    end;
  //计算原币(贷方)
  if  (stringgrid1.col=6) and (Stringgrid1.Cells[6,Stringgrid1.row]<>'') and
       (Stringgrid1.Cells[3,Stringgrid1.row]<>'') then
    begin
      Stringgrid1.Cells[4,Stringgrid1.row] :=
      floattostr(StrToFloat(Stringgrid1.Cells[6,Stringgrid1.row])*StrToFloat(Stringgrid1.Cells[3,Stringgrid1.row]));
    end;
  //计算原币(借方)
  if  (stringgrid1.col=5) and (Stringgrid1.Cells[5,Stringgrid1.row]<>'') and
       (Stringgrid1.Cells[3,Stringgrid1.row]<>'') then
    begin
      Stringgrid1.Cells[4,Stringgrid1.row] :=
      floattostr(StrToFloat(Stringgrid1.Cells[5,Stringgrid1.row])*StrToFloat(Stringgrid1.Cells[3,Stringgrid1.row]));
    end;
end;

procedure TFrmAcctNote.FormCreate(Sender: TObject);
begin
  stringgrid1.cells[0,0]:='摘    要';
  stringgrid1.cells[1,0]:='科目代号/名称';
  stringgrid1.cells[2,0]:='币种';
  stringgrid1.cells[3,0]:='汇率';
  stringgrid1.cells[4,0]:='原币金额';
  stringgrid1.cells[5,0]:='借方(本币)金额';
  stringgrid1.cells[6,0]:='贷方(本币)金额';
end;

procedure TFrmAcctNote.DrawGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IF acol=1 then canselect:=false;
end;

procedure TFrmAcctNote.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If arow=0 then
  begin
    If acol<=3 then
    Stringgrid1.Canvas.TextRect(rect,rect.Left+(rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[acol,arow])-rect.Left) div 2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]	) else
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[aCol,aRow])-2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]	);
    exit;
  end;
  If acol>3 then
  if trim(Stringgrid1.Cells[aCol,aRow])<>'' then
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(format('%.2f',[strtofloat(Stringgrid1.Cells[aCol,aRow])]))-2,
        rect.Top+2, format('%.2f',[strtofloat(Stringgrid1.Cells[aCol,aRow])])	);
end;

procedure TFrmAcctNote.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  i,j:integer;
  vstr:string;

begin

  //IF acol=1 then canselect:=false; //科目名称
  //IF acol=2 then canselect:=false; //币种
  //IF acol=3 then canselect:=false; //汇率
  IF arow=stringgrid1.RowCount-1 then canselect:=false;

  IF stringgrid1.col<4 then exit;
  vstr:=Stringgrid1.Cells[stringgrid1.col,Stringgrid1.row];
  i:=pos('.',vstr);
  j:=i;

  while pos('.',vstr)>0 do
  begin
    i:=pos('.',vstr);
    vstr:=copy(vstr,1,i-1)+copy(vstr,i+1,length(vstr)-i);
  end;
  if j>0 then
    Stringgrid1.Cells[stringgrid1.col,Stringgrid1.row]:=copy(vstr,1,j-1)+'.'+copy(vstr,j,length(vstr)-j+1);

  if trim(Stringgrid1.Cells[Stringgrid1.Col,Stringgrid1.row])<>'' then
  begin
    Str(strtofloat(Stringgrid1.Cells[Stringgrid1.Col,Stringgrid1.row]):15:2,vstr);
    Stringgrid1.Cells[stringgrid1.col,Stringgrid1.row]:=trim(vstr);

  end;
  try
  //计算本币
  if stringgrid1.row<> stringgrid1.Rowcount-1 then
    calu;

 except
     on E: Exception do showmessage(E.Message);
 end;
  recalculation();
end;
//增加科目
procedure TFrmAcctNote.N1Click(Sender: TObject);
begin

end;
//更改货币
procedure TFrmAcctNote.N3Click(Sender: TObject);
begin

end;

//删除分录
procedure TFrmAcctNote.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin

  if stringgrid1.Col>3 then
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0
     then
      abort;
    if stringgrid1.col=5 then stringgrid1.Cells[6,stringgrid1.Row]:='';
    if stringgrid1.col=6 then stringgrid1.Cells[5,stringgrid1.Row]:='';
  end;
end;
//合计
procedure TFrmAcctNote.recalculation();
var i:integer;
  vdb,vcr:real;
begin
  vdb:=0;
  vcr:=0;
  for i:=1 to stringgrid1.rowcount-2 do
  begin
    if trim(stringgrid1.Cells[5,i])<>'' then
    vdb:=vdb+strtofloat(stringgrid1.Cells[5,i]);
    if trim(stringgrid1.Cells[6,i])<>'' then
    vcr:=vcr+strtofloat(stringgrid1.Cells[6,i]);
  end;
  edit2.Text :=format('%.2f',[vdb]);
  edit3.Text :=format('%.2f',[vcr]);
end;

procedure TFrmAcctNote.FormActivate(Sender: TObject);
begin
  recalculation();
end;

procedure TFrmAcctNote.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    abort
end;


procedure TFrmAcctNote.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if stringgrid1.Col=0 then
    if key=vk_right then
      stringgrid1.Col:=2;
  if stringgrid1.Col=2 then
    if key=vk_left then stringgrid1.Col:=0;
end;
//摘要
procedure TFrmAcctNote.N5Click(Sender: TObject);
begin

end;
 //复制摘要
procedure TFrmAcctNote.N7Click(Sender: TObject);
begin
    stringgrid1.Cells[0,  stringgrid1.Row]:=stringgrid1.Cells[0,  stringgrid1.Row-1];

end;
procedure TFrmAcctNote.PopupMenu1Popup(Sender: TObject);
begin
  if stringgrid1.row=stringgrid1.RowCount-1 then
  begin
    n2.Enabled :=false;
    n3.Enabled :=false;
    n5.Enabled :=false;
  end else
  begin
    n2.Enabled :=true;
    n3.Enabled :=true;
    n5.Enabled :=true;
  end;
end;
//退出
procedure TFrmAcctNote.SpeedButton8Click(Sender: TObject);
begin
  close;
end;
//保存
procedure TFrmAcctNote.SpeedButton9Click(Sender: TObject);
begin



end;

//修改科目
procedure TFrmAcctNote.N6Click(Sender: TObject);
begin

end;

//改变凭证号、会计期间
procedure TFrmAcctNote.DateTimePicker1Change(Sender: TObject);

begin

  //月份
end;
procedure TFrmAcctNote.StringGrid1Exit(Sender: TObject);

var vstr:string;
begin
  if stringgrid1.col<4 then exit;

  if trim(Stringgrid1.Cells[Stringgrid1.Col,Stringgrid1.row])<>'' then
  begin
    Str(strtofloat(Stringgrid1.Cells[Stringgrid1.Col,Stringgrid1.row]):15:2,vstr);
    Stringgrid1.Cells[stringgrid1.col,Stringgrid1.row]:=trim(vstr);
  end;
  //计算本币
  if stringgrid1.row<> stringgrid1.Rowcount-1 then
    calu;
  recalculation();
end;

//打印
end.

