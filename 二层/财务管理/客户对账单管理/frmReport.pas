unit frmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ppProd, ppClass, ppReport,
  ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppStrtch, ppMemo, ppEndUsr,
  ADODB;

type
  TForm_Report = class(TForm)
    Aq493: TADOQuery;
    Aq493Company_Name: TStringField;
    Aq493Company_Name2: TStringField;
    Aq493Company_Name3: TStringField;
    Aq493ship_address: TStringField;
    Aq493Company_Icon: TBlobField;
    Aq493SITE_INFO_ADD_1: TStringField;
    Aq493SITE_INFO_ADD_2: TStringField;
    Aq493SITE_INFO_ADD_3: TStringField;
    Aq493SITE_INFO_PHONE: TStringField;
    Aqwz236: TADOQuery;
    Aqwz236RKEY: TAutoIncField;
    Aqwz236VOUCHER: TStringField;
    Aqwz236ENTERED_BY_EMPL_PTR: TIntegerField;
    Aqwz236AUDITED_BY_EMPL_PTR: TIntegerField;
    Aqwz236ENTERED_DT: TDateTimeField;
    Aqwz236CUSTOMER_PTR: TIntegerField;
    Aqwz236CURRENCY_PTR: TIntegerField;
    Aqwz236STATUS: TSmallintField;
    Aqwz236EXCHANGE_RATE: TBCDField;
    Aqwz236BATCH_NUMBER: TStringField;
    Aqwz236FYEAR: TIntegerField;
    Aqwz236PERIOD: TSmallintField;
    Aqwz236TOOL_AMOUNT: TBCDField;
    Aqwz236OTHERS_AMOUNT: TBCDField;
    Aqwz236SHIP_AMOUNT: TBCDField;
    Aqwz236TAX_AMOUNT: TBCDField;
    Aqwz236RECEIVABLE_AMOUNT: TBCDField;
    Aqwz237: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Aqwz236cust_code: TStringField;
    Aqwz236customer_name: TStringField;
    Aqwz236abbr_name: TStringField;
    Aqwz236curr_code: TStringField;
    Aqwz236curr_name: TStringField;
    Aqwz236ent_name: TStringField;
    Aqwz236audit_name: TStringField;
    DB236: TppDBPipeline;
    DB493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    Aqwz237rkey: TIntegerField;
    Aqwz237rkey236_ptr: TIntegerField;
    Aqwz237SO_SHP_PTR: TIntegerField;
    Aqwz237RMA_PTR: TIntegerField;
    Aqwz237QUANTITY: TIntegerField;
    Aqwz237DEBIT_PTR: TIntegerField;
    Aqwz237recon_amount: TBCDField;
    Aqwz237INVOICE_PTR: TIntegerField;
    Aqwz237delivery_no: TStringField;
    Aqwz237date_sailing: TDateTimeField;
    Aqwz237DSDesigner: TStringField;
    Aqwz237DSDesigner2: TStringField;
    Aqwz237DSDesigner3: TStringField;
    Aqwz237DSDesigner4: TStringField;
    Aqwz237DSDesigner5: TStringField;
    Aqwz237DSDesigner6: TFloatField;
    Aqwz237DSDesigner7: TBCDField;
    Aqwz237DSDesigner8: TStringField;
    Aqwz237DSDesigner9: TBCDField;
    Aqwz237DSDesigner10: TBCDField;
    Aqwz237DSDesigner11: TBCDField;
    Aqwz237DSDesigner12: TBCDField;
    Aqwz237DSDesigner13: TFloatField;
    Aqwz237DSDesigner14: TStringField;
    DB237: TppDBPipeline;
    Aqwz237DSDesigner15: TBCDField;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppLabel40: TppLabel;
    ppDBText31: TppDBText;
    ppLabel44: TppLabel;
    ppDBText32: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText33: TppDBText;
    ppLabel45: TppLabel;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppDBText47: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel6: TppLabel;
    ppDBText11: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText2: TppDBText;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel52: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBCalc4: TppDBCalc;
    ppDBText34: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLine35: TppLine;
    ppLine40: TppLine;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDBText7: TppDBText;
    ppLine9: TppLine;
    ppDBText12: TppDBText;
    ppLine11: TppLine;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLabel62: TppLabel;
    ppLine53: TppLine;
    ppLabel67: TppLabel;
    ppDBText49: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppDBText13: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine17: TppLine;
    ppLabel61: TppLabel;
    ppLine2: TppLine;
    ppLine12: TppLine;
    ppLabel38: TppLabel;
    ppLabel23: TppLabel;
    ppLabel4: TppLabel;
    ppLabel19: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel5: TppLabel;
    ppDBText18: TppDBText;
    ppDBText14: TppDBText;
    procedure ppReport1BeforePrint(Sender: TObject);
    function SmallTOBig(small:real):string;
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

procedure TForm_Report.ppReport1BeforePrint(Sender: TObject);
begin
 pplabel18.Caption:=SmallTOBig(Abs(Aqwz236RECEIVABLE_AMOUNT.Value));//大写
end;

function TForm_Report.SmallTOBig(small:real):string;
var
SmallMonth,BigMonth:string;
wei1,qianwei1:string[2];
qianwei,dianweizhi,qian:integer;
begin
{------- 修改参数令值更精确 -------}
{小数点后的位数，需要的话也可以改动该值}
 qianwei:=-2;

{转换成货币形式，需要的话小数点后加多几个零}
 Smallmonth:=formatfloat('0.00',small);
 dianweizhi :=pos('.',Smallmonth);{小数点的位置}
{循环小写货币的每一位，从小写的右边位置到左边}
for qian:=length(Smallmonth) downto 1 do
begin
if qian<>dianweizhi then{如果读到的不是小数点就继续}
begin
case strtoint(copy(Smallmonth,qian,1)) of{位置上的数转换成大写}
 1:wei1:='壹'; 2:wei1:='贰';
 3:wei1:='叁'; 4:wei1:='肆';
 5:wei1:='伍'; 6:wei1:='陆';
 7:wei1:='柒'; 8:wei1:='捌';
 9:wei1:='玖'; 0:wei1:='零';
end;
case qianwei of {判断大写位置，可以继续增大到real类型的最大值}
 -3:qianwei1:='厘';
 -2:qianwei1:='分';
 -1:qianwei1:='角';
 0 :qianwei1:='元';
 1 :qianwei1:='拾';
 2 :qianwei1:='佰';
 3 :qianwei1:='千';
 4 :qianwei1:='万';
 5 :qianwei1:='拾';
 6 :qianwei1:='佰';
 7 :qianwei1:='千';
 8 :qianwei1:='亿';
 9 :qianwei1:='十';
 10:qianwei1:='佰';
 11:qianwei1:='千';
end;
 inc(qianwei); //自动加1
 BigMonth :=wei1+qianwei1+BigMonth;{组合成大写金额}
end;
end;
 SmallTOBig:=BigMonth;
end;

end.
