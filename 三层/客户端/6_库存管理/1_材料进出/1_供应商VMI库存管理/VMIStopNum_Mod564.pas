unit VMIStopNum_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uBaseEditFrm, Data.DB, Vcl.XPMan, Vcl.Menus, Datasnap.DBClient;

type
  TfrmVMIStopNum_Mod564 = class(TfrmBaseMain)
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cds171: TClientDataSet;
    procedure btnQryClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

var
  frmVMIStopNum_Mod564: TfrmVMIStopNum_Mod564;

implementation

{$R *.dfm}

uses VMIjieshuMX, VMIjieshuSummary;

{ TfrmVMIStopNum_Mod564 }

procedure TfrmVMIStopNum_Mod564.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0171.cut_date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-30) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmVMIStopNum_Mod564.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;

  if FMainWhere.Trim = '' then
    FMainWhere := ' and data0171.cut_date BETWEEN ' +  QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-30)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));

  FWhere2 := '';

  FOrderby := ' order by rkey ';
  inherited;
end;

procedure TfrmVMIStopNum_Mod564.N1Click(Sender: TObject);
var
  LPostData: OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(13,564) then Exit;
  LPostData := VarArrayCreate([0,1],varVariant);
  LPostData[1] :=gVar.rkey05;
  if not gSvrIntf.IntfspExec('VMIjieshu171_172',LPostData) then Exit;
  ShowMessage('截数成功');
  btnRefreshClick(nil);
end;

procedure TfrmVMIStopNum_Mod564.N2Click(Sender: TObject);
var
  LSq171: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(13,564) then Exit;
  LSq171 := 'select * from data0171 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(LSq171,cds171);
  if not cds171.IsEmpty then
  begin
    if (cds171.FieldByName('status').Value<>0) then
    begin
      ShowMessage('已审核不能再审');
      Exit;
    end;
    cds171.Edit;
    cds171.FieldByName('status').Value:=1;//通过审核
    cds171.Post;
  end;
  if (cds171.ChangeCount>0) then
  if gSvrIntf.IntfPostDataByTable('data0171',cds171.delta) then
  begin
    if (cds171.ChangeCount>0) then cds171.MergeChangeLog;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmVMIStopNum_Mod564.N3Click(Sender: TObject);
var
  LSq171: string;
 // LPostData: OleVariant;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(14,564) then Exit;
  if Application.MessageBox('确认要删除截数吗?', PChar('提示'),MB_YESNO)=6 then
  begin
    if cdsMain.FieldByName('user_ptr').AsString<>gVar.rkey05 then
    begin
      MessageDlg('必须由截数人进行删除操作!',mtInformation,[mbok],1);
      Exit;
    end;
    LSq171 := 'select * from data0171 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
    LCds:=TClientDataSet.Create(Self);
    try
      gSvrIntf.IntfGetDataBySql(LSq171,LCds);
      if not LCds.IsEmpty then
      begin
        if (LCds.FieldByName('cut_date').AsDateTime>cdsMain.FieldByName('cut_date').AsDateTime) then
        begin
          MessageDlg('有相关截数时间大于此截数,不能进行删除操作!',mtInformation,[mbok],1);
          Exit;
        end;
        LCds.Delete;
      end;
      if (LCds.ChangeCount>0) then
      if gSvrIntf.IntfPostDataByTable('data0171',LCds.delta) then
      begin
        if (LCds.ChangeCount>0) then LCds.MergeChangeLog;
        ShowMessage('删除成功');
        btnRefreshClick(nil);
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmVMIStopNum_Mod564.N6Click(Sender: TObject);
begin
  inherited;
  frmVMIjieshuMX := TfrmVMIjieshuMX.Create(Self);
  try
    frmVMIjieshuMX.Lw3:=' and data0171.rkey='+cdsMain.FieldByName('rkey').AsString;
    frmVMIjieshuMX.GetData;
    if frmVMIjieshuMX.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmVMIjieshuMX.Free;
  end;
end;

procedure TfrmVMIStopNum_Mod564.N7Click(Sender: TObject);
begin
  inherited;
  frmVMIjieshuSummary := TfrmVMIjieshuSummary.Create(Self);
  try
    frmVMIjieshuSummary.Lw3:=' and data0171.rkey='+cdsMain.FieldByName('rkey').AsString;
    frmVMIjieshuSummary.GetData;
    if frmVMIjieshuSummary.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmVMIjieshuSummary.Free;
  end;
end;

procedure TfrmVMIStopNum_Mod564.pmMainPopup(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    N1.Enabled:=True;
    N2.Enabled:=False;
    N3.Enabled:=False;
    N5.Enabled:=false;
  end else
  begin
    N1.Enabled:=True;
    N2.Enabled:=cdsMain.FieldByName('status').Value=0;
    N3.Enabled:=cdsMain.FieldByName('status').Value=0;
    N5.Enabled:=True;
  end;
end;

end.
