unit UPutOutfrm_mod38;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,uBaseFrm,System.Math;

type



  TfrmPutOut_mod38 = class(TfrmBase)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TBitBtn;
    btnCancel: TBitBtn;
    edtQtyOnHnad: TEdit;
    edtUnitName: TEdit;
    edtThisQty: TEdit;
    lbl4: TLabel;
    edtBomQty: TEdit;
    chkSended: TCheckBox;
    lbl5: TLabel;
    edtIssuedQty: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtThisQtyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

  // FQty: Double;
  end;

var
  frmPutOut_mod38: TfrmPutOut_mod38;

implementation

{$R *.dfm}

procedure TfrmPutOut_mod38.btn1Click(Sender: TObject);
var
n:integer;
n2,n3:Currency;
begin
  inherited;
   n:=ceil(strtocurr(edtBomQty.text)-strtocurr(edtIssuedQty.Text));//最大可发数
  //showmessage(IntToStr(N)) ;
  n2:=strtocurr(edtBomQty.text)-strtocurr(edtIssuedQty.Text); //可发数
  n3:= strtocurr(edtThisQty.text); //当前发放数

 if  (self.Tag=1)  and  (n3>n2) and (n3<n)  then
  begin   //按配料单
   if messagedlg('超出申请数量！是否继续？',mtWarning,[mbYes,mbNo],0)<>mrYes then
      Exit;
  end
  else if (self.Tag=1) and (n3>n)   then
  begin
    ShowMessage('超出最大可领数:'+inttostr(n));
    Exit;
  end
  else if  (self.Tag=2)  and  (strtocurr(edtThisQty.text)>(strtocurr(edtBomQty.text)-strtocurr(edtIssuedQty.Text)))  then
  begin   //按领料单
    showmessage('超出申请数量！');
      Exit;
  end ;


  if strtocurr(edtThisQty.text)>strtocurr(edtQtyOnHnad.text)then
   begin
    showmessage('发放数量不能大于现有库存数');
   exit;
   end;

  if strtocurr(trim(edtThisQty.Text))<=0 then
  begin
    messagedlg('对不起,不能发放数据小于零的材料!!!',mterror,[mbcancel],0);
    edtThisQty.SetFocus;
    exit;
  end;

   ModalResult:=mrok;
end;

procedure TfrmPutOut_mod38.btnCancelClick(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfrmPutOut_mod38.edtThisQtyKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

end.
