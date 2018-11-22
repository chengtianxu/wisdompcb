unit URemark_mod73;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TRemark_mod73 = class(TfrmBaseEdit)
    Memo1: TMemo;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private

    { Private declarations }
  public

    { Public declarations }
  end;

var
  Remark_mod73: TRemark_mod73;

implementation

{$R *.dfm}
uses uCommFunc;

{ TRemark_mod73 }

procedure TRemark_mod73.btnCloseClick(Sender: TObject);
begin
  //inherited;

end;

procedure TRemark_mod73.btnSaveClick(Sender: TObject);
begin
  //inherited;

end;



end.
