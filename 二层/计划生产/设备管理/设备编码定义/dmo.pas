unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs,Messages, DBClient, Provider,Variants;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADO417: TADODataSet;
    DataSource1: TDataSource;
    ADO417RKEY: TAutoIncField;
    ADO417FASSET_CODE: TStringField;
    ADO417FASSET_NAME: TStringField;
    ADO417FASSET_DESC: TStringField;
    ADO417FASSET_TYPE: TStringField;
    ADO417DEPT_NAME: TStringField;
    ADO417LOCATION: TStringField;
    ADO417PURCH_DATE: TDateTimeField;
    ADO417BOOK_DATE: TDateTimeField;
    ADO417REMARK: TStringField;
    ADO417active_flag: TStringField;
    ADO417USER_DATE: TDateTimeField;
    ADO417EMPLOYEE_NAME: TStringField;
    ADO417supplier_name: TStringField;
    ADO417MAKE_VENDER: TStringField;
    ADO417confi_date: TDateTimeField;
    ADO417confi_user: TStringField;
    ADO417install_date: TDateTimeField;
    ADO417install_user: TStringField;
    ADO417machine_number: TStringField;
    ADOQuery1: TADOQuery;
    ADO417ABBR_NAME: TStringField;
    ADOQuery2: TADOQuery;
    ADO567: TADODataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO5734: TADODataSet;
    ADO567NUMBER: TStringField;
    ADO567FASSET_CODE: TStringField;
    ADO567FASSET_NAME: TStringField;
    ADO567FASSET_DESC: TStringField;
    ADO567DEPT_NAME: TStringField;
    ADO567PLACE: TStringField;
    ADO567failure_date: TDateTimeField;
    ADO567EMPLOYEE_NAME: TStringField;
    ADO567ent_date: TDateTimeField;
    ADO567referring_date: TDateTimeField;
    ADO567failure_circs: TStringField;
    ADO567disposal_empl: TStringField;
    ADO567disposal_date: TDateTimeField;
    ADO567maintain_empl: TStringField;
    ADO567maintain_text: TStringField;
    ADO567complete_date: TDateTimeField;
    ADO567validate_empl: TStringField;
    ADO567validate_date: TDateTimeField;
    ADO5734FASSET_CODE: TStringField;
    ADO5734FASSET_NAME: TStringField;
    ADO5734FASSET_DESC: TStringField;
    ADO5734allocate_number: TStringField;
    ADO5734allocate_date: TDateTimeField;
    ADO5734EMPLOYEE_NAME: TStringField;
    ADO5734ent_date: TDateTimeField;
    ADO5734alloc_outfac: TStringField;
    ADO5734alloc_outdeptname: TStringField;
    ADO5734alloc_infac: TStringField;
    ADO5734alloc_indeptname: TStringField;
    ADO5734remark: TStringField;
    ADO5734allocate_number_1: TStringField;
    ADO5734allocate_date_1: TDateTimeField;
    ADO5734userName: TStringField;
    ADO5734ent_date_1: TDateTimeField;
    ADO5734remark_1: TStringField;
    ADO5734detection_remark: TStringField;
    ADO5734scrap_remark: TStringField;
    ADO417id_code: TStringField;
    ADO417equipment_grade: TStringField;
    ADO418: TADODataSet;
    DataSource4: TDataSource;
    ADO418name: TStringField;
    ADO418seq_no: TIntegerField;
    ADO418unit_ptr: TIntegerField;
    ADO418unit_name: TStringField;
    ADO418qty: TBCDField;
    ADO418remark: TStringField;
    ADO418fasset_ptr: TIntegerField;
    Read0811: TADOQuery;
    ADO417DeviType: TStringField;
    qry0813: TADOQuery;
    ds0813: TDataSource;
    qryTemp: TADOQuery;
    Read0005: TADOQuery;
    qry0813FASSET_PTR: TIntegerField;
    qry0813user_ptr: TIntegerField;
    qry0813in_date: TDateTimeField;
    qry0813file_name: TStringField;
    qry0813remark: TStringField;
    qry0813Employee_Name: TStringField;
    qry0417: TADOQuery;
    Selected0417: TADOQuery;
    dsp0417: TDataSetProvider;
    cds0417: TClientDataSet;
    qry0417FASSET_CODE: TStringField;
    qry0417FASSET_NAME: TStringField;
    qry0417FASSET_DESC: TStringField;
    qry0417FASSET_TYPE: TStringField;
    qry0417equipment_grade: TStringField;
    qry0417DEPT_NAME: TStringField;
    qry0417LOCATION: TStringField;
    qry0417active_flag: TStringField;
    qry0417ABBR_NAME: TStringField;
    qry0417DeviType: TStringField;
    Selected0417selected: TBooleanField;
    Selected0417RKEY: TAutoIncField;
    Selected0417FASSET_CODE: TStringField;
    Selected0417FASSET_NAME: TStringField;
    Selected0417FASSET_DESC: TStringField;
    Selected0417FASSET_TYPE: TStringField;
    Selected0417equipment_grade: TStringField;
    Selected0417DEPT_NAME: TStringField;
    Selected0417LOCATION: TStringField;
    Selected0417active_flag: TStringField;
    Selected0417ABBR_NAME: TStringField;
    Selected0417DeviType: TStringField;
    cds0417RKEY: TAutoIncField;
    cds0417FASSET_CODE: TStringField;
    cds0417FASSET_NAME: TStringField;
    cds0417FASSET_DESC: TStringField;
    cds0417FASSET_TYPE: TStringField;
    cds0417equipment_grade: TStringField;
    cds0417DEPT_NAME: TStringField;
    cds0417LOCATION: TStringField;
    cds0417active_flag: TStringField;
    cds0417ABBR_NAME: TStringField;
    cds0417DeviType: TStringField;
    qry0417rkey: TIntegerField;
    cdsTemp: TClientDataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    ADO417IsGroup: TBooleanField;
    dt_D0845: TADODataSet;
    dt_D0845FaultDesc: TStringField;
    dt_D0845rkey: TAutoIncField;
    ADO417FaultDesc: TStringField;
    ADO417D845_ptr: TIntegerField;
    QryD840: TADOQuery;
    QryD840rkey: TAutoIncField;
    QryD840Location: TStringField;
    Copy0417: TADOQuery;
    ADO417d840_Location: TStringField;
    ADO417D840_ptr: TIntegerField;
    ADO417EquiType: TBooleanField;
    ADO417DATA0417active_flag: TWordField;
    ADO417DSDesigner: TStringField;
    procedure ADO417AfterScroll(DataSet: TDataSet);
    procedure ADO417d840_LocationChange(Sender: TField);
    procedure ADO417AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Main;

{$R *.dfm}

procedure TDM.ADO417AfterScroll(DataSet: TDataSet);
begin
  with  qry0813  do
  begin
    Close;
    Parameters.ParamByName('vFASSET_PTR').Value:=DataSet.FieldByName('rkey').Value;
    Open;
  end;
Frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DataSet.RecNo)+'/总记录数:'+ IntToStr(DataSet.RecordCount);
end;

procedure TDM.ADO417d840_LocationChange(Sender: TField);
begin
  with qryD840 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
        ADO417.FieldByName('D840_ptr').Value:=null ;
    end
    else
    begin
      if Locate('Location',Sender.Value,[]) then
        begin
        ADO417D840_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        ADO417.FieldByName('D840_ptr').Value:=null;
        ShowMessage('设备责任小组不存在！！！');
        end;
    end;
  end;
end;

procedure TDM.ADO417AfterOpen(DataSet: TDataSet);
begin
Frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DataSet.RecNo)+'/总记录数:'+ IntToStr(DataSet.RecordCount);
end;

end.
