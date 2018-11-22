//---------------------------------------------
//                   _ooOoo_
//                  o8888888o
//                  88" . "88
//                  (| -_- |)
//                  O\  =  /O
//               ____/`---'\____
//             .'  \\|     |//  `.
//            /  \\|||  :  |||//  \
//           /  _||||| -:- |||||-  \
//           |   | \\\  -  /// |   |
//           | \_|  ''\---/''  |   |
//           \  .-\__  `-`  ___/-. /
//         ___`. .'  /--.--\  `. . __
//      ."" '<  `.___\_<|>_/___.'  >'"".
//     | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//     \  \ `-.   \_ __\ /__ _/   .-` /  /
//      `-.____`-.___\_____/___.-`____.-'
//                   `=---='
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//    佛祖保佑       永无BUG       永不修改
//---------------------------------------------
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, DB, ADODB,
  Menus, ppReport, ppEndUsr;

type
  TfrmMain = class(TForm)
    pnlAllClient: TPanel;
    pnlTop: TPanel;
    lblFilter: TLabel;
    dtpDate: TDateTimePicker;
    edtFilter: TEdit;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnColumn: TBitBtn;
    pnlClient: TPanel;
    dbgBrowse: TDBGridEh;
    pmColumn: TPopupMenu;
    benDefined: TBitBtn;
    dmDesignRpt: TPopupMenu;
    MI1: TMenuItem;
    pnlBottom: TPanel;
    rgStatus: TRadioGroup;
    pmOp: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N9: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    N10: TMenuItem;
    N5: TMenuItem;
    btnSet: TBitBtn;
    pnlBottom1: TPanel;
    chkQuote_Status0: TCheckBox;
    chkQuote_Status1: TCheckBox;
    chkQuote_Status3: TCheckBox;
    chkQuote_Status4: TCheckBox;
    chkQuote_Status2: TCheckBox;
    N7: TMenuItem;
    MI2: TMenuItem;
    N8: TMenuItem;
    chkQuote_Status255: TCheckBox;
    pnlNotes: TPanel;
    lblNotes: TLabel;
    sbtnYES: TSpeedButton;
    sbtnNO: TSpeedButton;
    mmNotes: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure benDefinedClick(Sender: TObject);
    procedure dbgBrowseDblClick(Sender: TObject);
    procedure dbgBrowseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgBrowseTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure pmOpPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure dbgBrowseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure chkStatus0Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure MI1Click(Sender: TObject);
    procedure MI2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure sbtnNOClick(Sender: TObject);
    procedure sbtnYESClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Field_Name: String;
    PreColumn: TColumnEh;  
    OrigSQL, NewSQL: String;
    CustList: array of string[10];
    HotKey: Integer;
    function Checkvprev: Boolean;
    procedure item_Click(Sender: TObject);
    procedure ViewData(OP: Byte; title:string);
    procedure FindCompentOnPanel(var S:string);
    procedure WMhotkeyhandle(var msg:TMessage); message wm_hotkey; //响应热键消息
  public
    YY: Byte;  {1新增、2编辑、3检查}
    CustStr,StatusSQL: String;
    function CheckStatus(vPaperNo: string; vStatus: integer):Boolean;
    function OpenQuery(CName: TADOQuery; Params: array of string;
      sqlText: string=''; OpenType: Byte=0):Boolean;
    procedure UseReport(BDate,EDate: TDatetime;OP: Integer;vSQL:string='');  //OP: 0设计; 1打印;
    procedure setCompents(status: integer);  //status: 0只读; 1可写
  end;

var
  frmMain: TfrmMain;
  USERRKEY: string;
  
implementation

uses damo, common, condition, Detail, SetItem, ConstVar, Pick_Item_Single,
  Reports, RptCondition, CtwObjectDebugger;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
//{$IFDEF Release}
  if not App_init_2(dm.ADOConn) then
  begin
    showmsg('程序起动失败，请联系管理员！',1);
    application.Terminate;
  end;
//{$ENDIF}
//{$IFDEF Debug}
//  dm.ADOConn.Connected:= False;
//  dm.ADOConn.Connected:= True;
//  vprev:= '4';  //4写银
//  rkey73:='2444';
//{$ENDIF}
  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';

  HotKey:=GlobalAddAtom('HotKey1');
  RegisterHotKey(handle,HotKey,MOD_CONTROL,VK_F11);     
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i: Byte;
  j: Integer;
  item: TMenuItem;
begin
  if dm.ADOConn.Connected then
  begin
    if ((StrToInt(vprev) = 1) or (StrToInt(vprev) = 2)) then  //如果只有只读1权限,绑定客户; 3,4权限都不需要绑定
    begin
      with dm.aqTmp do
      begin
       close;
       sql.Clear;
       sql.Add('select t10.RKEY,t10.CUST_CODE from data0010 t10 inner join data0100 t100 ');
       sql.Add('on t10.RKEY = t100.CUSTOMER_PTR ');
       sql.Add('where t100.CSI_PTR = '+rkey73);
       open;
       First;
       SetLength(CustList, RecordCount);
      end;
