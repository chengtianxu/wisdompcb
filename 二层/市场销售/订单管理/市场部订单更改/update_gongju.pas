unit update_gongju;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm11 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //aStr: array of array of string;
  end;

var
  Form11: TForm11;
  aStr: array of array of string;
  
implementation

uses damo;

{$R *.dfm}

procedure TForm11.FormCreate(Sender: TObject);
var
 i,x,y:byte;
begin
 stringgrid1.Cells[0,0] := '工具费用类别';
 stringgrid1.Cells[1,0] := '金额';
 stringgrid1.Cells[2,0] := '挂帐金额';
 stringgrid1.Cells[3,0] := '免收金额';
 stringgrid1.Cells[4,0] := '征税';
 stringgrid1.ColWidths[5] :=-1;
 WITH dm.ADOQuery1 DO
  begin
   active:=false;
   sql.Clear;            //查找工具费用类别
   sql.Add('select rkey,category,TAX_FLAG from data0061 order by rkey');
   active:=true;
   stringgrid1.RowCount:=recordcount+2;
   for i:=1 to RecordCount do
   begin
    stringgrid1.Cells[0,i]:=fieldbyname('category').AsString;
    StringGrid1.Cells[1,i]:='0.000';
    StringGrid1.Cells[2,i]:='0.000';
    StringGrid1.Cells[3,i]:='0.000';
    StringGrid1.Cells[4,i]:=fieldbyname('TAX_FLAG').AsString;
    stringgrid1.Cells[5,i]:=fieldbyname('rkey').AsString;
    next;
   end;
  end;

 with dm.ADOquery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select * from data0062 where');
   sql.Add('so_ptr='+dm.ADO60rkey.AsString);
   active := true;
   while not Eof do   //查找SO工具费用
    begin
     for i:=1 to StringGrid1.RowCount-2 do
      if strtoint(stringgrid1.Cells[5,i])=fieldbyname('addl_cat_ptr').AsInteger then
       begin
        stringgrid1.Cells[1,i]:=formatfloat('0.000',FieldValues['amount']);
        stringgrid1.Cells[2,i]:=formatfloat('0.000',FieldValues['free_amount']);
        stringgrid1.Cells[3,i]:=formatfloat('0.000',FieldValues['costfree_amount']);
        StringGrid1.Cells[4,i]:=fieldbyname('TAX_FLAG').AsString;
        break;
       end;
     Next;
    end;
  end;
  
  SetLength(aStr,StringGrid1.ColCount,StringGrid1.RowCount);
  for x:=0 to StringGrid1.ColCount-1 do
  begin
    for y:=0 to StringGrid1.RowCount-1 do
    begin
      aStr[x,y]:= StringGrid1.Cells[x,y];
    end;
  end;
end;

procedure TForm11.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (ARow=stringgrid1.RowCount-1) then
 CanSelect:=false
else
 CanSelect:=true;

 if stringgrid1.Row<>stringgrid1.RowCount-1 then
  begin
   if stringgrid1.Cells[1,stringgrid1.Row]='' then
    stringgrid1.Cells[1,stringgrid1.Row]:='0';
   if stringgrid1.Cells[2,stringgrid1.Row]='' then
    stringgrid1.Cells[2,stringgrid1.Row]:='0';
   if stringgrid1.Cells[3,stringgrid1.Row]='' then
    stringgrid1.Cells[3,stringgrid1.Row]:='0';

   stringgrid1.Cells[1,stringgrid1.Row]:=
   formatfloat('0.000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
   stringgrid1.Cells[2,stringgrid1.Row]:=
   formatfloat('0.000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
   stringgrid1.Cells[3,stringgrid1.Row]:=
   formatfloat('0.000',strtofloat(stringgrid1.Cells[3,stringgrid1.Row]));

  end;
  
end;

procedure TForm11.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else                                    //判断是否重复输入小数点'.'
 if (pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0)  then
  if key = chr(46)  then abort;

if (key <> chr(9)) then    //没有按tab键
 begin
  if (stringgrid1.Col=4) and (combobox2.Enabled) then
   begin
    ComboBox2.SetFocus;
    SendMessage(ComboBox2.Handle,WM_Char,word(Key),0);
   end;
 end;  
end;

procedure TForm11.StringGrid1Exit(Sender: TObject);
begin
   if stringgrid1.Cells[1,stringgrid1.Row]='' then
    stringgrid1.Cells[1,stringgrid1.Row]:='0';
   if stringgrid1.Cells[2,stringgrid1.Row]='' then
    stringgrid1.Cells[2,stringgrid1.Row]:='0';
   if stringgrid1.Cells[3,stringgrid1.Row]='' then
    stringgrid1.Cells[3,stringgrid1.Row]:='0';


    stringgrid1.Cells[1,stringgrid1.Row]:=
     formatfloat('0.000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
    stringgrid1.Cells[2,stringgrid1.Row]:=
     formatfloat('0.000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
    stringgrid1.Cells[3,stringgrid1.Row]:=
     formatfloat('0.000',strtofloat(stringgrid1.Cells[3,stringgrid1.Row]));
end;

procedure TForm11.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 4) then
   begin
    ComboBox2.Left := Rect.Left;
    ComboBox2.Top := Rect.Top;
    ComboBox2.Width := Rect.Right - Rect.Left+3;
    ComboBox2.Height := Rect.Bottom - Rect.Top;
    ComboBox2.Visible := True;
    combobox2.ItemIndex:=combobox2.Items.IndexOf(StringGrid1.Cells[acol,arow])
   end
  else
    ComboBox2.Visible :=false;
 end;
end;

procedure TForm11.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then stringgrid1.SetFocus;
end;

procedure TForm11.ComboBox2Change(Sender: TObject);
begin
 stringgrid1.Cells[4,stringgrid1.Row]:=combobox2.Text;
end;

end.
