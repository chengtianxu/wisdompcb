unit UEvaluate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEva_Form = class(TForm)
    Panel1: TPanel;
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
  Eva_Form: TEva_Form;

implementation

{$R *.dfm}

procedure TEva_Form.BitBtn1Click(Sender: TObject);
begin
  if trim(Memo1.Text)='' then
  begin
    showmessage('«Î ‰»Î…Û∫À∆¿º€...');
    exit;
  end;
  modalresult:=mrok;
end;

end.
