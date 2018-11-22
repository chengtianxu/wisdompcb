unit ActiveUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ImgList, Menus, Grids, DBGrids, DB;

type
  TFrmActiveUsers = class(TForm)
    ListView1: TListView;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ImageList5: TImageList;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmActiveUsers: TFrmActiveUsers;

implementation

uses datamodule;

{$R *.DFM}

procedure TFrmActiveUsers.PopupMenu1Popup(Sender: TObject);
begin
  if ansiuppercase(dm.ADOData0073.FieldByName('user_id').AsString)='ADMIN' THEN
    N1.Enabled :=TRUE;
end;

procedure TFrmActiveUsers.N1Click(Sender: TObject);
var
  vstr:string;
begin
  DM.ADOUserList.Close;
  DM.ADOUserList.Open;
  vstr:=copy(Listview1.Selected.Caption,pos('[',Listview1.Selected.Caption)+1,pos(']',Listview1.Selected.Caption)-pos('[',Listview1.Selected.Caption)-1);
  if DM.ADOUserList.Locate('user_login_name',trim(vstr),[]) then
  with DM.ADOUserList do
   begin
    Edit;
    Fieldbyname('network_id').AsString :='';
    post;
   end;
  DM.ADOUserList.Close ;
  messagedlg('该用户已经被弹出！',mtinformation,[mbok],0);
end;

end.
