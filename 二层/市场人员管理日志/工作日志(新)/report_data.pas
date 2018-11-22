unit report_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, StdCtrls, DBCtrls,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppProd,
  ppReport, ExtCtrls, Mask, Grids, DBGrids, ppVar, ppSubRpt, ppModule,
  raCodMod, ppEndUsr,raide, ppBarCod, myChkBox;

type
  TForm_report = class(TForm)
    DataSource1: TDataSource;
    ADS721: TADODataSet;
    ADS721RKEY: TIntegerField;
    ppDB721: TppDBPipeline;
    ads493: TADODataSet;
    ads493Company_Name: TStringField;
    ads493Company_Name2: TStringField;
    ads493Company_Name3: TStringField;
    ads493ship_address: TStringField;
    ads493Company_Icon: TBlobField;
    ads493SITE_INFO_ADD_1: TStringField;
    ads493SITE_INFO_ADD_2: TStringField;
    ads493SITE_INFO_ADD_3: TStringField;
    ads493SITE_INFO_PHONE: TStringField;
    DataSource5: TDataSource;
    ppDB493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ADS721LogNo: TStringField;
    ADS721CustName: TStringField;
    ADS721VistPlace: TStringField;
    ADS721VistDate: TDateTimeField;
    ADS721visitors: TStringField;
    ADS721visitedMan: TStringField;
    ADS721Influence: TStringField;
    ADS721aims: TStringField;
    ADS721subjects: TStringField;
    ADS721feedback: TStringField;
    ADS721others: TStringField;
    ADS721NextVistDate: TDateTimeField;
    ADS721nextSub: TStringField;
    ADS721actions: TStringField;
    ADS721isUpdate: TBooleanField;
    ADS721status: TIntegerField;
    ADS721salesID: TIntegerField;
    ADS721AuditID: TIntegerField;
    ADS721AuditRemark: TStringField;
    ADS721AuditDate: TDateTimeField;
    ADS721ent_Date: TDateTimeField;
    ADS721status_c: TStringField;
    ADS721USER_FULL_NAME: TStringField;
    ADS721USER_LOGIN_NAME: TStringField;
    ADS721USER_FULL_NAME_A: TStringField;
    ADS721USER_LOGIN_NAME_A: TStringField;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLabel9: TppLabel;
    ppDBText12: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText11: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
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
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine3: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppDBMemo5: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppDBMemo7: TppDBMemo;
    ppDBMemo8: TppDBMemo;
    ppDBText2: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText3: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
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
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLine25: TppLine;
    ppLabel23: TppLabel;
    ppLabel48: TppLabel;
    ppLine26: TppLine;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    myCheckBox3: TmyCheckBox;
    ppLabel56: TppLabel;
    myCheckBox4: TmyCheckBox;
    ppLabel57: TppLabel;
    myCheckBox5: TmyCheckBox;
    ppLabel58: TppLabel;
    myCheckBox6: TmyCheckBox;
    ppLabel59: TppLabel;
    myCheckBox7: TmyCheckBox;
    ppLabel60: TppLabel;
    myCheckBox8: TmyCheckBox;
    ppLabel61: TppLabel;
    ppDBText4: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel4: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel24: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses DM_u;


{$R *.dfm}


procedure TForm_report.FormCreate(Sender: TObject);
var j:integer;
    procedure crtLab(s:string);
    var i:integer;
        str:string;
        Lb: TComponent;
    begin
      str:=s;
      if str<>'' then
      begin
        i:=pos('&',str);
        while i<>0 do
        begin
          Lb:=FindComponent('ppLabel'+inttostr(j));
          if Lb<>nil then TppLabel(Lb).Caption:=copy(str,1,i-1);
          str:=copy(str,i+1,length(str)-i);
          inc(j);
          i:=pos('&',str);
        end;
        TppLabel(FindComponent('ppLabel'+inttostr(j))).Caption:=str;
      end;
    end;
begin
  ADS493.Open;
  ADS721.Close;
  ADS721.Parameters[0].Value:=DM.ADO721rkey.Value;
  ADS721.Open;
//  j:=24;
//  crtLab(ADS721.fieldbyname('visitors').AsString);
//  j:=36;
//  crtLab(ADS721.fieldbyname('visitedMan').AsString);
end;

procedure TForm_report.ppReport1PrintingComplete(Sender: TObject);
begin
{ExecSql(dmcon.tmp,
'update data0006 set Trav_Printed_By_Ptr='+user_ptr+
' where rkey='+inttostr(self.ads06.Parameters[0].Value));
  }

end;

end.
