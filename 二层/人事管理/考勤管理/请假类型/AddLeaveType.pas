unit AddLeaveType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons,DB;

type
  TForm_AddLeaveType = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    DBEdit2: TDBEdit;
    CheckBox1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  i:Integer;
  end;

var
  Form_AddLeaveType: TForm_AddLeaveType;

implementation

uses dmo;

{$R *.dfm}

procedure TForm_AddLeaveType.BitBtn2Click(Sender: TObject);
begin
  DM.ADOAskForLeave.Cancel;
  Close;
end;

procedure TForm_AddLeaveType.BitBtn1Click(Sender: TObject);
var
  rkey:Integer;
begin
  if Trim(DBEdit1.Text)='' then
  begin
    ShowMessage('缺勤名称不能为空，请输入缺勤名称');
    DBEdit1.SetFocus;
    Exit;
  end;
  if Trim(DBEdit2.Text)='' then
  begin
    ShowMessage('精度不能为空，请输入精度');
    DBEdit2.SetFocus;
    Exit;
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select rkey from datadetail where item='''+ComboBox1.Text+'''');
    Active:=True;
    rkey:=FieldValues['rkey'];
  end;
  DM.ADOAskForLeaveunit.Value:=rkey;
  if CheckBox1.Checked then
    DM.ADOAskForLeaveworktime_calculation.Value:=True
  else
    DM.ADOAskForLeaveworktime_calculation.Value:=False;
  DM.ADOAskForLeaveremark.Value:=Memo1.Lines.Text;
  DM.ADOAskForLeave.Post;
  i:=DM.ADOAskForLeave.RecNo;
  ModalResult:=mrOk;
end;

procedure TForm_AddLeaveType.ComboBox1Change(Sender: TObject);
begin
  with DM.ADODetail do
  begin
    Close;
    DM.ADODetail.Parameters[0].Value:=Trim(ComboBox1.Text);
    Open;
    DM.ADOAskForLeaveUnit.Value:=DM.ADODetailrkey.Value;
  end;
end;

end.
