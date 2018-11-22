unit u_frmcpedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  Tfrm_cpedit = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cpedit: Tfrm_cpedit;

implementation

uses uDM;

{$R *.dfm}

procedure Tfrm_cpedit.BitBtn3Click(Sender: TObject);
begin
  dm.ADO0741.UpdateBatch();
end;

procedure Tfrm_cpedit.BitBtn1Click(Sender: TObject);
begin
  dm.ADO0741.CancelBatch();
end;

end.
