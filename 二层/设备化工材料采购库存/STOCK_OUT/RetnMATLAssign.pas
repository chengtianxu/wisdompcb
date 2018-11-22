unit RetnMATLAssign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFrmRetnAssigning = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRetnAssigning: TFrmRetnAssigning;

implementation
uses Main;
{$R *.dfm}

procedure TFrmRetnAssigning.FormShow(Sender: TObject);
begin
  Maskedit1.SelectAll ;
  Maskedit1.SetFocus ;
end;

procedure TFrmRetnAssigning.BitBtn1Click(Sender: TObject);
begin
  if Strtofloat(trim(Maskedit1.text))>Strtofloat(trim(Edit2.text)) then
  begin
    Messagedlg('数量超过发放数量！',mtInformation,[mbOk],0);
    Maskedit1.SetFocus ;
    exit;
  end;
  modalresult:=mroK;
end;

procedure TFrmRetnAssigning.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
   if (key = chr(46)) then
    if pos('.',Maskedit1.Text)>0
     then
      abort;
end;

end.
