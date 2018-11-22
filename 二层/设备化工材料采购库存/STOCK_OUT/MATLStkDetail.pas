unit MATLStkDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ADODB;

type
  TFrmWIPStkDetail = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWIPStkDetail: TFrmWIPStkDetail;

implementation

{$R *.dfm}
uses Main;

procedure TFrmWIPStkDetail.DBGrid1DblClick(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TFrmWIPStkDetail.BitBtn1Click(Sender: TObject);
begin
  if FrmMain.ADOStockDetail.Eof then exit;
  modalresult:=mrok;
end;

end.
