unit DMUnit1;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODataSet2: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet3: TADODataSet;
    ADODataSet3WORK_ORDER_NUMBER: TStringField;
    ADODataSet3INTIME: TDateTimeField;
    ADODataSet3OUTTIME: TDateTimeField;
    ADODataSet3hours: TIntegerField;
    ADODataSet3QTY_PROD: TIntegerField;
    ADODataSet3frDEPT_CODE: TStringField;
    ADODataSet3frDEPT_NAME: TStringField;
    ADODataSet3toDEPT_CODE: TStringField;
    ADODataSet3toDEPT_NAME: TStringField;
    ADODataSet2hours: TIntegerField;
    ADODataSet2QTY_PROD: TIntegerField;
    ADODataSet2frDEPT_CODE: TStringField;
    ADODataSet2frDEPT_NAME: TStringField;
    ADODataSet2toDEPT_CODE: TStringField;
    ADODataSet2toDEPT_NAME: TStringField;
    aqtmp: TADOQuery;
    ADODataSet1: TADODataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADODataSet1rkey: TIntegerField;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1ENT_DATE: TDateTimeField;
    ADODataSet1SCH_DATE: TDateTimeField;
    ADODataSet1CUST_CODE: TStringField;
    ADODataSet1ENAME60: TStringField;
    ADODataSet1ENAME492: TStringField;
    ADODataSet1PARTS_ORDERED: TFloatField;
    ADODataSet1set_ordered: TIntegerField;
    ADODataSet1FOB: TStringField;
    ADODataSet1CUT_NO: TStringField;
    ADODataSet1ISSUE_DATE: TDateTimeField;
    ADODataSet1ISSUED_QTY: TIntegerField;
    ADODataSet1SALES_ORDER: TStringField;
    procedure ADODataSet1AfterScroll(DataSet: TDataSet);
    procedure ADODataSet1AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}


procedure TDM.ADODataSet1AfterScroll(DataSet: TDataSet);
begin
  ADODataSet2.Close;
  ADODataSet2.Parameters.ParamValues['cut_no'] := ADODataSet1CUT_NO.Value ;
  ADODataSet2.Open;
  ADODataSet3.Close;
  ADODataSet3.Parameters.ParamValues['cut_no'] := ADODataSet1CUT_NO.Value ;
  ADODataSet3.Open;
end;

procedure TDM.ADODataSet1AfterOpen(DataSet: TDataSet);
begin
  if adodataset1.IsEmpty then
  begin
    adodataset2.Close;
    adodataset3.Close;
  end;
end;

end.
