unit searchso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Buttons, StdCtrls, ComCtrls, ExtCtrls;

type
  Tsearchso_Form = class(TForm)
    ADS60: TADODataSet;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox6: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    ADS60RKEY: TIntegerField;
    ADS60SALES_ORDER: TStringField;
    ADS60v_status: TStringField;
    ADS60SCH_DATE: TDateTimeField;
    ADS60PO_NUMBER: TStringField;
    ADS60ABBR_NAME: TStringField;
    ADS60CUST_CODE: TStringField;
    ADS60MANU_PART_DESC: TStringField;
    ADS60MANU_PART_NUMBER: TStringField;
    ADS60REFERENCE_NUMBER: TStringField;
    ADS60ANALYSIS_CODE_2: TStringField;
    DBGrid1: TDBGrid;
    ADS60set_qty: TIntegerField;
    intgrfldADS60REPUT_QTY: TIntegerField;
    fltfldADS60pack_qianshu: TFloatField;
    fltfldADS60AllParts: TFloatField;
    procedure dtpk1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    PreColumn: TColumn;
  public
    { Public declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
    //返回值：0= 失败,1=通过，2=有回复交期更早的，3=同交期有订单号在前的，4=打印超过订单数量
    class function CheckPOOrder(AMan_part_Number,APO: string ): Integer;
  end;

var
  searchso_Form: Tsearchso_Form;

implementation

uses DM, StrUtils, WZ_gUnit;

{$R *.dfm}

procedure Tsearchso_Form.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure Tsearchso_Form.dtpk1Exit(Sender: TObject);
begin
  ads60.Close;
  ads60.Parameters[0].Value:=dtpk1.Date;
  ads60.Parameters[1].Value:=dtpk2.Date+1;
  ads60.Open;
end;

procedure Tsearchso_Form.CheckBox1Click(Sender: TObject);
begin
 ads60.Close;
if not checkbox1.Checked then
 ads60.Parameters[2].Value:=1      //有效的
else
 ads60.Parameters[2].Value:=0;
if not checkbox2.Checked then             //暂缓
 ads60.Parameters[3].Value:=2
else
 ads60.Parameters[3].Value:=0;
if not checkbox3.Checked then           //已结算
 ads60.Parameters[4].Value:=3
else
 ads60.Parameters[4].Value:=0;
if not checkbox4.Checked then           //已完成
 ads60.Parameters[5].Value:=4
else
 ads60.Parameters[5].Value:=0;
if not checkbox5.Checked then           //已取消
 ads60.Parameters[6].Value:=5
else
 ads60.Parameters[6].Value:=0;
if not checkbox6.Checked then           //未提交
 ads60.Parameters[7].Value:=6
else
 ads60.Parameters[7].Value:=0;
 ads60.open;
end;

procedure Tsearchso_Form.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS60.CommandText);

 if (key=13) and (not ADS60.IsEmpty) then
 ModalResult:=mrok;
end;

procedure Tsearchso_Form.DBGrid1TitleClick(Column: TColumn);
begin
  if self.PreColumn <> column then
   ads60.IndexFieldNames:=Column.FieldName;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure Tsearchso_Form.FormActivate(Sender: TObject);
begin
PreColumn:=self.DBGrid1.Columns[2];
end;

procedure Tsearchso_Form.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   ads60.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else ads60.filter := '';
end;

procedure Tsearchso_Form.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
end;

procedure Tsearchso_Form.DBGrid1DblClick(Sender: TObject);
begin
if (not ads60.IsEmpty) then
begin
  Button1Click(Self);
end;
end;

procedure Tsearchso_Form.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads60.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure Tsearchso_Form.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure Tsearchso_Form.Button1Click(Sender: TObject);
//var
//  n: Integer;
//  I : Integer;
begin
//  with ADS60 do
//  begin
//    if IsEmpty then Exit;
//    n := RecNo;
//    try
//      DisableControls;
//      First;
//      for I := 0 to n - 1 do
//      begin
//        if I = 0 then Continue;
//        if FieldByName('REPUT_QTY').AsInteger < FieldByName('PARTS_ORDERED').AsInteger then
//        begin
//          if MessageBox(Handle,'有回复交期更早的标签没有打印','提示', MB_YESNO) = ID_NO then
//          begin
//            RecNo := n;
//            Exit;
//          end else
//          begin
//            RecNo := n;
//            Break;
//          end;
//        end;
//        Next;
//      end;
//    finally
//      EnableControls;
//    end;
//  end;
//  ModalResult := mrOk;
  if ADS60.IsEmpty then Exit;
  //0= 失败,1=通过，2=有回复交期更早的，3=同交期有订单号在前的，4=打印超过订单数量
  {
  case CheckPOOrder(ADS60.fieldbyname('MANU_PART_NUMBER').AsString,ADS60.fieldbyname('SALES_ORDER').AsString ) of
    0:
    begin
      ModalResult := mrOk;
    end;
    1:
    begin
      ModalResult := mrOk;
    end;
    2:
    begin
      if gUser.User_Permit <> '4' then
      begin
        ShowMessage('有回复交期更早的订单，普通权限禁止打印，如需打印请用高级权限');
        Exit;
      end else
        ModalResult := mrOk;
    end;
    3:
    begin
      if gUser.User_Permit <> '4' then
      begin
        ShowMessage('有靠前的订单号没打印，普通权限禁止打印，如需打印请用高级权限');
        Exit;
      end else
        ModalResult := mrOk;
    end;
    4:
    begin
      if gUser.User_Permit <> '4' then
      begin
        ShowMessage('该订单已经打印标签数量已经超出，普通权限禁止打印，如需打印请用高级权限');
        Exit;
      end else
        ModalResult := mrOk;
    end;
  end;
  }

  DM1.Config60REPUT_QTY(ADS60RKEY.AsString);
  ModalResult := mrOk;
