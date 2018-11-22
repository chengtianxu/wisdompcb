unit DMFrm;

interface

uses
  SysUtils, Classes, DB, Provider, DBClient, ADODB;

type
  TDM1 = class(TDataModule)
    con1: TADOConnection;
    adsDevList: TADODataSet;
    dsDevList: TDataSource;
    cdsDevList: TClientDataSet;
    dspDevList: TDataSetProvider;
    cdsDevListselected: TBooleanField;
    cdsDevListdevip: TWideStringField;
    cdsDevListdevid: TWideStringField;
    cdsDevListdevtime: TDateTimeField;
    cdsDevListconstatue: TStringField;
    adsDevListselected: TBooleanField;
    adsDevListdevip: TWideStringField;
    adsDevListdevid: TWideStringField;
    adsDevListdevtime: TDateTimeField;
    adsDevListconstatue: TStringField;
    adsDevListnote: TStringField;
    cdsDevListnote: TStringField;
    qrytmp: TADOQuery;
    sp1: TADOStoredProc;
    adsDevListtodbnote: TStringField;
    cdsDevListtodbnote: TStringField;
    adsMD: TADODataSet;
    dsMD: TDataSource;
    adoQuickUpload: TADOQuery;
    DataSource1: TDataSource;
    adoQuickUploadrkey: TAutoIncField;
    adoQuickUploademployeecode: TWideStringField;
    adoQuickUploadchinesename: TWideStringField;
    adoQuickUploaddepartmentname: TWideStringField;
    adoQuickUploadondutytime: TDateTimeField;
    adoQuickUploadCardno: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetCdsValue(AField,AValue: string);
    procedure ClearAllNote;
    procedure clearDB;
    function SqlExec(ASql: string): Integer;
    function SqlOpen(ASql: string): Boolean;
    function GetDevSelectCount: Integer;
  end;

var
  DM1: TDM1;

implementation

uses
  Variants;

{$R *.dfm}

{ TDM1 }

procedure TDM1.ClearAllNote;
var
  LOldRecno: Integer;
begin
  cdsDevList.DisableControls;
  LOldRecno := cdsDevList.RecNo;
  try
    cdsDevList.First;
    while not cdsDevList.Eof do
    begin
      SetCdsValue('note','');
      SetCdsValue('todbnote','');
      cdsDevList.Edit;
      cdsDevList.FieldByName('devtime').Value := null;
      cdsDevList.Post;
      SetCdsValue('constatue','');
      cdsDevList.Next;
    end;
  finally
    cdsDevList.RecNo := LOldRecno;
    cdsDevList.EnableControls;
  end;
end;

procedure TDM1.clearDB;
begin
  SqlExec('DELETE FROM employeecard_eastriver_rcd');
end;

function TDM1.GetDevSelectCount: Integer;
var
  LOldNO: Integer;
begin
  Result := 0;
  LOldNO := cdsDevList.RecNo;
  cdsDevList.DisableControls;
  cdsDevList.First;
  try
    while not cdsDevList.Eof do
    begin
      if cdsDevList.FieldByName('selected').AsBoolean then
        Result := Result + 1;
      cdsDevList.Next;
    end;
  finally
    cdsDevList.EnableControls;
    cdsDevList.RecNo := LOldNO;
  end;
end;

procedure TDM1.SetCdsValue(AField, AValue: string);
begin
  cdsDevList.Edit;
  cdsDevList.FieldByName(AField).Value := AValue;
  cdsDevList.Post;
end;

function TDM1.SqlExec(ASql: string): Integer;
begin
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.Connection := con1;
    qrytmp.SQL.Add(ASql);
    Result := qrytmp.ExecSQL;
  except
    Result := -1;
  end;
end;

function TDM1.SqlOpen(ASql: string): Boolean;
begin
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.Connection := con1;
    qrytmp.SQL.Add(ASql);
    qrytmp.Open;
    Result := True;
  except
    Result := False;
  end;
end;

end.
