unit AdjustDeptStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFrmAdjustDeptStock = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdjustDeptStock: TFrmAdjustDeptStock;

implementation

uses Main5;

{$R *.dfm}

procedure TFrmAdjustDeptStock.BitBtn1Click(Sender: TObject);
begin
    try
      if strtofloat(trim(edit1.Text))>0 then;
    except
      messagedlg('数量格式无效!',mtinformation,[mbok],0);
      exit;
    end;
    modalresult:=mrok;
end;

end.
