unit voucher_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppProd, ppClass,
  ppReport, ppPrnabl, ppCtrls, ppBands, ppCache, ppVar, ppModule, raCodMod,
  ppStrtch, ppMemo;

type
  TForm_voucherreport = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    AQD105: TADODataSet;
    AQD106: TADODataSet;
    AQD493: TADODataSet;
    AQD105RKEY: TIntegerField;
    AQD105DSDesigner: TStringField;
    AQD105DSDesigner2: TIntegerField;
    AQD105DSDesigner3: TSmallintField;
    AQD105DSDesigner4: TSmallintField;
    AQD105DSDesigner5: TStringField;
    AQD105DSDesigner6: TDateTimeField;
    AQD105DSDesigner7: TDateTimeField;
    AQD105DSDesigner8: TStringField;
    AQD105DSDesigner9: TStringField;
    AQD105DSDesigner10: TStringField;
    AQD105DSDesigner11: TStringField;
    AQD105DSDesigner12: TStringField;
    AQD105DSDesigner13: TStringField;
    AQD105DSDesigner14: TStringField;
    AQD493DSDesigner1: TStringField;
    AQD493DSDesigner2: TStringField;
    AQD493DSDesigner: TStringField;
    AQD493DSDesigner3: TBlobField;
    AQD493DSDesigner12: TStringField;
    AQD493DSDesigner22: TStringField;
    AQD493DSDesigner32: TStringField;
    AQD493DSDesigner4: TStringField;
    AQD106DSDesigner: TStringField;
    AQD106DSDesigner2: TStringField;
    AQD106D_C: TStringField;
    AQD106AMOUNT: TBCDField;
    AQD106EXCH_RATE: TFloatField;
    AQD106DSDesigner3: TStringField;
    AQD106DSDesigner4: TStringField;
    AQD106DSDesigner5: TStringField;
    DB105: TppDBPipeline;
    DB106: TppDBPipeline;
    DB493: TppDBPipeline;
    ppReport1: TppReport;
    AQD493DSDesigner33: TStringField;
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppDBText6: TppDBText;
    ppLabel5: TppLabel;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine8: TppLine;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppVariable2: TppVariable;
    ppVariable1: TppVariable;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppLabel12: TppLabel;
    ppDBText14: TppDBText;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppDBText16: TppDBText;
    ppLabel16: TppLabel;
    ppDBText17: TppDBText;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine17: TppLine;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    raCodeModule1: TraCodeModule;
    AQD106DSDesigner6: TStringField;
    AQD106DSDesigner7: TBCDField;
    DB106ppField9: TppField;
    function SmallTOBig(_Money:double):string;
    procedure ppReport1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_voucherreport: TForm_voucherreport;

implementation

uses Datamodule;



{$R *.dfm}

function TForm_voucherreport.SmallTOBig(_Money:double):string;
const
 ChiSegCount=4;
 ChiSegs:array[1..ChiSegCount]of string=('Ôª', 'Íò', 'ÒÚ', 'Õ×');
 ChiSecCount=4;
 ChiSecs:array[1..ChiSecCount]of string=('', 'Ê°', '°Û', 'Çª');
 ChiVals:array[0..9]of string=('Áã', 'Ò¼', '·¡', 'Èþ', 'ËÁ', 'Îé', 'Â½', 'Æâ', '°Æ', '¾Á');
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
      result:=result+'¸º';
    end;
  NumInt:=Trunc(_Money);
  NumDec:=Round(_Money*100) mod 100;
  SegDiv:=10000000000000000;
  if NumInt=0 then
   begin
    if NumDec=0 then result:=result+'ÁãÔª';
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
              result:=result+'Áã';
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
    result:=result+ChiVals[NumInt]+'½Ç';
  NumDec:=NumDec mod 10;
  if NumDec>0 then
   if NumInt>0 then
    result:=result+ChiVals[NumDec]+'·Ö'
   else
    result:=result+'Áã'+ChiVals[NumDec]+'·Ö';
end;

procedure TForm_voucherreport.ppReport1BeforePrint(Sender: TObject);
var
 d_amount:currency;
begin
 d_amount:=0;
 self.AQD106.First;
 while not aqd106.Eof do
  begin
   if self.AQD106D_C.Value='D' then
   d_amount:=d_amount+self.AQD106AMOUNT.Value;
   aqd106.Next;
  end;
 self.AQD106.First;
ppLabel20.Caption :=self.SmallTOBig(d_amount)+'Õû';
end;

end.
