unit Mainfrm_Mod83;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB,uCommFunc;

type
  TFrmMain_Mod83= class(TfrmBaseMain)
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniCopy: TMenuItem;
    mniCheck: TMenuItem;
    mniDelete: TMenuItem;
    N1: TMenuItem;
    mniChange: TMenuItem;
    mniResearch: TMenuItem;
    mniCredit: TMenuItem;
    cds10: TClientDataSet;
    cds248: TClientDataSet;
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniCheckClick(Sender: TObject);
    procedure mniChangeClick(Sender: TObject);
    procedure mniDeleteClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure mniCreditClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
    procedure OnAfterAdd;
  end;

implementation
 uses
 uBaseMainWhereFrm,editfrm_mod83,Changefrm_Mod83,Creditfrm_Mod83;
{$R *.dfm}
procedure TFrmMain_Mod83.GetData;
var
LArr: TArray<Integer>;
Lallow:Boolean;
I:Integer;
begin
  LArr :=gFunc.GetUserModAuthIDArr(StrToInt(gvar.rkey73),83);
  Lallow:=False; //判断是否有可写权限
  for I := 0 to Length(LArr) - 1 do
  begin
    if 2 = LArr[I] then
    begin
      Lallow := True;
      Break;
    end;
  end;
  FMainFrmSql := cdsMain.CommandText;
  if Lallow=true then
  begin
    FMainFrmSql:=(system.copy(FMainFrmSql,1,pos('FROM',FMainFrmSql)-1))
       +' FROM DATA0010 D10 INNER JOIN DATA0005 D05 on D10.sales_rep_ptr=D05.rkey'
       +' INNER JOIN DATA0001 D01 on D10.currency_ptr=D01.rkey'
       +' LEFT JOIN DATA0250 D250 on D10.country_ptr=D250.country_rkey WHERE 1=1 ';
  end
  else
  begin
  FMainFrmSql := FMainFrmSql+' WHERE D100.CSI_PTR='+gvar.rkey73;
  end;
  if Trim(FMainWhere)= '' then
  FMainWhere := ' ';
  FOrderby := ' order by d10.cust_code desc ';
  inherited;
end;

procedure TFrmMain_Mod83.mniNewClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,FModID) then Exit;
  if frmEdit_mod83 = nil then
  begin
    frmEdit_mod83 := TfrmEdit_mod83.Create(Self);
    frmEdit_mod83.FAfterAppend := OnAfterAdd;
    //frmEdit_mod83.dtpReqDate.DateTime:=dateof(gFunc.GetSvrDateTime);
    frmEdit_mod83.FEditType:=0;
    frmEdit_mod83.FsModid:=FModID;
  end;
  frmEdit_mod83.GetData('0');
  frmEdit_mod83.Append10;
  frmEdit_mod83.Init;
  frmEdit_mod83.Show;
end;

procedure TFrmMain_Mod83.mniEditClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,FModID) then Exit;
  if frmEdit_mod83 = nil then
  begin
    frmEdit_mod83 := TfrmEdit_mod83.Create(Self);
    frmEdit_mod83.FAfterAppend := OnAfterAdd;
    frmEdit_mod83.FEditType:=3;
    frmEdit_mod83.FsModid:=FModID;
  end;
  frmEdit_mod83.GetData(cdsMain.FieldByName('rkey').AsString);
  frmEdit_mod83.Init;
  frmEdit_mod83.Show;
end;

procedure TFrmMain_Mod83.mniCopyClick(Sender: TObject);
begin
  inherited;
 if not gFunc.CheckUserAuth(2,FModID) then Exit;
end;

procedure TFrmMain_Mod83.mniCheckClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  if frmEdit_mod83 = nil then
  begin
    frmEdit_mod83 := TfrmEdit_mod83.Create(Self);
    frmEdit_mod83.FAfterAppend := OnAfterAdd;
    frmEdit_mod83.FEditType:=2;
    frmEdit_mod83.FsModid:=FModID;
  end;
  frmEdit_mod83.GetData(cdsMain.FieldByName('rkey').AsString);
  frmEdit_mod83.Init;
  frmEdit_mod83.cds10.ReadOnly:=True;
  frmEdit_mod83.cds12.ReadOnly:=True;
  frmEdit_mod83.btnSave.Enabled:=False;
  frmEdit_mod83.ComboBox1.Enabled:=False;
  frmEdit_mod83.Memo1.ReadOnly:=True;
  frmEdit_mod83.Memo2.ReadOnly:=True;
  frmEdit_mod83.PM1.Items.Delete(2); //删除"添加"和"删除"菜单
  frmEdit_mod83.PM1.Items.Delete(0);
  frmEdit_mod83.n2.Caption:='检查';
  frmEdit_mod83.Show;
