unit FQCCheckRecordEdit_705;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseCheck_Mod705, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.Menus, Data.DB, Data.Win.ADODB,
  Datasnap.DBClient, Vcl.StdCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TAfterAppendEvent = procedure of object;

  TFrmFQCCheckRecordEdit_705 = class(TfrmBaseCheck_Mod705)
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // FEditType:integer;
    // AddRefresh: TAfterAppendEvent;
    function BeforeSaveToDB: Boolean; override;
  end;

var
  FrmFQCCheckRecordEdit_705: TFrmFQCCheckRecordEdit_705;

implementation

uses uCommFunc;
{$R *.dfm}

function TFrmFQCCheckRecordEdit_705.BeforeSaveToDB: Boolean;
// var
// FQTY: Integer;
begin

  inherited;
  result := false;

  if Trim(edt_WorkNo.Text) = '' then
  begin
    ShowMessage('作业单号不能为空');
    edt_WorkNo.Focused;
    exit;
  end;

  if Trim(edt_AllQty.Text) = '' then
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

    // FQTY := 0;
    // cdsRDetail.First;
    // while not cdsRDetail.Eof do
    // begin
    // FQTY := FQTY + cdsRDetail.FieldByName('bugQty').AsInteger;
    // cdsRDetail.Next;
    // end;

    CdsRMain.edit;
    CdsRMain.FieldByName('QCDate').value :=
      StrToDateTime(gfunc.DateTimeToStr(dtpQC.Date, 'yyyy-MM-dd'));
    CdsRMain.FieldByName('ClassNO').value := cbb_ClassNo.Text;
    // CdsRMain.FieldByName('LayerNO').value := cbb_LayerNo.Text;
    // CdsRMain.FieldByName('HDDesc').value := cbb_HDDesc.Text;
    CdsRMain.FieldByName('QCTestName').value := cbb_QCTestName.Text;

    // if CdsRMain.FieldByName('PassQty').value = 0 then
    // CdsRMain.FieldByName('PassQty').value := CdsRMain.FieldByName('AllQty')
    // .value - FQTY;

    CdsRMain.Post;

    edt_FailQtyExit(edt_FailQty);

    result := true;
  finally
    cdsRDetail.EnableControls;
  end;

end;

procedure TFrmFQCCheckRecordEdit_705.btn_CancelClick(Sender: TObject);
begin
  // inherited;
  close;
end;

procedure TFrmFQCCheckRecordEdit_705.btn_SaveClick(Sender: TObject);
var
  FDate: TDate;
begin
  FDate := dtpQC.Date;
  cdsRDetail.DisableControls;
  try
    if BeforeSaveToDB then
    begin
      if SaveToDB then
      begin
        GetData(FModelID, FEType, FIDKey);
        btn_CancelClick(btn_Cancel);
        dtpQC.Date := FDate;
        ShowMessage('保存成功 ！');
      end;
      close;
      AddRefresh;
    end;

  finally
    cdsRDetail.EnableControls;

  end;
end;

end.
