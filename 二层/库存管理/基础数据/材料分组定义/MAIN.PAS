unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, Grids, DBGrids, ComCtrls, Menus,
  Mask, DBCtrls, ADODB;

type
  TForm1 = class(TForm)
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    bitbtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    delete: TMenuItem;
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    ADOTable1rkey: TIntegerField;
    ADOTable1inv_group_name: TStringField;
    ADOTable1inv_group_desc: TStringField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    bitbtn5: TBitBtn;
    ADOTable1Rkey595: TIntegerField;
    procedure bitbtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bitbtn5Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses edit_group,common;


{$R *.dfm}

procedure TForm1.bitbtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.editClick(Sender: TObject);
var
 bar_text:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
begin

 form2:=tform2.Create(application);
 bar_text:=bar1.SimpleText; //保存提示
  adotable1.Edit;

 form1.Hide;
 form2.showmodal;
 bar1.SimpleText := bar_Text+' ';
 bar1.SimpleText := trim(bar1.SimpleText);
 form2.Free;

end;
end;

procedure TForm1.addClick(Sender: TObject);
var
 bk:tbookmark;
 bar_text:string;

begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
begin
 form2:=tform2.Create(application);
 bk:=adotable1.GetBookmark();
 bar_text:=bar1.SimpleText; //保存提示
 form1.Hide;
 adotable1.Append;
 if form2.ShowModal<>mrok then
  begin
   adotable1.GotoBookmark(bk);
   bar1.SimpleText := bar_Text+' ';
   bar1.SimpleText:=trim(bar1.SimpleText);
  end
 else
  begin
   bar1.SimpleText:='搜索:  ';
   bar1.SimpleText:=trim(bar1.SimpleText);
  end;
 form2.Free;
 adotable1.FreeBookmark(bk);
end;
end;

procedure TForm1.deleteClick(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
begin
 if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  adotable1.Delete;
 if adotable1.IsEmpty then
  begin
   bitbtn3.Enabled:=false;
   bitbtn4.Enabled:=false;
  end
 else
  begin
   bitbtn3.Enabled:=true;
   bitbtn4.Enabled:=true;
  end;
end;
end;

procedure TForm1.ADOTable1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('保存失败,请检查组别代码是否重复!',mtwarning,[mbok],0);
 abort;
end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
if pos('Data0496',e.Message)>0 then
 BEGIN
  messagedlg('该记录用于材料类型表!不能删除',mtwarning,[mbok],0);
  abort;
 END;
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
     Adotable1.Locate('inv_group_name',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
   else
     adotable1.First
  end
 else
  if key=chr(vk_return) then    //如果按下了enter
   editClick(sender)           //调用编辑命令
  ELSE
   begin
    bar1.SimpleText :=bar1.SimpleText+key;
    Adotable1.Locate('inv_group_name',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
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

//  rkey73:='2551';
//  user_ptr := '3054';
//  vprev := '4';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin
  adotable1.Open;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if adotable1.IsEmpty then
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

procedure TForm1.FormActivate(Sender: TObject);
begin

 if adotable1.IsEmpty then
  begin
   bitbtn3.Enabled:=false;
   bitbtn4.Enabled:=false;
  end
 else
  begin
   bitbtn3.Enabled:=true;
   bitbtn4.Enabled:=true;
  end;
if trim(bar1.SimpleText) = '' then
 bar1.SimpleText:='搜索:';
end;

procedure TForm1.bitbtn5Click(Sender: TObject);
begin
if not DBGrid1.DataSource.DataSet.IsEmpty then
  Export_dbGrid_to_Excel(DBGrid1, '材料分组');
end;

end.
