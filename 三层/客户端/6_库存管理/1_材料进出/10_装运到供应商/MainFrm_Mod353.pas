unit MainFrm_Mod353;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs ,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uCommFunc, frxClass, Data.Win.ADODB,
  Datasnap.Provider, frxDesgn;

type
  TFrmMain_Mod353 = class(TfrmBaseMain)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cbx1: TCheckBox;
    cbx2: TCheckBox;
    cdsMaingoods_name: TStringField;
    cdsMaingoods_guige: TStringField;
    cdsMaingoods_type: TStringField;
    cdsMainABBR_NAME: TStringField;
    cdsMainquan_to_ship: TFloatField;
    cdsMainQUANTITY: TFloatField;
    cdsMainUNIT_NAME: TStringField;
    cdsMainTDATE: TDateTimeField;
    cdsMainvEMPLOYEE_NAME: TStringField;
    cdsMainremark: TWideStringField;
    cdsMainshipping_method: TWideStringField;
    cdsMaintran_date: TDateTimeField;
    cdsMainv_state: TStringField;
    cdsMainABBR_NAME_1: TStringField;
    cdsMainLOCATION: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainCODE: TStringField;
    cdsMainREJECT_DESCRIPTION: TStringField;
    cdsMainRkey: TAutoIncField;
    cdsMainquan_returned: TFloatField;
    cdsMainQUAN_RECD: TBCDField;
    cdsMainQUAN_RETN: TFloatField;
    cdsMainD0072_PTR: TIntegerField;
    cdsMainRkey235: TAutoIncField;
    cdsMainunit_price: TBCDField;
    cdsMainexch_rate: TFMTBCDField;
    cdsMainstate_tax: TBCDField;
    cdsMainsum_price: TFloatField;
    cdsMainCURR_NAME: TStringField;
    cdsMainPO_NUMBER: TStringField;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsMainRkey23: TAutoIncField;
    cdsMainSRCE_PTR: TIntegerField;
    procedure cbx1Click(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
  private
      function GetAddWhere1: string;
    { Private declarations }
  public
    procedure OnAfterModPost(Acds : TClientDataSet);
    procedure GetData();override;
    { Public declarations }
  end;

var
  FrmMain_Mod353: TFrmMain_Mod353;

implementation

{$R *.dfm}

uses ReportFrm_Mod353, ShipFrm_Mod353;

{ TFrmMain_Mod353 }

procedure TFrmMain_Mod353.btnDYClick(Sender: TObject);
var
  LFileName: string;
  LFrm : TFrmReport_Mod353;
begin

  inherited;
  if cdsMain.IsEmpty then
    exit;
  LFrm := TFrmReport_Mod353.Create(nil);
  try
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '杂项物品退货装运单.fr3';
    LFrm.frxreport1.LoadFromFile(LFileName);
    LFrm.frxreport1.DesignReport;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmMain_Mod353.btnQryClick(Sender: TObject);
var
  LGetTime:TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Data0209.tdate';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := gFunc.DateTimeToStr(LGetTime-90)
    + ' AND '+ gFunc.DateTimeToStr(LGetTime);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '9';
    cdsMainWhereInit.Post;
  end;
  FMainWhereID := 1;
  inherited;

end;

procedure TFrmMain_Mod353.cbx1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

function TFrmMain_Mod353.GetAddWhere1: string;
begin
  Result := ' and data0209.status in (9';
  if cbx1.Checked then
  begin
    Result := Result + ',0';
  end;
  if cbx2.Checked then
  begin
    Result := Result + ',1';
  end;
  Result := Result + ')';
end;

procedure TFrmMain_Mod353.GetData;
var
  LGetTime:TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  FMainFrmSql := cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere :=  ' and Data0209.TDATE BETWEEN ' + QuotedStr(gFunc.DateTimeToStr(LGetTime - 90)) + ' AND '
                   + QuotedStr(gFunc.DateTimeToStr(LGetTime)) ;
  FWhere2 := GetAddWhere1;
  FOrderby := ' order by Data0235.goods_name desc';
  btnDY.Visible := True ;
  inherited;

end;

procedure TFrmMain_Mod353.N1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,50) then
  begin
