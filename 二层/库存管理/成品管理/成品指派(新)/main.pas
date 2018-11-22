unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus, DB, ADODB;

type
  Tfm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    eh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pm2: TPopupMenu;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    pm3: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    precolumn:Tcolumneh;
    sql_text:string;
    v_colwidth: array[0..8] of integer;
    procedure item_click(sender:Tobject);
    function set_lock(modal:byte):boolean;   //modal：1编辑2删除
    function account_maxdate:Tdatetime;  //获取最后的成本截数日期
  public
    { Public declarations }
  end;

var
  fm_main: Tfm_main;

implementation

uses damo,common, condition, detail,MyClass,ModifyUnitWeight_U,Frm_YSCond_u,
  cust_del;

{$R *.dfm}

procedure Tfm_main.FormCreate(Sender: TObject);
var i:byte;
    item:Tmenuitem;
begin
  if dm.ADOConnection1.Connected then
    begin
      showmessage('程序处于测试模式下运行，请在发布程序前关闭连接后编译！');
      rkey73:='1502';
      user_ptr:='3';
      vprev:='4';
    end
  else
    if not app_init_2(dm.ADOConnection1) then
      begin
        showmsg('程序启动失败，请与系统管理员联系！',1);
        application.Terminate;
      end;

//      rkey73:='1502';
//      user_ptr:='3';
//      vprev:='4';

 MyDataClass :=TMyDataClass.Create(dm.ADOConnection1);
 user_ptr:=inttostr(MyDataClass.Get_Sql_Value('SELECT EMPLOYEE_PTR  FROM   dbo.Data0073  WHERE  RKEY ='+rkey73));
 self.Caption:=application.Title;
 DateSeparator:='-';
 ShortDateFormat:='yyyy-mm-dd';
 LongDateFormat:='yyyy-mm-dd HH:mm:ss';
 sql_text:=dm.ads64.CommandText;  //记录ads64默认sql语句
 precolumn:=eh1.Columns[0]; //给precolumn赋初始值

 for i:=1 to eh1.columns.Count do
 begin //动态增加列名到字段菜单中
  item:=Tmenuitem.Create(self);
  item.Caption:=eh1.columns[i-1].Title.caption;
  if eh1.Columns[i-1].Visible then
   item.Checked:=true;
  item.onClick:=item_click;
  self.PM2.Items.Add(item);
 end;
end;

procedure Tfm_main.item_click(sender:Tobject);
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

function Tfm_main.account_maxdate:Tdatetime;
begin
 with dm.aqtmp do
 begin
  close;
  sql.Text:='select max(fg_date) as maxdate from data0444 ';
  open;
 // if not IsEmpty then result:=fieldvalues['maxdate']  带有数学函数的语句不能使用EMPTY空值判断
  if not fieldbyname('maxdate').IsNull then
   result:=fieldvalues['maxdate']
  else
   result:=date()-3650;
 end;
end;

