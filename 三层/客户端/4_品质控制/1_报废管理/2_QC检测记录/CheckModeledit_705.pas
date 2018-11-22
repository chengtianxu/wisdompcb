unit CheckModeledit_705;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseDBGridEhListFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Data.Win.ADODB, Vcl.Menus;

type
  TfrmCheckModeledit_705 = class(TfrmBaseDBGridEhList)
    pnl1: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    test: TADOQuery;
    testRkey: TAutoIncField;
    intgrfldTypeID: TIntegerField;
    intgrfldD39_Ptr: TIntegerField;
    intgrfldSeqNo: TIntegerField;
    testREJECT_DESCRIPTION: TStringField;
    pmMain: TPopupMenu;
    mni_Del: TMenuItem;
    cdsTemp: TClientDataSet;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ehMainColumns3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure mni_DelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     FModelID:integer;
      procedure GetData;override;
  end;

var
  frmCheckModeledit_705: TfrmCheckModeledit_705;

implementation
   uses  uCommFunc, uBaseSinglePickListFrm;

{$R *.dfm}

procedure TfrmCheckModeledit_705.btnCloseClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmCheckModeledit_705.btnSaveClick(Sender: TObject);
begin
  inherited;
 if cdsMain.State in [dsEdit,dsInsert] then cdsMain.Post;

  if cdsMain.ChangeCount > 0 then
  begin
    if gSvrIntf.IntfPostDataByTable('QC_DeptBugDefDetail',cdsMain.Delta) then
    begin
      cdsMain.MergeChangeLog;
      ShowMessage('保存成功');
    end else
      ShowMessage('保存失败');
  end;
end;

procedure TfrmCheckModeledit_705.ehMainColumns3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  LFrm: TfrmSinglePickList;
begin
 inherited;
  LFrm := TfrmSinglePickList.Create(self);
  try
    LFrm.InitWithPickID(705, 2);
    if LFrm.showmodal = mrok then
    begin
      CdsMain.edit;
      CdsMain.FieldByName('TypeID').Value := FModelID;
      CdsMain.FieldByName('d39_ptr').Value :=LFrm.cdsPick.FieldByName('rkey').Value;
      CdsMain.FieldByName('reject_description').Value :=LFrm.cdsPick.FieldByName('reject_description').Value;
      CdsMain.Post;
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TfrmCheckModeledit_705.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCheckModeledit_705 := nil;
end;

procedure TfrmCheckModeledit_705.GetData;
var
  LSql: string;
  I: Integer;
begin
  inherited;
  Lsql:='select a.* ,D39.REJECT_DESCRIPTION '+
       ' from QC_DeptBugDefDetail a         '+
       ' inner join  data0039 d39 on a.d39_ptr=D39.rkey '+
       ' where a.TypeID='+inttostr(FModelID)+' '+
       ' order by a.SeqNo';

  gSvrIntf.IntfGetDataBySql(Lsql,cdsMain);

end;

procedure TfrmCheckModeledit_705.mni_DelClick(Sender: TObject);
var
Lsql: string;
begin
  inherited;
   if (not gFunc.CheckUserAuth(1,705)) then Exit;

   if cdsMain.IsEmpty then   exit;

   Lsql :='select * from dbo.QC_DeptBugDefDetail where rkey='+cdsMain.FieldByName('rkey').AsString ;

  gSvrintf.IntfGetDataBySql(Lsql, cdstemp);

  if not cdstemp.IsEmpty then
    cdstemp.Delete;

  if not gSvrintf.IntfPostDataByTable('QC_DeptBugDefDetail', cdstemp.Delta) then
    exit;

    GetData ;

end;

end.
