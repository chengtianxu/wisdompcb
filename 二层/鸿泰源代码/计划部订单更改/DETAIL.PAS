unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TForm8 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Bevel1: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
uses damo, surcharge;
{$R *.dfm}

procedure TForm8.FormActivate(Sender: TObject);
var
 total:single;
begin
if not dm.ADOQuery3.IsEmpty then
 begin
 total:=dbedit15.Field.Value*dbedit16.Field.Value;
 edit1.Text:=formatfloat('0.00',total+(total*dbedit17.Field.Value*0.01)-
  (total*dbedit18.Field.Value*0.01)+dbedit19.Field.Value );
 end
else
 bitbtn1.Enabled:=false;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
 try
  form9:=Tform9.Create(application);
  form9.ShowModal;
 finally
  form9.free;
 end;
end;

end.
