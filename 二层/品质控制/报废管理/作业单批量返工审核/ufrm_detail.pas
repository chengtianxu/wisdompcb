unit ufrm_detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  Tfrm_detail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    dbgrd1: TDBGrid;
    pnl4: TPanel;
    dbgrd2: TDBGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_detail: Tfrm_detail;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_detail.FormResize(Sender: TObject);
begin
  pnl1.Height := Trunc(Self.Height/2);
end;

end.
