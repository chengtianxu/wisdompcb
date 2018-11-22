unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Buttons, ExtCtrls, ComCtrls,Menus,DB,
  dev_info_u,damo,card_add_u,common, Grids, PsAPI;

  

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
    DateTimePicker2: TDateTimePicker;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
  private
    netpart,ippart:TStrings; //工厂名称=网段
    mealtypelist:TStrings; // 餐次列表 dev_detail.position=dev_detail.mealtype
                           //因为要从 餐次名称找餐次类型
  public

  end;

var
  frm_main: Tfrm_main;

implementation

uses ADODB;

{$R *.dfm}

procedure Tfrm_main.Button1Click(Sender: TObject);
var
  sSql_addr,sSql_ABC,sdaystr,edaystr:string;
begin
  edit1.Text := '';
  dbgrideh1.PopupMenu := nil;
  if RadioGroup2.itemindex <0 then
  begin
    ShowMessage('请选择餐次类别');
    Exit;
  end;
  sSql_ABC := mealtypelist.Values[radiogroup2.Items.Strings[RadioGroup2.itemindex]];
  if combobox1.Text =''   then
    begin
      sSql_addr:='';
    end
    else
    begin
      sSql_addr:=' and ip_addr ='+quotedstr(netpart.Values[combobox1.Text]);
    end;

  sdaystr:=FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date);
  edaystr:=FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date);

  with DM.ADOTMP do
  begin
    Close;
    SQL.Clear;
    case radiogroup1.ItemIndex of
    //按员工查询
    0: SQL.Add(Format(' select departmentname as 部门,employeecode as 工号,chinesename as 姓名,sum(breakfast) as 早餐,'+
       ' sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡 ,status as 员工状态  from dbo.v_meal '+
       ' where meal_date >=''%s'' and  meal_date <=''%s'' and meal_type=%s %s group by departmentname,chinesename,employeecode,status'+
       ' order by departmentname,employeecode,status',[sdaystr,edaystr,sSql_ABC,sSql_addr]));
    // 按部门查询
    1:SQL.Add(Format(' select departmentname as 部门,count(employeecode) as 就餐人数,sum(breakfast) as 早餐,'+
 ' sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡  from dbo.v_meal'+
 ' where meal_date >=''%s'' and  meal_date <=''%s'' and meal_type=%s %s group by departmentname',[sdaystr,edaystr,sSql_ABC,sSql_addr]));
    //按餐别汇总
    2:SQL.Add(Format('select sum(breakfast) as 早餐, sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,'+
 ' sum(invalid_card) as 无效卡 from dbo.v_meal '+
 ' where meal_date >=''%s'' and  meal_date <=''%s'' and meal_type=%s %s',[sdaystr,edaystr,sSql_ABC,sSql_addr]));
    //就餐明细
    3:SQL.Add(Format(' select departmentname as 部门,employeecode as 工号,chinesename as 姓名, card_time as 打卡时间,  meal_date as 就餐日期,'+
 ' breakfast as 早餐 , lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡,status as 员工状态, '+
 ' (select employee_name from data0005 where cast(rkey as nvarchar(10))=v_meal.remark2) as 备注 ,id from dbo.v_meal'+
 ' where meal_date >=''%s'' and  meal_date <=''%s'' and meal_type=%s %s'+
 ' order by departmentname,employeecode,meal_date',[sdaystr,edaystr,sSql_ABC,sSql_addr] )) ;
    //补卡记录
    4:SQL.Add(Format( ' select departmentname as 部门,employeecode as 工号,chinesename as 姓名,meal_type as 餐次级别 ,card_time as 打卡时间,  meal_date as 就餐日期, '+
 ' breakfast as 早餐 , lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡, '+
 ' (select employee_name from data0005 where cast(rkey as nvarchar(10))=v_meal.remark2) as 备注 ,id from dbo.v_meal '+
 ' where meal_date >=''%s'' and  meal_date <=''%s'' %s and v_meal.remark2 in (select cast(rkey as nvarchar(10)) from data0005) '+
 ' order by id desc  ',[sdaystr,edaystr,sSql_addr])) ;
    //月结
    5:SQL.Add(Format(' exec hrsp_ADOmealtotting_up ''%s'',''%s'',''%s'',''%s''',[sSql_ABC,sdaystr,edaystr,netpart.Values[combobox1.Text]])) ;
    //月结不含夜宵
    6:SQL.Add(Format(' exec hrsp_ADOmealtotting_up_yx ''%s'',''%s'',''%s'',''%s''',[sSql_ABC,sdaystr,edaystr,netpart.Values[combobox1.Text]])) ;
    //一餐多卡
    7:SQL.Add(Format(' exec hrsp_ADOmealtotting_checked ''%s'',''%s''',[sdaystr,edaystr])) ;
    end;
    //MessageBox(0,PChar(SQL.Text),'',0);
    case radiogroup1.ItemIndex of
    3,4,7:dbgrideh1.PopupMenu := popupmenu1;
    else
        dbgrideh1.PopupMenu := nil;
    end;
    Open;
    if not IsEmpty then
    begin
      edit1.ReadOnly := IsEmpty;
      Label1.Tag := 0;
      Label1.Caption:=DBGridEh1.Columns[0].Title.Caption;
      DBGridEh1.Columns[0].Title.Color:=clRed;
      label2.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
    end
    else
      label2.Caption := '0';


  end;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
