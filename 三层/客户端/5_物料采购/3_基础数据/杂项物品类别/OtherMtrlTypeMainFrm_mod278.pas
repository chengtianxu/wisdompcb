unit OtherMtrlTypeMainFrm_mod278;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmMainOtherMtrlType_mod278 = class(TfrmBaseMain)
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniDel: TMenuItem;
    cdstemp: TClientDataSet;
    qrytemp: TADOQuery;
    strngfldDESCRIPTION: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  frmMainOtherMtrlType_mod278: TfrmMainOtherMtrlType_mod278;

implementation
    uses editFrm_mod278;
{$R *.dfm}

procedure TfrmMainOtherMtrlType_mod278.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
       frmMainOtherMtrlType_mod278:=nil;
end;

procedure TfrmMainOtherMtrlType_mod278.GetData;
var
Lsql75:string;
begin

  try
    FMainFrmSql :=
      ' select * from data0075'+
     ' where 1=1 ';

//     if trim(FMainWhere) = '' then
//     FMainWhere := ' and bud_year= '+inttostr(yearof(gFunc.GetSvrDateTime)) ;

    FOrderby := ' order by rkey  ';

    inherited;

  except on e:Exception do
  begin
  ShowMessage('错误：'+e.Message);
  exit;
  end;

  end;
end;

procedure TfrmMainOtherMtrlType_mod278.mniAddClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod278;
begin
  inherited;
  if not gfunc.CheckUserAuth(2, 25) then exit;
  LFrm:=Tfrmedit_mod278.Create(self);
  try

  Lfrm.FEditType:=1;
  Lfrm.getData('-1');

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

procedure TfrmMainOtherMtrlType_mod278.mniDelClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if  cdsMain.IsEmpty then Exit;

  if not gfunc.CheckUserAuth(2, 25) then exit;

  if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
  begin
   Lsql:='select * From data0075  where rkey ='+cdsmain.FieldByName('rkey').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

    if not cdsTemp.IsEmpty then
      cdsTemp.Delete;

    if not gSvrintf.IntfPostDataByTable('data0075', cdsTemp.Delta) then
      exit;

    btnRefreshClick(Sender);
  end;

end;

procedure TfrmMainOtherMtrlType_mod278.mniEditClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod278;
begin
  inherited;
  if not gfunc.CheckUserAuth(2, 25) then exit;
  LFrm:=Tfrmedit_mod278.Create(self);
  try

  Lfrm.FEditType:=2;
  Lfrm.getData(cdsMain.FieldByName('rkey').AsString);

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
