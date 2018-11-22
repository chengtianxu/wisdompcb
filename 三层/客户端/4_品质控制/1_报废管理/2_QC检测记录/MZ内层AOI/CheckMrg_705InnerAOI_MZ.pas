unit CheckMrg_705InnerAOI_MZ;

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
  TFrmCheckMrg_705InnerAOI_MZ = class(TfrmBaseCheck_Mod705)
    lbl14: TLabel;
    procedure edt_WorkNoButtonClick(Sender: TObject);
    procedure edt_WorkNoExit(Sender: TObject);
    procedure edt_PBCountExit(Sender: TObject);
    procedure edt_PBCountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_PnlQtyExit(Sender: TObject);
    procedure edt_SideQtyExit(Sender: TObject);
    procedure edt_AllQtyExit(Sender: TObject);
    procedure edt_PassQtyExit(Sender: TObject);
    procedure edt_PassQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SaveClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitData(AModelID: Integer; AEType: Integer;
      AIDKey: string); override;
    function BeforeSaveToDB: Boolean; override;
  end;

var
  FrmCheckMrg_705InnerAOI_MZ: TFrmCheckMrg_705InnerAOI_MZ;

implementation

uses uCommFunc,uBaseSinglePickListFrm;

{$R *.dfm}
{ TForm1 }

function TFrmCheckMrg_705InnerAOI_MZ.BeforeSaveToDB: Boolean;
var
FQty:integer;
begin
    inherited;
  result := false;

  if Trim(edt_WorkNo.Text) = '' then
  begin
    ShowMessage('作业单号不能为空');
    edt_WorkNo.Focused;
    exit;
  end;

  if Trim(edt_PnlQty.Text) = '' then
  begin
    ShowMessage('送检Pnl数不能为空！');
    edt_PnlQty.Focused;
    exit;
  end;

//  if Trim(edt_PPassQty.Text) = '' then
//  begin
//    ShowMessage('送检Pnl良品数不能为空！');
//    edt_PPassQty.Focused;
//    exit;
//  end;

  if Trim(edt_SPassQty.Text) = '' then
  begin
    ShowMessage('送检面良品数不能为空！');
    edt_SPassQty.Focused;
    exit;
  end;

//  if Trim(cbb_ClassNo.Text) = '' then
//  begin
//    ShowMessage('班次不能为空！');
//    cbb_ClassNo.Focused;
//    exit;
//  end;

  if Trim(edt_PBCount.Text) = '' then
  begin
    ShowMessage('排版数不能为空！');
    edt_PBCount.Focused;
    exit;
  end;

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
//
//  if Trim(cbb_HDDesc.Text) = '' then
//  begin
//    ShowMessage('厚度不能为空！');
//    cbb_HDDesc.Focused;
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

    // if trim(edt_passQty.text)='' then
      CdsRMain.FieldByName('PassQty').value := CdsRMain.FieldByName('AllQty')
        .value - FQTY;

    CdsRMain.Post;

    edt_PassQtyExit(edt_PassQty);

    result := true;
  finally
    cdsRDetail.EnableControls;
  end;


end;

procedure TFrmCheckMrg_705InnerAOI_MZ.btn_SaveClick(Sender: TObject);
var
  LDate: TDate;
  LClassNo, LTestName, LLayerNo, LHDDesc: string;
  Lds: TClientDataSet;
begin
  // inherited;
  LDate := dtpQC.Date;
  LClassNo := Trim(cbb_ClassNo.Text);
  LTestName := Trim(cbb_QCTestName.Text);
  LLayerNo := Trim(cbb_LayerNo.Text);
  LHDDesc := Trim(cbb_HDDesc.Text);

  Lds := TClientDataSet.Create(nil);
  Lds.Data := CdsRMain.Data;

  cdsRDetail.DisableControls;

  try
    if BeforeSaveToDB then
    begin
      if SaveToDB then
      begin
        GetData(FModelID, FEType, FIDKey);
        InitData2(Lds);
        dtpQC.Date := LDate;
        cbb_ClassNo.Text := LClassNo;
        cbb_QCTestName.Text := LTestName;
        cbb_HDDesc.Text := LHDDesc;
        cbb_LayerNo.Text := LLayerNo;
        ShowMessage('保存成功！');
      end;
    end;

  finally
    cdsRDetail.EnableControls;
    Lds.Free;
  end;
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_AllQtyExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_PassQtyExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_PassQtyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_PBCountExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_PBCountKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_PnlQtyExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_SideQtyExit(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_WorkNoButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
  i:integer;
begin
  LFrm := TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(705, 1,' and d25.MANU_PART_NUMBER like '''+trim(edt_WorkNo.text)+'%'' ');
    if LFrm.showmodal = mrok then
    begin
      CdsRMain.edit;
      edt_ProdNo.Text := LFrm.cdsPick.FieldByName('MANU_PART_NUMBER').value;
      i:= LFrm.cdsPick.FieldByName('rkey').value;
     CdsRMain.FieldByName('d06_ptr').value := LFrm.cdsPick.FieldByName('rkey').value;
      CdsRMain.Post;
      edt_PBCount.SetFocus;
    end;
  finally
    LFrm.Free;
  end;
  edt_PBCount.SetFocus;

end;

procedure TFrmCheckMrg_705InnerAOI_MZ.edt_WorkNoExit(Sender: TObject);
begin
  inherited;
  edt_PBCount.SetFocus;
end;

procedure TFrmCheckMrg_705InnerAOI_MZ.InitData(AModelID, AEType: Integer;
  AIDKey: string);
begin
  inherited;
 //edt_PPassQty.Text:='0';
end;

end.
