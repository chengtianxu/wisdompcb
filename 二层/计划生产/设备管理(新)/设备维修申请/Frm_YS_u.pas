unit Frm_YS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFrm_YS = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PDValiDate: TDateTimePicker;
    EdtValMan: TEdit;
    CBAppr: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses common,damo;
{$R *.dfm}

procedure TFrm_YS.BitBtn1Click(Sender: TObject);
begin
  if CBAppr.Text='' then
  begin
    showmessage('请输入验收评价...');
    exit;
  end;
  modalresult:=mrok;
end;

procedure TFrm_YS.BitBtn2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

end.