//      if dm.aqTmp.RecordCount = 0 then CustStr:= ' And 1<>1 '
//      else
//      for j:=0 to dm.aqTmp.RecordCount-1 do  //读取绑定客户到数组CustList
//      begin
//        CustList[j]:= dm.aqTmp.FieldByName('RKEY').AsString;
//        if j=0 then CustStr:= ' And CUST_PTR in('+CustList[j]+','
//        else if j=dm.aqTmp.RecordCount-1 then CustStr:= CustStr+CustList[j]+')'
//        else CustStr:= CustStr + CustList[j]+',';
//
//        if ((j=0) and (j=dm.aqTmp.RecordCount-1)) then  //如果只绑定了一个客户
//          CustStr:= ' And CUST_PTR in('+CustList[j]+')';
//
//        dm.aqTmp.Next;           //生成条件CustStr
//      end;
      if dm.aqTmp.RecordCount = 0 then CustStr:= ' And ISNULL(CUST_PTR,0)=0 '
      else
      for j:=0 to dm.aqTmp.RecordCount-1 do  //读取绑定客户到数组CustList
      begin
        CustList[j]:= dm.aqTmp.FieldByName('RKEY').AsString;
        if j=0 then CustStr:= ' And ISNULL(CUST_PTR,0) in(0,'+CustList[j]+','
        else if j=dm.aqTmp.RecordCount-1 then CustStr:= CustStr+CustList[j]+')'
        else CustStr:= CustStr + CustList[j]+',';

        if ((j=0) and (j=dm.aqTmp.RecordCount-1)) then  //如果只绑定了一个客户
          CustStr:= ' And ISNULL(CUST_PTR,0) in(0,'+CustList[j]+')';

        dm.aqTmp.Next;           //生成条件CustStr
      end;
      //ShowMessage(CustStr);
    end;
    with dm.aqTmp do
    begin
     close;
     sql.Clear;
     sql.Add('select EMPLOYEE_PTR from data0073');
     sql.Add('where rkey='+rkey73);
     open;
     USERRKEY := fieldbyname('employee_ptr').asstring;
    end;
    dm.adsBrowse.Close;
    dm.adsBrowse.CommandText:= dm.adsBrowse.CommandText + CustStr;
    OrigSQL:= dm.adsBrowse.CommandText;
    NewSQL:= dm.adsBrowse.CommandText;
    FindCompentOnPanel(StatusSQL);
    dm.adsBrowse.CommandText:= dm.adsBrowse.CommandText + StatusSQL;
    dm.adsBrowse.Parameters[0].Value:= IncMonth(getsystem_date(dm.aqGetDate,1),-1);
    dm.adsBrowse.Parameters[1].Value:= strtodatetime(FormatDatetime('yyyy-mm-dd',getsystem_date(dm.aqGetDate,1)) + ' 23:59:59');
    dm.adsBrowse.Parameters[2].Value:= IncMonth(getsystem_date(dm.aqGetDate,1),-1);
    dm.adsBrowse.Parameters[3].Value:= strtodatetime(FormatDatetime('yyyy-mm-dd',getsystem_date(dm.aqGetDate,1)) + ' 23:59:59');
    dm.adsBrowse.Prepared;
    dm.adsBrowse.Open;

    for i:= 1 to dbgBrowse.FieldCount do
    begin
      item:= TMenuItem.Create(self);
      item.Caption:= dbgBrowse.Columns[i-1].Title.Caption;
      if dbgBrowse.Columns[i-1].Visible then item.Checked:= true;
      item.OnClick:= item_Click;
      self.pmColumn.Items.Add(item);
    end;
  end;
  Field_Name:= dbgBrowse.Columns[0].FieldName;
  PreColumn:= dbgBrowse.Columns[0];
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  rkey:integer;
begin
  rkey:= dm.adsBrowseRKEY.Value;
  dm.adsBrowse.Close;
  dm.adsBrowse.Open;
  if rkey>0 then dm.adsBrowse.Locate('rkey',rkey,[]);
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgBrowse, self.Caption);
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:byte;
begin
  with frmCondition do
  begin
    dtpk1.Date:= strtodate(formatdatetime('yyyy-MM-dd', dm.adsBrowse.Parameters.ParamValues['dtpk1']));
    dtpk2.Date:= strtodate(formatdatetime('yyyy-MM-dd', dm.adsBrowse.Parameters.ParamValues['dtpk2']));
    dtpk3.Time:= StrToTime(formatdatetime('HH:mm:ss', dm.adsBrowse.Parameters.ParamValues['dtpk1']));
    dtpk4.Time:= StrToTime(formatdatetime('HH:mm:ss', dm.adsBrowse.Parameters.ParamValues['dtpk2']));

    if ShowModal = mrok then
    begin
      with dm.adsBrowse do
      begin
        close;
        CommandText:= OrigSQL;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
          CommandText:= CommandText + frmCondition.SGrid1.Cells[2,i] + #13;
        NewSQL:= CommandText;
        FindCompentOnPanel(StatusSQL);
        CommandText:= CommandText + StatusSQL;
        Parameters[0].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('HH:mm:ss',dtpk3.Time));
        Parameters[1].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('HH:mm:ss',dtpk4.Time));
        Parameters[2].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('HH:mm:ss',dtpk3.Time));
        Parameters[3].Value:= strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('HH:mm:ss',dtpk4.Time));
        Prepared;
        open;
      end;
    end;
  end;
