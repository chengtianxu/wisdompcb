unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Menus, ExtCtrls,  StdCtrls,
  Buttons, Grids, DBGridEh, ComCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, ADODB,  common,OleCtrls, FrmEmpSalary,
   damo, DateUtils,DBGrids, ComObj, ActnList;

type
  TFrmMain = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    edt_1: TEdit;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    CheckBox1: TCheckBox;
    lblCount: TLabel;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    DBGridEH2: TDBGridEh;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    ComboBox1: TComboBox;
    Timer1: TTimer;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    N3: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    pnl1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGridEH2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEH2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEH2TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEH2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, StrsTemp, statusTag, sysMoth : string;
    Q_salary_original_str :string;
    Q_salary_new_str :string;
    procedure item_click(sender: TObject);
    procedure GetItemsInfo(salaryaccountrkey: Integer; statusTag: string;Q_salary_new_str:string; sysMoths: string = '');
    procedure GetSalaryInfo(sender: TObject);
  public

  end;

var
  FrmMain: TFrmMain;

implementation

uses
  ExcelFrm, UQuery   , u_hideitem;
  
{$R *.dfm}
//单击字段，过滤显示字段。
procedure TfrmMain.item_click(sender: TObject);
var
  i: byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
    begin
      for i := 0 to DBGridEh1.Columns.Count - 1 do
      begin
        if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
        begin
          DBGridEh1.Columns[i].Visible := true;
          break;
        end ;
      end;
    end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    begin
      if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
      begin
        DBGridEh1.Columns[i].Visible := false;
        break;
      end;
    end;
  end ;
end;

procedure TfrmMain.GetItemsInfo(salaryaccountrkey: Integer; statusTag: string; Q_salary_new_str:string; sysMoths: string = '');
var
  A, B: Array of String;  //数组A保存 datafield，数组B保存 itemname
  Index, i: Integer;
  str: string;
