unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, damo, Menus, AddFrm,
  common, DB, DateUtils, QueFrm, ComCtrls, choiseFrm, EditFrm, ComObj,
  ADODB, ExcelFrm;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    edt_1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BitBtn4: TBitBtn;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Label3: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label4: TLabel;
    lbl_to: TLabel;
    btn_Audit: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lblto: TLabel;
    Label7: TLabel;
    DBGridEh1: TDBGridEh;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_AuditClick(Sender: TObject);

  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name: string;
  public
    { Public declarations }
    StartSql: string;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  If DM.qrySalaryJL.FieldByName('effect_flag').AsString = '否' then
  Begin
      DBGridEh1.Canvas.Font.Color := clRed;
  End;
  If DM.qrySalaryJL.FieldByName('statusName').AsString = '否' then
  Begin
      DBGridEh1.Canvas.Brush.Color := clmoneyGreen;
  End;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed, gdFocused, gdSelected]);
end;

//新增调薪记录
procedure TFrmMain.N1Click(Sender: TObject);
begin
  {DM.UpdateTag := 0;
  FrmAdd := TFrmAdd.Create(Application);
  FrmAdd.ShowModal;
  FrmAdd.Free; }
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin

//  user_ptr := '3';
//  vprev := '4';

 if not app_init(DM.ADOConnection1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
    exit;
  end;





  Caption := application.Title;
  StartSql := DM.qrySalaryJL.SQL.Text;




 { //初始化的时候，将电脑所安装的输入法列举加入Combobox1中。
  for i := 0 to screen.Imes.Count-1  do
    combobox1.Items.Add(screen.Imes.Strings[i]);
  combobox1.ItemIndex := 0;}

end;

//删除调薪记录
procedure TFrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  i := DBGridEh1.Row;
  if MessageDlg('确定要删除当前选中记录吗？', mtInformation, [mbYes, mbNo], 1) = mryes then
  begin
    for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
    begin
      DM.qrySalaryJL.GotoBookmark(Pointer(DBGridEh1.SelectedRows.items[i]));
      with DM.qrytemp do
      begin
        if not DM.qrySalaryJL.FieldByName('Trainrkey').IsNull then
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'update Employee_Train set ptr_flag=0 where rkey=' + IntToStr(DM.qrySalaryJL.FieldValues['Trainrkey']);
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Text := 'delete from basicsalary_Alteration where rkey=' + IntToStr(DM.qrySalaryJL.FieldValues['rkey'])
          + ' and effect_flag=0';
        ExecSQL;

      end;
    end;
    DM.qrySalaryJL.Close;
    DM.qrySalaryJL.Open;
    DM.qrySalaryJL.MoveBy(i - 1);
  end;
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

//修改调薪记录
procedure TFrmMain.N3Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if Trim(dm.qrySalaryJL.FieldByName('datafield').AsString) = 'F2' then
  begin
    ShowMessage('F2项目无法修改，只可删除后重新增加！');
    Exit;
  end;
  DM.UpdateTag := 1;
  FrmAdd := TFrmAdd.Create(Application);
  FrmAdd.ShowModal;
  FrmAdd.Free;
  BitBtn2.Click;
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
  if DM.qrySalaryJL.IsEmpty then
    begin
       N2.Enabled := False;
       N3.Enabled := False;
       N4.Enabled := False;
       N5.Enabled := False;
       N7.Enabled := False;
    end
  else
    begin
      if DM.qrySalaryJL.FieldValues['effect_flag'] = '是' then
      begin
        N2.Enabled := False;
        N4.Enabled := False;
        N3.Enabled := False;
        N7.Enabled := True;
      end
      else
      begin
        N2.Enabled := true;
        N4.Enabled := true;
        N3.Enabled := true;
        N7.Enabled := False;
      end;
    end;
  if Trim(DM.qrySalaryJL.FieldByName('datafield').AsString) = 'F2' then N5.Enabled := True
  else N5.Enabled := False;

end;

procedure TFrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qrySalaryJL.SQL.Text);
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qrySalaryJL.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qrySalaryJL.Sort:=Column.FieldName+' DESC';
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
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

procedure TFrmMain.edt_1Change(Sender: TObject);
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
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

//定位刷新
procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  i: Integer;
begin
  i := DM.qrySalaryJLrkey.Value;
  DM.qrySalaryJL.Close;
  DM.qrySalaryJL.Open;
  DM.qrySalaryJL.Locate('rkey', i, []);
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

