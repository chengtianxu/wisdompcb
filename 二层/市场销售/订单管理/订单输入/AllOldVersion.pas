unit AllOldVersion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmAllOldVersion = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllOldVersion: TfrmAllOldVersion;

implementation

uses damo;

{$R *.dfm}

procedure TfrmAllOldVersion.Button1Click(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

end.
