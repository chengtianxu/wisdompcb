unit data_module;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Aqwz303: TADOQuery;
    Aqwz303EMPL_CODE: TStringField;
    Aqwz303EMPLOYEE_NAME: TStringField;
    Aqwz303DELIVER_NUMBER: TStringField;
    Aqwz303SHIP_DATE: TDateTimeField;
    Aqwz303STATUS: TWordField;
    Aqwz303CODE: TStringField;
    Aqwz303SUPPLIER_NAME: TStringField;
    Aqwz303ABBR_NAME: TStringField;
    Aqwz303epiboly_number: TStringField;
    Aqwz303DEPT_CODE: TStringField;
    Aqwz303DEPT_NAME: TStringField;
    Aqwz303RKEY: TAutoIncField;
    Aqwz304: TADOQuery;
    Aqwz304QUANTITY: TIntegerField;
    Aqwz304STANDARD: TStringField;
    Aqwz304rece_quantity: TIntegerField;
    Aqwz304REMARK: TStringField;
    Aqwz303v_status: TStringField;
    Aqwz303SHIP_NAME: TStringField;
    Aqwz303REMARK: TStringField;
    Aqwz304UNIT_NAME: TStringField;
    ADOQuery2: TADOQuery;
    Aqwz303EPIBOLY_PTR: TIntegerField;
    Aqwz303ent_date: TDateTimeField;
    Aqwz303totoal_money: TBCDField;
    Aqwz303exch_rate: TBCDField;
    Aqwz303pay_method: TStringField;
    Aqwz303TAX_cate: TStringField;
    Aqwz303CURR_CODE: TStringField;
    Aqwz303CURR_NAME: TStringField;
    Aqwz303calculate_method: TStringField;
    Aqwz304price: TBCDField;
    Aqwz304pattern_money: TBCDField;
    Aqwz304MIN_MONEY: TBCDField;
    Aqwz304ENG_MONEY: TBCDField;
    Aqwz304TOTAL_MONEY: TBCDField;
    Aqwz304AREA_SQM: TBCDField;
    Aqwz304AREA_SQF: TBCDField;
    Aqwz304LAYER: TWordField;
    Aqwz304THINK: TBCDField;
    Aqwz304MIN_aperture: TBCDField;
    Aqwz304REQ_DATE: TDateTimeField;
    Aqwz303currency_ptr: TIntegerField;
    Aqwz304MANU_PART_NUMBER: TStringField;
    Aqwz304MANU_PART_DESC: TStringField;
    Aqwz303auth_userptr: TIntegerField;
    Aqwz303auth_datetime: TDateTimeField;
    Aqwz303auth_name: TStringField;
    procedure Aqwz303CalcFields(DataSet: TDataSet);
    procedure Aqwz303AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses main;

{$R *.dfm}

procedure Tdm.Aqwz303CalcFields(DataSet: TDataSet);
begin
 case aqwz303status.Value of
  1 : aqwz303v_status.Value := '未提交';
  2 : aqwz303v_status.Value := '待审核';
  3 : aqwz303v_status.Value := '已审核';
  4 : aqwz303v_status.Value := '已记帐';
  5 : aqwz303v_status.Value := '已付款';
  6 : aqwz303v_status.Value := '被退回';
 end;
end;

procedure Tdm.Aqwz303AfterScroll(DataSet: TDataSet);
begin
  with   DataSet do
  Form1.StatusBar1.Panels[0].Text:=
  '当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
end;

end.

