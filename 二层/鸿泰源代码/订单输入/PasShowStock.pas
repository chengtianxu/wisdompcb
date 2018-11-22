unit PasShowStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, ADODB, StdCtrls;

type
  TfrmShowStock = class(TForm)
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowStock: TfrmShowStock;

implementation

uses damo;

{$R *.dfm}

procedure TfrmShowStock.Button1Click(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

end.
