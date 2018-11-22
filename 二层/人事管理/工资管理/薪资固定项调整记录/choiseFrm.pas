unit choiseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, damo;

type
  TfrmChoise = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChoise: TfrmChoise;

implementation

{$R *.dfm}

procedure TfrmChoise.FormCreate(Sender: TObject);
begin
  DM.qry3.Close;
  DM.qry3.Parameters[0].Value := DM.qry2rkey.Value;
  DM.qry3.Open;
end;

procedure TfrmChoise.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

end.
