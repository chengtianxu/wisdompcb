unit Frm_Matstock_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls;

type
  TFrm_Matstock = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1inv_name: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1GROUP_NAME: TStringField;
    ADOQuery1quan_total: TFloatField;
    ADOQuery1UNIT_CODE: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    Panel1: TPanel;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1type: TStringField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1reason: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Matstock: TFrm_Matstock;

implementation

uses DM_u;

{$R *.dfm}

procedure TFrm_Matstock.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssAlt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

end.
