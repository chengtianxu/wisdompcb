unit EditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmEdit = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edtExTernal_No: TEdit;
    Label2: TLabel;
    edtFacName: TEdit;
    Label3: TLabel;
    edtDeptName: TEdit;
    Label4: TLabel;
    edtSupplierRkey: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtRelPerson: TEdit;
    Label7: TLabel;
    edtRelPhone: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtPrice: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtBillKind: TEdit;
    Label14: TLabel;
    edtRecAddress: TEdit;
    Label15: TLabel;
    Label8: TLabel;
    mmoPayKindDesc: TMemo;
    mmoExTernal_Desc: TMemo;
    mmoRemark: TMemo;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label11: TLabel;
    edtPutIntoRkey: TEdit;
    lblOtherInfo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEdit: TFrmEdit;

implementation

uses
  Damo, common;

{$R *.dfm}

procedure TFrmEdit.FormShow(Sender: TObject);
begin
  edtExTernal_No.Text := DM.qryMainExTernal_No.Value;
  edtFacName.Text := DM.qryMainWAREHOUSE_NAME.Value;
  edtDeptName.Text := DM.qryMainDept_Name.Value;
  edtSupplierRkey.Text := DM.qryMainSUPPLIER_NAME.Value;
  edtRecAddress.Text := DM.wdstrngfldMainRecAddress.Value;
  mmoExTernal_Desc.Text := DM.wdstrngfldMainExTernal_Desc.Value;
  mmoPayKindDesc.Text := DM.wdstrngfldMainPayKindDesc.Value;
  mmoRemark.Text := DM.wdstrngfldMainRemark.Value;
  DateTimePicker1.Date := DM.qryMainEnt_Date.Value;
  DateTimePicker2.Date := DM.qryMainFinishDate.Value;
  edtRelPerson.Text := DM.wdstrngfldMainRelPerson.Value;
  edtRelPhone.Text := DM.wdstrngfldMainRelPhone.Value;
  edtBillKind.Text := DM.wdstrngfldMainBillKind.Value;
  edtPrice.Text := DM.qryMainPrice.AsString;
  edtPutIntoRkey.Text := DM.qryMainCut_no.Value;
  lblOtherInfo.Caption := DM.qryMainPROD_CODE.AsString + ',' + DM.qryMainPRODUCT_NAME.AsString;
end;

procedure TFrmEdit.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
