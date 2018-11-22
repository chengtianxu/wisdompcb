unit desi_o_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppStrtch, ppMemo, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, DB, ppDB, ppComm, ppRelatv, ppDBPipe;

type
  TForm17 = class(TForm)
    ppDB0070: TppDBPipeline;
    ppDB0070ppField1: TppField;
    ppDB0070ppField2: TppField;
    ppDB0070ppField3: TppField;
    ppDB0070ppField4: TppField;
    ppDB0070ppField5: TppField;
    ppDB0070ppField6: TppField;
    ppDB0070ppField7: TppField;
    ppDB0070ppField8: TppField;
    ppDB0070ppField9: TppField;
    ppDB0070ppField10: TppField;
    ppDB0070ppField11: TppField;
    ppDB0070ppField12: TppField;
    ppDB0070ppField13: TppField;
    ppDB0070ppField14: TppField;
    ppDB0070ppField15: TppField;
    ppDB0070ppField16: TppField;
    ppDB0070ppField17: TppField;
    ppDB0070ppField18: TppField;
    ppDB0070ppField19: TppField;
    ppDB0070ppField20: TppField;
    ppDB71: TppDBPipeline;
    ppDB71ppField1: TppField;
    ppDB71ppField2: TppField;
    ppDB71ppField3: TppField;
    ppDB71ppField4: TppField;
    ppDB71ppField5: TppField;
    ppDB71ppField6: TppField;
    ppDB71ppField7: TppField;
    ppDB71ppField8: TppField;
    ppDB71ppField9: TppField;
    ppDB71ppField10: TppField;
    ppDB71ppField11: TppField;
    ppDB71ppField12: TppField;
    ppDB71ppField13: TppField;
    ppDB71ppField14: TppField;
    ppDB71ppField15: TppField;
    ppDB71ppField16: TppField;
    ppDB71ppField17: TppField;
    ppDB71ppField18: TppField;
    ppDB71ppField19: TppField;
    ppDB71ppField20: TppField;
    ppDB71ppField21: TppField;
    ppDB71ppField22: TppField;
    ppDB71ppField23: TppField;
    ppDB71ppField24: TppField;
    ppDB71ppField25: TppField;
    DataSource1: TDataSource;
    ppDB7011: TppDBPipeline;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText26: TppDBText;
    ppLabel41: TppLabel;
    ppLabel40: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel44: TppLabel;
    ppDBText32: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText33: TppDBText;
    ppLabel45: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppDBText47: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel8: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel43: TppLabel;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine41: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText16: TppDBText;
    ppDBText28: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBText34: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine43: TppLine;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine3: TppLine;
    ppLine8: TppLine;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppMemo2: TppMemo;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLine49: TppLine;
    ppLabel66: TppLabel;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppDBText48: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel36: TppLabel;
    ppLine27: TppLine;
    ppLabel38: TppLabel;
    ppLabel60: TppLabel;
    ppDBText44: TppDBText;
    ppLabel61: TppLabel;
    ppLine2: TppLine;
    ppDB70: TppDBPipeline;
    ppDB70ppField1: TppField;
    ppDB70ppField2: TppField;
    ppDB70ppField3: TppField;
    ppDB70ppField4: TppField;
    ppDB70ppField5: TppField;
    ppDB70ppField6: TppField;
    ppDB70ppField7: TppField;
    ppDB70ppField8: TppField;
    ppDB70ppField9: TppField;
    ppDB70ppField10: TppField;
    ppDB70ppField11: TppField;
    ppDB70ppField12: TppField;
    ppDB70ppField13: TppField;
    ppDB70ppField14: TppField;
    ppDB70ppField15: TppField;
    ppDB70ppField16: TppField;
    ppDB70ppField17: TppField;
    ppDB70ppField18: TppField;
    ppDB70ppField19: TppField;
    ppDB70ppField20: TppField;
    ppDB70ppField21: TppField;
    ppDB70ppField22: TppField;
    ppDB70ppField23: TppField;
    ppDB70ppField24: TppField;
    ppDB70ppField25: TppField;
    ppDB70ppField26: TppField;
    ppDB70ppField27: TppField;
    ppDB70ppField28: TppField;
    ppDB70ppField29: TppField;
    ppDB70ppField30: TppField;
    ppDB70ppField31: TppField;
    ppDB70ppField32: TppField;
    ppDB70ppField33: TppField;
    ppDB70ppField34: TppField;
    ppDB70ppField35: TppField;
    ppDB70ppField36: TppField;
    ppDB70ppField37: TppField;
    ppDB70ppField38: TppField;
    ppDB70ppField39: TppField;
    ppDB70ppField40: TppField;
    ppDB70ppField41: TppField;
    ppDB70ppField42: TppField;
    ppDB70ppField43: TppField;
    ppDB70ppField44: TppField;
    ppDB70ppField45: TppField;
    ppDB70ppField46: TppField;
    ppDB70ppField47: TppField;
    ppDB70ppField48: TppField;
    ppDB70ppField49: TppField;
    ppDB70ppField50: TppField;
    ppDB70ppField51: TppField;
    ppDB70ppField52: TppField;
    DataSource3: TDataSource;
    ppDB15: TppDBPipeline;
    ppDB15ppField1: TppField;
    ppDB15ppField2: TppField;
    ppDB15ppField3: TppField;
    ppDB15ppField4: TppField;
    ppDB15ppField5: TppField;
    ppDB15ppField6: TppField;
    ppDB15ppField7: TppField;
    ppDB15ppField8: TppField;
    ppDB15ppField9: TppField;
    ppDB15ppField10: TppField;
    ppDB15ppField11: TppField;
    ppDB15ppField12: TppField;
    ppDB15ppField13: TppField;
    ppDB15ppField14: TppField;
    ppDB15ppField15: TppField;
    ppDB15ppField16: TppField;
    ppDB15ppField17: TppField;
    ppDB15ppField19: TppField;
    ppDB15ppField20: TppField;
    ppDB15ppField21: TppField;
    ppDB15ppField22: TppField;
    ppDB15ppField23: TppField;
    ppDB15ppField24: TppField;
    ppDB15ppField25: TppField;
    ppDB15ppField26: TppField;
    ppDB15ppField27: TppField;
    ppDB15ppField28: TppField;
    ppDB15ppField29: TppField;
    ppDB15ppField30: TppField;
    ppDB15ppField31: TppField;
    ppDB15ppField32: TppField;
    ppDB15ppField33: TppField;
    ppDBText7: TppDBText;
    DataSource4: TDataSource;
    ppDB11: TppDBPipeline;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDBPipeline1ppField8: TppField;
    function SmallTOBig(small:real):string;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

