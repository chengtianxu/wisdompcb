unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADOsalaryaccount: TADOQuery;
    DS: TDataSource;
    tmp1: TADOQuery;
    ADOsalaryaccountrkey: TAutoIncField;
    ADOsalaryaccountAccountname: TWideStringField;
    ADOsalaryaccountcreatedate: TDateTimeField;
    ADOsalaryaccountcreateman: TIntegerField;
    ADOsalaryaccountdiscription: TWideStringField;
    ADOsalaryaccountremark: TWideStringField;
    ADODesignSalaryItem: TADOQuery;
    DS2: TDataSource;
    ADODesignSalaryItemrkey: TAutoIncField;
    ADODesignSalaryItemitemname: TWideStringField;
    ADODesignSalaryItemtype: TWideStringField;
    ADODesignSalaryItemdatafield: TWideStringField;
    ADODesignSalaryItemdatasourcetype: TWordField;
    ADODesignSalaryItemdatasource: TIntegerField;
    ADODesignSalaryItemfieldsource: TWideStringField;
    ADODesignSalaryItemfixedmoney: TBCDField;
    ADODesignSalaryItemExpression1: TWideStringField;
    ADODesignSalaryItemExpression2: TWideStringField;
    ADODesignSalaryItemIsDisplay: TSmallintField;
    ADODesignSalaryItemIsAvail: TSmallintField;
    ADODesignSalaryItemTag: TIntegerField;
    ADODesignSalaryItemAccountid: TIntegerField;
    ADODesignSalaryItemItemIndex: TIntegerField;
    ADODesignSalaryItemRefreshFlag: TIntegerField;
    ADODesignSalaryItemdatasourcetype_s: TStringField;
  private
    { Private declarations }
  public 
    F_Accountid:  integer;
  end;

var
  DM: TDM;
    Frkeymsg,Frkeymsg2:integer;

implementation

{$R *.dfm}

end.
