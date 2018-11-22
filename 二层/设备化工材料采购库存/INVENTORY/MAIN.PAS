unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    BitBtn1: TBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    db_ptr: TLabel;
    vprev: TLabel;
    StatusBar1: TStatusBar;
    N5: TMenuItem;
    csi_empl_ptr: TLabel;
    procedure N7Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
  public
    { Public declarations }
    v_date:string;
  end;

var
  Form1: TForm1;

implementation

uses update_inv, damo, update_stdcost, about ;

{$R *.dfm}

procedure TForm1.N7Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 TRY
  form2:=Tform2.Create(application);
  form2.ShowModal;
 FINALLY
  form2.free;
 END;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 try
  aboutbox:=taboutbox.Create(application);
  aboutbox.ShowModal;
 finally
  aboutbox.free;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not dm.Adoconnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  dm.adoconnection1.ConnectionString := db_ptr.caption;
  dm.Adoconnection1.Connected :=true;
  with dm.adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select getdate() as v_date');
    open;                                 //全局变量
    v_date:=datetostr(fieldvalues['v_date']);//短日期格式
   end;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 s:string;
  vprog0:string;
  vprog:pchar;
  ZAppName: array[0..127] of char;
  Found: HWND;
 
begin
  hMapFile := CreateFileMapping ($FFFFFFFF, // 特殊内存映射句柄
    nil, page_ReadWrite, 0,10000, 'coimasp20'); // 文件名
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
  S := PChar (MapFilePointer);//从共享内存读出内容
  csi_empl_ptr.Caption := trim(copy(S,1,pos(' ',s)));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库
  vprog0:=trim(Application.Title);
  s:=copy(s,pos('Data Source=',s)-2,1);
  vprog:=pchar(vprog0+'-'+s);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil, ZAppName); // 查找窗口
  if Found>0 then  begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
  end;
  Application.Title:=vprog0+'-'+s;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 statusbar1.Width:=form1.Width-8;
 bitbtn1.Left:= form1.Width-90;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 try
  form5:=tform5.Create(application);
  form5.ShowModal;
 finally
  form5.free;
 end;
end;

end.
