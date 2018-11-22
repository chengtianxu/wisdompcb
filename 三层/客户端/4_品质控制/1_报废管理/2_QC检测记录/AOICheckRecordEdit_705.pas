unit AOICheckRecordEdit_705;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseCheck_Mod705, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.Menus, Data.DB, Data.Win.ADODB,
  Datasnap.DBClient, Vcl.StdCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ComCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.ExtCtrls;

type
TAfterAppendEvent = procedure of object;
  TFrmAOICheckRecordEdit_705 = class(TfrmBaseCheck_Mod705)
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure edt_WorkNoButtonClick(Sender: TObject);
    procedure edt_WorkNoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   // AddRefresh: TAfterAppendEvent;
   function BeforeSaveToDB: Boolean; override;
   procedure InitData(AModelID: Integer;AEType:integer;AIDKey:string);override;
  end;

var
  FrmAOICheckRecordEdit_705: TFrmAOICheckRecordEdit_705;

implementation
      uses uCommFunc;
{$R *.dfm}

{ TFrmILayerCheckRecordEdit1 }

function TFrmAOICheckRecordEdit_705.BeforeSaveToDB: Boolean;
var
FQty:integer;
begin
   inherited;
  result:=false;

  if Trim(edt_WorkNo.Text) = '' then
  begin
    ShowMessage('作业单号不能为空');
    edt_WorkNo.Focused;
    exit;
  end;

  if Trim(edt_PBCount.Text) = '' then
  begin
    ShowMessage('排版数不能为空！');
    edt_PBCount.Focused;
    exit;
  end;

  if Trim(edt_PnlQty.Text) = '' then
  begin
    ShowMessage('送检Pnl数不能为空！');
    edt_PnlQty.Focused;
    exit;
  end;

  if Trim(edt_PPassQty.Text) = '' then
  begin
    ShowMessage('送检Pnl良品数不能为空！');
    edt_PPassQty.Focused;
    exit;
  end;

//  if Trim(cbb_ClassNo.Text) = '' then
//  begin
//    ShowMessage('班次不能为空！');
//    cbb_ClassNo.Focused;
//    exit;
//  end;

  if Trim(cbb_LayerNo.Text) = '' then
  begin
    ShowMessage('层别不能为空！');
    cbb_LayerNo.Focused;
    exit;
  end;

//  if Trim(edt_WManNo.Text) = '' then
//  begin
//    ShowMessage('作业员编号不能为空！');
//    edt_WManNo.Focused;
//    exit;
//  end;

  if (Trim(edt_PnlQty.Text) <> '') and (Trim(edt_PPassQty.Text) <> '') then
  begin
    if (StrToFloat(Trim(edt_PPassQty.Text)) > StrToFloat(Trim(edt_PnlQty.Text)))
    then
    begin
      ShowMessage('PNL良品数不能大于总数！');
      exit;
    end;
  end;

  if (Trim(edt_PnlQty.Text) <> '') and (Trim(edt_PPassQty.Text) <> '') then
    if (strtoint(Trim(edt_PnlQty.Text)) < 0) or
      (strtoint(Trim(edt_PPassQty.Text)) < 0) then
    begin
      ShowMessage('数量不能为负数！');
      exit;
    end;

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

    FQTY := 0;
    cdsRDetail.First;
    while not cdsRDetail.Eof do
    begin
      FQTY := FQTY + cdsRDetail.FieldByName('bugQty').AsInteger;
      cdsRDetail.Next;
    end;

    CdsRMain.edit;
    CdsRMain.FieldByName('QCDate').value :=
      StrToDateTime(gfunc.DateTimeToStr(dtpQC.Date, 'yyyy-MM-dd'));
    CdsRMain.FieldByName('ClassNO').value := cbb_ClassNo.Text;
    CdsRMain.FieldByName('LayerNO').value := cbb_LayerNo.Text;
    CdsRMain.FieldByName('HDDesc').value := cbb_HDDesc.Text;
    CdsRMain.FieldByName('QCTestName').value := cbb_QCTestName.Text;

    if CdsRMain.FieldByName('PassQty').value = 0 then
      CdsRMain.FieldByName('PassQty').value := CdsRMain.FieldByName('AllQty')
        .value - FQTY;

    CdsRMain.Post;

    edt_PassQtyExit(edt_PassQty);

    result := true;
  finally
    cdsRDetail.EnableControls;
  end;


end;

procedure TFrmAOICheckRecordEdit_705.btn_CancelClick(Sender: TObject);
begin
//inherited;
  close;
end;

procedure TFrmAOICheckRecordEdit_705.btn_SaveClick(Sender: TObject);
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

procedure TFrmAOICheckRecordEdit_705.edt_WorkNoButtonClick(Sender: TObject);
begin
  inherited;
  edt_PnlQty.SetFocus;
end;

procedure TFrmAOICheckRecordEdit_705.edt_WorkNoExit(Sender: TObject);
begin
  inherited;
edt_PnlQty.SetFocus;
end;

procedure TFrmAOICheckRecordEdit_705.InitData(AModelID, AEType: integer;
  AIDKey: string);
begin
  inherited;

end;

end.
