unit UAuthInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, ADODB;

type
  TfrmAuthInfo = class(TForm)
    eh275: TDBGridEh;
    ds1: TDataSource;
    qry1: TADOQuery;
    strngfldqry1USER_ID: TStringField;
    strngfldqry1USER_FULL_NAME: TStringField;
    intgrfldqry1user_ptr: TIntegerField;
    dtmfldqry1auth_date: TDateTimeField;
    wrdfldqry1ranking: TWordField;
    strngfldqry1auth_flag: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getData(Arkey:string);
  end;

var
  frmAuthInfo: TfrmAuthInfo;

implementation
  uses UDM;
{$R *.dfm}

{ TfrmAuthInfo }

procedure TfrmAuthInfo.getData(Arkey: string);
begin
  qry1.Close;
  qry1.Parameters[0].Value:=Arkey;
  qry1.Open;
end;

end.
