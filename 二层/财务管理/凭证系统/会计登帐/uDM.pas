unit uDM;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    tmp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.



