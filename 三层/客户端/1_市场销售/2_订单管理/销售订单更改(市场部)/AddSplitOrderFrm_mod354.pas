unit AddSplitOrderFrm_mod354;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,uBaseEditFrm, uBaseFrm,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TfrmAddSplitOrder_mod354 = class(TfrmBaseEdit)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt_orderNO: TEdit;
    edt_QtySet: TEdit;
    edt_CustDate: TMaskEdit;
    edt_PDate: TMaskEdit;
    edt_QtyPcs: TEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure edt_QtySetExit(Sender: TObject);
    procedure edt_QtySetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_QtySetKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QtyPcsKeyPress(Sender: TObject; var Key: Char);
    procedure edt_orderNOExit(Sender: TObject);
    procedure edt_orderNOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_QtyPcsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_QtyPcsExit(Sender: TObject);
    procedure edt_CustDateExit(Sender: TObject);
    procedure edt_CustDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_PDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_PDateExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FOldOrderQty,FPARTS_SHIPPED,FSetQty,Frush_charge_pct_used: integer;
  end;

var
  frmAddSplitOrder_mod354: TfrmAddSplitOrder_mod354;

implementation

{$R *.dfm}

procedure TfrmAddSplitOrder_mod354.btnSaveClick(Sender: TObject);
begin
  inherited;
  IF STRTOint(edt_QtySet.Text)=0 then
  begin
    showmessage('拆分的订单数量不能为零!');
    edt_QtySet.SetFocus;
  end
  else
  if strtoint(edt_QtyPcs.Text)>FOldOrderQty-FPARTS_SHIPPED then
  begin
    showmessage('拆分的订单数量不能大于原订单的欠货数!');
    edt_QtySet.SetFocus;
  end ;

  ModalResult:=mrok;
end;

procedure TfrmAddSplitOrder_mod354.edt_CustDateExit(Sender: TObject);
begin
  inherited;
try
 edt_PDate.Text := datetostr(strtodate(edt_CustDate.text)-Frush_charge_pct_used);  //rush_charge_pct_used
except
 messagedlg('客户交期输入格式有误,请仔细检查!',mtwarning,[mbok],0);
 edt_CustDate.SetFocus;
end;
end;

procedure TfrmAddSplitOrder_mod354.edt_CustDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then edt_PDate.SetFocus;
end;

procedure TfrmAddSplitOrder_mod354.edt_orderNOExit(Sender: TObject);
begin
  inherited;
if trim(edt_orderNO.text)='' then
 begin
  showmessage('订单编号不能为空!');
  edt_orderNO.SetFocus;
 end
 else
 if pos('-',trim(edt_orderNO.Text))=0 then
  begin
   showmessage('订单编号必须有'' - ''符号作为分界符!');
   edt_orderNO.SetFocus;
  end
 else
  if (copy(trim(edt_orderNO.Text),length(trim(edt_orderNO.Text)),1) < '0') or
     (copy(trim(edt_orderNO.Text),length(trim(edt_orderNO.Text)),1) > '9') then
   begin
    showmessage('订单编号必须数值健结束!');
    edt_orderNO.SetFocus;
   end;
end;

procedure TfrmAddSplitOrder_mod354.edt_orderNOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then edt_QtySet.SetFocus;
end;

procedure TfrmAddSplitOrder_mod354.edt_PDateExit(Sender: TObject);
begin
  inherited;
  try
   edt_CustDate.Text := datetostr(strtodate(edt_PDate.text)+Frush_charge_pct_used);
  except
   messagedlg('计划交期输入格式有误,请仔细检查!',mtwarning,[mbok],0);
   edt_PDate.SetFocus;
  end;
end;

procedure TfrmAddSplitOrder_mod354.edt_PDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then btnSave.SetFocus;
end;

procedure TfrmAddSplitOrder_mod354.edt_QtyPcsExit(Sender: TObject);
begin
  inherited;
 if trim(edt_QtyPcs.Text) = '' then edt_QtyPcs.Text := '0';

if (strtoint(edt_QtyPcs.Text) mod self.Fsetqty) <> 0 then
 if messagedlg('订单数PCS输入有误,pcs不是出货板数set的倍数!是否继续?',mtconfirmation,[mbyes,mbno],0)=mryes then
  edt_QtySet.Text:=inttostr(round(strtoint(edt_QtyPcs.Text)/Fsetqty))
 else
  edt_QtyPcs.SetFocus
else
 edt_QtySet.Text:=floattostr(strtoint(edt_QtyPcs.Text)/Fsetqty);
end;

procedure TfrmAddSplitOrder_mod354.edt_QtyPcsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then edt_CustDate.SetFocus;
end;

procedure TfrmAddSplitOrder_mod354.edt_QtyPcsKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8,#13]) then
     abort;
end;

procedure TfrmAddSplitOrder_mod354.edt_QtySetExit(Sender: TObject);
begin
  inherited;
 if trim(edt_QtySet.Text)='' then edt_QtySet.Text := '0';
  edt_QtyPcs.Text:=inttostr(strtoint(edt_QtySet.Text)*self.Fsetqty);
end;

procedure TfrmAddSplitOrder_mod354.edt_QtySetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then edt_QtyPcs.SetFocus;
end;

procedure TfrmAddSplitOrder_mod354.edt_QtySetKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not (key in ['0'..'9',#8,#13]) then
     abort;
end;

end.
