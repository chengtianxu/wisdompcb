unit supplier_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses DM_u;

{$R *.dfm}

procedure TForm4.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=27 then close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.ADO28.Close;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  dm.ADO28.Parameters[0].Value :=DM.AQ69INVT_PTR.Value;
  dm.ADO28.Open;
end;

end.
