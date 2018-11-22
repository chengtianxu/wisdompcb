unit PasCollect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DBGridEh, Menus;

type
  TFrmCollect = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1d34Rkey: TAutoIncField;
    ADOQuery1iTotal: TIntegerField;
    ADOQuery1iPunctual: TIntegerField;
    ADOQuery1dOverlay: TBCDField;
    DataSource1: TDataSource;
    ADOQuery1dOnceFulfille: TBCDField;
    ADOQuery1OverlayFulfille: TBCDField;
    ADOQuery1iPunctual2: TIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCollect: TFrmCollect;

implementation
uses common, main;
{$R *.dfm}

procedure TFrmCollect.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

procedure TFrmCollect.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADOQuery1.SQL.Text);
end;

procedure TFrmCollect.BitBtn1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

end.
