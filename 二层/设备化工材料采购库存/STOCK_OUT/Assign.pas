unit Assign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmAssign = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    Inspect1: TMenuItem;
    PASS1: TMenuItem;
    N5: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAssign: TFrmAssign;

implementation

{$R *.dfm}

procedure TFrmAssign.FormCreate(Sender: TObject);
begin
  with Stringgrid1 do
  begin
    cells[0,0]:='材料代号';
    cells[1,0]:='单位';
    cells[2,0]:='车间净存';
    cells[3,0]:='总配额数量';
    cells[4,0]:='发放数量';
    cells[5,0]:='待发数量';
    cells[6,0]:='车间净存(新)';
  end;
end;

end.
