unit sales_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls, ComCtrls;

type
  TForm_so = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_so: TForm_so;

implementation

uses damo, main_one;

{$R *.dfm}

procedure TForm_so.FormCreate(Sender: TObject);
begin
  with DM.ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select getdate() as dates, (getdate()-30) as datess ';
    Open;
    DateTimePicker1.Date := FieldValues['datess'];
    DateTimePicker2.Date := FieldValues['dates'];
  end;
  DM.qry98.Close;
  DM.qry98.Parameters[0].Value := DateTimePicker1.Date;
  DM.qry98.Parameters[1].Value := DateTimePicker2.Date + 1;
  DM.qry98.Open;
end;

procedure TForm_so.DBGrid1DblClick(Sender: TObject);
begin
  if not DM.qry98.IsEmpty then  ModalResult:=mrOk;
end;

procedure TForm_so.DateTimePicker1Change(Sender: TObject);
begin
  DM.qry98.Close;
  DM.qry98.Parameters[0].Value := DateTimePicker1.Date;
  DM.qry98.Parameters[1].Value := DateTimePicker2.Date + 1;
  DM.qry98.Open;
end;

end.
