unit Frm_recv_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB;

type
  TFrm_recv = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    Aqwz304: TADOQuery;
    Aqwz304DELIVER_NUMBER: TStringField;
    Aqwz304SHIP_NAME: TStringField;
    Aqwz304SHIP_DATE: TDateTimeField;
    Aqwz304EMPLOYEE_NAME: TStringField;
    Aqwz304rece_quantity: TIntegerField;
    Aqwz304REMARK: TStringField;
    Aqwz304REQ_DATE: TDateTimeField;
    Aqwz304manu_PART_NUMBER: TStringField;
    Aqwz304manu_PART_DESC: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_recv: TFrm_recv;

implementation

uses DM_u;

{$R *.dfm}

procedure TFrm_recv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then
  self.ModalResult:=mrcancel;
end;

procedure TFrm_recv.FormCreate(Sender: TObject);
begin
self.Aqwz304.Open;
end;

end.
