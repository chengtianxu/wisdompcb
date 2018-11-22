unit RetnMATLAssign2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmRtnQty2 = class(TForm)
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
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRtnQty2: TFrmRtnQty2;

implementation

uses Main4;

{$R *.dfm}

procedure TFrmRtnQty2.BitBtn1Click(Sender: TObject);
begin
    try
      if strtofloat(edit4.Text)=0 then exit;
      if strtofloat(edit4.Text)+strtofloat(FrmMain4.stringgrid1.Cells[6,FrmMain4.stringgrid1.row])
        +strtofloat(FrmMain4.stringgrid1.Cells[7,FrmMain4.stringgrid1.row])>strtofloat(edit3.Text) then
      begin
        messagedlg('数量不能超过有效数量!',mtinformation,[mbok],0);
        exit;
      end;
    except
        messagedlg('数量格式无效!',mtinformation,[mbok],0);
        exit;
    end;
    modalresult:=mrok;
end;

procedure TFrmRtnQty2.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
   if (key = chr(46)) then
    if pos('.',edit4.Text)>0
     then
      abort;
  if key=#13 then
  begin
    try
      if strtofloat(edit4.Text)=0 then exit;
      if strtofloat(edit4.Text)>strtofloat(edit3.Text) then
      begin
        messagedlg('数量不能超过有效数量!',mtinformation,[mbok],0);
        exit;
      end;
    except
        messagedlg('数量格式无效!',mtinformation,[mbok],0);
        exit;
    end;
    modalresult:=mrok;
  end;
end;

end.
