unit DMUnit1;

//Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security Info=True;User ID=wzsp;Initial Catalog=WISDOMPCB;Data Source=172.16.1.57;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W119;Use Encryption for Data=False;Tag with column collation when possible=False

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    wzcx96_1: TADOStoredProc;
    DataSource1: TDataSource;
    wzcx96_1INV_PART_NUMBER: TStringField;
    wzcx96_1INV_PART_DESCRIPTION: TStringField;
    wzcx96_1EMPLOYEE_NAME: TStringField;
    wzcx96_1REJECT_DESCRIPTION: TStringField;
    wzcx96_1TDATE: TDateTimeField;
    wzcx96_1QUAN_REJD: TFloatField;
    wzcx96_1ttype: TStringField;
    wzcx96_1PRICE: TBCDField;
    wzcx96_1FLAG: TIntegerField;
    wzcx96_1abbr_name: TStringField;
    wzcx96_1exch_rate: TBCDField;
    wzcx96_1curr_name: TStringField;
    wzcx96_1GRN_NUMBER: TStringField;
    wzcx96_1CREATE_DATE: TDateTimeField;
    wzcx96_1PO_NUMBER: TStringField;
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
