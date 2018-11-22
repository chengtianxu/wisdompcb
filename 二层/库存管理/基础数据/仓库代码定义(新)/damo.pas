unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    AQ04: TADOQuery;
    AQ04seed_value: TStringField;
    AQ04seed_flag: TWordField;
    temp: TADOQuery;
    AQ16: TADOQuery;
    AQ16rkey: TAutoIncField;
    AQ16code: TStringField;
    AQ16location: TStringField;
    AQ16location_type: TWordField;
    AQ16whouse_ptr: TIntegerField;
    AQ16warehouse_code: TStringField;
    AQ16warehouse_name: TStringField;
    AQ16abbr_name: TStringField;
    AQ16type: TStringField;
    AQ16RelationOrder: TBooleanField;
    procedure AQ16PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses edit_lo;

{$R *.dfm}


procedure Tdm.AQ16PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  messagedlg('数据保存失败,请检查编号是否重复!',mtwarning,[mbok],0);
  abort;
end;

end.
