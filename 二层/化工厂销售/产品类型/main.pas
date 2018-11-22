unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, DB, Grids, DBGrids, ADODB, ComCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    delete: TMenuItem;
    Button5: TButton;
    db_ptr: TLabel;
    procedure addClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
 
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses edit, Unit1,common;

{$R *.dfm}

procedure TForm1.addClick(Sender: TObject);
var
 bk:tbookmark;
begin
form2.edit1.text:='';
form2.edit2.text:='';
form1.Hide;
dm.ADOTable1.append;
 bk:=DM.adotable1.GetBookmark();
 if form2.ShowModal<>mrok then
  begin
   dm.ADOTable1.Cancel;
   DM.adotable1.GotoBookmark(bk);
  end;
dm.adotable1.freebookmark(bk);
end;

procedure TForm1.editClick(Sender: TObject);
begin
DM.adotable1.Edit;
form2.edit1.text:=dm.ADOTable1PR_GRP_CODE.Value;
form2.edit2.text:=dm.ADOTable1PRODUCT_GROUP_NAME.Value;
form1.Hide;
form2.showmodal;
end;

procedure TForm1.deleteClick(Sender: TObject);
begin
 if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  DM.adotable1.Delete;
 IF DM.adotable1.IsEmpty then
  begin
   button2.Enabled:=false;
   button3.Enabled:=false;
  end
 else
  begin
   button2.Enabled:=true;
   button3.Enabled:=true;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if DM.adotable1.IsEmpty then
 begin
  edit.Enabled:=false;
  delete.Enabled:=false;
 end
else
 begin
  edit.Enabled:=true;
  delete.Enabled:=true;
 end;
end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
DM.adotable1.Edit;
form2.show;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
if dm.ADOConnection1.Connected then
 begin

 DM.adotable1.Open;
 if DM.adotable1.IsEmpty then
  begin
   button2.Enabled:=false;
   button3.Enabled:=false;
  end
 else
  begin
   button2.Enabled:=true;
   button3.Enabled:=true;
  end;

 end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  NewString: string;
  clickedok: boolean;
begin
  NewString := '';
  clickedok := InputQuery('查询窗口','请输入产品种类代码', NewString);
  if clickedok then      { NewString contains new input string }
  dm.ADOTable1.locate('PR_GRP_CODE', NewString ,[lopartialkey]);
end;

procedure TForm1.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('保存失败,请检查产品种类代码是否重复!',mtwarning,[mbok],0);
 abort;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ADOTable1.IsEmpty then
 editclick(sender);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin

  if not app_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;


end;

end.
