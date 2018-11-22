unit EditPo_noFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmEditPo_no = class(TForm)
    edt1: TEdit;
    Label1: TLabel;
    edt2: TEdit;
    Label2: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditPo_no: TFrmEditPo_no;

implementation

uses DM_u, common;

{$R *.dfm}

procedure TFrmEditPo_no.btn1Click(Sender: TObject);
begin
  with dm.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'update wzcp0070 set po_no = ' + quotedstr(edt2.Text)
      + ' where rkey= ' + dm.ADO70rkey.Asstring;
    execSQL;
  end;
  self.ModalResult := mrok;
end;

procedure TFrmEditPo_no.FormShow(Sender: TObject);
begin
  edt1.Text := dm.wdstrngfldADO70PO_NO.Asstring;
  edt2.SetFocus;
end;

procedure TFrmEditPo_no.btn2Click(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

end.
