unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, ComCtrls, DBGrids, Grids,
  DBGridEh, Menus,common;

type
  TForm_Main = class(TForm)
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnField: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ds76: TADODataSet;
    lblColumn: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ds76RKEY: TAutoIncField;
    ds76CODE: TStringField;
    ds76REJECT_DESCRIPTION: TStringField;
    ds04: TADODataSet;
    ds04CONTROL_NO_LENGTH: TSmallintField;
    ds04SEED_VALUE: TStringField;
    ds04SEED_FLAG: TWordField;
    DBGridEh1: TDBGridEh;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ds76AfterDelete(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure ds76PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    PreColumn:TColumnEh;
    procedure item_click(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses InsertCode;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
var i:Integer;
item:TMenuItem;
begin
  if not app_init_2(self.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  for i:=0 to DBGridEh1.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then item.Checked:=True;
    item.OnClick:=item_click;
    Self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm_Main.item_click(Sender: TObject);
var i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i:=0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=True;
        Break;
      end;
  end
  else
  begin
    for i:=0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=False;
        Break;
      end;
  end;
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
  if ADOConnection1.Connected then
  begin
    ds76.Prepared;
    ds76.Open;
    ds04.Open;
    PreColumn:=DBGridEh1.Columns[0];
    DBGridEh1.Canvas.Brush.Color:=clBlue;
  end;
end;

procedure TForm_Main.FormActivate(Sender: TObject);
begin
  StatusBar1.SimpleText:='搜索：';
end;

{退出按扭事件}
procedure TForm_Main.btnExitClick(Sender: TObject);
begin
  close;
end;

{刷新按扭事件}
procedure TForm_Main.btnRefreshClick(Sender: TObject);
begin
  ds76.Close;
  ds76.Open;
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure TForm_Main.btnExportClick(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGridEh1,self.Caption);
end;

{字段按扭事件}
procedure TForm_Main.btnFieldClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

{鼠标单击DBGridEh标题事件}
procedure TForm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker=smDownEh) or (column.Title.SortMarker=smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ds76.IndexFieldNames:=column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ds76.IndexFieldNames:=column.FieldName+' DESC';
  end;
  if PreColumn.FieldName <> column.FieldName then
  begin
    lblColumn.Caption := column.Title.Caption;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn:=column;
    edit1.SetFocus;
    edit1.Text:='';
  end
  else
    edit1.SetFocus;
end;

{编辑框改变事件}
procedure TForm_Main.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
  begin
    ds76.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%''';
  end
  else
  begin
    ds76.Filter:='';
  end;
end;

{右击菜单新建事件}
procedure TForm_Main.N1Click(Sender: TObject);
begin
  Form_InsertCode := TForm_InsertCode.Create(Application);
  Form_InsertCode.Caption:='材料拒收定义';
  ds76.Append;
  Form_InsertCode.showmodal;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
  Form_InsertCode:=TForm_InsertCode.Create(application);
  Form_InsertCode.Caption:=Application.Title;
  ds76.Edit;
  Form_InsertCode.ShowModal;
end;

procedure TForm_Main.N3Click(Sender: TObject);
var description:string;
begin
  Form_InsertCode := TForm_InsertCode.Create(Application);
  Form_InsertCode.Caption:='材料拒收定义';
  description:=ds76REJECT_DESCRIPTION.Value;
  ds76.Append;
  ds76REJECT_DESCRIPTION.Value:=description;
  Form_InsertCode.showmodal;
end;

{DBGridEh右击菜单删除事件}
procedure TForm_Main.N4Click(Sender: TObject);
begin
  if messagedlg('数据一旦删除无法恢复,你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    ds76.Delete;
end;

procedure TForm_Main.ds76AfterDelete(DataSet: TDataSet);
begin
  messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm_Main.ds76PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  messagedlg('数据保存失败,请检查编号是否重复!',mtwarning,[mbok],0);
  abort;
end;

procedure TForm_Main.FormKeyPress(Sender: TObject; var Key: Char);
var
searchoption:tlocateoptions;
begin
  searchoption:=[lopartialkey];
  if Key = Chr(vk_Back) then       //如果按下了backspace
  begin
    if length(StatusBar1.SimpleText)>5 then
      StatusBar1.SimpleText:=copy(StatusBar1.SimpleText,1,length(StatusBar1.SimpleText)-1);
    if length(StatusBar1.SimpleText)>5 then
      ds76.Locate(ds76.IndexFieldNames,copy(StatusBar1.SimpleText,6,length(StatusBar1.SimpleText)),searchoption)
    else
      ds76.First;
 end
 else
   if (key=chr(vk_return)) AND (NOT ds76.IsEmpty) then    //如果按下了enter
     n2click(sender)                               //调用编辑命令
   else
   begin
     StatusBar1.SimpleText := StatusBar1.SimpleText+key;
     ds76.Locate(ds76.IndexFieldNames,copy(StatusBar1.SimpleText,6,length(StatusBar1.SimpleText)),searchoption);
   end;
end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  precolumn.Free;
  ds76.Active := False;
  Adoconnection1.Free;
end;

end.
