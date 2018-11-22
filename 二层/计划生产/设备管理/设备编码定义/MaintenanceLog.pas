unit MaintenanceLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  TFrm_MaintenanceLog = class(TForm)
    Panel1: TPanel;
    DBGrd: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MaintenanceLog: TFrm_MaintenanceLog;

implementation

uses dmo, common;

{$R *.dfm}

procedure TFrm_MaintenanceLog.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_MaintenanceLog.BitBtn2Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGrd,Self.Text);
end;

end.