//退出
procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

//生效
procedure TFrmMain.N4Click(Sender: TObject);
var
  i: Integer;
  RkeyStr: string;
begin
  if (strtoint(vprev) <> 4 ) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;

  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select count(*) as counts from dbo.basicsalary_Alteration where employeeid = '
      + inttostr(DM.qrySalaryJL.FieldValues['Emp_Rkey'])
      + ' and effect_date = ' + QuotedStr(DM.qrySalaryJL.FieldValues['effect_date'])
      + ' and datafield = ' + QuotedStr(DM.qrySalaryJL.FieldValues['datafield'])
      + ' and effect_flag=1';
    Open;
    if FieldByName('counts').AsInteger >= 1 then
    begin
      ShowMessage('员工：' + DM.qrySalaryJL.FieldValues['chinesename']
        + ', 薪资项目：' + DM.qrySalaryJL.FieldValues['itemname']
        + #13 +  #13
        + IntToStr(YearOf(DM.qrySalaryJL.FieldValues['effect_date'])) + '年' + IntToStr(MonthOf(DM.qrySalaryJL.FieldValues['effect_date']))
        + '月份已有调薪记录，请勿重复添加！');
      Exit;
    end;
    if not DM.qrySalaryJLTrainRkey.IsNull then
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select Train_status from Employee_Train where rkey = ' + IntToStr(DM.qrySalaryJL.FieldValues['TrainRkey']);
      Open;
      if FieldByName('Train_status').AsInteger = 0 then
      begin
        ShowMessage('该员工的培训编号状态为【未完成】, 无法生效, 请检查！');
        Exit;
      end;
    end;
  end;
  if MessageDlg('您确定要将当前记录生效吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
    begin
      DM.qrySalaryJL.GotoBookmark(Pointer(DBGridEh1.SelectedRows.items[i]));
      try
        if DM.qrySalaryJL.FieldValues['effect_flag'] = '否' then   //如果是未生效记录
        begin
          DM.ADOConnection1.BeginTrans;
          with DM.qrytemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'update Employeebasicsalary set '+ DM.qrySalaryJL.FieldValues['datafield'] + ' = ' + FloatToStr(DM.qrySalaryJL.FieldValues['newdata'])
              + ' where employeeid in ('+inttostr(DM.qrySalaryJL.FieldValues['Emp_rkey'])+')' ;
            ExecSQL;
          end;
          DM.ADOConnection1.CommitTrans;
          DM.ADOConnection1.BeginTrans;
          with DM.qrytemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'update basicsalary_Alteration set effect_flag = 1, effect_date = convert(varchar(100),effect_date,23) '
              + 'where rkey in ('+inttostr(DM.qrySalaryJL.FieldValues['rkey'])+')' ;
            ExecSQL;
          end;
          DM.ADOConnection1.CommitTrans;
        end;


       except
        on e: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('网络异常...... (' + e.Message + ')');
        end;
       end;
    end;
  end;





  BitBtn2.Click;
end;

procedure TFrmMain.BitBtn4Click(Sender: TObject);
var
 i: byte;
begin
  with FrmQue do
  begin
    if ShowModal = mrok then
    begin
      with DM.qrySalaryJL do
      begin
        close;
        SQL.Text := self.StartSql + #13;
        for i := 1 to SGrid1.RowCount - 2 do SQL.Text := SQL.Text + SGrid1.Cells[2,i] + #13;
        SQL.Text := SQL.Text + ' and effect_date >= '
          + QuotedStr(IntToStr(yearof(DateTimePicker1.Date)) + '-' + IntToStr(monthof(DateTimePicker1.Date)) + '-01')
          + ' and effect_date <= ' + QuotedStr(IntToStr(yearof(DateTimePicker2.Date)) + '-' + IntToStr(monthof(DateTimePicker2.Date)) + '-01')
          + ' order by basicsalary_Alteration.operate_date desc';
          //ShowMessage(SQL.Text);
        open;
      end;
    end;
  end;
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin

  with DM.qrytemp do
  begin
    close;
    SQL.Text:= 'select rkey from data0073 where EMPLOYEE_PTR = ' + user_ptr;
    Open;
    rkey73:= FieldByName('rkey').AsString;
  end;
  DM.qrySalaryJL.Close;
  DM.qrySalaryJL.SQL.Text := self.StartSql +' and basicsalary_Alteration.effect_date >= '
    + QuotedStr(DateToStr(FrmQue.DateTimePicker1.date))
    + ' and basicsalary_Alteration.effect_date <= '
    + QuotedStr(DateToStr(FrmQue.DateTimePicker2.date))
    + ' order by basicsalary_Alteration.operate_date desc';
    DM.qrySalaryJL.Parameters[0].Value := StrToInt(rkey73);
  DM.qrySalaryJL.Open;
  DBGridEh1.SelectedRows.CurrentRowSelected := False;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
  PageControl1.ActivePageIndex := 0;
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  DBGridEh1.DataSource.DataSet.Filter := '';
  if RadioGroup1.ItemIndex = 1 then
  begin
    if DBGridEh1.DataSource.DataSet.Filter = '' then DBGridEh1.DataSource.DataSet.Filter := ' effect_flag = ''是'''
    else DBGridEh1.DataSource.DataSet.Filter := ' and effect_flag = ''是'' ';
  end;
  if RadioGroup1.ItemIndex = 2 then
  begin
    if DBGridEh1.DataSource.DataSet.Filter = '' then DBGridEh1.DataSource.DataSet.Filter := ' effect_flag = ''否'''
    else DBGridEh1.DataSource.DataSet.Filter := ' and effect_flag = ''否'' ';
  end;
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1, '调薪记录');
end;

