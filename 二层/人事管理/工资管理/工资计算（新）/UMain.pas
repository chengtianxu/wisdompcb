unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh,DateUtils,
  DB, ADODB;

type
  TFrmMain = class(TForm)
    dgh_main: TDBGridEh;
    Panel1: TPanel;
    Label_account: TLabel;
    lbl_field: TLabel;
    btn_quit: TBitBtn;
    btn_fields: TBitBtn;
    btn_refresh: TBitBtn;
    cbb_account: TComboBox;
    btn_Outport: TBitBtn;
    btn_model: TBitBtn;
    edt_value: TEdit;
    btn_import: TBitBtn;
    btn_qry: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    lbl_RCount: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbb_SMonth: TComboBox;
    btn_Save: TButton;
    btn_calsalary: TButton;
    cb_CheckAll: TCheckBox;
    sttext: TStaticText;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    pm_fields: TPopupMenu;
    pm_Main: TPopupMenu;
    N1: TMenuItem;
    N_lock: TMenuItem;
    N_CancelLock: TMenuItem;
    N4: TMenuItem;
    N_Audit: TMenuItem;
    N_CancelAdit: TMenuItem;
    N7: TMenuItem;
    N_hide: TMenuItem;
    N9: TMenuItem;
    N_paid: TMenuItem;
    N_Cancelpaid: TMenuItem;
    Button1: TButton;
    qry: TADOQuery;
    pnl1: TPanel;
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_quitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


    procedure btn_calsalaryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure N_lockClick(Sender: TObject);
    procedure dgh_mainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dgh_mainCellClick(Column: TColumnEh);
    procedure dgh_mainKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgh_mainTitleClick(Column: TColumnEh);
    procedure btn_fieldsClick(Sender: TObject);
    procedure btn_modelClick(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure btn_OutportClick(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure N_hideClick(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure N_paidClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbb_accountSelect(Sender: TObject);
    procedure cbb_SMonthSelect(Sender: TObject);
    procedure N_AuditClick(Sender: TObject);
    procedure N_CancelAditClick(Sender: TObject);
    procedure N_CancelpaidClick(Sender: TObject);
    procedure N_CancelLockClick(Sender: TObject);
    procedure cb_CheckAllClick(Sender: TObject);
  private
    field_name:  string;
    PreColumn: TColumnEh;
      Q_salary_original_str :string;         // ,Q_salary_new_str


     procedure GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
     procedure dbgrdrebulid;
     procedure item_click(sender: TObject);
  public
    { Public declarations }

   pYearMonth : string;

  end;

var
  FrmMain: TFrmMain;

implementation
         uses udm,common, UDB, Umodel, Uimport, Uqry;
{$R *.dfm}

procedure TFrmMain.btn_SaveClick(Sender: TObject);
begin
if ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
begin
  showmessage('没有操作权限');
  exit;
end;
btn_Save.Enabled := false;
try
  if dm.qry_Main.Active = true then
    begin
    dm.qry_Main.UpdateBatch();
    showmessage('保存成功');
    end
  else
    showmessage('无更新记录');
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
 
 btn_Save.Enabled := true;



end;

procedure TFrmMain.btn_quitClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  ssql:string;
begin

   lbl_field.Caption:=dgh_main.Columns[0].Title.Caption;
    field_name:= dgh_main.Columns[0].FieldName;
 self.PreColumn:=dgh_main.Columns[0];
 dgh_main.Columns[0].Title.Color:=clRed;
 //dgh_main.Columns[0].Title.SortMarker:=smUpEh;
 //dm.qry_main.Sort:=dgh_main.Columns[0].FieldName;

       cbb_accountSelect(sender);  //按账套生成grid字段
 

end;

procedure TFrmMain.btn_calsalaryClick(Sender: TObject);
var
  k,i:integer;
  ssql:string;
  BTime,ETIme: TDateTime;
begin
  if ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;

  if dm.qry_Main.IsEmpty then
  begin
    showmessage('没有数据操作');
    exit;
  end;

 if cbb_account.Text = '' then
  begin
    showmessage('请选择员工帐套');
    cbb_account.SetFocus;
    exit;
  end;

  ///////////
  GetSort(frmDb.SG1,7);
  //tag 决定运算级别，按层计算，下级依赖上级的层数大，并行级别可以一起算 ,很重要*****
  //btn_calsalary.Enabled := false;
  progressbar1.Visible := true;
  progressbar1.Position := 30 ;
  sttext.Caption := '更新考勤参数中...';
  application.ProcessMessages;
 try
      Btime:=Now;
   
    if not dm.con1.InTransaction then  dm.con1.BeginTrans;
    ssql :=' exec hrsp_GZ_all_work  ';    //获取工时项目参数
    dm.ExecSql(qry,ssql);
    sttext.Caption := '更新考勤参数完毕...';
   panel3.Visible := true ;
    k := frmdb.sg1.ColCount-1;
    
    application.ProcessMessages;
     sttext.Caption := '开始处理各项目...';
    for i:=0 to (frmdb.sg1.RowCount-1) do
    begin
    qry.SQL.Clear;
    qry.SQL.Text := frmdb.sg1.Cells[k,i];
    sttext.Caption := '处理项目:'+frmdb.sg1.Cells[1,i];
    //showmessage(qry.SQL.Text);
    application.ProcessMessages;
    if qry.SQL.Text<>''then
     begin
      qry.ExecSQL;
     end; 
    progressbar1.Position := trunc(i/(frmdb.sg1.RowCount-1)*100);
    //sleep(300);
    application.ProcessMessages;
    end;
    GetSort(frmdb.sg1,8);
    sttext.Caption :='';
    ETIme:=now;
    //ShowMessage(DateToStr(BTIme)+'---'+DateToStr(ETIme));
    showmessage('工资计算完毕,用时：'+inttostr(MinutesBetween(btime,etime))+'分');
    dbgrdrebulid;
    dm.con1.CommitTrans;
 except  on  e: exception do
   begin

    showmessage('工资计算失败:'+e.Message+inttostr(i));
   // showmessage(qry.sql.text) ;
    dm.con1.rollbacktrans;
    Exit;
    end;
 end;


  panel3.Visible := false ;
 // btn_calsalary.Enabled := true;
  application.ProcessMessages;
  btn_refresh.Click;



end;

procedure Tfrmmain.GetSort(var GenStrGrid : TStringGrid; ThatCol : Integer);
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


procedure TFrmMain.FormCreate(Sender: TObject);
var ssql:string;
begin
    user_ptr := '3023';
    vprev := '4';
    rkey73:='3023';


  if not App_init_2(dm.con1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

    self.Caption:=application.Title;
   try
 // :月份：
   ssql:='select checkyearmonth  from  salarycheck  order by actived desc,  checkyearmonth desc  ' ;
   dm.openqry(DM.qry_temp,ssql);
   with DM.qry_temp do
   begin
    first;
    while not eof do
    begin
    cbb_smonth.Items.Add(dm.qry_temp.fieldbyname('checkyearmonth').AsString);
    next;
    end;
    cbb_smonth.ItemIndex:=0;
   end;
    pYearMonth:= cbb_SMonth.Text;

   // :账套：
   ssql:='select rkey, accountname from  salaryaccount  ' ;
   dm.openqry(DM.qry_temp,ssql);
   with DM.qry_temp do
   begin
    first;
    while not eof do
    begin
    cbb_account.Items.AddObject(dm.qry_temp.fieldbyname('accountname').AsString,TObject(dm.qry_temp.fieldbyname('rkey').Asinteger));
    next;
    end;
      cbb_account.ItemIndex:=0;
   end;

   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;



   Q_salary_original_str:='';

end;

procedure TFrmMain.dbgrdrebulid;
var i,k :integer;
begin
  Panel1.Enabled := False;
  try
  
  i:=integer(cbb_account.Items.Objects[cbb_account.ItemIndex]);
  FrmDB.griddisplayrebuild(i);
  if dm.qry_Main.Active = true then  dm.qry_Main.Close;
  panel3.Visible := true;
  progressbar1.Visible := false;
  panel3.Caption := '数据刷新中,请稍后...';
  try
  application.ProcessMessages;
  dm.qry_Main.Open;
  lbl_RCount.Caption := '数据条数：'+inttostr(dm.qry_Main.RecordCount);
  except
  showmessage('数据打开失败');
  end;
  k := dgh_main.Columns.Count;
  panel3.Visible := false;
  dgh_main.Columns[0].ReadOnly := true;
  dgh_main.Columns[1].ReadOnly := true;
  dgh_main.Columns[2].ReadOnly := true;
  dgh_main.Columns[3].ReadOnly := true;
  dgh_main.Columns[4].ReadOnly := true;
  dgh_main.Columns[5].ReadOnly := true;
  dgh_main.Columns[0].Width := 100;
  dgh_main.Columns[1].Width := 60;
  dgh_main.Columns[2].Width := 45;
  dgh_main.Columns[3].Width := 50;
  dgh_main.Columns[4].Width := 65;
  dgh_main.Columns[5].Width := 65;
  for i:=0 to FrmDB.sg1.RowCount-1 do
    begin
      dgh_main.Columns[i+6].Width := strtoint(frmdb.sg1.Cells[9,i])+25;
      //普通字段的可见与隐藏
      if strtoint(frmdb.sg1.Cells[6,i])=1 then
      dgh_main.Columns[i+6].Visible := true else dgh_main.Columns[i+6].Visible := false ;
      //普通字段的可写性
      if ((strtoint(FrmDB.SG1.Cells[3,i])=0)
      and ((strtoint(vprev)=2) or (strtoint(vprev)=4))) then
      dgh_main.Columns[i+6].ReadOnly := false  else dgh_main.Columns[i+6].ReadOnly := true ;
      //变值字段变色
      if strtoint(frmdb.SG1.Cells[3,i])=0 then
      dgh_main.Columns[i+6].Color := clInfoBk ;
    end;
    dgh_main.Columns[k-9].Visible :=false;  //SID
    dgh_main.Columns[k-8].Width :=60;  //岗位
    dgh_main.Columns[k-7].Width :=60;       //用工类型

    dgh_main.Columns[k-6].Width :=100;      //   银行帐号
    dgh_main.Columns[k-5].Width :=100;      //   身份证
    dgh_main.Columns[k-4].Width :=50;       //   离职类型

    dgh_main.Columns[k-3].Width :=50;       //   变值
    dgh_main.Columns[k-2].Width :=50;       //   审核
    dgh_main.Columns[k-1].Width :=50;       //   已发

    dgh_main.Columns[k-8].ReadOnly := true;
    dgh_main.Columns[k-7].ReadOnly := true;
    dgh_main.Columns[k-6].ReadOnly := true;
    dgh_main.Columns[k-5].ReadOnly := true;
    dgh_main.Columns[k-4].ReadOnly := true;

    //特殊字段的可写性
    if  strtoint(vprev)=1 then
    begin
    dgh_main.Columns[k-1].ReadOnly := true;
    dgh_main.Columns[k-2].ReadOnly := true;
    dgh_main.Columns[k-3].ReadOnly := true;
    dgh_main.Columns[k-1].Visible := false;
    dgh_main.Columns[k-2].Visible := false;
    dgh_main.Columns[k-3].Visible := false;
    end;
    if   strtoint(vprev)=2 then
    begin
    dgh_main.Columns[k-1].ReadOnly := true;
    dgh_main.Columns[k-2].ReadOnly := true;
    dgh_main.Columns[k-3].ReadOnly := false;

    dgh_main.Columns[k-1].Visible := false;
    dgh_main.Columns[k-2].Visible := false;
    dgh_main.Columns[k-3].Visible := true;
    end;
    if   strtoint(vprev)=3 then
    begin
    dgh_main.Columns[k-1].ReadOnly := false;
    dgh_main.Columns[k-2].ReadOnly := false;
    dgh_main.Columns[k-3].ReadOnly := true;

    dgh_main.Columns[k-1].Visible := true;
    dgh_main.Columns[k-2].Visible := true;
    dgh_main.Columns[k-3].Visible := true;
    end;

    if   strtoint(vprev)=4 then
    begin
    dgh_main.Columns[k-1].ReadOnly := false;
    dgh_main.Columns[k-2].ReadOnly := false;
    dgh_main.Columns[k-3].ReadOnly := false;
    dgh_main.Columns[k-1].Visible := true;
    dgh_main.Columns[k-2].Visible := true;
    dgh_main.Columns[k-3].Visible := true;
    end;
    dgh_main.Refresh;
    field_name := dgh_main.Columns[0].FieldName;
    PreColumn := dgh_main.Columns[0];
    dgh_main.Columns[0].Title.Color := clred;
    //Application.ProcessMessages; 
    finally
      Panel1.Enabled := True;
    end;
end;

procedure TFrmMain.btn_refreshClick(Sender: TObject);
begin
dbgrdrebulid;//
end;

procedure TFrmMain.N_lockClick(Sender: TObject);
var
i:integer;
//s:string;
//f :TDateTime;
begin
  if ((strtoint(vprev)=1) or (strtoint(vprev)=2)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;
  if dgh_main.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  dgh_main.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to dgh_main.SelectedRows.Count - 1 do
        begin
        DM.qry_main.GotoBookmark(Pointer(dgh_main.SelectedRows.Items[I]));
        dgh_main.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [1]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [2]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := false;
           end;
        if  (Tmenuitem(Sender).Tag in [3]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [4]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := false;
           end;
        
        if dgh_main.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(dgh_main.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        dgh_main.DataSource.DataSet.Post;
        DM.qry_Main.UpdateBatch(arAll);
   end;
   if dgh_main.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   dgh_main.Enabled := true;
   application.ProcessMessages;
   end;  

end;

procedure TFrmMain.dgh_mainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if  ((dm.qry_Main.RecNo mod 2=0) and (column.Index>5)) then   //隔行淡黄色
     begin
       dgh_main.Canvas.Brush.Color:= clcream;   //淡黄色
       if dgh_main.Canvas.Brush.Color = clInfoBk then
       dgh_main.Canvas.Brush.Color:=clInfoBk;

       dgh_main.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     end;


    if DM.qry_Main.FieldByName('变值锁定').Value = true     //变值锁定行为绿色
   then
    dgh_main.Canvas.Font.Color := clgreen; //clmaroon ;
  // grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if DM.qry_main.FieldByName('审核').Value = true
   then
   begin
      dgh_main.Canvas.Font.Color := clWindowText; //clmaroon ;
      if (Column.Index=0) then
      begin
        dgh_main.Canvas.Font.Color := clmaroon ;
        dgh_main.Canvas.FillRect(Rect);
      end;
       end;  
  if  DM.qry_Main.FieldByName('已结算').Value = true
  then
 begin
      dgh_main.Canvas.Font.Color := clWindowText; //clmaroon ;
      if (Column.Index=0) then
      begin
        dgh_main.Canvas.Brush.Color := clsilver ;
        dgh_main.Canvas.Font.Color := clmaroon ;
        dgh_main.Canvas.FillRect(Rect);
      end;

   end;
  dgh_main.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmMain.dgh_mainCellClick(Column: TColumnEh);
var
i: Integer;

begin
   //选定一行后  有权限的人 变值锁定可以修改， 但审核后不可修改
   if ((dm.check_flag =0 )and ( (strtoint(vprev)=2) or (strtoint(vprev)=4))) then
   dm.qry_main.FieldByName('变值锁定').ReadOnly := false
   else dm.qry_main.FieldByName('变值锁定').ReadOnly := true;

   //重定义可写性
    for i:=0 to frmdb.sg1.RowCount-1 do
    begin
      //普通字段的可写性
      if ((strtoint(frmdb.sg1.Cells[3,i])=0)
         and ((strtoint(vprev)=2) or (strtoint(vprev)=4))
         and (dm.check_Flag=0)
         and (dm.change_flag=0) ) then
      dgh_main.Columns[i+6].ReadOnly := false
      else dgh_main.Columns[i+6].ReadOnly := true ;
    end;
end;

procedure TFrmMain.dgh_mainKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    i: integer;
begin
      {方向键(←)：   VK_LEFT   (37)
      方向键(↑)：   VK_UP   (38)
      方向键(→)：   VK_RIGHT   (39)
      方向键(↓)：   VK_DOWN   (40) }
  if key in [38,40] then
  begin
     //变值锁定的更改权限,在审核之后不可以改
     if ((dm.check_flag =0 )and ( (strtoint(vprev)=2) or (strtoint(vprev)=4))) then
     dm.qry_Main.FieldByName('变值锁定').ReadOnly := false
     else dm.qry_Main.FieldByName('变值锁定').ReadOnly := true;

     //重定义可写性
      for i:=0 to frmdb.Sg1.RowCount-1 do
      begin
        //普通字段的可写性
        if ((strtoint(frmdb.sg1.Cells[3,i])=0)
           and ((strtoint(vprev)=2) or (strtoint(vprev)=4))
           and (dm.check_flag=0)
           and (dm.change_flag=0) ) then
        dgh_main.Columns[i+6].ReadOnly := false
        else dgh_main.Columns[i+6].ReadOnly := true ;
      end;
   end;
end;

procedure TFrmMain.dgh_mainTitleClick(Column: TColumnEh);
begin
  if dgh_main.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry_main.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry_main.Sort:=Column.FieldName+' DESC';
  end;
  if dm.qry_Main.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ; 
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.btn_fieldsClick(Sender: TObject);
begin
pm_fields.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TFrmmain.item_click(sender: TObject);
var
  i:byte;
begin
  // 表前7项,部门工号姓名月份入离职职务不在过滤之中,表尾5项包括锁定与审核不在改变之中.
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to frmdb.sg1.RowCount - 1 do
    if frmdb.Sg1.Cells[1,i] = (sender as tmenuItem).Caption then
    begin
      frmdb.Sg1.Cells[6,i] := '1';
      break;
    end;
  end else begin
    for i := 0 to frmdb.Sg1.RowCount - 1  do
    if frmdb.Sg1.Cells[1,i] = (sender as tmenuItem).Caption then
    begin
      frmdb.Sg1.Cells[6,i] := '0';
      break;
    end;
  end;
    //frm_salarydb.Show;
end;


procedure TFrmMain.btn_modelClick(Sender: TObject);
begin
  frmmodel.ShowModal;
 // btn_refresh.Click;
end;

procedure TFrmMain.btn_importClick(Sender: TObject);
begin
    if ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
      begin
        showmessage('没有操作权限');
        exit;
      end;
     frmImport := TfrmImport.Create(Application);
     frmImport.Show;
end;

procedure TFrmMain.btn_OutportClick(Sender: TObject);
begin
Export_dbGrideh_to_Excel(dgh_main,'工资明细资料');
end;

procedure TFrmMain.edt_valueChange(Sender: TObject);
begin
  dm.qry_Main.Filtered:=false;
  if dm.qry_Main.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dm.qry_Main.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if dgh_main.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dgh_main.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_value.text) + '%'')'
      else if dm.qry_Main.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dm.qry_Main.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
    end else
      dm.qry_Main.Filter:='';

  end;
   dm.qry_Main.Filtered:=true;
end;

procedure TFrmMain.N_hideClick(Sender: TObject);
var i,k: integer;
begin
  k:=dgh_main.Selection.Columns.Count;
  for i:=0 to  k-1 do
  begin 
  dgh_main.Columns[dgh_main.Selection.Columns.Items[i].Index].Visible := false;
  end;
  showmessage('隐藏完毕');
end;

procedure TFrmMain.btn_qryClick(Sender: TObject);
var
 i:byte;
 ss:string;
begin

   with frmqry do
   begin
    frmqry.dtp2.Date:=Now;
    frmqry.dtp1.Date:=frmqry.dtp2.Date-1100;
   if frmqry.ShowModal=mrok then
   with dm.qry_Main do
    begin
     close;
     SQL.Text := Q_salary_original_str;
     for i:=1 to sg1.RowCount-2 do
      SQL.Text:= SQL.Text+sg1.Cells[2,i]+#13;
    end;
   end;

   ss:= dm.qry_Main.SQL.Text;

  try
    //dm.qry_Main.open;

    btn_refreshClick(Sender);

  except   on e: exception   do
    begin
    showmessage('查询失败:'+e.message);
    end;

   end;

 end;

procedure TFrmMain.N_paidClick(Sender: TObject);
var
i:integer;
//s:string;
//f :TDateTime;
begin
  if (strtoint(vprev)<>3) then
  begin
    showmessage('没有操作权限');
    exit;
  end;

  if dgh_main.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  dgh_main.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to dgh_main.SelectedRows.Count - 1 do
        begin
        DM.qry_Main.GotoBookmark(Pointer(dgh_main.SelectedRows.Items[I]));
        dgh_main.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [5]) then
           begin
              dgh_main.DataSource.DataSet.FieldByName('已结算').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [6]) then
           begin
              dgh_main.DataSource.DataSet.FieldByName('已结算').Value := false;
           end;
        
        if dgh_main.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(dgh_main.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        dgh_main.DataSource.DataSet.Post;
        DM.qry_main.UpdateBatch(arAll);
   end;
   if dgh_main.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   dgh_main.Enabled := true;
   application.ProcessMessages;
   end;
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
FrmDB.ShowModal;
end;

procedure TFrmMain.cbb_accountSelect(Sender: TObject);
var i : integer;
    item:TMenuItem;
    //a_value :string;
begin
  if cbb_account.Text=''  then  exit;
  i:=integer(cbb_account.Items.Objects[cbb_account.ItemIndex]);
  frmdb.buildgrid(i);    //更新各栏位的值
  dgh_main.FrozenCols :=6 ;
  //重新选择,重新生成QSQL
  dm.qry_Main.SQL.Add('and yearmonth='''+cbb_smonth.Text+''' ');

  Q_salary_original_str := dm.qry_Main.SQL.Text; //原始串带月份

  //重新刷新原始查询语句
     dbgrdrebulid;
   if btn_fields.Enabled = false then  btn_fields.Enabled := true;
   if btn_refresh.Enabled = false then  btn_refresh.Enabled := true;
   if btn_OutPort.Enabled = false then  btn_OutPort.Enabled := true;
   if btn_model.Enabled = false then  btn_model.Enabled := true;
   if btn_import.Enabled = false then  btn_import.Enabled := true;
  field_name := dgh_main.Columns[0].FieldName;
  PreColumn := dgh_main.Columns[0];
  dgh_main.Columns[0].Title.Color := clred ;
  //字段分布开始排列
  pm_fields.Items.Clear;
  for i := 6 to dgh_main.Columns.Count-10 do
  begin
    item := TmenuItem.Create(self);
    item.Caption := dgh_main.Columns[i].Title.Caption;
    item.Checked :=dgh_main.Columns[i].Visible ;
    item.OnClick := item_click ;
    PM_Fields.Items.Add(item) ;
  end;
  if edt_value.Enabled = false then edt_value.Enabled := true;

  
end;

procedure TFrmMain.cbb_SMonthSelect(Sender: TObject);
var i : integer;
begin
  pYearMonth:= cbb_SMonth.Text;
  if cbb_account.Text = '' then
  begin
  showmessage('请先选择帐套');
  cbb_account.SetFocus;
  exit;
  end;
//  if cbb_SMonth.ItemIndex <> 0 then
//    begin
//      btn_quit.Enabled := false;
//      btn_fields.Enabled := false;
//    end
//  else
//    begin
//      btn_quit.Enabled := true;
//      btn_fields.Enabled := true;
//    end;
  i:=integer(cbb_account.Items.Objects[cbb_account.ItemIndex]);
  frmdb.buildgrid(i);
  dgh_main.FrozenCols :=6 ;
  dm.qry_main.SQL.Add('and yearmonth='''+cbb_smonth.Text+''' ');
  Q_salary_original_str :=dm.qry_main.SQL.Text;//原始串带月份

  dbgrdrebulid;
end;

procedure TFrmMain.N_AuditClick(Sender: TObject);
var
i:integer;
//s:string;
//f :TDateTime;
begin
  if ((strtoint(vprev)=1) or (strtoint(vprev)=2)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;
  if dgh_main.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  dgh_main.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to dgh_main.SelectedRows.Count - 1 do
        begin
        DM.qry_Main.GotoBookmark(Pointer(dgh_main.SelectedRows.Items[I]));
        dgh_main.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [1]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [2]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := false;
           end;
        if  (Tmenuitem(Sender).Tag in [3]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [4]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := false;
           end;
        
        if dgh_main.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(dgh_main.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        dgh_main.DataSource.DataSet.Post;
        DM.qry_Main.UpdateBatch(arAll);
   end;
   if dgh_main.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   dgh_main.Enabled := true;
   application.ProcessMessages;
   end;  

end;

procedure TFrmMain.N_CancelAditClick(Sender: TObject);
var
i:integer;
// strrkey:string;
//f :TDateTime;
begin
  if ((strtoint(vprev)=1) or (strtoint(vprev)=2)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;
  if dgh_main.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  dgh_main.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to dgh_main.SelectedRows.Count - 1 do
        begin
        DM.qry_Main.GotoBookmark(Pointer(dgh_main.SelectedRows.Items[I]));
        dgh_main.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [1]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [2]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := false;
           end;
        if  (Tmenuitem(Sender).Tag in [3]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [4]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := false;
           end;
        
        if dgh_main.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(dgh_main.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        dgh_main.DataSource.DataSet.Post;
        DM.qry_Main.UpdateBatch(arAll);
   end;
   if dgh_main.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   dgh_main.Enabled := true;
   application.ProcessMessages;
   end;    
end;

procedure TFrmMain.N_CancelpaidClick(Sender: TObject);
var
i:integer;
// strrkey:string;
//f :TDateTime;
begin
  if (strtoint(vprev)<>3) then
  begin
    showmessage('没有操作权限');
    exit;
  end;

  if dgh_main.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  dgh_main.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to dgh_main.SelectedRows.Count - 1 do
        begin
        DM.qry_Main.GotoBookmark(Pointer(dgh_main.SelectedRows.Items[I]));
        dgh_main.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [5]) then
           begin
              dgh_main.DataSource.DataSet.FieldByName('已结算').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [6]) then
           begin
              dgh_main.DataSource.DataSet.FieldByName('已结算').Value := false;
           end;
        
        if dgh_main.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(dgh_main.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        dgh_main.DataSource.DataSet.Post;
        DM.qry_Main.UpdateBatch(arAll);
   end;
   if dgh_main.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   dgh_main.Enabled := true;
   application.ProcessMessages;
   end;

end;

procedure TFrmMain.N_CancelLockClick(Sender: TObject);
var
i:integer;
 //strrkey:string;
//f :TDateTime;
begin
  if ((strtoint(vprev)=1) or (strtoint(vprev)=2)) then
  begin
    showmessage('没有操作权限');
    exit;
  end;
  if dgh_main.SelectedRows.Count>10 then
  begin
  panel3.Visible := true;
  progressbar1.Visible := true;
  panel3.Caption := '数据更新中,请稍后...';
  dgh_main.Enabled := false;
  application.ProcessMessages;
  end;

  for I := 0 to dgh_main.SelectedRows.Count - 1 do
        begin
        DM.qry_Main.GotoBookmark(Pointer(dgh_main.SelectedRows.Items[I]));
        dgh_main.DataSource.DataSet.Edit;
        if  (Tmenuitem(Sender).Tag in [1]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [2]) then
           begin
             if   dgh_main.DataSource.DataSet.FieldByName('审核').Value = false then
                  dgh_main.DataSource.DataSet.FieldByName('变值锁定').Value := false;
           end;
        if  (Tmenuitem(Sender).Tag in [3]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := true;
           end;
        if  (Tmenuitem(Sender).Tag in [4]) then
           begin
                  dgh_main.DataSource.DataSet.FieldByName('审核').Value := false;
           end;
        
        if dgh_main.SelectedRows.Count>10 then
        begin
        progressbar1.Position := trunc(i/(dgh_main.SelectedRows.Count)*100);
        sleep(10);
        application.ProcessMessages;
        end;
        dgh_main.DataSource.DataSet.Post;
        DM.qry_Main.UpdateBatch(arAll);
   end;
   if dgh_main.SelectedRows.Count>10 then
   begin
   panel3.Visible := false ;
   dgh_main.Enabled := true;
   application.ProcessMessages;
   end;    
end;

procedure TFrmMain.cb_CheckAllClick(Sender: TObject);
begin
 dgh_main.SelectedRows.SelectAll;
end;

end.
