unit MainFrm_Mod352;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uCommFunc;

type
  TFrmMain_Mod352 = class(TfrmBaseMain)
    cdsMaingoods_name: TStringField;
    cdsMaingoods_guige: TStringField;
    cdsMaingoods_type: TStringField;
    cdsMainABBR_NAME: TStringField;
    cdsMainLOCATION: TStringField;
    cdsMainQUAN_RECD: TBCDField;
    cdsMainQUAN_ON_HAND: TBCDField;
    cdsMainquan_to_ship: TFloatField;
    cdsMainquan_returned: TFloatField;
    cdsMainUNIT_NAME: TStringField;
    cdsMainship_DATE: TDateTimeField;
    cdsMainREF_NUMBER: TStringField;
    cdsMainCODE: TStringField;
    cdsMainSUPPLIER_NAME: TStringField;
    cdsMainPO_NUMBER: TStringField;
    cdsMainCONFIRMATION_NUMBER: TStringField;
    cdsMainPO_DATE: TDateTimeField;
    cdsMainGRN_NUMBER: TStringField;
    cdsMainWAREHOUSE_CODE: TStringField;
    cdsMainD0072_PTR: TIntegerField;
    cdsMainRKEY: TAutoIncField;
    cdsMainDESCRIPTION2: TStringField;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OnAfterModPost(Acds : TClientDataSet);
    procedure GetData();override;
    { Public declarations }
  end;

var
  FrmMain_Mod352: TFrmMain_Mod352;

implementation

{$R *.dfm}

uses ReturnFrm_Mod40, DetailFrm_Mod352;

{ TFrmMain_Mod352 }

procedure TFrmMain_Mod352.btnQryClick(Sender: TObject);
var
  LGetTime:TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Data0235.QUAN_ON_HAND';
    cdsMainWhereInit.FieldByName('Oper').AsString := '大于';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := '0';
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '7';
    cdsMainWhereInit.Post;

    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Data0456.ship_DATE';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := gFunc.DateTimeToStr(LGetTime - 90)
    + ' AND '+ gFunc.DateTimeToStr(LGetTime);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '8';
    cdsMainWhereInit.Post;
  end;
  FMainWhereID := 2;
  inherited;

end;

procedure TFrmMain_Mod352.GetData;
var
  LGetTime:TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  FMainFrmSql := cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere := ' and (Data0456.ship_DATE  BETWEEN ' + QuotedStr(gFunc.DateTimeToStr(LGetTime - 90)) +
                  ' and' + QuotedStr(gFunc.DateTimeToStr(LGetTime)) + ') and dbo.Data0235.QUAN_ON_HAND > 0';
  FWhere2 := ' and dbo.Data0070.STATUS IN (5, 6, 7) ' ;
  FOrderby := ' order by Data0235.goods_name desc';
  inherited;
end;

procedure TFrmMain_Mod352.N1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,40) then
  begin
//    ShowMessage('你没有退货权限');
    Exit;
  end;

  if FrmReturn_Mod40 = nil then
  begin
    FrmReturn_Mod40 := TFrmReturn_Mod40.Create(Self);
    FrmReturn_Mod40.FAfterUpdate := Self.OnAfterModPost;
  end;
  FrmReturn_Mod40.FModNum := 352;
  FrmReturn_Mod40.getdata(cdsMain.FieldByName('rkey').AsString,'');
  FrmReturn_Mod40.Show;
end;

procedure TFrmMain_Mod352.N2Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,40) then
  begin
//    ShowMessage('你没有查看明细权限');
    Exit;
  end;
  if FrmDetail_Mod352 = nil then
  begin
    FrmDetail_Mod352 := TFrmDetail_Mod352.Create(Self);
  end;
  FrmDetail_Mod352.FRkey := cdsMain.FieldByName('rkey').AsString;
  FrmDetail_Mod352.GetData;
  FrmDetail_Mod352.Show;
end;

procedure TFrmMain_Mod352.OnAfterModPost(Acds: TClientDataSet);
begin
  btnRefreshClick(Self);
end;

procedure TFrmMain_Mod352.pmMainPopup(Sender: TObject);
begin
  inherited;
  N1.Enabled := not (cdsMain.IsEmpty);
  N2.Enabled := not (cdsMain.IsEmpty);
end;

end.
