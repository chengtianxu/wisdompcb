unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ComCtrls, Mask,
  DBCtrls, Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    AT370: TADOTable;
    DataSource1: TDataSource;
    AT370RKEY: TAutoIncField;
    AT370CODE: TStringField;
    AT370DESCRIPTION: TStringField;
    AT370SCAC_CODE: TStringField;
    AT370VEHICLE: TStringField;
    AT370SHIPPERS_LEAD_TIME: TIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    AT370customer_ptr: TIntegerField;
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure AT370AfterDelete(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses aded_method,common;

{$R *.dfm}

procedure TForm1.N1Click(Sender: TObject);
var
 bk:tbookmark;
begin
try
 form2:=tform2.Create(application);
 bk:=at370.GetBookmark();
 aT370.Append;
 if form2.ShowModal<>mrok then
  aT370.GotoBookmark(bk);
finally
 form2.free;
end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 if messagedlg('请确认是否要删除该记录?',mtconfirmation,[mbyes,mbno],0)=mryes then
  at370.delete;
end;

procedure TForm1.AT370AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据成功删除!',mtinformation,[mbok],0)
end;

procedure TForm1.N2Click(Sender: TObject);
begin
try
 form2:=tform2.Create(application);
 aT370.edit;
 if form2.ShowModal=mrok then
  begin
  end
 else
  at370.Cancel; 
finally
 form2.free;
end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
 if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
   bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
  if length(bar1.SimpleText)>5 then
   At370.Locate('code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
  else
   at370.First
 end
 else
 if (key=chr(vk_return)) AND (NOT at370.IsEmpty) then    //如果按下了enter
  n2click(sender)                               //调用编辑命令
 ELSE
  begin
   bar1.SimpleText := bar1.SimpleText+key;
   At370.Locate('code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
  end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
 if not at370.IsEmpty then
  n2click(sender);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 if adoconnection1.Connected then
  begin

   AT370.Open;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not app_init_2(self.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
 self.Caption:=application.Title;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if at370.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
 end;
end;

end.
