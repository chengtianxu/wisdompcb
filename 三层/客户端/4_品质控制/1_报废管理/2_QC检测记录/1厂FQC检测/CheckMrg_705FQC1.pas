unit CheckMrg_705FQC1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseCheck_Mod705, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.Win.ADODB, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit,
  Vcl.Menus;

type
  TFrmCheckMrg_705FQC1 = class(TfrmBaseCheck_Mod705)
    procedure edt_WorkNoButtonClick(Sender: TObject);
    procedure edt_WorkNoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitData(AModelID: Integer; AEType: Integer;
      AIDKey: string); override;
    function BeforeSaveToDB: Boolean; override;
  end;

var
  FrmCheckMrg_705FQC1: TFrmCheckMrg_705FQC1;

implementation

uses uCommFunc;

{$R *.dfm}
{ TForm1 }

function TFrmCheckMrg_705FQC1.BeforeSaveToDB: Boolean;
//var
//  FQTY: Integer;
begin
  inherited;
  result := false;

  if Trim(edt_WorkNo.Text) = '' then
  begin
    ShowMessage('作业单号不能为空');
    edt_WorkNo.Focused;
    exit;
  end;

  if (Trim(edt_AllQty.Text) = '' )   then
  begin
    ShowMessage('送检数量不能为空！');
    edt_AllQty.Focused;
    exit;
  end;

  if Trim(edt_FailQty.Text) = '' then
  begin
    ShowMessage('不良数量不能为空！');
    edt_FailQty.Focused;
    exit;
  end;

  cdsRDetail.DisableControls;
  try
    cdsRDetail.First;
    while not cdsRDetail.Eof do
    begin
      if cdsRDetail.FieldByName('BugQty').AsInteger < 0 then
      begin
        ShowMessage('数量不能为负！');
        exit;
      end;
      cdsRDetail.Next;
    end;

//    FQTY := 0;
//    cdsRDetail.First;
//    while not cdsRDetail.Eof do
//    begin
//      FQTY := FQTY + cdsRDetail.FieldByName('bugQty').AsInteger;
//      cdsRDetail.Next;
//    end;

    CdsRMain.edit;
    CdsRMain.FieldByName('QCDate').value :=
      StrToDateTime(gfunc.DateTimeToStr(dtpQC.Date, 'yyyy-MM-dd'));
    CdsRMain.FieldByName('ClassNO').value := cbb_ClassNo.Text;
    // CdsRMain.FieldByName('LayerNO').value := cbb_LayerNo.Text;
    // CdsRMain.FieldByName('HDDesc').value := cbb_HDDesc.Text;
    CdsRMain.FieldByName('QCTestName').value := cbb_QCTestName.Text;

//    if CdsRMain.FieldByName('PassQty').value = 0 then
//      CdsRMain.FieldByName('PassQty').value := CdsRMain.FieldByName('AllQty')
//        .value - FQTY;

    CdsRMain.Post;

    edt_FailQtyExit(edt_FailQty);

    result := true;
  finally
    cdsRDetail.EnableControls;
  end;

end;

procedure TFrmCheckMrg_705FQC1.edt_WorkNoButtonClick(Sender: TObject);
begin
  inherited;
  edt_AllQty.SetFocus;
end;

procedure TFrmCheckMrg_705FQC1.edt_WorkNoExit(Sender: TObject);
begin
  inherited;
  edt_AllQty.SetFocus;
end;

procedure TFrmCheckMrg_705FQC1.InitData(AModelID, AEType: Integer;
  AIDKey: string);
begin
  inherited;

end;

end.
