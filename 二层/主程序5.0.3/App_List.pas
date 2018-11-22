unit App_List;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ImgList, Buttons, Menus;

type
  TfrmApp_List = class(TForm)
    ImageList1: TImageList;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApp_List: TfrmApp_List;

implementation

{$R *.dfm}

procedure TfrmApp_List.N1Click(Sender: TObject);
begin
if listview1.Selected<>nil then
 begin
  TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),StrToInt64(listview1.Selected.SubItems[0])), 0);
  listview1.Selected.Delete;
 end;
end;

end.
