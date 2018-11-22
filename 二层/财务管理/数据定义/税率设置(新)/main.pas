unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,DB;

type
  TForm_main = class(TForm)
    pnl1: TPanel;
    lblColumn: TLabel;
    btnExit: TBitBtn;
    btnField: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BtQry: TBitBtn;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N4Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    
   
  private
    { Private declarations }
    PreColumn:TColumnEh;
    sql_text:string;
    procedure item_click(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses damo,common, budget, QrySet;

{$R *.dfm}

procedure TForm_main.btnExitClick(Sender: TObject);
begin
close;
application.Terminate;
end;

procedure TForm_main.btnRefreshClick(Sender: TObject);
var
 rkey189:integer;
begin
  rkey189:=dm.ds189RKEY.Value;
  dm.ds189.Close;
  dm.ds189.Prepared;
  dm.ds189.Open;
  if rkey189>0 then
   dm.ds189.Locate('rkey',rkey189,[]);
end;


procedure TForm_main.btnExportClick(Sender: TObject);
begin
 if not dm.ds189.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm_main.FormActivate(Sender: TObject);
begin
StatusBar1.SimpleText:='搜索：';
end;

procedure TForm_main.FormCreate(Sender: TObject);
var i:Integer;
item:TMenuItem;
begin
  if not app_init_2(DM.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  sql_text:=DM.ds189.CommandText;
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

procedure TForm_main.btnFieldClick(Sender: TObject);
begin
PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm_main.FormShow(Sender: TObject);
begin
if DM.ADOConnection1.Connected then
  begin
    DM.ds189.Open;
    PreColumn:=DBGridEh1.Columns[0];
    DBGridEh1.Canvas.Brush.Color:=clBlue;
  end;
 
end;

procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker=smDownEh) or (column.Title.SortMarker=smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ds189.IndexFieldNames:=column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ds189.IndexFieldNames:=column.FieldName+' DESC';
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

procedure TForm_main.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  begin
    DM.ds189.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%''';
  end
 else
  begin
    DM.ds189.Filter:='';
  end;
end;

procedure TForm_main.N3Click(Sender: TObject);
begin

    Form_budget:=TForm_budget.create(Application);
    Form_budget.v_status:=2;
    Form_budget.SpeedButton7.Enabled :=false;
    Form_budget.Edit1.Enabled :=false;
    Form_budget.Edit2.Enabled :=false;
    Form_budget.Edit3.Enabled :=false;
    Form_budget.ShowModal;
    Form_budget.free;
end;

procedure TForm_main.N1Click(Sender: TObject);

begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
try
  form_budget:=Tform_budget.Create(Application);
  Form_budget.v_status:=0;
  if form_budget.ShowModal=mrok then
  begin
   dm.ds189.Close;
   dm.ds189.Open;
   dm.ds189.Locate('rkey',Form_budget.rkey189,[]);
   ShowMsg('新增操作成功!',1);
  end;
finally
  form_budget.Free;
end;
end;



procedure TForm_main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
  try
    Form_budget:=TForm_budget.create(Application);
    Form_budget.v_status:=1;
    form_budget.rkey189:=dm.ds189RKEY.Value;
    if Form_budget.ShowModal=mrOk then
    begin
      btnRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    Form_budget.free;
  end;
end;

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ds189.CommandText);
end;

procedure TForm_main.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
if MessageDlg('您确定删除该代号吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
 begin
 try
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='delete data0189 where STATE_ID='+quotedstr(dm.ds189STATE_ID.Value) ;

   if ExecSQL>0 then
    begin
     common.ShowMsg('删除操作成功！',1);
     self.btnRefreshClick(Sender);
    end;
  end;

 except
  on E: Exception do
   begin
   messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
 end;

end;


procedure TForm_main.BtQryClick(Sender: TObject);
var i:integer;
begin
  Qry:=TQry.Create(Application);
  if Qry.ShowModal=mrok then
  with DM.ds189 do
  begin
    close;
    commandtext:=sql_text;
    for i:=1 to qry.SGrid1.RowCount-1 do
      commandtext:=commandtext+qry.SGrid1.Cells[2,i];
    open;
  end;
  
end;

procedure TForm_main.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(StatusBar1.SimpleText)>5 then
   StatusBar1.SimpleText:=copy(StatusBar1.SimpleText,1,length(StatusBar1.SimpleText)-1);
  if length(StatusBar1.SimpleText)>5 then
   Dm.ds189.Locate('STATE_ID',copy(StatusBar1.SimpleText,6,length(StatusBar1.SimpleText)),searchoption)
  else
   dm.ds189.First
 end
else
 if (key=chr(vk_return)) AND (NOT dm.ds189.IsEmpty) then    //如果按下了enter
  btnRefreshclick(sender)                               //调用编辑命令
 ELSE
  begin
   StatusBar1.SimpleText := StatusBar1.SimpleText+key;
   dm.ds189.Locate('STATE_ID',copy(StatusBar1.SimpleText,6,length(StatusBar1.SimpleText)),searchoption);
  end;
end;

end.


