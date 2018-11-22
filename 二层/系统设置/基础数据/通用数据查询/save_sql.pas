unit save_sql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, DBCtrls, ExtCtrls;

type
  TForm_savesql = class(TForm)
    ADO300: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADO300description: TStringField;
    ADO300select_sql: TMemoField;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_savesql: TForm_savesql;

implementation

uses main;

{$R *.dfm}

procedure TForm_savesql.FormCreate(Sender: TObject);
begin
self.ADO300.Open;
end;

procedure TForm_savesql.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then self.ModalResult:=mrok;
end;

procedure TForm_savesql.DBGrid1DblClick(Sender: TObject);
begin
 self.ModalResult:=mrok;
end;

end.
