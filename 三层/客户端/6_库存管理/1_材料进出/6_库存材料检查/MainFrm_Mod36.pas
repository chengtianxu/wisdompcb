unit MainFrm_Mod36;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Win.ADODB,uCommFunc ;

type
  TFrmMain_Mod36 = class(TfrmBaseMain)
    cdsMainINV_PART_NUMBER: TStringField;
    cdsMainINV_NAME: TStringField;
    cdsMainINV_DESCRIPTION: TStringField;
    cdsMainUNIT_NAME: TStringField;
    cdsMainWAREHOUSE_CODE: TStringField;
    cdsMainWAREHOUSE_NAME: TStringField;
    cdsMainCODE: TStringField;
    cdsMainSUPPLIER_NAME: TStringField;
    cdsMainLOCATION: TStringField;
    cdsMainPRICE: TFMTBCDField;
    cdsMainexch_rate: TFMTBCDField;
    cdsMainQUAN_IN_INSP: TFMTBCDField;
    cdsMainQUAN_TO_BE_SHIPPED: TFMTBCDField;
    cdsMainQUAN_SCRAPPED: TFMTBCDField;
    cdsMainLOCATION_PTR: TIntegerField;
    cdsMainTDATE: TDateTimeField;
    cdsMainEXPIRE_DATE: TDateTimeField;
    cdsMainrohs: TStringField;
    cdsMainINVENTORY_PTR: TIntegerField;
    cdsMainRKEY: TAutoIncField;
    cdsMainQUAN_ON_HAND: TBCDField;
    cdsMaintax_price: TBCDField;
    cdsMainTAX_2: TBCDField;
    cdsMainreason: TStringField;
    cdsMainBARCODE_ID: TStringField;
    cdsMainGRN_NUMBER: TStringField;
    cdsMainship_DATE: TDateTimeField;
    cdsMainCODE16: TStringField;
    IQC1: TMenuItem;
    procedure IQC1Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OnAfterModPost(Acds : TClientDataSet);
    procedure GetData();override;
    { Public declarations }
  end;
  function checkPD_Mod36():Boolean;

implementation

{$R *.dfm}

uses IQCFrm_Mod36;
{ TFrmMain_Mod36 }

function checkPD_Mod36():Boolean;
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

procedure TFrmMain_Mod36.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Data0022.QUAN_IN_INSP';
    cdsMainWhereInit.FieldByName('Oper').AsString := '大于';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := '0';
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '5';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TFrmMain_Mod36.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere := ' and dbo.Data0022.QUAN_IN_INSP > 0' ;
  FOrderby :=' order by data0017.INV_PART_NUMBER desc';
  inherited;

end;

procedure TFrmMain_Mod36.IQC1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,36) then
  begin
//    ShowMessage('你没有iqc检查的权限');
    Exit;
  end;
  if FrmIQC_Mod36 = nil then
  begin
    FrmIQC_Mod36 := TFrmIQC_Mod36.Create(Self);
    FrmIQC_Mod36.FAfterUpdate := Self.OnAfterModPost;
  end;
  FrmIQC_Mod36.getdata(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('INVENTORY_PTR').AsString);
  FrmIQC_Mod36.Show;
//  btnRefreshClick(Sender);
end;

procedure TFrmMain_Mod36.OnAfterModPost(Acds: TClientDataSet);
begin
  btnRefreshClick(Self);
end;

procedure TFrmMain_Mod36.pmMainPopup(Sender: TObject);
begin
  inherited;
  IQC1.Enabled := not cdsMain.IsEmpty ;
end;

end.
