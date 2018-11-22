unit QryMatrlReceiving;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QryDynamicModel, Menus, ImgList, DB, DBClient, ComCtrls, Grids,
  DBGridEh, RzTabs, RzButton, ExtCtrls, ToolWin;

type
  TfrmQryMatrlReceiving = class(TfrmQryDynamicModel)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQryMatrlReceiving: TfrmQryMatrlReceiving;

implementation

{$R *.dfm}

procedure TfrmQryMatrlReceiving.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmQryMatrlReceiving := nil;
end;

end.
