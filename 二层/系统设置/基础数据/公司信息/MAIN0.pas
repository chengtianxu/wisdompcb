unit MAIN0;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList  ,  DB, ADODB, Mask,
  DBCtrls, ExtDlgs;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    ADOConnection1: TADOConnection;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Company_Name: TStringField;
    ADOQuery1ship_address: TStringField;
    ADOQuery1Company_Icon: TBlobField;
    ADOQuery1SITE_INFO_ADD_1: TStringField;
    ADOQuery1SITE_INFO_ADD_2: TStringField;
    ADOQuery1SITE_INFO_ADD_3: TStringField;
    ADOQuery1SITE_INFO_PHONE: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    DBImage1: TDBImage;
    OpenPictureDialog1: TOpenPictureDialog;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    ADOQuery1Company_Name2: TStringField;
    ADOQuery1Company_Name3: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure ShowHint(Sender:TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
  uses common;
{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);

begin
 if not app_init(self.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;   
  end;
  self.Caption:=application.Title;
  Application.Onhint:=ShowHInt;
end;

procedure TMainForm.ShowHint(Sender:TObject);
begin
  StatusBar.SimpleText:=Application.Hint;
end;


procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  Adoquery1.UpdateBatch;
  close;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if Adoconnection1.Connected then
  Adoquery1.open;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  Adoquery1.close;
  close;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  if trim(OpenPictureDialog1.filename)='' then exit;
  Adoquery1.Edit;
  dbimage1.picture.LoadFromFile(OpenPictureDialog1.filename);
end;

end.