uses damo;

{$R *.dfm}

procedure TForm17.ppReport1PreviewFormCreate(Sender: TObject);
begin
 ppReport1.PreviewForm.WindowState := wsMaximized;
end;

function Tform17.SmallTOBig(small:real):string;
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
 3:wei1:='三'; 4:wei1:='肆';
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

procedure TForm17.ppReport1BeforePrint(Sender: TObject);
//var
// v_ship_tax,v_misc_tax,misc_base:single;
begin
 pplabel38.Caption:=SmallTOBig(dm.ADO70SUB_TOTAL.Value);//大写
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
{ v_ship_tax:=0;      //计算杂项与运输费用税金
 v_misc_tax:=0;
 misc_base:=0;
if dm.ADO70STATE_SHIP_TAX_FLAG.Value='Y' then
 v_ship_tax :=dm.ADO70SHIPPING_COST.Value*dm.ADO70FEDERAL_TAX.Value/100;
if dm.ADO70STATE_MISC_TAX_FLAG.Value='Y' then
 begin
  dm.ado200.First;
  while not dm.ADO200.Eof do
   begin
    if dm.ADO200TAXABLE.Value='Y' then
     misc_base := misc_base+ dm.ADO200AMOUNT.Value;
    dm.ADO200.Next;
   end;
  v_misc_tax := misc_base*dm.ADO70FEDERAL_TAX.Value*0.01;
 end;
 ppLabel36.Caption := formatfloat('0.00',v_ship_tax+v_misc_tax);} //杂项装运税
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  with dm.ADOQuery2 do
   begin
    active:=false;         //读取装运地点信息
    sql.Clear;
    sql.Add('select factory_address_1,factory_address_2,factory_address_3,');
    sql.Add('CONTACT,PHONE,FAX');
    sql.Add('from data0024');
    sql.Add('where rkey='+dm.ADO70SUPP_FAC_ADD_PTR.AsString);
    active:=true;
    ppLabel5.Caption := trim(fieldbyname('factory_address_1').AsString)+
                        trim(fieldbyname('factory_address_2').AsString)+
                        trim(fieldbyname('factory_address_3').AsString);

{   ppLabel14.Caption := fieldbyname('contact').AsString;
    ppLabel15.Caption := fieldbyname('phone').AsString;
    ppLabel16.Caption := fieldbyname('fax').AsString;}
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

end;

end.
