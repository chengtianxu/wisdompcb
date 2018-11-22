unit Check_705Electron1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseCheck_Mod705, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Data.Win.ADODB,
  Datasnap.DBClient, Vcl.StdCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TfrmCheck_705Eelctron1 = class(TfrmBaseCheck_Mod705)
    lbl14: TLabel;
    edt_TPeriod: TRKeyRzBtnEdit;
    procedure edt_WorkNoButtonClick(Sender: TObject);
    procedure edt_WorkNoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function BeforeSaveToDB: Boolean; override;
  end;

var
  frmCheck_705Eelctron1: TfrmCheck_705Eelctron1;

implementation

uses uCommFunc;
{$R *.dfm}
{ TfrmCheck_Eelctron1 }

function TfrmCheck_705Eelctron1.BeforeSaveToDB;
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

  if Trim(edt_PassQty.Text) = '' then
  begin
    ShowMessage('良品数量不能为空！');
    edt_PassQty.Focused;
    exit;
  end;

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
//    CdsRMain.FieldByName('LayerNO').value := cbb_LayerNo.Text;
//    CdsRMain.FieldByName('HDDesc').value := cbb_HDDesc.Text;
    CdsRMain.FieldByName('QCTestName').value := cbb_QCTestName.Text;

   // if CdsRMain.FieldByName('PassQty').value=0 then
   //CdsRMain.FieldByName('PassQty').value := CdsRMain.FieldByName('AllQty')
    //  .value - FQTY;

    CdsRMain.Post;

     edt_PassQtyExit(edt_PassQty);



  result:=true;
  finally
  cdsRDetail.EnableControls;
  end;

end;

procedure TfrmCheck_705Eelctron1.edt_WorkNoButtonClick(Sender: TObject);
begin
  inherited;
  edt_AllQty.SetFocus;
end;

procedure TfrmCheck_705Eelctron1.edt_WorkNoExit(Sender: TObject);
begin
  inherited;
  edt_AllQty.SetFocus;
end;

procedure TfrmCheck_705Eelctron1.FormShow(Sender: TObject);
begin
  inherited;
cbb_QCTestName.ItemIndex:=0;
end;

end.