end;

procedure TFrmMain_Mod83.mniDeleteClick(Sender: TObject);
var
 LPostData: OleVariant;
Lsql10,Lsql248:string;
begin
  inherited;
 if not gFunc.CheckUserAuth(2,FModID) then Exit;
 if messagedlg('你确认要删除这条记录吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  Lsql248:='select * from data0248 where cust_ptr='+cdsMain.FieldByName('rkey').AsString;
  Lsql10:='select * from data0010 where rkey= '+cdsMain.FieldByName('rkey').AsString;
  if not gSvrIntf.IntfGetDataBySql(Lsql248,cds248) then Exit;
  if not cds248.IsEmpty then
  begin
   while not cds248.eof do cds248.Delete;
  end;
  if not gSvrIntf.IntfGetDataBySql(lsql10,cds10) then Exit;
  cds10.Delete;
  LPostData := VarArrayCreate([0,2],varVariant);
  if cds248.ChangeCount > 0 then
    LPostData[0] := cds248.Delta;
  if cds10.ChangeCount > 0 then
    LPostData[1] := cds10.Delta;
  if gSvrIntf.IntfPostModData('公共基础',83,LPostData,1) then
  begin
   if (cds248.ChangeCount > 0) then cds248.MergeChangeLog;
    cds10.MergeChangeLog;
    cdsMain.Delete;
    ShowMessage('删除记录成功');
  end;
 end;
end;

procedure TFrmMain_Mod83.mniChangeClick(Sender: TObject);
var
Lfrm:TfrmChange_Mod83;
Lsql318:string;
Lcds318:TClientDataSet;
begin
   inherited;
   if not gFunc.CheckUserAuth(1,FModID) then Exit;
   Lcds318:=TClientDataSet.Create(nil);
   Lfrm:=TfrmChange_Mod83.Create(nil);
    try
      Lfrm.Caption := cdsMain.FieldByName('abbr_name').AsString+':变更记录';
      Lsql318:='select user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION,'+
        ' FROM_STRING,TO_STRING,file_number'+
        ' from data0318 inner join data0073 on'+
        ' data0318.user_ptr=data0073.rkey'+
        ' where WORK_ORDER_PTR='+cdsmain.FieldByName('rkey').AsString+
        ' order by TRANS_DATE';
      if not gSvrIntf.IntfGetDataBySql(Lsql318,Lcds318) then Exit;
      while not Lcds318.Eof do
      begin
        Lfrm.Memo1.Lines.Add(Lcds318.fieldbyname('trans_date').AsString+
        ' 系统用户:'+Lcds318.fieldbyname('user_id').AsString+' '+
        Lcds318.fieldbyname('user_full_name').AsString+
        Lcds318.fieldbyname('TRANS_DESCRIPTION').AsString);
        Lfrm.Memo1.Lines.Add(' 原值: '+Lcds318.fieldbyname('from_string').AsString+
        ' 变更后: '+Lcds318.fieldbyname('to_string').AsString+
        '   关联文件号:'+Lcds318.fieldbyname('file_number').AsString);
        Lcds318.Next;
      end;
      Lfrm.ShowModal;
    finally
      Lcds318.Free;
      Lfrm.Free;
    end;
end;

procedure TFrmMain_Mod83.mniCreditClick(Sender: TObject);
var
Lfrm:TfrmCredit_Mod83;
Lsql310:string;
begin
 inherited;
 if not gFunc.CheckUserAuth(2,FModID) then Exit;
 Lsql310:='select * from data0310 where cust_ptr='+cdsmain.FieldByName('rkey').AsString;
 Lfrm:=TfrmCredit_Mod83.Create(nil);
 try
  if not gSvrIntf.IntfGetDataBySql(Lsql310,Lfrm.cds310) then Exit;
  Lfrm.rkey10:=cdsmain.FieldByName('rkey').AsInteger;
  Lfrm.ShowModal;
 finally
  Lfrm.cds310.Close;
  Lfrm.Free;
 end;
end;

procedure TfrmMain_Mod83.OnAfterAdd;
begin
  btnRefreshClick(btnRefresh);
end;

procedure TFrmMain_Mod83.pmMainPopup(Sender: TObject);
var
 menu_enable:boolean;
begin
  menu_enable:=not cdsMain.IsEmpty;
  mniEdit.Enabled:=menu_enable;
  mniCheck.Enabled:=menu_enable;
  mniCopy.Enabled:=menu_enable;
  mniDelete.Enabled:=menu_enable;
  mniChange.Enabled:=menu_enable;
  mniCredit.Enabled:=menu_enable;
  mniResearch.Enabled:=menu_enable;
  inherited;
end;

end.
