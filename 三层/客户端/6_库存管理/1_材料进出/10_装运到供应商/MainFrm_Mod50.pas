unit MainFrm_Mod50;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs ,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Datasnap.Provider, Data.Win.ADODB,uCommFunc,
  frxDesgn, frxClass;

type
  TFrmMain_Mod50 = class(TfrmBaseMain)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cbx1: TCheckBox;
    cbx2: TCheckBox;
    cdsMainRKEY: TAutoIncField;
    cdsMainSOURCE_PTR: TIntegerField;
    cdsMainINVENTORY_PTR: TIntegerField;
    cdsMainINV_PART_NUMBER: TStringField;
    cdsMainCODE: TStringField;
    cdsMainSUPPLIER_NAME: TStringField;
    cdsMainCONTACT_NAME_1: TStringField;
    cdsMainBILLING_ADDRESS_1: TStringField;
    cdsMainship_DATE: TDateTimeField;
    cdsMainPRICE: TFMTBCDField;
    cdsMainWAREHOUSE_CODE: TStringField;
    cdsMainWAREHOUSE_NAME: TStringField;
    cdsMainQUAN_TO_BE_SHIPPED: TFMTBCDField;
    cdsMainQUAN_RETURNED: TFMTBCDField;
    cdsMainBARCODE_ID: TStringField;
    cdsMainTTYPE: TSmallintField;
    cdsMainQUANTITY: TFloatField;
    cdsMainUNIT_NAME: TStringField;
    cdsMainrohs: TStringField;
    cdsMainSUPPLIER2: TStringField;
    cdsMainQUAN_ON_HAND: TBCDField;
    cdsMainrkey96: TAutoIncField;
    cdsMainINVT_PTR: TIntegerField;
    cdsMainREJ_PTR: TIntegerField;
    cdsMainINV_TRAN_PTR: TIntegerField;
    cdsMainEMPL_PTR: TIntegerField;
    cdsMainUSER_PTR: TIntegerField;
    cdsMainTDATE: TDateTimeField;
    cdsMainQUAN_REJD: TFloatField;
    cdsMainFLAG: TStringField;
    cdsMainREFERENCE_NUMBER: TStringField;
    cdsMainrkey5: TAutoIncField;
    cdsMainEMPL_CODE: TStringField;
    cdsMainPO_NUMBER: TStringField;
    cdsMainv_state: TStringField;
    cdsMainename: TStringField;
    cdsMainreject_description: TStringField;
    cdsMainrkey56: TAutoIncField;
    cdsMainEMPL_CODE_1: TStringField;
    cdsMainuname: TStringField;
    cdsMainTRAN_DATE: TDateTimeField;
    cdsMainSHIPPING_METHOD: TWideStringField;
    cdsMainkey17: TAutoIncField;
    cdsMainrkey76: TAutoIncField;
    cdsMaint_price: TBCDField;
    cdsMaintax_amount: TFloatField;
    cdsMainTAX_2: TBCDField;
    cdsMainexch_rate: TFMTBCDField;
    cdsMainrkey1: TAutoIncField;
    cdsMainCURR_CODE: TStringField;
    cdsMainCURR_NAME: TStringField;
    cdsMainINV_NAME: TStringField;
    cdsMainINV_DESCRIPTION: TStringField;
    cdsMainABBR_NAME: TStringField;
    cdsMainLOCATION: TStringField;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsMainrkey23: TAutoIncField;
    cdsMainrkey15: TAutoIncField;
    procedure cbx1Click(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
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
  FrmMain_Mod50: TFrmMain_Mod50;

implementation

{$R *.dfm}

uses ShipFrm_Mod50, ReportFrm_Mod50;

{ TFrmMain_Mod50 }

procedure TFrmMain_Mod50.btnDYClick(Sender: TObject);
var
  LFileName: string;
  LFrm : TFrmReport_Mod50;
begin
  inherited;
  if cdsMain.IsEmpty then
    exit;
  LFrm := TFrmReport_Mod50.Create(nil);
  try
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '生产物料退货装运单.fr3';
    LFrm.frxreport1.LoadFromFile(LFileName);
    LFrm.frxreport1.DesignReport;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmMain_Mod50.btnQryClick(Sender: TObject);
var
  LGetTime:TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Data0096.tdate';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := gFunc.DateTimeToStr(LGetTime-90)
    + ' AND '+ gFunc.DateTimeToStr(LGetTime);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '7';
    cdsMainWhereInit.Post;
  end;
  inherited;

end;

procedure TFrmMain_Mod50.cbx1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

function TFrmMain_Mod50.GetAddWhere1: string;
begin
  Result := ' AND data0096.status IN (9';
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

procedure TFrmMain_Mod50.GetData;
var
  LGetTime:TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  FMainFrmSql := cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere :=  ' and Data0096.TDATE BETWEEN ' + QuotedStr(gFunc.DateTimeToStr(LGetTime - 90)) + ' AND '
                   + QuotedStr(gFunc.DateTimeToStr(LGetTime)) ;
  FWhere2 := GetAddWhere1;
  FWhere3 := ' and (dbo.Data0096.FLAG=2)';
  FOrderby := ' order by data0017.INV_PART_NUMBER desc';
  btnDY.Visible := True ;
  inherited;
end;

procedure TFrmMain_Mod50.N1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,50) then
  begin