procedure TFrmMain.N5Click(Sender: TObject);
var
  OldMoney, NewMoney, BMoney: Double;
  i, j: Integer;
  strTemp: array of string;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  SetLength(strTemp, 2);
  for j := 0 to DBGridEh1.SelectedRows.Count - 1 do
  begin
    DM.qrySalaryJL.GotoBookmark(Pointer(DBGridEh1.SelectedRows.items[j]));
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select datafield, itemname from DesignSalaryItem where datafield in (''F4'', ''F5'') '
        + ' and accountid=' + IntToStr(DM.qrySalaryJL.FieldValues['accountid'])
        + ' order by datafield';
      Open;
      First;
      for i := 0 to recordCount - 1 do
      begin
        strTemp[i] := FieldValues['itemname'];
        Next;
      end;
    end;

    OldMoney := DM.qrySalaryJL.FieldValues['originaldata'];   //F2的原金额   2030

    NewMoney := DM.qrySalaryJL.FieldValues['newdata'];        //F2的新金额   0
                                                               //F3 2030

    with DM.qrytemp do   //获取F3基本工资标准
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from Employeebasicsalary where employeeid= ' + DM.qrySalaryJL.fieldByName('employeeid').AsString;
      Open;
      BMoney := FieldByName('F3').AsInteger;
    end;
    OldMoney := (OldMoney - BMoney)/2;      //F4的原职务工资标准
    if oldmoney<0 then oldmoney := 0;

    NewMoney := (NewMoney - BMoney)/2;      //F4的新职务工资标准
    
    if NewMoney<0 then NewMoney := 0;

    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Format('insert into basicsalary_Alteration(employeeid, itemname, datafield, originaldata, '
        + 'newdata, operator, effect_date, accountid) '
        + 'values(%d, ''%s'', ''%s'', %f, %f, %d, ''%s'', %d)',
        [DM.qrySalaryJL.fieldByName('employeeid').AsInteger, strTemp[0], 'F4', OldMoney,
        NewMoney, StrToInt(user_ptr),
        DateToStr(DM.qrySalaryJL.FieldValues['effect_date']),
        DM.qrySalaryJL.FieldByName('accountid').AsInteger]);
      ExecSQL;
    end;
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Format('insert into basicsalary_Alteration(employeeid, itemname, datafield, originaldata, '
        + 'newdata, operator, effect_date, accountid) '
        + 'values(%d, ''%s'', ''%s'', %f, %f, %d, ''%s'', %d)',
        [DM.qrySalaryJL.fieldByName('employeeid').AsInteger, strTemp[1], 'F5', OldMoney,
        NewMoney, StrToInt(user_ptr),
        DateToStr(DM.qrySalaryJL.FieldValues['effect_date']),
        DM.qrySalaryJL.FieldByName('accountid').AsInteger]);
      ExecSQL;
    end;
  end;
  DM.qrySalaryJL.Close;
  DM.qrySalaryJL.Open;
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

//新增
procedure TFrmMain.N6Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  FrmEdit := TFrmEdit.Create(Application);
  FrmEdit.ShowModal;
  FrmEdit.Free;
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

