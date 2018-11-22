unit Recordt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh;

type
  Tfrm_Recordt = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADS839: TADODataSet;
    ADS839USER_FULL_NAME: TStringField;
    ADS839MainExecStat: TStringField;
    ADS839Record_date: TDateTimeField;
    ADS839remark: TWideStringField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Recordt: Tfrm_Recordt;

implementation

uses  damo;

{$R *.dfm}

procedure Tfrm_Recordt.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(ADS839.CommandText);
end;

end.
