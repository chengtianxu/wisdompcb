unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ComCtrls,
  DAMO, DB, ADODB,common,DateUtils, Menus;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnField: TBitBtn;
    dbMain: TDBGridEh;
    lbFilter: TLabel;
    edtFilter: TEdit;
    Label2: TLabel;
    dtpkStart: TDateTimePicker;
    Label3: TLabel;
    dtpkEnd: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDelete: TMenuItem;
    N1: TMenuItem;
    nEnd: TMenuItem;
    nSepEnd: TMenuItem;
    btnImport: TBitBtn;
    btnLoadData: TBitBtn;
    pnl3: TPanel;
    lbText: TLabel;
    rgStatus: TRadioGroup;
    Label1: TLabel;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpkStartExit(Sender: TObject);
    procedure dbMainTitleClick(Column: TColumnEh);
    procedure dbMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFieldClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure nAddClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure nEndClick(Sender: TObject);
    procedure nSepEndClick(Sender: TObject);
    procedure dbMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnLoadDataClick(Sender: TObject);
    procedure dtpkStartCloseUp(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
  private
    { Private declarations }
    Startdate,Enddate:TDateTime;
    mainSql,querySql,statusSql:string;
    preColumn:TColumnEh;
    procedure itemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses PasQuery, PasAdd, PasImport, PasLoadData, PasMoney;


{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  rkey:Integer;
begin
  rkey:= DM.adoMainrkey.Value;
  with DM.adoMain do
  begin
    Close;
    Parameters.ParamByName('dtpk1').Value:= startDate;
    Parameters.ParamByName('dtpk2').Value:=endDate;
    CommandText:=mainSql+ #13+ statusSql + #13 + querySql;
    Open;
    Label1.Caption:='记录总数为：'+ IntToStr(RecordCount) + ' 条';
    if preColumn.Title.SortMarker= smNoneEh then
    begin
      Sort:= 'oprate_time DESC';
    end;
    if preColumn.Title.SortMarker= smUpEh then
    begin
      Sort:=preColumn.FieldName;
    end ;
    if preColumn.Title.SortMarker= smDownEh then
    begin
      Sort:=preColumn.FieldName + ' DESC';
    end;
    if rkey>0 then
    begin
      Locate('rkey',rkey,[]);
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   user_ptr:='3301';
  rkey73:='3023';
  vprev:='4';

  if not App_init_2(DM.ADOConnection1) then
  begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
  end;


  frmMain.Caption:=Application.Title;

end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select employee_ptr from data0073 where rkey = '+ rkey73;
//    ShowMessage(SQL.Text);
    Open;
    if not IsEmpty then user_ptr:=FieldByName('employee_ptr').AsString;
  end;
  statusSql:=' and (train_status=0 or train_status=1) ';
  preColumn:=dbMain.Columns[0];
  lbFilter.Caption:='培训编号';
  mainSql:=dm.adoMain.CommandText;
  querySql:='';
  Startdate:=IncMonth(getsystem_date(dm.adoTime,1),-1);
  Enddate:=getsystem_date(dm.adoTime,1);
  dtpkStart.date:=startdate;
  dtpkend.Date:=enddate;
  with dm.adoMain do
  begin
    Close;
    CommandText:=mainSql+ ' and (train_status=0 or train_status=1)';
    Parameters.ParamByName('dtpk1').Value:=Startdate;
    Parameters.ParamByName('dtpk2').Value:=enddate;
    Open;
    Sort:='oprate_time DESC';
    Label1.Caption:='记录总数为：'+ IntToStr(RecordCount) + ' 条';
  end;

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
  nEnd.Enabled:=(vprev='2') or (vprev='4');
  nSepEnd.Enabled:=(vprev='2') or (vprev='4');

end;

procedure TfrmMain.dtpkStartExit(Sender: TObject);
begin
  if dtpkStart.Date<dtpkEnd.Date then
  begin
    startdate:=dtpkstart.date;
    enddate:=dtpkend.Date;
    btnRefreshClick(nil);
  end
  else
    ShowMessage('开始日期大于结束日期，请重新输入');
end;

procedure TfrmMain.dbMainTitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption <> preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
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

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adoMain.Filtered:=False;
    DM.adoMain.Filter:= preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text) + '%''';
    DM.adoMain.Filtered:=True;
  end
  else
    DM.adoMain.Filter:='';
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if not DM.adoMain.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbMain,'员工培训');
  end;
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  try
    if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
    frmQuery.dtpkFrom.Date:= dtpkStart.Date;
    frmQuery.dtpkTo.Date:= dtpkEnd.Date;
    frmQuery.dtpkqueryStart.Date:=dtpkStart.Date;
    frmQuery.dtpkqureyEnd.Date:=dtpkEnd.Date;
    if frmQuery.ShowModal=mryes then
    begin
      dtpkStart.Date:=frmQuery.dtpkqueryStart.Date;
      dtpkEnd.Date:=frmQuery.dtpkqureyEnd.Date;
      dtpkStartExit(nil);
      querySql:='';
      for i:=1 to frmQuery.sgCondition.RowCount-1 do
      begin
        querySql:= frmQuery.sgCondition.Cells[2,i] +#13+ querySql;
      end;
  //    ShowMessage(querySql);
      btnRefreshClick(nil);
    end;
  finally