begin
  with DM.qrytemp do
  begin
    //根据帐套类型查询出相应帐套所包含的项目代码和项目名称
    close;
    SQL.Clear;
    SQL.Text := 'select datafield, itemname from DesignSalaryItem where datasourcetype=2 and accountid= ' + inttostr(DM.salaryaccountrkey);
    Open;
    Setlength(A, RecordCount); //设置数组A的长度
    Setlength(B, RecordCount); //数组B的长度
    Setlength(DM.C, RecordCount); //数组B的长度
    DM.c_len := RecordCount;
    Index := 0;
    First;
    While Not Eof Do
    begin
      A[Index] := FieldByName('datafield').asString;
      B[Index] := FieldByName('itemname').asString;
      DM.C[Index] := FieldByName('datafield').asString;
      Inc(Index);
      Next;
    end;
    //循环累加将字段datafield转化为字段itemname, （方便Employeebasicsalary表查datafield显示itemname）
    StrsTemp := '';
    for i := 0 to RecordCount - 1 do
    begin
      StrsTemp := StrsTemp + A[i] + ' as ' + B[i] + ',' ;
    end;
    StrsTemp := copy(StrsTemp, 1, length(StrsTemp) - 1);
  end;
  if PageControl1.ActivePageIndex = 0 then
  begin
    if not DM.qry1.Active then
    begin
     with DM.qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select employeemsg.rkey, employeemsg.status, Employeebasicsalary.freshflag,  '
          + 'employeecode as 员工工号,chinesename as 员工姓名,departmentname as 部门名称,'
          + ' employeemsg.ondutytime as 入职时间,outdutytime as 离职时间,datadetail.item as 职务, '
          + ' (select max(effect_date) from basicsalary_alteration where itemname like '+#39+'%工资%'+#39
          + ' and basicsalary_alteration.employeeid=employeemsg.rkey and effect_flag=1 and effect_date>employeemsg.ondutytime ) as 上次调薪,'
          + ' v_employee_workage_detail.workagestr as 工龄, '
          + ' isnull(v_employee_salarychangetimes.salarychangetimes,0) as 调薪次数,'
          + ' '
          //前12列不能改
          + StrsTemp
          + ',case '
          + 'when employeemsg.status = 1 then ''是'' '
          + 'when employeemsg.status = 2 then ''否'' '
          + 'end ''是否在职'''
          + ' from Employeebasicsalary  join employeemsg on Employeebasicsalary.employeeid=employeemsg.rkey '
          + ' left join DesignSalaryItem on employeemsg.wagetype=DesignSalaryItem.rkey '
          + ' left join datadepartment on  employeemsg.departmentid = datadepartment.rkey '
          + ' left join datadetail on  employeemsg.position = datadetail.rkey '
          + ' left join v_employee_salarychangetimes on employeemsg.rkey=v_employee_salarychangetimes.employeeid '
          + ' left join v_employee_workage_detail  on v_employee_workage_detail.rkey=employeemsg.rkey '
          + ' where employeemsg.wagetype=' + IntToStr(salaryaccountrkey)
          + ' and status in ' + statusTag
          + ' and datadepartment.rkey in (select departmentid from hr_permission '
          + ' where operator_ptr= ' + rkey73
          + ' and program_ptr=(select rkey from data0419 where programe =''EmpSalary.exe'')) '
          + Q_salary_new_str
          + ' order by freshflag, datadepartment.departmentname,employeemsg.employeecode ';//
        //循环给DBGridEh1的标题和FieldName的值
       str:=SQL.Text;
        Open;
        DBGridEh1.Columns.Clear;
        for i := 0 to FieldCount - 1 do
        begin
          DBGridEh1.Columns[i].Title.Caption := Fields[i].FieldName;
          DBGridEh1.Columns[i].FieldName := Fields[i].FieldName;
          if i in [7,10] then  DBGridEh1.columns[i].width := 70  //离职日期，上次调薪日期
          else DBGridEh1.columns[i].width := 3*length(DBGridEh1.Columns[i].Title.Caption)+45;
        end;
        //隐藏没有值的列
        for i := FieldCount to DBGridEh1.Columns.Count - 1 do
          DBGridEh1.Columns[i].Visible := False;
      end;
      DBGridEh1.Columns[0].Visible := False;  //隐藏status值
      DBGridEh1.Columns[1].Visible := False;  //隐藏rkey值
     // DBGridEh1.Columns[2].Visible := False;  //隐藏freshflag值
      DBGridEh1.SelectedRows.CurrentRowSelected := False;
      DBGridEh1.FrozenCols :=4;
      field_name := DBGridEh1.Columns[2].FieldName;
      PreColumn := DBGridEh1.Columns[2];
      DBGridEh1.Columns[2].Title.Color := clred ;
      label1.Caption := DBGridEh1.Columns[3].Title.Caption;

    end;
  end;
  if PageControl1.ActivePageIndex = 1 then
  begin
    if not DM.qry2.Active then
    begin
      with DM.qry2 do
      begin
        //获取当前年月
        with DM.qrytemp do
        begin
          if (BitBtn6.Tag = 0) then
          begin
            sysMoth := '';
            Close;
            SQL.Clear;
            SQl.Text := 'select convert(varchar(100), getdate(), 23) as sysMonth ';
            Open;
            sysMoth := Copy(FieldValues['sysMonth'], 0, Length(FieldValues['sysMonth']) - 3);
          end;
        end;

        Screen.Cursor := crHourGlass;
        Close;
        SQL.Clear;
        SQL.Text := 'select accountid, employeecode ''员工工号'', chinesename ''员工姓名'', '
          + 'departmentname ''部门名称'', position_item ''职务'', yearmonth ''月份'', '
          + StrsTemp + ' from V_employeebasicsalary '
          + 'where yearmonth = ' + QuotedStr(sysMoth) + ' and accountid = ' + IntToStr(salaryaccountrkey)
          + ' and status in ' + statusTag;
        Open;
        Screen.Cursor := crDefault;

        //循环给DBGridEh1的标题和FieldName的值
        DBGridEh2.Columns.Clear;
        for i := 0 to FieldCount - 1 do
        begin
          DBGridEh2.Columns[i].Title.Caption := Fields[i].FieldName;
          DBGridEh2.Columns[i].FieldName := Fields[i].FieldName;
          if i <= 2 then DBGridEh2.columns[i].width := 75
          else DBGridEh2.columns[i].width := 95;
        end;
        DBGridEh2.Columns[0].Visible := False;
        //隐藏没有值的列
        for i := FieldCount  to DBGridEh2.Columns.Count - 1 do
          DBGridEh2.Columns[i].Visible := False;
        DBGridEh2.SelectedRows.CurrentRowSelected := False;
        field_name := DBGridEh2.Columns[1].FieldName;
        PreColumn := DBGridEh2.Columns[1];
        DBGridEh2.Columns[1].Title.Color := clred ;
        label1.Caption := DBGridEh2.Columns[1].Title.Caption;
      end;
    end;
  end;
