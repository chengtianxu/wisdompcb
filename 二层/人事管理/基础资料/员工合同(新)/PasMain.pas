unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnQuery: TBitBtn;
    btnField: TBitBtn;
    btnExport: TBitBtn;
    dbMain: TDBGridEh;
    PopupMenu1: TPopupMenu;
    Panel4: TPanel;
    dbWill: TDBGridEh;
    btnWillExport: TBitBtn;
    Label1: TLabel;
    lbWill: TLabel;
    lbFilter: TLabel;
    edtFilter: TEdit;
    PopupMenu2: TPopupMenu;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDelete: TMenuItem;
    nRedo: TMenuItem;
    N2: TMenuItem;
    nEditEnd: TMenuItem;
    nEditState: TMenuItem;
    NEditOut: TMenuItem;
    nYear: TMenuItem;
    N1: TMenuItem;
    btnManager: TBitBtn;
    Label4: TLabel;
    lbCount: TLabel;
    rgStatus: TRadioGroup;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    lbNot: TLabel;
    dbNot: TDBGridEh;
    btnNotExprot: TBitBtn;
    Panel7: TPanel;
    Label3: TLabel;
    lbOut: TLabel;
    dbOut: TDBGridEh;
    btnOut: TBitBtn;
    pnl1: TPanel;
    lbl1: TLabel;
    ehOver: TDBGridEh;
    lbOver: TLabel;
    btnOver: TBitBtn;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnWillExportClick(Sender: TObject);
    procedure btnNotExprotClick(Sender: TObject);
    procedure dbMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure nAddClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure nRedoClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure nEditStateClick(Sender: TObject);
    procedure NEditOutClick(Sender: TObject);
    procedure dbMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure nYearClick(Sender: TObject);
    procedure nEditEndClick(Sender: TObject);
    procedure btnOutClick(Sender: TObject);
    procedure btnManagerClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure btnOverClick(Sender: TObject);
  private
    { Private declarations }
//    startdate,enddate:TDateTime;
    mainSql,statusSql,querySql:string;
    preColumn:TColumnEh;
    procedure itemClick(Sender: TObject);
    procedure dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string);
    function IsOverAge(sex:Integer;day,birthday:TDateTime):Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO,common,DateUtils,DB, PasQuery, PasAddEdit, PasYear, PasManager,ComObj;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.ADOConnection1) then
  begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  frmMain.Caption:=Application.Title;
  LongDateFormat := 'yyyy-MM-dd';
  ShortDateFormat := 'yyyy-MM-dd';
  LongTimeFormat := 'hh:nn:ss';
  ShortTimeFormat := 'hh:nn:ss';
  DateSeparator := '-';
  TimeSeparator := ':';

//  user_ptr:='3057';
//  rkey73:='3022';
//  vprev:='2';
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  item:TMenuItem;
  i:Integer;
begin
  with dm.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select employee_ptr from data0073 where rkey = '+ rkey73;
    Open;
    if not IsEmpty then user_ptr:= FieldByName('employee_ptr').AsString;
  end;

//  Panel4.Width:=Round(frmMain.Width/3);
//  Panel5.Width:=Round(frmMain.Width/3);

  Panel4.Width:=Round(frmMain.Width/4);
  pnl1.Width:=Round(frmMain.Width/4);
  panel6.Width:= Round(frmMain.Width/4);
  mainSql:=DM.adoMain.CommandText;
  querySql:='';
  preColumn:=dbMain.Columns[0];
  if rgStatus.ItemIndex=0 then statusSql:=' and employee_contract.status=1';
  if rgStatus.ItemIndex=1 then statusSql:=' and employee_contract.status=2';
  if rgStatus.ItemIndex=2 then statusSql:=' and (employee_contract.status=1 or employee_contract.status=2)';

  btnRefreshClick(nil);

  for i:=0 to dbMain.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=dbMain.Columns[i].Title.Caption;
    item.Checked:=dbMain.Columns[i].Visible;
    item.OnClick:=itemClick;
    PopupMenu1.Items.Add(item);
  end;

  nAdd.Enabled:=(vprev='2') or (vprev='4');
  nEdit.Enabled:=(vprev='2') or (vprev='4');
  nDelete.Enabled:=(vprev='2') or (vprev='4');
  nRedo.Enabled:=(vprev='2') or (vprev='4');
  nEditState.Enabled:=(vprev='2') or (vprev='4');
  NEditOut.Enabled:=(vprev='2') or (vprev='4');
  nYear.Enabled:=(vprev='2') or (vprev='4');
  nEditEnd.Enabled:=(vprev='2') or (vprev='4');
  btnOut.Enabled:=(vprev='2') or (vprev='4');
end;

procedure TfrmMain.itemClick(Sender: TObject);
var
  i:Integer;