end;

procedure TfrmMain.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.item_Click(Sender: TObject);
var
  i:byte;
begin
  (sender as TMenuItem).Checked := not ((sender as TMenuItem).Checked);
  if (sender as TMenuItem).Checked then
  begin
    for i:= 0 to dbgBrowse.FieldCount - 1 do
    if dbgBrowse.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      dbgBrowse.Columns[i].Visible:= True;
      break;
    end;
  end
  else
  begin
    for i:= 0 to dbgBrowse.FieldCount - 1 do
    if dbgBrowse.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      dbgBrowse.Columns[i].Visible:= False;
      break;
    end;
  end;
end;

procedure TfrmMain.benDefinedClick(Sender: TObject);
begin
  dmDesignRpt.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TfrmMain.dbgBrowseDblClick(Sender: TObject);
begin
  ViewData(3,'检查');
end;

procedure TfrmMain.dbgBrowseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((dm.dsBrowse.DataSet as TADODataSet).CommandText, mtInformation, [mbOK], 0);
end;

procedure TfrmMain.dbgBrowseTitleClick(Column: TColumnEh);
begin
  IF dm.dsBrowse.DataSet.Active then
  begin
    if Column.Title.SortMarker = smDownEh then  //排序
    begin
      Column.Title.SortMarker:= smUpEh;
      dm.adsBrowse.IndexFieldNames:= Column.FieldName;
    end
    else
    begin
      Column.Title.SortMarker:= smDownEh;
      dm.adsBrowse.IndexFieldNames:= Column.FieldName + ' DESC';
    end;
    if Field_Name <> Column.FieldName then
    begin
      Field_Name:= Column.FieldName;
      lblFilter.Caption:= Column.Title.Caption;
      edtFilter.Text:= '' ;
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end
    else
    if Field_Name = Column.FieldName then
    begin
      edtFilter.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end;
    if dm.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      dtpDate.Date := getsystem_date(dm.aqGetDate,1);
      edtFilter.SendToBack;
    end
    else
    begin
      edtFilter.BringToFront;
      with dm.adsBrowse do
      begin
        Close;
        FindCompentOnPanel(StatusSQL);
        CommandText:= NewSQL + StatusSQL;
        Prepared;
        Open;
      end;
    end;
  end
  else
    ShowMessage('没有打开数据，请按: 查询 ');
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
var
  S: String;
  BDate,EDate: String;
