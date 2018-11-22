unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADS417D845_ptr: TIntegerField;
    ADS417RKEY: TAutoIncField;
    ADS417FASSET_CODE: TStringField;
    ADS417FASSET_NAME: TStringField;
    ADS417FASSET_DESC: TStringField;
    ADS417FASSET_TYPE: TStringField;
    ADS417DEPT_NAME: TStringField;
    ADS417LOCATION: TStringField;
    ADS417PURCH_DATE: TDateTimeField;
    ADS417BOOK_DATE: TDateTimeField;
    ADS417REMARK: TStringField;
    ADS417active_flag: TStringField;
    ADS417USER_DATE: TDateTimeField;
    ADS417EMPLOYEE_NAME: TStringField;
    ADS417ABBR_NAME: TStringField;
    ADS417supplier_name: TStringField;
    ADS417MAKE_VENDER: TStringField;
    ADS417confi_date: TDateTimeField;
    ADS417confi_user: TStringField;
    ADS417DATA0417active_flag: TWordField;
    ADS417install_date: TDateTimeField;
    ADS417install_user: TStringField;
    ADS417EquiType: TBooleanField;
    ADS417DSDesigner: TStringField;
    ADS417machine_number: TStringField;
    ADS417id_code: TStringField;
    ADS417equipment_grade: TStringField;
    ADS417DeviType: TStringField;
    ADS417D840_ptr: TIntegerField;
    ADS417d840_Location: TStringField;
    tmp: TADOQuery;
    ADS417: TADODataSet;
    ADS417IsGroup: TStringField;
    ADO417: TADOQuery;
    ADO417rkey: TAutoIncField;
    ADO417FASSET_CODE: TStringField;
    ADO417FASSET_NAME: TStringField;
    ADO417FASSET_DESC: TStringField;
    ADO417machine_number: TStringField;
    ADO417location: TStringField;
    ADO417FASSET_TYPE_PTR: TSmallintField;
    ADO417PURCH_DATE: TDateTimeField;
    ADO417warehouse_ptr: TIntegerField;
    ADO417d840_ptr: TIntegerField;
    ADO417supplier_name: TStringField;
    ADO417MAKE_VENDER: TStringField;
    ADO417equipment_grade: TStringField;
    ADO417DeviType: TStringField;
    ADO417REMARK: TStringField;
    ADO417user_ptr: TIntegerField;
    ADO417IsGroup: TBooleanField;
    ADO417EquiType: TBooleanField;
    ADO417USER_DATE: TDateTimeField;
    ADO417d845_ptr: TIntegerField;
    ADS417DEPT_PTR: TIntegerField;
    ADS417FaultDesc: TStringField;
    ADS573: TADODataSet;
    DataSource3: TDataSource;
    ADS573FASSET_CODE: TStringField;
    ADS573FASSET_NAME: TStringField;
    ADS573FASSET_DESC: TStringField;
    ADS573allocate_number: TStringField;
    ADS573allocate_date: TDateTimeField;
    ADS573EMPLOYEE_NAME: TStringField;
    ADS573ent_date: TDateTimeField;
    ADS573alloc_outfac: TStringField;
    ADS573alloc_outdeptname: TStringField;
    ADS573alloc_infac: TStringField;
    ADS573alloc_indeptname: TStringField;
    ADS573remark: TStringField;
    ADS573allocate_number_1: TStringField;
    ADS573allocate_date_1: TDateTimeField;
    ADS573userName: TStringField;
    ADS573ent_date_1: TDateTimeField;
    ADS573remark_1: TStringField;
    ADS573detection_remark: TStringField;
    ADS573scrap_remark: TStringField;
    ADS417DEPT_CODE: TStringField;
    ADS813: TADODataSet;
    DS813: TDataSource;
    ADS813FASSET_PTR: TIntegerField;
    ADS813user_ptr: TIntegerField;
    ADS813in_date: TDateTimeField;
    ADS813file_name: TStringField;
    ADS813remark: TStringField;
    ADS813EMPLOYEE_NAME: TStringField;
    Read0005: TADOQuery;
    ADS417ttype: TStringField;
    procedure ADS417AfterScroll(DataSet: TDataSet);
    procedure ADS813BeforeInsert(DataSet: TDataSet);
    procedure ADS813BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.ADS417AfterScroll(DataSet: TDataSet);
begin
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS417.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS417.RecordCount);
end;

procedure TDM.ADS813BeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TDM.ADS813BeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

end.
