unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, Mask,
  DBCtrls, Menus, DB, ADODB, DBGridEh;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Bar1: TStatusBar;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    Edit1: TEdit;
    pm1: TPopupMenu;
    DBGd1: TDBGridEh;
    N5: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGd1DblClick(Sender: TObject);
    procedure DBGd1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGd1TitleClick(Column: TColumnEh);
    procedure N5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    PreColumn:TColumnEh;
    sql_text:string;
    procedure item_click(sender:Tobject); //单击菜单

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses damo, edit_invt,common, QrySet;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N2Click(Sender: TObject);
var
// bk:tbookmark;
 rkey:integer;

begin

  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
  
 begin
 try
  form2:=tform2.Create(application);

  if (DM.ADO496.FieldByName('INSPECT').AsString='') then
   form2.ComboBox2.ItemIndex:=-1
  else
   if (DM.ADO496.FieldByName('INSPECT').AsString='Y') then
    form2.ComboBox2.ItemIndex:=0
   else
    form2.ComboBox2.ItemIndex:=1;

   if (DM.ADO496.FieldByName('CATALOG_NUM').AsString='') then
     form2.ComboBox3.ItemIndex:=-1
   else
    if (Trim(DM.ADO496.FieldByName('CATALOG_NUM').AsString)='Y') then
     form2.ComboBox3.ItemIndex:=0
    else
     form2.ComboBox3.ItemIndex:=1;

  if (DM.ADO496.FieldByName('AVL_FLAG').AsString='') then
   form2.ComboBox4.ItemIndex:=-1
  else
   if (DM.ADO496.FieldByName('AVL_FLAG').AsString='Y') then
    form2.ComboBox4.ItemIndex:=0
   else
    form2.ComboBox4.ItemIndex:=1;

   if (DM.ADO496.FieldByName('IF_FLAG').AsInteger=3) then
    Form2.BitBtn5.Enabled := True;


   if (DM.ADO496.FieldByName('Rkey595').AsString<>'') then
   begin
   with DM.ADOQuery3 do
    begin
    Close;
    sql.Text:= 'select * from data0595 where rkey='+ DM.ADO496.FieldByName('Rkey595').AsString;
    Open;
    Form2.Edit4.Text := trim(FieldValues['TYPE_CODE']);
    Form2.label14.Caption:=trim(FieldValues['TYPE_NAME']);
    end;

    Form2.Edit4.Tag := DM.ADO496.FieldByName('Rkey595').AsInteger;
   end;


  Form2.Edit3.Text:=DM.ADO496.FieldByName('SHELF_LIFE').AsString;
  dm.ADO496.Edit;
  form1.Hide;
  if form2.ShowModal=mrok then
  begin
   rkey:=dm.ADO496RKEY.Value;
   dm.ADO496.close;
   dm.ADO496.open;
   dm.ADO496.Locate('rkey',rkey,[]);
  end;

 finally

  form2.free;
 end;

end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
// bk:tbookmark;
 rkey:integer;

begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else
 begin
 try
  form2:=tform2.Create(application);
 // bk:=dm.ADO496.GetBookmark();
  rkey:=dm.ADO496RKEY.Value;
  dm.ADO496.Append;
  dm.ADO496ttype.Value:='P';
  dm.ADO496IF_FLAG.Value:=0;
  dm.ADO496quote_flag.Value:=false;
  dm.ADO496IsMaster.Value:=false;

  form1.Hide;
  if form2.ShowModal=mrok then
  begin
   rkey:=dm.ADO496RKEY.Value;
   dm.ADO496.close;
   dm.ADO496.open;
   dm.ADO496.Locate('rkey',rkey,[]);
  end
  else
    dm.ADO496.Locate('rkey',rkey,[]);
//  dm.ADO496.GotoBookmark(bk);
 finally
//  dm.ADO496.FreeBookmark(bk);

  form2.free;
 end;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
    if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbCancel],0)
  else

 begin

 if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOConnection1.BeginTrans;
       try
          DM.temp.Close;
          DM.temp.SQL.Text:='delete from data0496  where rkey='+dm.ADO496RKEY.AsString;
          DM.temp.ExecSQL;
          DM.ADOConnection1.CommitTrans;
          showmessage('数据被成功删除!');
          BitBtn2Click(nil);
       except
         DM.ADOConnection1.RollbackTrans;
         showmessage('系统默认材料类型不能删除!');
       end;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:Integer;
    item:Tmenuitem;
begin
  if not app_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
 self.Caption:=application.Title;
//  rkey73:='851';
//  user_ptr := '963';
//  vprev := '4';

  DM.ADO496.Close;
  DM.ADO496.Open;
  sql_text:=DM.ADO496.CommandText;
  PreColumn:=DBGd1.Columns[0];

  for i:=0 to DBGd1.columns.Count-1 do
  begin //动态增加列名到现银定义字段菜单中
    item:=Tmenuitem.Create(self);
    item.Caption:=DBGd1.columns[i].Title.caption;
    if DBGd1.Columns[i].Visible then item.Checked:=true;
    item.onClick:=item_click;
    self.PM1.Items.Add(item);
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADO496.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n5.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n5.Enabled:=true;
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  bar1.SimpleText:='搜索:';
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 dm.ADO496.Close;
 dm.ADO496.Open;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  pm1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm1.item_click(sender:Tobject);
