unit PasCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmCode = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    lbl1: TLabel;
    edtCode: TEdit;
    lbl2: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    edtQuan: TEdit;
    lbl5: TLabel;
    edtMidQuan: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtCodeQuan: TEdit;
    lbl4: TLabel;
    edtbatch: TEdit;
    lbl6: TLabel;
    lbl10: TLabel;
    edtcreate: TEdit;
    edt1: TEdit;
    procedure edtMidQuanKeyPress(Sender: TObject; var Key: Char);
    procedure edtMidQuanExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtcreateChange(Sender: TObject);
    procedure edtcreateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    effday:integer;
  public
    { Public declarations }

  end;

var
  frmCode: TfrmCode;

implementation

uses common, DAMO,DateUtils;

{$R *.dfm}

procedure TfrmCode.edtMidQuanKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9',#8,#46]) then
  begin
    if (Key = #46) and (Pos('.',Trim(TEdit(Sender).Text))<>0) then
    Abort;
  end;
end;

procedure TfrmCode.edtMidQuanExit(Sender: TObject);
var
  tmp1,tmp2: Double;
  tmp:Currency;
  i:Integer;
begin
  if Trim(edtMidQuan.Text) = '' then exit;
  if not TryStrToCurr(Trim(edtMidQuan.Text),tmp) then
  begin
    ShowMessage('数据格式不对，请重新输入');
    edtMidQuan.SetFocus;
    exit;
  end;
  if Trim(edtMidQuan.Text) =  '0' then
  begin
    ShowMessage('每包装数量必须大于0');
    edtMidQuan.SetFocus;
    exit;
  end;
  i:= 1;
  tmp1:= StrToCurr(Trim(edtQuan.Text));
  tmp2:= StrToCurr(Trim(edtMidQuan.Text));
  while tmp1 - tmp2 > 0 do
  begin
    tmp1:= tmp1 - tmp2;
    i:= i+1;
  end;
  edtCodeQuan.Text:= IntToStr(i);
end;

procedure TfrmCode.btnSaveClick(Sender: TObject);
var
  i:Integer;
  quan,total:Double;

begin
  if Trim(edtMidQuan.Text) =  '' then
  begin
    ShowMessage('每包装数量不能为空');
    edtMidQuan.SetFocus;
    exit;
  end;
  total:=StrToCurr(Trim(edtQuan.Text));
  DM.ADOConnection1.BeginTrans;
  try
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'SELECT * from data0396 where 1=0';
      Open;
      for i:=1 to StrToInt(Trim(edtCodeQuan.Text)) do
      begin
        Append;
        FieldByName('rkey391').Value:= DM.adoMainrkey.Value;
        FieldByName('batchno').Value:= Trim(edtbatch.Text);
        if total > StrToCurr(Trim(edtMidQuan.Text)) then
        begin
          FieldByName('quantity').Value:= StrToCurr(Trim(edtMidQuan.Text));
          FieldByName('quan_on_hang').Value:= StrToCurr(Trim(edtMidQuan.Text));
        end
        else
        begin
          FieldByName('quantity').Value:= total;
          FieldByName('quan_on_hang').Value:= total;
        end;
        FieldByName('manufacture_TDATE').Value:= StrToDate(Trim(edtcreate.Text));
        if  Trim(edt1.Text) <> '' then FieldByName('extrl_date').Value:= StrToDate(Trim((edt1.Text)));
        Post;
        total:= total - StrToCurr(Trim(edtMidQuan.Text));
      end;
    end;
    DM.ADOConnection1.CommitTrans;
    ShowMessage('生成成功！');
    ModalResult:= mrOk;
  except
    DM.ADOConnection1.RollbackTrans;
    ShowMessage('生成失败！！');
  end;
end;

procedure TfrmCode.edtcreateChange(Sender: TObject);
var
  tmp:TDateTime;
begin
  if (Trim(edtcreate.Text)<>'') and (TryStrToDate(Trim(edtcreate.Text),tmp)=True) then
  begin
    if effday = 0 then edt1.Text:= ''
    else edt1.Text:=DateTimeToStr(IncDay(strtodatetime(Trim(edtcreate.Text)),effday - 1));
  end;
end;

procedure TfrmCode.edtcreateExit(Sender: TObject);
var
  temp:TDateTime;
begin
  if (Trim((Sender as TEdit).Text)<>'') and (TryStrToDate(Trim((Sender as TEdit).Text),temp)=False) then
  begin
    ShowMessage('输入的日期格式不对，应例如：2015-11-11');
    (Sender as TEdit).SetFocus;
    Exit;
  end;
end;

procedure TfrmCode.FormShow(Sender: TObject);
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Text:= 'select CASE DATA0028.qte_price2 WHEN 0 THEN DATA0017.SHELF_LIFE ELSE DATA0028.qte_price2 END AS eff_Date '
            + #13+ 'from data0017 '+#13+
            ' inner join data0028 on data0017.rkey = data0028.INVENTORY_PTR  '+#13+
            'where data0028.rkey = '+ DM.adoMainSUPPLIER_POINTER.AsString +
            ' and data0017.rkey = '+ DM.adoMainrkey17.AsString;
    Open;
    if not IsEmpty then
    begin
      effday:= FieldByName('eff_Date').AsInteger;
    end;
  end;
end;

end.
