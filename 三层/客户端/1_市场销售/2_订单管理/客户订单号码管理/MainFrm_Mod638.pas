unit MainFrm_Mod638;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.Provider, Data.Win.ADODB,
  Data.DB, Vcl.Menus, Vcl.XPMan, Datasnap.DBClient, Vcl.ExtCtrls,
  uBaseMainFrm, DBGridEhGrouping,ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,DBAxisGridsEh, DBGridEh ,uCommFunc,
  Bde.DBTables;

type
  TFrmMain_Mod638 = class(TfrmBaseMain)
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);

  private
  LEDate:TDateTime;
    { Private declarations }
  public
   procedure GetData(); override;
    { Public declarations }
  end;

var
  FrmMain_Mod638: TFrmMain_Mod638;

implementation

 uses  Editfrm_Mod638,System.StrUtils;
{$R *.dfm}
 procedure TFrmMain_Mod638.GetData;
 begin
  FMainFrmSql := cdsMain.CommandText;
   if trim(FMainWhere) = '' then
        FMainWhere := ' and t97.PO_DATE >= '''+formatdatetime('yyyy-MM-dd hh:mm:ss',gFunc.GetSvrDateTime()-30)+''' '+
                       ' and  t97.PO_DATE <='''+formatdatetime('yyyy-MM-dd hh:mm:ss',gFunc.GetSvrDateTime()+1)+'''  ' ;
  FOrderby:= 'ORDER BY t97.PO_NUMBER';
 inherited;
 end;


procedure TFrmMain_Mod638.N1Click(Sender: TObject);
var
 LFrm:TfrmEdit_mod638;
begin
  inherited;
//  if not gFunc.CheckUserAuth(11,638) then  exit;
  LFrm:= TfrmEdit_mod638.Create(nil);
  try
    LFrm.FDetailType:= 0;
    frmEdit_mod638.GetData('0');
//    frmEdit_mod638.DtpReqDate.DateTime:=dateof(gFunc.GetSvrDateTime);
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmMain_Mod638.N2Click(Sender: TObject);
begin
  inherited;
    frmEdit_mod638 := TfrmEdit_mod638.Create(Self);
  try

  frmEdit_mod638.FDetailType:=2;
  frmEdit_mod638.getData(cdsMain.FieldByName('rkey').AsString);
  frmEdit_mod638.Edit3.Text:=cdsMain.FieldByName('PO_NUMBER').AsString;
  frmEdit_mod638.Edit1.Text:=cdsMain.FieldByName('OPEN_SOS').AsString;
  frmEdit_mod638.DtpReqDate.DateTime:=cdsMain.FieldByName('po_DATE').AsDateTime;
  if frmEdit_mod638.showmodal=mrok then
  begin
  btnRefreshClick(Sender);
  cdsMain.Last;
  end;
  finally
  frmEdit_mod638.Free;
end;
end;

end.
