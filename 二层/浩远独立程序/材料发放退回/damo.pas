unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    ado457: TADOQuery;
    ado457GON_NUMBER: TStringField;
    ado457warehouse_ptr: TIntegerField;
    ado457dept_ptr: TIntegerField;
    ado457TTYPE: TSmallintField;
    ado457CREATE_DATE: TDateTimeField;
    ado457CREATE_BY: TIntegerField;
    ado457RECD_BY: TIntegerField;
    ado457REF_NUMBER: TStringField;
    ADOQuery1: TADOQuery;
    ado457rkey: TAutoIncField;
    ado207: TADOQuery;
    ado207INVENTORY_PTR: TIntegerField;
    ado207GON_PTR: TIntegerField;
    ado207D0022_PTR: TIntegerField;
    ado207QUANTITY: TBCDField;
    ado207DEPT_PTR: TIntegerField;
    ado207TDATE: TDateTimeField;
    ado207TTYPE: TSmallintField;
    ado207STANDARD_COST: TBCDField;
    ado208: TADOQuery;
    ado208SOURCE_PTR: TIntegerField;
    ado208DEPT_PTR: TIntegerField;
    ado208GON_PTR: TIntegerField;
    ado208TDATE: TDateTimeField;
    ado208QUANTITY: TBCDField;
    ado95: TADOQuery;
    ado95TRAN_TP: TSmallintField;
    ado95INVT_PTR: TIntegerField;
    ado95SRCE_PTR: TIntegerField;
    ado95TRAN_BY: TIntegerField;
    ado95TRAN_DATE: TDateTimeField;
    ado95QUANTITY: TFloatField;
    ads468: TADODataSet;
    DataSource1: TDataSource;
    ads468cut_no: TStringField;
    ads468invent_ptr: TIntegerField;
    ads468STATUS: TSmallintField;
    ads468type: TStringField;
    ads468INV_PART_NUMBER: TStringField;
    ads468INV_NAME: TStringField;
    ads468INV_DESCRIPTION: TStringField;
    ads468QUAN_BOM: TFloatField;
    ads468QUAN_ISSUED: TFloatField;
    ads468RKEY: TAutoIncField;
    ads468STOCK_UNIT_PTR: TIntegerField;
    ads468UNIT_NAME: TStringField;
    ads468quan_on_hand: TFloatField;
    DataSource2: TDataSource;
    aq22: TADODataSet;
    aq22INV_PART_NUMBER: TStringField;
    aq22INV_NAME: TStringField;
    aq22INV_DESCRIPTION: TStringField;
    aq22LOCATION: TStringField;
    aq22UNIT_NAME: TStringField;
    aq22QUAN_ON_HAND: TBCDField;
    aq22EXPIRE_DATE: TDateTimeField;
    aq22rohs: TStringField;
    aq22ABBR_NAME: TStringField;
    aq22SUPPLIER2: TStringField;
    aq22STD_COST: TFloatField;
    aq22INVENTORY_PTR: TIntegerField;
    aq22RKEY: TAutoIncField;
    aq22barcode_id: TStringField;
    ads468UNIT_CODE: TStringField;
    aq22unit_code: TStringField;
    ado207d0468_ptr: TIntegerField;
    ado457Cut_NO: TStringField;
    ads468_268: TADODataSet;
    DataSource3: TDataSource;
    ads468_268number: TStringField;
    ads468_268INVENT_PTR: TIntegerField;
    ads468_268RKEY: TAutoIncField;
    ads468_268STATUS: TSmallintField;
    ads468_268STOCK_UNIT_PTR: TIntegerField;
    ads468_268INV_PART_NUMBER: TStringField;
    ads468_268INV_NAME: TStringField;
    ads468_268INV_DESCRIPTION: TStringField;
    ads468_268QUAN_BOM: TFloatField;
    ads468_268QUAN_ISSUED: TFloatField;
    ads468_268UNIT_NAME: TStringField;
    ads468_268quan_on_hand: TBCDField;
    ads468_268UNIT_CODE: TStringField;
    ads468_268type: TStringField;
    aq22warehouse_ptr: TIntegerField;
    ads468_268quan_alloc: TBCDField;
    aq22QUAN_TO_BE_STOCKED: TBCDField;
    aq22quan_hand: TFloatField;
    ads468_268alloc: TBCDField;
    ads468_268sotck_type: TStringField;
    ADOQuery2: TADOQuery;
    ads468quan_alloc: TBCDField;
    ads468alloc: TBCDField;
    ads468sotck_type: TStringField;
    ads468ISSUE_DATE: TDateTimeField;
    TempDataSet: TADODataSet;
    procedure ads468CalcFields(DataSet: TDataSet);
    procedure ads468_268CalcFields(DataSet: TDataSet);
    procedure aq22CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
   function find_phycount(var count_no:string):boolean;
   procedure send_message(rkey457:integer);
   function get_vmiqty(rkey17:Integer):Single;
  end;