begin
  IF dm.dsBrowse.DataSet.Active Then
  begin
    DM.adsBrowse.Filter := '';
    S:= '';
    if rgStatus.ItemIndex <> 2 then
    begin
      S:= ' Status = ' + inttostr(rgStatus.ItemIndex);
    end;
    if trim(edtFilter.text) <> '' then
    begin
      if dm.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtFilter.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtFilter.text) + '%''';
      end
      else
      if dm.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
      begin
        try
          StrToInt(edtFilter.Text);
          if S = '' then
            S:= Field_Name + ' = ' + trim(edtFilter.text)
          else
            S:= S + ' and ' + Field_Name+' = ' + trim(edtFilter.text);
        except
          ShowMessage('输入的内容不相符，只能输入数字！');
        end;
      end;
    end;
    DM.adsBrowse.Filter:= S;

    if dm.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      BDate:= DateToStr(dtpDate.Date) + ' 00:00:00';
      EDate:= DateToStr(dtpDate.Date) + ' 23:59:59';
      dm.adsBrowse.Close;
      if rgStatus.ItemIndex <> 2 then
        S:= ' and Status = ' + inttostr(rgStatus.ItemIndex) +
            ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +''''
      else
        S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
      FindCompentOnPanel(StatusSQL);
      dm.adsBrowse.CommandText:= NewSQL + S + StatusSQL;
      dm.adsBrowse.Open;
    end;
  end;
end;

procedure TfrmMain.dtpDateChange(Sender: TObject);
begin
  edtFilterChange(edtFilter);
end;

procedure TfrmMain.rgStatusClick(Sender: TObject);
begin
  edtFilterChange(edtFilter);
end;

procedure TfrmMain.pmOpPopup(Sender: TObject);
begin
  if dm.adsBrowse.IsEmpty then
  begin
    n2.Enabled:= False;     //编辑
    n3.Enabled:= False;     //检查
    n4.Enabled:= False;     //提交
    n5.Enabled:= False;     //退回
    n6.Enabled:= False;     //删除
    n7.Enabled:= False;     //编辑报价类型
    n8.Enabled:= False;     //取消
  end
  else
  begin
    n3.Enabled:= True;
    case dm.adsBrowseStatus.Value of
    0:begin  //待提交
        n2.Enabled:= True;
        n4.Enabled:= True;
        n5.Enabled:= False;
        n6.Enabled:= True;
        n7.Enabled:= True;
        n8.Enabled:= True;
      end;
    1:begin  //已提交
        n2.Enabled:= False;
        n4.Enabled:= False;
        n5.Enabled:= True;
        n6.Enabled:= False;
        n7.Enabled:= True;
        n8.Enabled:= True;
      end;
    255:
      begin  //已取消
        n2.Enabled:= False;
        n4.Enabled:= False;
        n5.Enabled:= False;
        n6.Enabled:= False;
        n7.Enabled:= False;
        n8.Enabled:= False;
      end;
    end;
    case dm.adsBrowseQuote_Status.Value of
    2:begin  //报价已完成
        n2.Enabled:= False;
        n4.Enabled:= False;
        n5.Enabled:= False;
        n6.Enabled:= False;
        n7.Enabled:= False;
        n8.Enabled:= False;
      end;
    end;
  end;
end;

function TfrmMain.Checkvprev: Boolean;
begin
  {1:只读; 2:可写; 3:读银; 4:写银}
  Result:= True;
  if (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Result:= False;
  end;
end;

procedure TfrmMain.ViewData(OP: Byte; title:string);
var
  rkey:integer;
begin
  if not dm.adsBrowse.Active then Abort;
  if ((op <> 1) and (dm.adsBrowse.RecordCount <= 0)) then Abort;
  YY:= OP;
  if OP = 2 then
  begin
    if CheckStatus(dm.adsBrowsePaperNO.AsString,255) then
    begin
      Showmessage('单据已取消不能编辑!');
      btnRefreshClick(nil);
      Abort;
    end;
  end;
  if OP = 1 then
    OpenQuery(dm.aqMain,['0'])
  else
    OpenQuery(dm.aqMain,[dm.adsBrowse.FieldValues['RKEY']]);
  rkey:= dm.aqMainRKEY.Value;

  frmDetail:= TfrmDetail.Create(Application);
  try
    with frmDetail do
    begin
      Caption:= title;
      if OP = 3 then
        setCompents(0)
      else
        setCompents(1);  
    end;
    if frmDetail.ShowModal = mrok then
      btnRefreshClick(nil)
    else
      dm.aqMain.Locate('rkey',rkey,[]);
  finally
    frmDetail.Free;
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  if (Sender as TMenuItem).Tag = 3 then
    ViewData((Sender as TMenuItem).Tag,(Sender as TMenuItem).Caption)
  else if Checkvprev then
    ViewData((Sender as TMenuItem).Tag,(Sender as TMenuItem).Caption);
end;

function TfrmMain.OpenQuery(CName: TADOQuery; Params: array of string;
  sqlText: string; OpenType: Byte): Boolean;
var
  i: Byte;
begin
  try
    with CName do
    begin
      Close;
      if sqlText <> '' then
      begin
        SQL.Clear;
        SQL.Add(sqlText);
      end;
      if Parameters.Count > 0 then
      begin
        if Parameters.Count = Length(Params) then  //检查TADOQuery参数与传入参数个数是否匹配
          for i:= 0 to Parameters.Count-1 do
            Parameters[i].Value:= Params[i]
        else
          Raise Exception.Create('参数不匹配');
      end;
      if OpenType = 0 then Open else ExecSQL;
    end;
    Result:= True;
  except
    Result:= False;
    Abort;
  end;
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  if StrToInt(vprev) = 4 then
  begin
//    if dm.adsBrowse.FieldByName('Quote_Status').AsInteger=2 then
//    begin
//      ShowMessage('已报价完成,不允许删除!');
//      Abort;
//    end;
    if CheckStatus(dm.adsBrowsePaperNO.AsString,2) then
    begin
      Showmessage('已报价完成,不允许删除!');
      btnRefreshClick(nil);
      Abort;
    end;
    if not (dm.adsBrowse.FieldByName('DownloadTime').IsNull) then
    begin
      ShowMessage('文件已下载,不允许删除!');
      Abort;
    end;
    if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO then
      exit;
    dm.ADOConn.BeginTrans;
    try
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'delete from Data0243 where PTR_242 = ' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text:= 'delete from Data0242 where rkey=' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
      end;
      dm.ADOConn.CommitTrans;
      ShowMessage('删除成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('删除失败!');
    end;
  end
  else
    ShowMessage('无删除权限!');
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  if Checkvprev then
  begin
    if CheckStatus(dm.adsBrowsePaperNO.AsString,255) then
    begin
      ShowMessage('单据已取消,不允许提交!');
      btnRefreshClick(nil);
      Abort;
    end;
    if CheckStatus(dm.adsBrowsePaperNO.AsString,2) then
    begin
      Showmessage('已报价完成,不允许提交!');
      btnRefreshClick(nil);
      Abort;
    end;  
    if dm.adsBrowse.FieldByName('Remark').AsString='' then
    begin
      ShowMessage('产品用途未选,不允许提交!');
      Abort;
    end;
    if ((dm.adsBrowse.FieldByName('Quote_Status').AsInteger=3) or (
        (dm.adsBrowse.FieldByName('AskInfo').AsString<>'') and (dm.adsBrowse.FieldByName('AnswerInfo').AsString=''))) then
    begin
      ShowMessage('询问中未回复,不允许提交!');
      Abort;
    end;
    if dm.adsBrowse.FieldByName('UploadTime').IsNull then
    begin
      ShowMessage('附件未上传,不允许提交!');
      Abort;
    end;
    if MessageBox(Handle,'确定提交并发消息通知报价人员吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO then
      exit;
    dm.ADOConn.BeginTrans;
    try
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'update Data0242 set status=1,FinishTime=getdate() where rkey=' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
      end;
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'INSERT DATA0014(MESSAGE,whosend) values(''报价时效单: '+dm.adsBrowse.FieldByName('PaperNO').AsString+' 已提交'','+rkey73+')'+#13
                  +'DECLARE @to int'+#13
                  +'SET @to=@@Identity'+#13
                  +'INSERT DATA0314(emp_ptr,d14_ptr) SELECT PTR_73,@to FROM DATA0244';
        ExecSQL;
      end;
      dm.ADOConn.CommitTrans;
      ShowMessage('操作成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('操作失败!');
    end;
  end;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  if StrToInt(vprev) = 4 then
  begin
    if CheckStatus(dm.adsBrowsePaperNO.AsString,255) then
    begin
      ShowMessage('单据已取消,不允许退回!');
      btnRefreshClick(nil);
      Abort;
    end;
    if CheckStatus(dm.adsBrowsePaperNO.AsString,2) then
    begin
      Showmessage('已报价完成,不允许退回!');
      btnRefreshClick(nil);
      Abort;
    end;
//    if dm.adsBrowse.FieldByName('Quote_Status').AsInteger=2 then
//    begin
//      ShowMessage('已报价完成,不允许退回!');
//      Abort;
//    end;

//    if MessageBox(Handle,'是否继续操作?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO then
//      exit;
    pnlNotes.Visible:= not pnlNotes.Visible;
    lblNotes.Caption:= '退回原因:';
    mmNotes.Text:= '';    
//    dm.ADOConn.BeginTrans;
//    try
//      with dm.aqTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:= 'update Data0242 set status=0,FinishTime=null where rkey=' + dm.adsBrowseRKEY.AsString;
//        ExecSQL;
//      end;
//      //短信通知创建者
//      with dm.aqTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:= 'INSERT DATA0014(MESSAGE,whosend)'+#13
//                  +'values(''报价时效单:'+dm.adsBrowse.FieldByName('PaperNO').AsString+' 已退回，退回日期:'''+'+convert(varchar,getdate(),120)'+','+rkey73+')'+#13
//                  +'DECLARE @to int'+#13
//                  +'SET @to=@@Identity'+#13
//                  +'INSERT DATA0314(emp_ptr,d14_ptr) SELECT t73.RKEY,@to FROM DATA0242 t242 INNER JOIN Data0073 t73 ON t242.CreateBy_PTR=t73.EMPLOYEE_PTR WHERE t242.PaperNO = '''+dm.adsBrowse.FieldByName('PaperNO').AsString+'''';
//        ExecSQL;
//      end;
//      dm.ADOConn.CommitTrans;
//      ShowMessage('退回成功!');
//      btnRefreshClick(nil);
//    except
//      dm.ADOConn.RollbackTrans;
//      ShowMessage('退回失败!');
//    end;
  end;
