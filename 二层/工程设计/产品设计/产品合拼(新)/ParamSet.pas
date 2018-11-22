unit ParamSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, DB, ADODB;

type
  TfrmParamSet = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    btnRefresh: TBitBtn;
    btnAppend: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnExit: TBitBtn;
    aqParamSet: TADOQuery;
    DataSource1: TDataSource;
    qry278: TADOQuery;
    qry278RKEY: TAutoIncField;
    qry278PARAMETER_NAME: TStringField;
    qry278PARAMETER_DESC: TStringField;
    aqParamSetParam_PTR: TIntegerField;
    aqParamSetCalcValueType: TWordField;
    aqParamSetFormula: TWideStringField;
    aqParamSetOperator: TStringField;
    aqParamSetFormulaValue: TWideStringField;
    aqParamSetPARAMETER_NAME: TStringField;
    aqParamSetPARAMETER_DESC: TStringField;
    aqParamSetSeqNo: TIntegerField;
    aqParamSetIsDifferent: TSmallintField;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure aqParamSetBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamSet: TfrmParamSet;

implementation
uses uDM,ConstVar, Pick_Item_Single,common;
{$R *.dfm}

procedure TfrmParamSet.btnRefreshClick(Sender: TObject);
var
  i:integer;
begin
  i:=aqParamSet.fieldbyName('Param_PTR').AsInteger;
  aqParamSet.Close;
  aqParamSet.open;
  aqParamSet.Locate('Param_PTR',i,[]);
end;

procedure TfrmParamSet.btnAppendClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
    try
      InputVar.Fields := 'PARAMETER_NAME/参数代码/200,PARAMETER_DESC/参数名称/300';
      InputVar.Sqlstr := 'Select RKEY,PARAMETER_NAME,PARAMETER_DESC From Data0278(NOLOCK) Order By PARAMETER_DESC';
      inputvar.InPut_value:='';
      inputvar.KeyField:='PARAMETER_DESC';
      InputVar.AdoConn := dm.con1;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        with frmPick_Item_Single.adsPick do
        begin
          aqParamSet.Append;
          aqParamSet.FieldByName('Param_PTR').AsInteger:= FieldByName('RKEY').AsInteger;
        end;
      end;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free;
    end;
end;

procedure TfrmParamSet.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  dm.con1.BeginTrans;
  try
    dm.qryTmp.Close;
    dm.qryTmp.SQL.Text:= 'delete from SpellCondition where Param_PTR='+aqParamSet.fieldbyName('Param_PTR').AsString;
    dm.qryTmp.ExecSQL;
    dm.con1.CommitTrans;
    ShowMessage('删除数据成功!');
    btnRefreshClick(nil);
  except
    dm.con1.RollbackTrans;
    ShowMessage('删除数据失败!');
  end;
end;

procedure TfrmParamSet.btnSaveClick(Sender: TObject);
begin
  if aqParamSet.State in dsEditmodes then
    aqParamSet.Post;
  aqParamSet.UpdateBatch(arAll);
end;

procedure TfrmParamSet.btnCancelClick(Sender: TObject);
begin
  aqParamSet.CancelBatch(arAll);
end;

procedure TfrmParamSet.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParamSet.aqParamSetBeforePost(DataSet: TDataSet);
begin
  if aqParamSet.FieldByName('CalcValueType').AsInteger = 1 then
  begin
    if aqParamSet.FieldByName('IsDifferent').AsInteger = 1 then
    begin
      ShowMsg('公式取值的合拼条件不可以设置为相等',1);
      abort;
    end;
  end
  else
  begin
    if aqParamSet.FieldByName('Formula').AsString <> '' then
    begin
      ShowMsg('参数取值不需要设置计算公司',1);
      abort;
    end
    else if aqParamSet.FieldByName('Operator').AsString <> '' then
    begin
      ShowMsg('参数取值不需要设置运算符',1);
      abort;
    end
    else if aqParamSet.FieldByName('FormulaValue').AsString <> '' then
    begin
      ShowMsg('参数取值不需要设置公式的值',1);
      abort;
    end
  end;
end;

end.
