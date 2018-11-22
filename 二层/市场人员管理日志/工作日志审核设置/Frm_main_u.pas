unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGridEh, Menus;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Grd1: TDBGridEh;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Grd2: TDBGridEh;
    Grd3: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
 uses dm_u,common,Frm_Edit_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOCon) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
  exit;
 end;
 self.caption:=application.Title;


// rkey73:='851';
// vprev:='4';
// dm.ADOCon.Open;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 BitBtn3Click(nil);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
var s:string;
begin
  if not Dm.ADOData720_1.IsEmpty then s:=DM.ADOData720_1GrpName.Value;
  Dm.ADOData720_3.Close;
  Dm.ADOData720_2.Close;
  Dm.ADOData720_1.Close;
  Dm.ADOData720_1.open;

  if not Dm.ADOData720_1.IsEmpty then
  begin
    Dm.ADOData720_1.Locate('GrpName',s,[]);
    Dm.ADOData720_2.Parameters[0].Value:=DM.ADOData720_1GrpName.Value;
    Dm.ADOData720_2.Open;
    Dm.ADOData720_3.Parameters[0].Value:=DM.ADOData720_1GrpName.Value;
    Dm.ADOData720_3.Open;
  end;
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  case TMenuitem(Sender).Tag of
  0,1:
     try
       Frm_Edit:=TFrm_Edit.Create(nil);
       Frm_Edit.Ftag:=TMenuitem(Sender).Tag;
       Frm_Edit.init;
       if Frm_Edit.ShowModal=mrok then BitBtn3Click(nil);
     finally
       Frm_Edit.Free;
     end;
   2:begin
       if MessageBox(Handle,'确定删除此业务组?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
       DM.tmp.Close;
       DM.tmp.SQL.Text:='delete from data0720 where GrpName='''+DM.ADOData720_1GrpName.Value+'''';
       DM.ADOData720_1.Prior;
       if DM.tmp.ExecSQL>0 then BitBtn3Click(nil);
     end;
  end;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(vprev='2') or (vprev='4');
  N2.Enabled:=N1.Enabled and not DM.ADOData720_1.IsEmpty;
  N3.Enabled:=N2.Enabled;
end;

end.
