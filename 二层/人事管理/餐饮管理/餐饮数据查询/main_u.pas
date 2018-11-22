unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, ComCtrls,Menus,DB,DBCtrls,StrUtils;

  

type
  Tfrm_main = class(TForm)
    DBGridEh1: TDBGridEh;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    RadioGroup2: TRadioGroup;
    Button1: TButton;
    BitBtn2: TBitBtn;
    Label25: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label26: TLabel;
    DateTimePicker2: TDateTimePicker;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
  public
     str_addtime: string;
     sSql_yg,sSql_dep,sSql_mealtype,sSql_addr,
     sSql_mealdetail,sSql_rpt,sSql_rptxy,
     sSql_meal_makecard,sSql_meal_topmakecard,
     sSql_meal_total,sSql_meal_total_yx,sSql_meal_total_checked,
     sSql_ABC:string;
     PreColumn: TColumnEh;
     field_name:string;
     card_add_flag: integer;
  end;

var
  frm_main: Tfrm_main;

implementation

uses   damo,card_add_u,common;

{$R *.dfm}

procedure Tfrm_main.Button1Click(Sender: TObject);
begin
  edit1.Enabled := false;
  label1.Caption :='';
  edit1.Text := '';
  dbgrideh1.PopupMenu := nil;
  sSql_ABC := inttostr(radiogroup2.ItemIndex+1);
  if combobox1.Text =''   then
    begin
      sSql_addr:='';
    end
    else
    begin
      sSql_addr:=' and ip_addr ='+quotedstr(combobox1.Text);
    end;

  sSql_yg := ' select departmentname as 部门,employeecode as 工号,chinesename as 姓名,sum(breakfast) as 早餐,'+
 ' sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡 ,status as 员工状态  from dbo.v_meal '+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) +
 ' and meal_type='+sSql_ABC+sSql_addr+
 ' group by departmentname,chinesename,employeecode,status'+
 ' order by departmentname,employeecode,status';
  sSql_dep := ' select departmentname as 部门,count(employeecode) as 就餐人数,sum(breakfast) as 早餐,'+
 ' sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡  from dbo.v_meal'+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) +
 ' and meal_type='+sSql_ABC+sSql_addr+
 ' group by departmentname';
  sSql_mealtype := 'select sum(breakfast) as 早餐, sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,'+
 ' sum(invalid_card) as 无效卡 from dbo.v_meal '+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))+
 ' and meal_type='+sSql_ABC+sSql_addr;

  sSql_mealdetail := ' select departmentname as 部门,employeecode as 工号,chinesename as 姓名, card_time as 打卡时间,  meal_date as 就餐日期,'+
 ' breakfast as 早餐 , lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡,status as 员工状态, '+
 ' (select employee_name from data0005 where cast(rkey as nvarchar(10))=v_meal.remark2) as 备注 ,id from dbo.v_meal'+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))+
 ' and meal_type='+sSql_ABC+sSql_addr+
 ' order by departmentname,employeecode,meal_date';

  sSql_meal_makecard := ' select departmentname as 部门,employeecode as 工号,chinesename as 姓名,meal_type as 餐次级别 ,card_time as 打卡时间,  meal_date as 就餐日期, '+
 ' breakfast as 早餐 , lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡, '+
 ' (select employee_name from data0005 where cast(rkey as nvarchar(10))=v_meal.remark2) as 备注 ,id from dbo.v_meal '+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))+sSql_addr+
 ' and   v_meal.remark2 in (select cast(rkey as nvarchar(10)) from data0005) '+
 ' order by id desc  ';

  sSql_meal_total := ' exec hrsp_ADOmealtotting_up '+' '+sSql_ABC+','
    +quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))+','
    +quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))+','
    +quotedstr(combobox1.Text) ;

  sSql_meal_total_yx :=' exec hrsp_ADOmealtotting_up_yx '+' '+sSql_ABC+','
    +quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))+','
    +quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) +','
    +quotedstr(combobox1.Text) ;

  sSql_meal_total_checked := ' exec hrsp_ADOmealtotting_checked '
    +quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))+','
    +quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) ;


 if  radiogroup1.ItemIndex = 0 then  //按员工查询
    DM.ADOTMP.SQL.Text := sSql_yg;
 if  radiogroup1.ItemIndex = 1 then  // 按部门查询
    DM.ADOTMP.SQL.Text := sSql_dep;
 if  radiogroup1.ItemIndex = 2 then   //按餐别汇总
    DM.ADOTMP.SQL.Text := sSql_mealtype;
 if  radiogroup1.ItemIndex = 4 then   //补卡记录
 begin
    DM.ADOTMP.SQL.Text := sSql_meal_makecard;
    dbgrideh1.PopupMenu := popupmenu1;
    end;
 if  radiogroup1.ItemIndex = 3 then   //就餐明细
    begin
    DM.ADOTMP.SQL.Text := sSql_mealdetail;
    dbgrideh1.PopupMenu := popupmenu1;
    end;
  if  radiogroup1.ItemIndex = 5 then   //月结
    begin
    DM.ADOTMP.SQL.Text := sSql_meal_total;
    end;
  if  radiogroup1.ItemIndex = 6 then   //月结不含夜宵
    begin
    DM.ADOTMP.SQL.Text := sSql_meal_total_yx;
    end;
   if  radiogroup1.ItemIndex = 7 then   //月结不含夜宵
    begin
    DM.ADOTMP.SQL.Text := sSql_meal_total_checked;
    dbgrideh1.PopupMenu := popupmenu1;
    end;
 //showmessage(dm.ADOTMP.SQL.Text);
 DM.ADOTMP.Open; 
 if not dm.ADOTMP.IsEmpty
 then
 begin
 edit1.Enabled := true;
 field_name := dbgrideh1.Columns[0].FieldName;
 PreColumn := dbgrideh1.Columns[0];
 label2.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
 end ;
 if dm.ADOTMP.IsEmpty
 then
 begin 
 label2.Caption := '0';
 end ;

