unit expressions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dbcgrids, StdCtrls, DBCtrls, DB, ADODB;

type
  TForm4 = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1calculate_method: TStringField;
    DBMemo1: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DBCtrlGrid1DblClick(Sender: TObject);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses data_module;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
self.ADOQuery1.Open;
end;

procedure TForm4.DBCtrlGrid1DblClick(Sender: TObject);
begin
self.ModalResult:=mrok;
end;

procedure TForm4.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then  self.ModalResult:=mrok;
end;

end.
