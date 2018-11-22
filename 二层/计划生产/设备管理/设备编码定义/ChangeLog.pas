unit ChangeLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  TFrm_ChangeLog = class(TForm)
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
  Frm_ChangeLog: TFrm_ChangeLog;

implementation

uses common, dmo;

{$R *.dfm}

procedure TFrm_ChangeLog.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ChangeLog.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGrd,Self.Text);
end;

end.