//    frmQuery.Free;
  end;
end;

procedure TfrmMain.nAddClick(Sender: TObject);
begin
  try
    frmAdd:=TfrmAdd.Create(Application);
    frmAdd.selStart:=1;           //新增
    if frmAdd.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmAdd.Free;
  end;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
begin
  try
    frmAdd:=TfrmAdd.Create(Application);
    frmAdd.selStart:=2;           //编辑
    frmAdd.selRkey:=DM.adoMainrkey.Value;
    if frmAdd.selRkey=0 then exit;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,feels_payed from employee_train where rkey='+ IntToStr(DM.adoMainrkey.Value);
      Open;
      if FieldByName('feels_payed').AsBoolean then
      begin
        ShowMessage('已经结案的记录不能再编辑！');
        Exit;
      end;
    end;
    if frmAdd.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmAdd.Free;
  end;
end;

procedure TfrmMain.nCheckClick(Sender: TObject);
begin
  try
    frmAdd:=TfrmAdd.Create(Application);
    frmAdd.selStart:=3;           //检查
    frmAdd.selRkey:=DM.adoMainrkey.Value;
    if frmAdd.selRkey=0 then exit;
    frmAdd.ShowModal;
  finally
    frmAdd.Free;
  end;
end;

procedure TfrmMain.btnLoadDataClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  try
    frmLoadData:=TfrmLoadData.Create(Application);
    frmLoadData.ShowModal;
  finally
    frmLoadData.Free;
  end;
end;

procedure TfrmMain.btnImportClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  try
    frmImport:=TfrmImport.Create(Application);
    if frmImport.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmImport.Free;
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
      if strRkey='' then exit;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey,feels_payed from employee_train where rkey in ('+ strRkey +')';
        Open;

        while not Eof do
        begin
          if FieldByName('feels_payed').AsBoolean then
          begin
            ShowMessage('选择的记录中存在已经结案的记录，已经结案的记录不能删除！');
            Exit;
          end;
          Next;
        end;

        Close;
        SQL.Clear;
        SQL.Add('delete from employee_train where rkey in (' + strRkey +')');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
  Self.btnRefreshClick(nil);
end;

procedure TfrmMain.nEndClick(Sender: TObject);
var
  srkey,inttype,traintype,employeeid:Integer;
  money,tmp:Currency;
  boolstr:Boolean;
  strtype:string;
