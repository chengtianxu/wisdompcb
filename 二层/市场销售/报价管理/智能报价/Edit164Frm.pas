unit Edit164Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfrmEdit164 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    edtPtr: TEdit;
    btn1: TButton;
    btn2: TButton;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    mmoEnableStr: TMemo;
    mmoValueStr: TMemo;
    rgAddType: TRadioGroup;
    ts3: TTabSheet;
    rgAddTypeTotal: TRadioGroup;
    rgAddTypeEng: TRadioGroup;
    mmoValueStrEng: TMemo;
    ts4: TTabSheet;
    mmoValueStrTotal: TMemo;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmEdit164.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEdit164.btn1Click(Sender: TObject);
begin
  if Trim(edtPtr.Text) = '' then
  begin
    ShowMessage('加价名称不能为空');
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
