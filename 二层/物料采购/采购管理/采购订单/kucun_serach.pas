unit kucun_serach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls;

type
  TForm20 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1inv_name: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1GROUP_NAME: TStringField;
    ADOQuery1quan_total: TFloatField;
    ADOQuery1avl_price: TFloatField;
    ADOQuery1amount: TFloatField;
    ADOQuery1UNIT_CODE: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1inv_group_name: TStringField;
    Panel1: TPanel;
    ADOQuery1type: TStringField;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1reason: TStringField;
    ADOQuery1BARCODE_ID: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

uses damo;

{$R *.dfm}

procedure TForm20.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADOQuery1.SQL.Text);
end;

end.
