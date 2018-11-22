unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Grids, DBGrids, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label10: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
    itype:integer;
  end;

var
  Form1: TForm1;

implementation

uses demo,detail,common;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;
  with dm do begin
  ado037.Close;
  ado037.Open;
  end;
  dm.ADO037.Open;
  field_name:='part_name'
end;


procedure TForm1.Edit1Change(Sender: TObject);
begin
IF TRIM(EDIT1.TEXT)<>'' THEN
dm.ADO037.Filter := field_name+' like ''%'+trim(EDIT1.TEXT)+'%'''
ELSE
dm.ADO037.FILTER := '';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
dm.ADO037.Close;
dm.ADO037.Open;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
end;
if (strtoint(vprev)=2) or (strtoint(vprev)=4) then
begin
itype:=0;//表示新增
application.CreateForm(tform2,form2);
form2.ShowModal;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
begin
messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
end;
if (strtoint(vprev)=2) or (strtoint(vprev)=4) then
begin
itype:=1;//表示编辑
application.CreateForm(tform2,form2);
form2.ShowModal;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
itype:=2;//表示检查
application.CreateForm(tform2,form2);
form2.ShowModal;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if Messagedlg('确认要删除这条记录吗？',mtConfirmation,[mbYes,mbNo],0) = mrYes then
begin
  dm.ADOConnection1.BeginTrans;
  try
   dm.ADO37.Close;
   dm.ADO37.Parameters[0].Value:=dm.ADO037part_name.Value;
   dm.ADO37.Open;
  with dm.ADO42 do   //先删除子部件流程表(从表)
   begin
    if active=true then active:=false;
    Parameters[0].Value := dm.ADO037part_name.Value;
    active:=true;
    if not isempty then delete;
   end;

   dm.ADO37.Delete;//再删除主表
   dm.ADOConnection1.CommitTrans;
   dm.ADO42.Close;
   dm.ADO037.Close;//更新数据集
   dm.ADO037.Open;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据删除不成功!',mtwarning,[mbcancel],0);
   end;
   end;
end;


end.
