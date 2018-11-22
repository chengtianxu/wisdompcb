unit DM_u;

interface           

uses
  SysUtils, Classes, DB, ADODB,PubFunc,Variants, Provider, DBClient,
  MConnect, SConnect, TConnect,Forms,controls,StrUtils,DateUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    Tmp1: TADOQuery;
    Data01031: TADOQuery;
    Data01032: TADOQuery;
    Data01033: TADOQuery;
    Data01034: TADOQuery;
    Data01030: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    function conDB :boolean;

  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.conDB: boolean;
begin
 { result:=false;
  ADOCon.Connected:=false;
  ADOCon.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=true;'+
                           'User ID='+user+';Password='+pass+';Initial Catalog='+DBName+';Data Source='+DBServerAddr+
                           ';Use Procedure for Prepare=1;Auto Translate=True;'+
                           'Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
                    // Provider=SQLOLEDB.1;Persist Security Info=True;User ID=sa;
                     //Initial Catalog=mis_h;Data Source=YYY
  try
    ADOCon.Open;
  except
    exit;
  end;
  result:=true;  }
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 // ADOCon.Open;
end;

end.