end;

procedure Tfrmmain.GetSalaryInfo(sender: TObject);
begin
  with DM.qrytemp do
  begin
    //初始化帐套类型，获取第一个帐套类型（默认）的rkey
    DM.salaryaccountrkey := -1;
    close;
    SQL.Clear;
    SQL.Text := 'select * from salaryaccount where accountname= ' + QuotedStr(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]);
    Open;
    DM.salaryaccountrkey := FieldValues['rkey'];
  end;
  if PageControl1.ActivePageIndex = 0 then
  begin
    if CheckBox1.Checked then GetItemsInfo(DM.salaryaccountrkey, '(1,2)',Q_salary_new_str)
    else GetItemsInfo(DM.salaryaccountrkey, '(1)',Q_salary_new_str);
  end;

  if PageControl1.ActivePageIndex = 1 then
  begin
    if CheckBox1.Checked then GetItemsInfo(DM.salaryaccountrkey, '(1,2)',Q_salary_new_str, sysMoth)
    else GetItemsInfo(DM.salaryaccountrkey, '(1)', sysMoth);
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  i: Integer;
  item: TMenuItem;
begin
  //
  rkey73:='3023';
  vprev:='2';

  if not App_init_2(DM.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;





  Caption := application.Title;
  PageControl1.ActivePageIndex := 0;
  //获取帐套类型对应的薪资固定项目
  Q_salary_new_str :='';
  with DM.qrytemp do
  begin
    //初始化帐套类型，获取第一个帐套类型（默认）的rkey
    close;
    SQL.Clear;
    SQL.Text := 'select *, getdate() as nowdate from salaryaccount';
    Open;
    Edit1.Text := Copy(fieldByName('nowdate').AsString, 1, 4);
    if not IsEmpty then
    begin
      RadioGroup1.Columns := RecordCount;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        if i = 0 then DM.salaryaccountrkey := FieldByName('rkey').Value;
        RadioGroup1.Items.Add(FieldValues['accountname']);
        Next;
      end;
      RadioGroup1.ItemIndex := 0;
    end;
  end;

  if DM.ADOConnection1.Connected then
  begin
    for i := 3 to DBGridEh1.Columns.Count do
    begin
        item := TmenuItem.Create(self) ;
        item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;
        if DBGridEh1.Columns[i-1].Visible then
            item.Checked := true ;
        item.OnClick := item_click ;
        PopupMenu1.Items.Add(item) ;
    end;
  end;
  
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text := 'select substring(convert (nvarchar(20),getdate(),120),1,7) as nowdate ' ;
  dm.ADOTMP.Open;
  DM.nowyearmonth :=   DM.ADOTMP.FieldByName('nowdate').AsString;
  DM.ADOTMP.Close;
  DM.ADOTMP.SQL.Clear;

end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  i,j, Index,idIndex: Integer;
  Account,A, B: Array of string;
  Strs: String;
begin
  try
    //查询员工帐套（在员工薪资表中不存在的，但员工信息表中存在的帐套类型）
    with DM.qrytemp do
    begin
      close;
      SQL.Clear;
      SQL.Text := 'select distinct wagetype from employeemsg where rkey not in (select employeeid from dbo.Employeebasicsalary ) '
        + 'and wagetype in(select accountid from dbo.DesignSalaryItem) ';
      Open;
      if fieldByName('wagetype').isNull then Exit;
      Setlength(Account, DM.qrytemp.RecordCount);
      idIndex:=0;
      First;
      while not Eof do
      begin
        Account[idIndex]:= fieldByName('wagetype').AsString;
        Inc(idIndex);
        Next;
      end;
      
      DM.ADOConnection1.BeginTrans;
      //向Employeebasicsalary表中插入有帐套员工，但未在薪资固定项中存在的员工rkey
      close;
      SQL.Clear;
      SQL.Text := 'insert into Employeebasicsalary(employeeid) '
        + 'select rkey from employeemsg  '
        + 'where  status<> 0  and  rkey not in (select employeeid from dbo.Employeebasicsalary ) '
        + 'and wagetype in(select accountid from dbo.DesignSalaryItem) ';
      ExecSQL;

      //从DesignSalaryItem中的固定项值更新到Employeebasicsalary表中固定项的值
      for j:=0 to High(Account) do
      begin
        close;
        SQL.Clear;
        SQL.Text := 'select datafield, fixedmoney from DesignSalaryItem where datasourcetype=2 and accountid='+ Account[j];
        Open;
        Setlength(A, DM.qrytemp.RecordCount); //设置数组A的长度
        Setlength(B, DM.qrytemp.RecordCount); //数组B的长度
        Index := 0;
        Strs:='';
        First;
        While Not Eof Do
        begin
          A[Index] := FieldByName('datafield').asString;
          B[Index] := FieldByName('fixedmoney').asString;
          Inc(Index);
          Next;
        end;
        for i := 0 to RecordCount - 1 do
        begin
          Strs := Strs + A[i] + ' = ' + B[i] + ',' ;
        end;

        //更新新进人员的薪资固定项目的初始金额
        Strs := Copy(Strs, 0, Length(Strs) - 1 );
        Close;
        SQL.Clear;
  //      SQL.Text := 'update Employeebasicsalary set ' + Strs + ' where freshflag=0';
        SQL.Text:= 'update Employeebasicsalary set '+ Strs +#13+
                   'from Employeebasicsalary inner join employeemsg on employeebasicsalary.employeeid=employeemsg.rkey '+ #13+
                   'where Employeebasicsalary.freshflag=0 and employeemsg.wagetype= '+Account[j];
//        ShowMessage(SQL.Text);
        ExecSQL;
      end;

    end;
    DM.ADOConnection1.CommitTrans;
    DM.qry1.Close;
    GetSalaryInfo(Sender);
    //GetItemsInfo(DM.salaryaccountrkey, '(1)');
    DM.qry1.Open;
  except
    on e: Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('网络链接异常，请稍后重试！');
    end;
  end;
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry1.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TFrmMain.edt_1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    DBGridEh1.DataSource.DataSet.Filtered := True;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    begin
      if trim(edt_1.text) <> '' then
        begin
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
            end
          else
            if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
            end;
        end
      else
        DBGridEh1.DataSource.DataSet.Filter:='';
    end;
  end;
  if PageControl1.ActivePageIndex = 1 then
  begin
    DBGridEh2.DataSource.DataSet.Filtered := True;
    if DBGridEh2.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if DBGridEh2.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    begin
      if trim(edt_1.text) <> '' then
        begin
          if DBGridEh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            begin
              DBGridEh2.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
            end
          else
            if DBGridEh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            begin
              DBGridEh2.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
            end;
        end
      else
        DBGridEh2.DataSource.DataSet.Filter:='';
    end;
  end;
end;

procedure TFrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  If DM.qry1.FieldByName('status').AsInteger = 2 then
  Begin
      DBGridEh1.Canvas.Font.Color := clRed;
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed, gdFocused, gdSelected]);
  End;
  if DM.qry1.FieldByName('freshflag').AsInteger = 0 then
  begin
      DBGridEh1.Canvas.Brush.Color := clMoneyGreen;
      DBGridEh1.Canvas.Font.Color := clRed;
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed, gdFocused, gdSelected]);
  end;
