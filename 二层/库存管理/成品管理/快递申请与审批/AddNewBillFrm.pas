unit AddNewBillFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, dm, MainFrm, DB, ADODB,
  Buttons;

type
  TfrmAddNewBill = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtBillNO: TDBEdit;
    dbrgrpOutDoor: TDBRadioGroup;
    edtItems: TDBEdit;
    edtTestWeight: TDBEdit;
    edtTestMoney: TDBEdit;
    btn1: TButton;
    dbmmoTran: TDBMemo;
    dbrgrpPayType: TDBRadioGroup;
    ads818: TADODataSet;
    ds818: TDataSource;
    ads818TranCode: TStringField;
    ads818TranName: TStringField;
    ads818TranEasyName: TStringField;
    btn2: TButton;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edtItems1: TDBEdit;
    edtTestWeight1: TDBEdit;
    edtTestMoney1: TDBEdit;
    btn3: TSpeedButton;
    edtToUser: TDBEdit;
    lbl12: TLabel;
    cbbtranname: TComboBox;
    lbl13: TLabel;
    dbedtItems: TDBEdit;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    lbl14: TLabel;
    dbrgrpspeedtype: TDBRadioGroup;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  WZ_gUnit, ToUserHistory, Pick_Item_Single, ConstVar;

{$R *.dfm}

procedure TfrmAddNewBill.btn1Click(Sender: TObject);
begin
  if frmMain.ads817.FieldByName('billno').IsNull then
  begin
    ShowMessage('请填写快递单号');
    Exit;
  end;
  if frmMain.ads817.State in [dsedit,dsinsert] then
  begin
    try
      ads818.Locate('tranname',cbbtranname.Text,[]);
      frmMain.ads817.FieldByName('trancode').Value := ads818.fieldbyname('trancode').Value;
      frmMain.ads817.FieldByName('cuser').AsString := gUser.User_Ptr;
      frmMain.ads817.FieldByName('ctime').AsDateTime := dm1.getsvrtime;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;
  end;
end;

procedure TfrmAddNewBill.FormShow(Sender: TObject);
var
  I: Integer;
begin
  ads818.Open;
  ads818.First;
  while not ads818.Eof do
  begin
    cbbtranname.Items.Add(ads818.fieldbyname('tranname').AsString);
    ads818.Next;
  end;
  if ads818.Locate('trancode',frmMain.ads817.FieldByName('trancode').AsString,[]) then
  begin
    I := cbbtranname.Items.IndexOf(ads818.fieldbyname('tranname').AsString);
    if i <> -1 then
      cbbtranname.ItemIndex := i;
  end;
end;

procedure TfrmAddNewBill.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddNewBill.btn3Click(Sender: TObject);
var
  LFrm: TfrmToUserHistory;
begin
  LFrm := TfrmToUserHistory.Create(Self);
  try
    if (LFrm.ShowModal = mrok) and (not LFrm.ads817.IsEmpty) then
    begin
      frmMain.ads817.FieldByName('touser').Value := LFrm.ads817.FieldByName('touser').Value;
      frmMain.ads817.FieldByName('toaddress').Value := LFrm.ads817.FieldByName('toaddress').Value;
      frmMain.ads817.FieldByName('tophone').Value := LFrm.ads817.FieldByName('tophone').Value;
      frmMain.ads817.FieldByName('CustName').Value := LFrm.ads817.FieldByName('CustName').Value;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmAddNewBill.btn4Click(Sender: TObject);
var
  LInput: PDlgInput;
begin
  LInput.Sqlstr := 'SELECT d10.rkey,d10.ABBR_NAME,d12.SHIP_TO_ADDRESS_1,d12.SHIP_TO_CONTACT,d12.SHIP_TO_PHONE ' +
                    ' FROM DATA0010 d10 ' +
                  ' left JOIN Data0012 d12 ON d12.CUSTOMER_PTR = d10.RKEY ';
  LInput.AdoConn := dm1.con1;
  LInput.Fields := 'ABBR_NAME/客户简称/100,SHIP_TO_ADDRESS_1/地址/150,SHIP_TO_CONTACT/联系人/80,SHIP_TO_PHONE/联系电话/80';
  with TfrmPick_Item_Single.Create(Self) do
  begin
    try
      InitForm_New(LInput);
      if ShowModal = mrok then
      begin
        frmMain.ads817.FieldByName('CustName').AsString := adsPick1.fieldbyname('ABBR_NAME').AsString;
        frmMain.ads817.FieldByName('ToUser').AsString := adsPick1.fieldbyname('SHIP_TO_CONTACT').AsString;
        frmMain.ads817.FieldByName('ToPhone').AsString := adsPick1.fieldbyname('SHIP_TO_PHONE').AsString;
        frmMain.ads817.FieldByName('ToAddress').AsString := adsPick1.fieldbyname('SHIP_TO_ADDRESS_1').AsString;        
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmAddNewBill.btn5Click(Sender: TObject);
var
  LInput: PDlgInput;
begin
  LInput.Sqlstr := 'SELECT d10.rkey,d10.ABBR_NAME,d12.SHIP_TO_ADDRESS_1,d12.SHIP_TO_CONTACT,d12.SHIP_TO_PHONE ' +
                    ' FROM DATA0010 d10 ' +
                  ' left JOIN Data0012 d12 ON d12.CUSTOMER_PTR = d10.RKEY ' +
                  ' where d10.abbr_name = ' + QuotedStr(frmMain.ads817.fieldbyname('CustName').AsString);
  LInput.AdoConn := dm1.con1;
  LInput.Fields := 'ABBR_NAME/客户简称/100,SHIP_TO_ADDRESS_1/地址/150,SHIP_TO_CONTACT/联系人/80,SHIP_TO_PHONE/联系电话/80';
  with TfrmPick_Item_Single.Create(Self) do
  begin
    try
      InitForm_New(LInput);
      if ShowModal = mrok then
      begin
        frmMain.ads817.FieldByName('ToUser').AsString := adsPick1.fieldbyname('SHIP_TO_CONTACT').AsString;
        frmMain.ads817.FieldByName('ToPhone').AsString := adsPick1.fieldbyname('SHIP_TO_PHONE').AsString;
        frmMain.ads817.FieldByName('ToAddress').AsString := adsPick1.fieldbyname('SHIP_TO_ADDRESS_1').AsString;        
      end;
    finally
      Free;
    end;
  end;
end;

end.
