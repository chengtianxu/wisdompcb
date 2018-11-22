unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO686: TADOQuery;
    ADO686_1: TADOQuery;
    ADO687: TADOQuery;
    ADO687_1: TADOQuery;
    ADOQuery5: TADOQuery;
    ADOQuery6: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADO686Rkey: TAutoIncField;
    ADO686Record_No: TStringField;
    ADO686Cust_Ptr: TIntegerField;
    ADO686Dep_Ptr: TIntegerField;
    ADO686Rec_date: TDateTimeField;
    ADO686Machine_No: TIntegerField;
    ADO686Runs: TBooleanField;
    ADO686Emp_In_Ptr: TIntegerField;
    ADO686In_Time: TDateTimeField;
    ADO686Out_Time: TDateTimeField;
    ADO686Type: TStringField;
    ADO686outer_inside: TBooleanField;
    ADO686Comp_Quantity: TIntegerField;
    ADO686Layers: TStringField;
    ADO686Tot_PNL: TIntegerField;
    ADO686Tot_PAS: TIntegerField;
    ADO686PNL: TIntegerField;
    ADO686Tot_PCS: TIntegerField;
    ADO686PCS_Pas: TIntegerField;
    ADO686Tot_Quantity: TIntegerField;
    ADO686Result: TStringField;
    ADO686Remark: TStringField;
    ADO687Rkey: TAutoIncField;
    ADO687rec_ptr: TIntegerField;
    ADO687Problem_ptr: TIntegerField;
    ADO687LOT_No: TStringField;
    ADO687quantity: TIntegerField;
    ADO687Remark: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
