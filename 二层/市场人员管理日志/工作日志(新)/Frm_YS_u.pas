unit Frm_YS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFrm_YS = class(TForm)
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses common,DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_YS.BitBtn1Click(Sender: TObject);
begin
  if trim(Memo1.Text)='' then
  begin
    showmessage('«Î ‰»Î…Û∫À∆¿º€...');
    exit;
  end;
  modalresult:=mrok;
end;

end.