begin
  (Sender as TMenuItem).Checked:= not (Sender as TMenuItem).Checked;
  for i:=0 to dbMain.Columns.Count-1 do
  begin
    if (Sender as TMenuItem).Caption=dbMain.Columns[i].Title.Caption then
    begin
       dbMain.Columns[i].Visible:=(Sender as TMenuItem).Checked;
       Break;
    end;
  end;
end;


procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  rkey:Integer;
begin
  if DM.adoMain.Active=True then rkey:= DM.adoMainrkey.Value
  else rkey:=0;
  with DM.adoMain do
  begin
    Close;
    Parameters.ParamByName('user').Value:=rkey73;

    CommandText:=mainSql+ #13+ statusSql + #13 + querySql;
//    ShowMessage(CommandText);
    Open;
    Sort:= 'inputdate DESC';
    lbCount.Caption:=IntToStr(RecordCount);
    if rkey>0 then
    begin
      Locate('rkey',rkey,[]);
    end;
  end;

  with DM.adoWill do
  begin
    Close;
    Parameters.ParamByName('willuser').Value:=rkey73;
    Open;
    lbWill.Caption:=IntToStr(RecordCount);
  end;

  with DM.adoNot do
  begin
    Close;
    Parameters.ParamByName('notuser').Value:=rkey73;
    Open;
    lbNot.Caption:=IntToStr(RecordCount);
  end;

  with dm.adoOut do
  begin
    Close;
    Parameters.ParamByName('outuser').Value:=rkey73;
    Open;
    lbOut.Caption:= IntToStr(RecordCount);
  end;

  with dm.adoOver do
  begin
    Close;
    Parameters.ParamByName('overuser').Value:=rkey73;
    Open;
    lbOver.Caption:= IntToStr(RecordCount);
  end;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if not DM.adoMain.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       dbGridEH_to_Excel(dbMain,'员工合同');
  end;
end;

procedure TfrmMain.btnWillExportClick(Sender: TObject);
begin
  if not DM.adoWill.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       dbGridEH_to_Excel(dbWill,'半年内合同将失效的员工');
  end;
end;

procedure TfrmMain.btnNotExprotClick(Sender: TObject);
begin
  if not DM.adoNot.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       dbGridEH_to_Excel(dbNot,'在职无有效合同的员工');
  end;
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.dbMainTitleClick(Column: TColumnEh);
begin
  edtFilter.SetFocus;
  if (Column.Title.Caption <> preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    preColumn:=Column;
  end;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.adoMain.Sort:=Column.FieldName+ ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.adoMain.Sort:=Column.FieldName;
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adoMain.Filtered:=False;
    DM.adoMain.Filter:= preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text) + '%''';
    DM.adoMain.Filtered:=True;
    lbCount.Caption:=IntToStr(DM.adoMain.RecordCount);
  end
  else
  begin
    DM.adoMain.Filter:='';
    lbCount.Caption:=IntToStr(DM.adoMain.RecordCount);
  end;
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-1 do
    begin
      querySql:= frmQuery.sgCondition.Cells[2,i] +#13+ querySql;
    end;
    with DM.adoMain do
    begin
      Close;
      Parameters.ParamByName('user').Value:=rkey73;
//      Parameters.ParamByName('startdate').Value:=startdate;
//      Parameters.ParamByName('enddate').Value:=enddate;
      CommandText:=mainSql+#13+ statusSql + #13 + querySql;
  //    ShowMessage(CommandText);
      Open;
      Sort:= 'inputdate DESC';
      lbCount.Caption:=IntToStr(RecordCount);
    end;
  end;
end;

procedure TfrmMain.nAddClick(Sender: TObject);
begin
  try
    frmAddEdit:=TfrmAddEdit.Create(Application);
    frmAddEdit.ustate:=1;                //新增
    if frmAddEdit.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
begin
  try
    frmAddEdit:=TfrmAddEdit.Create(Application);
    frmAddEdit.ustate:=2;                //编辑
    frmAddEdit.selectRkey:=DM.adoMainrkey.Value;
    if frmAddEdit.selectRkey=0 then  Exit;
    if frmAddEdit.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmMain.nCheckClick(Sender: TObject);
begin
  try
    frmAddEdit:=TfrmAddEdit.Create(Application);
    frmAddEdit.ustate:=3;                //检查
    frmAddEdit.selectRkey:=DM.adoMainrkey.Value;
    if frmAddEdit.selectRkey=0 then  Exit;
    frmAddEdit.ShowModal;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmMain.nRedoClick(Sender: TObject);
