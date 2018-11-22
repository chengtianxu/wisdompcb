unit Frm_recInf_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB;

type
  TFrm_recInf = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    ADOQuery3: TADOQuery;
    ADOQuery3PO_NUMBER: TStringField;
    ADOQuery3INV_PART_NUMBER: TStringField;
    ADOQuery3INV_PART_DESCRIPTION: TStringField;
    ADOQuery3QUAN_ORD: TFloatField;
    ADOQuery3QUAN_RECD: TFloatField;
    ADOQuery3rkey: TIntegerField;
    ADOQuery4: TADOQuery;
    ADOQuery4PO_NUMBER: TStringField;
    ADOQuery4DESCRIPTION: TStringField;
    ADOQuery4GUI_GE: TStringField;
    ADOQuery4QUAN_ORD: TFloatField;
    ADOQuery4QUANTITY_RECEIVED: TFloatField;
    ADOQuery4rkey: TIntegerField;
    ADOQuery5: TADOQuery;
    ADOQuery5GRN_NUMBER: TStringField;
    ADOQuery5TDATE: TDateTimeField;
    ADOQuery5QUANTITY: TFloatField;
    ADOQuery5WAREHOUSE_CODE: TStringField;
    ADOQuery5LOCATION: TStringField;
    ADOQuery5BARCODE_ID: TStringField;
    ADOQuery5REF_NUMBER: TStringField;
    ADOQuery5EMPLOYEE_NAME: TStringField;
    ADOQuery6: TADOQuery;
    ADOQuery6GRN_NUMBER: TStringField;
    ADOQuery6DATE_RECD: TDateTimeField;
    ADOQuery6QUAN_RECD: TFloatField;
    ADOQuery6REF_NUMBER: TStringField;
    ADOQuery6EMPLOYEE_NAME: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_recInf: TFrm_recInf;

implementation

uses DM_u;

{$R *.dfm}

procedure TFrm_recInf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then
  self.ModalResult:=mrcancel;
end;

procedure TFrm_recInf.FormActivate(Sender: TObject);
begin
  dbgrid1.Columns[0].Width := 102;
  dbgrid1.Columns[1].Width := 178;
  dbgrid1.Columns[2].Width := 215;
  dbgrid1.Columns[3].Width := 76;
  dbgrid1.Columns[4].Width := 76;
end;

end.