end;

procedure TfrmMain.btnSetClick(Sender: TObject);
var
  dlgSetItem: TfrmSetItem;
begin
  if StrToInt(vprev) <> 4 then
  begin
    ShowMessage('无权限');
    Abort;
  end;
  dlgSetItem:= TfrmSetItem.Create(Self);
  try
    with dlgSetItem do
    begin
      dm.aqSetItem.Close;
      dm.aqSetItem.Open;
      dm.aq244.Close;
      dm.aq244.Open;
      dm.aq247.Close;
      dm.aq247.Open;
      ShowModal;
    end;
  finally
    dlgSetItem.Free;
  end;
end;

procedure TfrmMain.dbgBrowseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.adsBrowse.FieldByName('Status').AsInteger = 0 then
    (Sender as TDBGridEh).Canvas.Font.Color:= clGreen;
  if dm.adsBrowse.FieldByName('Quote_Status').AsInteger = 4 then
    (Sender as TDBGridEh).Canvas.Font.Color:= clRed;
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmMain.chkStatus0Click(Sender: TObject);
var
  dt1,dt2: TDatetime;
begin
  FindCompentOnPanel(StatusSQL);
  dt1:=IncMonth(getsystem_date(dm.aqGetDate,1),-1);
  dt2:=strtodatetime(FormatDatetime('yyyy-mm-dd',getsystem_date(dm.aqGetDate,1)) + ' 23:59:59');
  if dm.adsBrowse.Active then
  begin
    dt1:= strtodatetime(formatdatetime('yyyy-mm-dd ', dm.adsBrowse.Parameters.ParamValues['dtpk1'])+formatdatetime('HH:MM:SS', dm.adsBrowse.Parameters.ParamValues['dtpk1']));
    dt2:= strtodatetime(formatdatetime('yyyy-mm-dd ', dm.adsBrowse.Parameters.ParamValues['dtpk2'])+formatdatetime('HH:MM:SS', dm.adsBrowse.Parameters.ParamValues['dtpk2']));
    dm.adsBrowse.Close;
  end;
  dm.adsBrowse.CommandText:= NewSQL + StatusSQL;
  dm.adsBrowse.Parameters[0].Value:= dt1;
  dm.adsBrowse.Parameters[1].Value:= dt2;
  dm.adsBrowse.Parameters[2].Value:= dt1;
  dm.adsBrowse.Parameters[3].Value:= dt2;
  dm.adsBrowse.Prepared;
  dm.adsBrowse.Open;
