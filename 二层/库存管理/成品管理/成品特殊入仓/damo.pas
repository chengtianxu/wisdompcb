unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ416: TADOQuery;
    DataSource1: TDataSource;
    AQ416number: TStringField;
    AQ416RMA_NUMBER: TStringField;
    AQ416SALES_ORDER: TStringField;
    AQ416EMPLOYEE_NAME: TStringField;
    AQ416sys_date: TDateTimeField;
    AQ416quantity: TIntegerField;
    AQ416type: TWordField;
    AQ416rkey: TAutoIncField;
    AQ416C_type: TStringField;
    ADOQuery1: TADOQuery;
    ADOT15: TADOTable;
    ADOT16: TADOTable;
    ADO416: TADOQuery;
    ADO416rkey: TAutoIncField;
    ADO416number: TStringField;
    ADO416type: TWordField;
    ADO416empl_ptr: TIntegerField;
    ADO416sys_date: TDateTimeField;
    ADO416quantity: TIntegerField;
    ADO416reference: TStringField;
    ADO416rma_ptr: TIntegerField;
    ADO416so_ptr: TIntegerField;
    aq50: TADOQuery;
    AQ416rma_ptr: TIntegerField;
    AQ416so_ptr: TIntegerField;
    AQ416qty_auth: TIntegerField;
    AQ416qty_recd: TIntegerField;
    AQ416qty_ship: TIntegerField;
    AQ416status: TWordField;
    AQ416DSDesigner: TStringField;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    qrytmp: TADOQuery;
    AQ416po_number: TStringField;
    AQ416ABBR_NAME: TStringField;
    AQ416MANU_PART_NUMBER: TStringField;
    AQ416MANU_PART_DESC: TStringField;
    AQ416REPUT_APPR_BY: TIntegerField;
    AQ416parts_order: TFloatField;
    procedure AQ416CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function find_qtyerror(rkey416:integer):boolean;
 //   function verify_qtyerror(rkey416:integer):boolean;
 //   function unverify_qtyerror(rkey416:integer):boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AQ416CalcFields(DataSet: TDataSet);
begin
 case self.AQ416type.Value of
  1:self.AQ416C_type.Value:='直接入仓';
  2:self.AQ416C_type.Value:='过数入仓';
  3:self.AQ416C_type.Value:='委外入仓';
  4:self.AQ416C_type.Value:='退货入仓';
  5:self.AQ416C_type.Value:='转换入仓';
  6:self.AQ416C_type.Value:='盘点入仓';
 end;
end;

function TDM.find_qtyerror(rkey416:integer): boolean;
begin
 result:=false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0053');
   sql.Add('where QUANTITY<>QTY_ON_HAND-QTY_ALLOC and');
   sql.Add('npad_ptr='+inttostr(rkey416));
   open;
  end;
 if not dm.ADOQuery1.IsEmpty then
  result:=true;
end;

end.




