unit Remark_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons;

type
  TfrmRemark_Mod280 = class(TfrmBase)
    mmoRemark: TMemo;
    btnCancel: TBitBtn;
    btnSure: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    Bln:boolean;
  public
    { Public declarations }
  end;

var
  frmRemark_Mod280: TfrmRemark_Mod280;

implementation

{$R *.dfm}

procedure TfrmRemark_Mod280.btnCancelClick(Sender: TObject);
begin
  inherited;
  Bln:=true;
end;

procedure TfrmRemark_Mod280.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if btnSure.Enabled and (trim(mmoRemark.Text)='') and not Bln then
  begin
    CanClose:=false;
    showmessage('请输入退回原因...');
  end
  else
    CanClose:=true;
end;

end.
