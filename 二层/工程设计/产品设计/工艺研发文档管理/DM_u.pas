unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADO306: TADOQuery;
    ADO307: TADOQuery;
    ADO308: TADOQuery;
    tmp: TADOQuery;
    ADO306type_name: TWideStringField;
    ADO307PrgID: TWideStringField;
    ADO307PrgName: TWideStringField;
    ADO307type_ptr: TIntegerField;
    ADO307Responsor: TWideStringField;
    ADO307partMan: TWideStringField;
    ADO307StartDate: TDateTimeField;
    ADO307EndDate: TDateTimeField;
    ADO307status: TBooleanField;
    ADO307overMan: TIntegerField;
    ADO307overDate: TDateTimeField;
    ADO308source_ptr: TIntegerField;
    ADO308doc_name: TWideStringField;
    ADO308doc_ver: TSmallintField;
    ADO308saveDate: TDateTimeField;
    ADO308saveMan: TIntegerField;
    ADO308createMan: TWideStringField;
    ADO308status: TBooleanField;
    ADO306rkey: TAutoIncField;
    ADO307rkey: TAutoIncField;
    ADO308rkey: TAutoIncField;
    ADO308employee_name: TStringField;
    ADO307employee_name: TStringField;
    ADO307type_name: TStringField;
    ADOImg: TADOQuery;
    ADO307PrgScript: TMemoField;
    ADO307PrgFunc: TMemoField;
    ADO308DocScript: TMemoField;
    ADO307PrgRemark: TMemoField;
    procedure ADO307AfterScroll(DataSet: TDataSet);
    procedure ADO308CalcFields(DataSet: TDataSet);
    procedure ADO307CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
const
  TmpFileDir = 'c:\tmp\';
var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO307AfterScroll(DataSet: TDataSet);
begin
  ADO308.Close;
  ADO308.Parameters[0].Value:=ADO307rkey.Value;
  ADO308.Open;
end;

procedure TDM.ADO308CalcFields(DataSet: TDataSet);
begin
  if ADO308saveMan.AsString<>''  then
  begin
    tmp.Close;
    tmp.SQL.Text:='select employee_name from data0005 where rkey='+ADO308saveMan.AsString;
    tmp.Open;
    ADO308employee_name.Value:=tmp.fields[0].asstring;
  end;
end;

procedure TDM.ADO307CalcFields(DataSet: TDataSet);
begin
  if ADO307overMan.AsString<>''  then
  begin
    tmp.Close;
    tmp.SQL.Text:='select employee_name from data0005 where rkey='+ADO307overMan.AsString;
    tmp.Open;
    ADO307employee_name.Value:=tmp.fields[0].asstring;
  end;
  if ADO307type_ptr.AsString<>''  then
  begin
    tmp.Close;
    tmp.SQL.Text:='select type_name from FD306 where rkey='+ADO307type_ptr.AsString;
    tmp.Open;
    ADO307type_name.Value:=tmp.fields[0].asstring;
  end;
end;

end.
