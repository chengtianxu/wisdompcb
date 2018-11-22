unit ViewCredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, DBGrids, DB, ADODB, StdCtrls, DBGridEh;

type
  TfrmViewCredit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    spBtnExport: TSpeedButton;
    spBtnQuery: TSpeedButton;
    DataSource1: TDataSource;
    Label5: TLabel;
    edtCustId: TEdit;
    SpeedButton4: TSpeedButton;
    Panel4: TPanel;
    spBtnExit: TSpeedButton;
    DBGridEh1: TDBGridEh;
    adsCalcCREDIT: TADODataSet;
    adsCalcCREDITRKEY: TIntegerField;
    adsCalcCREDITCUST_CODE: TStringField;
    adsCalcCREDITABBR_NAME: TStringField;
    adsCalcCREDITSALES_REP_NAME: TStringField;
    adsCalcCREDITFED_TAX_ID_NO: TStringField;
    adsCalcCREDITTCREDITRATING: TStringField;
    adsCalcCREDITCREDIT_LIMIT: TFloatField;
    adsCalcCREDITHIGH_BALANCE: TFloatField;
    adsCalcCREDITBALANCE_DUE: TFloatField;
    adsCalcCREDITAMOUNT1: TBCDField;
    adsCalcCREDITAMOUNT2: TBCDField;
    adsCalcCREDITAMOUNT3: TBCDField;
    adsCalcCREDITAMOUNT4: TBCDField;
    adsCalcCREDITAMOUNT5: TBCDField;
    adsCalcCREDITAMOUNT6: TBCDField;
    adsCalcCREDITAMOUNT: TBCDField;
    procedure spBtnExportClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure spBtnExitClick(Sender: TObject);
    procedure spBtnQueryClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure edtCustIdKeyPress(Sender: TObject; var Key: Char);
  private
    Fprev: Integer;
    function Pick_Cust_ID(Value: variant; AdoConn: TAdoconnection; PickType: byte; Rkey73:String): variant;
    procedure Setprev(const Value: Integer);
  public
    { Public declarations }
  published
    property prev: Integer read Fprev write Setprev;
  end;

var
  frmViewCredit: TfrmViewCredit;

implementation

  USES COMMON, damo, ConstVar;

{$R *.dfm}

function TfrmViewCredit.Pick_Cust_ID(Value: variant;
  AdoConn: TAdoconnection; PickType: byte; Rkey73: String): variant;
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Cust_Code/客户编号,Customer_name/客户名称';
  if ((vprev = '2') or (vprev = '4')) then   //如果有可写权限则可以查全部客户
    FDlgInput.Sqlstr := 'SELECT     TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                        'FROM         dbo.Data0010 '+
                        'ORDER BY dbo.Data0010.CUST_CODE'
  else
    FDlgInput.Sqlstr := 'SELECT     TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                        'FROM         dbo.Data0010 INNER JOIN  '+
                        'dbo.DATA0100 ON dbo.Data0010.RKEY = dbo.DATA0100.CUSTOMER_PTR '+
                        'WHERE     (dbo.DATA0100.CSI_PTR = '+ rkey73 + ') '+
                        'ORDER BY dbo.Data0010.CUST_CODE';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Cust_Code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取到记录
end;

procedure TfrmViewCredit.spBtnExportClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1, '客户信用额度');
end;

procedure TfrmViewCredit.SpeedButton4Click(Sender: TObject);
begin
  edtCustId.Text := Pick_Cust_ID(edtCustId.Text, dm.ADOConnection1, 2 , Rkey73);
end;

procedure TfrmViewCredit.spBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmViewCredit.spBtnQueryClick(Sender: TObject);
begin
  with adsCalcCREDIT do
  begin
    Close;
    Parameters.ParamByName('CustId').Value:= edtCustId.text;
    Parameters.ParamByName('RKEY73').Value:= rkey73;
    if prev = 3 then
      Parameters.ParamByName('ViewAll').Value:= 0
    else
      Parameters.ParamByName('ViewAll').Value:= 1;
    Open;
  end;
  //TStringGrid(DbGrid1).FixedCols:= 3;
end;

procedure TfrmViewCredit.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if ((adsCalcCREDIT.FieldByName('HIGH_BALANCE').asFloat > 0) and
     (adsCalcCREDIT.FieldByName('BALANCE_DUE').asFloat > 0)) then
    (Sender as TDBGridEh).Canvas.Font.Color:= clGreen
  else if ((adsCalcCREDIT.FieldByName('HIGH_BALANCE').asFloat > 0) and
     (adsCalcCREDIT.FieldByName('BALANCE_DUE').asFloat = 0)) then
    (Sender as TDBGridEh).Canvas.Font.Color:= clRed;

  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmViewCredit.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if Column.Title.SortMarker = smDownEh then  //排序
  begin
    Column.Title.SortMarker:= smUpEh;
    adsCalcCREDIT.IndexFieldNames:= Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker:= smDownEh;
    adsCalcCREDIT.IndexFieldNames:= Column.FieldName + ' DESC';
  end;
end;

procedure TfrmViewCredit.Setprev(const Value: Integer);
begin
  Fprev := Value;
end;

procedure TfrmViewCredit.edtCustIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then spBtnQuery.Click;
end;

end.
