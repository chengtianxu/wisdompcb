unit select_period;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm_period = class(TForm)
    aqd444: TADODataSet;
    aqd444CUT_DATE: TDateTimeField;
    aqd444TDATE: TDateTimeField;
    aqd444EMPLOYEE_NAME: TStringField;
    aqd444CLOSED: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_period: TForm_period;

implementation

uses damo;

{$R *.dfm}

procedure TForm_period.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(AqD444.CommandText);
end;

end.
