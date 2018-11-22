unit waifa_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppCtrls, ppMemo, ppStrtch, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, DB, ppDB, ppComm, ppRelatv, ppDBPipe;

type
  TForm5 = class(TForm)
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
    ppDB7011ppField1: TppField;
    ppDB7011ppField2: TppField;
    ppDB7011ppField3: TppField;
    ppDB7011ppField4: TppField;
    ppDB7011ppField5: TppField;
    ppDB7011ppField6: TppField;
    ppDB7011ppField7: TppField;
    ppDB7011ppField8: TppField;
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
    ppDB70ppField53: TppField;
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
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
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
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel17: TppLabel;
    ppLabel3: TppLabel;
    ppLabel19: TppLabel;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
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
    ppDBText26: TppDBText;
    ppLabel41: TppLabel;
    ppLabel18: TppLabel;
    ppDBText7: TppDBText;
    ppImage1: TppImage;
    ppImage2: TppImage;
    function MoneyToChinese(_Money:double):string;
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses damo;

{$R *.dfm}

function tform5.MoneyToChinese(_Money:double):string;
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

procedure TForm5.ppReport1BeforePrint(Sender: TObject);
begin
 pplabel38.Caption:=self.MoneyToChinese(dm.ADO70SUB_TOTAL.Value);//大写
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
   end;
end;

procedure TForm5.ppReport1PreviewFormCreate(Sender: TObject);
begin
// ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
