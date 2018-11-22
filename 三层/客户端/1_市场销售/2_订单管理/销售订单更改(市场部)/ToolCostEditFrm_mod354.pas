unit ToolCostEditFrm_mod354;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseeditFrm,uCommFunc, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, uBaseFrm, Vcl.Buttons, Data.DB, Datasnap.DBClient;

type
  TfrmToolCostEdit_mod354 = class(TfrmBaseedit)
    SG1: TStringGrid;
    cbb1: TComboBox;
    cdsTemp: TClientDataSet;
    procedure btnCloseClick(Sender: TObject);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure SG1Exit(Sender: TObject);
    procedure SG1KeyPress(Sender: TObject; var Key: Char);
    procedure SG1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbb1Change(Sender: TObject);
    procedure cbb1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbb1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Frkey60:integer;
   LStr: array of array of string;
  end;

var
  frmToolCostEdit_mod354: TfrmToolCostEdit_mod354;
 // LStr: array of array of string;
implementation

{$R *.dfm}

procedure TfrmToolCostEdit_mod354.btnCloseClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmToolCostEdit_mod354.btnSaveClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrok;
end;

procedure TfrmToolCostEdit_mod354.cbb1Change(Sender: TObject);
begin
  inherited;
 sg1.Cells[4,sg1.Row]:=cbb1.Text;
end;

procedure TfrmToolCostEdit_mod354.cbb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if key=13 then sg1.SetFocus;
end;

procedure TfrmToolCostEdit_mod354.cbb1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // if key=13 then sg1.SetFocus;
end;

procedure TfrmToolCostEdit_mod354.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 //Action := cafree;
// frmToolCostEdit_mod354:=nil;
end;

procedure TfrmToolCostEdit_mod354.FormShow(Sender: TObject);
var
 i,x,y:byte;
 Lsql:string;
begin
inherited;
   SG1.Cells[0,0] := '工具费用类别';
   SG1.Cells[1,0] := '金额';
   SG1.Cells[2,0] := '挂帐金额';
   SG1.Cells[3,0] := '免收金额';
   SG1.Cells[4,0] := '征税';
   SG1.ColWidths[5] :=-1;

   //查找工具费用类别
   Lsql:='select rkey,category,TAX_FLAG from data0061 order by rkey';
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
   SG1.RowCount:=cdstemp.recordcount+2;
   while not cdstemp.eof  do
   for i:=1 to cdstemp.RecordCount do
   begin
    SG1.Cells[0,i]:=cdstemp.fieldbyname('category').AsString;
    SG1.Cells[1,i]:='0.000';
    SG1.Cells[2,i]:='0.000';
    SG1.Cells[3,i]:='0.000';
    SG1.Cells[4,i]:=cdstemp.fieldbyname('TAX_FLAG').AsString;
    SG1.Cells[5,i]:=cdstemp.fieldbyname('rkey').AsString;
    cdstemp.next;
   end;

   Lsql:='select * from data0062 where'+
    ' so_ptr='+inttostr(Frkey60);
    gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

   while not cdstemp.Eof do   //查找SO工具费用
    begin
     for i:=1 to SG1.RowCount-2 do
      if strtoint(SG1.Cells[5,i])=cdstemp.fieldbyname('ADDL_CAT_PTR').AsInteger then
       begin
        SG1.Cells[1,i]:=formatfloat('0.000',cdstemp.FieldValues['amount']);
        SG1.Cells[2,i]:=formatfloat('0.000',cdstemp.FieldValues['free_amount']);
        SG1.Cells[3,i]:=formatfloat('0.000',cdstemp.FieldValues['costfree_amount']);
        SG1.Cells[4,i]:=cdstemp.fieldbyname('TAX_FLAG').AsString;
        break;
       end;
     cdstemp.Next;
    end;

    SetLength(LStr,SG1.ColCount,SG1.RowCount);
    for x:=0 to SG1.ColCount-1 do
    begin
      for y:=0 to SG1.RowCount-1 do
      begin
        LStr[x,y]:= SG1.Cells[x,y];
      end;
    end;
end;

procedure TfrmToolCostEdit_mod354.SG1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
if (gdSelected  in State) then
 begin
  if (ACol = 4) then
   begin
    cbb1.Left := Rect.Left;
    cbb1.Top := Rect.Top;
    cbb1.Width := Rect.Right - Rect.Left+3;
    cbb1.Height := Rect.Bottom - Rect.Top;
    cbb1.Visible := True;
    cbb1.ItemIndex:=cbb1.Items.IndexOf(sg1.Cells[acol,arow])
   end
  else
    cbb1.Visible :=false;
 end;
end;

procedure TfrmToolCostEdit_mod354.SG1Exit(Sender: TObject);
begin
  inherited;
  if sg1.Cells[1,sg1.Row]='' then
    sg1.Cells[1,sg1.Row]:='0';
   if sg1.Cells[2,sg1.Row]='' then
    sg1.Cells[2,sg1.Row]:='0';
   if sg1.Cells[3,sg1.Row]='' then
    sg1.Cells[3,sg1.Row]:='0';

    sg1.Cells[1,sg1.Row]:=
     formatfloat('0.000',strtofloat(sg1.Cells[1,sg1.Row]));
    sg1.Cells[2,sg1.Row]:=
     formatfloat('0.000',strtofloat(sg1.Cells[2,sg1.Row]));
    sg1.Cells[3,sg1.Row]:=
     formatfloat('0.000',strtofloat(sg1.Cells[3,sg1.Row]));
end;

procedure TfrmToolCostEdit_mod354.SG1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else                                    //判断是否重复输入小数点'.'
 if (pos('.',sg1.Cells[sg1.col,sg1.row])>0)  then
  if key = chr(46)  then abort;

if (key <> chr(9)) then    //没有按tab键
 begin
  if (sg1.Col=4) and (cbb1.Enabled) then
   begin
    cbb1.SetFocus;
    SendMessage(cbb1.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TfrmToolCostEdit_mod354.SG1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  if (ARow=sg1.RowCount-1) then
   CanSelect:=false
  else
   CanSelect:=true;

  if sg1.Row<>sg1.RowCount-1 then
  begin
   if sg1.Cells[1,sg1.Row]='' then
    sg1.Cells[1,sg1.Row]:='0';
   if sg1.Cells[2,sg1.Row]='' then
    sg1.Cells[2,sg1.Row]:='0';
   if sg1.Cells[3,sg1.Row]='' then
    sg1.Cells[3,sg1.Row]:='0';

   sg1.Cells[1,sg1.Row]:=
   formatfloat('0.000',strtofloat(sg1.Cells[1,sg1.Row]));
   sg1.Cells[2,sg1.Row]:=
   formatfloat('0.000',strtofloat(sg1.Cells[2,sg1.Row]));
   sg1.Cells[3,sg1.Row]:=
   formatfloat('0.000',strtofloat(sg1.Cells[3,sg1.Row]));
  end;
end;

end.
