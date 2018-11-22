unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,DB;

type

  TfrmMain = class(TForm)
    pnl1: TPanel;
    lbl_search: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dbgrdh_gridh: TDBGridEh;
    pm1: TPopupMenu;
    N_New: TMenuItem;
    N_Edit: TMenuItem;
    N_Delete: TMenuItem;
    edt1: TEdit;
    btn3: TBitBtn;
    btn4: TBitBtn;
    pm2: TPopupMenu;
    btn5: TBitBtn;



    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N_NewClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure dbgrdh_gridhTitleClick(Column: TColumnEh);
    procedure FormActivate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure item_click(sender:Tobject);
    procedure FormResize(Sender: TObject);
    procedure btn5Click(Sender: TObject);

  private
    { Private declarations }
   sql_text:string;


  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  precolumn:Tcolumneh;






implementation

uses demo, ConstVar, authorize_edit,common, condition;



{$R *.dfm}

procedure TfrmMain.btn2Click(Sender: TObject);

begin
   DM.ads616.Close;
   DM.ads616.Open;
   ActiveControl := dbgrdh_gridh;  //焦点转移到dbgrdh_gridh上
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TfrmMain.N_NewClick(Sender: TObject);
begin
 try

   frmAuthorize_Edit := TfrmAuthorize_Edit.Create(Application);
   frmAuthorize_Edit.Caption := '新增';
  if frmAuthorize_Edit.showmodal=mrok then
  begin
   DM.ads616.Close;
   DM.ads616.Open;
   with frmAuthorize_Edit do
   DM.ads616.Locate('ct_TYPE;rkey73;warehouse_ptr;ttype',vararrayof([Tct_TYPE,Trkey73,TRKEY,Tttype]),[]);

  end;

 finally
  frmAuthorize_Edit.free;
 end;
end;

procedure TfrmMain.N_EditClick(Sender: TObject);

begin

   try
     with DM.ads616 do
     begin
     frmAuthorize_Edit := TfrmAuthorize_Edit.Create(Application);
     frmAuthorize_Edit.Caption := '编辑';

     frmAuthorize_Edit.cbct_TYPE.ItemIndex :=fieldByName('ct_TYPE').AsInteger;
     frmAuthorize_Edit.edt_warehouse_code.Text :=fieldByName('warehouse_code').AsString;
     frmAuthorize_Edit.edt_ABBR_NAME.Text :=fieldByName('ABBR_NAME').AsString;
     frmAuthorize_Edit.edt_USER_LOGIN_NAME.Text :=fieldByName('USER_LOGIN_NAME').AsString;
     frmAuthorize_Edit.edt_USER_FULL_NAME.Text :=fieldByName('USER_FULL_NAME').AsString;
     frmAuthorize_Edit.Cbb_ttype.ItemIndex :=fieldByName('ttype').AsInteger;
     frmAuthorize_Edit.edt__seq_no.Text :=fieldByName('seq_no').AsString;
     frmAuthorize_Edit.edt_ct_area.Text :=fieldByName('ct_area').AsString;
     frmAuthorize_Edit.edt_warehouse_code.Tag :=fieldByName('warehouse_ptr').AsInteger;
     frmAuthorize_Edit.edt_USER_LOGIN_NAME.Tag :=fieldByName('rkey73').AsInteger;
     end;

    if frmAuthorize_Edit.showmodal=mrok then
     begin

      DM.ads616.Close;
      DM.ads616.Open;
      with frmAuthorize_Edit do
      DM.ads616.Locate('ct_TYPE;rkey73;warehouse_ptr;ttype',vararrayof([Tct_TYPE,Trkey73,TRKEY,Tttype]),[]);
     end;

   finally
    frmAuthorize_Edit.free;
   end;


   
end;

procedure TfrmMain.N_DeleteClick(Sender: TObject);

begin

   if MessageBox(Handle,'你确定要删除吗？','提示',MB_ICONINFORMATION+MB_YESNO)= idYES then
      begin
        try
//          with dm.qry616 do
//           begin
//             Close;
//             sql.Text:='delete data0616 where warehouse_ptr='+dm.intgrfldads1warehouse_ptr.AsString;
//             ExecSQL;
//           end;

         with DM.qry616 do
         begin
          Close;
          Parameters[0].value :=DM.ads616.fieldByName('ct_TYPE').AsInteger;
          Parameters[1].value :=DM.ads616.fieldByName('rkey73').AsInteger;
          Parameters[2].value :=DM.ads616.fieldByName('warehouse_ptr').AsInteger;
          Parameters[3].value :=DM.ads616.fieldByName('ttype').AsInteger;
          Open;
          delete;
         end;

        except
          MessageBox(Handle,'该用户已发生业务,无法删除','提示',MB_ICONEXCLAMATION+MB_OK);
          Abort;
        end;
        DM.ads616.Close;
        DM.ads616.Open;
