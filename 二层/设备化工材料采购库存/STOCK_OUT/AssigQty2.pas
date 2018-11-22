unit AssigQty2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmAssigQty2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAssigQty2: TFrmAssigQty2;

implementation

{$R *.dfm}

procedure TFrmAssigQty2.BitBtn1Click(Sender: TObject);
begin
  try
    if strtofloat(edit4.Text)<=0 then exit;
    if strtofloat(trim(edit4.Text))>strtofloat(trim(edit3.Text)) then
    begin
      messagedlg('数量不能超过可用数量！',mtinformation,[mbok],0);
      exit;
    end;
  except
    messagedlg('数量无效！',mtinformation,[mbok],0);
    edit4.SetFocus ;
    exit;
  end;
  try
    if strtofloat(trim(edit5.Text))=0 then
    begin
      messagedlg('换算比例不能为零！',mtinformation,[mbok],0);
      exit;
    end;
  except
    messagedlg('换算比例无效！',mtinformation,[mbok],0);
    edit5.SetFocus ;
    exit;
  end;
  modalresult:=mrok;
end;

procedure TFrmAssigQty2.Edit5Enter(Sender: TObject);
begin
  Edit5.SelectAll ;
end;

end.
