unit supplier_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm_INVTSUPP = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource7: TDataSource;
    ADO28: TADOQuery;
    ADO28PRICE_1: TFloatField;
    ADO28AVL_FLAG: TStringField;
    ADO28LEAD_TIME: TSmallintField;
    ADO28TAX_2: TFloatField;
    ADO28CURR_NAME: TStringField;
    ADO28UNIT_NAME: TStringField;
    ADO28ABBR_NAME: TStringField;
    ADO28avl_type: TStringField;
    ADO28tax_flag: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADO28CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_INVTSUPP: TForm_INVTSUPP;

implementation

uses damo;

{$R *.dfm}

procedure TForm_INVTSUPP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then close;
end;

procedure TForm_INVTSUPP.FormActivate(Sender: TObject);
begin
ADO28.Open;
end;

procedure TForm_INVTSUPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ADO28.Close;
end;

procedure TForm_INVTSUPP.ADO28CalcFields(DataSet: TDataSet);
begin
if ADO28AVL_FLAG.Value='Y' then
 ADO28avl_type.Value:='已认可'
else
 if ADO28AVL_FLAG.Value='N' then
  ADO28avl_type.Value:='未认可'
 else
  ADO28avl_type.Value:='暂时认可';
end;

end.
