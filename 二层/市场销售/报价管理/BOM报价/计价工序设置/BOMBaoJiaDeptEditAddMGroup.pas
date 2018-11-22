unit BOMBaoJiaDeptEditAddMGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.Buttons, Vcl.StdCtrls,
  RzEdit, Vcl.Mask, RzLabel, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmBOMBaoJiaDeptEditMGroup = class(TForm)
    pnl1: TPanel;
    btn3: TRzButton;
    btn2: TRzButton;
    pnl2: TPanel;
    btn1: TSpeedButton;
    edt1: TRzEdit;
    lbl1: TRzLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    lbl2: TRzLabel;
    mmoUseCalc: TRzMemo;
    lbl3: TRzLabel;
    mmoMPCalc: TRzMemo;
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBOMBaoJiaDeptEditMGroup: TfrmBOMBaoJiaDeptEditMGroup;

implementation

uses
  Pick_Item_Single, DM, WZ_gUnit;

{$R *.dfm}

procedure TfrmBOMBaoJiaDeptEditMGroup.btn1Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'GROUP_NAME/类别代码/150,GROUP_DESC/类别名称/150';
  LIn.Sqlstr := 'select rkey,GROUP_NAME,GROUP_DESC from data0496';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      edt1.Text := LFrm.adsPick1.FieldByName('GROUP_NAME').AsString;
      edt1.Tag := LFrm.adsPick1.FieldByName('rkey').AsInteger;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptEditMGroup.btn2Click(Sender: TObject);
begin
  if edt1.Tag = 0 then
  begin
    ShowMessage('材料类型不能为空');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmBOMBaoJiaDeptEditMGroup.btn3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBOMBaoJiaDeptEditMGroup.FormShow(Sender: TObject);
begin
  btn2.Enabled := gUser.User_Permit = '4';
end;

end.
