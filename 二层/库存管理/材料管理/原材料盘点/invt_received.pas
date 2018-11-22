unit invt_received;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1INVENTORY_PTR: TIntegerField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1EXPIRE_DATE: TDateTimeField;
    ADOQuery1QUAN_ON_HAND: TFloatField;
    ADOQuery1WAREHOUSE_CODE: TStringField;
    ADOQuery1CODE: TStringField;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1LOCATION_PTR: TIntegerField;
    ADOQuery1abbr_name: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
uses damo;
{$R *.dfm}

procedure TForm6.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
 if (chr(key)='S') and (ssalt in shift) then
  begin
   showmessage(adoquery1.SQL.Text);
  end;
end;

procedure TForm6.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult:=mrok;
end;

end.
