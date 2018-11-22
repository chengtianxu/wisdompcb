unit ChaoKaFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmChaoka = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnC: TBitBtn;
    btnE: TBitBtn;
    eh1: TDBGridEh;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnQ: TBitBtn;
    procedure btnQClick(Sender: TObject);
    procedure btnEClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChaoka: TfrmChaoka;

implementation

uses damo,common;

{$R *.dfm}

procedure TfrmChaoka.btnQClick(Sender: TObject);
begin
  dm.qry1.Close;
  dm.qry1.Parameters[0].Value:= dtpk1.DateTime;
  dm.qry1.Parameters[1].Value:= dtpk2.DateTime;
  dm.qry1.Open;
end;

procedure TfrmChaoka.btnEClick(Sender: TObject);
begin
  if not dm.qry1.IsEmpty then
    Export_dbGridEH_to_Excel(eh1,'≥¨≤πø®≤È—Ø') ;
end;

end.
