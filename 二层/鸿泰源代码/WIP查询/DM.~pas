unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdmcon = class(TDataModule)
    ADOConnection1: TADOConnection;
    asp_WIP_List: TADOStoredProc;
    aqDept_List: TADOQuery;
    ds_WIP_List: TDataSource;
    adsDept_Sum: TADODataSet;
    dsDept_Sum: TDataSource;
    ads60: TADODataSet;
    DataSource1: TDataSource;
    ads60SALES_ORDER: TStringField;
    ads60MANU_PART_NUMBER: TStringField;
    ads60MANU_PART_DESC: TStringField;
    ads60PO_NUMBER: TStringField;
    ads60CUST_CODE: TStringField;
    ads60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ads60SCH_DATE: TDateTimeField;
    ads60PARTS_ORDERED: TFloatField;
    ads60PARTS_SHIPPED: TFloatField;
    ads60PARTS_RETURNED: TFloatField;
    ads60RETURNED_SHIP: TIntegerField;
    ads60qianhuo_qty: TFloatField;
    ads60TO_BE_PLANNED: TIntegerField;
    ads60so_oldnew: TStringField;
    ads60DSDesigner: TStringField;
    ads60DSDesigner2: TStringField;
    ads60DSDesigner3: TStringField;
    tmp: TADOQuery;
    ads60QTY_ON_HAND: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     sql_text :string;
  end;

var
  dmcon: Tdmcon;

implementation

{$R *.dfm}

procedure Tdmcon.DataModuleCreate(Sender: TObject);
begin
 sql_text := dmcon.ads60.CommandText;
end;

end.
