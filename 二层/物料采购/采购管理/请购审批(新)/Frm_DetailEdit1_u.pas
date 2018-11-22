unit Frm_DetailEdit1_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ADODB, Buttons, DBCtrlsEh;

type
  TFrm_DetailEdit1 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    BtSave: TBitBtn;
    BtCan: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    DBText1: TDBText;
    lbl1: TLabel;
    dbedtQUANTITY_REQUIRED: TDBEdit;
    dbchkIF_urgency: TDBCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Ftag:integer;
    procedure initData;
  end;

var
  Frm_DetailEdit1: TFrm_DetailEdit1;

implementation
uses DM_u;
{$R *.dfm}

{ TFrm_DetailEdit1 }

procedure TFrm_DetailEdit1.initData;
begin
  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select * from data0075');
    sql.Add('order by DESCRIPTION');
    open;
    while not eof do
    begin
      DBComboBox1.Items.Add(trim(FieldValues['DESCRIPTION']));
      Next;
    end;
  end;
end;

procedure TFrm_DetailEdit1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
   SelectNext(ActiveControl,true,true);
end;

end.
