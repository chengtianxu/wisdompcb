unit Edit317Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  Tfrmedti317 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtGroupName: TEdit;
    edtGroupDesc: TEdit;
    btn1: TButton;
    btn2: TButton;
    edtCustomer_ptr: TEdit;
    lbl3: TLabel;
    btn3: TSpeedButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTag: Integer;
    FEditRkey: Integer;
  end;


implementation

uses
  damo, Pick_Item_Single, ConstVar;

{$R *.dfm}

procedure Tfrmedti317.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrmedti317.btn1Click(Sender: TObject);
var
  LSql: string;
begin
  case FTag of
    0://新增
    begin
      if Trim(edtGroupName.Text) = '' then
      begin
        ShowMessage('模板名字不能为空');
        Exit;
      end;
      LSql := 'select 1 from data0317 where groupname=' + QuotedStr(edtGroupName.text);
      dm.SqlOpen(LSql);
      if not dm.qrytmp.IsEmpty then
      begin
        ShowMessage('已有重复模板');
        Exit;
      end;
      LSql := 'select * from data0317 where rkey = -1';
      dm.SqlOpen(LSql);
      dm.qrytmp.Append;
      dm.qrytmp.fieldbyname('groupname').AsString := edtGroupName.Text;
      dm.qrytmp.FieldByName('groupdesc').AsString := edtGroupDesc.Text;
      dm.qrytmp.FieldByName('customer_ptr').AsInteger := edtCustomer_ptr.Tag;
      dm.qrytmp.Post;
      ModalResult := mrOk;
    end;
    1://编辑
    begin
      if Trim(edtGroupName.Text) = '' then
      begin
        ShowMessage('模板名字不能为空');
        Exit;
      end;
      LSql := 'select 1 from data0317 where groupname=' + QuotedStr(edtGroupName.text) + ' and rkey <> ' + IntToStr(FEditRkey);
      dm.SqlOpen(LSql);
      if not dm.qrytmp.IsEmpty then
      begin
        ShowMessage('已有重复模板');
        Exit;
      end;
      if edtCustomer_ptr.Text = '' then
        edtCustomer_ptr.Tag := 0;
      LSql := 'update data0317 set groupname = ' + QuotedStr(edtGroupName.Text) +
              ', groupdesc = ' + QuotedStr(edtGroupDesc.Text) +
              ',customer_ptr = ' + IntToStr(edtCustomer_ptr.Tag) +
              ' where rkey = ' + IntToStr(FEditRkey);

      dm.SqlExec(LSql);
      ModalResult := mrOk;
    end;
  end;
end;

procedure Tfrmedti317.btn3Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LInPut: PDlgInput;
begin
  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm.ADOConn;
  LInPut.Sqlstr := ' select * from data0010 ';
  LInPut.Fields := 'CUST_CODE/客户代码/180,CUSTOMER_NAME/客户名称/220';
  LFrm.InitForm_New(LInPut);
  try
    if LFrm.ShowModal = mrok then
    begin
      edtCustomer_ptr.Tag := LFrm.adsPick1.fieldbyname('rkey').AsInteger;
      edtCustomer_ptr.Text := LFrm.adsPick1.fieldbyname('CUST_CODE').AsString;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
