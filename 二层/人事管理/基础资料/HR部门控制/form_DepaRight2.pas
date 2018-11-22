unit form_DepaRight2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  Menus, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider,
  ADODB, dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin,
  ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar;

type
  Tfrm_DepaRight2 = class(TSingleDataSet_f)
    cdsMainUSER_LOGIN_NAME: TStringField;
    cdsMainUSER_FULL_NAME: TStringField;
    cdsMaindepartmentname: TWideStringField;
    cdsMaindepartmentcode: TWideStringField;
    cdsMainDESCRIPTION: TStringField;
    cdsMainPROGRAME: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainoperator_ptr: TIntegerField;
    cdsMaindepartmentid: TIntegerField;
    cdsMainprogram_ptr: TIntegerField;
    dtMainUSER_LOGIN_NAME: TStringField;
    dtMainUSER_FULL_NAME: TStringField;
    dtMaindepartmentname: TWideStringField;
    dtMaindepartmentcode: TWideStringField;
    dtMainDESCRIPTION: TStringField;
    dtMainPROGRAME: TStringField;
    dtMainrkey: TAutoIncField;
    dtMainoperator_ptr: TIntegerField;
    dtMaindepartmentid: TIntegerField;
    dtMainprogram_ptr: TIntegerField;
    procedure FormCreate(Sender: TObject);
  private
    procedure RightsSetDataSetReadOnly;override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DepaRight2: Tfrm_DepaRight2;

implementation

uses form_DepaRight1, PublicFile;

{$R *.dfm}

procedure Tfrm_DepaRight2.FormCreate(Sender: TObject);
begin
  inherited; 
  FindDisplayFields:=varArrayOf(['departmentname','departmentcode','DESCRIPTION','PROGRAME']);
end;

procedure Tfrm_DepaRight2.RightsSetDataSetReadOnly;
begin
  if (StrToInt(vprev) in [2,3,4]) then
  begin
    cdsMain.ReadOnly:=False;
  end
  else
  begin
    cdsMain.ReadOnly:=True;
  end;
   DghMain.ReadOnly:=True;
end;
end.
