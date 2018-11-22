unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,windows;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS219: TADODataSet;
    DataSource1: TDataSource;
    ADS219RKEY: TIntegerField;
    ADS219GRN_NUMBER: TStringField;
    ADS219CREATE_DATE: TDateTimeField;
    ADS219SYSTEM_DATE: TDateTimeField;
    ADS219TTYPE: TWordField;
    ADS219location_fromptr: TIntegerField;
    ADS219location_endptr: TIntegerField;
    ADS219CREATE_BY: TIntegerField;
    ADS219handle_name: TStringField;
    ADS219REMARK: TStringField;
    ADS219EMPLOYEE_NAME: TStringField;
    ADS219type: TStringField;
    DataSource2: TDataSource;
    ADS220: TADODataSet;
    ADS220INV_PART_NUMBER: TStringField;
    ADS220INV_NAME: TStringField;
    ADS220INV_DESCRIPTION: TStringField;
    ADS220LOCATION_NAME: TStringField;
    ADS220ABBR_NAME: TStringField;
    ADS220QUANTITY: TIntegerField;
    ADS220OH_degree: TWordField;
    ADS220REMARK: TStringField;
    ADOQuery1: TADOQuery;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    aq160: TADOQuery;
    aq160rkey: TIntegerField;
    aq160LOCATION: TStringField;
    ADOQuery2: TADOQuery;
    ADS220INVENTORY_PTR: TIntegerField;
    ADS220LOCATION_PTR: TIntegerField;
    ADS220SUPPLIER_PTR: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
   function find_qtyerror(rkey219:integer):boolean;
   function Get0073(Rkey:Integer):string;
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

{ Tdm }

function Tdm.find_qtyerror(rkey219:integer): boolean;
begin
with self.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey from data0220 '+
            'where QUANTITY<>quan_on_hand-quan_alloc and '+
            'grn_ptr='+inttostr(rkey219);
  open;
  if not IsEmpty then
   result:=true
  else
   result:=false; 
 end;
end;

function Tdm.Get0073(Rkey: Integer): string;
var tmpAdo:TADOQuery;
    sRkey:string;
begin
  try
    tmpAdo:=TADOQuery.Create(Self);
    tmpAdo.Connection:=ADOConnection1;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0073 where Rkey=:Rkey');
    tmpAdo.Parameters.ParamByName('Rkey').Value:=Rkey;
    tmpAdo.Open;
    if not tmpAdo.Eof then
    begin
      if (tmpAdo.FieldByName('EMPLOYEE_PTR').Value='') then sRkey:=''
      else sRkey:=IntToStr(tmpAdo.FieldByName('EMPLOYEE_PTR').AsInteger);
    end;
    if ((sRkey<>'')) then
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0005 where Rkey=:Rkey');
      tmpAdo.Parameters.ParamByName('Rkey').Value:=StrToInt(sRkey);
      tmpAdo.Open;
      if not tmpAdo.Eof then
      begin
        Result:=tmpAdo.FieldByName('EMPLOYEE_NAME').AsString;
      end else
        Result:='';
    end else
    begin
      windows.messagebox(0,'操作提示','基本信息错误',MB_ICONSTOP);
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;

end;

end.
