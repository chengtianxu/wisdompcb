unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB,Adodb,
  Menus, ComObj;

type
  TForm1 = class(TForm)
    pm1: TPopupMenu;
    DBGd1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    precolumn:Tcolumneh;
    field_name:string;
    sql_text1:string;
    procedure item_click1(sender:Tobject); //单击菜单
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, QrySet, frm_detail, delete_detail;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;


  //dm.ADOConnection1.Open;
  //user_ptr := '4';
  //vprev := '2';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  i:Integer;
begin
  i:=dm.ADOS1rkey.Value;
  dm.ADOS1.Close;
  dm.ADOS1.Open;
  dm.ADOS1.Locate('rkey',i,[]);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  export_dbgrideh_to_excel(dbgd1,self.Caption)
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  pm1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y)
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:Integer;
  item:Tmenuitem;
begin
  dm.ADOS1.Close;
  dm.ADOS1.Open;
  sql_text1:=dm.ADOS1.CommandText;
  field_name:=DBGd1.Columns[0].FieldName;
  precolumn:=DBGD1.Columns[0]; //给precolumn赋初始值
  for i:=0 to dbgd1.columns.Count-1 do
  begin //动态增加列名到现银定义字段菜单中
    item:=Tmenuitem.Create(self);
    item.Caption:=dbgd1.columns[i].Title.caption;
    if dbgd1.Columns[i].Visible then item.Checked:=true;
    item.onClick:=item_click1;
    self.PM1.Items.Add(item);
  end;
  dm.ADOS1.Close;
  dm.ADOS1.Parameters[0].Value:=Qry.dtpk1.Date;
  dm.ADOS1.Parameters[1].Value:=Qry.dtpk2.Date;
  dm.ADOS1.Open;
end;

procedure TForm1.DBGd1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ADOS1.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ADOS1.IndexFieldNames:=column.FieldName;
  end;
  if DBGd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:=column.Title.Caption;
    field_name:=Column.FieldName;
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if DBGd1.DataSource.DataSet.FieldByName(field_name).FieldKind=fkCalculated then Exit;
  if DBGd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftstring,ftwidestring,ftsmallint,ftinteger,ftfloat] then
     if Trim(Edit1.Text)<>'' then
     begin
       if DBGd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftstring,ftwidestring] then
         dm.ADOS1.Filter:=field_name+' like ''%'+trim(Edit1.Text)+'%'''
       else if DBGd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftsmallint,ftinteger,ftfloat] then
         dm.ADOS1.Filter:=field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+'';
     end else
       dm.ADOS1.Filter:='';
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i:Byte;
begin
  if qry.ShowModal=mrok then
  with dm.ADOS1 do
  begin
    Close;
    CommandText:=sql_text1;
    for i:=0 to Qry.SGrid1.RowCount-1 do
      CommandText:=CommandText+qry.SGrid1.Cells[2,i];
    Open;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
  0:
   begin
    dm.ADOS1.Append;
    Application.CreateForm(Tform2, form2);
    Form2.getNo(Form2.Edit1.Text);
    //Form2.DTPk1.Date:=Date;
    //form2.Edit1.Text:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now());
    form2.DATE_SHIPPED.DateTime:=Now;
    if form2.showmodal=mrok then
      begin
      end
    else
      dm.ados1.Cancel;
    form2.free;
   end;
  1:
   begin
     Application.CreateForm(TForm2,Form2);
     form2.Edit1.Text:=dm.ADOS1out_number.Value;
     //Form2.DTPk1.Date:=dm.ADOS1DATE_SHIPPED.Value;
     //Form2.Edit1.Text:=FormatDateTime('yyyy-mm-dd hh:mm:ss',dm.ADOS1DATE_SHIPPED.Value);
     Form2.DATE_SHIPPED.DateTime:=dm.ADOS1DATE_SHIPPED.Value;
     dm.ADOS1.Edit;
     if form2.ShowModal=mrok then begin end
     else
       dm.ADOS1.Cancel;
     Form2.Free;
   end;
  2:
   begin
     Application.CreateForm(TForm2,Form2);
     form2.Edit1.Text:=dm.ADOS1out_number.Value;
     //Form2.DTPk1.Date:=dm.ADOS1DATE_SHIPPED.Value;
     Form2.BitBtn1.Enabled:=False;form2.DBEdit2.Enabled:=False;form2.DBEdit3.Enabled:=False;
     form2.DBEdit4.Enabled:=False;form2.DBEdit5.Enabled:=False;form2.DBEdit6.Enabled:=False;
     form2.DBEdit7.Enabled:=False;form2.DBEdit8.Enabled:=False;form2.DBEdit9.Enabled:=False;
     form2.DBEdit10.Enabled:=False;
     form2.DBEdit16.Enabled:=False;form2.DBEdit17.Enabled:=False;
     form2.DBEdit18.Enabled:=False;form2.DBEdit19.Enabled:=False;form2.DBEdit20.Enabled:=False;
     form2.DBEdit21.Enabled:=False;Form2.DATE_SHIPPED.Enabled:=False;form2.Edit1.Enabled:=False;
     Form2.DBEdit1.Enabled:=False;Form2.DBEdit11.Enabled:=False;Form2.DBEdit13.Enabled:=False;
     //Form2.Edit1.Text:=FormatDateTime('yyyy-mm-dd hh:mm:ss',dm.ADOS1DATE_SHIPPED.Value);
     Form2.DATE_SHIPPED.DateTime:=dm.ADOS1DATE_SHIPPED.Value;
     if form2.ShowModal=mrok then begin end
     else
       dm.ADOS1.Cancel;
     Form2.Free;
   end;
  3:
   begin
   if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOConnection1.BeginTrans;
        try
          DM.tmp.Close;
          DM.tmp.SQL.Text:='delete from product_issue  where rkey='+DM.ADOS1rkey.AsString;
          DM.tmp.ExecSQL;
          DM.ADOConnection1.CommitTrans;
          showmessage('数据被成功删除!');
          BitBtn2Click(nil);
       except
         DM.ADOConnection1.RollbackTrans;
       end;
   end;

  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var
  ExcelApp,WorkBook,worksheet: OLEVariant;
  col,row:integer;
  i,j:integer;
