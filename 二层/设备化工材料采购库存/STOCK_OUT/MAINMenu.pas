unit MAINMenu;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, DB, ADODB;

type
  TMainForm = class(TForm)
    ToolBar2: TToolBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Production1: TMenuItem;
    Help1: TMenuItem;
    Item_Help: TMenuItem;
    SpeedButton1: TSpeedButton;
    StatusBar: TStatusBar;
    N1: TMenuItem;                            
    N2: TMenuItem;
    N3: TMenuItem;
    ADOConnection1: TADOConnection;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    user_ptr: TLabel;
    db_ptr: TLabel;
    vpass: TLabel;
    vprev: TLabel;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
  private
    hMapFile: THandle;
    MapFilePointer: Pointer;
    procedure ShowHint(Sender:TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses Main, Main2, Main3, Main4, Main6, Main5, Main7, Main8,  Main9;
{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
var
S: string;
begin
  hMapFile := CreateFileMapping ($FFFFFFFF,
    nil, page_ReadWrite, 0,100, 'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0);
  S := PChar (MapFilePointer);
  vpass.Caption := trim(copy(S,1,2));
  user_ptr.Caption := trim(copy(S,3,pos(' ',s)-2));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s)));
  Application.Onhint:=ShowHInt;
end;

procedure TMainForm.ShowHint(Sender:TObject);
begin
  StatusBar.SimpleText:=Application.Hint;
end;


procedure TMainForm.FormResize(Sender: TObject);
begin
  ToolBar2.Width :=width-8;
  StatusBar.Width :=width-8;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain, FrmMain);
  FrmMain.showmodal;
  FrmMain.free;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain2, FrmMain2);
  FrmMain2.showmodal;
  FrmMain2.free;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain3, FrmMain3);
  FrmMain3.showmodal;
  FrmMain3.free;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain4, FrmMain4);
  FrmMain4.showmodal;
  FrmMain4.free;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain6, FrmMain6);
  FrmMain6.showmodal;
  FrmMain6.free;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain5, FrmMain5);
  FrmMain5.showmodal;
  FrmMain5.free;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain7, FrmMain7);
  FrmMain7.showmodal;
  FrmMain7.free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if Adoconnection1.Connected then exit;

  if (vpass.Caption<>'AA') OR
    (trim(vprev.Caption)='') then
  begin
    Application.Terminate;
    exit;
  end;
  Adoconnection1.ConnectionString :=db_ptr.Caption ;
  Adoconnection1.Connected :=true;
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain8, FrmMain8);
  FrmMain8.showmodal;
  FrmMain8.free;
end;

procedure TMainForm.N14Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMain9, FrmMain9);
  FrmMain9.showmodal;
  FrmMain9.free;
end;

end.
