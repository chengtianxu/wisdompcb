unit SpellCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons;

type
  TfrmSpellCondition = class(TForm)
    pnl1: TPanel;
    pgcBase: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnAppend: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ViewData(OP: Byte);
    procedure btnAppendClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpellCondition: TfrmSpellCondition;

implementation

uses damo, ConstVar, Pick_Item_Single;

{$R *.dfm}

procedure TfrmSpellCondition.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpellCondition.btnRefreshClick(Sender: TObject);
var
  i:Variant;
  j:integer;
begin
  if pgcBase.ActivePage=ts1 then
  begin
    if dm.tblSpellCondition.IsEmpty then Exit;
    i:= VarArrayOf([dm.tblSpellConditionLevelMore.AsInteger,dm.tblSpellConditionParam_PTR.AsInteger]);
    dm.tblSpellCondition.Close;
    dm.tblSpellCondition.Open;
    dm.tblSpellCondition.Locate('LevelMore;Param_PTR',i,[]);
  end
  else
  begin
    if dm.tblSpellDifferentCondition.IsEmpty then Exit;
    j:= dm.tblSpellDifferentConditionParam_PTR.AsInteger;
    dm.tblSpellDifferentCondition.Close;
    dm.tblSpellDifferentCondition.Open;
    dm.tblSpellDifferentCondition.Locate('Param_PTR',j,[]);
  end;
end;

procedure TfrmSpellCondition.ViewData(OP: Byte);
var
  InputVar: PDlgInput;
begin
  if OP=1 then
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
          if pgcBase.ActivePage=ts1 then
          begin
            dm.tblSpellCondition.Append;
            dm.tblSpellCondition.FieldByName('Param_PTR').AsInteger:= FieldByName('RKEY').AsInteger;
          end
          else if pgcBase.ActivePage=ts2 then
          begin
            dm.tblSpellDifferentCondition.Append;
            dm.tblSpellDifferentCondition.FieldByName('Param_PTR').AsInteger:= FieldByName('RKEY').AsInteger;
          end;
        end;
      end;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free;
    end;
  end
  else if OP=2 then
  begin
    if pgcBase.ActivePage=ts1 then
    begin
      dm.tblSpellCondition.Edit;
    end
    else if pgcBase.ActivePage=ts2 then
    begin
      dm.tblSpellDifferentCondition.Edit;
    end;
  end;
end;

procedure TfrmSpellCondition.btnAppendClick(Sender: TObject);
begin
  ViewData(1);
end;

procedure TfrmSpellCondition.btnEditClick(Sender: TObject);
begin
  ViewData(2);
end;

procedure TfrmSpellCondition.btnDeleteClick(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  dm.con1.BeginTrans;
  try
    if pgcBase.ActivePage=ts1 then
    begin
      dm.qryTmp.Close;
      dm.qryTmp.SQL.Text:= 'delete from SpellCondition where LevelMore='+dm.tblSpellConditionLevelMore.AsString
                           +' and Param_PTR='+dm.tblSpellConditionParam_PTR.AsString;
      dm.qryTmp.ExecSQL;
    end
    else if pgcBase.ActivePage=ts2 then
    begin
      dm.qryTmp.Close;
      dm.qryTmp.SQL.Text:= 'delete from SpellDifferentCondition where Param_PTR='+dm.tblSpellDifferentConditionParam_PTR.AsString;
      dm.qryTmp.ExecSQL;
    end;
    dm.con1.CommitTrans;
    ShowMessage('删除数据成功!');
    btnRefreshClick(nil);
  except
    dm.con1.RollbackTrans;
    ShowMessage('删除数据失败!');
  end;
end;

procedure TfrmSpellCondition.btnSaveClick(Sender: TObject);
begin
  if pgcBase.ActivePage=ts1 then dm.tblSpellCondition.UpdateBatch();
  if pgcBase.ActivePage=ts2 then dm.tblSpellDifferentCondition.UpdateBatch();
end;

procedure TfrmSpellCondition.btnCancelClick(Sender: TObject);
begin
  if pgcBase.ActivePage=ts1 then  dm.tblSpellCondition.CancelBatch();
  if pgcBase.ActivePage=ts2 then  dm.tblSpellDifferentCondition.CancelBatch();
end;

end.
