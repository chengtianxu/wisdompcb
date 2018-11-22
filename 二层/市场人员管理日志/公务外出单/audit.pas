unit audit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TForm_Audit = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Audit: TForm_Audit;

implementation
uses common,detail, demo;
{$R *.dfm}

procedure TForm_Audit.BitBtn1Click(Sender: TObject);
begin
  if trim(Memo1.Text)='' then
  begin
    showmessage('«Î ‰»Î…Û∫À±∏◊¢!');
    exit;
  end;
  modalresult:=mrok;
end;
end.
