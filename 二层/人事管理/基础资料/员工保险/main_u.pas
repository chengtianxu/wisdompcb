unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ComCtrls, Menus,
  DB,ADODB,common,StrUtils;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Label_account: TLabel;
    Panel2: TPanel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Grd1: TDBGridEh;
    Button1: TButton;
    Label6: TLabel;
    Button2: TButton;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    PMFlds: TPopupMenu;
    Label7: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    BitBtn6: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    BitBtn7: TBitBtn;
    CheckBox1: TCheckBox;
    N10: TMenuItem;
    N11: TMenuItem;
    sttext: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Grd1CellClick(Column: TColumnEh); 
    procedure Grd1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Q_salary_original_str :string;
    Q_salary_new_str :string;
    FsCheck,FsSearch,detp_str,empcode_str,empname_str,duty_str:string;
    procedure item_click(sender:TObject);
    procedure dbgrdrebulid;
    procedure GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;
  

implementation

uses damo, frm_salarydb_u, rpt_model_u, salary_import_u, UQuery;

{$R *.dfm}

procedure Tfrm_main.Button1Click(Sender: TObject);
var i,k: integer; 
begin
if ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
begin
  showmessage('没有操作权限');
  exit;
end;

if ((label8.Caption ='数据条数：0') or (label8.Caption='数据条数：')) then
begin
  showmessage('没有数据操作');
  exit;
end;

if combobox1.Text = '' then
  begin
    showmessage('请选择员工帐套');
    combobox1.SetFocus;
    exit;
  end;
GetSort(frm_salarydb.StringGrid1,7);
//tag 决定运算级别，按层计算，下级依赖上级的层数大，并行级别可以一起算 ,很重要*****
button1.Enabled := false;
dm.ADOTMP.SQL.Clear;
progressbar1.Visible := true;
progressbar1.Position := 30 ;
sttext.Caption := '获取考勤参数中...';
application.ProcessMessages;
dm.ADOTMP.SQL.Text :=' exec hrsp_GZ_all_work ';    //获取工时项目参数
dm.ADOTMP.ExecSQL;
panel3.Visible := true ;  
k := frm_salarydb.StringGrid1.ColCount-1;
// frm_salarydb.Show;
application.ProcessMessages;
 try
    for i:=0 to (frm_salarydb.StringGrid1.RowCount-1) do
    begin
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text := frm_salarydb.stringgrid1.Cells[k,i];
    //if dm.ADOTMP.SQL.Text<>''then showmessage(dm.ADOTMP.SQL.Text);
    sttext.Caption := '处理项目:'+frm_salarydb.StringGrid1.Cells[1,i];
    application.ProcessMessages;
    if dm.ADOTMP.SQL.Text<>''then dm.ADOTMP.ExecSQL;
    progressbar1.Position := trunc(i/(frm_salarydb.StringGrid1.RowCount-1)*100);
    //sleep(300);
    application.ProcessMessages;
    end;
    GetSort(frm_salarydb.StringGrid1,8);
    sttext.Caption :='';
    showmessage('工资计算完毕');
    dbgrdrebulid;
 except
    showmessage('工资计算失败');
 end;
panel3.Visible := false ;
button1.Enabled := true;
application.ProcessMessages;
BitBtn3.Click;
end;

procedure Tfrm_main.Grd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if  ((dm.Q_salary.RecNo mod 2=0) and (column.Index>5)) then   //如果条件成立
     begin
       Grd1.Canvas.Brush.Color:= clcream;
       if Grd1.Canvas.Brush.Color = clInfoBk then Grd1.Canvas.Brush.Color:=clInfoBk;
       Grd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     end;


    if DM.DS_Q_salary.DataSet.FieldByName('变值锁定').Value = true
   then
    grd1.Canvas.Font.Color := clgreen; //clmaroon ;
  // grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if DM.DS_Q_salary.DataSet.FieldByName('审核').Value = true
   then
   begin
      grd1.Canvas.Font.Color := clWindowText; //clmaroon ;
      if (Column.Index=0) then
      begin
        grd1.Canvas.Font.Color := clmaroon ;
        grd1.Canvas.FillRect(Rect);
      end;
       end;  
  if  DM.DS_Q_salary.DataSet.FieldByName('已结算').Value = true
  then
 begin
      grd1.Canvas.Font.Color := clWindowText; //clmaroon ;
      if (Column.Index=0) then
      begin
        grd1.Canvas.Brush.Color := clsilver ;
        grd1.Canvas.Font.Color := clmaroon ;
        grd1.Canvas.FillRect(Rect);
      end;

   end;
  grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
