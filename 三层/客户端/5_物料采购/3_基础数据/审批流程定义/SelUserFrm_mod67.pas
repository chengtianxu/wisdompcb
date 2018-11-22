unit SelUserFrm_mod67;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseSinglePickListFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
   TFrmSelUser_mod67= class;
   TFrmCallBack_Mod67 = procedure(AFrm: TFrmSelUser_mod67) of object;

  TfrmSelUser_mod67 = class(TfrmSinglePickList)
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FParentCallBack: TFrmCallBack_Mod67;
  end;

var
  frmSelUser_mod67: TfrmSelUser_mod67;

implementation

{$R *.dfm}

procedure TfrmSelUser_mod67.btnOKClick(Sender: TObject);
begin
 if Assigned(FParentCallBack) then
    FParentCallBack(Self);

  inherited;
end;

end.
