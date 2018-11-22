unit CheckRecordMrg_705;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.ExtCtrls,
  uBaseSinglePickListFrm, Vcl.XPMan, Vcl.Menus, Vcl.Buttons, Vcl.ComCtrls,
  System.DateUtils, Data.Win.ADODB, BaseCheck_Mod705;

type
  TFrmCheckRecordMrg_705 = class(TfrmBaseMain)
    btnPrint: TBitBtn;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    mni_edit: TMenuItem;
    mni_check: TMenuItem;
    test: TADOQuery;
    testrkey: TAutoIncField;
    testQCDate: TDateTimeField;
    testWORK_ORDER_NUMBER: TStringField;
    testMANU_PART_NUMBER: TStringField;
    testTypeName: TStringField;
    testQCTestName: TStringField;
    testQCTestRound: TIntegerField;
    testAllQty: TIntegerField;
    testPassQty: TIntegerField;
    testFailQty: TIntegerField;
    testemployee_name: TStringField;
    testQCDateTime: TDateTimeField;
    testBakNote: TStringField;
    mni_Del: TMenuItem;
    cdstempt: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mni_editClick(Sender: TObject);
    procedure mni_checkClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure mni_DelClick(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ehMainDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddRefresh;
    function GetEditFrm(ATestName:string): TfrmBaseCheck_Mod705;

  public
    { Public declarations }
    FModelID: integer;
    FTestName:string;
    procedure GetData; override;
  end;

var
  FrmCheckRecordMrg_705: TFrmCheckRecordMrg_705;

implementation

uses
  uCommFunc, FQCCheckRecordEdit_705, ElecCheckEdit_705,AOICheckRecordEdit_705,AOICheckRecordEdit_705_ZH;
{$R *.dfm}

{ TFrmCheckRecordMrg_FQC }
procedure TFrmCheckRecordMrg_705.AddRefresh;
var
  FBK: TBookmark;
begin

  FBK := cdsMain.bookmark;
  btnRefreshClick(btnRefresh);
  cdsMain.gotobookmark(FBK);

end;

procedure TFrmCheckRecordMrg_705.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCheckRecordMrg_705.btnQryClick(Sender: TObject);
begin
   FMainWhereID:=0;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'A.QCdate';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString :=
      FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-1) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '1';
    cdsMainWhereInit.Post;
  end;
  inherited;

end;

procedure TFrmCheckRecordMrg_705.btnRefreshClick(Sender: TObject);
begin
  // inherited;
  GetData;
end;

procedure TFrmCheckRecordMrg_705.ehMainDblClick(Sender: TObject);
begin
  inherited;
 if  cdsMain.IsEmpty then exit;
 mni_checkClick(mni_check);

end;

procedure TFrmCheckRecordMrg_705.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;
  FrmCheckRecordMrg_705 := nil;
end;

procedure TFrmCheckRecordMrg_705.FormCreate(Sender: TObject);
begin
  inherited;
  dtp2.DateTime := gFunc.GetSvrDateTime();
  dtp1.DateTime := IncDay(dtp2.DateTime, -2);
end;

