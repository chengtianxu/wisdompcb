unit Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls, DB, ADODB,
  RzDTP, RzDBDTP;

type
  TfrmDetail = class(TForm)
    pnlTools: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Panel1: TPanel;
    ds97: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    sbtnUp: TSpeedButton;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    Edit1: TEdit;
    btnLookCust: TBitBtn;
    dtpDate: TRzDBDateTimePicker;
    lblCustName: TLabel;
    OpenDlg: TOpenDialog;
    sbtnDel: TSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLookCustClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure sbtnUpClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure sbtnDelClick(Sender: TObject);
  private
    IsPost: Byte;
    
  public
    procedure SetComponent(vEnabled,vReadOnly: Boolean);
  end;

var
  frmDetail: TfrmDetail;

implementation

uses main, Pick_Item_Single, ConstVar, PubFunc;

{$R *.dfm}

procedure TfrmDetail.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmDetail.btnLookCustClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                        'abbr_name/简称/125';
    InputVar.Sqlstr :=
    'SELECT RKEY,CUST_CODE,CUSTOMER_NAME,abbr_name'+#13+
    'FROM dbo.Data0010'+#13+
    'order by CUST_CODE';
    inputvar.InPut_value:=Edit1.Text;
    inputvar.KeyField:= 'CUST_CODE';
    InputVar.AdoConn := frmMain.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Tag := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      Edit1.Text:= trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
      lblCustName.Caption:= Trim(frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME']);
    end
    else
      Edit1.SetFocus;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDetail.btnSaveClick(Sender: TObject);
var
  i: Integer;
  iComponent: TComponent;
begin
  IsPost:= 1;
  for i:= 0 to ComponentCount - 1 do
  begin
    iComponent:= Components[i];
    if iComponent is TEdit then
    begin
      if (iComponent as TEdit).Hint = '' then Continue;
      if (iComponent as TEdit).Text = '' then
      begin
        ShowMessage((iComponent as TEdit).Hint+'不能为空!');
        if (iComponent as TEdit).CanFocus then
          (iComponent as TEdit).SetFocus;
        Abort;
      end;
    end;
    if iComponent is TDBEdit then
    begin
      if (iComponent as TDBEdit).Hint = '' then Continue;
      if (iComponent as TDBEdit).Text = '' then
      begin
        ShowMessage((iComponent as TDBEdit).Hint+'不能为空!');
        if (iComponent as TDBEdit).CanFocus then
          (iComponent as TDBEdit).SetFocus;
        Abort;
      end;
    end;
  end;

  //检查重复
  if frmMain.YY in[1,2] then
  begin
    if frmMain.YY=1 then
      frmMain.OpenQuery(frmMain.aqTmp,[IntToStr(Edit1.Tag),DBEdit1.Text],
                       'select 1 from data0097 where CUSTOMER_PTR = :CUSTOMER_PTR and PO_NUMBER = :PO_NUMBER',0);
    if frmMain.YY=2 then
      frmMain.OpenQuery(frmMain.aqTmp,[IntToStr(Edit1.Tag),DBEdit1.Text,frmMain.aq97.FieldByName('RKEY').AsString],
                       'select 1 from data0097 where CUSTOMER_PTR = :CUSTOMER_PTR and PO_NUMBER = :PO_NUMBER and rkey <> :rkey',0);
    if frmMain.aqTmp.RecordCount>0 then
    begin
      ShowMessage('该客户已存在相同的客户订单号,不能重复!');
      Abort;
    end;
  end;
  
  frmMain.ADOConn.BeginTrans;
  try
    with frmMain.aq97 do
    begin
      if not (State in [dsinsert, dsedit]) then Edit;
      FieldByName('CUSTOMER_PTR').AsInteger:= Edit1.Tag;
      FieldByName('dept_ptr').AsString:= frmMain.USERRKEY;
      FieldByName('PO_DATE').AsDateTime:= dtpDate.DateTime;
      UpdateBatch();
    end;
    frmMain.ADOConn.CommitTrans;
    Showmessage('保存成功!');
    ModalResult:= mrok;
  except
    frmMain.ADOConn.RollbackTrans;
    Showmessage('保存失败!');
  end;
end;

procedure TfrmDetail.sbtnUpClick(Sender: TObject);
var
  m: TMemoryStream;
begin
  if OpenDlg.Execute then
  begin
    m := TMemoryStream.Create;
    try
      m.LoadFromFile(OpenDlg.FileName);
      PackStream(m);
      if m.Size>10*1024*1024 then
      begin
        Showmessage('文件大小不能超过10M,请重新整理文件再保存...');
        Exit;
      end;
      if not(frmMain.aq97.State in[dsInsert,dsEdit]) then frmMain.aq97.Edit;
      frmMain.aq97.FieldByName('filename').AsString:= ExtractFileName(OpenDlg.FileName);
      (frmMain.aq97.FieldByName('file_content') As TBlobField).LoadFromStream(m);
      IsPost:= 0;
    finally
      m.Free;
    end;
  end;
end;

procedure TfrmDetail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if IsPost = 1 then Exit;
  if frmMain.YY <> 3 then
  begin
    if messagedlg('你确定不保存退出吗?', mtconfirmation, [mbyes, mbno],0) = mryes then
    begin
      if frmMain.aq97.State in [dsInsert, dsEdit] then frmMain.aq97.Cancel;
      self.ModalResult:= mrCancel;
    end
    else
      CanClose:= False;
  end;
end;

procedure TfrmDetail.Edit1Exit(Sender: TObject);
begin
  if frmMain.OpenQuery(frmMain.aqTmp,[Edit1.Text],
                      'select rkey,CUST_CODE,CUSTOMER_NAME,abbr_name from data0010 where CUST_CODE = :CUST_CODE') then
  begin
    if frmMain.aqTmp.RecordCount=0 then
    begin
      if (not(btnLookCust.Focused or btnCancel.Focused)) then
      begin
        Showmessage('错误的客户代码');
        Edit1.SetFocus;
        Exit;
      end;
    end
    else
    begin
      Edit1.Tag:= frmMain.aqTmp.FieldValues['rkey'];
      Edit1.Text:= frmMain.aqTmp.FieldValues['CUST_CODE'];
      lblCustName.Caption:= frmMain.aqTmp.FieldValues['CUSTOMER_NAME'];
    end;
  end;
end;

procedure TfrmDetail.FormShow(Sender: TObject);
begin
  IsPost:= 1;
end;

procedure TfrmDetail.Edit1Change(Sender: TObject);
begin
  IsPost:= 0;
end;

procedure TfrmDetail.SetComponent(vEnabled,vReadOnly: Boolean);
var
  i: Integer;
  iComponent: TComponent;
begin
  for i:= 0 to ComponentCount - 1 do
  begin
    iComponent:= Components[i];
    if iComponent is TEdit then (iComponent as TEdit).ReadOnly:= vReadOnly;
    if iComponent is TDBEdit then (iComponent as TDBEdit).ReadOnly:= vReadOnly;
    if iComponent is TDBMemo then (iComponent as TDBMemo).ReadOnly:= vReadOnly;
    if iComponent is TBitBtn then (iComponent as TBitBtn).Enabled:= vEnabled;
    if iComponent is TSpeedButton then (iComponent as TSpeedButton).Enabled:= vEnabled;
    if iComponent is TRzDBDateTimePicker then (iComponent as TRzDBDateTimePicker).Enabled:= vEnabled;    
  end;
end;

procedure TfrmDetail.sbtnDelClick(Sender: TObject);
begin
  if not(frmMain.aq97.State in[dsInsert,dsEdit]) then frmMain.aq97.Edit;
  frmMain.aq97.FieldByName('filename').AsString:= '';
  (frmMain.aq97.FieldByName('file_content') As TBlobField).Clear;
  IsPost:= 0;
end;

end.
