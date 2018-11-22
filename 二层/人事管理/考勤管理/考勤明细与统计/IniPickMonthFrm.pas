unit IniPickMonthFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmIniPickMonth = class(TForm)
    btnOK: TButton;
    btn2: TButton;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    procedure btnOKClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIniPickMonth: TfrmIniPickMonth;

implementation

{$R *.dfm}

procedure TfrmIniPickMonth.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmIniPickMonth.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmIniPickMonth.FormShow(Sender: TObject);
begin
dtp1.Date := now;//DM1.GetServerTime;  20160421modi 
end;

end.
