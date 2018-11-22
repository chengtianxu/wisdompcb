unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ComCtrls, Menus,DB,comobj,
  DBGrids;

type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    bitExit: TBitBtn;
    bitRefresh: TBitBtn;
    bitExport: TBitBtn;
    bitField: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure bitExitClick(Sender: TObject);
    procedure bitRefreshClick(Sender: TObject);
    procedure bitExportClick(Sender: TObject);
    procedure bitFieldClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    column1,column2:TColumnEh;
    procedure item_click1(Sender: TObject);
    procedure item_click2(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses dmo,common, Insert1, Insert2;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
var i:Integer;
item:TMenuItem;
begin
  if not app_init_2(DM.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  for i:=0 to DBGridEh1.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(self);
    item.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible=True then item.Checked:=True;
    item.OnClick:=item_click1;
    Self.PopupMenu1.Items.Add(item);
  end;
  for i:=0 to DBGridEh2.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(self);
    item.Caption:=DBGridEh2.Columns[i].Title.Caption;
    if DBGridEh2.Columns[i].Visible=True then item.Checked:=True;
    item.OnClick:=item_click2;
    Self.PopupMenu2.Items.Add(item);
  end;
end;

procedure TForm_Main.item_click1(Sender: TObject);
var i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=True;
        Break;
      end;
  end
  else
  begin
    for i := 0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=False;
        Break;
      end;
  end;
end;

procedure TForm_Main.item_click2(Sender: TObject);
var i:Integer;
begin
   (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i := 0 to DBGridEh2.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh2.Columns[i].Title.Caption then
      begin
        DBGridEh2.Columns[i].Visible:=True;
        Break;
      end;
  end
  else
  begin
    for i := 0 to DBGridEh2.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh2.Columns[i].Title.Caption then
      begin
        DBGridEh2.Columns[i].Visible:=False;
        Break;
      end;
  end;
end;

procedure TForm_Main.PageControl1Change(Sender: TObject);
begin
  edit1.Text:='';
  if pageControl1.TabIndex=0 then
    label1.Caption:='装运代码'
  else
    label1.Caption:='国家代码';
end;

procedure TForm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smUpEh then
  begin
    column.Title.SortMarker:=smDownEh;
    dmo.DM.ds370.IndexFieldNames:=column.FieldName+' DESC';
  end
  else
  begin
    column.Title.SortMarker:=smUpEh;
    dmo.DM.ds370.IndexFieldNames:=column.FieldName;
  end;
  if column1.FieldName<>column.FieldName then
  begin
    label1.Caption:=column.Title.Caption;
    column1.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    column1:=column;
    edit1.Text:='';
    edit1.SetFocus;
  end;
end;

procedure TForm_Main.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smUpEh then
  begin
    column.Title.SortMarker:=smDownEh;
    dmo.DM.ds250.IndexFieldNames:=column.FieldName+' DESC';
  end
  else
    column.Title.SortMarker:=smUpEh;
    dmo.DM.ds250.IndexFieldNames:=column.FieldName;
  if column2.FieldName<>column.FieldName then
  begin
    label1.Caption:=column.Title.Caption;
    column2.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    column2:=column;
    edit1.Text:='';
    edit1.SetFocus;
  end;
end;

procedure TForm_Main.Edit1Change(Sender: TObject);
begin
  case pagecontrol1.TabIndex of
  0:
    if trim(edit1.Text)<>'' then
      dmo.DM.ds370.Filter:=column1.FieldName+' like ''%'+trim(edit1.Text)+'%'''
    else
      dmo.DM.ds370.Filter:='';
  1:
    if trim(edit1.Text)<>'' then
      dmo.DM.ds250.Filter:=column2.FieldName+' like ''%'+trim(edit1.Text)+'%'''
    else
      dmo.DM.ds250.Filter:='';
  end;
end;

procedure TForm_Main.bitExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm_Main.bitRefreshClick(Sender: TObject);
begin
  dmo.DM.ds370.Close;
  dmo.DM.ds370.Open;
  dmo.DM.ds370.Refresh;
  dmo.DM.ds250.Close;
  dmo.DM.ds250.Open;
  dmo.DM.ds250.Refresh;
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure TForm_Main.bitExportClick(Sender: TObject);
begin
  case self.PageControl1.TabIndex of
    0:common.export_dbgrideh_to_excel(DBGridEh1,self.Caption);
    1:common.export_dbgrideh_to_excel(DBGridEh2,self.Caption);
  end;
end;

procedure TForm_Main.bitFieldClick(Sender: TObject);
begin
  if self.PageControl1.TabIndex=0 then
    self.PopupMenu1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y)
  else
    self.PopupMenu2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
  Form_Insert1:=TForm_Insert1.Create(application);
  dmo.DM.ds370.Append;
  if Form_Insert1.ShowModal=mrok then;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
  Form_Insert1:=TForm_Insert1.Create(application);
  dmo.DM.ds370.Edit;
  if Form_Insert1.ShowModal=mrok then;
end;

procedure TForm_Main.N3Click(Sender: TObject);
begin
  Form_Insert1:=TForm_Insert1.Create(application);
  Form_Insert1.bitSave.Enabled:=False;
  Form_Insert1.MaskEdit1.Enabled:=False;
  Form_Insert1.DBEdit1.Enabled:=False;
  Form_Insert1.DBEdit2.Enabled:=False;
  Form_Insert1.DBEdit3.Enabled:=False;
  Form_Insert1.DBEdit4.Enabled:=False;
  Form_Insert1.Edit1.Enabled:=False;
  Form_Insert1.BitBtn1.Enabled:=False;
  if Form_Insert1.ShowModal=mrok then;
end;

procedure TForm_Main.N4Click(Sender: TObject);
begin
  if MessageBox(Handle,'数据一旦删除无法恢复，确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
    exit;
  dmo.DM.ADOConnection1.BeginTrans;
  try
    dmo.DM.ds370.Delete;
    dmo.DM.ADOConnection1.CommitTrans;
    showmessage('数据被成功删除!');
    bitRefreshClick(nil);
  except
    dmo.DM.ADOConnection1.RollbackTrans;
  end;
end;

procedure TForm_Main.N5Click(Sender: TObject);
begin
  Form_Insert2:=TForm_Insert2.Create(application);
  dmo.DM.ds250.Append;
  if Form_Insert2.ShowModal=mrok then;
end;

procedure TForm_Main.N6Click(Sender: TObject);
begin
  Form_Insert2:=TForm_Insert2.Create(application);
  dmo.DM.ds250.Edit;
  if Form_Insert2.ShowModal=mrok then;
end;

procedure TForm_Main.N7Click(Sender: TObject);
begin
  Form_Insert2:=TForm_Insert2.Create(application);
  Form_Insert2.btnSave.Enabled:=False;
  Form_Insert2.DBEdit1.Enabled:=False;
  Form_Insert2.DBEdit2.Enabled:=False;
  if Form_Insert2.ShowModal=mrok then;
end;

procedure TForm_Main.N8Click(Sender: TObject);
begin
  if MessageBox(Handle,'数据一旦删除无法恢复，确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=idno then
    exit;
  dmo.DM.ADOConnection1.BeginTrans;
  try
    dmo.DM.ds250.Delete;
    dmo.DM.ADOConnection1.CommitTrans;
    showmessage('数据被成功删除!');
    bitRefreshClick(nil);
  except
    dmo.DM.ADOConnection1.RollbackTrans;
  end;
end;
procedure TForm_Main.FormShow(Sender: TObject);
begin
  if DM.ADOConnection1.Connected then
  begin
    DM.ds370.Prepared;
    DM.ds370.Open;
    dm.ds250.Prepared;
    DM.ds250.Open;
    column1:=self.DBGridEh1.Columns[0];
    column2:=self.DBGridEh2.Columns[0];
    self.PageControl1.TabIndex:=0;
    label1.Caption:='装运代码';
  end;
end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  column1.Free;
  column2.Free;
  dm.ds370.Prepared:=False;
  DM.ds370.Active:=False;
  DM.ds250.Prepared:=False;
  dm.ds250.Active:=False;
  dm.ADOConnection1.Free;
end;

procedure TForm_Main.FormActivate(Sender: TObject);
begin
  Form_Insert1:=TForm_Insert1.Create(application);
  Form_Insert1.bitSave.Enabled:=true;
  Form_Insert1.MaskEdit1.Enabled:=true;
  Form_Insert1.DBEdit1.Enabled:=true;
  Form_Insert1.DBEdit2.Enabled:=true;
  Form_Insert1.DBEdit3.Enabled:=true;
  Form_Insert1.DBEdit4.Enabled:=true;
  Form_Insert1.Edit1.Enabled:=true;
  Form_Insert1.BitBtn1.Enabled:=true;
  Form_Insert2:=TForm_Insert2.Create(application);
  Form_Insert2.btnSave.Enabled:=true;
  Form_Insert2.DBEdit1.Enabled:=true;
  Form_Insert2.DBEdit2.Enabled:=true;
end;

end.
