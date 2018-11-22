unit confirm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TFrmConfirm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfirm: TFrmConfirm;

implementation

{$R *.dfm}
uses customerpart;

procedure TFrmConfirm.BitBtn1Click(Sender: TObject);
begin
  if Dbradiogroup1.ItemIndex=1 then
    if strtoint('0'+dbedit1.text)=0 then
  begin
    messagedlg('假确认时请输入接单限额！',mtinformation,[mbok],0);
    Dbedit1.SetFocus;
    exit;
  end;
  if Dbradiogroup1.ItemIndex=2 then
    if trim(dbedit2.Text)='' then
  begin
    messagedlg('真确认时请输入样品等备注信息！',mtinformation,[mbok],0);
    Dbedit2.SetFocus;
    exit;
  end;
  modalresult:=mrok;
end;

procedure TFrmConfirm.DBRadioGroup1Click(Sender: TObject);
begin
  if Dbradiogroup1.ItemIndex<>1 then
    Dbedit1.Field.Value :=0;
end;

procedure TFrmConfirm.DBEdit1Exit(Sender: TObject);
begin
  if trim(dbedit1.Text)='' then
    if dbedit1.Field.Value=0 then
end;

end.
