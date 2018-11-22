unit DM_u;

interface           
                  
uses
  SysUtils, Classes, DB, ADODB,PubFunc,Variants, Provider, DBClient,
  MConnect, SConnect, TConnect,Forms,controls,StrUtils,DateUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    Tmp1: TADOQuery;
    DS525: TDataSource;
    ADO525: TADODataSet;
    ADO525RKEY: TAutoIncField;
    ADO525FASSET_CODE: TStringField;
    ADO525FASSET_NAME: TStringField;
    ADO525FASSET_DESC: TStringField;
    ADO525FASSET_TYPE: TStringField;
    ADO525ORIGINAL_VALUE: TFloatField;
    ADO525SUMMED_DEPRE: TFloatField;
    ADO525LOCATION: TStringField;
    ADO525id_code: TStringField;
    ADO517: TADODataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    ADO525dimi_date: TDateTimeField;
    ADO525reson: TStringField;
    ADO525fasset_alt_type: TStringField;
    ADO525voucher_ptr: TIntegerField;
    ADO525act_ptr: TSmallintField;
    ADO517RKEY: TAutoIncField;
    Data0103: TADODataSet;
    Data0103RKEY: TAutoIncField;
    Data0103CURR_TP: TWordField;
    Data0103CURR_PTR: TIntegerField;
    Data0103GL_ACC_NUMBER: TStringField;
    Data0103description_2: TStringField;
    Data0103DB_CR: TStringField;
    Data0103curtp: TStringField;
    ADO525employee_Name: TStringField;
    ADO525MONTH_DEPRE_AMT: TBCDField;
    ADO525BOOK_DATE: TDateTimeField;
  private

  public
    procedure getCuur(sInVal:string;Tp:integer;var sV1,sV2:string);
  end;

var
  DM: TDM;
  sysDate:Tdatetime;
  FY,FM:string;
  FLoginName:string;
  sRkeyCuur,sCuur_code:string;
implementation

{$R *.dfm}



{ TDM }

procedure TDM.getCuur(sInVal:string;Tp:integer;var sV1,sV2:string);
begin
  DM.Tmp1.Close;
  if Tp=0 then
  begin
    DM.Tmp1.SQL.Text:='select * from data0001 where rkey='+sInVal;
    DM.Tmp1.Open;
    sV1:=DM.Tmp1.Fieldbyname('curr_code').AsString;
    sV2:=formatfloat('0.0000',1/DM.Tmp1.Fieldbyname('EXCH_RATE').Value);
  end else if Tp=1 then begin
    DM.Tmp1.SQL.Text:='select * from data0001 where curr_code='''+sInVal+'''';
    DM.Tmp1.Open;
    sV1:=DM.Tmp1.Fieldbyname('rkey').AsString;
    sV2:=DM.Tmp1.Fieldbyname('EXCH_RATE').AsString;
  end;
  DM.Tmp1.Close;
end;

end.
