unit PasSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfrmSelect = class(TForm)
    Label1: TLabel;
    dtpks: TDateTimePicker;
    dtpke: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    edtDept: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    cbbWH: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelect: TfrmSelect;

implementation

uses DAMO,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmSelect.BitBtn1Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'formula_number/公式代码/400';
    InputVar.Sqlstr := ' select formula_number from data0569 where Ttype=0 ';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtDept.Text:= frmPick_Item_Single.adsPick.fieldbyname('formula_number').AsString;
//      edtDept.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmSelect.BitBtn2Click(Sender: TObject);
begin
  if dtpks.Date>dtpke.Date then
  begin
    ShowMessage('开始日期大于结束日期，请重新选择日期');
    exit;
  end;
  if trim(edtDept.Text)='' then
  begin
    ShowMessage('请选择公式');
    exit;
  end;
   ModalResult:=mrYes;
end;

procedure TfrmSelect.FormShow(Sender: TObject);
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT RKEY,ABBR_NAME FROM DATA0015 ORDER BY RKEY';
    Open;
    First;
    while not Eof do
    begin
      cbbWH.Items.AddObject(FieldByName('abbr_name').AsString,Pointer(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
  cbbWH.ItemIndex:=0;
end;

end.
