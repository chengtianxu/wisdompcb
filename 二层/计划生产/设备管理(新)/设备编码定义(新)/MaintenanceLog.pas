unit MaintenanceLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, DB, ADODB;

type
  TFrm_MaintenanceLog = class(TForm)
    Panel1: TPanel;
    DBGrd: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource2: TDataSource;
    ADS567: TADODataSet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MaintenanceLog: TFrm_MaintenanceLog;

implementation

uses damo, common;

{$R *.dfm}

procedure TFrm_MaintenanceLog.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_MaintenanceLog.BitBtn2Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGrd,Self.Text);
end;

procedure TFrm_MaintenanceLog.DBGrdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADS567.CommandText);
end;

end.
