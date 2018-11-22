unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOTMP: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1ClassgroupCode: TStringField;
    ADOQuery1CalendarID: TIntegerField;
    ADOQuery1descript: TWideStringField;
    ADOQuery1StartDate: TDateTimeField;
    ADOQuery1RepeatMode: TIntegerField;
    ADOQuery1RepeatCycle: TIntegerField;
    ADOQuery1ClassBunch: TWideStringField;
    ADOQuery1Remark: TWideStringField;
    ADOQuery1classbunch_str: TStringField;
    ADOQuery1calendarname: TStringField;
    ADOQuery1repeatcyclename: TStringField;
    ADOQuery1peoplecount: TIntegerField;
    ADODataSet_emplist: TADODataSet;
    ADODataSet_emplistrkey: TIntegerField;
    ADODataSet_emplistdepartmentname: TWideStringField;
    ADODataSet_emplistemployeecode: TWideStringField;
    ADODataSet_emplistchinesename: TWideStringField;
    ADODataSet_emplistposition_item: TWideStringField;
    ADODataSet_emplistondutytime: TDateTimeField;
    DataSource4: TDataSource;
    ADODataSet_emplistclassgroupcode: TStringField;
    ADODataSet_emplistaccountname: TWideStringField;
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public

    { Public declarations }
  end;


var
  DM: TDM;
  D_Ftag: integer;
  //员工选择器部门
  sSql_fiter_0: string;
  sSql_fiter_00: string;
  sSql_begin00: string;
  sSql_right00 :string;
  sSql_end00 :string;

implementation

{$R *.dfm}

procedure TDM.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  if not dm.ADOQuery1.IsEmpty then
    begin
      D_Ftag := dm.ADOQuery1rkey.Value;
    end; 
end;

end.