end;

procedure TfrmMain.FindCompentOnPanel(var S:string);
var
  i:Integer;
  iControl: TControl;
begin
  S:='';
  for i:=0 to pnlBottom1.ControlCount-1 do
  begin
    iControl:= pnlBottom1.Controls[i];
    if iControl is TCheckBox then
    begin
      if (iControl as TCheckBox).Hint = 'Quote_Status' then
      begin
//        if S='' then
//          S:= (iControl as TCheckBox).Hint + '=' + IntToStr((iControl as TCheckBox).Tag)
//        else
//          S:= S+' or '+ (iControl as TCheckBox).Hint + '=' + IntToStr((iControl as TCheckBox).Tag);
        if (iControl as TCheckBox).Checked then
        begin
          if S='' then
            S:= IntToStr((iControl as TCheckBox).Tag)
          else
            S:= S+','+IntToStr((iControl as TCheckBox).Tag);
        end;
      end;
    end;
  end;
  if S<>'' then S:= ' AND Quote_Status IN('+S+')'
  else S:= ' AND Quote_Status=-1';
end;

procedure TfrmMain.N7Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if Checkvprev then
  begin
    if CheckStatus(dm.adsBrowsePaperNO.AsString,2) then
    begin
      Showmessage('已报价完成,不允许修改!');
      btnRefreshClick(nil);
      Exit;
    end;