end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
  DM.qry1.Active := False;
  DM.qry2.Active := False;
  GetSalaryInfo(Sender);
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin

  if PageControl1.ActivePageIndex = 0 then
    Export_dbGridEH_to_Excel(DBGridEh1, '员工薪资明细');
  if PageControl1.ActivePageIndex = 1 then
    Export_dbGridEH_to_Excel(DBGridEh2, '员工过往薪资明细');
end;

procedure TFrmMain.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmMain.CheckBox1Click(Sender: TObject);
begin
  DM.qry1.Active := False;
  DM.qry2.Active := False;
  GetSalaryInfo(Sender);
end;

procedure TFrmMain.PageControl1Change(Sender: TObject);
begin
  GetSalaryInfo(Sender);
end;

procedure TFrmMain.DBGridEH2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  AddMonth: Integer;
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
end;

procedure TFrmMain.DBGridEH2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := cl3DLight;
end;

procedure TFrmMain.DBGridEH2TitleClick(Column: TColumnEh);
begin
  if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry2.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry2.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

//显示当前薪资档案的SQL语句
procedure TFrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qry1.SQL.Text);
end;

//显示过往薪资档案的SQL语句
procedure TFrmMain.DBGridEH2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qry2.SQL.Text);
end;

//用timer控件时刻记录当前显示薪资记录的笔数
procedure TFrmMain.Timer1Timer(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    if DM.qry1.Active then
      lblCount.Caption := '当前显示记录： ' + IntToStr(DM.qry1.RecordCount) + ' 笔';
  end;

  if PageControl1.ActivePageIndex = 1 then
  begin
    if DM.qry2.Active then
    lblCount.Caption := '当前显示记录： ' + IntToStr(DM.qry2.RecordCount) + ' 笔';
    Label4.Caption := '当前显示记录为：' + copy(sysMoth, 1, 4) + '年'
      + Copy(sysMoth, 6, 2) + '月份' + ' 员工的薪资档案';
  end; 
end;

//查询该员工过往薪资中存在的帐套类型
procedure TFrmMain.N1Click(Sender: TObject);
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select distinct accountid from V_employeebasicsalary ' + ' where employeecode = ' + QuotedStr(DM.qry1.FieldValues['员工工号']);
    Open;
    if IsEmpty then
    begin
      ShowMessage('对不起，查无记录！');
      Exit;
    end;
  end;

  SalaryFrm := TSalaryFrm.Create(Application);
  SalaryFrm.ShowModal;
  SalaryFrm.Free;
end;

//上一月
procedure TFrmMain.BitBtn4Click(Sender: TObject);
var
  AddMonth: Integer;
  AddMonthStr: string;
begin
  BitBtn6.Tag := 1;
  DM.qry2.Active := False;
  AddMonth := StrToInt(Copy(sysMoth, 6, 2)) - 1;
  if AddMonth <> 0 then
  begin
    if (AddMonth < 10) then AddMonthStr :=  '0' + IntToStr(AddMonth)
    else AddMonthStr := IntToStr(AddMonth);
    sysMoth := Copy(sysMoth, 1, 5)+ AddMonthStr;
  end;
  if AddMonth = 0 then
  begin
    sysMoth := IntToStr(strtoint(Copy(sysMoth, 1, 4)) - 1) + '-12';
  end;
  GetSalaryInfo(Sender);
end;

//本月
procedure TFrmMain.BitBtn6Click(Sender: TObject);
begin
  BitBtn6.Tag := 0;
  DM.qry2.Active := False;
  GetSalaryInfo(Sender);
end;

//下一月
procedure TFrmMain.BitBtn7Click(Sender: TObject);
var
  AddMonth: Integer;
  AddMonthStr: string;
begin
  BitBtn6.Tag := 1;
  DM.qry2.Active := False;
  AddMonth := StrToInt(Copy(sysMoth, 6, 2)) + 1;
  if AddMonth <> 13 then
  begin
    if (AddMonth < 10) then AddMonthStr :=  '0' + IntToStr(AddMonth)
    else AddMonthStr := IntToStr(AddMonth);
    sysMoth := Copy(sysMoth, 1, 5)+ AddMonthStr;
  end;
  if AddMonth = 13 then
  begin
    sysMoth := IntToStr(strtoint(Copy(sysMoth, 1, 4)) + 1) + '-01';
  end;
  GetSalaryInfo(Sender);
end;

//跳转时间搜索
procedure TFrmMain.SpeedButton4Click(Sender: TObject);
var
  AddMonth: Integer;
  AddMonthStr: string;
begin
  if Length(Edit1.Text) <> 4 then
  begin
    ShowMessage('您输入的年份不对，请重新输入！');
    Edit1.SetFocus;
    Exit;
  end;
  BitBtn6.Tag := 1;
  DM.qry2.Active := False;
  AddMonth := StrToInt(ComboBox1.text);
  if (AddMonth < 10) then AddMonthStr :=  '0' + IntToStr(AddMonth)
  else AddMonthStr := IntToStr(AddMonth);
  sysMoth := Edit1.Text + '-' + AddMonthStr;
  GetSalaryInfo(Sender);
end;

//文本框输入限制
procedure TFrmMain.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8,'0'..'9']) then Key := #0;
end;