var
  i: integer;
begin
//  self.Caption :=Application.Title;
//  user_ptr:='3'; //人员ID
//  vprev:='2';    //权限
//  rkey73:='9';   //
//  DM.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info=True;User ID=sa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';

  if not app_init(dm.ADOConnection1) then
  begin
   common.ShowMsg('程序启动失败,请联系系统管理员',1);
   application.Terminate;
   Exit;
  end;

   DateSeparator := '-';
   ShortDateFormat := 'yyyy-mm-dd';
   DateTimePicker1.Date := now;
   DateTimePicker2.Date := now;
   dbgrideh1.PopupMenu := nil;
   combobox1.Clear;

  with dm.ADOTMP do { 屏蔽卡钟可以将价钱清空 }
  begin
    SQL.Clear;
    SQL.Text :='SELECT DISTINCT SUBSTRING(position, 1, 2) AS fa, SUBSTRING(dev_ip, 1, CHARINDEX(''.'', dev_ip, 8) - 1) AS ip_addr'
    + #13#10 + 'FROM         dbo.dev_detail' + #13#10 +
    'WHERE     (purpose = ''m'') AND (devaddr = N''local'') AND (NOT (price IS NULL))';
    Open;
    First;
    netpart:=TStringList.Create;
    ippart:=TStringList.Create;
    while not Eof do
    begin
      netpart.Add(fieldbyname('fa').AsString+'='+fieldbyname('ip_addr').AsString);
      Next;
    end;
    Close;
  end;
  for i:=0 to netpart.Count-1 do
  ComboBox1.Items.Add(netpart.Names[i]);

  if ComboBox1.Items.Count>0 then
  begin
    ComboBox1.ItemIndex:=0;
    SendMessage(ComboBox1.Handle,CN_COMMAND,MakeLong(0,CBN_SELCHANGE),0);
  end;


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
    Exit;
  end;
 { 如果是本厂员工，card_add_u.label5.text 是0  员工RKEY 取employeemsg
  如果不是本厂员工，card_add_u.label5.text 是1 员工RKEY 取employeemsg_extra}

  with DM.ADOTMP do
  begin
    Active:=False;
    SQL.Text:=' select top 25 departmentname as 部门,employeecode as 工号,chinesename as 姓名,meal_type as 餐次级别 ,card_time as 打卡时间,  meal_date as 就餐日期, '+
    ' breakfast as 早餐 , lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡, '+
    ' (select employee_name from data0005 where cast(rkey as nvarchar(10))=v_meal.remark2) as 备注 ,id from dbo.v_meal '+
    ' where  v_meal.remark2 in (select cast(rkey as nvarchar(10)) from data0005) '+
    ' order by id desc  ';
    Active:=True;
  end;
  Label1.Tag := 0;
  edit1.ReadOnly := False;
  Label1.Caption:=DBGridEh1.Columns[0].Title.Caption;
  label2.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);
  dbgrideh1.PopupMenu := popupmenu1;
  radiogroup1.ItemIndex := 4;

  with Tfrm_card_add.Create(nil) do
  begin
    ShowModal;
    Free;
  end;


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
  if  ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
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
  with DM.ADOTMP do
  begin
    if (FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime])
    or (FieldByName(Column.FieldName).FieldKind = fkCalculated) then
    begin
      Edit1.Text:='';
      Edit1.ReadOnly:=True;
    end
    else
    Edit1.ReadOnly:=False;

  end;

  if Label1.Tag<> Column.Index then
  begin
    label1.Caption := column.Title.Caption ;
    DBGridEh1.Columns[Label1.Tag].Title.Color:= clBtnFace;
    Column.Title.Color := clred ;
    Label1.Tag:=Column.Index;
    Label1.Caption:=Column.Title.Caption;
  end;
  edit1.SetFocus;




