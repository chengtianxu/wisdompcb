unit Frm_PrgType_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, StdCtrls, Buttons, Grids, DBGridEh;

type
  TFrm_PrgType = class(TForm)
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation
 uses DM_u;
{$R *.dfm}

procedure TFrm_PrgType.N1Click(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    0: DM.ADO306.Append;
    1: DM.ADO306.Edit;
    2: DM.ADO306.Delete;
  end;
end;

end.
