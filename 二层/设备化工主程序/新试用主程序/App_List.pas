unit App_List;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ImgList, Buttons;

type
  TfrmApp_List = class(TForm)
    ImageList1: TImageList;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApp_List: TfrmApp_List;

implementation
uses common;
{$R *.dfm}

procedure TfrmApp_List.BitBtn2Click(Sender: TObject);
var
  i:integer;
  H:HWND;
begin
{  for i:= 0 to ListView1.Items.Count-1 do
  begin
    H:=Get_File_Handle(ListView1.Items[i].SubItems[0]);
    if H > 0 then
      PostMessage(H,WM_QUIT,0,0)
    else
    begin
      ShowMsg('没有找到程序:'+ListView1.Items[i].Caption,1);
      abort;
    end;
  end;
  modalresult:=mrok;}
end;

end.
