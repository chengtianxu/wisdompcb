unit AddTypeDeptFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Samples.Spin, RzButton,
  Vcl.StdCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Data.DB, Datasnap.DBClient, GridsEh, DBAxisGridsEh, DBGridEh, RzCmboBx,
  RzLabel, Vcl.ExtCtrls, RzPanel;

type
  TfrmAddTypeDept = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    se1: TSpinEdit;
    btn3: TSpeedButton;
    btn2: TRzButton;
    btn1: TRzButton;
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDKeyBp02: string;
  end;

implementation

uses
  Pick_Item_Single, DM;

{$R *.dfm}

procedure TfrmAddTypeDept.btn1Click(Sender: TObject);
begin
  if edt1.Tag = 0 then
  begin
    ShowMessage('工序不能为空');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmAddTypeDept.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddTypeDept.btn3Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'dept_code/工序代码/150,dept_name/工序名称/150';
  LIn.Sqlstr := 'select IDKey,data0034.rkey as rkey34,dept_code,Dept_name from bomprice02,data0034 where bomprice02.d34_ptr = data0034.rkey';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      edt1.Text := LFrm.adsPick1.FieldByName('dept_code').AsString;
      edt1.Tag := LFrm.adsPick1.FieldByName('rkey34').AsInteger;
      FIDKeyBp02 := LFrm.adsPick1.FieldByName('IDKey').AsString;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
