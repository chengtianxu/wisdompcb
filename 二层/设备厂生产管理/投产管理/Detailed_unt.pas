unit Detailed_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, ADODB;

type
  TDetailed_frm = class(TForm)
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ADODataSet1alloc_datetime: TDateTimeField;
    ADODataSet1quan_alloc: TBCDField;
    ADODataSet1EMPLOYEE_NAME: TStringField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detailed_frm: TDetailed_frm;

implementation

uses DAMO;

{$R *.dfm}

procedure TDetailed_frm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADODataSet1.CommandText);
end;

end.
