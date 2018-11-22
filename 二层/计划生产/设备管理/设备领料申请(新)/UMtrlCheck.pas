unit UMtrlCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
    TfrmMtrlCheck = class;
    TFrmCallBack = procedure(AFrm: TfrmMtrlCheck) of object;

  TfrmMtrlCheck = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    grp2: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    edt_RQty: TEdit;
    cbb_Vendor: TComboBox;
    edt_Qty: TEdit;
    lbl3: TLabel;
    lbl11: TLabel;
    edt_MUnitName: TEdit;
    edt_MDesc: TEdit;
    lbl10: TLabel;
    lbl9: TLabel;
    edt_MCode: TEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    lbl_desc: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCallBack: TFrmCallBack;
    FY:string; 
  end;

var
  frmMtrlCheck: TfrmMtrlCheck;

implementation
    uses UDM,common, Pick_Item_Single;
{$R *.dfm}

procedure TfrmMtrlCheck.btn2Click(Sender: TObject);
begin
  if strtofloat('0'+trim(edt_RQty.Text))=0 then
  begin
    showmessage('出库数量不能为0...');
    edt_RQty.SetFocus;
    exit;
  end;


  if strtofloat('0'+trim(edt_RQty.Text))>strtofloat(edt_Qty.text) then
  begin
    showmessage('出库数量不能不能大于有效库存！');
    edt_RQty.SetFocus;
    exit;
  end;

  modalresult:=mrok;



end;

procedure TfrmMtrlCheck.FormShow(Sender: TObject);
begin
       edt_RQty.SetFocus;
end;

end.
