unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, Mask,
  DBCtrls, Menus, ADODB;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PopupMenu1: TPopupMenu;
    append: TMenuItem;
    edit: TMenuItem;
    copydata: TMenuItem;
    delete: TMenuItem;
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    procedure BitBtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure appendClick(Sender: TObject);
    procedure copydataClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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

uses editcountry,common;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
 close;
end;

procedure TForm1.editClick(Sender: TObject);
begin
 adotable1.Edit;
 form2.DBEdit1.SelectAll;
 form2.showmodal;
end;

procedure TForm1.appendClick(Sender: TObject);
var
 bk:tbookmark;
begin
 bk:=adotable1.GetBookmark;
 adotable1.Append;
 if form2.showmodal<>mrok then
 adotable1.GotoBookmark(bk);
 adotable1.FreeBookmark(bk);
end;

procedure TForm1.copydataClick(Sender: TObject);
var
 v_country_name:string;
begin
 v_country_name:=adotable1.FieldValues['country_name'];
 adotable1.Append;
 adotable1.FieldValues['country_name']:=v_country_name;
 form2.showmodal;
end;


procedure TForm1.deleteClick(Sender: TObject);
begin
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
   adotable1.Delete;
end;

procedure TForm1.ADOTable1AfterDelete(DataSet: TDataSet);
begin
  messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  messagedlg('数据保存失败,请检查编号是否重复!',mtWarning,[mbOk],0);
  Abort;
end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  messagedlg('无法删除该记录,已被其它数据使用!',mtWarning,[mbOk],0);
  Abort;
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
     Adotable1.Locate('country_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
    else
     adotable1.First
   end
  else
    if key=chr(vk_return) then    //如果按下了enter
      editClick(sender)           //调用编辑命令
    ELSE
     begin
     bar1.SimpleText :=bar1.SimpleText+key;
     Adotable1.Locate('country_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
     end;
 end;


procedure TForm1.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin
  adotable1.Open;
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
if adotable1.IsEmpty then
 begin
  edit.Enabled:=false;
  copydata.Enabled:=false;
  delete.Enabled:=false;
 end
else
 begin
  edit.Enabled:=true;
  copydata.Enabled:=true;
  delete.Enabled:=true;
 end;
end;

end.
