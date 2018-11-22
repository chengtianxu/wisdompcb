unit damo;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADS840: TADODataSet;
    ADS855: TADODataSet;
    tmp: TADOQuery;
    DataSource2: TDataSource;
    ADS840rkey: TIntegerField;
    ADS840location: TStringField;
    ADS840vOutdPrep: TStringField;
    ADS840D015_ptr: TIntegerField;
    ADS840vactive: TStringField;
    ADS840ABBR_NAME: TStringField;
    ADS855Rkey: TIntegerField;
    ADS855D840_ptr: TIntegerField;
    ADS855type: TStringField;
    ADS855EntrDate: TDateTimeField;
    ADS855DepaDate: TDateTimeField;
    ADS855EMPL_CODE: TStringField;
    ADS855EMPLOYEE_NAME: TStringField;
    ADS855D005_ptr: TIntegerField;
    procedure ADS840AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.ADS840AfterScroll(DataSet: TDataSet);
var
  num:Integer;
begin
  num :=0;
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS840.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS840.RecordCount);
  DM.ADS855.Open;
  DM.ADS855.First;
  while not DM.ADS855.Eof do
  begin
    if DM.ADS855.FieldByName('DepaDate').IsNull then
    num := num+1;
    DM.ADS855.Next;
  end;
  frm_Main.StatusBar1.Panels[2].Text := '在职雇员人数：'+inttostr(num);
end;

end.
