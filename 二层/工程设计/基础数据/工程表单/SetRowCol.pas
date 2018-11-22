unit SetRowCol;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Spin;

type
  TfrmSetRowCol = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtRow: TSpinEdit;
    edtCol: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetRowCol: TfrmSetRowCol;

implementation
uses common;
{$R *.dfm}

procedure TfrmSetRowCol.FormShow(Sender: TObject);
begin
  edtRow.SetFocus;
end;

procedure TfrmSetRowCol.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Canclose:= StrToInt(edtRow.text)>1;
end;

end.