end;

class function Tsearchso_Form.CheckPOOrder(AMan_part_Number,
  APO: string): Integer;
var
  LQry1,LQry2: TADOQuery;
  LSqlStr: string;
  pono1,pono2: Integer;
  I: Integer;
begin
  LQry1 := TADOQuery.Create(nil);
  LQry2 := TADOQuery.Create(nil);
  LQry1.Connection := DM1.con1;
  LQry2.Connection := DM1.con1;
  try
    //查出当前已选订单的信息
    LQry1.Close;
    LQry1.SQL.Clear;
    LQry1.SQL.Add('SELECT * FROM Data0060 WHERE SALES_ORDER = ' + QuotedStr(APO));
    LQry1.Open;
    if LQry1.FieldByName('REPUT_QTY').AsInteger >= (LQry1.FieldByName('PARTS_ORDERED').AsInteger + LQry1.FieldByName('PARTS_RETURNED').AsInteger) then
    begin
      Result := 4;
      Exit;
    end;
    //查找本厂编号相同的订单
    LQry2.Close;
    LQry2.SQL.Clear;
    LSqlStr :=
      ' select D60.SALES_ORDER, D60.SCH_DATE,D60.PARTS_ORDERED,D60.REPUT_QTY,D60.PARTS_RETURNED from data0060 D60 ' +
      ' inner join data0025 d25 on d25.rkey = d60.CUST_PART_PTR ' +
      ' where d25.MANU_PART_NUMBER = ' + QuotedStr(AMan_part_Number) +' and (D60.REPUT_QTY < (D60.PARTS_RETURNED + D60.PARTS_ORDERED)) ' +
      ' and d60.SALES_ORDER <> ' + QuotedStr(APO)  +
      ' and d60.status = 1 ' +
      ' order by D60.SCH_DATE asc' ;
    LQry2.SQL.Add(LSqlStr);
    LQry2.Open;
    //回复交期对比
    while not LQry2.Eof do
    begin
      if LQry2.FieldByName('SCH_DATE').AsDateTime < LQry1.FieldByName('SCH_DATE').AsDateTime then
      begin
        Result := 2;
        Exit;
      end;
      LQry2.Next;
    end;
    for I := length(LQry1.fieldbyname('SALES_ORDER').AsString) downto 1 do
    begin
      if (LQry1.fieldbyname('SALES_ORDER').AsString[I] = '_') or (LQry1.fieldbyname('SALES_ORDER').AsString[I] = '-') then
      begin
        Break;
      end;
    end;
    pono1 := StrToIntDef(Copy(LQry1.fieldbyname('SALES_ORDER').AsString,I+1,length(LQry1.fieldbyname('SALES_ORDER').AsString)-I),0);
    LQry2.First;
    while not LQry2.Eof do
    begin
      for I := length(LQry2.fieldbyname('SALES_ORDER').AsString) downto 1 do
      begin
        if (LQry2.fieldbyname('SALES_ORDER').AsString[I] = '_') or (LQry2.fieldbyname('SALES_ORDER').AsString[I] = '-') then
        begin
          Break;
        end;
      end;
      pono2 := StrToIntDef(Copy(LQry2.fieldbyname('SALES_ORDER').AsString,I+1,length(LQry2.fieldbyname('SALES_ORDER').AsString)-I),0);
      if pono2 < pono1 then
      begin
        Result := 3;
        Exit;
      end;
      LQry2.Next;
    end;
    Result := 1;
  finally
    LQry1.Close;
    LQry2.Close;
    LQry1.Free;
    LQry2.Free;
  end;
end;

procedure Tsearchso_Form.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  if (Column.Field.DataSet.FieldByName('REPUT_QTY').AsInteger >= Column.Field.DataSet.FieldByName('PARTS_ORDERED').AsInteger) then
//  begin
//    TDBGrid(Sender).Canvas.Brush.Color := clMoneyGreen;
//  end;
//  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
