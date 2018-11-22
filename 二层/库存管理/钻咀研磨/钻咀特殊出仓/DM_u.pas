unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    DS1: TDataSource;
    DS2: TDataSource;
    ADO221: TADOQuery;
    ADO222: TADOQuery;
    ADO221rkey: TAutoIncField;
    ADO221number: TStringField;
    ADO221type: TWordField;
    ADO221status: TWordField;
    ADO221empl_ptr: TIntegerField;
    ADO221sys_date: TDateTimeField;
    ADO221quantity: TIntegerField;
    ADO221auth_empl_ptr: TIntegerField;
    ADO221auth_date: TDateTimeField;
    ADO221reference: TStringField;
    ADO221InMan: TStringField;
    ADO221auMan: TStringField;
    ADO221type_C: TStringField;
    ADO221status_C: TStringField;
    ADO222head_ptr: TIntegerField;
    ADO222bach_ptr: TIntegerField;
    ADO222quantity: TIntegerField;
    ADO222reference: TStringField;
    ADO222INVENTORY_PTR: TIntegerField;
    ADO222SUPPLIER_PTR: TIntegerField;
    ADO222LOCATION_PTR: TIntegerField;
    ADO222OH_degree: TWordField;
    ADO222QUAN_ALLOC: TIntegerField;
    ADO222REMARK: TStringField;
    ADO222LOCATION_CODE: TStringField;
    ADO222LOCATION_NAME: TStringField;
    ADO222TYPE: TWordField;
    ADO222INV_PART_NUMBER: TStringField;
    ADO222INV_PART_DESCRIPTION: TStringField;
    ADO221_1: TADOQuery;
    ADO222_1: TADOQuery;
    ADO160: TADOQuery;
    ADO160location_code: TStringField;
    ADO160location_name: TStringField;
    ADO160INV_PART_NUMBER: TStringField;
    ADO160inv_part_description: TStringField;
    ADO160Quan_valid: TIntegerField;
    ADO160oh_degree: TWordField;
    ADO160rkey17: TAutoIncField;
    ADO160rkey160: TAutoIncField;
    ADO160rkey220: TAutoIncField;
    ADO160type: TWordField;
    ADO160supplier_ptr: TIntegerField;
    ADO222quan_on_hand: TIntegerField;
    ADO160grn_number: TStringField;
    ADO160create_date: TDateTimeField;
    ADO160Type_c: TStringField;
    procedure ADO221AfterScroll(DataSet: TDataSet);
  private

  public
     function Get_Data0004(tp:integer;sNo:string='^'):string;
  end;

var
  DM: TDM;
  Frkey221:integer;

implementation

{$R *.dfm}

procedure TDM.ADO221AfterScroll(DataSet: TDataSet);
begin
  ADO222.Close;
  ADO222.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO222.Open;
end;

function TDM.Get_Data0004(tp: integer; sNo: string): string;
var sL,s:string;
    B:boolean;
    i:integer;
begin
  result := '';
  if tp=0 then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey =35';
    DM.Tmp.Open;
    result :=DM.Tmp.Fields[0].AsString;
  end else begin
    sL:='0';
    s:=sNo;
    for i:=length(s) downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;

    B:=true;
    while B do
    begin
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where rkey=35 and SEED_VALUE='''+sNo+'''';
      if DM.Tmp.ExecSQL=0 then
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey =35';
        DM.Tmp.Open;
        sNo:=DM.Tmp.Fields[0].AsString;
      end else
        B:=false;
    end;
    result :=sNo ;
  end;


end;

end.
