unit invt_sendback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TForm_sendback = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_sendback: TForm_sendback;

implementation

uses datamd;

{$R *.dfm}

procedure TForm_sendback.DBGrid1DblClick(Sender: TObject);
begin
self.ModalResult:=mrok;
end;

end.
