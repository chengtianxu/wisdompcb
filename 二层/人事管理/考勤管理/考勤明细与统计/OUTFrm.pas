unit OUTFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB;

type
  TfrmOUT = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn1: TBitBtn;
    dbOUT: TDBGridEh;
    ds1: TDataSource;
    btn2: TBitBtn;
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOUT: TfrmOUT;

implementation

uses DMFrm,common;

{$R *.dfm}

procedure TfrmOUT.btn2Click(Sender: TObject);
begin
 if not DM1.qryOUt.IsEmpty then
      common.Export_dbGridEH_to_Excel(dbOUT,'¶àÌìÎÞ¿¼ÇÚ');
end;

end.
