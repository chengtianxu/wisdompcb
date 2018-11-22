unit AdviceReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, DB, ppEndUsr, ppBands, ppCtrls, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ADODB, ppStrtch,
  ppMemo,Math;

type
  TForm_Report = class(TForm)
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    Aqwz529: TADOQuery;
    Aqwz530: TADOQuery;
    Aq493: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DB493: TppDBPipeline;
    Aqwz529rkey: TAutoIncField;
    Aqwz529shipadvice_no: TStringField;
    Aqwz529ship_addr_ptr: TIntegerField;
    Aqwz529empl_ptr: TIntegerField;
    Aqwz529attn: TStringField;
    Aqwz529attn1: TStringField;
    Aqwz529attn_cc: TStringField;
    Aqwz529adv_from: TStringField;
    Aqwz529adv_from_cc: TStringField;
    Aqwz529ship_from: TStringField;
    Aqwz529to_port: TStringField;
    Aqwz529fax_no: TStringField;
    Aqwz529ship_to_phone: TStringField;
    Aqwz529fax_to: TStringField;
    Aqwz529tdate: TDateTimeField;
    Aqwz529mawb_no: TStringField;
    Aqwz529hawb_no: TStringField;
    Aqwz529flight_no: TStringField;
    Aqwz529depa_date: TDateTimeField;
    Aqwz529tstatus: TWordField;
    Aqwz529cust_code: TStringField;
    Aqwz529customer_name: TStringField;
    Aqwz529APPLY_IN_TRANSIT: TWordField;
    Aqwz529DSDesigner: TStringField;
    Aqwz529DSDesigner2: TStringField;
    Aqwz529DSDesigner3: TStringField;
    Aqwz529location: TStringField;
    Aqwz529SHIP_TO_CONTACT: TStringField;
    Aqwz529cod_flag: TStringField;
    Aqwz529employee_name: TStringField;
    Aqwz529SHIP_TO_FAX: TStringField;
    Aq493Company_Name: TStringField;
    Aq493Company_Name2: TStringField;
    Aq493Company_Name3: TStringField;
    Aq493ship_address: TStringField;
    Aq493Company_Icon: TBlobField;
    Aq493SITE_INFO_ADD_1: TStringField;
    Aq493SITE_INFO_ADD_2: TStringField;
    Aq493SITE_INFO_ADD_3: TStringField;
    Aq493SITE_INFO_PHONE: TStringField;
    DB529: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShape1: TppShape;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppLine4: TppLine;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine6: TppLine;
    ppDBText13: TppDBText;
    ppLine8: TppLine;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine10: TppLine;
    ppDBText16: TppDBText;
    ppLine11: TppLine;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLine12: TppLine;
    ppDBText19: TppDBText;
    ppLine7: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine13: TppLine;
    ppLine32: TppLine;
    ppLine9: TppLine;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    Aqwz529DSDesigner4: TStringField;
    DB529ppField32: TppField;
    Aqwz529DSDesigner5: TStringField;
    DB529ppField33: TppField;
    Aqwz530PART_PRICE: TFloatField;
    Aqwz530MANU_PART_NUMBER: TStringField;
    Aqwz530DSDesigner: TStringField;
    Aqwz530DSDesigner2: TStringField;
    Aqwz530DSDesigner3: TStringField;
    Aqwz530DSDesigner4: TWordField;
    Aqwz530rkey529_ptr: TIntegerField;
    Aqwz530PCS: TBCDField;
    Aqwz530DSDesigner5: TStringField;
    Aqwz530REMARK1: TStringField;
    Aqwz530REMARK2: TStringField;
    Aqwz530PO_NUMBER: TStringField;
    Aqwz530CURR_CODE: TStringField;
    Aqwz530CURR_NAME: TStringField;
    Aqwz530exch_rate: TFloatField;
    Aqwz530Quan_declare: TIntegerField;
    Aqwz530Cartons_no: TIntegerField;
    Aqwz530Amount: TFloatField;
    Aqwz530Weight: TFloatField;
    Aqwz530mWeight: TFloatField;
    Aqwz530No: TIntegerField;
    Aqwz529DSDesigner6: TStringField;
    DB529ppField34: TppField;
    Aqwz529curr_code: TStringField;
    DB529ppField35: TppField;
    DB530: TppDBPipeline;
    ADOQuery1: TADOQuery;
    ADOQuery1total_quan: TIntegerField;
    ADOQuery1total_cartons: TIntegerField;
    ADOQuery1total_mweight: TBCDField;
    ADOQuery1amount: TFloatField;
    ADOQuery1total_weight: TBCDField;
    procedure Aqwz530CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Report: TForm_Report;

implementation

uses Demo;

{$R *.dfm}

procedure TForm_Report.Aqwz530CalcFields(DataSet: TDataSet);
begin
 if Aqwz530.Bof=True then
 begin
  Aqwz530No.Value:=1;
 end
 else
 begin
  Aqwz530No.Value:=Aqwz530.RecNo;
 end;
 ADOQuery1.Close;
 ADOQuery1.Parameters[0].Value:=Aqwz530rkey529_ptr.Value;
 ADOQuery1.Parameters[1].Value:=Aqwz530PO_NUMBER.Value;
 ADOQuery1.Parameters[2].Value:=Aqwz530MANU_PART_NUMBER.Value;
 ADOQuery1.Parameters[3].Value:=Aqwz530DSDesigner.Value;
 ADOQuery1.Parameters[4].Value:=Aqwz530DSDesigner2.Value;
 ADOQuery1.Parameters[5].Value:=Aqwz530DSDesigner3.Value;
 ADOQuery1.Parameters[6].Value:=Aqwz530DSDesigner4.Value;
 ADOQuery1.Parameters[7].Value:=Aqwz530REMARK1.Value;
 ADOQuery1.Parameters[8].Value:=Aqwz530REMARK2.Value;
 ADOQuery1.Parameters[9].Value:=Aqwz530DSDesigner5.Value;
 ADOQuery1.Parameters[10].Value:=Aqwz530PART_PRICE.Value;
 ADOQuery1.Open;
 Aqwz530Quan_declare.Value:=ADOQuery1.FieldValues['total_quan'];
 Aqwz530Cartons_no.Value:=ADOQuery1.FieldValues['total_cartons'];
 Aqwz530Weight.Value:=ADOQuery1.FieldValues['total_weight'];
 Aqwz530mWeight.Value:=ADOQuery1.FieldValues['total_mweight'];
 Aqwz530Amount.Value:=ADOQuery1.FieldValues['amount'];
end;

end.
