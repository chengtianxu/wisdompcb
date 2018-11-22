unit PasFieldShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,common, Grids, DBGridEh;

type
  TfrmFieldShow = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    key419:Integer;
    { Public declarations }
  end;

var
  frmFieldShow: TfrmFieldShow;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmFieldShow.FormShow(Sender: TObject);
begin
  with DM.adoField do
  begin
    Close;
    Parameters.ParamByName('key419').Value:=key419;
    Parameters.ParamByName('rkey73').Value:=rkey73;
    Open;
    sort:='fieldorder'
  end;
end;

procedure TfrmFieldShow.btnSaveClick(Sender: TObject);
begin
  DM.adoField.UpdateBatch();
  ModalResult:=mrYes;
end;

end.
