unit MiscEx_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,Datasnap.DBClient,
  RzGrids, Data.DB,uBaseFrm;

type
  TfrmMiscEx_Mod29 = class(TfrmBase)
    sgM: TRzStringGrid;
    btnS: TBitBtn;
    btnC: TBitBtn;
    procedure sgMKeyPress(Sender: TObject; var Key: Char);
    procedure sgMExit(Sender: TObject);
    procedure sgMSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    procedure Init_UI();
    { Public declarations }
  end;

var
  frmMiscEx_Mod29: TfrmMiscEx_Mod29;

implementation

uses  uCommFunc;


{$R *.dfm}

{ TForm1 }


procedure TfrmMiscEx_Mod29.Init_UI();
var
  LSql:string;
  LCds:TClientDataSet;
begin
  sgM.Cells[0,0] := '行';
  sgM.Cells[1,0] := '杂项费用';
  sgM.Cells[2,0] := '记税';
  sgM.Cells[3,0] := '金额';

  LCds:= TClientDataSet.Create(nil);
  try
    LSql:=' SELECT RKEY, MISC_CHARGE_CATEGORY, GEN_LED_ACCTPTR,TAXABLE  '+#13+
          ' FROM Data0199  '+#13+
          ' ORDER BY RKEY';
    gSvrIntf.IntfGetDataBySql(LSql,LCds);
    if not LCds.IsEmpty then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        sgM.Cells[0,LCds.RecNo]:=IntToStr(LCds.RecNo);
        sgM.Cells[1,LCds.RecNo]:=LCds.FieldByName('MISC_CHARGE_CATEGORY').AsString;
        sgM.Cells[2,LCds.RecNo]:=LCds.FieldByName('TAXABLE').AsString;
        sgM.Cells[3,LCds.RecNo]:='0.00';
        sgM.Cells[4,LCds.RecNo]:=LCds.FieldByName('rkey').AsString;
        LCds.Next;
        sgM.RowCount:= sgM.RowCount + 1;
      end;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMiscEx_Mod29.sgMExit(Sender: TObject);
begin
   if sgM.Cells[3,sgM.Row]='' then  sgM.Cells[3,sgM.Row]:='0';
   sgM.Cells[3,sgM.Row]:= FormatFloat('0.00',StrToFloat(sgM.Cells[3,sgM.Row]));
end;

procedure TfrmMiscEx_Mod29.sgMKeyPress(Sender: TObject; var Key: Char);
begin
 if (sgM.RowCount = 2)  then Abort;
 if (Length(sgM.Cells[3,sgM.row]) >= 9) and (key <> chr(8)) then  Abort;  //输入数字不能大于10位
 if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
 else if Key = Chr(46)  then
  if pos('.',sgM.Cells[3,sgM.row])>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmMiscEx_Mod29.sgMSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if (ACol <> 3) or (ARow = sgM.RowCount - 1) then CanSelect:= False;
end;

end.
