unit Mail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzSplit, RzButton, StdCtrls, RzLstBox,
  RzDBList, RzBorder, RzLabel, RzBckgnd, RzStatus, RzDBStat, RzDBEdit,
  RzCmboBx, Mask, RzEdit, Grids, DBGrids, RzDBGrid, RzBtnEdt, RzSpnEdt,DB,
  DBCtrls, AppEvnts;

type
  TFrmMain = class(TForm)
    RzSizePnlToolsbar: TRzSizePanel;
    RzBitBtnNew: TRzBitBtn;
    RzBitBtnEdit: TRzBitBtn;
    RzBitBtnDel: TRzBitBtn;
    RzBitBtnExit: TRzBitBtn;
    RzSplitter1: TRzSplitter;
    RzPnlLeft: TRzPanel;
    RzPnlRight: TRzPanel;
    RzLabTitle: TRzLabel;
    RzDBGrdCodeName: TRzDBGrid;
    RzLabCode: TRzLabel;
    RzLabName: TRzLabel;
    RzLabType: TRzLabel;
    RzEdtCode: TRzEdit;
    RzEdtName: TRzEdit;
    RzCmbBoxType: TRzComboBox;
    RzLabOh: TRzLabel;
    RzLabSupp: TRzLabel;
    RzBtnEdtSupp: TRzButtonEdit;
    RzLabFass: TRzLabel;
    RzBtnEdtFass: TRzButtonEdit;
    RzLabRemark: TRzLabel;
    RzMemoRemark: TRzMemo;
    RzBitBtnSave: TRzBitBtn;
    RzBitBtnCancle: TRzBitBtn;
    RzSpinEdtOh: TRzSpinEdit;
    RzLabShortName: TRzLabel;
    RzLabLongName: TRzLabel;
    RzLabel1: TRzLabel;
    RzCmbBoxShowType: TRzComboBox;
    ApplicationEvents1: TApplicationEvents;
    procedure RzBitBtnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtnNewClick(Sender: TObject);
    procedure RzBitBtnCancleClick(Sender: TObject);
    procedure RzCmbBoxTypeChange(Sender: TObject);
    procedure RzNumEdtOhRangeError(Sender: TObject; EnteredValue,
      AdjustedValue: Extended; var AutoCorrect: Boolean);
    procedure RzBitBtnSaveClick(Sender: TObject);
    procedure RzBitBtnEditClick(Sender: TObject);
    procedure RzBitBtnDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBtnEdtSuppButtonClick(Sender: TObject);
    procedure RzBtnEdtSuppExit(Sender: TObject);
    procedure RzBtnEdtFassExit(Sender: TObject);
    procedure RzBtnEdtFassButtonClick(Sender: TObject);
    procedure RzEdtCodeEnter(Sender: TObject);
    procedure RzEdtNameEnter(Sender: TObject);
    procedure RzCmbBoxTypeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzCmbBoxShowTypeChange(Sender: TObject);
    procedure RzCmbBoxShowTypeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
  private
    { Private declarations }
    WorkState:string;
    procedure DisableInput;
    procedure EnableInput;
    procedure ProgramIntial;
    procedure ClearInput;
    procedure TypeControl;

  public
    { Public declarations }
    procedure ShowData;
  end;

var
  FrmMain: TFrmMain;

implementation

  uses DM_U,common,Pick_Item_Single,ConstVar;

{$R *.dfm}



procedure TFrmMain.RzBitBtnExitClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  ProgramIntial;
end;



procedure TFrmMain.DisableInput;
begin
  RzEdtCode.Enabled:=false;
  RzEdtName.Enabled:=false;
  RzCmbBoxType.Enabled:=false;
  RzSpinEdtOh.Enabled:=false;
  RzBtnEdtSupp.Enabled:=false;
  RzBtnEdtFass.Enabled:=false;
  RzMemoRemark.Enabled:=false;
end;

procedure TFrmMain.EnableInput;
begin
  RzEdtCode.Enabled:=true;
  RzEdtName.Enabled:=true;
  RzCmbBoxType.Enabled:=true;
  RzSpinEdtOh.Enabled:=true;
  RzBtnEdtSupp.Enabled:=true;
  RzBtnEdtFass.Enabled:=true;
  RzMemoRemark.Enabled:=true;
end;

