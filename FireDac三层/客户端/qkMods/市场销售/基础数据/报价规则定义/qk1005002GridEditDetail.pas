unit qk1005002GridEditDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkBaseFrm, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Samples.Spin, RzButton, Vcl.Mask, RzEdit, RzDBEdit, RzDBSpin,
  Vcl.Grids, RzCmboBx, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfrmqk1005002GridEditDetail = class(TfrmqkBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btn1: TRzBitBtn;
    btn2: TRzBitBtn;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btn3: TButton;
    btn4: TButton;
    se1: TSpinEdit;
    se2: TSpinEdit;
    sg1: TStringGrid;
    rgYValueType: TRadioGroup;
    rgXValueType: TRadioGroup;
    cbxYtype: TRzComboBox;
    cbxXType: TRzComboBox;
    btn5: TRzBitBtn;
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FGridDs,FGridDetail: TFDMemTable;
    function InitEdit(AGridDs,ADetailDs: TFDMemTable): Boolean;
    function LoadSGFromDB(ASG: TStringGrid;ADsMain,ADsDetail: TFDMemTable): Boolean;
    function SaveSgToDB(ASG: TStringGrid;ADsMain,ADsDetail: TFDMemTable): Boolean;
  end;

var
  frmqk1005002GridEditDetail: Tfrmqk1005002GridEditDetail;

implementation

uses
  qkFunc.Commfunc;

{$R *.dfm}

procedure Tfrmqk1005002GridEditDetail.btn1Click(Sender: TObject);
begin
  inherited;
  se1.Enabled := False;
  se2.Enabled := False;
  cbxYtype.Enabled := False;
  cbxXType.Enabled := False;
  btn4.Enabled := False;
  btn3.Enabled := False;
  rgYValueType.Enabled := False;
  rgXValueType.Enabled := False;
  btn1.Enabled := False;
  btn2.Enabled := True;

  sg1.Options := sg1.Options - [goEditing];
  SaveSgToDB(sg1,FGridDs,FGridDetail);
  if sg1.RowCount > 1 then
    sg1.FixedRows := 1;
  if sg1.ColCount > 1 then
    sg1.FixedCols := 1;
end;

procedure Tfrmqk1005002GridEditDetail.btn2Click(Sender: TObject);
begin
  inherited;
  se1.Enabled := True;
  se2.Enabled := True;
  cbxYtype.Enabled := true;
  cbxXType.Enabled := True;
  btn4.Enabled := True;
  btn3.Enabled := True;
  rgYValueType.Enabled := True;
  rgXValueType.Enabled := True;
  btn1.Enabled := True;
  btn2.Enabled := False;

  sg1.Options := sg1.Options + [goEditing];
end;

procedure Tfrmqk1005002GridEditDetail.btn3Click(Sender: TObject);
begin
  inherited;
  sg1.FixedCols := 0;
  sg1.FixedRows := 0;
end;

procedure Tfrmqk1005002GridEditDetail.btn4Click(Sender: TObject);
var
  L,M: Integer;
  I: Integer;
  J: Integer;
begin
  inherited;
  L := sg1.ColCount;
  M := sg1.RowCount;
  sg1.ColCount := se2.Value;
  sg1.RowCount := se1.Value;
  if sg1.RowCount > 1 then
    sg1.FixedRows := 1;
  if sg1.ColCount > 1 then
    sg1.FixedCols := 1;
  for I := L to sg1.ColCount - 1 do
  begin
    for J := M to sg1.RowCount - 1 do
    begin
      sg1.Cells[I,J] := '';
    end;
  end;
end;

procedure Tfrmqk1005002GridEditDetail.btn5Click(Sender: TObject);
begin
  inherited;
  qkCommfunc.ExportSGtoExcel(sg1);
  qkDialog.OperSucc;
end;

function Tfrmqk1005002GridEditDetail.InitEdit(AGridDs,
  ADetailDs: TFDMemTable): Boolean;
begin
  FGridDs := AGridDs;
  FGridDetail := ADetailDs;
  se1.Value := FGridDs.FieldByName('YCount').AsInteger;
  se2.Value := FGridDs.FieldByName('XCount').AsInteger;
  rgXValueType.ItemIndex := FGridDs.FieldByName('xvtype').AsInteger;
  rgYValueType.ItemIndex := FGridDs.FieldByName('Yvtype').AsInteger;
  cbxXType.ItemIndex := FGridDs.FieldByName('Xtype').AsInteger;
  cbxYtype.ItemIndex := FGridDs.FieldByName('YType').asinteger;

  LoadSGFromDB(sg1,FGridDs,FGridDetail);
  Result := True;
end;


function Tfrmqk1005002GridEditDetail.LoadSGFromDB(ASG: TStringGrid;
  ADsMain,ADsDetail: TFDMemTable): Boolean;
begin
  ASG.ColCount := ADsMain.FieldByName('XCount').AsInteger;
  ASG.RowCount := ADsMain.FieldByName('YCount').AsInteger;

  ADsDetail.First;
  while not ADsDetail.Eof do
  begin
    ASG.Cells[ADsDetail.FieldByName('Cell_Col').AsInteger,ADsDetail.FieldByName('Cell_Row').AsInteger] :=
      ADsDetail.fieldbyname('TValue').AsString;
    ADsDetail.Next;
  end;
  Result := True;
  ASG.Cells[0,0] := 'Y\X';
  if ASG.RowCount > 1 then
    asg.FixedRows := 1;
  if ASG.ColCount > 1 then
    ASG.FixedCols := 1;
end;



function Tfrmqk1005002GridEditDetail.SaveSgToDB(ASG: TStringGrid; ADsMain,
  ADsDetail: TFDMemTable): Boolean;
var
  Col,Row: Integer;
  I: Integer;
  IDKeyArr: TArray<Int64>;
begin
  Result := False;
  if not qkCommfunc.CreateIDKey(asg.ColCount* asg.RowCount,IDKeyArr) then Exit;

  ADsMain.Edit;
  ADsMain.FieldByName('XCount').AsInteger := ASG.ColCount;
  ADsMain.FieldByName('YCount').AsInteger := ASG.RowCount;
  ADsMain.FieldByName('Xvtype').AsInteger := rgXValueType.ItemIndex;
  ADsMain.FieldByName('Yvtype').AsInteger := rgYValueType.ItemIndex;
  ADsMain.FieldByName('Xtype').AsInteger := cbxXType.ItemIndex;
  ADsMain.FieldByName('YType').asinteger := cbxYtype.ItemIndex;
  ADsMain.Post;

  while not ADsDetail.IsEmpty do ADsDetail.Delete;


  I := 0;

  for Col := 0 to ASG.ColCount-1 do
  begin
    for Row := 0 to ASG.RowCount-1 do
    begin
      ADsDetail.Append;
      ADsDetail.FieldByName('IDKey').AsLargeInt := IDKeyArr[I];
      ADsDetail.FieldByName('Parent_Ptr').AsLargeInt := ADsMain.FieldByName('IDKey').AsLargeInt;
      ADsDetail.FieldByName('Y').AsString := ASG.Cells[0,Row];//IntToStr(I);
      ADsDetail.FieldByName('X').AsString := ASG.Cells[Col,0];
      ADsDetail.FieldByName('Cell_Col').AsInteger := Col;
      ADsDetail.FieldByName('Cell_Row').AsInteger := Row;
      ADsDetail.FieldByName('TValue').AsString := ASG.Cells[Col,Row];
      ADsDetail.Post;
      Inc(I);
    end;
  end;
  Result := True;
end;

end.
