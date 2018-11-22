unit stepnumber_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_stepnumber = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet1STEP_NUMBER: TSmallintField;
    ADODataSet1DEPT_CODE: TStringField;
    ADODataSet1DEPT_NAME: TStringField;
    ADODataSet1BARCODE_ENTRY_FLAG: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_stepnumber: TForm_stepnumber;

implementation

uses damo;

{$R *.dfm}

procedure TForm_stepnumber.FormCreate(Sender: TObject);
begin
self.ADODataSet1.Open;
end;

procedure TForm_stepnumber.DBGrid1DblClick(Sender: TObject);
begin
self.ModalResult:=mrok;
end;

end.
