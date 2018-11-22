unit stdhistory_price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB;

type
  TForm_stdprice = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_stdprice: TForm_stdprice;

implementation

uses DM_u;

{$R *.dfm}

procedure TForm_stdprice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=27 then ModalResult := mrok;
end;

procedure TForm_stdprice.FormCreate(Sender: TObject);
begin
  dm.ADOstdprice.Parameters[0].Value :=DM.AQ69INVT_PTR.Value;
  dm.ADOstdprice.Open;
end;

procedure TForm_stdprice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.ADOstdprice.close;
end;

end.