//    ShowMessage('你没有装运的权限');
    Exit;
  end;
  if FrmShip_Mod353 = nil then
  begin
    FrmShip_Mod353 := TFrmShip_Mod353.Create(Self);
    FrmShip_Mod353.FAfterUpdate := Self.OnAfterModPost;
  end;
  FrmShip_Mod353.getdata(cdsMain.FieldByName('rkey').AsString, cdsMain.FieldByName('rkey235').AsString,
    cdsMain.FieldByName('Rkey23').AsString,cdsMain.FieldByName('D0072_PTR').AsString);
  FrmShip_Mod353.Show;
end;

procedure TFrmMain_Mod353.N2Click(Sender: TObject);
var
  LSql209,LSql235 : string;
  LCds209,LCds235 : TClientDataSet;
  LPostData : OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,50) then
  begin
//    ShowMessage('你没有取消装运的权限');
    Exit;
  end;
  LSql209 := ' select * from data0209 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  LSql235 := ' select * from data0235 where rkey = ' + cdsMain.FieldByName('rkey235').AsString;
  LCds209 := TClientDataSet.Create(Self);
  LCds235 := TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql209,LSql235]),[LCds209,LCds235]);

    if LCds209.IsEmpty then Exit;

    LCds235.Edit;
    LCds235.FieldByName('QUAN_ON_HAND').Value := LCds235.FieldByName('QUAN_ON_HAND').Value + LCds209.FieldByName('QUANTITY').Value;
    LCds235.FieldByName('quan_to_ship').Value := LCds235.FieldByName('quan_to_ship').Value - LCds209.FieldByName('QUANTITY').Value;
    LCds235.Post;
    LCds209.Delete;

    if LCds235.State in [dsEdit,dsInsert] then LCds235.Post;
    if LCds209.State in [dsEdit,dsInsert] then LCds209.Post;

    LPostData := VarArrayCreate([0,1],varVariant);

    if LCds235.ChangeCount > 0 then
      LPostData[0] := LCds235.Delta;
    if LCds209.ChangeCount > 0 then
      LPostData[1] := LCds209.Delta;

    if gSvrIntf.IntfPostModData('公共基础',50,LPostData,3) then
    begin
      LCds235.MergeChangeLog;
      LCds209.MergeChangeLog;
      ShowMessage('取消成功');
    end;
  finally
    LCds235.Free;
    LCds209.Free;
    btnRefreshClick(Self);
  end;
end;

procedure TFrmMain_Mod353.N3Click(Sender: TObject);
var
  LFrm : TFrmReport_Mod353;
  LFileName: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(3,50) then
  begin
//    ShowMessage('你没有打印的权限');
    Exit;
  end;
  if cdsMain.IsEmpty then
    exit;
  LFrm:=TFrmReport_Mod353.Create(Self);
  try
    Lfrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '杂项物品退货装运单.fr3';
    LFrm.frxreport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmMain_Mod353.OnAfterModPost(Acds: TClientDataSet);
begin
  btnRefreshClick(Self);
end;

procedure TFrmMain_Mod353.pmMainPopup(Sender: TObject);
begin
  inherited;
  if  (not cdsMain.IsEmpty)  then
  begin
    N1.Enabled := True ;
    N2.Enabled := True ;
    N3.Enabled := True ;
  end
  else
  begin
    N1.Enabled := False;
    N2.Enabled := False;
    N3.Enabled := False;  
  end;
  if (cdsMain.FieldByName('v_state').AsString = '已装运' ) then
  begin
    N1.Enabled := False;
    N2.Enabled := False;
    N3.Enabled := True;  
  end
  else  if (cdsMain.FieldByName('v_state').AsString = '未装运' ) then
  begin
    N1.Enabled := True;
    N2.Enabled := True;
    N3.Enabled := False;  
  end;
end;

end.
