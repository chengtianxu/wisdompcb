unit SelUserFrm_mod25;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseSinglePickListFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
   TFrmSelUser_mod25 = class;
   TFrmCallBack_Mod25 = procedure(AFrm: TFrmSelUser_mod25) of object;

  TFrmSelUser_mod25 = class(TfrmSinglePickList)
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     FParentCallBack: TFrmCallBack_Mod25;
     FUserListStr:string;
  end;

var
  FrmSelUser_mod25: TFrmSelUser_mod25;

implementation

{$R *.dfm}

procedure TFrmSelUser_mod25.btnOKClick(Sender: TObject);
begin

   if Assigned(FParentCallBack) then
    FParentCallBack(Self);

  inherited;

end;

end.