function Tfm_main.set_lock(modal:byte):boolean;  //modal：1编辑2删除
begin
 result:=false;
  with dm.aqtmp do
  begin
   Close;
   SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d64'')'+#13+
     ' select rkey from ##d64 where rkey='+dm.ADS64.fieldbyname('rkey').AsString+#13+
     ' else select top 0 * from data0064 ';
   Open;
   if not isempty then
   begin
    if modal=1 then  //编辑模式
     messagedlg('当前出仓记录被其它用户锁定，无法编辑！',mtwarning,[mbok],0)
    else
     messagedlg('当前出仓记录被其它用户锁定，无法退仓！',mtwarning,[mbok],0);
    exit;
   end
   else
   begin
    if modal=1 then  //如果为编辑则插入锁定的rkey
    begin
     close;
     SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d64'')'+#13+
       ' begin set identity_insert ##d64 on '+#13+
       ' insert ##d64(rkey) values( '''+dm.ADS64.fieldbyname('rkey').AsString+''') '+
       ' set identity_insert ##d64 off end '+#13+
       ' else select rkey into ##d64 from data0064 where rkey='''+dm.ADS64.fieldbyname('rkey').AsString+'''';
     execsql;
    end;
    result:=true;
   end;
  end;
end;

procedure Tfm_main.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure Tfm_main.BitBtn3Click(Sender: TObject);
var rkey64:integer;
begin
 if dm.ADS64.Active then
 begin
   rkey64:=dm.ADS64rkey.Value;
   dm.ADS64.Close;
   dm.ADS64.Open;
   if rkey64>0 then dm.ADS64.Locate('rkey',rkey64,[]);
 end; 
end;

procedure Tfm_main.BitBtn4Click(Sender: TObject);
begin
 pm3.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure Tfm_main.BitBtn2Click(Sender: TObject);
begin
 if not dm.ADS64.IsEmpty then
  export_dbgrideh_to_excel(eh1,'订单装运指派--数据导出');
end;

procedure Tfm_main.eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
   showmessage(dm.ADS64.CommandText);
end;

procedure Tfm_main.eh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ads64.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ads64.IndexFieldNames:=column.FieldName;
  end;

  if (column.Field.DataType in [ftString,ftWideString]) and
     (precolumn.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure Tfm_main.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dm.ads64.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else dm.ads64.Filter:='';
end;

procedure Tfm_main.FormShow(Sender: TObject);
var i:byte;
begin
  for i:=0 to 8 do v_colwidth[i]:=eh1.Columns[i].Width;
// dm.ADS64.Parameters.ParamByName('dtpk1').Value:=datetostr(getsystem_date(dm.aqtmp,1));
// dm.ADS64.Parameters.ParamByName('dtpk2').Value:=datetostr(getsystem_date(dm.aqtmp,1)+1);
  dm.ADS64.parameters.ParamByName('dtpk1').Value:=DateToStr(fm_condition.dtpk1.Date)+ FormatDateTime(' HH:mm:ss',fm_condition.dtpk3.Time);
  dm.ADS64.parameters.ParamByName('dtpk2').Value:=DateToStr(fm_condition.dtpk2.Date)+ FormatDateTime(' HH:mm:ss',fm_condition.dtpk4.Time);
  dm.ADS64.Prepared;
  dm.ADS64.Open;
end;

procedure Tfm_main.eh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if (dm.ADS64if_ship.Value='已装运') then //订单已到交货期
  eh1.Canvas.Font.Color := clred;//clolive;
 eh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end; 

procedure Tfm_main.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADS64.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  N7.Enabled:=False;
 end
 else begin
  n3.Enabled:=true;
  n2.Enabled:=dm.ADS64if_ship.Value='未装运';
  n4.Enabled:=dm.ADS64if_ship.Value='未装运';
  N7.Enabled:=true;
 end;
end; 

procedure Tfm_main.BitBtn5Click(Sender: TObject);
begin
 pm2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure Tfm_main.N1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
 else begin
  fm_detail:=Tfm_detail.Create(application);
  fm_detail.v_modal:=1;   //新增
  //fm_detail.user_ptr:=user_ptr;
  fm_detail.Edit2.Text:=datetimetostr(getsystem_date(dm.aqtmp,0));
  fm_detail.bt_autoassign.Enabled:=false;
  dm.AQ64.close;
  dm.AQ64.parameters[0].Value:=null;
  dm.AQ64.open;
  dm.AQ64.Append;
  if fm_detail.ShowModal=mrok then
  begin
   dm.ADS64.Close;
   dm.ADS64.Open;
   dm.ADS64.Locate('rkey',dm.AQ64rkey.Value,[]);
  end;
  fm_detail.Free;
 end;
end;

procedure Tfm_main.N2Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
 else
 begin
  dm.AQ64.Close;
  dm.AQ64.Parameters[0].Value:=dm.ADS64rkey.Value;
  dm.AQ64.Open;
  if (dm.AQ64PACKING_SLIP_FLAG.Value='1') then
  begin
   showmessage('不能编辑！选择的指派批次已经装运。');//已提交、已检视或已出仓不能编辑
   exit;
  end;
  
  if IS_FG_counting then
  begin
   showmessage('装运指派对应的部件处于盘点状态，不能编辑！');
   exit;
  end;
  if account_maxdate>dm.AQ64DATE_ASSIGN.Value then
   begin
    showmessage('成本截数日期大于指派日期,不能编辑!');
    exit;
   end;

  if set_lock(1) then  //未锁定
  begin
   fm_detail:=Tfm_detail.Create(application);
   fm_detail.v_modal:=2; //编辑
   fm_detail.enter_detail;
   if fm_detail.ShowModal=mrok then
   begin
    dm.ADS64.Close;
    dm.ADS64.Prepared;
    dm.ADS64.Open;
    dm.ADS64.Locate('rkey',dm.AQ64rkey.Value,[]);
   end;
   with dm.aqtmp do   //无论保存或退出都删除锁定的记录
   begin
    Close;
    SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME=''##d64'')'+#13+
      ' select rkey from ##d64 where rkey='+dm.ADS64.fieldbyname('rkey').AsString+#13+
      ' else select top 0 * from data0415 ';
    Open;
    if not isempty then delete;
   end;
   fm_detail.Free;
  end;
 end;
end;

procedure Tfm_main.N3Click(Sender: TObject);
begin
 fm_detail:=Tfm_detail.Create(application);
 fm_detail.v_modal:=3;  //检查
 //fm_detail.user_ptr:=user_ptr;
 fm_detail.btsave.Enabled:=false;
 fm_detail.Edit15.Enabled:=false;
 fm_detail.Edit16.Enabled:=false;
 fm_detail.bt_autoassign.Enabled:=false;
 fm_detail.sg1.PopupMenu:=nil;
 fm_detail.SG1.Options:=fm_detail.SG1.Options-[goEditing]+[goRowselect];
 fm_detail.enter_detail;
 if fm_detail.ShowModal=mrok then
 begin
  dm.ADS64.Close;
  dm.ADS64.Open;
  dm.ADS64.Locate('rkey',dm.AQ64rkey.Value,[]);
 end;
 fm_detail.Free;
end;

procedure Tfm_main.N4Click(Sender: TObject);     //删除
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

 if IS_FG_counting then
 begin
  showmessage('装运指派对应的部件处于盘点状态，不能退仓！');
  exit;
 end;
 if account_maxdate>dm.ADS64date_assign.Value then
 begin
  showmessage('选择的装运指派已经核算成本，不能退仓！');
  exit;
 end;
 with dm.aqtmp do
 begin
  Close;
  sql.Clear;
  SQL.Add('select data0053.* from data0064 inner join data0052 on');
  sql.Add('data0052.so_shp_ptr=data0064.rkey');
  sql.Add('inner join data0053 on data0053.rkey=data0052.DATA0053_PTR');
  sql.Add('where data0064.rkey='+dm.ADS64rkey.AsString+' and data0053.CUST_PART_PTR<>'+dm.ADS64rkey25.AsString);
  Open;
 end;
 if not dm.aqtmp.IsEmpty then
 begin
  showmessage('选择的装运指派有相关库存的产品指针已发生变化，不能退仓！');
  exit;
 end;
 if set_lock(2) then  //记录未锁定
  if messagedlg('您确定要删除选中的装运指派吗?',mtconfirmation,[mbyes,mbno],0)=mrYes then
  begin
   dm.AQ64.Close;
   dm.AQ64.Parameters[0].Value:=dm.ADS64rkey.Value;
   dm.AQ64.Open;
   if (dm.AQ64PACKING_SLIP_FLAG.Value='1') then
   begin
    showmessage('不能退仓！选择的指派批次已经装运。');
    exit;
   end;
   try
    dm.ADOConnection1.BeginTrans;
    fm_detail.del_old_data;
    dm.AQ64.Delete;   //删除64出仓，并级联删除出仓子表52
    dm.ADOConnection1.CommitTrans;
    dm.ADS64.Close;
    dm.ADS64.Open;
   except
    dm.ADOConnection1.RollbackTrans;
    showmessage('指派退仓操作不成功！请检查该指派记录是否已做客户退货处理。');
   end; //end try
  end;
end;

procedure Tfm_main.FormDestroy(Sender: TObject);
begin
 MyDataClass.Free;
end;

procedure Tfm_main.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('抱歉，您没有权限修改单重！');
    Exit;
  end;
  FrmModifyUnitWeight:=TFrmModifyUnitWeight.Create(Application);
  //FrmModifyUnitWeight.user_ptr:=user_ptr;
  if not dm.ADS64.IsEmpty then
    FrmModifyUnitWeight.edtManuPartNumber.Text:=dm.ADS64manu_part_number.AsString;
  FrmModifyUnitWeight.ShowModal;
  FrmModifyUnitWeight.Free;
end;

procedure Tfm_main.N5Click(Sender: TObject);
var i:byte;
begin
 if fm_condition.ShowModal=mrok then
 with dm.ads64 do
 begin
   close;
   commandtext:=sql_text; //恢复默认语句
   for i:=1 to fm_condition.SGrid1.RowCount-1 do
     CommandText:=CommandText+fm_condition.SGrid1.cells[2,i];
//  parameters.ParamByName('dtpk1').Value:=fm_condition.dtpk1.Date;
//  parameters.ParamByName('dtpk2').Value:=fm_condition.dtpk2.Date+1;
   parameters.ParamByName('dtpk1').Value:=DateToStr(fm_condition.dtpk1.Date)+ FormatDateTime(' HH:mm:ss',fm_condition.dtpk3.Time);
   parameters.ParamByName('dtpk2').Value:=DateToStr(fm_condition.dtpk2.Date)+ FormatDateTime(' HH:mm:ss',fm_condition.dtpk4.Time);
   Prepared;
   open;
 end;

end;

procedure Tfm_main.N6Click(Sender: TObject);
begin
  TFrm_YSCond.QryDo;
end;

procedure Tfm_main.N7Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
 else begin
   dm.ADS64.Edit;
   try
     Fcust_del:=TFcust_del.Create(Application);
     if Fcust_del.ShowModal=mrok then
       dm.ADS64.Post
     else
       dm.ADS64.Cancel;
   finally
      Fcust_del.Free;
   end;

 end;
end;

end.
