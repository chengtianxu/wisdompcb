unit PassNumber_Mod709;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, SetPassNum_Mod709;

type
  TfrmPassNumber_Mod709 = class(TfrmBaseMain)
    Panel1: TPanel;
    cdsQC_Dep: TClientDataSet;
    DBGridEh1: TDBGridEh;
    dsQC_Dep: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure btnExitClick(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDisplayFrm1: TfrmSetPassNum_Mod709;
    procedure GetData();override;
  end;

var
  frmPassNumber_Mod709: TfrmPassNumber_Mod709;

implementation

{$R *.dfm}


procedure TfrmPassNumber_Mod709.btnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;



procedure TfrmPassNumber_Mod709.btnQryClick(Sender: TObject);
var LiType,iLegth,iLNum:Integer;
    Lstrtmp,Lstrtmp2:string;
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'QC_PassNumCheck.InputDate';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-3) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
inherited;
  ClientDataSet1.Data:=cdsMainWhereInit.Data;
  if not ClientDataSet1.IsEmpty then
  begin
    FDisplayFrm1.Lstrwhere:='';
    ClientDataSet1.First;
    if (ClientDataSet1.FieldByName('SeqNo').AsInteger=0) and (ClientDataSet1.FieldByName('FieldValue').AsString<>'') then
    begin
      iLegth:=Length(ClientDataSet1.FieldByName('FieldValue').AsString);
      iLNum:=Pos('AND',ClientDataSet1.FieldByName('FieldValue').AsString);
      Lstrtmp:=Copy(ClientDataSet1.FieldByName('FieldValue').AsString,0,iLNum-1);
      Lstrtmp2:=Copy(ClientDataSet1.FieldByName('FieldValue').AsString,iLNum+3,iLegth-iLNum-1);
      FDisplayFrm1.Lstrwhere:=FDisplayFrm1.Lstrwhere+' and '+ClientDataSet1.FieldByName('FieldName').AsString+' BETWEEN '+ QuotedStr(Lstrtmp)+' and '+QuotedStr(Lstrtmp2)+'';
    end else FDisplayFrm1.Lstrwhere:= ' AND QC_PassNumCheck.InputDate BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));
    ClientDataSet1.Next;
    if (ClientDataSet1.FieldByName('SeqNo').AsInteger=1) and (ClientDataSet1.FieldByName('FieldValue').AsString<>'') then
    FDisplayFrm1.Lstrwhere:=' and '+ClientDataSet1.FieldByName('FieldName').AsString+' like '+'''%'+ClientDataSet1.FieldByName('FieldValue').AsString+'%'''
    else FDisplayFrm1.Lstrwhere:=FDisplayFrm1.Lstrwhere+'';
    ClientDataSet1.Next;
    if (ClientDataSet1.FieldByName('SeqNo').AsInteger=2) and (ClientDataSet1.FieldByName('FieldValue').AsString<>'') then
    begin
      if ClientDataSet1.FieldByName('FieldValue').AsString='有效' then  LiType:=1 else  LiType:=0;
      if FDisplayFrm1.Lstrwhere='' then
        FDisplayFrm1.Lstrwhere:=' and '+ClientDataSet1.FieldByName('FieldName').AsString+' = '+inttostr(LiType)+''
      else
        FDisplayFrm1.Lstrwhere:=FDisplayFrm1.Lstrwhere+' and '+ClientDataSet1.FieldByName('FieldName').AsString+' = '+inttostr(LiType)+'';
    end else  FDisplayFrm1.Lstrwhere:=FDisplayFrm1.Lstrwhere+'';
    FDisplayFrm1.GetData;
  end;

end;

procedure TfrmPassNumber_Mod709.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if  (not gFunc.CheckUserAuth(1000,709)) then Exit;

  if FDisplayFrm1 <> nil then FreeAndNil(frmSetPassNum_Mod709);
  if (cdsQC_Dep.FieldByName('TypeName').AsString='流转管控') then
  begin
    FDisplayFrm1 := TfrmSetPassNum_Mod709.Create(Panel1);
    FDisplayFrm1.pnl2.Parent := Panel1;
    FDisplayFrm1.pnl2.Visible := True;
    FDisplayFrm1.Lstrwhere:=FMainWhere;
    FDisplayFrm1.GetData;
    if FDisplayFrm1.cdsPassNum.IsEmpty then  btnQry.Visible:=False else btnQry.Visible:=True;
  end;
//  if FDisplayFrm2 <> nil then  FreeAndNil(frmSPCText_mod711);
//  if (cdsQC_Dep.FieldByName('TypeName').AsString='SPC检测') then
//  begin
//    FDisplayFrm2 := TfrmSPCText_mod711.Create(pnlEhMainDisplay);
//    FDisplayFrm2.pnl2.Parent := pnlEhMainDisplay;
//    FDisplayFrm2.pnl2.Visible := True;
//    FDisplayFrm2.Lstrwhere:=FMainWhere;
//    FDisplayFrm2.GetData;
//    FDisplayFrm2.inti;
//    FDisplayFrm2.iType:=0;
//  end;
end;

procedure TfrmPassNumber_Mod709.GetData;
var LSQLstr:string;
begin
  LSQLstr:='select * from dbo.QC_DeptBugDef where ID is NULL';
  gSvrintf.IntfGetDataBySql(LSQLstr,cdsQC_Dep);
  FMainFrmSql :=cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere := ' AND QC_PassNumCheck.InputDate BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));
  FOrderby := ' order by QC_PassNumCheck.rkey desc';
  inherited;
  cdsQC_Dep.Append;
  cdsQC_Dep.FieldByName('ID').Value:=1;
  cdsQC_Dep.FieldByName('TypeName').Value:='流转管控';
  cdsQC_Dep.FieldByName('TypeDesc').Value:='流转管控';
  cdsQC_Dep.Post;
end;

end.
