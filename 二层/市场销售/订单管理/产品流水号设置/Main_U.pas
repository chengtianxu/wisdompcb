unit Main_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RzDBGrid, ImgList, RzButton, ExtCtrls, RzPanel,
  StdCtrls, Mask, RzEdit, RzDBEdit, RzDBSpin, RzLabel;

type
  TFrmMain = class(TForm)
    RzToolbar1: TRzToolbar;
    RzTBtnNew: TRzToolButton;
    ImageList1: TImageList;
    RzTBtnEdit: TRzToolButton;
    RzTBtnDel: TRzToolButton;
    RzTBtnExit: TRzToolButton;
    RzDBGridMain: TRzDBGrid;
    RzPanel1: TRzPanel;
    RzLbLayer: TRzLabel;
    RzLbSufchar: TRzLabel;
    RzBitBtnSave: TRzBitBtn;
    RzBitBtnCancel: TRzBitBtn;
    RzDBNumEdtLayer: TRzDBNumericEdit;
    RzDBEdtSufchar: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure RzTBtnNewClick(Sender: TObject);
    procedure RzTBtnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtnCancelClick(Sender: TObject);
    procedure RzBitBtnSaveClick(Sender: TObject);
    procedure RzTBtnEditClick(Sender: TObject);
    procedure RzTBtnDelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure DisableToolBtns(Sender: TObject);
    procedure EnableToolBtns(Sender: TObject);
    procedure CheckRight(Sender: TObject);
    function  DataIsValid(Sender: TObject):Boolean;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
uses
  Dm_U,common;
{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
try
  if not App_Init(DM.ADOCon) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
except
  showmessage('初始化程序错误');
  application.Terminate;
end;
  //vprev :='1';
  Caption :=Application.Title;
end;

procedure TFrmMain.RzTBtnNewClick(Sender: TObject);
begin
  if (vprev<>'2') and (vprev<>'4') then
    begin
      showmessage('对不起，您没有权限执行此操作！');
      exit;
    end;
  DisableToolBtns(Sender);
  RzDBGridMain.Enabled :=false;
  RzPanel1.Visible :=true;
  dm.AQ81.Append;
  RzDBEdtSufchar.Text :='0001';
  RzDBNumEdtLayer.SetFocus;
end;

procedure TFrmMain.RzTBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  with dm.AQ81 do
    begin
      Close;
      Open;
    end;
  CheckRight(Sender);
end;

procedure TFrmMain.RzBitBtnCancelClick(Sender: TObject);
begin
  dm.AQ81.Cancel;
  RzPanel1.Visible:=false;
  RzDBGridMain.Enabled:=true;
  RzDBNumEdtLayer.Enabled :=true;
  EnableToolBtns(Sender);
  CheckRight(Sender);
end;

procedure TFrmMain.RzBitBtnSaveClick(Sender: TObject);
begin
  if self.DataIsValid(Sender) then
    begin
      dm.AQ81.Post;
      RzPanel1.Visible :=false;
      RzDBGridMain.Enabled :=true;
      RzDBNumEdtLayer.Enabled :=true;
      EnableToolBtns(Sender);
      with dm.AQ81 do
      begin
        Close;
        Open;
      end;
      CheckRight(Sender);
    end
end;

procedure TFrmMain.RzTBtnEditClick(Sender: TObject);
begin
  if (vprev<>'2') and (vprev<>'4') then
    begin
      showmessage('对不起，您没有权限执行此操作！');
      exit;
    end;
  DisableToolBtns(Sender);
  RzDBGridMain.Enabled :=false;
  RzPanel1.Visible :=true;
  RzDBNumEdtLayer.Enabled :=false;
  dm.AQ81.Edit;
  RzDBEdtSufchar.SetFocus;
end;

procedure TFrmMain.RzTBtnDelClick(Sender: TObject);
begin
  if (vprev<>'2') and (vprev<>'4') then
    begin
      showmessage('对不起，您没有权限执行此操作！');
      exit;
    end;
  DisableToolBtns(Sender);
  if Application.messagebox('数据删除后将无法恢复，确认删除？','确认',MB_OKCANCEL)= IDCANCEL then
    exit;
  try
    dm.AQ81.Delete;
  except
    showmessage('该数据已被使用，无法删除！')
  end;
  EnableToolBtns(Sender);
  CheckRight(Sender);
end;

procedure TFrmMain.DisableToolBtns(Sender: TObject);
begin
  RzTBtnNew.Enabled :=false;
  RzTBtnEdit.Enabled :=false;
  RzTBtnDel.Enabled :=false;
end;

procedure TFrmMain.EnableToolBtns(Sender: TObject);
begin
  RzTBtnNew.Enabled :=true;
  RzTBtnEdit.Enabled :=true;
  RzTBtnDel.Enabled :=true;
end;

procedure TFrmMain.CheckRight(Sender: TObject);
begin
  if (vprev<>'2') and (vprev<>'4') then
    begin
      RzTBtnNew.Enabled :=false;
      RzTBtnEdit.Enabled :=false;
      RzTBtnDel.Enabled :=false;
    end;
  if dm.AQ81.IsEmpty then
    begin
      RzTBtnEdit.Enabled :=false;
      RzTBtnDel.Enabled :=false;
    end;
end;

procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if RzPanel1.Visible = true then
    if Application.MessageBox('数据尚未保存，是否放弃修改？','确认',MB_OKCANCEL)= IDCANCEL then
      CanClose :=false
    else
      begin
        dm.AQ81.Cancel;
        CanClose :=true;
      end;
end;

function TFrmMain.DataIsValid(Sender: TObject): Boolean;
var
  Surfchar:integer;
begin
  Result :=false;
  if RzDBNumEdtLayer.Enabled then
    begin
    with dm.AQTmp do
    begin
      Close;
      Parameters.ParamValues['Layer']:=RzDBNumEdtLayer.Value;
      Open;
    end;
    if not dm.AQTmp.IsEmpty then
      begin
        showmessage('输入层数已存在，请确认！');
        if RzDBNumEdtLayer.Enabled then
          RzDBNumEdtLayer.SetFocus
        else
          RzDBEdtSufchar.SetFocus;
        exit;
      end;
  end;
  try
    Surfchar :=strtoint(RzDBEdtSufchar.text);
    if (Surfchar < 0) then
      begin
        showmessage('流水号输入错误！');
        RzDBEdtSufchar.SetFocus;
        exit;
      end;
    RzDBEdtSufchar.Text:=StringofChar('0',4-Length(RzDBEdtSufchar.Text))+RzDBEdtSufchar.Text;
  except
    showmessage('流水号输入错误，请输入10位内数字字符！');
    RzDBEdtSufchar.SetFocus;
    exit;
  end;
  Result :=true;
end;

end.
