unit EditParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TfrmEditParam = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn3: TBitBtn;
    rgGroupType: TRadioGroup;
    edtParam_ptr: TEdit;
    edtParamName: TEdit;
    edtParamDesc: TEdit;
    edtSeqNO: TEdit;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    cbMustInput: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtSeqNOKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditParam: TfrmEditParam;

implementation

uses damo, ConstVar, Pick_Item_Single;

{$R *.dfm}

procedure TfrmEditParam.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'PARAMETER_NAME/参数名称/150,PARAMETER_DESC/参数描述/200';
    InputVar.Sqlstr :=
      'Select RKEY, PARAMETER_NAME, PARAMETER_DESC From Data0278';
    inputvar.InPut_value:=edtParamName.Text;
    inputvar.KeyField:='PARAMETER_NAME';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtParam_ptr.Text:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString;
      edtParamName.Text:= frmPick_Item_Single.adsPick.FieldByName('PARAMETER_NAME').AsString;
      edtParamDesc.Text:= frmPick_Item_Single.adsPick.FieldByName('PARAMETER_DESC').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmEditParam.btnCancelClick(Sender: TObject);
begin
   dm.AQSetParam.Cancel;
   ModalResult:= mrCancel;
end;

procedure TfrmEditParam.btnSaveClick(Sender: TObject);
begin
  if rgGroupType.ItemIndex = -1 then
  begin
    ShowMessage('请选择参数类别!');
    Abort;
  end;
  dm.ADOConn.BeginTrans;
  try
    if edtSeqNO.Text = '' then//AQCalcSeqNo
    begin
      with dm.AQCalcSeqNo do
      begin
        Close;
        Parameters.ParamByName('Group_Type').Value:= rgGroupType.ItemIndex + 1;
        Open;
        if RecordCount = 0 then edtSeqNO.Text := '1'
        else
          edtSeqNO.Text:= dm.AQCalcSeqNo.FieldByName('Max_No').AsString;
      end;
    end;
    dm.AQSetParam.FieldByName('Group_Type').AsInteger:= rgGroupType.ItemIndex + 1;
    dm.AQSetParam.FieldByName('Group_Name').AsString:= rgGroupType.Items.Strings[rgGroupType.ItemIndex];
    dm.AQSetParam.FieldByName('Param_ptr').AsInteger:= StrToInt(edtParam_ptr.Text);
    dm.AQSetParam.FieldByName('SEQ_NO').AsInteger:= StrToInt(edtSeqNO.Text);
    if not cbMustInput.Checked then
      dm.AQSetParam.FieldByName('MustInput').AsInteger:= 0
    else
      dm.AQSetParam.FieldByName('MustInput').AsInteger:= 1;
    //dm.AQSetParam.Post;
    dm.AQSetParam.UpdateBatch();
    with dm.temp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update t2 '+
                      'set MustInput = t1.MustInput '+
                      'from data0164 t1,Data0166 t2 '+
                      'where t1.Group_Type = t2.Group_Type '+
                      'and t1.Group_Type = :Group_Type '+
                      'and t1.Param_ptr = t2.Param_ptr '+
                      'and t1.Param_ptr = :Param_ptr ');
      Parameters.ParamByName('Group_Type').Value:= dm.AQSetParam.FieldByName('Group_Type').AsInteger;
      Parameters.ParamByName('Param_ptr').Value:= dm.AQSetParam.FieldByName('Param_ptr').AsInteger;
      ExecSQL;
    end;
    dm.ADOConn.CommitTrans;
    ModalResult:=mrok;
  except
    dm.ADOConn.RollbackTrans;
    frmEditParam.Free;
  end;
end;

procedure TfrmEditParam.edtSeqNOKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key:= #0;
end;

end.
