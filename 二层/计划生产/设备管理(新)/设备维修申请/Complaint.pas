unit Complaint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrm_Complaint = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Complaint: Tfrm_Complaint;

implementation

{$R *.dfm}

procedure Tfrm_Complaint.Button1Click(Sender: TObject);
begin
  if Memo1.Text='' then
  begin
    ShowMessage('«Î ‰»ÎÕ∂Àﬂƒ⁄»›');
    Exit;
  end;

  ModalResult:=mrOk;
end;

procedure Tfrm_Complaint.FormShow(Sender: TObject);
begin
  Memo1.SetFocus;
end;

procedure Tfrm_Complaint.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  if Trim(Memo1.Text)<>'' then
  begin
    Key:=Char(0) ;
    Button1Click(Button1);
  end;
end;

end.