//    if dm.adsBrowse.FieldByName('Quote_Status').AsInteger=2 then
//    begin
//      Showmessage('已报价完成,不允许修改!');
//      Exit;
//    end;
    if MessageBox(Handle,'确定编辑报价类型吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO then
      exit;
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
    try
      InputVar.Fields := 'Code/报价类型代码/110,Name/报价类型名称/251,'+
                          'Time/标准时间(分钟)/251';
      InputVar.Sqlstr :=
        'Select RKEY,Code,Name,Time FROM Data0241';
      inputvar.InPut_value:=dm.adsBrowse.FieldByName('Code').AsString;
      inputvar.KeyField:='Code';
      InputVar.AdoConn := dm.ADOConn;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        try
          with dm.aqTmp do
          begin
            Close;
            SQL.Add('UPDATE Data0242 SET Type_PTR='+frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString);
            SQL.Add(' WHERE RKEY='+dm.adsBrowse.FieldByName('RKEY').AsString);
            Execsql;
          end;
          Showmessage('操作成功!');
          btnRefreshClick(nil);
        except
          Showmessage('操作失败,请重试!');
        end;
      end;
    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free;
    end;
  end;
end;

procedure TfrmMain.UseReport(BDate,EDate: TDatetime;OP: Integer;vSQL:string);
var
  ppReport:TppReport;
  ppDesigner:TppDesigner;
  iQuo_Status: integer;
begin
  frmReports:= TfrmReports.Create(Application);
  with frmReports do
  begin
    ppReport:= ppReport1;
    ppDesigner:= ppDesigner1;
    adsRpt.Close;
    adsRpt.Filter:='';  
    adsRpt.Parameters[0].Value:= BDate;
    adsRpt.Parameters[1].Value:= EDate;
    if OP=0 then iQuo_Status := -1
    else
    case frmRptCondition.cbStatus.ItemIndex of
      0: iQuo_Status := 2;    //已完成
      1: iQuo_Status := 255;  //已取消
      2: iQuo_Status := -1;   //全部
    else
      iQuo_Status := -1;
    end;
    adsRpt.Parameters[2].Value:= iQuo_Status;
    adsRpt.Parameters[3].Value:= iQuo_Status;
    adsRpt.Parameters[4].Value:= BDate;
    adsRpt.Parameters[5].Value:= EDate;

    adsRpt.Open;
    adsRpt.Filter:= vSQL;
    try
      adsRpt493.Close;
      adsRpt493.Open;
      ppReport.Reset;
      ppReport.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'BJSX.rtm';
      ppReport.Template.LoadFromFile;
      if OP = 1 then
      begin
        ppReport.SaveAsTemplate:= False;
        ppReport.Print;
      end
      else
      if OP = 0 then
      begin
        ppReport.SaveAsTemplate:= True;
        ppDesigner.ShowModal;
      end
      else
      begin
        MessageDlg('未知操作!',  mtWarning, [mbOK], 0);
        Abort;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmMain.MI1Click(Sender: TObject);
begin
  UseReport(Now-7,Now,0);
end;

procedure TfrmMain.MI2Click(Sender: TObject);
var
  vSQL:string;
begin
  frmRptCondition:= TfrmRptCondition.Create(Application);
  try
    with frmRptCondition do
    begin
      dtpk1.Datetime:=Now-3;
      dtpk2.Datetime:=Now;
    end;
    if frmRptCondition.ShowModal = mrok then
    begin
      if frmRptCondition.Edit1.Text<>'' then vSQL:= '客户简称 like ''%'+frmRptCondition.Edit1.Text+'%''';
      if frmRptCondition.Edit2.Text<>'' then
      begin
        if vSQL='' then
          vSQL:= '报价类型='''+frmRptCondition.Edit2.Text+''''
        else
          vSQL:= vSQL+' AND 报价类型='''+frmRptCondition.Edit2.Text+'''';
      end;
      if frmRptCondition.Edit3.Text<>'' then
      begin
        if vSQL='' then
          vSQL:= '业务员='''+frmRptCondition.Edit3.Text+''''
        else
          vSQL:= vSQL+' AND 业务员='''+frmRptCondition.Edit3.Text+'''';
      end;
      if frmRptCondition.Edit4.Text<>'' then
      begin
        if vSQL='' then
          vSQL:= '报价员='''+frmRptCondition.Edit4.Text+''''
        else
          vSQL:= vSQL+' AND 报价员='''+frmRptCondition.Edit4.Text+'''';
      end;
//      Showmessage(vSQL);
      UseReport(strtodatetime(formatdatetime('yyyy-mm-dd ',frmRptCondition.dtpk1.Date)+formatdatetime('HH:mm:ss',frmRptCondition.dtpk3.Time)),
                strtodatetime(formatdatetime('yyyy-mm-dd ',frmRptCondition.dtpk2.Date)+formatdatetime('HH:mm:ss',frmRptCondition.dtpk4.Time)),1,vSQL);
    end;
  finally
    frmRptCondition.free;
  end;
end;

procedure TfrmMain.N8Click(Sender: TObject);
begin
  if StrToInt(vprev) = 4 then
  begin
    if CheckStatus(dm.adsBrowsePaperNO.AsString,2) then
    begin
      Showmessage('已报价完成,不允许取消!');
      btnRefreshClick(nil);
      Abort;
    end;
//    if dm.adsBrowse.FieldByName('Quote_Status').AsInteger=2 then
//    begin
//      ShowMessage('已报价完成,不允许取消!');
//      Abort;
//    end;

//    if MessageBox(Handle, '此操作不可逆,确定取消吗?', '提示', MB_OKCANCEL +
//      MB_ICONQUESTION) = IDOK then
//    begin
    pnlNotes.Visible:= not pnlNotes.Visible;
    lblNotes.Caption:= '取消原因:';
    mmNotes.Text:= dm.adsBrowse.FieldByName('CancelReason').AsString;
//      dm.ADOConn.BeginTrans;
//      try
//        with dm.aqTmp do
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Text:= 'update Data0242 set status=255,Quote_Status=255 where rkey=' + dm.adsBrowseRKEY.AsString;
//          ExecSQL;
//        end;
//        dm.ADOConn.CommitTrans;
//        ShowMessage('取消成功!');
//        btnRefreshClick(nil);
//      except
//        dm.ADOConn.RollbackTrans;
//        ShowMessage('取消失败!');
//      end;
//    end;
  end;
end;

procedure TfrmMain.sbtnNOClick(Sender: TObject);
begin
  pnlNotes.Visible:= False;
end;

procedure TfrmMain.sbtnYESClick(Sender: TObject);
begin
  if lblNotes.Caption= '退回原因:' then
  begin
    dm.ADOConn.BeginTrans;
    try
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'update Data0242 set status=0,FinishTime=null where rkey=' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
      end;
      //退回需将更新下载时间为空
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= Format('UPDATE Data0243 SET DownloadTime=NULL,FirstDownloadBy_PTR=NULL WHERE PTR_242=%d AND SeqNO IN(Select Max(SeqNo) From Data0243 Where PTR_242=%d)',
                          [dm.adsBrowseRKEY.AsInteger,dm.adsBrowseRKEY.AsInteger]);
        ExecSQL;
      end;
      //短信通知创建者
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'INSERT DATA0014(MESSAGE,whosend)'+#13
                  +'values(''报价时效单:'+dm.adsBrowse.FieldByName('PaperNO').AsString+' 已退回，退回日期:'''+'+convert(varchar,getdate(),120) +'''+#13+mmNotes.text+''','+rkey73+')'+#13
                  +'DECLARE @to int'+#13
                  +'SET @to=@@Identity'+#13
                  +'INSERT DATA0314(emp_ptr,d14_ptr) SELECT t73.RKEY,@to FROM DATA0242 t242 INNER JOIN Data0073 t73 ON t242.CreateBy_PTR=t73.EMPLOYEE_PTR WHERE t242.PaperNO = '''+dm.adsBrowse.FieldByName('PaperNO').AsString+'''';
//        Showmessage(SQL.Text);
        ExecSQL;
      end;
      dm.ADOConn.CommitTrans;
      ShowMessage('退回成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('退回失败!');
    end;
  end
  else
  if lblNotes.Caption= '取消原因:' then
  begin
    dm.ADOConn.BeginTrans;
    try
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'update Data0242 set status=255,Quote_Status=255,CancelReason='''+mmNotes.text+''' where rkey=' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
      end;
      dm.ADOConn.CommitTrans;
      ShowMessage('取消成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('取消失败!');
    end;
  end
  else
    ShowMessage('未知操作');
  pnlNotes.Visible:= False;
end;

function TfrmMain.CheckStatus(vPaperNo: string; vStatus: integer): Boolean;
begin                   
  Result:= False;
  with dm.aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= 'select 1 from Data0242 where Quote_Status='+IntToStr(vStatus)+' and PaperNO=''' + vPaperNo + '''';
    Open;
  end;
  IF dm.aqTmp.RecordCount<>0 then Result:= True;
end;

procedure TfrmMain.WMhotkeyhandle(var msg: TMessage);
begin
  if msg.WParam = HotKey then
  begin
    TCantObjectDebugger.Create(self);
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  unregisterhotkey(handle,HotKey);
  DeleteAtom(HotKey);
end;

procedure TfrmMain.setCompents(status: integer);
begin
  with frmDetail do
  begin
    if status=0 then
    begin
      btnSave.Enabled:= False;
      btnLookCust.Enabled:= False;
      btnLookType.Enabled:= False;
      btnLookSales.Enabled:= False;
      btnLookCurr.Enabled:= False;
      dtCreate.Enabled:= False;
      DBCheckBox1.Enabled:= False;
      DBCheckBox2.Enabled:= False;
      DBCheckBox3.Enabled:= False;
      DBCheckBox4.Enabled:= False;
      DBEdit3.ReadOnly:= True;
      DBEdit3.Color:= clScrollBar;
      DBEdit7.ReadOnly:= True;
      DBEdit7.Color:= clScrollBar;
      DBMemo1.ReadOnly:= True;
      DBMemo1.Color:= clScrollBar;
      DBMemo2.ReadOnly:= True;
      DBMemo2.Color:= clScrollBar;
      DBComboBox1.ReadOnly:= True;
      DBComboBox1.Color:= clScrollBar;
      DBGridEh1.ReadOnly:= True;
    end
    else
    begin
      btnSave.Enabled:= True;
      btnLookCust.Enabled:= True;
      btnLookType.Enabled:= True;
      btnLookSales.Enabled:= True;
      btnLookCurr.Enabled:= True;
      dtCreate.Enabled:= True;
      DBCheckBox1.Enabled:= True;
      DBCheckBox2.Enabled:= True;
      DBCheckBox3.Enabled:= True;
      DBCheckBox4.Enabled:= True;
      DBEdit3.ReadOnly:= False;
      DBEdit3.Color:= clWindow;
      DBEdit7.ReadOnly:= False;
      DBEdit7.Color:= clWindow;
      DBMemo1.ReadOnly:= False;
      DBMemo1.Color:= clWindow;
      DBMemo2.ReadOnly:= False;
      DBMemo2.Color:= clWindow;
      DBComboBox1.ReadOnly:= False;
      DBComboBox1.Color:= clWindow;
      DBGridEh1.ReadOnly:= False;
    end;
  end;
end;

end.