begin
  try
    ExcelApp:=CreateOleObject('Excel.Application');
    WorkBook:=CreateOleobject('Excel.Sheet');
  except
    application.Messagebox('无法打开Xls文件，请确认已经安装EXCEL.','', mb_OK+mb_IconStop);
    Exit;
  end;
  ExcelApp.Visible := false;
  OpenDialog1.DefaultExt:='*.XLS';
  OpenDialog1.Filter:='*.XLS|*.XLS';  
  if OpenDialog1.Execute then
  begin
   try
     dm.ADOS1.DisableControls;
     workBook:= ExcelApp.workBooks.Open(opendialog1.FileName);
   except
    Application.MessageBox('你没有选中表','',mb_ok+mb_iconstop);
    exit;
   end;

   worksheet:=ExcelApp.workbooks[1].worksheets[1];
   col:=worksheet.usedrange.columns.count;
   row:=worksheet.usedrange.rows.count;
   try
    For i:=2 to row do
    begin
     dm.ADOS1.Append;
     For j:=1 to col do
     if (j<dm.ADOS1.FieldCount) and (dm.ADOS1.FieldCount-1=col) then
       dm.ADOS1.Fields[j].Value:=worksheet.cells[i,j].value
     else
       begin
         ShowMessage('请检查所导入表的列是否匹配！');
         Exit;
       end;
     dm.ADOS1.post;
    end;
   finally
    dm.ADOS1.EnableControls;
    Application.ProcessMessages;
    ExcelApp:=Unassigned;
    workBook.close;
   end;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if dm.ADOS1.IsEmpty then
  begin
    n2.Enabled:=False;
    N3.Enabled:=False;
    N4.Enabled:=False;
  end else
  begin
    n2.Enabled:=True;
    N3.Enabled:=True;
    N4.Enabled:=True;
  end;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
    Application.CreateForm(Tform3, form3);

    if form3.showmodal=mrok then
      begin
      end
    else
    form3.free;
end;

end.
