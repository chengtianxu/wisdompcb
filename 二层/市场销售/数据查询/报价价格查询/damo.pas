unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Windows, Messages,Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, ComCtrls;

type
  TDM = class(TDataModule)
    dsMain: TDataSource;
    qrytemptable: TADOQuery;
    qryMain: TADOQuery;
    con1: TADOConnection;
    qry1: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TimeTag, tt: Integer;
    time1, time2: TDate;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 tt := 0;
end;

end.
