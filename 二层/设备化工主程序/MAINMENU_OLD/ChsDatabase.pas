unit ChsDatabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, ExtCtrls;

type
  TFrmChsDatabase = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ListView1: TListView;
    ImageList2: TImageList;
    Timer1: TTimer;
    procedure ToolButton1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChsDatabase: TFrmChsDatabase;

implementation

uses datamodule;

{$R *.dfm}

procedure TFrmChsDatabase.ToolButton1Click(Sender: TObject);
begin
  Try
    dm.Database1.Connected :=true;
  except
    messagedlg('Your need install BDE engine first!',mtinformation,[mbok],0);
    close;
    exit;
  end;

  case ListView1.ItemIndex of
    0:  dm.ADOConnection1.ConnectionString :=
    'Provider=SQLOLEDB.1;Password='''';Persist Security Info=True;User ID=sa;Initial Catalog=SJ_V20_live;Data Source=wangshupeng';
    1:  dm.ADOConnection1.ConnectionString :=
    'Provider=SQLOLEDB.1;Password='''';Persist Security Info=True;User ID=sa;Initial Catalog=SJ_V20_Sample;Data Source=wangshupeng';
    else exit;
  end;
  dm.ADOConnection1.Connected :=true;
  close;
  Timer1.Enabled :=false;
end;

procedure TFrmChsDatabase.ListView1DblClick(Sender: TObject);
begin
  ToolButton1Click(Sender);
end;

procedure TFrmChsDatabase.ListView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    ToolButton1Click(Sender);
end;

procedure TFrmChsDatabase.FormActivate(Sender: TObject);
var
  vprog0:string;
  vprog:pchar;
  ZAppName: array[0..127] of char;
  Found: HWND;
begin
  vprog0:=trim(Application.Title);
  Application.Title:='KOIMYTEMPEXE';
  vprog:=pchar(vprog0);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil, ZAppName); // ²éÕÒ´°¿Ú
  if Found>0 then  begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
  end;
  Application.Title:=vprog0;
  listview1.ItemIndex :=0;
end;

procedure TFrmChsDatabase.ToolButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmChsDatabase.Timer1Timer(Sender: TObject);
begin
  ToolButton1Click(Sender);
end;

end.
