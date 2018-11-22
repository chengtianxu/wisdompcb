unit FindContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  TfrmFindContract = class(TForm)
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindContract: TfrmFindContract;

implementation

uses damo;

{$R *.dfm}

procedure TfrmFindContract.DBGridEh1DblClick(Sender: TObject);
begin
  if dm.aqFindContract.RecordCount = 0 then
    ModalResult := mrCancel
  else
    ModalResult := mrok;
end;

end.
