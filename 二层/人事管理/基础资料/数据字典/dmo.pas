unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADODict: TADODataSet;
    ADODetail: TADODataSet;
    DSDict: TDataSource;
    DSDetail: TDataSource;
    ADODictrkey: TAutoIncField;
    ADODictitem: TWideStringField;
    ADODetaildictid: TIntegerField;
    ADODetailitem: TWideStringField;
    ADODetailmemo: TWideStringField;
    AQTemp: TADOQuery;
    ADODetailtrain_flag: TBooleanField;
    ADODetailuser_defined1: TIntegerField;
    ADODetailuser_defined2: TIntegerField;
    procedure DSDetailStateChange(Sender: TObject);
    procedure ADODetailAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses form_Main1,common;

{$R *.dfm}

procedure TDM.DSDetailStateChange(Sender: TObject);
begin
  if Assigned(frm_Main1) then
  with frm_Main1 do
  begin
    if  (ADODetail.State in[dsEdit,dsInsert]) then
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btPost.Enabled:=(StrToInt(vprev)in [2,4]);
      btCancel.Enabled:=True;
      btDelete.Enabled:=False;
      btRefresh.Enabled:=False;
      btNext.Enabled:=False;
      btPrior.Enabled:=False;
    end
    else
    begin
      btInsert.Enabled:=(StrToInt(vprev)in [2,4]);
      btEdit.Enabled:=(StrToInt(vprev)in [2,4]);
      btPost.Enabled:=False;
      btCancel.Enabled:=False;
      btDelete.Enabled:=(StrToInt(vprev)in [2,4]);
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
    end;
  end;
end;

procedure TDM.ADODetailAfterInsert(DataSet: TDataSet);
begin
  ADODetaildictid.Value:=ADODictrkey.value;
  if ADODetaildictid.AsInteger=1 then
    ADODetailtrain_flag.Value:=True
  else
    ADODetailtrain_flag.Value:=False;
end;

end.
