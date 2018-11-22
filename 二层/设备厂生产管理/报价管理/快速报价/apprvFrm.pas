unit apprvFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, common, Damo, StdCtrls, Buttons;

type
  TfrmApprv = class(TForm)
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApprv: TfrmApprv;

implementation

{$R *.dfm}

procedure TfrmApprv.FormCreate(Sender: TObject);
begin
  DM.qry265.Close;
  DM.qry265.Parameters[0].Value := DM.qryCp85rkey.Value;
  DM.qry265.Open;
end;

procedure TfrmApprv.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