var i:byte;
begin
  (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
  if (sender as Tmenuitem).Checked then
    for i:=0 to DBGd1.Columns.Count-1 do
       if (sender as Tmenuitem).Caption=DBGd1.Columns[i].Title.Caption then
        begin
         DBGd1.Columns[i].Visible:=true;
         break;
        end;
  if not (sender as Tmenuitem).Checked then
    for i:=0 to DBGd1.Columns.Count-1 do
      if (sender as Tmenuitem).Caption=DBGd1.Columns[i].Title.Caption then
      begin
        DBGd1.Columns[i].Visible:=false;
        break;
      end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGd1,Self.Caption);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    DM.ADO496.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    DM.ADO496.Filter:=''
end;

procedure TForm1.DBGd1DblClick(Sender: TObject);
begin
  if not dm.ADO496.IsEmpty then
     n5click(sender);
end;

procedure TForm1.DBGd1KeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
   bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
  if length(bar1.SimpleText)>5 then
   dm.ADO496.Locate('group_name',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
  else
   dm.ADO496.First
 end
else
 if (key=chr(vk_return)) AND (NOT dm.ADO496.IsEmpty) then    //如果按下了enter
  n2click(sender)                               //调用编辑命令
 ELSE
  begin
   bar1.SimpleText := bar1.SimpleText+key;
   dm.ADO496.Locate('group_name',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
  end;
end;

procedure TForm1.DBGd1TitleClick(Column: TColumnEh);
begin
 if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
   begin
    column.Title.SortMarker:=smUpEh;
    dm.ADO496.IndexFieldNames:=Column.FieldName;
   end
  else
   begin
    column.Title.SortMarker:=smDownEh;
    dm.ADO496.IndexFieldNames:=Column.FieldName+' DESC';
   end;

  if (PreColumn.FieldName <> column.FieldName)
     and  (column.Field.DataType in [ftString,ftWideString]) then
   begin
    edit1.Text:='';
    edit1.SetFocus;
    label4.Caption := column.Title.Caption ;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
   end
  else
    edit1.SetFocus;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  dm.ADO496.Edit;
  form1.Hide;
  form2.BitBtn1.Enabled:=False;
  form2.DBEdit1.Enabled:=False;
  form2.DBEdit2.Enabled:=False;
  form2.DBEdit3.Enabled:=False;
  form2.ComboBox1.Enabled:=False;
  form2.DBRadioGroup1.Enabled:=False;
  Form2.BitBtn3.Enabled:=False;
  form2.BitBtn4.Enabled:=False;
  Form2.SGrid1.Enabled:=False;
  Form2.ComboBox2.Enabled:=False;
  Form2.Edit3.Enabled:=False;
  Form2.ComboBox3.Enabled:=False;
  Form2.ComboBox4.Enabled:=False;
  Form2.DBCheckBox1.Enabled:=False;
  Form2.DBCheckBox2.Enabled:=False;


  if (DM.ADO496.FieldByName('INSPECT').AsString='') then
   form2.ComboBox2.ItemIndex:=-1
  else
   if
    (DM.ADO496.FieldByName('INSPECT').AsString='Y') then
     form2.ComboBox2.ItemIndex:=0
   else
     form2.ComboBox2.ItemIndex:=1;

  if (DM.ADO496.FieldByName('CATALOG_NUM').AsString='') then
   form2.ComboBox3.ItemIndex:=-1

  else
  if (Trim(DM.ADO496.FieldByName('CATALOG_NUM').AsString)='Y') then
   form2.ComboBox3.ItemIndex:=0
  else
   form2.ComboBox3.ItemIndex:=1;

  if (DM.ADO496.FieldByName('AVL_FLAG').AsString='') then
   form2.ComboBox4.ItemIndex:=-1
  else
  if (DM.ADO496.FieldByName('AVL_FLAG').AsString='Y') then
   form2.ComboBox4.ItemIndex:=0
  else
   form2.ComboBox4.ItemIndex:=1;

  Form2.Edit3.Text:=DM.ADO496.FieldByName('SHELF_LIFE').AsString;

   if (DM.ADO496.FieldByName('Rkey595').AsString<>'') then
   begin
   with DM.ADOQuery3 do
    begin
    Close;
    sql.Text:= 'select * from data0595 where rkey='+ DM.ADO496.FieldByName('Rkey595').AsString;
    Open;
    Form2.Edit4.Text := trim(FieldValues['TYPE_CODE']);
    Form2.label14.Caption:=trim(FieldValues['TYPE_NAME']);
    end;
   end;

  form2.ShowModal;
 finally
  form2.free;
 end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i:integer;
begin
  Qry:=TQry.Create(Application);
  if Qry.ShowModal=mrok then
  with DM.ADO496 do
  begin
    close;
    commandtext:=sql_text;
    for i:=1 to qry.SGrid1.RowCount-1 do
      commandtext:=commandtext+qry.SGrid1.Cells[2,i];
    open;
  end;
  qry.Free;
end;

procedure TForm1.DBGd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
    ShowMessage(dm.ADO496.CommandText);
end;

end.