//如果是新进人员，则薪资项目可以直接进行编辑；  否则不许编辑。
procedure TFrmMain.DBGridEh1CellClick(Column: TColumnEh);
begin
  DBGridEh1.ReadOnly := False;
  if DM.qry1.FieldByName('freshflag').AsInteger = 0 then
    begin
      if (DBGridEh1.Col > 12) and (DBGridEh1.Col < DBGridEh1.Columns.Count) then
        DBGridEh1.ReadOnly := False
      else DBGridEh1.ReadOnly := True;
    end
  else
    DBGridEh1.ReadOnly := True;
end;

//右键菜单显隐藏设置
procedure TFrmMain.PopupMenu2Popup(Sender: TObject);
begin

  if DM.qry1.FieldByName('freshflag').Value = 1 then
  begin
    N1.Enabled := True;
    N3.Enabled := False;
    N6.Enabled := true;
  end;
  if DM.qry1.FieldByName('freshflag').Value = 0 then
  begin
    N1.Enabled := False;
    N3.Enabled := True;
    N6.Enabled := false;
  end;

  if  (FormatDateTime('yyyy-MM',dm.qry1.FieldByName('入职时间').AsDateTime))<> DM.nowyearmonth then
  begin
    N6.Enabled := false;
  end;


end;

//自动按五洲特色分配职务和岗位工资（职务工资标准 = 岗位工资标准 = (综合工资标准 - 基本工资标准)/2）
procedure TFrmMain.N3Click(Sender: TObject);
var
  i, accountid: Integer;
  StrTemp: array of string;
