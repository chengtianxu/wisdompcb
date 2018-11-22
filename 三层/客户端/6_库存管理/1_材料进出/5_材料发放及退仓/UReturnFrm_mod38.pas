unit UReturnFrm_mod38;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmReturn_mod38 = class(TfrmBase)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtIssueQty: TEdit;
    edtUnit: TEdit;
    edtReturnQty: TEdit;
    edtRReturnQty: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtRReturnQtyKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReturn_mod38: TfrmReturn_mod38;

implementation

{$R *.dfm}

procedure TfrmReturn_mod38.btnCancelClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmReturn_mod38.btnOkClick(Sender: TObject);
begin
  inherited;
  if strtocurr(edtRReturnQty.Text)<=0 then
 begin
  messagedlg('对不起,不能退回数据为零的材料!!!',mterror,[mbcancel],0);
  edtRReturnQty.SetFocus;
  exit;
 end
 else  if strtocurr(edtRReturnQty.text)>strtocurr(edtReturnQty.text) then
 begin
  showmessage('退仓数量不能大于发放数量!');
  exit;
 end;

 modalresult:=mrok;

end;

procedure TfrmReturn_mod38.edtRReturnQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

end.
