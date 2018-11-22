unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB, ppEndUsr, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppBands, ppCache;
type
  Tdm1 = class(TDataModule)
    con1: TADOConnection;
    qrytmp: TADOQuery;
    cmd1: TADOCommand;
    prprt1: TppReport;
    ppDesigner1: TppDesigner;
    ppDBPipeline1: TppDBPipeline;
    adsRpt: TADODataSet;
    adsRptDSDesigner: TStringField;
    adsRptDSDesigner2: TStringField;
    adsRptDSDesigner3: TStringField;
    adsRptDSDesigner4: TDateTimeField;
    adsRptDSDesigner5: TStringField;
    adsRptDSDesigner6: TStringField;
    adsRptDSDesigner7: TStringField;
    adsRptDSDesigner8: TStringField;
    adsRptDSDesigner9: TStringField;
    adsRptDSDesigner10: TStringField;
    adsRptDSDesigner11: TStringField;
    dsrpt: TDataSource;
    phdrbnd1: TppHeaderBand;
    pdtlbnd1: TppDetailBand;
    pftrbnd1: TppFooterBand;
    pdbtxt1: TppDBText;
    pdbtxt2: TppDBText;
    pdbtxt3: TppDBText;
    pdbtxt4: TppDBText;
    pdbtxt5: TppDBText;
    pdbtxt6: TppDBText;
    pdbtxt7: TppDBText;
    pdbtxt8: TppDBText;
    pdbtxt9: TppDBText;
    pdbtxt10: TppDBText;
    adsRptDSDesigner12: TStringField;
    adsRptField: TStringField;
    adsRptField2: TStringField;
    procedure adsRptCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function SqlOpen(ASql: string): Boolean;
    procedure SqlExec(ASql: string);
    function GetSvrTime: TDateTime;
  end;

var
  dm1: Tdm1;

implementation

{$R *.dfm}

{ Tdm1 }

function Tdm1.GetSvrTime: TDateTime;
var
  Lqry: TADOQuery;
begin
  Lqry := TADOQuery.Create(Self);
  try
    Lqry.Connection := con1;
    Lqry.SQL.Add('select getdate() as Nowtime');
    Lqry.Open;
    Result := Lqry.FieldByName('nowtime').AsDateTime;
    Lqry.Close;
  finally
    Lqry.Free;
  end;
end;

procedure Tdm1.SqlExec(ASql: string);
begin
  cmd1.CommandText := ASql;
  cmd1.Execute;
end;

function Tdm1.SqlOpen(ASql: string): Boolean;
begin
  Result := False;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Text := ASql;
  qrytmp.open;
  Result := True;
end;

procedure Tdm1.adsRptCalcFields(DataSet: TDataSet);
var
  LSql: string;
begin
  SqlOpen('SELECT WAREHOUSE_NAME,ADDRESS_LINE_1 from data0015 ORDER BY RKEY ASC ');
  DataSet.FieldByName('工厂').AsString := qrytmp.fieldbyname('WAREHOUSE_NAME').AsString;
  DataSet.FieldByName('工厂地址').AsString := qrytmp.fieldbyname('ADDRESS_LINE_1').AsString;
end;

end.