begin
  if  not strtoint(vprev) in [2, 4] then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  with DM.qrytemp do
  begin
    close;
    SQL.Clear;
    SQL.Text := 'select * from salaryaccount where accountname= ' + QuotedStr(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]);
    Open;
    accountid := FieldValues['rkey'];

    Close;
    SQL.Clear;
    SQL.Text := 'select datafield, itemname from dbo.DesignSalaryItem '
      + ' where datafield in (''F2'', ''F3'', ''F4'', ''F5'') and accountid = ' + IntToStr(accountid)
      + ' order by datafield';
    Open;
  end;
  SetLength(StrTemp, 4);
  DM.qrytemp.First;
  for i := 0 to DM.qrytemp.RecordCount - 1 do
  begin
    StrTemp[i] := DM.qrytemp.FieldValues['itemname'];
    DM.qrytemp.Next;
  end;

  if TMenuItem(Sender).Tag = 0 then
  begin
    if DM.qry1.FieldByName('freshflag').Value = 0 then
    begin
      DM.qry1.Edit;
      if  (DM.qry1.FieldValues[StrTemp[0]] - DM.qry1.FieldValues[StrTemp[1]]) < 0 then  DM.qry1.FieldByName(StrTemp[2]).Value:=0
      else DM.qry1.FieldByName(StrTemp[2]).Value := (DM.qry1.FieldValues[StrTemp[0]] - DM.qry1.FieldValues[StrTemp[1]]) / 2;
      DM.qry1.FieldByName(StrTemp[3]).Value := DM.qry1.FieldByName(StrTemp[2]).Value;
    end;
  end;