var i,rkey: integer;
begin

  user_ptr := '3';
  vprev := '2';

//  if not App_init_2(dm.ADOConnection1 ) then
//  begin
//    ShowMsg('程序起动失败请联系管理员',1);
//    application.Terminate;
//    exit;
//  end;




  Caption := application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  //查询条件清空
  detp_str := '';
  empcode_str := '';
  empname_str := '';
  duty_str := '';
  //界面设置
 if  ( (strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    button1.Enabled := false;
    button2.Enabled := false;
  end;
  combobox1.Clear;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :='select * from salaryaccount';
  dm.ADOTMP.Open;
  for i:=0 to dm.ADOTMP.RecordCount-1 do
    begin
     rkey :=  strtoint(dm.ADOTMP.FieldByName('rkey').asstring);
     combobox1.Items.AddObject(dm.ADOTMP.FieldByName('accountname').asString,Tobject(rkey));
     dm.ADOTMP.Next;
    end;
  combobox1.Text := '';  
  //frm_salarydb :=Tfrm_salarydb.Create(nil);
  combobox2.Clear;
  dm.ADOTMP.Close;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :=' select * from salarycheck order by actived desc ,checkyearmonth desc';
  dm.ADOTMP.Open;
  for i:=0 to dm.ADOTMP.RecordCount-1 do
    begin
     combobox2.Items.Add(dm.ADOTMP.FieldByName('checkyearmonth').asString);
     dm.ADOTMP.Next;
    end;
  combobox2.ItemIndex :=0;
  //showmessage('1');
  //frm_salarydb :=Tfrm_salarydb.Create(nil);
  //showmessage('2');
  dm.ADOTMP.Close;
  Q_salary_original_str:='';//原始查询语句赋空值
end;

procedure Tfrm_main.ComboBox1Select(Sender: TObject);
var i : integer;
    item:TMenuItem;
    a_value :string;
begin
  i:=integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
  frm_salarydb.buildgrid(i);
  Grd1.FrozenCols :=6 ;
  //重新选择,重新生成QSQL
  dm.Q_salary.SQL.Add('and yearmonth='+#39+combobox2.Text+#39);
  Q_salary_original_str := dm.Q_salary.SQL.Text; //原始串带月份
  //重新刷新原始查询语句
  dbgrdrebulid;
   if bitbtn2.Enabled = false then  bitbtn2.Enabled := true;
   if bitbtn3.Enabled = false then  bitbtn3.Enabled := true;
   if bitbtn4.Enabled = false then  bitbtn4.Enabled := true;
   if bitbtn5.Enabled = false then  bitbtn5.Enabled := true;
   if bitbtn6.Enabled = false then  bitbtn6.Enabled := true;
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  //字段分布开始排列
  pmflds.Items.Clear;
  for i := 6 to Grd1.Columns.Count-10 do
  begin
    item := TmenuItem.Create(self);
    item.Caption := Grd1.Columns[i].Title.Caption;
    item.Checked :=Grd1.Columns[i].Visible ;
    item.OnClick := item_click ;
    PMFlds.Items.Add(item) ;
  end;
  if edit1.Enabled = false then edit1.Enabled := true;
end;

 procedure Tfrm_main.ComboBox2Change(Sender: TObject);
var i : integer;
begin
  if combobox1.Text = '' then
  begin
  showmessage('请先选择帐套');
  combobox1.SetFocus;
  exit;
  end;
  if combobox2.ItemIndex <> 0 then
    begin
      button1.Enabled := false;
      button2.Enabled := false;
    end
  else
    begin
      button1.Enabled := true;
      button2.Enabled := true;
    end;
  i:=integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
  frm_salarydb.buildgrid(i);
  Grd1.FrozenCols :=6 ;
  //重新选择,重新生成SQL ;dm.q_salary语句重置  //重新选择,重新生成QSQL
  dm.Q_salary.SQL.Add('and yearmonth='+#39+combobox2.Text+#39);
  Q_salary_original_str :=dm.Q_salary.SQL.Text;//原始串带月份
  //ShowMessage('运算前1'+dm.Q_salary.SQL.Text);
  //ShowMessage('运算前2'+Q_salary_original_str);
  dbgrdrebulid;
  //ShowMessage('运算后1'+dm.Q_salary.SQL.Text);
  //ShowMessage('运算后2'+Q_salary_original_str);
end;

procedure Tfrm_main.CheckBox1Click(Sender: TObject);
var i : integer;
begin
  grd1.SelectedRows.SelectAll;
end;


procedure Tfrm_main.Button2Click(Sender: TObject);
begin
if ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
begin
  showmessage('没有操作权限');
  exit;
end;
button2.Enabled := false;
try
  if dm.Q_salary.Active = true then
    begin
    dm.Q_salary.UpdateBatch();
    showmessage('保存成功');
    end
  else
    showmessage('无更新记录');
except
  Showmessage('保存失败!');
end;
 button2.Enabled := true;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
 PMFlds.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.item_click(sender: TObject);
var
  i:byte;
begin
  // 表前7项,部门工号姓名月份入离职职务不在过滤之中,表尾5项包括锁定与审核不在改变之中.
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to frm_salarydb.StringGrid1.RowCount - 1 do
    if frm_salarydb.StringGrid1.Cells[1,i] = (sender as tmenuItem).Caption then
    begin
      frm_salarydb.StringGrid1.Cells[6,i] := '1';
      break;
    end;
  end else begin
    for i := 0 to frm_salarydb.StringGrid1.RowCount - 1  do
    if frm_salarydb.StringGrid1.Cells[1,i] = (sender as tmenuItem).Caption then
    begin
      frm_salarydb.StringGrid1.Cells[6,i] := '0';
      break;
    end;
  end;
    //frm_salarydb.Show;
end;
procedure TFrm_main.dbgrdrebulid;
var i,k :integer;
begin
  Panel1.Enabled := False;
  try

  i:=integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
  frm_salarydb.griddisplayrebuild(i);
  if dm.Q_salary.Active = true then  dm.Q_salary.Close;
  panel3.Visible := true;
  progressbar1.Visible := false;
  panel3.Caption := '数据刷新中,请稍后...';
  try
  application.ProcessMessages;
  dm.Q_salary.Open;
  label8.Caption := '数据条数：'+inttostr(dm.Q_salary.RecordCount);
  except
  showmessage('数据打开失败');
  end;
  k := grd1.Columns.Count;
  panel3.Visible := false;
  Grd1.Columns[0].ReadOnly := true;
  Grd1.Columns[1].ReadOnly := true;
  Grd1.Columns[2].ReadOnly := true;
  Grd1.Columns[3].ReadOnly := true;
  Grd1.Columns[4].ReadOnly := true;
  Grd1.Columns[5].ReadOnly := true;
  Grd1.Columns[0].Width := 100;
  Grd1.Columns[1].Width := 60;
  Grd1.Columns[2].Width := 45;
  Grd1.Columns[3].Width := 50;
  Grd1.Columns[4].Width := 65;
  Grd1.Columns[5].Width := 65;
  for i:=0 to frm_salarydb.StringGrid1.RowCount-1 do
    begin
      Grd1.Columns[i+6].Width := strtoint(frm_salarydb.StringGrid1.Cells[9,i])+25;
      //普通字段的可见与隐藏
      if strtoint(frm_salarydb.StringGrid1.Cells[6,i])=1 then
      Grd1.Columns[i+6].Visible := true else Grd1.Columns[i+6].Visible := false ;
      //普通字段的可写性
      if ((strtoint(frm_salarydb.StringGrid1.Cells[3,i])=0)
      and ((strtoint(vprev)=2) or (strtoint(vprev)=4))) then
      Grd1.Columns[i+6].ReadOnly := false  else Grd1.Columns[i+6].ReadOnly := true ;
      //变值字段变色
      if strtoint(frm_salarydb.StringGrid1.Cells[3,i])=0 then
      Grd1.Columns[i+6].Color := clInfoBk ;
    end;
    grd1.Columns[k-9].Visible :=false;  //SID
    grd1.Columns[k-8].Width :=60;  //岗位
    grd1.Columns[k-7].Width :=60;       //用工类型

    grd1.Columns[k-6].Width :=100;      //   银行帐号
    grd1.Columns[k-5].Width :=100;      //   身份证
    grd1.Columns[k-4].Width :=50;       //   离职类型

    grd1.Columns[k-3].Width :=50;       //   变值
    grd1.Columns[k-2].Width :=50;       //   审核
    grd1.Columns[k-1].Width :=50;       //   已发

    grd1.Columns[k-8].ReadOnly := true;
    grd1.Columns[k-7].ReadOnly := true;
    grd1.Columns[k-6].ReadOnly := true;
    grd1.Columns[k-5].ReadOnly := true;
    grd1.Columns[k-4].ReadOnly := true;

    //特殊字段的可写性
    if  strtoint(vprev)=1 then
    begin
    grd1.Columns[k-1].ReadOnly := true;
    grd1.Columns[k-2].ReadOnly := true;
    grd1.Columns[k-3].ReadOnly := true;
    grd1.Columns[k-1].Visible := false;
    grd1.Columns[k-2].Visible := false;
    grd1.Columns[k-3].Visible := false;
    end;
    if   strtoint(vprev)=2 then
    begin
    grd1.Columns[k-1].ReadOnly := true;
    grd1.Columns[k-2].ReadOnly := true;
    grd1.Columns[k-3].ReadOnly := false;

    grd1.Columns[k-1].Visible := false;
    grd1.Columns[k-2].Visible := false;
    grd1.Columns[k-3].Visible := true;
    end;
    if   strtoint(vprev)=3 then
    begin
    grd1.Columns[k-1].ReadOnly := false;
    grd1.Columns[k-2].ReadOnly := false;
    grd1.Columns[k-3].ReadOnly := true;

    grd1.Columns[k-1].Visible := true;
    grd1.Columns[k-2].Visible := true;
    grd1.Columns[k-3].Visible := true;
    end;

    if   strtoint(vprev)=4 then
    begin
    grd1.Columns[k-1].ReadOnly := false;
    grd1.Columns[k-2].ReadOnly := false;
    grd1.Columns[k-3].ReadOnly := false;
    grd1.Columns[k-1].Visible := true;
    grd1.Columns[k-2].Visible := true;
    grd1.Columns[k-3].Visible := true;
    end;
    Grd1.Refresh;
    field_name := Grd1.Columns[0].FieldName;
    PreColumn := Grd1.Columns[0];
    Grd1.Columns[0].Title.Color := clred;
    //Application.ProcessMessages; 
    finally
      Panel1.Enabled := True;
    end;
end;

procedure Tfrm_main.Grd1CellClick(Column: TColumnEh);
var     i: integer;
begin
   //变值锁定的更改权限,在审核之后不可以改
   if ((dm.check_flag =0 )and ( (strtoint(vprev)=2) or (strtoint(vprev)=4))) then
   dm.Q_salary.FieldByName('变值锁定').ReadOnly := false
   else dm.Q_salary.FieldByName('变值锁定').ReadOnly := true;

   //重定义可写性
    for i:=0 to frm_salarydb.StringGrid1.RowCount-1 do
    begin
      //普通字段的可写性
      if ((strtoint(frm_salarydb.StringGrid1.Cells[3,i])=0)
         and ((strtoint(vprev)=2) or (strtoint(vprev)=4))
         and (dm.check_flag=0)
         and (dm.change_flag=0) ) then
      Grd1.Columns[i+6].ReadOnly := false
      else Grd1.Columns[i+6].ReadOnly := true ;
    end;
end;
 procedure Tfrm_main.Grd1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var     i: integer;
begin
      {方向键(←)：   VK_LEFT   (37)
      方向键(↑)：   VK_UP   (38)
      方向键(→)：   VK_RIGHT   (39)
      方向键(↓)：   VK_DOWN   (40) }
  if key in [38,40] then
  begin
     //变值锁定的更改权限,在审核之后不可以改
     if ((dm.check_flag =0 )and ( (strtoint(vprev)=2) or (strtoint(vprev)=4))) then
     dm.Q_salary.FieldByName('变值锁定').ReadOnly := false
     else dm.Q_salary.FieldByName('变值锁定').ReadOnly := true;

     //重定义可写性
      for i:=0 to frm_salarydb.StringGrid1.RowCount-1 do
      begin
        //普通字段的可写性
        if ((strtoint(frm_salarydb.StringGrid1.Cells[3,i])=0)
           and ((strtoint(vprev)=2) or (strtoint(vprev)=4))
           and (dm.check_flag=0)
           and (dm.change_flag=0) ) then
        Grd1.Columns[i+6].ReadOnly := false
        else Grd1.Columns[i+6].ReadOnly := true ;
      end;
   end;
end;

procedure Tfrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.Q_salary.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.Q_salary.Sort:=Column.FieldName+' DESC';
  end; 
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ; 
  end else
    edit1.SetFocus;
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure Tfrm_main.BitBtn3Click(Sender: TObject);
begin
dbgrdrebulid;
end;

procedure Tfrm_main.BitBtn4Click(Sender: TObject);
begin
Export_dbGrideh_to_Excel(grd1,self.Caption);
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure Tfrm_main.GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
const
 TheSeparator = '@'; // Define the Separator
var
 CountItem, I, J, K, ThePosition : Integer;
 MyList : TStringList;
 MyString, TempString : String;
begin
 CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
  for i:=0 to CountItem-1 do
  begin
    GenStrGrid.Cells[ThatCol,i] := StringofChar('0',3-Length(GenStrGrid.Cells[ThatCol,i]))+GenStrGrid.Cells[ThatCol,i];
  end;
 MyList := TStringList.Create;//Create the List
 MyList.Sorted := False;
 try
  begin
   for I := 1 to (CountItem - 1) do
   MyList.Add(GenStrGrid.Rows[I].Strings[ThatCol] + TheSeparator + GenStrGrid.Rows[I].Text);
   Mylist.Sort;//Sort the List
   for K := 1 to Mylist.Count do
    begin
     MyString := MyList.Strings[(K - 1)];//Take the String of the line (K ? 1)
     ThePosition := Pos(TheSeparator, MyString);//Find the position of the Separator in the String
     TempString := '';
     TempString := Copy(MyString, (ThePosition + 1), Length(MyString));
     MyList.Strings[(K - 1)] := '';
     MyList.Strings[(K - 1)] := TempString;
    end;
   for J := 1 to (CountItem - 1) do
    GenStrGrid.Rows[J].Text := MyList.Strings[(J - 1)];//Refill the StringGrid
  end;
 finally
  MyList.Free;//Free the List
 end;
  CountItem := GenStrGrid.RowCount; // Give the number of rows in the StringGrid
  for i:=0 to CountItem-1 do
  begin
    GenStrGrid.Cells[ThatCol,i] := inttostr(strtoint(GenStrGrid.Cells[ThatCol,i]));
  end;
end;


procedure Tfrm_main.BitBtn5Click(Sender: TObject);
begin

  frm_rpt_model.ShowModal;
  //frm_rpt_model.Free;
  BitBtn3.Click;
end;

procedure Tfrm_main.BitBtn6Click(Sender: TObject);
begin
      if ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
      begin
        showmessage('没有操作权限');
        exit;
      end;
     frm_salary_import := Tfrm_salary_import.Create(Application);
     frm_salary_import.Show;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
combobox1.ItemIndex := 0;
ComboBox1Select(Sender);
end;

procedure Tfrm_main.N8Click(Sender: TObject);
var i,k: integer;
begin
  k:=grd1.Selection.Columns.Count;
  for i:=0 to  k-1 do
  begin 
  //showmessage(grd1.Selection.Columns.Items[i].FieldName);
  //showmessage(inttostr(grd1.Selection.Columns.Items[i].Index));
  Grd1.Columns[grd1.Selection.Columns.Items[i].Index].Visible := false;
  end;
  showmessage('隐藏完毕');
end;

procedure Tfrm_main.N2Click(Sender: TObject);  //变值锁定
var
i,cur_rkey:integer;
s,date_s,yearmonth_s, strrkey:string;
f :TDateTime;
begin
  if ((strtoint(vprev)=1) or (strtoint(vprev)=2)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;
  if grd1.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  grd1.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to grd1.SelectedRows.Count - 1 do
        begin
        DM.Q_salary.GotoBookmark(Pointer(grd1.SelectedRows.Items[I]));
        grd1.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [1]) then
           begin
             if   grd1.DataSource.DataSet.FieldByName('审核').Value = false then
                  grd1.DataSource.DataSet.FieldByName('变值锁定').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [2]) then
           begin
             if   grd1.DataSource.DataSet.FieldByName('审核').Value = false then
                  grd1.DataSource.DataSet.FieldByName('变值锁定').Value := false;
           end;
        if  (Tmenuitem(Sender).Tag in [3]) then
           begin
                  grd1.DataSource.DataSet.FieldByName('审核').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [4]) then
           begin
                  grd1.DataSource.DataSet.FieldByName('审核').Value := false;
           end;
        
        if grd1.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(grd1.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        grd1.DataSource.DataSet.Post;
        DM.Q_salary.UpdateBatch(arAll);
   end;
   if grd1.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   grd1.Enabled := true;
   application.ProcessMessages;
   end;    
end;

procedure Tfrm_main.BitBtn7Click(Sender: TObject);
var
 i:byte;
begin
  //ShowMessage(Q_salary_original_str);
with Query_Form do
 begin
      with dm.ADOTMP do
      begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        dtpk2.Date:=StrToDateTime(fieldvalues['sys_date']);
        dtpk1.Date:=dtpk2.Date-1100;
      end;
 if ShowModal=mrok then
   with dm.Q_salary do
    begin
     close;
     SQL.Text := Q_salary_original_str;
     for i:=1 to SGrid1.RowCount-2 do
        SQL.Text:= SQL.Text+SGrid1.Cells[2,i]+#13;
    end;
  end;
  try
    BitBtn3Click(Sender);
   // ShowMessage(DM.Q_salary.SQL.Text);
  except
    showmessage('查询失败');
  end;
end;  
procedure Tfrm_main.N10Click(Sender: TObject);
var
i,cur_rkey:integer;
s,date_s,yearmonth_s, strrkey:string;
f :TDateTime;
begin
  if (strtoint(vprev)<>3) then
  begin
    showmessage('没有操作权限');
    exit;
  end;

  if grd1.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  grd1.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to grd1.SelectedRows.Count - 1 do
        begin
        DM.Q_salary.GotoBookmark(Pointer(grd1.SelectedRows.Items[I]));
        grd1.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [5]) then
           begin
              grd1.DataSource.DataSet.FieldByName('已结算').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [6]) then
           begin
              grd1.DataSource.DataSet.FieldByName('已结算').Value := false;
           end;
        
        if grd1.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(grd1.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        grd1.DataSource.DataSet.Post;
        DM.Q_salary.UpdateBatch(arAll);
   end;
   if grd1.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   grd1.Enabled := true;
   application.ProcessMessages;
   end;

end;

end.

