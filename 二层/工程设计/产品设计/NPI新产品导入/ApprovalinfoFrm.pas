unit ApprovalinfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh;

type
  TFrm_Approvalinfo = class(TForm)
    DBGridEh1: TDBGridEh;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Approvalinfo: TFrm_Approvalinfo;

implementation

uses damo;

{$R *.dfm}

procedure TFrm_Approvalinfo.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS602.CommandText);
end;

end.