end;

//保存新进人员薪资档案
procedure TFrmMain.N5Click(Sender: TObject);
begin
  if  not strtoint(vprev) in [2, 4] then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if MessageBox(Handle,'保存后不可以直接再修改，以后只能做薪资调整，您确定保存吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  DM.qry1.Edit;
  DM.qry1.FieldByName('freshflag').Value := 1;
  DM.qry1.UpdateBatch(arAll);
end;

procedure TFrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin
  FrmExcel := TFrmExcel.Create(nil);
  if FrmExcel.ShowModal = mrok then
  begin
    
  end;
  FrmExcel.Free;
  DM.qry1.Close;
  GetSalaryInfo(Sender);
  //GetItemsInfo(DM.salaryaccountrkey, '(1)');
  DM.qry1.Open;
  //BitBtn2Click(sender);
end;

procedure TFrmMain.BitBtn8Click(Sender: TObject);
var
 i:byte;
begin
with Query_Form do
 begin
      with dm.ADOTMP do
      begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        dtpk2.Date:=StrToDateTime(fieldvalues['sys_date']);
        dtpk1.Date:=dtpk2.Date-31;
      end;

 if ShowModal=mrok then
    begin
      //ShowMessage('1');
      Q_salary_new_str:='and 1=1 ';
     for i:=1 to SGrid1.RowCount-2 do
      Q_salary_new_str:= Q_salary_new_str+SGrid1.Cells[2,i]+#13;
     try
       //ShowMessage('2');
        DM.qry1.Close;
        GetSalaryInfo(Sender);
        //GetItemsInfo(DM.salaryaccountrkey, '(1)');
        DM.qry1.Open;
       //FrmMain.GetSalaryInfo(Sender);
     except
      showmessage('查询失败');
      end;
    end;
  end;
end;

procedure TFrmMain.N6Click(Sender: TObject);
begin
  if  not strtoint(vprev) in [4] then
  begin
    messagedlg('对不起! 您的权限（写银）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  //if MessageBox(Handle,'保存后不可以直接再修改，以后只能做薪资调整，您确定保存吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  DM.ADOTMP.SQL.Clear;
  DM.ADOTMP.SQL.Text := 'select * from basicsalary_alteration where employeeid='+inttostr(DM.qry1.FieldByName('rkey').Value);
  try
    dm.ADOTMP.Open;
    if  dm.ADOTMP.Eof  then
    begin
      DM.qry1.Edit;
      DM.qry1.FieldByName('freshflag').Value := 0;
      DM.qry1.UpdateBatch(arAll);
    end
  else
    begin
      ShowMessage('已经有调薪记录，无法解锁!');
      DM.adotmp.Close;
    end;
  except
    begin
      ShowMessage('判断是否有调薪记录的时候失败');
      exit;
    end;
  end;    
end;

procedure TFrmMain.BitBtn9Click(Sender: TObject);
begin
      try
          frm_hideitem :=Tfrm_hideitem.Create(nil);
        if frm_hideitem.ShowModal=mrok then
          begin
          end;
      finally
          frm_hideitem.Free;
      end;
end;

procedure TFrmMain.Action1Execute(Sender: TObject);
begin
  bitbtn9.Visible := true;
end;

end.



