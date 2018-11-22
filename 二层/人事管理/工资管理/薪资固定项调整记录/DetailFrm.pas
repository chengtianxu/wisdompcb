unit DetailFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, damo;

type
  TFrmDetail = class(TForm)
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetail: TFrmDetail;

implementation

{$R *.dfm}

procedure TFrmDetail.FormCreate(Sender: TObject);
begin
  DM.qryDetail.Close;
  DM.qryDetail.Open;
end;

procedure TFrmDetail.DBGridEh1DblClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

end.
