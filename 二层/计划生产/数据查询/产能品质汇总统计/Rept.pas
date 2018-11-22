unit Rept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, common, DB, ADODB, ppDB, ppDBPipe, ppEndUsr, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl,
  ppModule, raCodMod, daDataModule, ppVar, ppStrtch, ppMemo;

type
  TFrmRep = class(TForm)
    ds1: TDataSource;
    dsADS729: TADODataSet;
    prprt1: TppReport;
    pdsgnr1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    plbl1: TppLabel;
    pdbtxt1: TppDBText;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    pln1: TppLine;
    pln2: TppLine;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    pln3: TppLine;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    pln4: TppLine;
    pln5: TppLine;
    pln6: TppLine;
    pln7: TppLine;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    pln8: TppLine;
    pln9: TppLine;
    pln10: TppLine;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    pln11: TppLine;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    pln12: TppLine;
    ppShape2: TppShape;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel12: TppLabel;
    ppLine16: TppLine;
    ppLabel13: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel14: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppImage1: TppImage;
    ppLine27: TppLine;
    ppDBText12: TppDBText;
    ppDBPipeline1: TppDBPipeline;
    intgrfldADS729rkey: TIntegerField;
    wdstrngfldADS729DSDesigner: TWideStringField;
    fltfldADS729DSDesigner2: TFloatField;
    fltfldADS729DSDesigner3: TFloatField;
    strngfldADS729DSDesigner4: TStringField;
    fltfldADS729DSDesigner5: TFloatField;
    strngfldADS729DSDesigner6: TStringField;
    fltfldADS729WIP: TFloatField;
    strngfldADS729DSDesigner7: TStringField;
    strngfldADS729DSDesigner8: TStringField;
    strngfldADS729DSDesigner9: TStringField;
    strngfldADS729DSDesigner10: TStringField;
    strngfldADS729DSDesigner11: TStringField;
    dtmfldADS729DSDesigner12: TDateTimeField;
    plbl2: TppLabel;
    ppLine28: TppLine;
    plbl3: TppLabel;
    pln13: TppLine;
    ppLine29: TppLine;
    ppLabel20: TppLabel;
    ppShape1: TppShape;
    ppShape3: TppShape;
    ppSummaryBand1: TppSummaryBand;
    procedure prprt1BeforePrint(Sender: TObject);
    procedure ppDBPipeline1DataChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRep: TFrmRep;

implementation

{$R *.dfm}

procedure TFrmRep.prprt1BeforePrint(Sender: TObject);
var
  str: string;
  i: Integer;
begin
  {for i := 0 to dsADS729.RecordCount - 1 do
  begin
    str := Copy(dsADS729.FieldValues['月产量达成率'], 0, (Length(dsADS729.FieldValues['月产量达成率'])-1));
    if StrToFloat(str) < 50.00 then
    begin
      ppDBText5.Font.Color := clRed;
    end;
    dsADS729.Next;
  end;}
end;

procedure TFrmRep.ppDBPipeline1DataChange(Sender: TObject);
var
  str: string;
  j: Integer;
begin
    ppShape1.SendToBack;
    ppShape1.Visible:= False;
   if Pos('%',ppDBText5.Text) <> 0 then
   begin
        str := Copy(ppDBText5.Text, 0, (Length(ppDBText5.Text)-1));
        if StrToFloat(str) < 50.00 then
        begin
           ppShape1.BringToFront;
           ppShape1.Visible:= True;
        end;
   end;
    ppShape3.SendToBack;
    ppShape3.Visible:= False;
   if Pos('%',ppDBText11.Text) <> 0 then
   begin
        str := Copy(ppDBText11.Text, 0, (Length(ppDBText11.Text)-1));
        if StrToFloat(str) < 50.00 then
        begin
           ppShape3.BringToFront;
           ppShape3.Visible:= True;
        end;
   end;
end;

end.
