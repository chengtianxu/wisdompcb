unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DataSource1: TDataSource;
    Eh1: TDBGridEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public
  end;

var
  Frm_detail: TFrm_detail;

implementation

uses common;

{$R *.dfm}

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
begin
  if (not DataSource1.DataSet.IsEmpty) then Export_dbGridEH_to_Excel(eh1,tabsheet1.Caption);
end;

procedure TFrm_detail.Eh1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then showmessage(Tadoquery(DataSource1.DataSet).SQL.Text);
end;

procedure TFrm_detail.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
