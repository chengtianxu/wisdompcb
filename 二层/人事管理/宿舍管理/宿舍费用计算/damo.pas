unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1roomid: TIntegerField;
    ADOQuery1yearmonth: TStringField;
    ADOQuery1startdate: TDateTimeField;
    ADOQuery1enddate: TDateTimeField;
    ADOQuery1R_decrease_e: TFloatField;
    ADOQuery1R_decrease_w: TFloatField;
    ADOQuery1electic_f: TFloatField;
    ADOQuery1water_f: TFloatField;
    ADOQuery1person_freque: TIntegerField;
    ADOQuery1sould_pay: TFloatField;
    ADOQuery1need_pay: TFloatField;
    ADOQuery1real_pay: TFloatField;
    ADOQuery1new_lastfees: TFloatField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTMP: TADOQuery;
    ADOQuery1D_name: TWideStringField;
    ADOQuery1R_code: TStringField;
    ADOQuery2rkey: TAutoIncField;
    ADOQuery2bedroomfeesid: TIntegerField;
    ADOQuery2employeeid: TIntegerField;
    ADOQuery2stay_days: TIntegerField;
    ADOQuery2subfees: TFloatField;
    ADOQuery2ischecked: TBooleanField;
    ADOQuery2employeecode: TWideStringField;
    ADOQuery2chinesename: TWideStringField;
    ADOQuery2startdate: TDateTimeField;
    ADOQuery2enddate: TDateTimeField;
    ADOQuery2B_code: TStringField;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery3factoryarea: TWideStringField;
    ADOQuery3departmentname: TWideStringField;
    ADOQuery3employeecode: TWideStringField;
    ADOQuery3chinesename: TWideStringField;
    ADOQuery3stay_days: TIntegerField;
    ADOQuery3subfees: TFloatField;
    ADOQuery3idcard: TWideStringField;
    ADOQuery3B_code: TStringField;
    ADOQuery3yearmonth: TStringField;
    ADOQuery3startdate: TDateTimeField;
    ADOQuery3enddate: TDateTimeField;
    ADOQuery3ischecked: TBooleanField;
    ADOQuery3D_name: TWideStringField;
    ADOQuery1R_name: TWideStringField;
    ADOQuery4rkey: TAutoIncField;
    ADOQuery4roomid: TIntegerField;
    ADOQuery4yearmonth: TStringField;
    ADOQuery4startdate: TDateTimeField;
    ADOQuery4enddate: TDateTimeField;
    ADOQuery4R_decrease_e: TFloatField;
    ADOQuery4R_decrease_w: TFloatField;
    ADOQuery4electic_f: TFloatField;
    ADOQuery4water_f: TFloatField;
    ADOQuery4person_freque: TIntegerField;
    ADOQuery4sould_pay: TFloatField;
    ADOQuery4need_pay: TFloatField;
    ADOQuery4real_pay: TFloatField;
    ADOQuery4new_lastfees: TFloatField;
    ADOQuery4: TADOQuery;
    ADOQuery_compute: TADOQuery;
    ADOQuery3R_name: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  rkey_Bedroomfees: integer;
  str_adoquery1 :string;
  str_adoquery3 :string;
implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 str_adoquery1 :=dm.ADOQuery1.SQL.Text;
 str_adoquery3 :=dm.ADOQuery3.SQL.Text;
end;

end.