end;


procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if Edit1.ReadOnly then Exit;
  with DM.ADOTMP do
  if Fields.Fields[Label1.Tag].DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
   Filtered:=False;
   if trim(Edit1.text) <> '' then
    begin
      if Fields.Fields[Label1.Tag].DataType in  [ftString, ftWideString]  then
        Filter:=' (' +  Fields.Fields[Label1.Tag].FieldName + ' like ''%' + trim(edit1.text) + '%'')'
      else if Fields.Fields[Label1.Tag].DataType in  [ftSmallint, ftInteger]  then
        Filter:=' (' + Fields.Fields[Label1.Tag].FieldName+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Filter:='';
   Filtered:=True;   
   end;
end;

procedure Tfrm_main.ComboBox1Change(Sender: TObject);
var
  i:Integer;
begin
  RadioGroup2.Enabled:=ComboBox1.ItemIndex>=0;
  with DM.ADOTMP do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Format('SELECT  DISTINCT    mealtype, position'
      + #13#10 + 'FROM         dbo.dev_detail' + #13#10 +
      'WHERE     (purpose = ''m'') AND (devaddr = N''local'') AND (dev_ip LIKE N''%s'') AND (NOT (price IS NULL))',[netpart.Values[ComboBox1.Text]+'%']));
    Open;
    First;
    if mealtypelist=nil then mealtypelist:=TStringList.Create;
    mealtypelist.Clear;
    while not Eof do
    begin
      mealtypelist.Add(fieldbyname('position').AsString+'='+fieldbyname('mealtype').AsString);
      Next;
    end;
    Close;
  end;
  with RadioGroup2.Items do
  begin
    Clear;
    for i:=0 to mealtypelist.Count-1 do
    begin
      Add(mealtypelist.Names[i]);
    end;
  end;
end;

procedure Tfrm_main.BitBtn4Click(Sender: TObject);
begin
  if not ((vprev='4') or (vprev='3')) then
  begin
    ShowMessage('你没有足够的权限');
    Exit;
  end;

  with DM.ADOTMP do
  begin
    Active:=False;
    SQL.Text:='SELECT * FROM dbo.dev_detail WHERE (devaddr = ''local'') AND (purpose = ''m'') ';
    Filter:='price>=0';
    Filtered:=True;
  end;

  with TDevinfo.Create(nil) do
  begin
    Position:=poMainFormCenter;
    Hint:=vprev;
    ShowModal;
    Free;
  end;
  with DM.ADOTMP do
  begin
    Active:=False;
    SQL.Clear;
    Filter:='';
    Filtered:=False;
  end;
end;

procedure Tfrm_main.Label5MouseEnter(Sender: TObject);
begin
  Panel1.Visible:=True;
  Panel1.Top:=20;
  Panel1.Left:=Self.ClientWidth-15-Panel1.Width;
end;

procedure Tfrm_main.Label5MouseLeave(Sender: TObject);
begin
  Panel1.Visible:=False;
end;

end.
