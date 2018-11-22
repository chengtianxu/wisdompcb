unit SupplierFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Data.DB,
  Datasnap.DBClient, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.DBCtrls,uBaseFrm;

type
  TfrmSupplier_Mode29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btnS: TBitBtn;
    btnC: TBitBtn;
    eh23: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    sg: TStringGrid;
    rky1: TRKeyRzBtnEdit;
    rky2: TRKeyRzBtnEdit;
    rky3: TRKeyRzBtnEdit;
    rky4: TRKeyRzBtnEdit;
    rky5: TRKeyRzBtnEdit;
    rky6: TRKeyRzBtnEdit;
    rky7: TRKeyRzBtnEdit;
    rky8: TRKeyRzBtnEdit;
    rky9: TRKeyRzBtnEdit;
    rky10: TRKeyRzBtnEdit;
    rky11: TRKeyRzBtnEdit;
    rky12: TRKeyRzBtnEdit;
    ds23: TDataSource;
    cds23: TClientDataSet;
    dbtxt1: TDBText;
    dbtxt2: TDBText;
    Label14: TLabel;
    procedure cds23AfterScroll(DataSet: TDataSet);
    procedure btnSClick(Sender: TObject);
    procedure eh23DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(AINVT:string);
    procedure Init_UI;
    procedure LoadSG;
  end;

var
  frmSupplier_Mode29: TfrmSupplier_Mode29;

implementation

uses uCommFunc;

{$R *.dfm}

{ TfrmSupplier_Mode29 }

procedure TfrmSupplier_Mode29.btnSClick(Sender: TObject);
begin
  if cds23.FieldByName('AVL_FLAG').AsString = 'N' then
  begin
    ShowMessage('供应商价格没有认可无法采购!');
    exit;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmSupplier_Mode29.cds23AfterScroll(DataSet: TDataSet);
begin
  LoadSG;
end;

procedure TfrmSupplier_Mode29.eh23DblClick(Sender: TObject);
begin
  inherited;
  ModalResult:= mrOk;
end;

procedure TfrmSupplier_Mode29.GetData(AINVT: string);
var
  LSql:string;
begin
  LSql:= cds23.CommandText + ' AND dbo.Data0028.INVENTORY_PTR = ' + AINVT + #13 +
         ' ORDER BY dbo.Data0023.CODE ';
  if not gSvrIntf.IntfGetDataBySql(LSql,cds23) then Exit;
end;

procedure TfrmSupplier_Mode29.Init_UI;
begin
  sg.Cells[0,0]:='从';
  sg.Cells[1,0]:='至';
  sg.Cells[2,0]:='供应商价格';
  sg.Cells[3,0]:='折扣';

  LoadSG;//加载stringgrid内容

  cds23.First;
  while not cds23.Eof do
  begin
    if (not cds23.FieldByName('PREF_SUPPLIER_PTR').IsNull) and
       cds23.FieldByName('PREF_SUPPLIER_PTR').Value = cds23.FieldByName('rkey').Value  then
      Label14.Caption:= '首选供应商：' + cds23.FieldByName('code').AsString
    else
      Label14.Caption:= '首选供应商未定义';
    cds23.Next;
  end;
end;

procedure TfrmSupplier_Mode29.LoadSG;
var
  i:Integer;
  LTmp:Double;
begin
  for i := 1 to 6 do
    sg.Rows[i].Clear;

  LTmp:= 0;
  for i := 1 to 6 do
  begin
    sg.Cells[2,i]:= FormatFloat('0.000',cds23.FieldByName('PRICE_' + IntToStr(i)).Value);
    sg.Cells[3,i]:= FormatFloat('0.000',cds23.FieldByName('DISC_' + IntToStr(i)).Value);

    if i = 1 then sg.Cells[0,i]:= FloatToStr(LTmp)
    else sg.Cells[0,i]:= '>' + FloatToStr(LTmp);

    if (i < 6) and (cds23.FieldByName('QUAN_VOL_' + IntToStr(i)).Value > 0) then
    begin
      sg.Cells[1,i]:= cds23.FieldByName('QUAN_VOL_' + IntToStr(i)).AsString;
      LTmp:= LTmp +  cds23.FieldByName('QUAN_VOL_' + IntToStr(i)).Value;
    end
    else
    begin
      sg.Cells[1,i]:= '无限制';
      Break;
    end;
  end;
end;

end.
