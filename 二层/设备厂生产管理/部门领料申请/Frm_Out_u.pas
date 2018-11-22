unit Frm_Out_u;

interface

uses
  SysUtils, Classes, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrm_out = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Edit6: TEdit;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_out: TFrm_out;

implementation

{$R *.dfm}

procedure TFrm_out.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
  begin
    key:=#0;
    abort;
  end;
end;

procedure TFrm_out.BitBtn2Click(Sender: TObject);
begin
  if strtofloat('0'+trim(edit5.Text))=0 then
  begin
    showmessage('出库数量不能为0...');
    edit5.SetFocus;
    exit;
  end;
  modalresult:=mrok;
end;                         

procedure TFrm_out.Edit5Change(Sender: TObject);
begin
  if StrToFloat(Edit5.Text) > StrToFloat(Edit6.Text) then
    Edit5.Text := Edit6.Text  ;
end;

end.
