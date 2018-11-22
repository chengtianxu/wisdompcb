unit BadDetail_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, RzDTP, RzDBDTP, Vcl.Mask, RzEdit,
  RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient;

type

  TFrmBadDetail_Mod664 = class(TfrmBaseEdit)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    chkSend: TDBCheckBox;
    chkClose: TDBCheckBox;
    lbl9: TLabel;
    lbl10: TLabel;
    edtCode: TRKeyRzBtnEdit;
    edtINVT: TRKeyRzBtnEdit;
    dbdtpk: TRzDBDateTimePicker;
    edtQuantity: TDBEdit;
    edtTrancer: TRKeyRzBtnEdit;
    dbedtBacth: TDBEdit;
    dbmmo1: TDBMemo;
    dbmmo2: TDBMemo;
    cdsBadRecord: TClientDataSet;
    dsBadRecord: TDataSource;
    procedure edtINVTButtonClick(Sender: TObject);
    procedure edtCodeButtonClick(Sender: TObject);
    procedure edtQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure GetData(LRkey:string);
    procedure InitData;
    procedure InitUi;
    { Public declarations }
  end;

var
  FrmBadDetail_Mod664: TFrmBadDetail_Mod664;

implementation

uses  uCommFunc,uBaseSinglePickListFrm;

{$R *.dfm}

{ TFrmBadDetail }

procedure TFrmBadDetail_Mod664.btnSaveClick(Sender: TObject);
begin
  inherited;
  if Trim(edtCode.Text) = '' then
  begin
    ShowMessage('供应商不能为空！');
    edtCode.SetFocus;
    exit;
  end;
  if Trim(edtINVT.Text) = '' then
  begin
    ShowMessage('材料不能为空！');
    edtINVT.SetFocus;
    exit;
  end;
  if chkClose.Checked then
     if MessageDlg('关闭跟踪后将不能再修改记录,确定关闭跟综吗？', mtWarning, [mbyes,mbNo],0) <> mrYes then
      begin
        exit;
      end;
  if chkClose.Checked  then
  begin
      cdsBadRecord.Edit;
      cdsBadRecord.FieldByName('status').Value:= 1;
      cdsBadRecord.Post;
  end;

  cdsBadRecord.Edit;
  cdsBadRecord.FieldByName('ModiDate').Value:= gFunc.GetSvrDateTime();
  cdsBadRecord.Post;

  if gSvrIntf.IntfPostDataByTable('QC_IQCBadRecord',cdsBadRecord.Delta) then
  begin
    cdsBadRecord.MergeChangeLog;
    ShowMessage('保存成功');
    ModalResult:= mrOk;
  end
  else
  begin
    ShowMessage('保存失败');
  end;
end;

procedure TFrmBadDetail_Mod664.edtCodeButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  LFrm:= TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(664,3,' where  dbo.Data0023.abbr_name like ''%'
          + Trim(edtINVT.Text) + '%''');
    if LFrm.ShowModal = mrOk then
    begin
      cdsBadRecord.Edit;
      cdsBadRecord.FieldByName('rkey23').Value:= LFrm.cdsPick.FieldByName('rkey').Value;
      cdsBadRecord.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmBadDetail_Mod664.edtINVTButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
//  inherited;
  if cdsBadRecord.FieldByName('rkey23').AsInteger = 0 then
  begin
    ShowMessage('请先选择供应商！');
    edtCode.SetFocus;
    Exit;
  end;
  LFrm:= TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(664,4,' where data0017.inspect = ''Y'' and Data0028.SUPPLIER_PTR ='
                  + cdsBadRecord.FieldByName('rkey23').AsString + ' AND dbo.Data0017.INV_PART_NUMBER like ''%'
          + Trim(edtINVT.Text) + '%''');
    if LFrm.ShowModal = mrOk then
    begin
      cdsBadRecord.Edit;
      cdsBadRecord.FieldByName('rkey17').Value:= LFrm.cdsPick.FieldByName('rkey').Value;
      cdsBadRecord.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmBadDetail_Mod664.edtQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',edtQuantity.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TFrmBadDetail_Mod664.GetData(LRkey: string);
var
  LSql:string;
begin
  LSql:= cdsBadRecord.CommandText + ' WHERE RKEY= '+ LRkey;
  if not gSvrIntf.IntfGetDataBySql(LSql,cdsBadRecord) then Exit;
end;

procedure TFrmBadDetail_Mod664.InitData;
var
  LDateTime:TDateTime;
begin
  LDateTime:= gFunc.GetSvrDateTime(dtdate);
  cdsBadRecord.Append;
  cdsBadRecord.FieldByName('DiscoverDate').Value:= LDateTime;
  cdsBadRecord.FieldByName('status').Value:= 0;
  cdsBadRecord.Post;
end;

procedure TFrmBadDetail_Mod664.InitUi;
begin
  btnSave.Enabled:=False;
  pnl2.Enabled:= False;
end;

end.
