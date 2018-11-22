unit desi_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ppProd, ppClass, ppReport,
  ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppStrtch, ppMemo,racodmod,ppModule;

type
  TForm14 = class(TForm)
    ppDB0070: TppDBPipeline;
    ppDB71: TppDBPipeline;
    DataSource1: TDataSource;
    ppDB7011: TppDBPipeline;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    ppDB70: TppDBPipeline;
    DataSource3: TDataSource;
    ppDB15: TppDBPipeline;
    ppDB70ppField53: TppField;
    DataSource4: TDataSource;
    ppDB11: TppDBPipeline;
    ppDB0070ppField21: TppField;
    ppDB0070ppField22: TppField;
    DataSource5: TDataSource;
    ppDB207011: TppDBPipeline;
    ppDB71ppField26: TppField;
    ppDB71ppField27: TppField;
    ppDB71ppField28: TppField;
    ppDB71ppField29: TppField;
    ppDB71ppField30: TppField;
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
    ppLabel25: TppLabel;
    ppDBText2: TppDBText;
    ppDBText22: TppDBText;
    ppDBText16: TppDBText;
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
    ppLabel16: TppLabel;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLabel17: TppLabel;
    ppLine20: TppLine;
    ppLabel18: TppLabel;
    ppLabel28: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine3: TppLine;
    ppDBCalc4: TppDBCalc;
    ppDBText34: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLine35: TppLine;
    ppLine40: TppLine;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDBText7: TppDBText;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppDBMemo1: TppDBMemo;
    ppLine19: TppLine;
    ppDBText12: TppDBText;
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
    ppSystemVariable1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine17: TppLine;
    ppLabel61: TppLabel;
    ppLine2: TppLine;
    ppLine12: TppLine;
    ppLabel38: TppLabel;
    ppLabel23: TppLabel;
    ppLabel4: TppLabel;
    ppLabel19: TppLabel;
    ppLine14: TppLine;
    ppLabel5: TppLabel;
    ppDBText14: TppDBText;
    ppMemo1: TppMemo;
    ppDBText15: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLabel15: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    function SmallTOBig(_Money:double):string;
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation
uses damo;
{$R *.dfm}
function Tform14.SmallTOBig(_Money:double):string;
const
  ChiSegCount=4;
  ChiSegs:array[1..ChiSegCount]of string=('元', '万', '亿', '兆');
  ChiSecCount=4;
  ChiSecs:array[1..ChiSecCount]of string=('', '拾', '佰', '仟');
  ChiVals:array[0..9]of string=('零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖');
var
  NumInt:Int64;
  Seg, SegDiv:Int64;
  Sec, SecDiv, NumDec, i, j:smallint;
  ZeroState, HasSec, HasHead:boolean;
begin
  result:='';
  ZeroState:=TRUE;
  HasHead:=FALSE;
  if _Money<0 then
    begin
      _Money:=-_Money;
      result:=result+'负';
    end;
  NumInt:=Trunc(_Money);
  NumDec:=Round(_Money*100) mod 100;
  SegDiv:=10000000000000000;
  if NumInt=0 then
   begin
    if NumDec=0 then result:=result+'零元';
   end
  else begin
    NumInt:=NumInt mod (SegDiv * 10000);
    for i:=ChiSegCount+1 downto 1 do
    begin
      Seg:=NumInt div SegDiv;
      SecDiv:=1000;
      HasSec:=FALSE;
      for j:=ChiSecCount downto 1 do
      begin
        Sec:=Seg div SecDiv;
        if Sec>0 then
          begin
            if ZeroState and HasHead then
              result:=result+'零';
            result:=result+ChiVals[Sec]+ChiSecs[j];
            ZeroState:=FALSE;
            HasSec:=TRUE;
            HasHead:=TRUE;
          end
        else
          ZeroState:=TRUE;
        Seg:=Seg mod SecDiv;
        SecDiv:=SecDiv div 10;
      end;
      if HasSec then
        result:=result+ChiSegs[i];
      NumInt:=NumInt mod SegDiv;
      SegDiv:=SegDiv div 10000;
    end;
  end;
  NumInt:=NumDec div 10;
  if NumInt>0 then
    result:=result+ChiVals[NumInt]+'角';
  NumDec:=NumDec mod 10;
  if NumDec>0 then
   if NumInt>0 then
    result:=result+ChiVals[NumDec]+'分'
   else
    result:=result+'零'+ChiVals[NumDec]+'分';
end;
{var
SmallMonth,BigMonth:string;
wei1,qianwei1:string[2];
qianwei,dianweizhi,qian:integer;
begin

 qianwei:=-2;

 Smallmonth:=formatfloat('0.00',small);
 dianweizhi :=pos('.',Smallmonth);

for qian:=length(Smallmonth) downto 1 do
begin
if qian<>dianweizhi then
begin
case strtoint(copy(Smallmonth,qian,1)) of
 1:wei1:='壹'; 2:wei1:='贰';
 3:wei1:='叁'; 4:wei1:='肆';
 5:wei1:='伍'; 6:wei1:='陆';
 7:wei1:='柒'; 8:wei1:='捌';
 9:wei1:='玖'; 0:wei1:='零';
end;
case qianwei of
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
 BigMonth :=wei1+qianwei1+BigMonth;
end;
end;
 SmallTOBig:=BigMonth;
end;}

procedure TForm14.ppReport1BeforePrint(Sender: TObject);
//var
// v_ship_tax,v_misc_tax,misc_base:single;
begin
 pplabel38.Caption:=SmallTOBig(dm.ADO70SUB_TOTAL.Value);//大写
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
{v_ship_tax:=0;      //计算杂项与运输费用税金
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
    ppLabel5.Caption := trim(fieldbyname('factory_address_1').AsString);
//+trim(fieldbyname('factory_address_2').AsString)+
//trim(fieldbyname('factory_address_3').AsString);
{   ppLabel14.Caption := fieldbyname('contact').AsString;
    ppLabel15.Caption := fieldbyname('phone').AsString;
    ppLabel16.Caption := fieldbyname('fax').AsString;}
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end;

procedure TForm14.ppReport1PreviewFormCreate(Sender: TObject);
begin
// ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
