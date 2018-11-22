unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin,
  ImgList, DB, Menus;

type
  TfrmMain = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    db_ptr: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uDm, uPuau,common;

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
begin
 if dm.Conn.Connected then
  begin
 if dm.DS264.Active =false then
  dm.DS264.Open ;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);

begin
if not app_init(dm.Conn) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;
//新建
procedure TfrmMain.N1Click(Sender: TObject);
begin
 try
  frmPuau := TfrmPuau.Create(Application);
  frmPuau._264New:=1;
  frmPuau.showmodal;
 finally
  frmPuau.free;
 end;
end;
//编辑
procedure TfrmMain.N2Click(Sender: TObject);
begin
 try
  frmPuau := TfrmPuau.Create(Application);
  frmPuau.Edit1.Text:=DM.DS264.FieldValues['CODE'];
  frmPuau.Edit2.Text:=DM.DS264.FieldValues['QTE_APPROV_DESC'];
  dm.DS264.Edit ;
  frmPuau._264New:=2;
  frmPuau.showmodal;
 finally
  frmPuau.free;
 end;
end;
procedure TfrmMain.DBGrid1DblClick(Sender: TObject);
begin
 if not DM.DS264.IsEmpty then
  n2click(sender);
end;
//复制
procedure TfrmMain.N3Click(Sender: TObject);
begin
 try
  frmPuau := TfrmPuau.Create(Application);
  frmPuau.Edit1.Text:=DM.DS264.FieldValues['CODE'];
  frmPuau.Edit2.Text:=DM.DS264.FieldValues['QTE_APPROV_DESC'];  
  frmPuau._264New:=3; //复制
  frmPuau.AddString;

  frmPuau.ShowModal;
 finally
  frmPuau.Free;
 end;

end;
//删除
procedure TfrmMain.N4Click(Sender: TObject);
begin
 try
  dm.Conn.BeginTrans;
  dm.Query.close;
  dm.Query.SQL.Text:='delete from data0265 where AUTH_GROUP_PTR='+dm.DS264.fieldbyname('rkey').AsString;
  dm.DS264.Delete;
  dm.Conn.CommitTrans;
 except
  on E: Exception do
   begin
    showmessage(e.Message);
    dm.Conn.RollbackTrans;
   end;
 end;
end;

procedure TfrmMain.ToolButton1Click(Sender: TObject);
begin
 application.Terminate;
end;

end.