begin
  try
    frmAddEdit:=TfrmAddEdit.Create(Application);
    frmAddEdit.ustate:=4;                //重签
    frmAddEdit.selectRkey:=DM.adoMainrkey.Value;
    if frmAddEdit.selectRkey=0 then  Exit;
    if frmAddEdit.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmMain.nDeleteClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  strRkey:='';
  if MessageDlg('你确定要永久删除选择的记录吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
  begin
    try
      for i:=0 to dbMain.SelectedRows.Count-1 do
      begin
        dbMain.DataSource.DataSet.Bookmark := dbMain.SelectedRows.Items[i];
        strRkey:= IntToStr(dm.adoMainrkey.Value)+','+ strRkey;
      end;
      strRkey:=Copy(strRkey,0,Length(strRkey)-1);
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from employee_contract where rkey in (' + strRkey +')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.nEditStateClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  strRkey:='';
  if MessageDlg('你确定要把失效合同改成生效吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
  begin
    try
//      ShowMessage(DateToStr(DM.adoMainenddate.Value));
//      ShowMessage(DateToStr(getsystem_date(DM.adoTime,1)));
      if DM.adoMainenddate.Value < getsystem_date(DM.adoTime,1) then
      begin
        ShowMessage('合同结束日期小于当前日期，不能生效');
        exit;
      end;
      if IsOverAge(DM.adomainsex.value,dm.adoMainenddate.Value,DM.adoMainbirthday.Value) then
      begin
        if MessageDlg('合同日期超出退休年龄,是否继续？',mtWarning,[mbYes,mbNo],0) <> mryes then Exit;
      end;
      for i:=0 to dbMain.SelectedRows.Count-1 do
      begin
        dbMain.DataSource.DataSet.Bookmark := dbMain.SelectedRows.Items[i];
        strRkey:= IntToStr(dm.adoMainrkey.Value)+','+ strRkey;
      end;
      strRkey:=Copy(strRkey,0,Length(strRkey)-1);
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update employee_contract set status=1 where rkey in (' + strRkey +')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.NEditOutClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  strRkey:='';
  if MessageDlg('你确定要把生效合同改成失效吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
  begin
    try
      for i:=0 to dbMain.SelectedRows.Count-1 do
      begin
        dbMain.DataSource.DataSet.Bookmark := dbMain.SelectedRows.Items[i];
        strRkey:= IntToStr(dm.adoMainrkey.Value)+','+ strRkey;
      end;
      strRkey:=Copy(strRkey,0,Length(strRkey)-1);
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update employee_contract set status=2 where rkey in (' + strRkey +')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.nYearClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  strRkey:='';
  frmYear:=TfrmYear.Create(Application);
  frmYear.strState:=1;
  if frmYear.ShowModal=mryes then
  begin
    if MessageDlg('你确定要把合同日期延长'+ Trim(frmYear.edtYear.Text)+'年吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
    begin
      try
        if IsOverAge(DM.adoMainsex.Value,IncYear(DM.adoMainenddate.Value,StrToInt(Trim(frmYear.edtYear.Text))),DM.adoMainbirthday.Value) then
        begin
          if MessageDlg('延长后合同日期超出退休年龄,是否继续？',mtWarning,[mbYes,mbNo],0) <> mryes then Exit;
        end;
        DM.ADOConnection1.BeginTrans;
        for i:=0 to dbMain.SelectedRows.Count-1 do
        begin

          dbMain.DataSource.DataSet.Bookmark := dbMain.SelectedRows.Items[i];
          strRkey:= IntToStr(dm.adoMainrkey.Value);

          with DM.adoTmp do
          begin
              Close;
              SQL.Clear;
              SQL.Add('declare @startdate datetime;'+#13+
                      'declare @enddate datetime;'+#13+
                      'select @startdate=  startdate,@enddate=  enddate from employee_contract where rkey = '+ strRkey+';'+#13+
                      'update employee_contract set startdate=dateadd(day,1,enddate),enddate=dateadd(year,'+Trim(frmYear.edtYear.Text)+',enddate),inputdate=convert(varchar(10),getdate(),120),opration_person= '+ user_ptr +',status=1,'+
                      'remark=remark+''原合同从 ''+convert(varchar(10),@startdate,120) +''到''+convert(varchar(10),@enddate,120)+''结束'''+#13+
                      'where rkey = '+strRkey);
              ExecSQL;
          end;
        end;
        DM.ADOConnection1.CommitTrans;
        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
  frmYear.Free;
end;

procedure TfrmMain.nEditEndClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  strRkey:='';
  frmYear:=TfrmYear.Create(Application);
  frmYear.strState:=2;
  if frmYear.ShowModal=mryes then
  begin
    if MessageDlg('你确定要把合同日期修改为'+ Trim(frmYear.edtYear.Text)+'吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
    begin
      try
        for i:=0 to dbMain.SelectedRows.Count-1 do
        begin
          if IsOverAge(DM.adoMainsex.Value,StrToDateTime(Trim(frmYear.edtYear.Text)),DM.adoMainbirthday.Value) then
          begin
            if MessageDlg('修改后合同结束日期超过退休年龄,是否继续？',mtWarning,[mbYes,mbNo],0) <> mryes then Exit;
          end;
        end;

        DM.ADOConnection1.BeginTrans;
        for i:=0 to dbMain.SelectedRows.Count-1 do
        begin
          if StrToDate(Trim(frmYear.edtYear.Text)) < getsystem_date(DM.adoTime,1) then
          begin
            ShowMessage('修改后的日期小于当前日期，不能更改');
            exit;
          end;
          dbMain.DataSource.DataSet.Bookmark := dbMain.SelectedRows.Items[i];
          strRkey:= IntToStr(dm.adoMainrkey.Value);
          with DM.adoTmp do
          begin
              Close;
              SQL.Clear;
              SQL.Add('update employee_contract set enddate= '+ QuotedStr(Trim(frmYear.edtYear.Text)) +',inputdate=convert(varchar(10),getdate(),120),opration_person= '+ user_ptr +#13+
                      ' where rkey = '+strRkey);
//              ShowMessage(sql.Text);
              ExecSQL;
          end;
        end;
        DM.ADOConnection1.CommitTrans;
        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
  frmYear.Free;
end;

procedure TfrmMain.dbMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Chr(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.adoMain.CommandText);
end;

procedure TfrmMain.dbMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
    if dbMain.SelectedRows.Count<=1 then
    begin
      dbMain.SelectedRows.Clear;
      dbMain.SelectedRows.CurrentRowSelected:=True;
    end;
end;

procedure TfrmMain.btnOutClick(Sender: TObject);
begin
  if not DM.adoOut.IsEmpty then
  begin
    try
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update employee_contract set employee_contract.status=2 '+#13+
                'FROM  dbo.employee_contract  inner JOIN  '+#13+
                '      dbo.v_employeemsg ON dbo.employee_contract.employeeid = dbo.v_employeemsg.rkey INNER JOIN  '+ #13+
                '        (select distinct departmentid from hr_permission where program_ptr = ( '+  #13+
                '               select rkey from data0419 where programe = ''ContractOfEmployee.exe'' ) '+ #13+
                '                    and  operator_ptr= '+ rkey73 +') as b on v_employeemsg.departmentid=b.departmentid '+ #13+
                'where enddate<getdate()'+#13+
                'and dbo.employee_contract.status=1');
        ExecSQL;
      end;
    except
        on E: Exception do
        begin
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
    end;
    ShowMessage('处理完成');
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.btnManagerClick(Sender: TObject);
begin
  try
    frmManager:=TfrmManager.Create(Application);
    frmManager.ShowModal;
  finally
    frmManager.Free;
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  Panel4.Width:=Round(frmMain.Width/4);
  pnl1.Width:=Round(frmMain.Width/4);
  panel6.Width:= Round(frmMain.Width/4);
end;

procedure TfrmMain.rgStatusClick(Sender: TObject);
begin
  if rgStatus.ItemIndex=0 then statusSql:=' and employee_contract.status=1';
  if rgStatus.ItemIndex=1 then statusSql:=' and employee_contract.status=2';
  if rgStatus.ItemIndex=2 then statusSql:=' and (employee_contract.status=1 or employee_contract.status=2)';

  with DM.adoMain do
  begin
    Close;
    Parameters.ParamByName('user').Value:=rkey73;
    CommandText:=mainSql+#13+ statusSql + #13 + querySql;
    //    ShowMessage(CommandText);
    Open;
    Sort:= 'inputdate DESC';
    lbCount.Caption:=IntToStr(RecordCount);
  end;
end;

procedure TfrmMain.dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not dbgrid.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  dbgrid.DataSource.DataSet.DisableControls;
  dbgrid.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrid.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrid.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrid.Columns.Count - 1 do
      if dbgrid.Columns[iCount].Visible = true then
       begin
        if dbgrid.Columns[iCount].Field.DataType in [ftString,ftWideString,ftDateTime] then
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrid.Columns[iCount].Field.AsString;
       end
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrid.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrid.DataSource.DataSet.First;
  dbgrid.DataSource.DataSet.EnableControls;
end;


procedure TfrmMain.btnOverClick(Sender: TObject);
begin
  if not DM.adoOver.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       dbGridEH_to_Excel(ehOver,'在职无有效合同的员工');
  end;
end;

function TfrmMain.IsOverAge(sex:Integer;day,birthday: TDateTime): Boolean;
//var
//  strNow:TDateTime;
begin
  Result:= False;
//  strNow:= getsystem_date(DM.adoTime,1);
  if sex = 1 then
  begin
    if IncYear(birthday,60) <= day then Result := True;
  end
  else
  begin
    if IncYear(birthday,50) <= day then Result := True;
  end;
end;

end.
