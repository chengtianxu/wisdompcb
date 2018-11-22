unit PasCycle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus;

type
  TfrmCycle = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnExit: TBitBtn;
    ehCycle: TDBGridEh;
    pm1: TPopupMenu;
    NAdd: TMenuItem;
    NDel: TMenuItem;
    procedure NAddClick(Sender: TObject);
    procedure NDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCycle: TfrmCycle;

implementation

uses
  DEMO, PasCycleAdd,common;

{$R *.dfm}

procedure TfrmCycle.NAddClick(Sender: TObject);
var
  Lfrm:TfrmDes;
begin
  LFrm:= TfrmDes.Create(nil);
  try
    if Lfrm.ShowModal = mrok then
    begin
      DM.qryCylce.Close;
      dm.qryCylce.Open;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmCycle.NDelClick(Sender: TObject);
begin
  if MessageDlg('È·¶¨ÒªÉ¾³ýÂð£¿', mtWarning, [mbYes,mbNo],0) = mryes then
  begin
    with DM.qrytmp do
    begin
      Close;
      sql.Text:='Delete from Data0621 where rkey496 = '
            + DM.qryCylcerkey496.asstring + ' and Cycle = ' + DM.qryCylceCycle.AsString;
      ExecSQL;
    end;
    DM.qryCylce.Close;
    DM.qryCylce.Open;
  end;
end;

end.
