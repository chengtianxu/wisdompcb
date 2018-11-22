unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adotmp: TADOQuery;
    adoDormitory: TADODataSet;
    adoRoom: TADODataSet;
    adoBed: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    adoDormitoryrkey: TIntegerField;
    adoDormitoryD_code: TStringField;
    adoDormitoryD_name: TWideStringField;
    adoDormitoryD_floor: TIntegerField;
    adoDormitoryremark: TWideStringField;
    adoDormitoryeffective: TBooleanField;
    adoDormitoryeff: TStringField;
    adoRoomrkey: TIntegerField;
    adoRoomdormitoryid: TIntegerField;
    adoRoomD_name: TWideStringField;
    adoRoomR_code: TStringField;
    adoRoombedcount: TIntegerField;
    adoRoomfloor: TIntegerField;
    adoRoomtype: TIntegerField;
    adoRoomgrade: TWideStringField;
    adoRoommonitor: TIntegerField;
    adoRoomequipment_remark: TWideStringField;
    adoRoomremark: TWideStringField;
    adoRoomeffective: TIntegerField;
    adoRoomR_name: TWideStringField;
    adoRoombasic_rent: TBCDField;
    adoRoomelectricity_standard: TFloatField;
    adoRoomwater_standard: TFloatField;
    adoRoomeff: TStringField;
    adoRoomemployeecode: TWideStringField;
    adoRoomchinesename: TWideStringField;
    adoRoomroomtype: TStringField;
    adoBedrkey: TIntegerField;
    adoBedbedroomid: TIntegerField;
    adoBedR_code: TStringField;
    adoBedR_name: TWideStringField;
    adoBedB_code: TStringField;
    adoBedemployeeid: TIntegerField;
    adoBedeffective: TIntegerField;
    adoBedeff: TStringField;
    adoBedremark: TWideStringField;
    adoBedchinesename: TWideStringField;
    adoBedemployeecode: TWideStringField;
    adoBedfactoryarea: TWideStringField;
    adoBeddepartmentname: TWideStringField;
    adoBedposition: TWideStringField;
    adoBedondutytime: TWideStringField;
    adoBedProvince: TWideStringField;
    adoBedbirthday: TWideStringField;
    adoBedphone: TWideStringField;
    adoRoomIsCouple: TBooleanField;
    adoRoomstrCouple: TStringField;
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
