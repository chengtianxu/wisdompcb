unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, ADODB, Menus,
  ExtCtrls;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    copydate: TMenuItem;
    delete: TMenuItem;
    ADOTable1NP_CODE: TStringField;
    ADOTable1NOTE_PAD_LINE_1: TStringField;
    ADOTable1NOTE_PAD_LINE_2: TStringField;
    ADOTable1NOTE_PAD_LINE_3: TStringField;
    ADOTable1NOTE_PAD_LINE_4: TStringField;
    ADOConnection1: TADOConnection;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure deleteClick(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure copydateClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses editnote,common;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.editClick(Sender: TObject);
var
i:byte;
begin
 form2:=tform2.Create(application);
 Adotable1.Edit;
 for i:=1 to 4 do
 form2.memo1.lines.add(adotable1.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
 form2.ShowModal;
 form2.free;
end;

procedure TForm1.addClick(Sender: TObject);
var
 bk:tbookmark;
begin
 bk:=adotable1.GetBookmark();
 form2:=tform2.Create(application);
 adotable1.Append;
 if form2.ShowModal<>mrok then
  adotable1.GotoBookmark(bk);
 adotable1.FreeBookmark(bk);
 form2.Free;
end;

procedure TForm1.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数据保存失败,请检查编号是否重复!',mtwarning,[mbok],0);
 abort;
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

procedure TForm1.copydateClick(Sender: TObject);
var
 i:byte;
begin
 form2:=tform2.Create(application);
 for i:=1 to 4 do
 form2.memo1.lines.add(adotable1.fieldbyname('note_pad_line_'+inttostr(i)).asstring);
 Adotable1.Append;
 form2.ShowModal;
 form2.Free;
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
     Adotable1.Locate('np_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
    else
     adotable1.First
   end
  else
    if key=chr(vk_return) then    //如果按下了enter
      editClick(sender)           //调用编辑命令
    ELSE
     begin
     bar1.SimpleText :=bar1.SimpleText+key;
     Adotable1.Locate('np_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
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

procedure TForm1.FormShow(Sender: TObject);
begin
if adoconnection1.Connected then
 begin
  adotable1.Open;
 end; 
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
IF ADOtable1.IsEmpty then
 begin
  edit.Enabled:=false;
  copydate.Enabled:=false;
  delete.Enabled:=false;
 end
else
 begin
  edit.Enabled:=true;
  copydate.Enabled:=true;
  delete.Enabled:=true;
 end;
end;

end.
