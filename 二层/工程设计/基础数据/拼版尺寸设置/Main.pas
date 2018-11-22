unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1length: TFloatField;
    ADOQuery1width: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Image2: TImage;
    ADOQuery1selected: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ADOQuery1seet_szie: TStringField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Edit, Add,common;

{$R *.dfm}

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if DataCol=3 then
  begin
    if Adoquery1.recno<=0 then exit;
    IF Adoquery1.FieldValues['selected']='Y' THEN
      DBGrid1.Canvas.Draw(rect.Left+3,rect.Top+1,image1.Picture.Graphic)
    else
      DBGrid1.Canvas.Draw(rect.Left+3,rect.Top+1,image2.Picture.Graphic);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3') then
  begin
   showmessage('你没有此功能的操作权限,请联系管理员！');
   exit;
  end;
  if not AdoQuery1.IsEmpty then
  begin
    AdoQuery1.Edit;
   Form2:=TForm2.Create(Application);
    Form2.ShowModal;
    Form2.Free;
  end;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  bookmark: TBookMark;
begin
 if (vprev= '1') or (vprev = '3') then
 begin
  showmessage('你没有此功能的操作权限,请联系管理员！');
  exit;
 end;
  Bookmark:=AdoQuery1.GetBookmark();
  Adoquery1.append ;
  Form3:=TForm3.Create(Application);
  if Form3.ShowModal<>mrok then
    ADOQuery1.GotoBookmark(bookmark);
  Form3.Free;
   ADOQuery1.FreeBookmark(bookmark);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3') then
  begin
   showmessage('你没有此功能的操作权限,请联系管理员！');
   exit;
  end;
  if MessageDlg('你确定要删除这条记录吗？',mtConfirmation,[mbyes,mbno],0)=mryes then
     ADOQuery1.Delete;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  close;
  application.Terminate;

end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init(adoconnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;   
   self.caption:=application.Title;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   AdoQuery1.Open;
end;

end.
