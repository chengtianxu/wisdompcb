unit PasCollect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmCollect = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SG1: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCollect: TFrmCollect;

implementation
uses common;
{$R *.dfm}

procedure TFrmCollect.BitBtn1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TFrmCollect.BitBtn2Click(Sender: TObject);
begin
  Export_Grid_to_Excel(SG1,Self.Caption);
end;

procedure TFrmCollect.SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  {文字居中}
  with Sender as TStringGrid do
  begin
    Canvas.FillRect(Rect);
    Canvas.Font.Size:=10;
    DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), Length(Cells[ACol, ARow]), Rect, DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;
  {文字居中结束}
end;

end.