end;

procedure Tfrm_main.FormCreate(Sender: TObject);
var i: integer;
begin
if not app_init(dm.ADOConnection1) then
  begin
   common.ShowMsg('程序启动失败,请联系系统管理员',1);
   application.Terminate;
  end;
  self.Caption :=Application.Title;
  {user_ptr:='3'; //人员ID
   vprev:='2';    //权限
   rkey73:='9';   //

// dm.ADOConnection1.Open;
//   }
 
   DateSeparator := '-';
   ShortDateFormat := 'yyyy-mm-dd';
   DateTimePicker1.Date := now;
   DateTimePicker2.Date := now;
   dbgrideh1.PopupMenu := nil;
   str_addtime := formatdatetime('yyyy-mm-dd hh:mm:ss',now);
   str_addtime := LeftStr(str_addtime, 11)+'12:00:00';
   sSql_meal_topmakecard := ' select top 10 departmentname as 部门,employeecode as 工号,chinesename as 姓名,meal_type as 餐次级别 ,card_time as 打卡时间,  meal_date as 就餐日期, '+
    ' breakfast as 早餐 , lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡, '+
    ' (select employee_name from data0005 where cast(rkey as nvarchar(10))=v_meal.remark2) as 备注 ,id from dbo.v_meal '+
    ' where  v_meal.remark2 in (select cast(rkey as nvarchar(10)) from data0005) '+
    ' order by id desc  ';
   card_add_flag := 0;
  combobox1.Clear;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :='select distinct substring(dev_ip,1,charindex('+
  #39+'.'+#39+',dev_ip,8)-1) as ip_addr  from dev_detail where devaddr='+
  #39+'local'+#39+ 'and purpose='+#39+'m'+#39;
  dm.ADOTMP.Open;
  for i:=0 to dm.ADOTMP.RecordCount-1 do
    begin
     combobox1.Items.Add(dm.ADOTMP.FieldByName('ip_addr').asString);
     dm.ADOTMP.Next;
    end;
  if (dm.ADOTMP.RecordCount)=1 then
  begin
    combobox1.Visible := false;
    label4.Visible := false;
  end;
  combobox1.Text := '';
  dm.ADOTMP.Close;
  dm.ADOTMP.SQL.Clear;

  end;

procedure Tfrm_main.BitBtn3Click(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'就餐信息') ;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
   if  ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
 { 如果是本厂员工，card_add_u.label5.text 是0  员工RKEY 取employeemsg
  如果不是本厂员工，card_add_u.label5.text 是1 员工RKEY 取employeemsg_extra}
   if card_add_flag = 0 then
  begin
  frm_card_add := Tfrm_card_add.Create(nil);
  frm_card_add.MaskEdit1.Text := str_addtime;
  card_add_flag := 1;
  end;
  frm_card_add.Show;
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_main.N1Click(Sender: TObject);
var
showmessage1 :string;
empcode_str: string;
begin
  if  ((strtoint(vprev)=1) or (strtoint(vprev)=3) or (strtoint(vprev)=2)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
dm.ADOTMP_DEL.SQL.Clear;
dm.ADOTMP_DEL.SQL.Text:=' delete from meal_orginaldata '+
' where id= '+quotedstr(DM.ADOTMP.FieldByName('id').AsString);
showmessage1:=DM.ADOTMP.Fields[1].Value+DM.ADOTMP.Fields[2].Value+
  quotedstr(DM.ADOTMP.Fields[3].Value)+' 将删除';
empcode_str:=DM.ADOTMP.Fields[1].Value;
//
if Messagedlg('你确定'+showmessage1+'?',mtWarning,[mbYES,mbNO],0)=6 then
begin
try
dm.ADOTMP_DEL.ExecSQL;
DM.ADOTMP.Active:=false;
DM.ADOTMP.Active:=true;
//main_form.label_count1.Caption:=inttostr(dm.DataSource_cx.DataSet.RecordCount);
DM.ADOTMP.Locate('工号',empcode_str,[]);
showmessage('删除成功');
except
showmessage('删除失败');
end;
end;
//
end;

procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if dbgrideh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
   dm.ADOTMP.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADOTMP.Sort:=Column.FieldName+' DESC';
  end;

  if dbgrideh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;


procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
   if dbgrideh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrideh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
   if trim(Edit1.text) <> '' then
    begin
      if dbgrideh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrideh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if dbgrideh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrideh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      dbgrideh1.DataSource.DataSet.Filter:='';
    end;
end;
end.
