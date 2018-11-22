unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB,Adodb,
  Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGd1: TDBGridEh;
    DBGd2: TDBGridEh;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    delete: TMenuItem;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    check: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGd1TitleClick(Column: TColumnEh);
    procedure DBGd2TitleClick(Column: TColumnEh);
    procedure PageControl1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure checkClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    precolumn1:Tcolumneh;
    precolumn2:Tcolumneh;
    sql_text1:string;
    sql_text2:string;
    procedure item_click1(sender:Tobject); //单击菜单
    procedure item_click2(sender:Tobject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, common, EditItem1, EditItem2, QrySet, QrySet1;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
    item:Tmenuitem;
begin
  if not app_init(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;

  dm.ADOdata0128.Close;
  dm.ADOdata0128.Open;
  sql_text1:=dm.ADOdata0128.CommandText;  //记录ads05默认sql语句
  precolumn1:=DBGD1.Columns[0]; //给precolumn赋初始值
  dm.ADOData0520.Close;
  dm.ADOdata0520.Open;
  sql_text2:=dm.ADOdata0520.CommandText;
  precolumn2:=DBGD2.Columns[0];
  for i:=0 to dbgd1.columns.Count-1 do
  begin //动态增加列名到现银定义字段菜单中
    item:=Tmenuitem.Create(self);
    item.Caption:=dbgd1.columns[i].Title.caption;
    if dbgd1.Columns[i].Visible then item.Checked:=true;
    item.onClick:=item_click1;
    self.PM1.Items.Add(item);
  end;

  for i:=0 to dbgd2.columns.Count-1 do
  begin //动态增加列名到收入支出定义字段菜单中
    item:=Tmenuitem.Create(self);
    item.Caption:=dbgd2.columns[i].Title.caption;
    if dbgd2.Columns[i].Visible then item.Checked:=true;
    item.onClick:=item_click2;
    self.PM2.Items.Add(item);
  end;
end;

procedure TForm1.item_click1(sender:Tobject);
var i:byte;
begin
  (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
  if (sender as Tmenuitem).Checked then
    for i:=0 to dbgd1.Columns.Count-1 do
       if (sender as Tmenuitem).Caption=dbgd1.Columns[i].Title.Caption then
        begin
         dbgd1.Columns[i].Visible:=true;
         break;
        end;
  if not (sender as Tmenuitem).Checked then
    for i:=0 to dbgd1.Columns.Count-1 do
      if (sender as Tmenuitem).Caption=dbgd1.Columns[i].Title.Caption then
      begin
        dbgd1.Columns[i].Visible:=false;
        break;
      end;
end;

procedure TForm1.item_click2(sender:Tobject);
var i:byte;
begin
  (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
  if (sender as Tmenuitem).Checked then
    for i:=0 to dbgd2.Columns.Count-1 do
       if (sender as Tmenuitem).Caption=dbgd2.Columns[i].Title.Caption then
        begin
         dbgd2.Columns[i].Visible:=true;
         break;
        end;
  if not (sender as Tmenuitem).Checked then
    for i:=0 to dbgd2.Columns.Count-1 do
      if (sender as Tmenuitem).Caption=dbgd2.Columns[i].Title.Caption then
      begin
        dbgd2.Columns[i].Visible:=false;
        break;
      end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
   dm.ADOdata0128.Close;
   dm.ADOdata0128.Open;
   dm.ADOData0520.Close;
   dm.ADOData0520.Open;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
   if pagecontrol1.TabIndex=0 then
      export_dbgrideh_to_excel(dbgd1,self.Caption)
   else
      export_dbgrideh_to_excel(dbgd2,self.Caption)
end;

procedure TForm1.DBGd1TitleClick(Column: TColumnEh);
begin
    if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ADOdata0128.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ADOdata0128.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn1.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:=column.Title.Caption;
    precolumn1.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn1:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TForm1.DBGd2TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ADOData0520.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ADOData0520.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn2.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label2.Caption:=column.Title.Caption;
    precolumn2.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn2:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
   label1.Visible:=pagecontrol1.TabIndex=0;
   label2.Visible:=pagecontrol1.TabIndex=1;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  case pagecontrol1.TabIndex of
  0:if trim(edit1.Text)<>'' then
    dm.ADOdata0128.Filter:=precolumn1.FieldName+' like ''%'+trim(edit1.Text)+'%'''
    else dm.ADOdata0128.Filter:='';
  1:if trim(edit1.Text)<>'' then
      dm.ADOData0520.Filter:=precolumn2.FieldName+' like ''%'+trim(edit1.Text)+'%'''
    else dm.ADOData0520.Filter:='';
  end;
end;

procedure TForm1.addClick(Sender: TObject);
begin
  dm.Adodata0128.append;
  Application.CreateForm(TFrmEditItem1, FrmEditItem1);
  if FrmEditItem1.showmodal=mrok then
  begin
  end
  else
   dm.adodata0128.Cancel;
  FrmEditItem1.free;
end;

procedure TForm1.editClick(Sender: TObject);
begin
  Application.CreateForm(TFrmEditItem1, FrmEditItem1);

  FrmEditItem1.edit1.Text := dm.ADOdata0128GL_ACC_NUMBER.Value;
  FrmEditItem1.label11.Caption := dm.Adodata0128gl_description.Value;
  FrmEditItem1.edit2.Text :=dm.ADOdata0128CURR_CODE.Value;
  FrmEditItem1.label18.Caption :=dm.ADOdata0128curr_name.Value;

  dm.Adodata0128.Edit;
  if FrmEditItem1.showmodal=mrok then
  begin

  end
  else
   dm.ADOdata0128.Cancel;
  FrmEditItem1.free;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmEditItem2, FrmEditItem2);
  FrmEditItem2.edit1.Text:='';
  FrmEditItem2.edit2.Text:='';
  FrmEditItem2.edit3.Text:='';
  FrmEditItem2.RadioGroup1.ItemIndex:=0;
  FrmEditItem2.Label11.Caption :='';
  dm.AdoData0520.Append ;
  if FrmEditItem2.showmodal=mrok then begin end
  else
   dm.ADOdata0520.Cancel;
  FrmEditItem2.free;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmEditItem2, FrmEditItem2);
  FrmEditItem2.edit1.Text:=dm.AdoData0520.Fieldbyname('gl_acc_number').asstring;
  FrmEditItem2.Label11.Caption :=dm.AdoData0520.Fieldbyname('gl_description').asstring;
  if dm.ADOData0520GL_ACCT_PTR.Value>0 then
   frmedititem2.gcc_ptr.Caption:=dm.ADOData0520GL_ACCT_PTR.AsString
  else
  frmedititem2.gcc_ptr.Caption:='0';
  FrmEditItem2.edit2.Text:=trim(dm.AdoData0520.Fieldbyname('name').asstring);
  FrmEditItem2.edit3.Text:=trim(dm.AdoData0520.Fieldbyname('description').asstring);
  FrmEditItem2.RadioGroup1.ItemIndex:=dm.AdoData0520.Fieldbyname('ttype').asinteger;
  //FrmAcctSearc2.ADOQuery1.locate('gl_acc_number',FrmEditItem.edit1.Text,[]);
  if FrmEditItem2.showmodal=mrok then begin end
  else
   dm.ADOdata0520.Cancel;
  FrmEditItem2.free;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i:byte;
begin
 case pagecontrol1.TabIndex of
 0:if qry.ShowModal=mrok then
    with dm.ADOdata0128 do
     begin
       close;
       commandtext:=sql_text1;
       for i:=1 to qry.SGrid1.RowCount-1 do
         commandtext:=commandtext+qry.SGrid1.Cells[2,i];
       open;
     end;
 1:
 if qry1.ShowModal=mrok then
    with dm.ADOData0520 do
     begin
       close;
       commandtext:=sql_text2;
       for i:=1 to qry1.SGrid1.RowCount-1 do
         commandtext:=commandtext+qry1.SGrid1.Cells[2,i];
       open;
     end;
 end;
end;

procedure TForm1.deleteClick(Sender: TObject);
begin
   if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOConnection1.BeginTrans;
        try
          DM.aqtmp.Close;
          DM.aqtmp.SQL.Text:='delete from data0128  where rkey='+DM.ADOdata0128RKEY.AsString;
          DM.aqtmp.ExecSQL;
          DM.ADOConnection1.CommitTrans;
          showmessage('数据被成功删除!');
          BitBtn2Click(nil);
       except
         DM.ADOConnection1.RollbackTrans;
         showmessage('不能删除该账户,该账户已登记在付款支票记录表中!');
       end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
   if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOConnection1.BeginTrans;
        try
          DM.aqtmp.Close;
          DM.aqtmp.SQL.Text:='delete from data0520  where rkey='+DM.ADOData0520RKEY.AsString;
          DM.aqtmp.ExecSQL;
          DM.ADOConnection1.CommitTrans;
          showmessage('数据被成功删除!');
          BitBtn2Click(nil);
       except
         DM.ADOConnection1.RollbackTrans;
         showmessage('不能删除该记录,该记录已登记在收入支出类别定义表中!');
       end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  if pagecontrol1.TabIndex=0 then
    pm1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y)
  else
    pm2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm1.checkClick(Sender: TObject);
begin
  Application.CreateForm(TFrmEditItem1, FrmEditItem1);
  FrmEditItem1.DBEdit1.Enabled:=false;
  FrmEditItem1.DBEdit2.Enabled:=false;
  FrmEditItem1.DBEdit3.Enabled:=false;
  FrmEditItem1.DBEdit4.Enabled:=false;
  FrmEditItem1.DBEdit5.Enabled:=false;
  FrmEditItem1.DBEdit6.Enabled:=false;
  FrmEditItem1.DBEdit7.Enabled:=false;
  FrmEditItem1.DBEdit8.Enabled:=false;
  FrmEditItem1.DBEdit9.Enabled:=false;
  FrmEditItem1.DBEdit10.Enabled:=false;
  FrmEditItem1.DBEdit11.Enabled:=false;
  FrmEditItem1.DBEdit13.Enabled:=false;
  FrmEditItem1.DBEdit14.Enabled:=false;
  FrmEditItem1.DBEdit15.Enabled:=false;
  FrmEditItem1.DBEdit16.Enabled:=false;
  FrmEditItem1.DBEdit17.Enabled:=false;
  FrmEditItem1.DBEdit18.Enabled:=false;
  FrmEditItem1.BitBtn1.Enabled:=false;
  FrmEditItem1.BitBtn2.Enabled:=false;
  FrmEditItem1.BitBtn3.Enabled:=false;

  FrmEditItem1.Edit1.Enabled:=false;
  FrmEditItem1.Edit2.Enabled:=false;
  FrmEditItem1.edit1.Text := dm.ADOdata0128GL_ACC_NUMBER.Value;
  FrmEditItem1.label11.Caption := dm.Adodata0128gl_description.Value;
  FrmEditItem1.edit2.Text :=dm.ADOdata0128CURR_CODE.Value;
  FrmEditItem1.label18.Caption :=dm.ADOdata0128curr_name.Value;
  if FrmEditItem1.showmodal=mrok then begin end
  else
   dm.ADOdata0128.Cancel;
  FrmEditItem1.free;
end;

procedure TForm1.N1Click(Sender: TObject);
begin

   Application.CreateForm(TFrmEditItem2, FrmEditItem2);
   FrmEditItem2.Edit1.Enabled:=false;
   FrmEditItem2.Edit2.Enabled:=false;
   FrmEditItem2.Edit3.Enabled:=false;
   FrmEditItem2.BitBtn1.Enabled:=false;
   FrmEditItem2.BitBtn2.Enabled:=false;
   FrmEditItem2.RadioGroup1.Enabled:=false;
  FrmEditItem2.edit1.Text:=dm.AdoData0520.Fieldbyname('gl_acc_number').asstring;
  FrmEditItem2.Label11.Caption :=dm.AdoData0520.Fieldbyname('gl_description').asstring;
  if dm.ADOData0520GL_ACCT_PTR.Value>0 then
   frmedititem2.gcc_ptr.Caption:=dm.ADOData0520GL_ACCT_PTR.AsString
  else
   frmedititem2.gcc_ptr.Caption:='0';
  FrmEditItem2.edit2.Text:=trim(dm.AdoData0520.Fieldbyname('name').asstring);
  FrmEditItem2.edit3.Text:=trim(dm.AdoData0520.Fieldbyname('description').asstring);
  FrmEditItem2.RadioGroup1.ItemIndex:=dm.AdoData0520.Fieldbyname('ttype').asinteger;
  if FrmEditItem2.ShowModal=mrok then begin end
  else
     dm.ADOData0520.Cancel;
   FrmEditItem2.Free;
end;

end.
