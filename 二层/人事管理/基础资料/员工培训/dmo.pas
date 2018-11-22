unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB, Forms;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADOEmployee_Train: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOEmployee_Train_1: TADODataSet;
    ADOEmployee_TrainRkey: TAutoIncField;
    ADOEmployee_Trainemployeeid: TIntegerField;
    ADOEmployee_Trainemployeecode: TWideStringField;
    ADOEmployee_Trainchinesename: TWideStringField;
    ADOEmployee_Trainondutytime: TDateTimeField;
    ADOEmployee_Traindepartmentname: TWideStringField;
    ADOEmployee_TrainTrain_NO: TStringField;
    ADOEmployee_TrainTrain_topics: TWideStringField;
    ADOEmployee_Trainstartdate: TDateTimeField;
    ADOEmployee_Trainstarttime: TStringField;
    ADOEmployee_Trainenddate: TDateTimeField;
    ADOEmployee_Trainendtime: TStringField;
    ADOEmployee_TrainTrain_time: TFloatField;
    ADOEmployee_TrainTeacher: TWideStringField;
    ADOEmployee_TrainTrain_place: TWideStringField;
    ADOEmployee_TrainTrain_grade: TWideStringField;
    ADOEmployee_TrainTrain_result: TWideStringField;
    ADOEmployee_TrainTrain_content: TWideStringField;
    ADOEmployee_TrainTrain_status: TStringField;
    ADOEmployee_TraindetailRkey: TAutoIncField;
    ADOEmployee_TrainType_ptr: TWideStringField;
    ADOEmployee_Traintrain_feels: TBCDField;
    ADOEmployee_Traineffective_date: TDateTimeField;
    ADOEmployee_Trainfeels_payed: TBooleanField;
    ADOEmployee_Trainptr_flag: TBooleanField;
    ADOEmployee_Trainoprator_ptr: TIntegerField;
    ADOEmployee_Trainoprate_time: TDateTimeField;
    ADOEmployee_Trainecode: TWideStringField;
    procedure ADOEmployee_Trainfeels_payedGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ADOEmployee_Trainptr_flagGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ADOEmployee_Trainoprator_ptrGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOEmployee_Trainfeels_payedGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((Sender.Value=1) or (Sender.Value=True)) then Text:='已结' else Text:='未结';
  if (DM.ADOEmployee_TrainType_ptr.Value='普通') then Text:='';
end;

procedure TDM.ADOEmployee_Trainptr_flagGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ((Sender.Value=1) or (Sender.Value=True)) then Text:='已用' else Text:='未用';
end;

procedure TDM.ADOEmployee_Trainoprator_ptrGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var TmpAdo:TADOQuery;
begin
  TmpAdo:=TADOQuery.Create(Application);
  TmpAdo.Connection:=DM.ADOConn;
  TmpAdo.Close;
  TmpAdo.SQL.Clear;
  TmpAdo.SQL.Add('select * from dbo.data0005 where Rkey='+IntToStr(Sender.AsInteger)+'');
  TmpAdo.Open;
  try
    try
      if not TmpAdo.Eof then
      begin
        Text:=TmpAdo.FieldBYName('EMPLOYEE_NAME').AsString;
      end;
    except
      tmpAdo.Close;
      tmpAdo.Connection := nil;
      tmpAdo.Free;
      tmpAdo := nil;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

end.
