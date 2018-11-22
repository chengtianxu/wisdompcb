unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ToolWin, ComCtrls, Grids, DBGrids, Menus, DB, ExtCtrls,
  StdCtrls;

type
  TfrmMain = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolButton7: TToolButton;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private

    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uDM, uEditGY,common;

{$R *.dfm}
procedure TFrmMain.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
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
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

 if dm.Conn.Connected then
  begin
 if dm.Qery346.Active =false then dm.Qery346.Open ;
 if dm.Qery348.Active =false then dm.Qery348.Open ;
  end;

end;
 //新增
procedure TfrmMain.ToolButton1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmEditGY,frmEditGY);
    frmEditGY._348New:=true;
    dm.Qery351.Close;
    dm.Qery351.Parameters.ParamValues['vrkey']:=0;
    dm.Qery351.open;
    frmEditGY.ShowModal;
  finally
    frmEditGY.free;
  end;
end;
//编辑
procedure TfrmMain.ToolButton2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmEditGY,frmEditGY);
    frmEditGY._348New:=false;
    frmEditGY.Edit1.Text:=dm.Qery346.FieldValues['ROW_NAME'];
    frmEditGY.Edit2.Text:=dm.Qery346.Fieldbyname('ROW_VALUE').AsString;
    frmEditGY.Edit4.Text:=dm.Qery346.Fieldbyname('KLAmount').AsString;
    frmEditGY.Edit5.Text:=dm.Qery346.Fieldbyname('sampleAmount').AsString;

    if DM.Qery346prod_route_ptr.Value<>0 then
    begin
      frmEditGY.Edit3.Tag:=strtoint(DM.Qery346prod_route_ptr.Text);
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select * from data0264 where rkey='+DM.Qery346prod_route_ptr.Text;
        Open;
        frmEditGY.Edit3.Text:=FieldValues['code'];
        frmEditGY.Label4.Caption:=FieldValues['qte_approv_desc'];
      end;
    end
    else
    begin
      frmEditGY.Edit3.Tag:=0;
      frmEditGY.Edit3.Text:='';
      frmEditGY.Label4.Caption:='';
    end;
    dm.Qery351.Close;
    dm.Qery351.Parameters.ParamValues['vrkey']:=dm.Qery346.FieldValues['rkey'];
    dm.Qery351.open;
    frmEditGY.ShowModal;
  finally
    frmEditGY.free;
  end;
end;

//删除
procedure TfrmMain.ToolButton6Click(Sender: TObject);
var
 vrcnoP,vrcnoN:integer;
begin
 try
   if messagedlg('确认删除吗？',mtwarning,[mbyes,mbno],0)=mrno then exit;

   dm.Qery.Close ;
   dm.Qery.SQL.Text:='select * from data0085  where ENGR_ROUTE_PTR='+dm.Qery346.Fieldbyname('rkey').AsString;
   dm.Qery.Open ;
   if dm.Qery.RecordCount<>0 then
   begin
    messagedlg('已经引用不能删除！',mtwarning,[mbcancel],0);
    exit;
   end;
  if dm.Qery346.RecordCount>1 then
   begin
    vrcnoP:=dm.Qery346.FieldValues['rkey'];
    dm.Qery346.Next;
    vrcnoN:=dm.Qery346.FieldValues['rkey'];
   end;
  dm.Conn.BeginTrans;
  begin
    dm.Qery.Close ;
    dm.Qery.SQL.Text:='delete from data0346 where rkey='+inttostr(vrcnoP);
    dm.Qery.ExecSQL;
   end;

  dm.Conn.CommitTrans;
  dm.Qery346.Close;
  dm.Qery346.Open ;
  dm.Qery346.Locate('rkey',vrcnoN,[]);
 except
  on E: Exception do
   begin
    messagedlg(e.Message,mtwarning,[mbcancel],0);
    dm.Conn.RollbackTrans;
   end;
 end;
end;
//退出
procedure TfrmMain.ToolButton7Click(Sender: TObject);
begin
 close;
end;

procedure TfrmMain.Edit1Change(Sender: TObject);
begin
if edit1.Text<>'' then
 dm.Qery346.Filter := 'ROW_NAME like '''+trim(edit1.Text)+'%'''
else
 dm.Qery346.Filter := '';

end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin

 if (vprev='1') or (vprev='3') then
  begin
   N1.Enabled:=false;
   N2.Enabled:=false;
   N3.Enabled:=false;
  end
 else
  begin
   N1.Enabled:=true;
   N2.Enabled:=true;
   N3.Enabled:=true;
  end;


end;

end.