begin
  srkey:=DM.adoMainrkey.Value;
  if srkey=0 then Exit;
  if MessageDlg('确定要结案此记录吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,feels_payed from employee_train where rkey = '+ IntToStr(srkey);
      Open;
      if FieldByName('feels_payed').Value=True  then
      begin
        ShowMessage('已经结案的记录不能再结案');
        Exit;
      end;
    end;

    if vprev='2' then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey from employee_train where rkey = '+IntToStr(srkey) +' and oprator_ptr = '+ user_ptr ;
        Open;
        if IsEmpty then
        begin
          ShowMessage('非创建者不可修改培训记录');
          Exit;
        end;
      end;
    end;
    try
      with dm.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey,employeeid,type_ptr,effective_date,getdate() as nowdate,train_feels from employee_train where rkey ='+ IntToStr(srkey);
        Open;
        employeeid:=FieldByName('employeeid').AsInteger;
        if IncDay(FieldByName('effective_date').value,1)> FieldByName('nowdate').Value then
          money:=Round((MonthsBetween(FieldByName('nowdate').Value,FieldByName('effective_date').value)+1)/36.0*FieldByName('train_feels').AsCurrency)
        else
          money:=0;
  //      boolstr:= (IncDay(FieldByName('effective_date').value,1)< FieldByName('nowdate').Value) or (FieldByName('train_feels').Value=0);
        boolstr:= (IncDay(FieldByName('effective_date').value,1)< FieldByName('nowdate').Value) or (money=0) or (FieldByName('train_feels').Value=0);
        traintype:=FieldByName('type_ptr').AsInteger;
      end;

      try
        if boolstr then
        begin
          with DM.adoTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='update employee_train set feels_payed=1,actually_feels=0,oprate_time=getdate(),oprator_ptr= '+ user_ptr+
                      'where rkey= '+ IntToStr(srkey);
            ExecSQL;
            ShowMessage('结案成功！');
          end;
          btnRefreshClick(nil);
        end
        else
        begin
          frmMoney:=TfrmMoney.Create(Application);
          frmMoney.Edit1.Text:=CurrToStr(money);
          frmMoney.Memo1.Text:= DM.adoMainTrain_content.AsString;
          if frmMoney.ShowModal=mryes then
          begin
            money:= StrToCurr(frmMoney.Edit1.Text);
            with DM.adoTmp do
            begin
              Close;
              SQL.Clear;
              SQL.Text:='select rkey,item from datadetail where rkey='+ IntToStr(traintype);
              Open;
              if not IsEmpty then strtype:= FieldByName('item').AsString
              else strtype:='';
            end;

            with DM.adoTmp do
            begin
              Close;
              SQL.Clear;
              SQL.Text:='select rkey,item from datadetail where item like ''%减其它%''';
              Open;
              if not IsEmpty then inttype:= FieldByName('rkey').AsInteger
              else
              begin
                ShowMessage('不存在负绩效，请联系管理员');
                Exit;
              end;
            end;

            try
              dm.ADOConnection1.BeginTrans;
              with DM.adoTmp do
              begin
                Close;
                SQL.Clear;
                SQL.Text:='update employee_train set feels_payed=1,actually_feels=' + CurrToStr(money) +',oprate_time='+
                            QuotedStr(DateToStr(getsystem_date(DM.adoTime,1)))+',oprator_ptr= '+ user_ptr+
                          ' ,train_content= ' + QuotedStr(frmMoney.Memo1.Lines.Text) +
                          'where rkey= '+ IntToStr(srkey);
                ExecSQL;

                Close;
                SQL.Clear;
                sql.Text:='insert into employee_rewards_punishment(employeeid,type,money,flag,effectdate,ModiMan,remark) values(:employeeid,:type,:money,:flag,:effectdate,:ModiMan,:remark)';
                Parameters.ParamByName('employeeid').Value:=employeeid;
                Parameters.ParamByName('type').Value:=inttype;
                Parameters.ParamByName('money').Value:= money;
                Parameters.ParamByName('flag').Value:=1;
                Parameters.ParamByName('effectdate').Value:=FormatDateTime('yyyy-MM-dd',Now);
                Parameters.ParamByName('ModiMan').Value:= StrToInt(rkey73);
                Parameters.ParamByName('remark').Value:=strtype+'培训挂帐';
                ExecSQL;
                dm.ADOConnection1.CommitTrans;
                ShowMessage('结案成功！');
              end;
            except
              on E: Exception do
              begin
                DM.ADOConnection1.RollbackTrans;
                messagedlg(E.Message,mterror,[mbcancel],0);
              end;
            end;
            btnRefreshClick(nil);
          end;
        end;
      except
        on E: Exception do
        begin
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    finally

    end;
  end;
end;

procedure TfrmMain.nSepEndClick(Sender: TObject);
var
  srkey:Integer;
begin
  srkey:=DM.adoMainrkey.Value;
  if srkey=0 then Exit;
  if MessageDlg('确定要结案此记录吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,feels_payed from employee_train where rkey = '+ IntToStr(srkey);
      Open;
      if FieldByName('feels_payed').Value=True  then
      begin
        ShowMessage('已经结案的记录不能再结案');
        Exit;
      end;
    end;

    if vprev='2' then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey from employee_train where rkey = '+IntToStr(srkey) +' and oprator_ptr = '+ user_ptr ;
        Open;
        if IsEmpty then
        begin
          ShowMessage('非创建者不可修改培训记录');
          Exit;
        end;
      end;
    end;

    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='update employee_train set feels_payed=1,actually_feels=0,train_result= ''合格(结案不扣绩效)'',oprate_time=getdate(),oprator_ptr= '+ user_ptr+
                    'where rkey= '+ IntToStr(srkey);
      ExecSQL;
      ShowMessage('结案成功！');
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.dbMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if (DM.adoMainfeels_payed.Value=True) then dbMain.Canvas.Font.Color := clred ;
  if (DM.adoMainstarttime.Value='') or (DM.adoMainendtime.Value='') or (DM.adoMainTrain_time.Value<10) then dbMain.Canvas.Font.Color:=clBlue;
  dbMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmMain.dtpkStartCloseUp(Sender: TObject);
begin
  edtFilter.SetFocus;
end;

procedure TfrmMain.rgStatusClick(Sender: TObject);
begin
  case rgStatus.ItemIndex of
    0:
    begin
      statusSql:=' and (train_status=0 or train_status=1) ';
    end;
    1:
    begin
      statusSql:=' and train_status=1 ';
    end;
    2:
    begin
      statusSql:=' and train_status=0 ';
    end;
  end;
  btnRefreshClick(nil);
end;

end.
