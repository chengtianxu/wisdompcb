unit RetnMATL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFrmRetnMATL = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRetnMATL: TFrmRetnMATL;

implementation

{$R *.dfm}
uses Main;

procedure TFrmRetnMATL.FormCreate(Sender: TObject);
begin
  with stringgrid1 do
  begin
    cells[0,0]:='材料代号';
    cells[1,0]:='厂房';
    cells[2,0]:='位置';
    cells[3,0]:='Barcode号';
    cells[4,0]:='发出数量';
    cells[5,0]:='替换比';
  end;
end;

procedure TFrmRetnMATL.StringGrid1DblClick(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TFrmRetnMATL.BitBtn1Click(Sender: TObject);
begin
  if FrmMain.AdoData0207.RecordCount=0 then exit;
  modalresult:=mrok;
end;

end.
