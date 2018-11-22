unit FindRFQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, Buttons;

type
  TfrmFindRFQ = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    edtRFQNo: TEdit;
    Label1: TLabel;
    sbtnRefresh: TSpeedButton;
    procedure edtRFQNoChange(Sender: TObject);
    procedure sbtnRefreshClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindRFQ: TfrmFindRFQ;

implementation

uses damo, Detail;

{$R *.dfm}

procedure TfrmFindRFQ.edtRFQNoChange(Sender: TObject);
begin
  if edtRFQNo.Text <> '' then
    dm.aqFindRFQ.Filter:= ' RFQNo like ' +''+'%'+edtRFQNo.Text+'%'+''
  else
    dm.aqFindRFQ.Filter:= '';
end;

procedure TfrmFindRFQ.sbtnRefreshClick(Sender: TObject);
begin
  with dm.aqFindRFQ do
  begin
    Close;
//    Parameters.Items[0].Value:= frmDetail.DBEdit4.Text;
//    Parameters.Items[1].Value:= frmDetail.DBEdit4.Text;
    Open;
    if edtRFQNo.Text <> '' then
      Filter:= ' RFQNo like ' +''+'%'+edtRFQNo.Text+'%'+''
    else
      Filter:= '';
  end;
end;

procedure TfrmFindRFQ.DBGridEh1DblClick(Sender: TObject);
begin
  if dm.aqFindRFQ.RecordCount = 0 then
    ModalResult := mrCancel
  else
    ModalResult := mrok;
end;

end.
