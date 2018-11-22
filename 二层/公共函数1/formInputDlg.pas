unit formInputDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmInputDlg = class(TForm)
    btn_OK: TButton;
    Button2: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    procedure btn_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Function InputDlg(AHandle:THandle;AFormCaption:string;ALabelCaption:string;
                  out ResultString:string;DefaultValue:string=''):Boolean; StdCall;
var
  frmInputDlg: TfrmInputDlg;

implementation

{$R *.dfm}

Function InputDlg(AHandle:THandle;AFormCaption:string;ALabelCaption:string;
                  out ResultString:string;DefaultValue:string=''):Boolean; StdCall;
//var
////  s:string;
//  i:Integer;
begin
  Result:=False;
  Application.Handle:=AHandle;
  try
    frmInputDlg:=TfrmInputDlg.Create(Application);
    with  frmInputDlg do
    begin
      Caption:=AFormCaption;
      Label1.Caption:=ALabelCaption;
      Memo1.Text:= DefaultValue;
      if ShowModal=mrOk then
      begin
        ResultString:=Memo1.Text;
        Result:=True;
      end;
    end ;
  finally
    frmInputDlg.Free;
  end;
end;

procedure TfrmInputDlg.btn_OKClick(Sender: TObject);
begin
  if Memo1.Text='' then
  Exit;

  ModalResult:=mrOk;
end;

procedure TfrmInputDlg.FormShow(Sender: TObject);
begin
  Memo1.SetFocus;
end;

procedure TfrmInputDlg.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  if Trim(Memo1.Text)<>'' then
  begin
    Key:=Char(0) ;
    btn_OKClick( btn_OK);
  end;
end;

end.
