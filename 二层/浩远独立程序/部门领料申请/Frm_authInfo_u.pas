unit Frm_authInfo_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, StdCtrls;

type
  TFrm_authInfo = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_authInfo: TFrm_authInfo;

implementation

{$R *.dfm}

procedure TFrm_authInfo.Button1Click(Sender: TObject);
begin
  close;
end;

end.
