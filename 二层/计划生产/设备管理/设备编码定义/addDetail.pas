unit addDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFrm_addDetail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Enter(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_addDetail: TFrm_addDetail;

implementation

uses units, dmo;

{$R *.dfm}

procedure TFrm_addDetail.BitBtn1Click(Sender: TObject);
begin
  Frm_units:=TFrm_units.Create(Application);
  with Frm_units.ADO02 do
  begin
    Close;
    Parameters[0].Value:='';
    if Trim(Edit4.Text)<>'' then
      Parameters[0].Value:=Trim(Edit4.Text)
    else
      Parameters[0].Value:='';
    Open;
    if IsEmpty then
    begin
      ShowMessage('请输入正确的单位');
      Edit4.SetFocus;
      Edit;
    end;
  end;
  if Frm_units.ShowModal=mrok then
  begin
    Edit4.Text:=Frm_units.ADO02unit_name.Value;
    Edit4.Tag:=Frm_units.ADO02rkey.Value;
  end;
end;

procedure TFrm_addDetail.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_addDetail.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_addDetail.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
end;

procedure TFrm_addDetail.Button1Enter(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('附属设备名称不能为空');
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(Edit2.Text)='' then
  begin
    ShowMessage('序号不能为空');
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(Edit3.Text)='' then
  begin
    ShowMessage('数量不能为空');
    Edit3.SetFocus;
    Exit;
  end;
  if Trim(Edit3.Text)='0' then
  begin
    ShowMessage('数量不能为零');
    Edit3.SetFocus;
    Exit;
  end;
  if Trim(Edit4.Text)='' then
  begin
    ShowMessage('单位不能空');
    Edit4.SetFocus;
    Exit;
  end;
end;

procedure TFrm_addDetail.Edit4Exit(Sender: TObject);
begin
  if Trim(Edit4.Text)<>'' then
  begin
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select rkey,unit_name from data0002 where unit_name='''+trim(Edit4.Text)+'''');
      Active:=True;
      if IsEmpty then
      begin
        ShowMessage('请输入正确的单位');
        Edit4.SetFocus;
        Exit;
      end
      else
      begin
        Edit4.Text:=FieldValues['unit_name'];
        Edit4.Tag:=FieldValues['rkey'];
      end;
    end;
  end;
end;

procedure TFrm_addDetail.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
    abort;
end;

end.
