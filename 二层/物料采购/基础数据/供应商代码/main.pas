unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,Db,Adodb;

type
  Tmainform = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Eh1: TDBGridEh;
    PM1: TPopupMenu;
    new: TMenuItem;
    edit: TMenuItem;
    copy: TMenuItem;
    check: TMenuItem;
    delete: TMenuItem;
    N1: TMenuItem;
    PM2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure newClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure copyClick(Sender: TObject);
    procedure checkClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure Eh1DblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PM1Popup(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    precolumn:Tcolumneh;
    sql_text:string;
    procedure item_click(sender:Tobject); //单击菜单
    procedure ready_new;  //新增记录并设置初始信息
    procedure copydata;   //复制
    procedure checkstatus; //进入检查状态
    function ChangeRGB(Ai:Integer):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainform: Tmainform;

implementation
uses common,damo,condition,detail, uAlter_Info;

{$R *.dfm}

procedure Tmainform.FormCreate(Sender: TObject);
var i:integer;
    item:Tmenuitem;
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;


//  user_ptr:='851';
//  vprev:='4';
//  dm.ADOConnection1.Open;

  dm.ads23.Close;
  dm.ads23.Open;
  sql_text:=dm.ads23.CommandText;  //记录ads05默认sql语句
  precolumn:=eh1.Columns[0]; //给precolumn赋初始值
  for i:=0 to eh1.columns.Count-1 do
  begin //动态增加列名到字段菜单中
    item:=Tmenuitem.Create(self);
    item.Caption:=eh1.columns[i].Title.caption;
    if eh1.Columns[i].Visible then item.Checked:=true;
    item.onClick:=item_click;
    self.PM2.Items.Add(item);
    if (i in [17,18]) and ((vprev='1') or (vprev='2')) then item.Enabled:=false;
  end;
end;

procedure Tmainform.ready_new;
begin   //新增记录并设置初始信息
  with dm do
  begin
    aq23.Open;
    aq23.Append;
    aq24.Close;
    aq24.Parameters[0].Value:=null;
    aq24.Open;
    aq23status.Value:=0;  //状态为正常
    aq23put_all_inv_hold.Value:='N';
    aq23country_ptr.Value:=3;    //国家为中国
    aq23currency_ptr.Value:=1;   //货币为人民币
    aq23suppier_ent_date.Value:=getsystem_date(aqtmp,1);  //合作日期为当天
    aq23brother_flag.Value:=false; //关联公司
    aq23payment_terms.Value:=0;  //净付款天数
    aq23discount.Value:=0;       //付款折扣1
    aq23discount_days.Value:=0;  //付款折扣天数1
    aq23discount2.Value:=0;      //付款折扣2
    aq23discount2_days.Value:=0; //付款折扣天数2
    aq23edi_out_new_po.Value:=0;  //是否为VMI供应商0:否;1:是
  end;
end;

procedure Tmainform.copydata;  //复制
var  v_copy:array[2..62] of variant;
     i:word;
begin
  dm.aq23.Close;
  dm.aq23.Parameters[0].Value:=dm.ads23rkey.Value;
  dm.aq23.Open;
  for i:=2 to 62 do //以下复制data0023供应商信息表
    v_copy[i]:=dm.aq23.Fields[i].Value;
  dm.aq23.Append;
  for i:=2 to 62 do
    dm.aq23.FieldValues[dm.aq23.Fields[i].FieldName]:=v_copy[i];
  with dm.aqtmp do  //以下复制装运信息
  begin
    close;
    sql.Clear;
    sql.Add('select RKEY,SUPPLIER_PTR,FACTORY_LOCATION,FACTORY_ADDRESS_1,STATE,ZIP,CONTACT,'+
            'PHONE,FAX,FOB,CITY_TAX_PTR,SHIPPING_METHOD,SHIPPING_LEAD_TIME,STATE_SHIP_TAX_FLAG,'+
            'STATE_MISC_TAX_FLAG,STATE_INVT_TAX_FLAG,LANGUAGE_FLAG,COUNTRY_PTR,EMAIL_FOR_CONTACT '+
            'from data0024 where supplier_ptr=:aq23.rkey' );
    parameters[0].Value:=dm.ads23rkey.Value;
    open;
  end;

  with dm.aq24 do
  begin
    close;
    parameters[0].Value:=null;
    open;
    while not dm.aqtmp.Eof do
    begin
      append;
      for i := 2 to 18 do //除rkey,SUPPLIER_PTR不复制
        fieldvalues[fields[i].FieldName]:=dm.aqtmp.FieldValues[dm.aqtmp.fields[i].FieldName];
      post;
      dm.aqtmp.Next;
    end;
  end;   //装运地点复制完毕
end;

procedure Tmainform.checkstatus; //进入检查模式
begin
  dm.aq23.Close;
  dm.aq23.Parameters[0].Value:=dm.ads23rkey.Value;
  dm.aq23.LockType:=ltreadonly;  //只读模式
  dm.aq23.Open;
  dm.aq24.Close;
  dm.aq24.Parameters[0].Value:=dm.ads23rkey.Value;
  dm.aq24.LockType:=ltreadonly; //只读模式
  dm.aq24.Open;
  detail_info.BitBtn1.enabled:=false;
  detail_info.BitBtn4.enabled:=false;
  detail_info.BitBtn5.enabled:=false;
  detail_info.BitBtn6.enabled:=false;
  detail_info.BitBtn7.enabled:=false;
  detail_info.BitBtn8.enabled:=false;
  detail_info.BitBtn9.enabled:=false;
  detail_info.MaskEdit1.enabled:=false;
  detail_info.Edit1.enabled:=false;
  detail_info.Edit2.enabled:=false;
  detail_info.Edit3.enabled:=false;
  detail_info.Edit4.enabled:=false;
  detail_info.Edit5.enabled:=false;
  detail_info.memo1.enabled:=false;
  detail_info.memo2.enabled:=false;
  detail_info.memo3.enabled:=false;
  detail_info.dbedtMen.Enabled:=False;
  detail_info.PM1.Items.Delete(2); //删除"添加"、"编辑"、"删除"弹出菜单
  detail_info.PM1.Items.Delete(1);
  detail_info.PM1.Items.Delete(0);
  detail_info.DBComboBox1.Enabled:=False;
  detail_info.BitBtn12.enabled:=false;
end;

procedure tmainform.item_click(sender:Tobject);
var i:byte;
begin
  (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
  if (sender as Tmenuitem).Checked then
    for i:=0 to eh1.Columns.Count-1 do
       if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
        begin
         eh1.Columns[i].Visible:=true;
         break;
        end;
  if not (sender as Tmenuitem).Checked then
    for i:=0 to eh1.Columns.Count-1 do
      if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
      begin
        eh1.Columns[i].Visible:=false;
        break;
      end;
end;

procedure Tmainform.BitBtn1Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure Tmainform.BitBtn2Click(Sender: TObject);
begin
  dm.ads23.Close;
  dm.ads23.Open;
end;

procedure Tmainform.BitBtn3Click(Sender: TObject);
var i:byte;
begin
  if condition_form.ShowModal=mrok then
  with dm.ads23 do
  begin
    close;
    commandtext:=sql_text;
    for i:=1 to condition_form.SGrid1.RowCount-1 do
      commandtext:=commandtext+condition_form.SGrid1.Cells[2,i];
    open;
  end;
end;

procedure Tmainform.BitBtn4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    showmessage('对不起，您没有权限导出资料！')
  else
    export_dbgrideh_to_excel(eh1,self.Caption);
end;

procedure Tmainform.BitBtn5Click(Sender: TObject);
begin
  pm2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure Tmainform.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dm.ads23.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
  else dm.ads23.Filter:='';
end;

procedure Tmainform.Eh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ads23.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ads23.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure Tmainform.newClick(Sender: TObject);
var bk:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    showmessage('对不起，您只有该程序的只读权限！')
  else
  try
    ready_new;  //赋初始参数
    hide;  //隐藏主窗体
    detail_info:=Tdetail_info.Create(application);
    detail_info.is_copy:=0;  //新建非复制
    detail_info.lbl5.Caption:= '未传附件';
    if detail_info.showmodal=mrok then
    begin
      dm.ads23.Close;
      dm.ads23.Open;
      bk:=dm.aq23rkey.Value;
      dm.ads23.Locate('rkey',bk,[]);
    end;
  finally
    dm.aq23.Close;
    detail_info.Free;
  end;
end;

procedure Tmainform.editClick(Sender: TObject);
var bk:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    showmessage('对不起，您只有该程序的只读权限！')
  else
  try
    dm.aq23.Close;
    dm.aq23.Parameters[0].Value:=dm.ads23rkey.Value;
    dm.aq23.Open;
    dm.aq23.Edit;
    dm.aq24.Close;
    dm.aq24.Parameters[0].Value:=dm.aq23RKEY.Value;
    dm.aq24.Open;
    hide;
    detail_info:=Tdetail_info.Create(application);
    detail_info.is_copy:=3;  //编辑
    with dm.aqtmp do
    begin
      Close;
      SQL.Text:= 'select case when AttachFile IS NULL THEN 0 ELSE 1 END from data0023  where rkey = ' + dm.ads23rkey.AsString;
      Open;
      if Fields[0].Value = 0 then detail_info.lbl5.Caption:= '未传附件'
      else detail_info.lbl5.Caption:='已传附件';
    end;

    if detail_info.ShowModal=mrok then
    begin
      dm.ads23.Close;
      dm.ads23.Open;
      bk:=dm.aq23rkey.Value;
      dm.ads23.Locate('rkey',bk,[]);
    end;
  finally
    dm.aq23.Close;
    detail_info.Free;
  end;
end;

procedure Tmainform.copyClick(Sender: TObject);
var bk:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    showmessage('对不起，您只有该程序的只读权限！')
  else
  try
    copydata;  //copy信息及装运信息
    hide;
    detail_info:=Tdetail_info.Create(application);
    detail_info.is_copy:=1;
    detail_info.dbedtMen.Enabled:=True;
    detail_info.lbl5.Caption:= '未传附件';
    if detail_info.showmodal=mrok then
    begin
      dm.ads23.Close;
      dm.ads23.Open;
      bk:=dm.aq23rkey.Value;
      dm.ads23.Locate('rkey',bk,[]);
    end;
  finally
    dm.aq23.Close;
    detail_info.Free;
  end;
end;

procedure Tmainform.checkClick(Sender: TObject);
begin
 try
   detail_info:=Tdetail_info.Create(application);
   checkstatus;
   hide;
   detail_info.is_copy:=2; //检查模式
   detail_info.DBEdit13.Enabled:=false;
    with dm.aqtmp do
    begin
      Close;
      SQL.Text:= 'select case when AttachFile IS NULL THEN 0 ELSE 1 END from data0023  where rkey = ' + dm.ads23rkey.AsString;
      Open;
      if Fields[0].Value = 0 then detail_info.lbl5.Caption:= '未传附件'
      else detail_info.lbl5.Caption:='已传附件';
    end;
   if detail_info.ShowModal<>mrok then begin end;
 finally
   dm.aq23.Close;
   dm.aq24.Close;
   detail_info.Free;
   dm.aq23.LockType:=ltoptimistic;
   dm.aq24.LockType:=ltBatchOptimistic;
 end;
end;

procedure Tmainform.deleteClick(Sender: TObject);
begin  //注：程序未做装运子表删除，数据库已设关系级联删除。
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtconfirmation,[mbcancel],0)
  else if messagedlg('你确认要删除这条记录吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    dm.ADOConnection1.BeginTrans;
    try
      with dm.aqtmp do
      begin
        close;
        sql.Clear;
        sql.Add('delete data0011 where rkey in (:p1,:p2,:p3,:p4)');
        parameters.ParamByName('p1').Value:=dm.ads23po_note_pad_ptr.AsInteger;
        parameters.ParamByName('p2').Value:=dm.ads23debmem_note_pad_ptr.AsInteger;
        parameters.ParamByName('p3').Value:=dm.ads23rfq_note_pad_ptr.AsInteger;
        parameters.ParamByName('p4').Value:=dm.ads23common_pad_ptr.AsInteger;
        execsql;//删除采购订单、借项备忘录、一般资讯、交货记事本
        close;
        sql.Clear;
        sql.Add('delete data0023 where rkey='+dm.ads23rkey.AsString);
        execsql; //删除客户信息
        close;
      end;
      dm.ADOConnection1.CommitTrans;
      messagedlg('数据删除成功！',mtconfirmation,[mbok],0);
      dm.ads23.Close;
      dm.ads23.Open;
    except
      messagedlg('不能删除该客户，可能此客户已被关联使用！',mtwarning,[mbcancel],0);
      dm.ADOConnection1.RollbackTrans;
    end;
  end;
end;

procedure Tmainform.Eh1DblClick(Sender: TObject);
begin
  editclick(sender);
end;

procedure Tmainform.N2Click(Sender: TObject);
begin
  with TForm1.Create(Application) do
  begin
    try
      Caption := dm.ads23abbr_name.AsString+':变更记录';
      with dm.aqtmp do
      begin
        close;
        sql.Clear;
        sql.Add('select user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, ');
        sql.Add('FROM_STRING,TO_STRING,file_number');
        sql.Add('from data0318 inner join data0073 on');
        sql.Add('data0318.user_ptr=data0073.rkey');
        sql.Add('where supplier_ptr='+dm.ads23rkey.AsString);
        sql.Add('order by TRANS_DATE');
        open;
      end;
      while not dm.aqtmp.Eof do
      begin
        Memo1.Lines.Add(dm.aqtmp.fieldbyname('trans_date').AsString+
        ' 系统用户:'+dm.aqtmp.fieldbyname('user_id').AsString+' '+
        dm.aqtmp.fieldbyname('user_full_name').AsString+
        dm.aqtmp.fieldbyname('TRANS_DESCRIPTION').AsString);
        Memo1.Lines.Add(' 原值: '+dm.aqtmp.fieldbyname('from_string').AsString+
        ' 变更后: '+dm.aqtmp.fieldbyname('to_string').AsString+
        '   关联文件号:'+dm.aqtmp.fieldbyname('file_number').AsString);
        dm.aqtmp.Next;
      end;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure Tmainform.Eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DM.ads23flag.Value = 1 then  Eh1.Canvas.Font.Color:= clRed;
  if DM.ads23flag.Value = 2 then  Eh1.Canvas.Font.Color:= clOlive;
  if DM.ads23flag.Value = 3 then  Eh1.Canvas.Font.Color:= clBlue;
  Eh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

function Tmainform.ChangeRGB(Ai: Integer):Boolean;
begin
  Result:= False;
  try
    with dm.aqtmp do
    begin
      close;
      sql.text := 'Update data0023 set flag ='+ IntToStr(AI) +' where rkey=' + dm.ads23rkey.AsString;
      ExecSQL;
    end;
    Result:= True;
  except
    ShowMessage('更改失败！');
  end;
end;

procedure Tmainform.N4Click(Sender: TObject);
begin
  if ChangeRGB(1) then BitBtn2Click(nil);
end;

procedure Tmainform.N5Click(Sender: TObject);
begin
if ChangeRGB(2) then BitBtn2Click(nil);
end;

procedure Tmainform.N6Click(Sender: TObject);
begin
if ChangeRGB(3) then BitBtn2Click(nil);
end;

procedure Tmainform.PM1Popup(Sender: TObject);
begin
  N3.Enabled := StrToInt(vprev) > 2;
end;

procedure Tmainform.N7Click(Sender: TObject);
begin
  if ChangeRGB(0) then BitBtn2Click(nil);
end;

procedure Tmainform.N8Click(Sender: TObject);
begin
 with dm.aqtmp do
 begin
  Close;
  SQL.Text:= 'select case when AttachFile IS NULL THEN 0 ELSE 1 END from data0023  where rkey = ' + dm.ads23rkey.AsString;
  Open;
  if Fields[0].Value = 0 then
  begin
   ShowMessage('未传附件');
   Exit;
  end;
 end;
 dm.aq23.Close;
 dm.aq23.Parameters[0].Value:=dm.ads23rkey.Value;
 dm.aq23.Open;
 dm.aq23.Edit;
 dm.aq24.Close;
 dm.aq24.Parameters[0].Value:=dm.aq23RKEY.Value;
 dm.aq24.Open;
 detail_info:=Tdetail_info.Create(application);
 detail_info.NOpen.OnClick(Sender);
 detail_info.Free;
end;

end.
