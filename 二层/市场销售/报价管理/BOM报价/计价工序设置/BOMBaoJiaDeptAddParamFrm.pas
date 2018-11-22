unit BOMBaoJiaDeptAddParamFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzLabel, DM;

type
  TfrmBOMBaoJiaDeptAddParam = class(TForm)
    lbl1: TRzLabel;
    edt1: TRzEdit;
    btn1: TSpeedButton;
    lbl2: TRzLabel;
    edt2: TRzEdit;
    btn2: TRzButton;
    btn3: TRzButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FParamType: string;
  end;

var
  frmBOMBaoJiaDeptAddParam: TfrmBOMBaoJiaDeptAddParam;

implementation

uses
  Pick_Item_Single;

{$R *.dfm}

procedure TfrmBOMBaoJiaDeptAddParam.btn1Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  if FParamType = '' then FParamType := '3';
  LIn.Fields := 'parameter_Name/参数代码/150,parameter_Desc/参数名称/150';
  LIn.Sqlstr := 'select rkey,parameter_name,parameter_desc from data0278 where CATEGORY_PTR = ' + FParamType;
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      edt1.Text := LFrm.adsPick1.FieldByName('parameter_name').AsString;
      edt1.Tag := LFrm.adsPick1.FieldByName('rkey').AsInteger;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptAddParam.btn2Click(Sender: TObject);
begin
  if edt1.Tag = 0 then
  begin
    ShowMessage('参数不能为空');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmBOMBaoJiaDeptAddParam.btn3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
