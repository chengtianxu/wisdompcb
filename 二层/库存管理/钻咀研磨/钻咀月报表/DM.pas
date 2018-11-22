unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TTDM = class(TDataModule)
    ADOConn: TADOConnection;
    Adods224: TADODataSet;
    Adosd220: TADODataSet;
    Ado0223: TADOQuery;
    DataSource1: TDataSource;
    Ado0223Rkey: TAutoIncField;
    Ado0223Data0017_prt: TIntegerField;
    Ado0223StockDrill: TIntegerField;
    Ado0223dBeginDate: TDateTimeField;
    Ado0223dEndDate: TDateTimeField;
    Ado0223dDate: TDateTimeField;
    Ado0223dMonth: TIntegerField;
    Ado0223Data0005_Prt: TIntegerField;
    Ado0223iStatus: TIntegerField;
    Ado0223dStatusDate: TDateTimeField;
    Ado0223Remark: TStringField;
    Ado0223Status05_Ptr: TIntegerField;
    ADOQuery1: TADOQuery;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    procedure Ado0223iStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Ado0223Status05_PtrGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    Ftp:integer; //1新增，2编辑，3检查
    { Public declarations }
  end;

var
  TDM: TTDM;
  i0223Rkey:integer;

implementation

{$R *.dfm}

procedure TTDM.Ado0223iStatusGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsInteger=0 then Text:='否' else Text:='是';
end;

procedure TTDM.Ado0223Status05_PtrGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var TmpAdo:TADOQuery;
begin
  TmpAdo:=TADOQuery.Create(Self);
  TmpAdo.Connection:=TDM.ADOConn;
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
