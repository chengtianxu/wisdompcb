unit Table2DEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Buttons;

type
  TfrmTable2DEdit = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtYCount: TEdit;
    edtXCount: TEdit;
    edtTableName: TEdit;
    lbl4: TLabel;
    edtDesc: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn4: TButton;
    sg1: TStringGrid;
    btn3: TButton;
    rg1: TRadioGroup;
    lbl5: TLabel;
    edtStrValue: TEdit;
    btn5: TButton;
    lbl6: TLabel;
    edtCustom: TEdit;
    btn6: TSpeedButton;
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edtYCountKeyPress(Sender: TObject; var Key: Char);
    procedure edtYCountExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure edtCustomExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTag: Integer;//0 新增 1编辑
    FEditRkey: Integer;
  end;


implementation

uses
  damo, Calc, Pick_Item_Single, ConstVar;

{$R *.dfm}

{ TfrmTable2DEdit }


procedure TfrmTable2DEdit.btn3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTable2DEdit.btn4Click(Sender: TObject);
begin
  if Trim(edtTableName.Text) = '' then
  begin
    ShowMessage('表明不能空');
    Exit;
  end;

  if FTag = 0 then
  begin
    dm.SqlOpen('select 1 from data0311 where TName=' + QuotedStr(edtTableName.Text));
    if not dm.qrytmp.IsEmpty then
    begin
      ShowMessage('表明重复');
      Exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmTable2DEdit.edtYCountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',#27]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmTable2DEdit.edtYCountExit(Sender: TObject);
begin
  if StrToIntDef(TEdit(Sender).Text,-1) < 0 then
  begin
    TEdit(Sender).Text := '0';
  end;
end;

procedure TfrmTable2DEdit.btn1Click(Sender: TObject);
begin
  sg1.ColCount := StrToInt(edtXCount.Text);
  sg1.RowCount := StrToInt(edtYCount.Text);
end;

procedure TfrmTable2DEdit.btn2Click(Sender: TObject);
begin
  sg1.FixedCols := 0;
  sg1.FixedRows := 0;
end;

procedure TfrmTable2DEdit.btn5Click(Sender: TObject);
var
  lCalc: TCalc;
  LStr: string;
begin
  lCalc := TCalc.Create(dm.ADOConn);
  try
    //ShowMessage(lCalc.GetTableValue(edtStrValue.Text));
    //lCalc.ReplaceTableToValue(edtStrValue.Text,lStr);
    //LStr := lCalc.CalcStr(edtStrValue.Text,'72',0);
    //ShowMessage(LStr);
  finally
    lCalc.Free;
  end;
end;

procedure TfrmTable2DEdit.btn6Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LInput: PDlgInput;
begin
  LInput.Sqlstr := 'select rkey,cust_code,customer_name from data0010';
  LInput.KeyField := 'rkey';
  LInput.AdoConn := dm.ADOConn;
  LInput.Fields := 'cust_code/客户代码/200,customer_name/客户名称/200';
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LInput);
    if LFrm.ShowModal = mrok then
    begin
      edtCustom.Tag := LFrm.Get_Rslt;
      edtCustom.Text := LFrm.adsPick1.fieldbyname('cust_code').AsString;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmTable2DEdit.edtCustomExit(Sender: TObject);
var
  LSql:string;
begin
  LSql := 'select rkey from data0010 where cust_code = ' + QuotedStr(edtCustom.Text);
  dm.SqlOpen(LSql);
  if dm.qrytmp.IsEmpty then
  begin
    edtCustom.Text := '';
    edtCustom.Tag := 0;
    ShowMessage('无效的客户');
  end else
  begin
    edtCustom.Tag := dm.qrytmp.fieldbyname('rkey').AsInteger;
  end;
end;

end.
