unit desi_o_reportmic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppDB, ppComm, ppRelatv, ppDBPipe, ppBands, ppCache, ppClass,
  ppProd, ppReport, ppStrtch, ppMemo, ppCtrls, ppVar, ppPrnabl,racodmod,ppModule;

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
    ppDB70ppField53: TppField;
    DataSource4: TDataSource;
    ppDB11: TppDBPipeline;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine24: TppLine;
    ppLabel42: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel46: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel17: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText22: TppDBText;
    ppDBText30: TppDBText;
    ppLabel29: TppLabel;
    ppDBText31: TppDBText;
    ppLabel30: TppLabel;
    ppDBText32: TppDBText;
    ppLabel40: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText33: TppDBText;
    ppLabel39: TppLabel;
    ppDBText29: TppDBText;
    ppDBText35: TppDBText;
    ppLabel26: TppLabel;
    ppDBText2: TppDBText;
    ppDBText36: TppDBText;
    ppDBImage2: TppDBImage;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel9: TppLabel;
    ppLabel49: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDBText5: TppDBText;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppLine31: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppDBMemo1: TppDBMemo;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLine32: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppLabel36: TppLabel;
    ppLabel43: TppLabel;
    ppLabel68: TppLabel;
    ppDBText7: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLine4: TppLine;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLine23: TppLine;
    ppDBText27: TppDBText;
    ppLine3: TppLine;
    ppLine28: TppLine;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppMemo1: TppMemo;
    ppLine29: TppLine;
    ppLabel11: TppLabel;
    ppLine41: TppLine;
    ppLabel14: TppLabel;
    ppDBText6: TppDBText;
    ppLine42: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel59: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel37: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel38: TppLabel;
    ppLine30: TppLine;
    ppDBText37: TppDBText;
    ppLabel48: TppLabel;
    ppDBText26: TppDBText;
    ppLabel41: TppLabel;
    ppLine37: TppLine;
    ppLine40: TppLine;
    ppLabel28: TppLabel;
    ppLabel47: TppLabel;
    ppLabel58: TppLabel;
    ppDBText38: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel27: TppLabel;
    ppLabel25: TppLabel;
    ppLabel34: TppLabel;
    ppDBText8: TppDBText;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppDB0070ppField21: TppField;
    ppDB0070ppField22: TppField;
    DataSource5: TDataSource;
    ppDB207011: TppDBPipeline;
    ppDBPipeline1ppField9: TppField;
    ppDBPipeline1ppField10: TppField;
    ppDBPipeline1ppField11: TppField;
    ppDBPipeline1ppField12: TppField;
    ppDBPipeline1ppField13: TppField;
    ppDBPipeline1ppField14: TppField;
    ppDBPipeline1ppField15: TppField;
    ppDBPipeline1ppField16: TppField;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    function SmallTOBig(_Money:double):string;
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
// ppReport1.PreviewForm.WindowState := wsMaximized;
end;

function TForm18.SmallTOBig(_Money:double):string;
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
      if NumDec=0 then
        result:=result+'零元';
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
//------- 修改参数令值更精确 -------
//数点后的位数，需要的话也可以改动该值
 qianwei:=-2;

//转换成货币形式，需要的话小数点后加多几个零
 Smallmonth:=formatfloat('0.00',small);
 dianweizhi :=pos('.',Smallmonth);//{小数点的位置
//循环小写货币的每一位，从小写的右边位置到左边
for qian:=length(Smallmonth) downto 1 do
begin
if qian<>dianweizhi then//如果读到的不是小数点就继续
begin
case strtoint(copy(Smallmonth,qian,1)) of//位置上的数转换成大写
 1:wei1:='壹'; 2:wei1:='贰';
 3:wei1:='叁'; 4:wei1:='肆';
 5:wei1:='伍'; 6:wei1:='陆';
 7:wei1:='柒'; 8:wei1:='捌';
 9:wei1:='玖'; 0:wei1:='零';
end;
case qianwei of //{判断大写位置，可以继续增大到real类型的最大值
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
 BigMonth :=wei1+qianwei1+BigMonth;//组合成大写金额
end;
end;
 SmallTOBig:=BigMonth;
end;              }

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
    ppLabel5.Caption := trim(fieldbyname('factory_address_1').AsString);//+
//                        trim(fieldbyname('factory_address_2').AsString)+
//                        trim(fieldbyname('factory_address_3').AsString);
{   ppLabel14.Caption := fieldbyname('contact').AsString;
    ppLabel15.Caption := fieldbyname('phone').AsString;
    ppLabel16.Caption := fieldbyname('fax').AsString;}
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end;

end.