procedure TFrmCheckRecordMrg_705.GetData;
begin

  FMainFrmSql :=
    'select   a.IDKey, a.QCDate, d06.WORK_ORDER_NUMBER,d25.MANU_PART_NUMBER,c.TypeName,a.QCTestName,QCTestRound, a.AllQty, '
    + ' a.PassQty, A.FailQty, D05.employee_name,QCDateTime,BakNote ' +
    ' from  QC_ReportMain a ' +
    ' inner join data0006 d06 on  a.d06_ptr=d06.rkey  ' +
    ' inner join data0025 d25 on d06.BOM_PTR=d25.RKEY  ' +
    ' inner join QC_DeptBugDef c  on a.TypeID = c.ID ' +
    ' inner join data0005 d05 on a.d05_ptr=d05.rkey where 1=1 and a.TypeID=' +
    inttostr(FModelID) + '  ';

  if FMainWhere = '' then
    FMainWhere := ' and a.QCDate>=''' + FormatDateTime('yyyy-MM-dd', dtp1.date)
      + ''' and  a.QCDate<=''' + FormatDateTime('yyyy-MM-dd', dtp2.date)
      + '''    ';

  FOrderby := ' ORDER BY  a.rkey desc ';
  // ShowMessage(FMainFrmSql+FMainWhere);

  inherited;
end;

procedure TFrmCheckRecordMrg_705.mni_DelClick(Sender: TObject);
var
  Lsql: string;
begin
  inherited;
  if (not gFunc.CheckUserAuth(1000, 705)) then
    Exit;

  if cdsMain.IsEmpty then
    Exit;

  Lsql := 'select * from QC_ReportMain where IDKey=''' +
    cdsMain.FieldByName('IDKey').AsString + '''  ';

  gSvrintf.IntfGetDataBySql(Lsql, cdstempt);

  if not cdstempt.IsEmpty then
    cdstempt.Delete;

  if not gSvrintf.IntfPostDataByTable('QC_ReportMain', cdstempt.Delta) then
    Exit;

  btnRefreshClick(btnRefresh);
end;

procedure TFrmCheckRecordMrg_705.mni_editClick(Sender: TObject);
var
  LFrm: TfrmBaseCheck_Mod705;
begin
  inherited;
  if cdsMain.IsEmpty then
    Exit;

  if (not gFunc.CheckUserAuth(1000, 705)) then
    Exit;

  LFrm := GetEditFrm(FTestName);
  if LFrm = nil then
    Exit;

  LFrm.CdsRMain.ReadOnly := false;
  LFrm.CdsRDetail.ReadOnly := false;
  LFrm.btn_Save.Enabled := true;
  LFrm.pnl8.Enabled := true;

  LFrm.FModelID := FModelID;
  LFrm.FEType := 2;
  LFrm.InitModel(FModelID, 2, cdsMain.FieldByName('IDKey').AsString);
  LFrm.AddRefresh := AddRefresh;

  LFrm.Show;
end;

procedure TFrmCheckRecordMrg_705.mni_checkClick(Sender: TObject);
var
  LFrm: TfrmBaseCheck_Mod705;
begin
  inherited;
  if cdsMain.IsEmpty then
    Exit;

  if  (not gFunc.CheckUserAuth(999,705)) then
   Exit;

  LFrm := GetEditFrm(FTestName);
  if LFrm = nil then
    Exit;

  LFrm.CdsRMain.ReadOnly := false;
  LFrm.CdsRDetail.ReadOnly := false;
  LFrm.btn_Save.Enabled := true;
  LFrm.pnl8.Enabled := true;

  LFrm.FModelID := FModelID;
  LFrm.FEType := 3;
  LFrm.InitModel(FModelID, 3, cdsMain.FieldByName('IDKey').AsString);
  LFrm.AddRefresh := AddRefresh;

  LFrm.dtpQC.DateTime := cdsMain.FieldByName('QCDate').AsDateTime;

  LFrm.CdsRMain.ReadOnly := true;
  LFrm.CdsRDetail.ReadOnly := true;
  LFrm.btn_Save.Enabled := false;
  LFrm.pnl8.Enabled := false;
  LFrm.Show;
end;

function TFrmCheckRecordMrg_705.GetEditFrm(ATestName:string): TfrmBaseCheck_Mod705;
begin
//  if (AModelid =3)  and (FTestName='') and  (gFunc.CheckUserAuth(3, 705)) then
//   Result := TFrmAOICheckRecordEdit_705_MZ.Create(self)
//  if (AModelid =4) and  (gFunc.CheckUserAuth(4, 705)) then
//   Result := TFrmAOICheckRecordEdit_705_MZ.Create(self)
//  if (AModelid =5) and  (gFunc.CheckUserAuth(5, 705)) then
//   Result := TFrmAOICheckRecordEdit_705_MZ.Create(self)
//  else
   if (ATestName = '1厂FQC') and (gFunc.CheckUserAuth(1, 705)) then // 1厂FQC
  begin
    Result := TFrmFQCCheckRecordEdit_705.Create(self);
  end
  else if (ATestName = '2厂FQC') and (gFunc.CheckUserAuth(2, 705)) then // 2厂FQC
  begin
    Result := TFrmFQCCheckRecordEdit_705.Create(self);
  end
  else if (ATestName = '1厂电测') and (gFunc.CheckUserAuth(3, 705)) then // 1厂电测
  begin
    Result := TfrmElecCheckEdit_705.Create(self);
  end
  else if (ATestName = '2厂电测') and (gFunc.CheckUserAuth(4, 705)) then // 2厂电测
  begin
    Result := TfrmElecCheckEdit_705.Create(self);
  end
  else if (ATestName = '1厂内层AOI') and (gFunc.CheckUserAuth(5, 705)) then // 1厂AOI内层
  begin
    Result := TFrmAOICheckRecordEdit_705.Create(self);
  end
  else if (ATestName = '1厂外层AOI') and (gFunc.CheckUserAuth(6, 705)) then // 1厂AOI外层
  begin
      Result := TFrmAOICheckRecordEdit_705.Create(self);
  end
  else if (ATestName = '2厂内层AOI') and (gFunc.CheckUserAuth(7, 705)) then // 2厂AOI内层
  begin
      Result := TFrmAOICheckRecordEdit_705.Create(self);
  end
  else if (ATestName = '2厂外层AOI') and (gFunc.CheckUserAuth(8, 705)) then // 2厂AOI外层
  begin
      Result := TFrmAOICheckRecordEdit_705.Create(self);
  end
  else if (ATestName = '2厂次外层AOI') and (gFunc.CheckUserAuth(9, 705)) then // 2厂AOI次外层
  begin
     Result := TFrmAOICheckRecordEdit_705.Create(self);
  end
 //MZ :
  else if (ATestName = '志浩FQC') and (gFunc.CheckUserAuth(1, 705)) then // zh FQC
  begin
     Result := TFrmFQCCheckRecordEdit_705.Create(self);
  end
  else if (ATestName = '志浩电测') and (gFunc.CheckUserAuth(2, 705)) then // zh FQC
  begin
     Result := TfrmElecCheckEdit_705.Create(self);
  end
  else if (ATestName = '志浩内层AOI') and (gFunc.CheckUserAuth(3, 705)) then // zh FQC
  begin
     Result := TFrmAOICheckRecordEdit_705_ZH.Create(self);
  end
  else if (ATestName = '志浩外层AOI') and (gFunc.CheckUserAuth(4, 705)) then // zh FQC
  begin
     Result := TFrmAOICheckRecordEdit_705_ZH.Create(self);
  end
  else if (ATestName = '志浩次外层AOI') and (gFunc.CheckUserAuth(5, 705)) then // zh FQC
  begin
     Result := TFrmAOICheckRecordEdit_705_ZH.Create(self);
  end
  else
    Result := nil;
end;

end.
