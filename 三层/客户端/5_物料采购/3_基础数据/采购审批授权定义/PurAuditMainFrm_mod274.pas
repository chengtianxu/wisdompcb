unit PurAuditMainFrm_mod274;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmMainPurAudit_mod274 = class(TfrmBaseMain)
    qrytemp: TADOQuery;
    strngfldUSER_FULL_NAME: TStringField;
    qrytempupper_limit: TBCDField;
    qrytemplower_limit: TBCDField;
    intgrfld_no: TIntegerField;
    strngfldABBR_NAME: TStringField;
    strngfld_code: TStringField;
    wdstrngfldPURCHASE_TYPE: TWideStringField;
    strngfld_id: TStringField;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniDel: TMenuItem;
    cdstemp: TClientDataSet;
    procedure mniAddClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure GetData(); override;
  end;

var
  frmMainPurAudit_mod274: TfrmMainPurAudit_mod274;

implementation
        uses editFrm_mod274;
{$R *.dfm}

{ TfrmMainPurAudit_mod274 }

procedure TfrmMainPurAudit_mod274.GetData;
var
Lsql94,Lsql275:string;
begin

  try
    FMainFrmSql :=
      ' SELECT dbo.Data0073.USER_LOGIN_NAME AS user_id, '+
      ' dbo.Data0073.USER_FULL_NAME, dbo.data0077.user_ptr, dbo.data0077.upper_limit,'+
      ' dbo.data0077.lower_limit, dbo.data0077.seq_no, dbo.Data0015.ABBR_NAME,'+
      ' data0077.warehouse_ptr,data0015.warehouse_code,data0077.PURCHASE_TYPE,data0077.rkey'+
      ' FROM   dbo.data0077 INNER JOIN'+
      ' dbo.Data0073 ON dbo.data0077.user_ptr = dbo.Data0073.RKEY INNER JOIN'+
      ' dbo.Data0015 ON dbo.data0077.warehouse_ptr = dbo.Data0015.RKEY'+
     ' where 1=1 ';

//     if trim(FMainWhere) = '' then
//     FMainWhere := ' and bud_year= '+inttostr(yearof(gFunc.GetSvrDateTime)) ;

    FOrderby := ' ORDER BY Data0015.ABBR_NAME,data0077.seq_no  ';
    // showmessage(FMainFrmSql+FMainWhere+FOrderby);
    inherited;


  except on e:Exception do
  begin
  ShowMessage('错误：'+e.Message);
  exit;
  end;

  end;
end;

procedure TfrmMainPurAudit_mod274.mniAddClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod274;
begin
  inherited;
 if not gfunc.CheckUserAuth(2, 25) then exit;

  LFrm:=Tfrmedit_mod274.Create(self);
  try

  Lfrm.FEditType:=1;
  Lfrm.getData('-1');
  Lfrm.edt_LLimit.Text:='0';
//  Lfrm.rg_method.ItemIndex:=0;


  Lfrm.pnl2.Enabled:=true;
  Lfrm.btnsave.enabled:=true;
  Lfrm.btnclose.enabled:=true;

  if Lfrm.showmodal=mrok then
   begin
    btnRefreshClick(Sender);
    cdsMain.Last;
   end;
  finally
   Lfrm.Free;
  end;
end;

procedure TfrmMainPurAudit_mod274.mniDelClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
 if  cdsMain.IsEmpty then Exit;

 if not gfunc.CheckUserAuth(2, 25) then exit;

  if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
  begin
   Lsql:='select * From data0077  where rkey ='+cdsmain.FieldByName('rkey').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

    if not cdsTemp.IsEmpty then
      cdsTemp.Delete;

    if not gSvrintf.IntfPostDataByTable('data0077', cdsTemp.Delta) then
      exit;

    btnRefreshClick(Sender);
  end;

end;

procedure TfrmMainPurAudit_mod274.mniEditClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod274;
begin
  inherited;
 if not gfunc.CheckUserAuth(2, 25) then exit;

  LFrm:=Tfrmedit_mod274.Create(self);
  try

  Lfrm.FEditType:=2;
  Lfrm.getData(cdsMain.FieldByName('rkey').AsString);
  Lfrm.cbb_type.Text:= cdsMain.FieldByName('PURCHASE_TYPE').AsString;

  Lfrm.pnl2.Enabled:=true;
  Lfrm.btnsave.enabled:=true;
  Lfrm.btnclose.enabled:=true;

  if Lfrm.showmodal=mrok then
   begin
    btnRefreshClick(Sender);
    cdsMain.Last;
   end;
  finally
   Lfrm.Free;
  end;
end;

end.
