unit RptCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB,
  ADODB;

type
  TfrmRptCondition = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn3: TBitBtn;
    dsRpt: TDataSource;
    adsRpt: TADODataSet;
    adsRptDSDesigner18: TIntegerField;
    adsRptDSDesigner: TStringField;
    adsRptDSDesigner2: TDateTimeField;
    adsRptDSDesigner3: TStringField;
    adsRptDSDesigner4: TDateTimeField;
    adsRptDSDesigner5: TStringField;
    adsRptDSDesigner6: TStringField;
    adsRptDSDesigner16: TStringField;
    adsRptDSDesigner7: TStringField;
    adsRptDSDesigner8: TStringField;
    adsRptDSDesigner9: TStringField;
    adsRptDSDesigner10: TStringField;
    adsRptDSDesigner11: TStringField;
    adsRptDSDesigner12: TIntegerField;
    adsRptDSDesigner14: TDateTimeField;
    adsRptDSDesigner15: TIntegerField;
    adsRptDSDesigner17: TStringField;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnLookCust: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    adsRptDSDesigner13: TDateTimeField;
    Label7: TLabel;
    cbStatus: TComboBox;
    adsRptDSDesigner19: TStringField;
    dtpk3: TDateTimePicker;
    dtpk4: TDateTimePicker;
    adsRptDSDesigner20: TDateTimeField;
    adsRptDSDesigner21: TDateTimeField;
    adsRptDSDesigner22: TDateTimeField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnLookCustClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptCondition: TfrmRptCondition;

implementation

uses common, damo, ConstVar, Pick_Item_Single, Reports;

{$R *.dfm}

procedure TfrmRptCondition.BitBtn3Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1, self.Caption);
end;

procedure TfrmRptCondition.BitBtn1Click(Sender: TObject);
var
  iQuo_Status: integer;
begin
  adsRpt.Close;
  adsRpt.Filter:='';
  adsRpt.Parameters[0].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('HH:mm:ss',dtpk3.Time));
  adsRpt.Parameters[1].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('HH:mm:ss',dtpk4.Time));
  case cbStatus.ItemIndex of
    0: iQuo_Status := 2;    //已完成
    1: iQuo_Status := 255;  //已取消
    2: iQuo_Status := -1;   //全部
  else
    iQuo_Status := -1;
  end;
  adsRpt.Parameters[2].Value:= iQuo_Status;
  adsRpt.Parameters[3].Value:= iQuo_Status;
  adsRpt.Parameters[4].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('HH:mm:ss',dtpk3.Time));
  adsRpt.Parameters[5].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('HH:mm:ss',dtpk4.Time));
  adsRpt.Open;
  if Edit1.Text<>'' then
    adsRpt.Filter:= '客户简称 like ''%'+Edit1.Text+'%''';
  if Edit2.Text<>'' then
  begin
    if adsRpt.Filter='' then
      adsRpt.Filter:= '报价类型='''+Edit2.Text+''''
    else
      adsRpt.Filter:= adsRpt.Filter+' AND 报价类型='''+Edit2.Text+'''';
  end;
  if Edit3.Text<>'' then
  begin
    if adsRpt.Filter='' then
      adsRpt.Filter:= '业务员='''+Edit3.Text+''''
    else
      adsRpt.Filter:= adsRpt.Filter+' AND 业务员='''+Edit3.Text+'''';
  end;
  if Edit4.Text<>'' then
  begin
    if adsRpt.Filter='' then
      adsRpt.Filter:= '报价员='''+Edit4.Text+''''
    else
      adsRpt.Filter:= adsRpt.Filter+' AND 报价员='''+Edit4.Text+'''';
  end;
end;

procedure TfrmRptCondition.btnLookCustClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                        'ABBR_NAME/客户简称/200,SALES_REP_NAME/业务代表/100';
    if ((StrToInt(vprev) = 1) or (StrToInt(vprev) = 2)) then
    begin
      InputVar.Sqlstr:= 'Select t10.RKEY,t10.CUST_CODE,t10.CUSTOMER_NAME,t10.ABBR_NAME,t10.BILLING_ADDRESS_1, '+#13+
        't5.RKEY as RKEY5,t5.EMPLOYEE_NAME as SALES_REP_NAME,t10.PHONE,t10.GEN_EMAIL_ADDRESS '+#13+
        'from data0010 t10 inner Join data0100 t100 on t10.RKEY = t100.CUSTOMER_PTR'+#13+
        'Left Join data0005 t5 On t10.SALES_REP_PTR = t5.RKEY'+#13+
        'where t100.CSI_PTR ='+rkey73+#13+
        'order by t10.CUST_CODE';
    end
    else
      InputVar.Sqlstr:=
        'Select t10.RKEY,t10.CUST_CODE,t10.CUSTOMER_NAME,t10.ABBR_NAME,t10.BILLING_ADDRESS_1, '+#13+
        't5.RKEY as RKEY5,t5.EMPLOYEE_NAME as SALES_REP_NAME,t10.PHONE,t10.GEN_EMAIL_ADDRESS '+#13+
        'from data0010 t10 Left Join data0005 t5 '+#13+
        'On t10.SALES_REP_PTR = t5.RKEY '+#13+
        'order by t10.CUST_CODE';
    inputvar.InPut_value:=Edit1.Text;
    inputvar.KeyField:='ABBR_NAME';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text:= frmPick_Item_Single.adsPick.FieldByName('ABBR_NAME').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmRptCondition.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'Code/类型代码/110,Name/类型名称/251,'+
                        'Time/标准时间/100';
    InputVar.Sqlstr:= 'Select Code,Name,Time From Data0241';
    InputVar.InPut_value:=Edit2.Text;
    InputVar.KeyField:='Name';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit2.Text:= frmPick_Item_Single.adsPick.FieldByName('Name').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmRptCondition.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'EMPL_CODE/代码/110,EMPLOYEE_NAME/名称/251';
    InputVar.Sqlstr:= 'Select EMPL_CODE,EMPLOYEE_NAME From Data0005';
    InputVar.InPut_value:=Edit3.Text;
    InputVar.KeyField:='EMPLOYEE_NAME';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit3.Text:= frmPick_Item_Single.adsPick.FieldByName('EMPLOYEE_NAME').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmRptCondition.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'EMPL_CODE/代码/110,EMPLOYEE_NAME/名称/251';
    InputVar.Sqlstr:= 'Select EMPL_CODE,EMPLOYEE_NAME From Data0005';
    InputVar.InPut_value:=Edit4.Text;
    InputVar.KeyField:='EMPLOYEE_NAME';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit4.Text:= frmPick_Item_Single.adsPick.FieldByName('EMPLOYEE_NAME').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

end.
