unit AddCertificate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,Pick_Item_Single,ConstVar,common;

type
  TFrm_AddCertificate = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    rdo1: TRadioButton;
    rdo2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox2: TComboBox;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure rdo1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    status:Integer;
    types:Integer;
  end;

var
  Frm_AddCertificate: TFrm_AddCertificate;

implementation

uses dmo;

{$R *.dfm}

procedure TFrm_AddCertificate.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(Application);
  try
    InputVar.Fields := 'employeecode/员工编号/200,chinesename/员工姓名/200';
    InputVar.Sqlstr :='select rkey,chinesename,employeecode from employeemsg';
    InputVar.AdoConn := DM.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      Edit1.Text := frmPick_Item_Single.adsPick.FieldValues['chinesename'];
      Edit2.SetFocus;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_AddCertificate.Edit1Exit(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
  begin
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,chinesename,employeecode from employeemsg where chinesename='''+trim(Edit1.Text)+'''';
      Open;
      if IsEmpty then
      begin
        ShowMessage('没有这个员工，请重新输入或选择');
        Edit1.SetFocus;
        Exit;

      end
      else
      begin
        Edit1.Tag := FieldValues['RKEY'];
        Edit1.Text := FieldValues['chinesename'];
//        Edit2.SetFocus;
      end;
    end;
  end;
end;

procedure TFrm_AddCertificate.BitBtn1Enter(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('证书员工姓名不能为空');
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(Edit2.Text)='' then
  begin
    ShowMessage('证书编号不能为空');
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(ComboBox1.Text)='' then
  begin
    ShowMessage('证书名称不能为空');
    ComboBox1.SetFocus;
    Exit;
  end;
  if Trim(ComboBox2.Text)='' then
  begin
    ShowMessage('证书性质不能为空');
    ComboBox2.SetFocus;
    Exit;
  end;
  if dtpk1.Date=dtpk2.Date then
  begin
    ShowMessage('生效日期不能大于失效日期');
    dtpk2.SetFocus;
    Exit;
  end;
  if (not(rdo1.Checked)) and (not(rdo2.Checked)) then
  begin
    ShowMessage('请选择证书有效性');
    GroupBox1.SetFocus;
    Exit;
  end;
end;

procedure TFrm_AddCertificate.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_AddCertificate.BitBtn1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_AddCertificate.ComboBox1Change(Sender: TObject);
begin
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,dictid,item from datadetail where item='''+trim(ComboBox1.Text)+'''';
    Open;
    Label9.Tag:=FieldValues['rkey'];
  end;
end;

procedure TFrm_AddCertificate.rdo1Click(Sender: TObject);
begin
  if rdo1.Checked then
    status:=1;
  if rdo2.Checked then
    status:=0;
end;

procedure TFrm_AddCertificate.ComboBox2Change(Sender: TObject);
begin
  if ComboBox2.ItemIndex=0 then
    types:=0
  else
    types:=1;
end;

end.
