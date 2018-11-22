unit EditItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, Mask;

type
  TfrmEditItem = class(TForm)
    pnlClient: TPanel;
    dbgType: TDBRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    btnFindParam: TBitBtn;
    edtParamName: TDBEdit;
    edtParamDesc: TDBEdit;
    pnlTop: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    Label1: TLabel;
    edtSeqNo: TDBEdit;
    edtUnit: TDBEdit;
    Label2: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnFindParamClick(Sender: TObject);
    procedure edtSeqNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditItem: TfrmEditItem;

implementation

uses damo, FindCust;

{$R *.dfm}

procedure TfrmEditItem.btnSaveClick(Sender: TObject);
begin
  if dbgType.ItemIndex = -1 then
  begin
    ShowMessage('请选择加成类型');
    Abort;
  end;
  dm.ADOConn.BeginTrans;
  try
    dm.aqSetItem.UpdateBatch();
    dm.ADOConn.CommitTrans;
    ModalResult:= mrok;
  except
    dm.ADOConn.RollbackTrans;
    frmEditItem.Free;
  end;
end;

procedure TfrmEditItem.btnCancelClick(Sender: TObject);
begin
  dm.aqSetItem.Cancel;
  ModalResult:= mrCancel;
end;

procedure TfrmEditItem.btnFindParamClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmFindCust, frmFindCust);
    with dm.aqParamName do
    begin
      Close;
      Open;
    end;
    with frmFindCust do
    begin
      rdgCondition.Visible:= False;
      Label1.Caption:= '参数描述';
      DBGridEh1.Visible:= False;
      DBGridEh2.Visible:= True;
      DBGridEh2.Align:= alClient;
      if frmFindCust.ShowModal = mrok then
      begin
        dm.aqSetItem.FieldByName('Param_ptr').Value:= dm.aqParamName.FieldByName('RKEY').AsString;
        edtParamName.Text:= dm.aqParamName.FieldByName('PARAMETER_NAME').AsString;
        edtParamDesc.Text:= dm.aqParamName.FieldByName('PARAMETER_DESC').AsString;
        edtUnit.Text:= dm.aqParamName.FieldByName('UNIT_CODE').AsString;
      end;
    end;
  finally
    frmFindCust.Free;
  end;
end;

procedure TfrmEditItem.edtSeqNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key:= #0;
end;

end.