end;

end;


procedure TfrmMain.edt1Change(Sender: TObject);
begin
  if (trim(edt1.Text)<>'')then
 begin
   DM.ads616.Filtered := True;        //打开过滤器
   DM.ads616.Filter:=precolumn.FieldName+' like ''%'+trim(edt1.text)+'%'''   //添加过滤条件
 end
 else
   DM.ads616.Filtered :=false;
end;

procedure TfrmMain.dbgrdh_gridhTitleClick(Column: TColumnEh);
begin
     if column.Title.SortMarker=smupeh then   //改变DBGRirdEH控件SortMarker属性的值达到切换正逆序排序目的
     begin
       column.Title.SortMarker:=smdowneh;
       DM.ads616.IndexFieldNames := Column.DisplayName + ' DESC';     //逆序排序
     end
   else
     begin
       column.Title.SortMarker:=smupeh;
       DM.ads616.IndexFieldNames := Column.DisplayName;
     end;
  if (precolumn.FieldName <> column.FieldName) and
     (Column.Field.DataType in [ftString,ftWideString]) then
   begin
    precolumn.Title.Color:=clbtnface;
    lbl_search.Caption := '搜索: ' + column.Title.Caption;
    column.Title.Color:=clred;
    precolumn:=column;
    edt1.Text:='';
   end
end;

procedure TfrmMain.FormActivate(Sender: TObject);

var i,j:integer;
    item:Tmenuitem;

begin
   sql_text:=dm.ads616.CommandText;  //记录ads05默认sql语句
   DM.ads616.Open;
   precolumn:=dbgrdh_gridh.Columns[0]; //给precolumn赋初始值
   precolumn.Title.Color:=clred;
   lbl_search.Caption := '搜索: ' + precolumn.Title.Caption;
   for i:=1 to dbgrdh_gridh.columns.Count do
  begin //动态增加列名到字段菜单中
    item:=Tmenuitem.Create(self);
    item.Caption:=dbgrdh_gridh.columns[i-1].Title.caption;
    if dbgrdh_gridh.Columns[i-1].Visible then
      item.Checked:=true;
    item.onClick:=item_click;
    self.PM2.Items.Add(item);
  end;

//    List := TStringList.Create;
//    SWidth := Self.Width-55;


end;

procedure TfrmMain.btn3Click(Sender: TObject);
begin
  export_dbgrideh_to_excel(dbgrdh_gridh,self.Caption);
end;

procedure TfrmMain.btn4Click(Sender: TObject);
var i: Integer;
begin
   pm2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);

end;

procedure TfrmMain.FormCreate(Sender: TObject);

begin

 if not app_init(dm.con1) then
  begin
    showmsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;
//  vprev:='4';
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin

//    messagedlg('对不起!您没有该程序的可写权限',mtconfirmation,[mbcancel],0);
    N_New.enabled :=False;
    N_Edit.enabled :=False;
    N_Delete.enabled :=False;

  end;

end;

procedure TfrmMain.item_click(sender: Tobject);
var i:byte;
begin
   (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
  if (sender as Tmenuitem).Checked then
    for i:=0 to dbgrdh_gridh.Columns.Count-1 do
       if (sender as Tmenuitem).Caption=dbgrdh_gridh.Columns[i].Title.Caption then
        begin
         dbgrdh_gridh.Columns[i].Visible:=true;
         break;
        end;
  if not (sender as Tmenuitem).Checked then
    for i:=0 to dbgrdh_gridh.Columns.Count-1 do
      if (sender as Tmenuitem).Caption=dbgrdh_gridh.Columns[i].Title.Caption then
      begin
        dbgrdh_gridh.Columns[i].Visible:=false;
        break;
      end;
end;
 
procedure TfrmMain.FormResize(Sender: TObject);
var i,j:integer;

begin


      if  pnl1.Width <=(btn4.Left+lbl_search.Width+edt1.Width+btn4.Width+38) then
      begin
        lbl_search.Left := btn4.Left+btn4.Width+6;
      end
      else
      begin
       lbl_search.Left :=pnl1.Width - lbl_search.Width-edt1.Width-32;
      end;
      edt1.Left := lbl_search.Left+lbl_search.Width+6;

end;

procedure TfrmMain.btn5Click(Sender: TObject);
var i:byte;
begin
  if condition_form.ShowModal=mrok then
  with dm.ads616 do
  begin
    close;
    commandtext:=sql_text;
    for i:=1 to condition_form.strngrd1.RowCount-1 do
      dm.ads616.CommandText:=dm.ads616.CommandText+condition_form.strngrd1.cells[2,i];
    open;
  end;
end;

end.
