unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    adoTmp: TADOQuery;
    adoTime: TADOQuery;
    DataSource1: TDataSource;
    adoMainrkey: TAutoIncField;
    adoMainD023_ptr: TIntegerField;
    adoMainINV_Type: TStringField;
    adoMainTestDate: TDateTimeField;
    adoMainModel: TStringField;
    adoMainEffeDate: TDateTimeField;
    adoMainreportstatus: TStringField;
    adoMainStatus: TWordField;
    adoMainTemporBy: TBooleanField;
    adoMainTemporTo: TDateTimeField;
    adoMainD073_ptr: TIntegerField;
    adoMainEntrTime: TDateTimeField;
    adoMainRemarks: TStringField;
    adoMainINV_Name: TStringField;
    adoMainRoHsFree: TStringField;
    adoMainSGS_NO: TStringField;
    adoMainCODE: TStringField;
    adoMainUSER_FULL_NAME: TStringField;
    adoMainstrstatus: TStringField;
    adoAux: TADODataSet;
    DataSource2: TDataSource;
    adoAuxrkey: TAutoIncField;
    adoAuxD805_ptr: TIntegerField;
    adoAuxFileType: TWordField;
    adoAuxstrFileType: TStringField;
    adoAuxFileName: TStringField;
    adoAuxRemarks: TStringField;
    DataSource3: TDataSource;
    adoField: TADOQuery;
    adoFieldRkey: TAutoIncField;
    adoFieldD419_ptr: TIntegerField;
    adoFieldD073_ptr: TIntegerField;
    adoFieldFieldName: TStringField;
    adoFieldFieldCaption: TStringField;
    adoFieldFieldOrder: TIntegerField;
    adoFieldFieldWidth: TIntegerField;
    adoFieldIsDisplay: TBooleanField;
    adoMainabbr_name: TStringField;
    adoMaintempby: TStringField;
    adoMainsupstatus: TStringField;
    adoMainaudiuser: TStringField;
    procedure adoMainAfterScroll(DataSet: TDataSet);
    procedure adoFieldBeforeInsert(DataSet: TDataSet);
    procedure adoFieldBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.adoMainAfterScroll(DataSet: TDataSet);
var
  rkey805:Integer;
begin
//  rkey805:= DM.adoMainrkey.Value;
//  with DM.adoAux do
//  begin
//    Close;
//    Parameters.ParamByName('rkey805').Value:= rkey805;
//    Open;
//  end;
end;

procedure TDM.adoFieldBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TDM.adoFieldBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

end.
