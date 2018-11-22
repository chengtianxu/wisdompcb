unit prodRSDesign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, Grids, DBGrids, DB, ADODB, Menus,
  StdCtrls, Mask, DBCtrls, Buttons;

type
  TFrmProdRSDesign = class(TForm)
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    MAdd: TMenuItem;
    Medit: TMenuItem;
    Mview: TMenuItem;
    Mdelete: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1STATE_ID: TStringField;
    ADOQuery1STATE_TAX: TFloatField;
    ADOQuery1NAME: TStringField;
    ADOQuery1GL_ACCT_PTR: TIntegerField;
    Bar1: TStatusBar;
    procedure MeditClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MdeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MAddClick(Sender: TObject);
    procedure MviewClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
    FButtonSize: Integer;
    FrmProdRSDesign: TFrmProdRSDesign;

implementation

uses NProdRSEdit,common;

{$R *.dfm}

procedure TFrmProdRSDesign.MeditClick(Sender: TObject);
begin
    if Adoquery1.Eof then
    begin
      Messagedlg('请选择一个代号！',mtInformation,[MbOk],0);
      exit;
    end;
    FrmNProdRSEdit:=TFrmNProdRSEdit.create(Application);
    if FrmNProdRSEdit.ShowModal=mrOk then
    begin
      Adoquery1.Close;
      Adoquery1.open;
    end;
    FrmNProdRSEdit.free;
end;

procedure TFrmProdRSDesign.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
 if Key = Chr(vk_Back) then       //如果按下了backspace
   begin
    if length(bar1.SimpleText)>10 then
     bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
    if length(bar1.SimpleText)>10 then
     ADOQuery1.Locate('STATE_ID',copy(bar1.SimpleText,11,length(bar1.SimpleText)-10),searchoption)
    else
     ADOQuery1.First
   end
  else
    if key=chr(vk_return) then    //如果按下了enter
      MviewClick(sender)           //調用編輯命令
    ELSE
     begin
     bar1.SimpleText :=bar1.SimpleText+key;
     ADOQuery1.Locate('STATE_ID',copy(bar1.SimpleText,11,length(bar1.SimpleText)-10),searchoption);
     end;
end;

procedure TFrmProdRSDesign.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrmProdRSDesign.MdeleteClick(Sender: TObject);
begin
  if Adoquery1.FieldByName('rkey').AsInteger=1 then
  begin
    MessageDlg('系统保留记录，不能删除！',mtinformation, [mbok], 0);
    exit;
  end;
  if MessageDlg('是否确认删除?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      Adoquery1.Delete ;
    except
      MessageDlg('已经有业务发生，不能删除！',mtinformation, [mbok], 0);
      exit;
    end;
    MessageDlg('已经成功删除！',mtinformation, [mbok], 0);
  end;
end;

procedure TFrmProdRSDesign.FormShow(Sender: TObject);
begin
  if Adoconnection1.Connected then
   begin
   if (trim(vprev)='1') or
    (trim(vprev)='3') then
   begin
    madd.Enabled :=false;
    mEDIT.Enabled :=false;
    mdelete.Enabled :=false;
   end;
   Adoquery1.Open ;
  end;
end;

procedure TFrmProdRSDesign.FormCreate(Sender: TObject);

begin
if not app_init(self.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;
self.Caption:=application.Title;
end;

procedure TFrmProdRSDesign.MAddClick(Sender: TObject);
begin
  Adoquery1.Filtered :=false;
  with Adoquery1 do
  begin
    append;
  end;
  FrmNProdRSEdit:=TFrmNProdRSEdit.create(Application);
  if FrmNProdRSEdit.ShowModal=mrOk then
  begin
    Adoquery1.Close;
    Adoquery1.open;
  end;
  Adoquery1.Filtered :=true;
  FrmNProdRSEdit.free;
end;

procedure TFrmProdRSDesign.MviewClick(Sender: TObject);
begin
    if Adoquery1.Eof then
    begin
      Messagedlg('请选择一个代号！',mtInformation,[MbOk],0);
      exit;
    end;
    FrmNProdRSEdit:=TFrmNProdRSEdit.create(Application);
    FrmNProdRSEdit.SpeedButton7.Enabled :=false;
    FrmNProdRSEdit.Edit1.Enabled :=false;
    FrmNProdRSEdit.Edit2.Enabled :=false;
    FrmNProdRSEdit.Edit3.Enabled :=false;
    FrmNProdRSEdit.ShowModal;
    FrmNProdRSEdit.free;
end;

end.

