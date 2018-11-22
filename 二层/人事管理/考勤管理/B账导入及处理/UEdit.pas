unit UEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrmedit = class(TForm)
    lbl1: TLabel;
    lbl_code: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl_Ename: TLabel;
    lbl_date: TLabel;
    lbl_class: TLabel;
    edt_class: TEdit;
    btn_OK: TButton;
    btn_exit: TButton;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmedit: Tfrmedit;

implementation

{$R *.dfm}

procedure Tfrmedit.btn_exitClick(Sender: TObject);
begin
 close;
end;

procedure Tfrmedit.btn_OKClick(Sender: TObject);
begin
// if Trim(edt_class.Text)= '' then
// begin
//  ShowMessage('«Î ‰»ÎÕÍ’˚!');
//  exit;
// end;

  self.ModalResult:=mrok;

end;

end.