//    ShowMessage('你没有装运的权限');
    Exit;
  end;
  if FrmShip_Mod50 = nil then
  begin
    FrmShip_Mod50 := TFrmShip_Mod50.Create(Self);
    FrmShip_Mod50.FAfterUpdate := Self.OnAfterModPost;
  end;
  FrmShip_Mod50.getdata(cdsMain.FieldByName('rkey96').AsString,
    cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('Rkey23').AsString,
    cdsMain.FieldByName('SOURCE_PTR').AsString,cdsMain.FieldByName('rkey15').AsString);
  FrmShip_Mod50.Ftype456 := cdsMain.FieldByName('ttype').AsString;
  FrmShip_Mod50.Show;
end;

procedure TFrmMain_Mod50.N2Click(Sender: TObject);
var
  LSql17,LSql22,LSql96 : string;
  LCds17,LCds22,LCds96 : TClientDataSet;
  LPostData : OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,50) then
  begin
//    ShowMessage('你没有取消装运的权限');
    Exit;
  end;
  LSql17 := ' select * from data0017 where  rkey = ' + cdsMain.FieldByName('INVT_PTR').AsString;
  LSql22 := ' select * from data0022 where rkey = ' + cdsMain.FieldByName('INV_TRAN_PTR').AsString;
  LSql96 := ' select * from data0096 where rkey = ' + cdsMain.FieldByName('rkey96').AsString;
  LCds17 := TClientDataSet.Create(Self);
  LCds22 := TClientDataSet.Create(Self);
  LCds96 := TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql17,LSql22,LSql96]),[LCds17,LCds22,LCds96]);

    if LCds96.IsEmpty then Exit;

    LCds17.Edit;
    LCds17.FieldByName('quan_on_hand').Value := LCds17.FieldByName('quan_on_hand').Value + LCds96.FieldByName('QUAN_REJD').Value;
    LCds17.Post;
    LCds22.Edit;
    LCds22.FieldByName('QUAN_ON_HAND').Value := LCds22.FieldByName('QUAN_ON_HAND').Value + LCds96.FieldByName('QUAN_REJD').Value;
    LCds22.FieldByName('QUAN_TO_BE_SHIPPED').Value := LCds22.FieldByName('QUAN_TO_BE_SHIPPED').AsFloat - LCds96.FieldByName('QUAN_REJD').AsFloat;
    LCds22.Post;
    LCds96.Delete;

    if LCds17.State in [dsEdit,dsInsert] then LCds17.Post;
    if LCds22.State in [dsEdit,dsInsert] then LCds22.Post;
    if LCds96.State in [dsEdit,dsInsert] then LCds96.Post;

    LPostData := VarArrayCreate([0,2],varVariant);

    if LCds17.ChangeCount >0 then
      LPostData[0] := LCds17.Delta;
    if LCds22.ChangeCount > 0 then
      LPostData[1] := LCds22.Delta;
    if LCds96.ChangeCount >0 then
      LPostData[2] := LCds96.Delta;

    if gSvrIntf.IntfPostModData('公共基础',50,LPostData,2) then
    begin
      LCds17.MergeChangeLog;
      LCds22.MergeChangeLog;
      LCds96.MergeChangeLog;
      ShowMessage('取消成功');
    end;
  finally
    LCds17.Free;
    LCds22.Free;
    LCds96.Free;
    btnRefreshClick(Self);
  end;
//      btnRefresh.Click;
end;

procedure TFrmMain_Mod50.N3Click(Sender: TObject);
var
  LFrm : TFrmReport_Mod50;
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
  LFrm:=TFrmReport_Mod50.Create(Self);
  try
    Lfrm.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('rkey96').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '生产物料退货装运单.fr3';
    LFrm.frxreport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.ShowReport;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmMain_Mod50.OnAfterModPost(Acds: TClientDataSet);
begin
  btnRefreshClick(Self);
end;

procedure TFrmMain_Mod50.pmMainPopup(Sender: TObject);
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
