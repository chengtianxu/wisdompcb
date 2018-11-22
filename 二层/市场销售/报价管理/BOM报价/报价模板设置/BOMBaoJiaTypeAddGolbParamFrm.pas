unit BOMBaoJiaTypeAddGolbParamFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, DBImpl,DataIntf;

type
  TfrmBOMBaoJiaTypeAddGolbParam = class(TForm)
    lbl1: TLabel;
    cdsBP00: TClientDataSet;
    cdsBP05: TClientDataSet;
    btn1: TButton;
    btn2: TButton;
    edt1: TEdit;
    btn3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    FBp00: IData;
    FBp05: IData;
  public
    { Public declarations }
    procedure GetData;
  end;

implementation
uses
  Pick_Item_Single, DM;
{$R *.dfm}

procedure TfrmBOMBaoJiaTypeAddGolbParam.btn1Click(Sender: TObject);
begin
  if (edt1.Text = '') or (edt1.Tag = 0) then
  begin
    ShowMessage('请选择参数');
    Exit;
  end;

  cdsBP00.First;
  while not cdsBP00.Eof do
  begin
    if not cdsBP05.Locate('bp00_ptr;D278_ptr',varArrayOf([cdsBP00.FieldByName('idkey').AsString,edt1.Tag]),[loCaseInsensitive]) then
    begin
      cdsBP05.Append;
      cdsBP05.FieldByName('IDKey').AsString := FBP05.CreateKeyID;
      cdsBP05.FieldByName('bp00_ptr').AsString := cdsBP00.FieldByName('idkey').AsString;
      cdsBP05.FieldByName('D278_ptr').AsInteger := edt1.Tag;
      cdsBP05.Post;
    end;
    cdsBP00.Next;
  end;

  if PostdataByInterface(cdsBP05,FBp05) then
  begin
    cdsBP05.MergeChangeLog;
    ShowMessage('保存成功');
    ModalResult := mrOk;
  end else
  begin
    ShowMessage('保存失败');
    Exit;
  end;
end;

procedure TfrmBOMBaoJiaTypeAddGolbParam.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBOMBaoJiaTypeAddGolbParam.btn3Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
begin
  LIn.Fields := 'parameter_Name/参数代码/150,parameter_Desc/参数名称/150';
  LIn.Sqlstr := 'select rkey,parameter_name,parameter_desc from data0278 where BomPriceType = 1';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      edt1.Tag := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      edt1.Text := LFrm.adsPick1.FieldByName('parameter_Name').AsString;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaTypeAddGolbParam.FormCreate(Sender: TObject);
begin
  FBp00 := TBP00.Create;
  FBp05 := TBP05.Create;
end;

procedure TfrmBOMBaoJiaTypeAddGolbParam.GetData;
begin
  FBp00.SetSql('select idkey from bomprice00');
  cdsBP00.Data := FBp00.GetData;

  FBp05.SetSql('select * from bomprice05');
  cdsBP05.Data := FBp05.GetData;
end;

end.
