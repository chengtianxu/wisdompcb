unit MainFrm_Mod41;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uCommFunc,uBaseMainWhereFrm;

type
  TFrmMain_Mod41 = class(TfrmBaseMain)
    cdsMaininv_part_number: TStringField;
    cdsMainINV_part_description: TStringField;
    cdsMainquantity: TFloatField;
    cdsMainquan_on_hand: TBCDField;
    cdsMainquan_to_be_shipped: TFMTBCDField;
    cdsMainQUAN_RETURNED: TFMTBCDField;
    cdsMaintdate: TDateTimeField;
    cdsMainBARCODE_ID: TStringField;
    cdsMainCODE: TStringField;
    cdsMainSUPPLIER_NAME: TStringField;
    cdsMainwarehouse_code: TStringField;
    cdsMainabbr_name: TStringField;
    cdsMainlocation: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMaininventory_ptr: TIntegerField;
    cdsMainINV_NAME: TStringField;
    cdsMainGRN_NUMBER: TStringField;
    cdsMainUNIT_NAME: TStringField;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    function checkPD_Mod41():Boolean;
    { Private declarations }
  public
    procedure OnAfterModPost(Acds : TClientDataSet);
    procedure GetData();override;
    { Public declarations }
  end;

var
  FrmMain_Mod41: TFrmMain_Mod41;

implementation

{$R *.dfm}

uses ReturnFrm_Mod40, DetailFrm_Mod40;

{ TFrmMain_Mod41 }

procedure TFrmMain_Mod41.btnQryClick(Sender: TObject);
var
  LGetTime : TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'd22.quan_on_hand';
    cdsMainWhereInit.FieldByName('Oper').AsString := '大于';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := '0';
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '4';
    cdsMainWhereInit.Post;

    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'd22.tdate';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := gFunc.DateTimeToStr(LGetTime - 90)
    + ' AND '+ gFunc.DateTimeToStr(LGetTime);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '5';
    cdsMainWhereInit.Post;
  end;
  FMainWhereID := 1;
  inherited;
end;

function TFrmMain_Mod41.checkPD_Mod41: Boolean;
var
  LSql92:string;
  LCds92:TClientDataSet;
begin
  Result := True;
  LCds92 := TClientDataSet.Create(nil);
  try
    LSql92 := 'SELECT dbo.Data0092.PHY_COUNT_NO, dbo.Data0092.TDATE,'+#13+
            'dbo.Data0005.EMPLOYEE_NAME'+#13+
            'FROM dbo.Data0005 INNER JOIN'+#13+
            'dbo.Data0092 ON dbo.Data0005.RKEY = dbo.Data0092.EMPLOYEE_PTR'+#13+
            'WHERE (dbo.Data0092.STATUS = ''0'')';
    gSvrIntf.IntfGetDataBySql(LSql92,LCds92);
    if not LCds92.IsEmpty then
    begin
      MessageDlg
        ('仓库正在进行材料盘点暂时不能操作该程序,盘点代码:'+
        Lcds92.FieldByName('PHY_COUNT_NO').AsString+'盘点人员:'+Lcds92.FieldByName('EMPLOYEE_NAME').AsString,
        mtInformation,[mbCancel],0
        );
      Result := False;
    end ;

  finally
    LCds92.Free;
  end;

end;

procedure TFrmMain_Mod41.GetData;
var
  LGetTime:TDateTime;
begin
  LGetTime := gFunc.GetSvrDateTime;
  FMainFrmSql := cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere :=  ' and d22.tdate BETWEEN ' + QuotedStr(gFunc.DateTimeToStr(LGetTime - 90)) + ' AND '
                   + QuotedStr(gFunc.DateTimeToStr(LGetTime)) + ' and (d22.quan_on_hand > 0)';
  FWhere2 := ' and (d456.ttype in(''3'',''4'',''5''))  and (d456.PO_PTR IS NULL) ';
  FOrderby := ' order by d17.INV_PART_NUMBER desc';

  inherited;

end;

procedure TFrmMain_Mod41.N1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,40) then
  begin
//    ShowMessage('你没有退货权限');
    Exit;
  end;

  if not checkPD_Mod41() then  Exit;
  if FrmReturn_Mod40 = nil then
  begin
    FrmReturn_Mod40 := TFrmReturn_Mod40.Create(Self);
    FrmReturn_Mod40.FAfterUpdate := Self.OnAfterModPost;
  end;
  FrmReturn_Mod40.FModNum := 41;
  FrmReturn_Mod40.getdata(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('INVENTORY_PTR').AsString);
//  FrmReturn_Mod40.edtZKSL.Text := cdsMain.FieldByName('quan_on_hand').AsString;
  FrmReturn_Mod40.Show;
end;

procedure TFrmMain_Mod41.N2Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,40) then
  begin
//    ShowMessage('你没有查看明细权限');
    Exit;
  end;
  if FrmDetail_Mod40 = nil then
  begin
    FrmDetail_Mod40 := TFrmDetail_Mod40.Create(Self);
  end;
  FrmDetail_Mod40.FRkey := cdsMain.FieldByName('rkey').AsString ;
  FrmDetail_Mod40.GetData;
  FrmDetail_Mod40.Show;
end;

procedure TFrmMain_Mod41.OnAfterModPost(Acds: TClientDataSet);
begin
  btnRefreshClick(Self);
end;

procedure TFrmMain_Mod41.pmMainPopup(Sender: TObject);
begin
  inherited;
  N1.Enabled := not (cdsMain.IsEmpty);
  N2.Enabled := not (cdsMain.IsEmpty);
end;

end.
