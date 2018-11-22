unit desi_o_reportmic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppDB, ppComm, ppRelatv, ppDBPipe, ppBands, ppCache, ppClass,
  ppProd, ppReport, ppStrtch, ppMemo, ppCtrls, ppVar, ppPrnabl;

type
  TForm18 = class(TForm)
    ppDB0070: TppDBPipeline;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB70: TppDBPipeline;
    DataSource1: TDataSource;
    ppDB7011: TppDBPipeline;
    ppDB72: TppDBPipeline;
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
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel17: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText26: TppDBText;
    ppLabel41: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLine23: TppLine;
    ppLine26: TppLine;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel26: TppLabel;
    ppLine2: TppLine;
    ppLabel27: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLabel28: TppLabel;
    ppMemo1: TppMemo;
    ppLine3: TppLine;
    ppDBText22: TppDBText;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel39: TppLabel;
    ppLabel37: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel36: TppLabel;
    ppDBText25: TppDBText;
    ppLabel38: TppLabel;
    ppDBText29: TppDBText;
    ppLine27: TppLine;
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
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    function SmallTOBig(small:real):string;
    procedure ppReport1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation
uses damo;
{$R *.dfm}

procedure TForm18.ppReport1PreviewFormCreate(Sender: TObject);
begin
 ppReport1.PreviewForm.WindowState := wsMaximized;
end;

function TForm18.SmallTOBig(small:real):string;
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

procedure TForm18.ppReport1BeforePrint(Sender: TObject);
//var
// v_ship_tax,v_misc_tax,misc_base:single;
begin
 pplabel38.Caption:=smalltobig(dm.ADO70SUB_TOTAL.Value);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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
