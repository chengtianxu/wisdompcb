unit WInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh;

type
  TFrmWInfo = class(TForm)
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWInfo: TFrmWInfo;

implementation

{$R *.dfm}

uses
  DM;
  
procedure TFrmWInfo.FormCreate(Sender: TObject);
begin
  damo.qryWCinfo.Close;
  damo.qryWCinfo.Open;
end;

end.