//作废
procedure TFrmMain.N7Click(Sender: TObject);
var
  i: Integer;
  RkeyTemp, datafieldF2, datafieldF4_F5, employeeid, effect_date: string;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  try
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select max(effect_date) as MaxDate from basicsalary_Alteration where employeeid='
        + DM.qrySalaryJLemployeeid.AsString
        + ' and datafield='
        + QuotedStr(DM.qrySalaryJLdatafield.AsString);
      Open;
      if DM.qrySalaryJLeffect_date.AsDateTime < FieldByName('MaxDate').AsDateTime then
      begin
        ShowMessage('该科目已有最新生效记录，请查证！');
        Exit;
      end;
    end;

    if MessageDlg('该记录作废后，'
      + #13 + '1.该科目金额将还原为上次金额，'
      + #13 + '2.该员工培训编号将被清空，'
      + #13 + '3.该调薪记录会自动删除，'
      + #13 + '您确定要作废当前选中记录吗？', mtInformation, [mbYes, mbNo], 1) = mryes then
    begin
      i := DBGridEh1.Row;
      datafieldF2 := Trim(DM.qrySalaryJLdatafield.AsString);
      employeeid := Trim(DM.qrySalaryJLemployeeid.AsString);
      effect_date := Trim(DM.qrySalaryJLeffect_date.AsString);
      try
        DM.ADOConnection1.BeginTrans;
        with DM.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'update Employeebasicsalary set ' + DM.qrySalaryJLdatafield.Value
            + ' = ' + DM.qrySalaryJLoriginaldata.AsString
            + ' where employeeid = ' + DM.qrySalaryJLemployeeid.AsString;
          ExecSQL;

          if not DM.qrySalaryJL.FieldByName('Trainrkey').IsNull then
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'update Employee_Train set ptr_flag=0 where rkey=' + IntToStr(DM.qrySalaryJL.FieldValues['Trainrkey']);
            ExecSQL;
          end;

          Close;
          SQL.Clear;
          SQL.Text := 'delete from basicsalary_Alteration where rkey=' + IntToStr(DM.qrySalaryJL.FieldValues['rkey']);
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
        if datafieldF2 = 'F2' then
        begin
          if MessageDlg( '生效时间为 [' + effect_date + '] 的综合工资已经作废，是否自动作废对应的职务和岗位工资的调薪记录？', mtInformation, [mbYes, mbNo], 1) = mryes then
          begin
            with DM.qrytemp do
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'select * from basicsalary_Alteration where datafield in (''F4'', ''F5'') '
                + ' and employeeid= ' + employeeid
                + ' and effect_date= ' + QuotedStr(effect_date);
              Open;
              if recordcount <= 0 then
              begin
                ShowMessage('对不起，未能找到相应的职务和岗位调薪记录！');
                Exit;
              end;
              First;
              datafieldF4_F5 := FieldValues['originaldata'];
              while not Eof do
              begin
                RkeyTemp := RkeyTemp + IntToStr(FieldValues['rkey']) + ',';
                Next;
              end;
              DM.ADOConnection1.BeginTrans;
              Close;
              SQL.Clear;
              SQL.Text := 'update Employeebasicsalary set F4=' + datafieldF4_F5
                + ' , F5= ' + datafieldF4_F5
                + ' where employeeid = ' + DM.qrySalaryJLemployeeid.AsString;
              ExecSQL;
              RkeyTemp := Copy(RkeyTemp, 0, Length(RkeyTemp) - 1);
              Close;
              SQL.Clear;
              SQL.Text := 'delete from basicsalary_Alteration where rkey in( ' + RkeyTemp + ')';
              ExecSQL;
              DM.ADOConnection1.CommitTrans;
            end;
          end;
        end;
      except
        on e:Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage(e.Message);
        end;
      end;
    end;
  finally
    DM.qrySalaryJL.Close;
    DM.qrySalaryJL.Open;
    DM.qrySalaryJL.MoveBy(i - 1);
  end;
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

procedure TFrmMain.N8Click(Sender: TObject);
var
  i: Integer;
begin
  i := DM.qrySalaryJLrkey.Value;
  FrmExcel := TFrmExcel.Create(Application);
  if FrmExcel.ShowModal = mrok then
  begin
    DM.qrySalaryJL.Close;
    DM.qrySalaryJL.Open;
  end;
  FrmExcel.Free;
  DM.qrySalaryJL.Locate('rkey', i, []);
  Label3.Caption := '当前显示记录: '+IntToStr(DM.qrySalaryJL.RecordCount)+' 笔';
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
   if dm.qrySalaryJL.IsEmpty then Exit;

   dm.qrySalaryJL.First;
   while not dm.qrySalaryJL.Eof do
   begin

    if  dm.qrySalaryJL.FieldByName('effect_flag').AsString='是' then
    BEGIN
    dm.qrySalaryJL.Next;;
    Continue;
    END ;
   dm.qrySalaryJL.Edit;
   dm.qrySalaryJL.FieldByName('IsSelected').Value:=1 ;
   dm.qrySalaryJL.Post;
   dm.qrySalaryJL.Next;
   end;
   
end;

procedure TFrmMain.btn_AuditClick(Sender: TObject);
var
  flag: integer ;
    i: Integer;
  RkeyStr: string;
begin

  if (strtoint(vprev) <> 4 ) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;

 if DM.qrySalaryJL.IsEmpty then exit;
    DM.qrySalaryJL.First;
     flag:=0;
    while not DM.qrySalaryJL.Eof do
    begin
     if DM.qrySalaryJL.FieldByName('isselected').Value then
        begin
         flag:=1;
         Break;
        end;
      DM.qrySalaryJL.Next;
    end;

    if flag=0 then
    begin
     ShowMessage('亲，请先选择要生效的行。');
     exit;
    end;


    //开始生效：
   if MessageDlg('您确定要将选中记录生效吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

   DM.qrySalaryJL.First;
   try
      DM.ADOConnection1.BeginTrans;
     while not  DM.qrySalaryJL.Eof do
     begin
      if not dm.qrySalaryJL.FieldByName('isselected').Value then
      begin
       DM.qrySalaryJL.next;
       Continue;
      end;
         with DM.qrytemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'select count(*) as counts from dbo.basicsalary_Alteration where employeeid = '
              + inttostr(DM.qrySalaryJL.FieldValues['Emp_Rkey'])
              + ' and effect_date = ' + QuotedStr(DM.qrySalaryJL.FieldValues['effect_date'])
              + ' and datafield = ' + QuotedStr(DM.qrySalaryJL.FieldValues['datafield'])
              + ' and effect_flag=1';
            Open;
            if FieldByName('counts').AsInteger >= 1 then
            begin
              ShowMessage('员工：' + DM.qrySalaryJL.FieldValues['chinesename']
                + ', 薪资项目：' + DM.qrySalaryJL.FieldValues['itemname']
                + #13 +  #13
                + IntToStr(YearOf(DM.qrySalaryJL.FieldValues['effect_date'])) + '年' + IntToStr(MonthOf(DM.qrySalaryJL.FieldValues['effect_date']))
                + '月份已有调薪记录，请勿重复添加！');
              Exit;
            end;
            if not DM.qrySalaryJLTrainRkey.IsNull then
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'select Train_status from Employee_Train where rkey = ' + IntToStr(DM.qrySalaryJL.FieldValues['TrainRkey']);
              Open;
              if FieldByName('Train_status').AsInteger = 0 then
              begin
                ShowMessage('该员工'+DM.qrySalaryJL.FieldValues['chinesename']+'的培训编号状态为【未完成】, 无法生效, 请检查！');
                Exit;
              end;
            end;
          end;

    //开始更新:

      //  DM.qrySalaryJL.GotoBookmark(Pointer(DBGridEh1.SelectedRows.items[i]));

        //  if DM.qrySalaryJL.FieldValues['effect_flag'] = '否' then   //如果是未生效记录
          //begin

            with DM.qrytemp do
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'update Employeebasicsalary set '+ DM.qrySalaryJL.FieldValues['datafield'] + ' = ' + FloatToStr(DM.qrySalaryJL.FieldValues['newdata'])
                + ' where employeeid in ('+inttostr(DM.qrySalaryJL.FieldValues['Emp_rkey'])+')' ;
              ExecSQL;
            end;

            with DM.qrytemp do
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'update basicsalary_Alteration set effect_flag = 1, effect_date = convert(varchar(100),effect_date,23) '
                + 'where rkey in ('+inttostr(DM.qrySalaryJL.FieldValues['rkey'])+')' ;
              ExecSQL;
            end;
       

       DM.qrySalaryJL.Next;


      end;

       DM.ADOConnection1.CommitTrans;
   except
        on e: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('网络异常...... (' + e.Message + ')');
        end;
   end;


  BitBtn2.Click;

 end;
 end;

end.
