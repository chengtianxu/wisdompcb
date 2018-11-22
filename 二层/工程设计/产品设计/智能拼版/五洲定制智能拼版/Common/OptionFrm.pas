unit OptionFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TfrmOption = class(TForm)
    cbxPnlRotate: TCheckBox;
    GroupBox1: TGroupBox;
    cbxbb: TCheckBox;
    cbxXDK: TCheckBox;
    cbxPXGG: TCheckBox;
    cbxJDK: TCheckBox;
    GroupBox2: TGroupBox;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    se3mm: TSpinEdit;
    se6mm: TSpinEdit;
    rgZKPos: TRadioGroup;
    btnOK: TButton;
    btnCancel: TButton;
    edtZK3mmLength: TEdit;
    edtZK6mmLength: TEdit;
    cbxSetRotate: TCheckBox;
    cbxDoubleCut: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtZK3mmLengthExit(Sender: TObject);
    procedure SaveToDefParam;
    procedure LoadFromDefParam;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

  function ShowOptionFrm(AOwner: TComponent): Boolean;

implementation

uses
  IniFiles;

{$R *.dfm}
function ShowOptionFrm(AOwner: TComponent): Boolean;
var
  frmOption: TfrmOption;
begin
  Result := True;
  frmOption := TfrmOption.Create(AOwner);
  try

  finally
    frmOption.Free;
  end;
end;

procedure TfrmOption.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmOption.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmOption.edtZK3mmLengthExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWhite;
  try
    StrToFloat((Sender as TEdit).Text);
  except
    ShowMessage('输入参数的值错误!');
    (Sender as TEdit).SetFocus;
  end;
end;

procedure TfrmOption.LoadFromDefParam;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+'PinBan.ini');
  try
    cbxPnlRotate.Checked := LIni.ReadInteger('CustomDef','PnlASelfRotate',0) = 1;
    cbxbb.Checked := LIni.ReadInteger('CustomDef','BaBiaoKong',0) = 1;
    cbxPXGG.Checked := LIni.ReadInteger('CustomDef','PengXiGuaGouKong',0) = 1;
    cbxXDK.Checked := LIni.ReadInteger('CustomDef','XiaoDingKong',0) = 1;
    cbxJDK.Checked := LIni.ReadInteger('CustomDef','JiaoDuiKong',0) = 1;
    se3mm.Value := LIni.ReadInteger('CustomDef','100mmX3mmZuKang',0);
    se6mm.Value := LIni.ReadInteger('CustomDef','100mmX6mmZuKang',0);
    rgZKPos.ItemIndex := LIni.ReadInteger('CustomDef','ZKPos',0);
    edtZK3mmLength.Text := LIni.ReadString('CustomDef','ZK3mmLength','100');
    edtZK6mmLength.Text := LIni.ReadString('CustomDef','ZK6mmLength','100');
    cbxSetRotate.Checked := LIni.ReadInteger('CustomDef','SetRotate',0) = 1;
    cbxDoubleCut.Checked := LIni.ReadInteger('CustomDef','DoubleCut',0) = 1;

  finally
    LIni.Free;
  end;
end;

procedure TfrmOption.SaveToDefParam;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+'PinBan.ini');
  try
    if cbxPnlRotate.Checked then
      LIni.WriteInteger('CustomDef','PnlASelfRotate',1)
    else
      LIni.WriteInteger('CustomDef','PnlASelfRotate',0);

    if cbxbb.Checked then
      LIni.WriteInteger('CustomDef','BaBiaoKong',1)
    else
      LIni.WriteInteger('CustomDef','BaBiaoKong',0);

    if cbxPXGG.Checked then
      LIni.WriteInteger('CustomDef','PengXiGuaGouKong',1)
    else
      LIni.WriteInteger('CustomDef','PengXiGuaGouKong',0);

    if cbxXDK.Checked then
      LIni.WriteInteger('CustomDef','XiaoDingKong',1)
    else
      LIni.WriteInteger('CustomDef','XiaoDingKong',0);

    if cbxJDK.Checked then
      LIni.WriteInteger('CustomDef','JiaoDuiKong',1)
    else
      LIni.WriteInteger('CustomDef','JiaoDuiKong',0);

    if cbxSetRotate.Checked then
      LIni.WriteInteger('CustomDef','SetRotate',1)
    else
      LIni.WriteInteger('CustomDef','SetRotate',0);

    if cbxDoubleCut.Checked then
      LIni.WriteInteger('CustomDef','DoubleCut',1)
    else
      LIni.WriteInteger('CustomDef','DoubleCut',0);

    LIni.WriteInteger('CustomDef','100mmX3mmZuKang',se3mm.Value);
    LIni.WriteInteger('CustomDef','100mmX6mmZuKang',se6mm.Value);
    LIni.WriteInteger('CustomDef','ZKPos',rgZKPos.ItemIndex);
    LIni.WriteString('CustomDef','ZK3mmLength',edtZK3mmLength.Text);
    LIni.WriteString('CustomDef','ZK6mmLength',edtZK6mmLength.Text);
  finally
    LIni.Free;
  end;
end;

end.
