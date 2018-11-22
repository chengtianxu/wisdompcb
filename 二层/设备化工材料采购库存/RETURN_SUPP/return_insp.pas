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
rkey96:integer;
quan_rej:double;
begin
if dm.AQ22quan_to_be_shipped.Value<dm.aq96quan_rejd.Value then
 showmessage('不能删除该条记录,退货记录可能被装运了!')
else
 begin
  rkey96:=dm.aq96rkey.Value;
  quan_rej:=dm.aq96quan_rejd.Value;
  dm.AQ22.Edit;

  dm.AQ22quan_to_be_shipped.Value := dm.AQ22quan_to_be_shipped.Value-
                                    quan_rej;
  dm.AQ22quan_on_hand.Value := dm.AQ22quan_on_hand.Value+
                               quan_rej;

  dm.AQ22.Post;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('delete from data0096');
    sql.Add('where rkey='+inttostr(rkey96));
    ExecSQL;
   end;
  dm.aq96.Close;
  dm.aq96.Open;
 end;
end;

end.
