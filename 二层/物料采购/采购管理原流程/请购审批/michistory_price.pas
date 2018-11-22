unit michistory_price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm_micprice = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
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
  Form_micprice: TForm_micprice;

implementation

uses damo;

{$R *.dfm}

procedure TForm_micprice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then ModalResult := mrok;
end;

procedure TForm_micprice.FormCreate(Sender: TObject);
begin
dm.ADOmicprice.Parameters[0].Value := '%'+trim(dm.aq204DESCRIPTION_1.Value)+'%';
dm.ADOmicprice.Open;
end;

procedure TForm_micprice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.ADOmicprice.Close;
end;

end.
