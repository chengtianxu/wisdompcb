unit AdviceReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, DB, ppEndUsr, ppBands, ppCtrls, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ADODB, ppStrtch,
  ppMemo,Math, ppModule, raCodMod;

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
    Aqwz530PO_NUMBER: TStringField;
    Aqwz530CURR_CODE: TStringField;
    Aqwz530CURR_NAME: TStringField;
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
    ADOQuery1: TADOQuery;
    ADOQuery1total_quan: TIntegerField;
    ADOQuery1total_cartons: TIntegerField;
    ADOQuery1total_mweight: TBCDField;
    ADOQuery1amount: TFloatField;
    Aqwz530DSDesigner5: TStringField;
    Aqwz530REMARK1: TStringField;
    Aqwz530REMARK2: TStringField;
    Aqwz530EXCH_RATE: TFloatField;
    Aqwz530REPORT_UNIT_VALUE1: TBCDField;
    ADOQuery1other_amount: TBCDField;
    ADOQuery1total_nweight: TBCDField;
    Aqwz530FloatField: TFloatField;
    DB530: TppDBPipeline;
    Aqwz530CurrencyField: TFloatField;
    DB530ppField24: TppField;
    Aqwz529ORIG_CUSTOMER: TStringField;
    DB529ppField36: TppField;
    ppHeaderBand2: TppHeaderBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText5: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel1: TppLabel;
    ppDBText16: TppDBText;
    ppLabel26: TppLabel;
    ppLabel2: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppLabel8: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLine29: TppLine;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppLine1: TppLine;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppFooterBand2: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel46: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
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
 ADOQuery1.Parameters[4].Value:=Aqwz530DSDesigner2.value;
 ADOQuery1.Parameters[5].Value:=Aqwz530DSDesigner3.Value;
 ADOQuery1.Parameters[6].Value:=Aqwz530DSDesigner4.Value;
 ADOQuery1.Parameters[7].Value:=Aqwz530REMARK1.Value;
 ADOQuery1.Parameters[8].Value:=Aqwz530REMARK2.Value;
 ADOQuery1.Parameters[9].Value:=Aqwz530DSDesigner5.Value;
 ADOQuery1.Parameters[10].Value:=Aqwz530PART_PRICE.Value;
 ADOQuery1.Parameters[11].Value:=Aqwz530REPORT_UNIT_VALUE1.Value;
 ADOQuery1.Open;
 Aqwz530Quan_declare.Value:=ADOQuery1.FieldValues['total_quan'];
 Aqwz530Cartons_no.Value:=ADOQuery1.FieldValues['total_cartons'];
 Aqwz530Weight.Value:=ADOQuery1.FieldValues['total_nweight'];
 Aqwz530mWeight.Value:=ADOQuery1.FieldValues['total_mweight'];
 Aqwz530FloatField.Value:=ADOQuery1.FieldValues['other_amount'];
 Aqwz530CurrencyField.Value:=ADOQuery1.FieldValues['amount'];
 Aqwz530Amount.Value:= ADOQuery1.FieldValues['amount']+Aqwz530FloatField.Value;
end;

end.
