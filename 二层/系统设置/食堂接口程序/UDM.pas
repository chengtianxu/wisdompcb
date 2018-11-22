unit UDM;

interface

uses
  SysUtils, Classes, ADODB, DB,raFunc,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOADD1: TADOQuery;
    ADOREDU1: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADORCD1: TADOQuery;
    DataSource3: TDataSource;
    ADOTMP: TADOQuery;
    ADOADD1employeecode: TWideStringField;
    ADOADD1cardno_dec: TWideStringField;
    ADOADD1employeename: TWideStringField;
    ADOADD1factorytype1: TStringField;
    ADOADD1factorytype: TWideStringField;
    ADOREDU1employeecode: TWideStringField;
    ADOREDU1cardno_dec: TWideStringField;
    ADOREDU1employeename: TWideStringField;
    ADOREDU1factorytype1: TStringField;
    ADOREDU1factorytype: TWideStringField;
    ADORCD1id: TAutoIncField;
    ADORCD1empno: TWideStringField;
    ADORCD1employeecard: TWideStringField;
    ADORCD1card_time: TDateTimeField;
    ADORCD1date_e: TWideStringField;
    ADORCD1time_e: TWideStringField;
    ADORCD1dev_id: TWideStringField;
    ADORCD1dev_mark: TWideStringField;
    ADORCD1empid: TWideStringField;
    ADORCD1remark1: TIntegerField;
    ADORCD1remark2: TWideStringField;
    ADORCD1remark3: TWideStringField;
    ADORCD1factorytype: TWideStringField;
    ADORCD1factorytype1: TStringField;
    ADOGETDATA: TADOQuery;
    ADODataSet_cx: TADODataSet;
    DataSource_cx: TDataSource;
    ADOQ_updateccview: TADOQuery;
    ADODataSet_deplist: TADODataSet;
    ADOupdate_cx: TADOQuery;
    ADODataSet_emplist: TADODataSet;
    DataSource_emplist: TDataSource;
    ADODataSet_emptrip: TADODataSet;
    DataSource_emptrip: TDataSource;
    ADODataSet_checkempcard: TADODataSet;
    procedure ADODataSet_emplistAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DM: TDM;
  flag_xuanren: Boolean;  
implementation
{$R *.dfm}

procedure TDM.ADODataSet_emplistAfterScroll(DataSet: TDataSet);
begin
flag_xuanren:=false;
end;

end.
