unit FindBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB, ADODB;

type
  TForm_FindBook = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    ADS213: TADODataSet;
    DataSource1: TDataSource;
    ADS213RKEY: TIntegerField;
    ADS213MANU_PART_NUMBER: TStringField;
    ADS213PO_NUMBER: TStringField;
    ADS213ANALYSIS_CODE_2: TStringField;
    ADS213MANU_PART_DESC: TStringField;
    ADS213ORIG_REQUEST_DATE: TDateTimeField;
    ADS213ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADS213PARTS_ORDERED: TIntegerField;
    ADS213PART_PRICE: TFloatField;
    ADS213CURR_CODE: TStringField;
    ADS213PO_DATE: TDateTimeField;
    ADS213status: TWordField;
    ADS213user_ptr: TIntegerField;
    ADS213submit_date: TDateTimeField;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_FindBook: TForm_FindBook;

implementation

uses damo;

{$R *.dfm}

procedure TForm_FindBook.DBGrid1DblClick(Sender: TObject);
begin
  if ADS213.RecordCount = 0 then
    ModalResult := mrCancel
  else
    ModalResult := mrok;
end;

end.
