unit Pause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh;

type
  Tfrm_Pause = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADS577: TADODataSet;
    ADS577Rkey: TAutoIncField;
    ADS577rkey567: TIntegerField;
    ADS577stop_begin_date: TDateTimeField;
    ADS577stop_end_date: TDateTimeField;
    ADS577remark: TWideStringField;
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
  ADS577.Close;
  frm_Pause.ADS577.Parameters.ParamByName('vRkey567').value := dm.ADS567RKEY.value;
  ADS577.Open;
end;

procedure Tfrm_Pause.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(ADS577.CommandText);
end;

end.
