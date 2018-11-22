unit formPlanMain3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Menus;

type
  TfrmPlanMain3 = class(TSingleDataSet_f)
    cdsMainRkey: TAutoIncField;
    cdsMainWork_ptr: TIntegerField;
    cdsMainstop_begin_date: TDateTimeField;
    cdsMainstop_end_date: TDateTimeField;
    cdsMainremark: TWideStringField;
    dtMainRkey: TAutoIncField;
    dtMainWork_ptr: TIntegerField;
    dtMainstop_begin_date: TDateTimeField;
    dtMainstop_end_date: TDateTimeField;
    dtMainremark: TWideStringField;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DghMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure SetButtonStatus;override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanMain3: TfrmPlanMain3;

implementation

uses formPlanMain, PublicFile;

{$R *.dfm}

procedure TfrmPlanMain3.SetButtonStatus;
begin
  if frmPlanMain.cdsMainRKEY832.AsInteger=3  then   //3 =执行中
  begin
    Button2.Enabled:=True ;
    Button3.Enabled:=False;
  end
  else
  if frmPlanMain.cdsMainRKEY832.AsInteger=6  then
  begin
    Button2.Enabled:=False ;
    Button3.Enabled:=True;
  end
end;

procedure TfrmPlanMain3.Button2Click(Sender: TObject);
begin
  inherited;
  if (frmPlanMain.cdsChildStatus.AsInteger=3) then
  begin
    with cdsMain do
    begin
      if  State   <>dsInsert  then
        Append;
      FieldByName('work_ptr').Value           := frmPlanMain. cdsChildrkey.Value;
      FieldByName('stop_begin_date').Value    := GetDataBaseDate(cdsRead,1);
 //     Post;
    end;
  end;
end;

procedure TfrmPlanMain3.Button3Click(Sender: TObject);
begin
  inherited;
  with cdsMain do
  begin
    Last;
    if  FieldByName('stop_end_date').IsNull then
    begin
      if  State   <>dsEdit  then
        Edit;
      FieldByName('stop_end_date').Value   := GetDataBaseDate(cdsRead,1);
      Post;
    end;
  end;
end;

procedure TfrmPlanMain3.DghMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end
  else
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;
end;

end.
