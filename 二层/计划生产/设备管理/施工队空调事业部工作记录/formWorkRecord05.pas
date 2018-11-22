unit formWorkRecord05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  Menus, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider,
  ADODB, dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin,
  ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Buttons;

type
  TfrmWorkRecord05 = class(TSingleDataSet_f)
    cdsMainCDSDesigner: TStringField;
    cdsMainCDSDesigner2: TStringField;
    cdsMainCDSDesigner3: TStringField;
    cdsMainCDSDesigner4: TStringField;
    cdsMainCDSDesigner5: TStringField;
    cdsMainCDSDesigner6: TStringField;
    cdsMainCDSDesigner7: TStringField;
    cdsMainCDSDesigner8: TDateTimeField;
    cdsMainCDSDesigner9: TStringField;
    cdsMainCDSDesigner10: TDateTimeField;
    cdsMainCDSDesigner11: TIntegerField;
    cdsMainCDSDesigner12: TBCDField;
    cdsMainCDSDesigner13: TBCDField;
    cdsMainCDSDesigner14: TBCDField;
    cdsMainCDSDesigner15: TDateTimeField;
    cdsMainCDSDesigner16: TStringField;
    cdsMainCDSDesigner17: TStringField;
    cdsMainCDSDesigner18: TStringField;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label2: TLabel;
    dteEnd: TDateTimePicker;
    dteBegin: TDateTimePicker;
    dteBeginTime: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Edit2: TEdit;
    Panel8: TPanel;
    BtFind: TSpeedButton;
    dteEndTime: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure BtFindClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure dteBeginChange(Sender: TObject);
    procedure dteEndChange(Sender: TObject);
  private
    procedure RightsSetDataSetReadOnly;override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWorkRecord05: TfrmWorkRecord05;

implementation

uses PublicFile;

{$R *.dfm}

procedure TfrmWorkRecord05.RightsSetDataSetReadOnly;
begin
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

procedure TfrmWorkRecord05.FormCreate(Sender: TObject);
var
  CurrentMonth:TDateTime;
begin
  inherited;
  CurrentMonth:=StrToDate(SQLResultValue(cdsRead,
            'select cast(DATEPART(yy,getdate())as varchar(10))+''-''+cast(DATEPART(MM,getdate())as varchar(10))+''-''+''01'''));
  dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
  dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(dteBegin.Date,1)));
  dteBeginChange(nil);
  dteEndChange(nil);
  Edit2Change(nil);
  BtFindClick(nil);
end;

procedure TfrmWorkRecord05.BtFindClick(Sender: TObject);
begin
  inherited;
  cdsMain.Close;
  cdsMain.Open;
end;

procedure TfrmWorkRecord05.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#13,#8]) then    //  ,#46 =Ð¡Êýµã
  key := #0;
end;

procedure TfrmWorkRecord05.Edit2Change(Sender: TObject);
begin
  inherited;
  cdsMain.Params.ParamByName('IntervalDay').Value:=StrToInt(Edit2.Text) ;
end;

procedure TfrmWorkRecord05.dteBeginChange(Sender: TObject);
begin
  inherited;
    cdsMain.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
end;

procedure TfrmWorkRecord05.dteEndChange(Sender: TObject);
begin
  inherited;
    cdsMain.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
end;

end.
