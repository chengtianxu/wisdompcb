unit Pause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh;

type
  Tfrm_Pause = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADS833: TADODataSet;
    ADS833remark: TWideStringField;
    ADS833stop_end_date: TDateTimeField;
    ADS833stop_begin_date: TDateTimeField;
    ADS833rkey831: TIntegerField;
    ADS833Rkey: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Pause: Tfrm_Pause;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_Pause.FormShow(Sender: TObject);
begin
  ADS833.Close;
  frm_Pause.ADS833.Parameters.ParamByName('vRkey831').value := dm.ADS831rkey.value;
  ADS833.Open;
end;

procedure Tfrm_Pause.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(ADS833.CommandText);
end;

end.