var
  DM: TDM;

implementation
 uses common;
{$R *.dfm}

procedure TDM.ads468CalcFields(DataSet: TDataSet);
begin
  if self.ads468STATUS.Value=0 then
   self.ads468type.Value:='有效'
  else
   self.ads468type.Value:='关闭';
end;

function TDM.find_phycount(var count_no:string): boolean;
begin
  with ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT top 1 dbo.Data0092.PHY_COUNT_NO, dbo.Data0092.TDATE,'+#13+
        'dbo.Data0005.EMPLOYEE_NAME'+#13+
        'FROM dbo.Data0005 INNER JOIN'+#13+
        'dbo.Data0092 ON dbo.Data0005.RKEY = dbo.Data0092.EMPLOYEE_PTR'+#13+
        'WHERE (dbo.Data0092.STATUS = ''0'')';
    open;
    if isempty then
     result:=false
    else
     begin
      count_no:=fieldbyname('PHY_COUNT_NO').AsString+
                fieldbyname('EMPLOYEE_NAME').AsString;
      close;          
      result:=true;
     end;
   end;
end;

function TDM.get_vmiqty(rkey17: Integer): Single;
begin
 result:=0;
 with ADOQuery2 do
  begin
    close;
    SQL.Text:=
      'SELECT SUM(DATA0134.QUAN_ON_HAND) AS vmi_qty '+
      'FROM DATA0134 '+
       'where DATA0134.INVENTORY_PTR='+inttostr(rkey17);
    open;
    if FieldByName('vmi_qty').AsCurrency > 0 then
     Result:= FieldByName('vmi_qty').AsCurrency;
  end;
end;

procedure TDM.send_message(rkey457:integer);
var
 send_msg:tstringlist;
 rkey14:integer;
begin
  send_msg:=tstringlist.Create;
  send_msg.Text:='';

  with ADOQuery1 do
   begin
    close;
    sql.Text:=
      'SELECT data0017.rkey,Data0017.QUAN_ON_HAND, Data0017.CONSIGN_ONHAND_QTY, '+
             'Data0017.INV_PART_NUMBER,data0017.INV_NAME '+
      'FROM dbo.Data0207 INNER JOIN '+
             'dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.RKEY '+
      'WHERE (dbo.Data0207.GON_PTR ='+inttostr(rkey457)+') and '+
            '(dbo.Data0017.CONSIGN_ONHAND_QTY > 0) and '+  //安全库存大于零
            '(dbo.Data0017.QUAN_ON_HAND < dbo.Data0017.CONSIGN_ONHAND_QTY) '+
      'GROUP BY data0017.rkey,Data0017.QUAN_ON_HAND, Data0017.CONSIGN_ONHAND_QTY, '+
      'Data0017.INV_PART_NUMBER,data0017.INV_NAME';
    open;
     while not eof do
     begin
      if  fieldbyname('CONSIGN_ONHAND_QTY').AsCurrency - fieldbyname('QUAN_ON_HAND').AsCurrency
       > get_vmiqty(fieldbyname('rkey').AsInteger) then
      send_msg.add(fieldbyname('INV_PART_NUMBER').AsString+'名称:'+
                   fieldbyname('INV_NAME').AsString +'差额:'+
                   currtostr( fieldbyname('CONSIGN_ONHAND_QTY').AsCurrency -
                              fieldbyname('QUAN_ON_HAND').AsCurrency-
                              get_vmiqty(fieldbyname('rkey').AsInteger)));
      next;
     end;
   end;

 if send_msg.Text<>'' then
 begin
  send_msg.Insert(0,'以下材料编码低于安全库存,请及时请购,日期:'+datetimetostr(common.getsystem_date(ADOQuery2,0)));
  with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0014 where rkey is null');
   open;
   append;
   fieldvalues['MESSAGE'] := send_msg.Text;
   fieldvalues['whosend']:= strtoint(rkey73);
   post;
   rkey14:=fieldvalues['rkey'];
  end;

  with adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Text:='insert into data0314 (emp_ptr,d14_ptr) '+
    'SELECT dbo.Data0073.RKEY,'+inttostr(rkey14)+' as d14_ptr '+
    'FROM dbo.DATA0021 INNER JOIN '+
    'dbo.Data0073 ON dbo.DATA0021.USER_LOGIN_NAME = dbo.Data0073.USER_LOGIN_NAME';
    ExecSQL;
   end;
 end;
 send_msg.Free;
end;

procedure TDM.ads468_268CalcFields(DataSet: TDataSet);
begin
if self.ads468_268STATUS.Value=0 then
 self.ads468_268type.Value:='有效'
else
 self.ads468_268type.Value:='关闭';
end;

procedure TDM.aq22CalcFields(DataSet: TDataSet);
begin
self.aq22quan_hand.Value:=self.aq22QUAN_ON_HAND.Value-
self.aq22QUAN_TO_BE_STOCKED.Value;
end;



end.
