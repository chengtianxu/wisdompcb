unit ship_advice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TForm8 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Bevel1: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBText1: TDBText;
    DBEdit17: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
   v_close:byte; 
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
 uses damo, list_report;
{$R *.dfm}

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO529.Cancel;
 dm.ADO530.Cancel;
 close;
end;

procedure TForm8.FormActivate(Sender: TObject);
begin
 dm.ADO529.Close;
 dm.ADO529.Parameters[0].Value:=dm.ADO0439ship_addr_ptr.Value;
 dm.ADO529.Open;
 if dm.ADO529.IsEmpty then
  begin
   dm.ADO529.Append;
   dm.ADO529SHIP_ADDR_PTR.Value:=dm.ADO0439ship_addr_ptr.Value;
   dm.ADO529FAX_TO.Value:=dm.ADO0439SHIP_TO_FAX.Value;
   dm.ADO529FAX_TO.Value:=dm.ADO0439location.Value;
   dm.ADO529ATTN.Value:=dm.ADO0439SHIP_TO_CONTACT.Value;
  end
 else
  dm.ADO529.Edit;
 dm.ADO530.Close;
 dm.ADO530.Parameters[0].Value:=dm.ADO0439rkey.Value;
 dm.ADO530.Open;
 if dm.ADO530.IsEmpty then
  begin
   dm.ADO530.Append;
   dm.ADO530D0439_PTR.Value:=dm.ADO0439rkey.Value;
   dm.ADO530TDATE.Value:=dm.ADO0439date_ent.Value;
   dm.ADO530DEPA_DATE.Value:=dm.ADO0439date_sailing.Value;
  end
 else
  dm.ADO530.Edit;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
 dm.ADO529.Post;
 dm.ADO530.Post;


 v_close:=1;
 form8.ModalResult:=mrok;
end;

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 begin
  dm.ADO529.Cancel;
  dm.ADO530.Cancel;
 end;
end;

end.