procedure TFrmMain.ProgramIntial;
begin
  RzBitBtnNew.Enabled:=true;
  RzBitBtnSave.Visible:=false;
  RzBitBtnCancle.Visible:=false;
  RzBitBtnEdit.Visible:=true;
  RzBitBtnEdit.Enabled:=false;
  RzBitBtnDel.Visible:=true;
  RzBitBtnDel.Enabled:=false;
  RzDBGrdCodeName.Enabled:=true;
  RzLabShortName.Caption:='';
  RzLabLongName.Caption:='';
  RzCmbBoxShowType.Enabled:=true;
  DisableInput;
  if not dm.ACON.Connected then
  try
    dm.ACON.Open;
  except
    on e:exception do
    begin
      showmessage('数据库连接异常,程序即将关闭，请重新运行程序！'+#13+#13+'错误原因：'+e.Message);
      application.Terminate;
    end;
  end;

  try
    dm.AQ160.Close;
    dm.AQ160.Open;
  except
    on e:Exception do
    begin
      showmessage('读取数据异常,程序即将关闭，请重新运行程序！'+#13+#13+'错误原因：'+e.Message);
      application.Terminate;
    end;
  end;

  if not dm.AQ160.IsEmpty  then
  begin
    RzBitBtnEdit.Enabled:=true;
    RzBitBtnDel.Enabled:=true;
    if WorkState='NEW' then dm.AQ160.Last;
    if WorkState='EDIT' then dm.AQ160.Locate('Rkey',RzBitBtnEdit.Tag,[loCaseInsensitive]);
    if WorkState='' then dm.AQ160.First;
    WorkState:='';
    RzBitBtnEdit.Tag:=0;
    ShowData;
  end;

  if (vprev='1') or (vprev='3') then
  begin
    RzBitBtnNew.Enabled:=false;
    RzBitBtnEdit.Enabled:=false;
    RzBitBtnDel.Enabled:=false;
  end;
end;

procedure TFrmMain.ShowData;
begin
  RzEdtCode.Text:=dm.AQ160LOCATION_CODE.AsString;
  RzEdtName.Text:=dm.AQ160LOCATION_NAME.AsString;
  RzCmbBoxType.Value:=dm.AQ160TYPE.AsString;
  RzSpinEdtOh.Value:=dm.AQ160OH_degree.Value;
  RzBtnEdtSupp.Tag:=dm.AQ160SUPPLIER_PTR.Value;
  RzBtnEdtSupp.Text:=dm.AQ160CODE.AsString;
  RzBtnEdtFass.Tag:=dm.AQ160FASSET_PTR.Value;
  RzBtnEdtFass.Text:=dm.AQ160FASSET_CODE.AsString;
  RzMemoRemark.Text:=dm.AQ160REMARK.AsString;
  RzLabShortName.Caption:='';
  RzLabLongName.Caption:='';
  case dm.AQ160TYPE.Value of
    3:
    begin
      RzLabShortName.Caption:=dm.AQ160FASSET_NAME.AsString;
      RzLabLongName.Caption:=dm.AQ160FASSET_DESC.AsString;
    end;
    4:
    begin
      RzLabShortName.Caption:=dm.AQ160ABBR_NAME.AsString;
      RzLabLongName.Caption:=dm.AQ160SUPPLIER_NAME.AsString;
    end;
  else
    RzLabShortName.Caption:='';
    RzLabLongName.Caption:='';
  end;
  TypeControl;
end;

procedure TFrmMain.RzBitBtnNewClick(Sender: TObject);
begin

  RzBitBtnEdit.Visible:=false;
  RzBitBtnDel.Visible:=false;
  RzBitBtnSave.Visible:=true;
  RzBitBtnCancle.Visible:=true;
  RzBitBtnNew.Enabled:=false;
  RzDBGrdCodeName.Enabled:=false;
  RzCmbBoxShowType.Enabled:=false;
  ClearInput;
  EnableInput;
  try
    dm.ADOQuery1.Close;
    dm.ADOQuery1.Parameters.ParamValues['Rkey']:=0;
    dm.ADOQuery1.Open;
    dm.ADOQuery1.Append;
  except
    on e:exception do
    begin
      showmessage('数据操作失败，程序即将关闭，请重新运行程序！'+#13+#13+'错误原因：'+e.Message);
      application.Terminate;
    end;
  end;
  RzEdtCode.SetFocus;
  WorkState:='NEW';
end;

procedure TFrmMain.RzBitBtnCancleClick(Sender: TObject);
begin
  dm.ADOQuery1.Cancel;
  dm.ADOQuery1.Close;
  ClearInput;
  ProgramIntial;
end;

procedure TFrmMain.ClearInput;
begin
  RzEdtCode.Text:='';
  RzEdtName.Text:='';
  if WorkState='EDIT' then RzCmbBoxType.Value:=dm.AQ160TYPE.AsString
  else RzCmbBoxType.ItemIndex:=-1;
  RzSpinEdtOh.Value:=0;
  RzBtnEdtSupp.Text:='';
  RzBtnEdtSupp.Tag:=0;
  RzBtnEdtFass.Text:='';
  RzBtnEdtFass.Tag:=0;
  RzMemoRemark.Text:='';
  RzLabShortName.Caption:='';
  RzLabLongName.Caption:='';
end;

procedure TFrmMain.RzCmbBoxTypeChange(Sender: TObject);
begin
  TypeControl;
end;

procedure TFrmMain.TypeControl;
begin
  RzLabSupp.Visible:=false;
  RzBtnEdtSupp.Visible:=false;
  RzLabFass.Visible:=false;
  RzBtnEdtFass.Visible:=false;
  if RzCmbBoxType.ItemIndex=-1 then exit;
  RzLabOh.Caption:='翻磨次数';
  case strtoint(RzCmbBoxType.Value) of
    1,2,5:
    begin
      RzLabShortName.Caption:='';
      RzLabLongName.Caption:='';
    end;
    3:
    begin
      RzLabOh.Caption:='机器主轴数量';
      RzLabFass.Visible:=true;
      RzBtnEdtFass.Visible:=true;
      RzLabSupp.Visible:=false;
      RzBtnEdtSupp.Visible:=false;
      RzBtnEdtFassExit(nil);
      //if RzBitBtnSave.Visible=true then RzSpinEdtOh.Enabled:=true;
    end;
    4:
    begin
      RzLabFass.Visible:=false;
      RzBtnEdtFass.Visible:=false;
      RzLabSupp.Visible:=true;
      RzBtnEdtSupp.Visible:=true;
      RzBtnEdtSuppExit(nil);
    end;
  end;
end;

procedure TFrmMain.RzNumEdtOhRangeError(Sender: TObject; EnteredValue,
  AdjustedValue: Extended; var AutoCorrect: Boolean);
begin
  showmessage('翻磨次数输入错误，请重新输入！');
end;

procedure TFrmMain.RzBitBtnSaveClick(Sender: TObject);
begin
  if trim(RzEdtCode.Text)='' then
  begin
    showmessage('请输入位置位码');
    RzEdtCode.SetFocus;
    exit;
  end;

  if trim(RzEdtName.Text)='' then
  begin
    showmessage('请输入位置说明');
    RzEdtName.SetFocus;
    exit;
  end;

  if RzCmbBoxType.ItemIndex=-1 then
  begin
    showmessage('请选择位置类型');
    RzCmbBoxType.SetFocus;
    exit;
  end;

  try
    dm.ADOQuery1LOCATION_CODE.Value:=trim(RzEdtCode.Text);
    dm.ADOQuery1LOCATION_NAME.Value:=trim(RzEdtName.Text);
    dm.ADOQuery1TYPE.AsString:=RzCmbBoxType.Value;
    if RzCmbBoxType.Value<>dm.AQ160TYPE.AsString then
    begin
      case strtoint(RzCmbBoxType.Value) of
        3:RzBtnEdtSupp.Tag:=0;
        4:RzBtnEdtFass.Tag:=0;
      end;
    end;
    dm.ADOQuery1OH_degree.Value:=RzSpinEdtOh.IntValue;
    if RzBtnEdtSupp.Tag=0 then dm.ADOQuery1SUPPLIER_PTR.AsVariant:=null
    else dm.ADOQuery1SUPPLIER_PTR.Value:=RzBtnEdtSupp.Tag;
    if RzBtnEdtFass.Tag=0 then dm.ADOQuery1FASSET_PTR.AsVariant:=null
    else dm.ADOQuery1FASSET_PTR.Value:=RzBtnEdtFass.Tag;
    dm.ADOQuery1REMARK.Value:=RzMemoRemark.Text;
    dm.ADOQuery1.Post;
  except
    on e:exception do
    begin
      showmessage('保存数据过程中出现错误，请确认位置代码是否已被使用！'+#13+#13+'错误原因：'+e.Message);
      RzEdtCode.SetFocus;
      exit;
    end;
  end;
  dm.ADOQuery1.Close;
  ProgramIntial;
end;

procedure TFrmMain.RzBitBtnEditClick(Sender: TObject);
begin
  RzBitBtnEdit.Visible:=false;
  RzBitBtnDel.Visible:=false;
  RzBitBtnSave.Visible:=true;
  RzBitBtnCancle.Visible:=true;
  RzBitBtnNew.Enabled:=false;
  RzDBGrdCodeName.Enabled:=false;
  RzCmbBoxShowType.Enabled:=false;
  try
    dm.ADOQuery1.Close;
    dm.ADOQuery1.Parameters.ParamValues['Rkey']:=dm.AQ160RKEY.Value;
    dm.ADOQuery1.Open;
    dm.ADOQuery1.Edit;
    dm.AQ220.Close;
    dm.AQ220.Parameters.ParamValues['RKEY']:=dm.AQ160RKEY.Value;
    dm.AQ220.Open;
  except
    on e:exception do
    begin
      showmessage('程序执行过程中出现错误，程序即将关闭，请重新运行程序'+#13+#13+'错误原因：'+e.Message);
      application.Terminate;
    end;
  end;
  EnableInput;
  if not dm.AQ220.IsEmpty then
  begin
    RzCmbBoxType.Enabled:=false;
    RzSpinEdtOh.Enabled:=false;
  end;
  if RzCmbBoxType.Value='3' then
  begin
    RzSpinEdtOh.Enabled:=true;
    RzBtnEdtFassExit(Sender);
  end;
  if RzCmbBoxType.Value='4' then RzBtnEdtSuppExit(Sender);
  RzEdtCode.SetFocus;
  WorkState:='EDIT';
  RzBitBtnEdit.Tag:=dm.AQ160RKEY.Value;
end;

procedure TFrmMain.RzBitBtnDelClick(Sender: TObject);
begin
  if Messagedlg('数据删除为不可逆操作，是否确认删除？',mtConfirmation,[mbYES,mbNO],0)=mrYES then
  begin
    try
      dm.ADOQuery1.Close;
      dm.ADOQuery1.Parameters.ParamValues['Rkey']:=dm.AQ160RKEY.Value;
      dm.ADOQuery1.Open;
      dm.ADOQuery1.Delete;
    except
      on e:exception do
      begin
        showmessage('数据删除失败，可能该钻咀位置已被使用！'+#13+#13+'错误原因：'+e.Message);      end;
    end;
    ProgramIntial;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if dm.ACON.Connected then
  begin
    showmessage('开发模式运行中，请发布程序前关闭连接！');
    vprev:='4';
  end
  else
    if not app_init_2(dm.ACON) then
    begin
      showmsg('程序起动失败,请与管理员联系!',1);
      application.Terminate;
    end;
  Caption:= application.Title;
  WorkState:='';
end;

procedure TFrmMain.RzBtnEdtSuppButtonClick(Sender: TObject);
  var InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields:='CODE/供应商代码/80,ABBR_NAME/供应商简称/80,SUPPLIER_NAME/供应商名称/330,RKEY/Rkey/1';
    InputVar.Sqlstr :='SELECT CODE, SUPPLIER_NAME, ABBR_NAME, RKEY '+#13+
                      'FROM dbo.Data0023'+#13+
                      'WHERE (ttype = 1) OR (ttype = 2)';
    Inputvar.KeyField:='CODE';
    Inputvar.InPut_value:=trim(RzBtnEdtSupp.Text);
    InputVar.AdoConn :=DM.ACON;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      RzBtnEdtSupp.Text:= frmPick_Item_Single.adsPick.FieldValues['CODE'];
      RzBtnEdtSupp.Tag:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      RzLabShortName.Caption:=frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      RzLabLongName.Caption:=frmPick_Item_Single.adsPick.FieldValues['SUPPLIER_NAME'];
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmMain.RzBtnEdtSuppExit(Sender: TObject);
  var InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields:='CODE/供应商代码/80,ABBR_NAME/供应商简称/80,SUPPLIER_NAME/供应商名称/330,RKEY/Rkey/1';
    InputVar.Sqlstr :='SELECT CODE, SUPPLIER_NAME, ABBR_NAME, RKEY '+#13+
                      'FROM dbo.Data0023'+#13+
                      'WHERE (ttype = 1) OR (ttype = 2)';
    Inputvar.KeyField:='CODE';
    Inputvar.InPut_value:=trim(RzBtnEdtSupp.Text);
    InputVar.AdoConn :=DM.ACON;
    frmPick_Item_Single.InitForm_New(InputVar);
    if trim(RzBtnEdtSupp.Text)='' then
    begin
      RzBtnEdtSupp.Tag:=0;
      RzLabShortName.Caption:='';
      RzLabLongName.Caption:='';
      exit;
    end;
    if (trim(RzBtnEdtSupp.Text)=frmPick_Item_Single.adsPick.FieldValues['CODE']) then
    begin
      RzBtnEdtSupp.Tag:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      RzLabShortName.Caption:=frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      RzLabLongName.Caption:=frmPick_Item_Single.adsPick.FieldValues['SUPPLIER_NAME'];
    end
    else
    begin
      showmessage('研磨供应商输入错误，请重新输入！');
      RzBtnEdtSupp.SetFocus;
      RzBtnEdtSupp.SelectAll;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmMain.RzBtnEdtFassButtonClick(Sender: TObject);
  var InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields:='FASSET_CODE/固定资产代码/80,FASSET_NAME/固定资产名称/200,FASSET_DESC/固定资产描述/330,RKEY/Rkey/1';
    InputVar.Sqlstr :='SELECT FASSET_CODE,FASSET_NAME,FASSET_DESC,RKEY '+#13+
                      'FROM Data0517';
    Inputvar.KeyField:='FASSET_CODE';
    Inputvar.InPut_value:=trim(RzBtnEdtFass.Text);
    InputVar.AdoConn :=DM.ACON;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      RzBtnEdtFass.Text:= frmPick_Item_Single.adsPick.FieldValues['FASSET_CODE'];
      RzLabShortName.Caption:=frmPick_Item_Single.adsPick.FieldValues['FASSET_NAME'];
      RzLabLongName.Caption:=frmPick_Item_Single.adsPick.FieldValues['FASSET_DESC'];
      RzBtnEdtFass.Tag:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmMain.RzBtnEdtFassExit(Sender: TObject);
  var InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields:='FASSET_CODE/固定资产代码/80,FASSET_NAME/固定资产名称/200,FASSET_DESC/固定资产描述/330,RKEY/Rkey/1';
    InputVar.Sqlstr :='SELECT FASSET_CODE,FASSET_NAME,FASSET_DESC,RKEY '+#13+
                      'FROM Data0517';
    Inputvar.KeyField:='FASSET_CODE';
    Inputvar.InPut_value:=trim(RzBtnEdtFass.Text);
    InputVar.AdoConn :=DM.ACON;
    frmPick_Item_Single.InitForm_New(InputVar);
    if trim(RzBtnEdtFass.Text)='' then
    begin
      RzBtnEdtFass.Tag:=0;
      RzLabShortName.Caption:='';
      RzLabLongName.Caption:='';
      exit;
    end;
    if trim(RzBtnEdtFass.Text)=trim(frmPick_Item_Single.adsPick.FieldValues['FASSET_CODE']) then
    begin
      RzBtnEdtFass.Tag:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      RzLabShortName.Caption:=frmPick_Item_Single.adsPick.FieldValues['FASSET_NAME'];
      RzLabLongName.Caption:=frmPick_Item_Single.adsPick.FieldValues['FASSET_DESC'];
    end
    else
    begin
      showmessage('固定资产卡片输入错误，请重新输入！');
      RzBtnEdtFass.SetFocus;
      RzBtnEdtFass.SelectAll;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmMain.RzEdtCodeEnter(Sender: TObject);
begin
  RzEdtCode.SelectAll;
end;

procedure TFrmMain.RzEdtNameEnter(Sender: TObject);
begin
  RzEdtName.SelectAll;
end;

procedure TFrmMain.RzCmbBoxTypeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  RzCmbBoxType.SelectAll;
end;

procedure TFrmMain.RzCmbBoxShowTypeChange(Sender: TObject);
begin
  if RzCmbBoxShowType.Value='0' then dm.AQ160.Filter:=''
  else dm.AQ160.Filter:='TYPE='+RzCmbBoxShowType.Value;
  ProgramIntial;
end;

procedure TFrmMain.RzCmbBoxShowTypeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  RzCmbBoxShowType.SelectAll;
end;

procedure TFrmMain.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if (RzDBGrdCodeName.Focused) and (Msg.message=WM_MOUSEWHEEL) then
  begin
    if Msg.wParam >0  then
      SendMessage(RzDBGrdCodeName.Handle, WM_KEYDOWN, VK_UP, 0)
    else
      SendMessage(RzDBGrdCodeName.Handle, WM_KEYDOWN, VK_DOWN, 0);
    Handled :=True;
  end; 
end;

end.
