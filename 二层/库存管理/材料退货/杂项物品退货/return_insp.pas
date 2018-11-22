unit return_insp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Menus;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
 uses damo;
{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm4.N1Click(Sender: TObject);
var
rkey95:integer;
quan_rej:double;
begin
if dm.AQ235quan_to_ship.Value<dm.aq96quantity.Value then
 showmessage('不能删除该条记录,退货记录可能被装运了!')
else
 begin
  rkey95:=dm.aq96rkey.Value;
  quan_rej:=dm.aq96quantity.Value;
  dm.AQ235.Edit;
  dm.AQ235quan_to_ship.Value := dm.AQ235quan_to_ship.Value-quan_rej;
  dm.AQ235quan_on_hand.Value := dm.AQ235quan_on_hand.Value+quan_rej;
  dm.AQ235.Post;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('delete from data0209');
    sql.Add('where rkey='+inttostr(rkey95));
    ExecSQL;
   end;
  dm.aq96.Close;
  dm.aq96.Open;
  edit2.Text:=floattostr(strtofloat(edit2.Text)-quan_rej);
 end;
end;

end.
