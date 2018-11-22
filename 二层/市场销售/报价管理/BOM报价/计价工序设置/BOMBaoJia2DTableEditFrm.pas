unit BOMBaoJia2DTableEditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Datasnap.Provider, DM, DataIntf,
  Vcl.Samples.Spin, RzPanel, Vcl.Mask, DBCtrlsEh, RzCmboBx;

type
  TfrmBOMBaoJia2DTableEdit = class(TForm)
    pnl1: TPanel;
    btn1: TRzButton;
    btn2: TRzButton;
    cdsBP13: TClientDataSet;
    dsBP13: TDataSource;
    strngfldBP3IDKey: TStringField;
    strngfldBP3BP12_ptr: TStringField;
    strngfldBP3X: TStringField;
    strngfldBP3Y: TStringField;
    intgrfldBP3Cell_Col: TIntegerField;
    intgrfldBP3Cell_Row: TIntegerField;
    strngfldBP3TValue: TStringField;
    pnl2: TRzPanel;
    rgXValueType: TRadioGroup;
    btn3: TButton;
    btn4: TButton;
    se1: TSpinEdit;
    se2: TSpinEdit;
    lbl2: TLabel;
    lbl1: TLabel;
    pnl3: TRzPanel;
    sg1: TStringGrid;
    lbl3: TLabel;
    lbl4: TLabel;
    cbxXType: TRzComboBox;
    cbxYtype: TRzComboBox;
    rgYValueType: TRadioGroup;
    btn5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
    IBP13: IData;
  public
    { Public declarations }
    FIDKey: string;
    FCol,FRow: Integer;
    procedure GetData();
    function LoadSGFromDB(ASG: TStringGrid;AQry: TClientDataSet): Boolean;
    function SaveSgToDB(ASG: TStringGrid; AQry: TClientDataSet): Boolean;
  end;

var
  frmBOMBaoJia2DTableEdit: TfrmBOMBaoJia2DTableEdit;

implementation

uses
  DBImpl, WZ_gUnit;

{$R *.dfm}

{ TfrmBOMBaoJia2DTableEdit }

procedure TfrmBOMBaoJia2DTableEdit.btn1Click(Sender: TObject);
begin
  if rgXValueType.ItemIndex = 1 then
  begin
    if (cbxXType.ItemIndex <> 0) then
    begin
      ShowMessage('X轴取值为范围，X轴类型必须是数字。保存失败');
      Exit;
    end;
  end;
  if rgYValueType.ItemIndex = 1 then
  begin
    if (cbxYType.ItemIndex <> 0) then
    begin
      ShowMessage('Y轴取值为范围，Y轴类型必须是数字。保存失败');
      Exit;
    end;
  end;

  SaveSgToDB(sg1,cdsBP13);
  if PostdataByInterface(cdsBP13,IBP13) then
  begin
    cdsBP13.MergeChangeLog;
    ShowMessage('保存成功');
    ModalResult := mrOk;
  end;
end;

procedure TfrmBOMBaoJia2DTableEdit.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBOMBaoJia2DTableEdit.btn3Click(Sender: TObject);
begin
  sg1.FixedCols := 0;
  sg1.FixedRows := 0;
end;

procedure TfrmBOMBaoJia2DTableEdit.btn4Click(Sender: TObject);
begin
  sg1.ColCount := se2.Value;
  sg1.RowCount := se1.Value;
end;

procedure TfrmBOMBaoJia2DTableEdit.btn5Click(Sender: TObject);
begin
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Add('SELECT CUST_CODE FROM data0010 ORDER BY CUST_CODE ASC ');
  dm1.qrytmp.Open;
  sg1.RowCount := dm1.qrytmp.RecordCount + 1;
  se1.Value := sg1.RowCount;
  sg1.ColCount := 2;
  while not dm1.qrytmp.Eof do
  begin
    sg1.Cells[0,dm1.qrytmp.RecNo] := dm1.qrytmp.FieldByName('CUST_CODE').AsString;
    sg1.Cells[1,dm1.qrytmp.RecNo] := '0';
    dm1.qrytmp.Next;
  end;

end;

procedure TfrmBOMBaoJia2DTableEdit.FormCreate(Sender: TObject);
begin
  IBP13 := TBP13.Create;
end;

procedure TfrmBOMBaoJia2DTableEdit.FormShow(Sender: TObject);
begin
  GetData;
  btn1.Enabled := gUser.User_Permit = '4';
end;

procedure TfrmBOMBaoJia2DTableEdit.GetData;
begin
  IBP13.SetSql('select * from bomprice13 where bp12_ptr = '+ QuotedStr(FIDKey) );
  cdsBP13.Data := IBP13.GetData;
  LoadSGFromDB(sg1,cdsBP13)
end;

function TfrmBOMBaoJia2DTableEdit.LoadSGFromDB(ASG: TStringGrid;
  AQry: TClientDataSet): Boolean;
begin
  ASG.ColCount := FCol;
  ASG.RowCount := FRow;

  AQry.First;
  while not AQry.Eof do
  begin
    ASG.Cells[AQry.FieldByName('Cell_Col').AsInteger,AQry.FieldByName('Cell_Row').AsInteger] :=
      AQry.fieldbyname('TValue').AsString;
    AQry.Next;
  end;
  Result := True;
end;

function TfrmBOMBaoJia2DTableEdit.SaveSgToDB(ASG: TStringGrid;
  AQry: TClientDataSet): Boolean;
var
  Col,Row: Integer;
begin
  while not AQry.IsEmpty do AQry.Delete;

  for Col := 0 to ASG.ColCount-1 do
  begin
    for Row := 0 to ASG.RowCount-1 do
    begin
      AQry.Append;
      AQry.FieldByName('IDKey').AsString := IBP13.CreateKeyID;
      AQry.FieldByName('BP12_ptr').AsString := FIDKey;
      AQry.FieldByName('Y').AsString := ASG.Cells[0,Row];//IntToStr(I);
      AQry.FieldByName('X').AsString := ASG.Cells[Col,0];
      AQry.FieldByName('Cell_Col').AsInteger := Col;
      AQry.FieldByName('Cell_Row').AsInteger := Row;
      AQry.FieldByName('TValue').AsString := ASG.Cells[Col,Row];
      AQry.Post;
    end;
  end;
  Result := True;
end;

end.
