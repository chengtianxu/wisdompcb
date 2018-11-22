unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, Menus;

type
  TfrmMain = class(TForm)
    adoConn: TADOConnection;
    aqTmp: TADOQuery;
    aq97: TADOQuery;
    aq97RKEY: TAutoIncField;
    aq97PO_NUMBER: TStringField;
    aq97CUSTOMER_PTR: TIntegerField;
    aq97PO_DATE: TDateTimeField;
    aq97OPEN_SOS: TSmallintField;
    aq97flag: TStringField;
    aq97dept_ptr: TIntegerField;
    aq97file_content: TBlobField;
    aq97remark: TStringField;
    Panel2: TPanel;
    dbgBrowse: TDBGridEh;
    Panel1: TPanel;
    dsBrowse: TDataSource;
    lblFilter: TLabel;
    dtpDate: TDateTimePicker;
    edtFilter: TEdit;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnColumn: TBitBtn;
    pmColumn: TPopupMenu;
    adsBrowse: TADODataSet;
    adsBrowseRKEY: TAutoIncField;
    adsBrowsePO_NUMBER: TStringField;
    adsBrowsePO_DATE: TDateTimeField;
    adsBrowseOPEN_SOS: TSmallintField;
    adsBrowseremark: TStringField;
    adsBrowseCUST_CODE: TStringField;
    adsBrowseCUSTOMER_NAME: TStringField;
    adsBrowseABBR_NAME: TStringField;
    adsBrowseEMPLOYEE_NAME: TStringField;
    pmMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    adsBrowsefilename: TStringField;
    aq97filename: TStringField;
    N4: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure dbgBrowseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgBrowseTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure pmMenuPopup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure aq97NewRecord(DataSet: TDataSet);
  private
    Field_Name: String;
    PreColumn: TColumnEh;  
    OrigSQL, NewSQL: String;
    function Checkvprev: Boolean;
    procedure Item_Click(Sender: TObject);
    procedure ViewData(OP: Byte);
  public
    YY: Byte;  {1新增、2编辑、3检查}
    USERRKEY: String;
    function OpenQuery(Query: TAdoQuery; Sqlstr: string): boolean; overload;
    function OpenQuery(CName: TADOQuery; Params: array of string;
      sqlText: string=''; OpenType: Byte=0):Boolean; overload;
  end;

var
  frmMain: TfrmMain;
  
const
  TmpFileDir = 'c:\tmp\';

implementation

uses common, PubFunc, ShellAPI, condition, Detail;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
//{$IFDEF Release}
  if not App_init_2(adoConn) then
  begin
    Showmessage('程序启动失败，请联系管理员！');
    Application.Terminate;
  end;
//{$ENDIF}
//{$IFDEF Debug}
//  adoConn.Connected:= False;
//  adoConn.Connected:= True;
//  vprev:= '4';  //4写银
//  rkey73:='1597';
//{$ENDIF}
  self.caption:= Application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';


//  if GetServerRegion(adoConn) = '深圳' then
//  begin
//    ShowMessage('旧版已经停用，请使用新版系统，请联系ERP，谢谢');
//    application.Terminate;
//  end;  
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i: Byte;
  item: TMenuItem;
begin
  if ADOConn.Connected then
  begin
    OpenQuery(aqTmp,'select EMPLOYEE_PTR from data0073 where rkey='+rkey73);
    USERRKEY := aqTmp.fieldbyname('employee_ptr').asstring;
    adsBrowse.Close;
    adsBrowse.Parameters.ParamByName('dtpk1').Value:= getsystem_date(aqTmp,1) - 30;
    adsBrowse.Parameters.ParamByName('dtpk2').Value:= getsystem_date(aqTmp,1) + 1;
    adsBrowse.Prepared;
    adsBrowse.Open;
    OrigSQL:= adsBrowse.CommandText;
    NewSQL:= adsBrowse.CommandText;
    for i:= 1 to dbgBrowse.FieldCount do
    begin
      item:= TMenuItem.Create(self);
      item.Caption:= dbgBrowse.Columns[i-1].Title.Caption;
      if dbgBrowse.Columns[i-1].Visible then item.Checked:= true;
      item.OnClick:= Item_Click;
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
  rkey:= adsBrowseRKEY.Value;
  adsBrowse.Close;
  adsBrowse.Open;
  if ((rkey>0) and (adsBrowse.RecordCount>0)) then adsBrowse.Locate('rkey',rkey,[]);
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
    dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         adsBrowse.Parameters.ParamValues['dtpk1']));
    dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         adsBrowse.Parameters.ParamValues['dtpk2']-1));
    if ShowModal = mrok then
    begin
      with adsBrowse do
      begin
        close;
        CommandText:= OrigSQL;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
          CommandText:= CommandText + frmCondition.SGrid1.Cells[2,i] + #13;
        Parameters.ParamValues['dtpk1']:= strtodate(formatdatetime('yyyy-mm-dd ',dtpk1.Date));
        Parameters.ParamValues['dtpk2']:= strtodate(formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
        Prepared;
        open;
        NewSQL:= CommandText;
      end;
    end;
  end;
end;

procedure TfrmMain.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.dbgBrowseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((dsBrowse.DataSet as TADODataSet).CommandText, mtInformation, [mbOK], 0);
end;

procedure TfrmMain.dbgBrowseTitleClick(Column: TColumnEh);
begin
  IF dsBrowse.DataSet.Active then
  begin
    if Column.Title.SortMarker = smDownEh then  //排序
    begin
      Column.Title.SortMarker:= smUpEh;
      adsBrowse.IndexFieldNames:= Column.FieldName;
    end
    else
    begin
      Column.Title.SortMarker:= smDownEh;
      adsBrowse.IndexFieldNames:= Column.FieldName + ' DESC';
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
    if adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      dtpDate.Date := getsystem_date(aqTmp,1);
      edtFilter.SendToBack;
    end
    else
    begin
      edtFilter.BringToFront;
      with adsBrowse do
      begin
        Close;
        CommandText:= NewSQL;
        Open;
      end;
    end;
  end
  else
    ShowMessage('没有打开数据，请按: 查询');
end;

procedure TfrmMain.Item_Click(Sender: TObject);
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

procedure TfrmMain.edtFilterChange(Sender: TObject);
var
  S: String;
  BDate,EDate: String;
begin
  IF dsBrowse.DataSet.Active Then
  begin
    adsBrowse.Filter := '';
    S:= '';
    if trim(edtFilter.text) <> '' then
    begin
      if adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtFilter.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtFilter.text) + '%''';
      end
      else
      if adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
      begin
        try
          StrToInt(edtFilter.Text);
          if S = '' then
            S:= Field_Name + ' = ' + trim(edtFilter.text)
          else
            S:= S + ' and ' + Field_Name+' = ' + trim(edtFilter.text);
        except
          ShowMessage('输入的内容不符，请输入数字！');
        end;
      end;
    end;
    adsBrowse.Filter:= S;

    if adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      BDate:= DateToStr(dtpDate.Date) + ' 00:00:00';
      EDate:= DateToStr(dtpDate.Date) + ' 23:59:59';
      adsBrowse.Close;
      S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
      adsBrowse.CommandText:= NewSQL + S;
      adsBrowse.Open;
    end;
  end;
end;

procedure TfrmMain.dtpDateChange(Sender: TObject);
begin
  edtFilterChange(edtFilter);
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

procedure TfrmMain.ViewData(OP: Byte);
var
  rkey,i: integer;
begin
  if OP<>3 then
  begin
    if (not Checkvprev) then Abort;
  end;
  if not adsBrowse.Active then Abort;
  if ((op <> 1) and (adsBrowse.RecordCount <= 0)) then Abort;
  YY:= OP;
  if OP in [1,4] then  //新增，复制
    OpenQuery(aq97,['0'])
  else
    OpenQuery(aq97,[adsBrowse.FieldValues['RKEY']]);
  rkey:= aq97RKEY.Value;
  if OP in [2,3] then  //编辑，检查
    OpenQuery(aqTmp,[aq97.FieldValues['CUSTOMER_PTR']],'select CUST_CODE,CUSTOMER_NAME,abbr_name from data0010 where rkey = :rkey');
  frmDetail:= TfrmDetail.Create(Application);
  try
    with frmDetail do
    begin
//      Panel1.Enabled:= True;
//      btnSave.Enabled:= True;
      SetComponent(True,False);
      case OP of
        1:
        begin
          Caption := '新增';
          if not (aq97.State in [dsInsert]) then aq97.Insert;
          dtpDate.Date:= Now;
        end;
        2:
        begin
          Caption := '编辑';
          if not (aq97.State in [dsEdit]) then aq97.Edit;
          Edit1.Tag:= aq97CUSTOMER_PTR.Value;
          Edit1.Text:= aqTmp.FieldValues['CUST_CODE'];
          lblCustName.Caption:= aqTmp.FieldValues['CUSTOMER_NAME'];
        end;
        3:
        begin
          Caption := '检查';
          SetComponent(False,True);
//          Panel1.Enabled:= False;
//          btnSave.Enabled:= False;
          Edit1.Tag:= aq97CUSTOMER_PTR.Value;
          Edit1.Text:= aqTmp.FieldValues['CUST_CODE'];
          lblCustName.Caption:= aqTmp.FieldValues['CUSTOMER_NAME'];
        end;
        4:
        begin
          Caption := '复制';
          if not (aq97.State in [dsInsert]) then aq97.Insert;
          OpenQuery(aqTmp,[adsBrowse.FieldValues['RKEY']],
                    'select PO_NUMBER,PO_DATE,OPEN_SOS,flag,dept_ptr,file_content,remark,filename from Data0097 where rkey = :rkey');
          with aqTmp do
          begin
            for i:=0 to FieldCount-1 do
              aq97.FieldByName(aqTmp.Fields[i].FieldName).Value:= aqTmp.Fields[i].Value;
            dtpDate.DateTime:= aq97.FieldByName('PO_DATE').AsDateTime;
          end;
        end;
      else
        Caption := '';
      end;
    end;
    if frmDetail.ShowModal = mrok then
      btnRefreshClick(nil)
    else
      aq97.Locate('rkey',rkey,[]);
  finally
    frmDetail.Free;
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  ViewData((Sender as TMenuItem).Tag);
end;

function TfrmMain.OpenQuery(Query: TAdoQuery; Sqlstr: string): boolean;
begin
  result := true;
  try
    Query.Close;
    Query.Sql.Clear;
    Query.SQL.Add(sqlstr);
    Query.Open;
  except
    result := false;
  end;
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

procedure TfrmMain.N5Click(Sender: TObject);
var
  f:string;
  fs: TMemoryStream;
begin
  OpenQuery(aqTmp,[adsBrowse.FieldValues['RKEY']],
           'select filename,file_content from data0097 where (file_content is not null) and rkey = :rkey',0);
  if aqTmp.RecordCount=0 then
  begin
    ShowMessage('文档未上传');
    Abort;
  end;
  fs := TMemoryStream.Create;
  TBlobfield(aqTmp.fieldbyname('file_content')).SaveToStream(fs);
  UnPackStream(fs);
  if not DirectoryExists(TmpFileDir) then
    if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
  f:=TmpFileDir+aqTmp.fieldbyname('filename').AsString;
  fs.SaveToFile(f);
  fs.Free;
  ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmMain.pmMenuPopup(Sender: TObject);
begin
  if adsBrowse.IsEmpty then
  begin
    N2.Enabled:= False;     //编辑
    N3.Enabled:= False;     //检查
    N4.Enabled:= False;     //删除
    N5.Enabled:= False;     //打开文档
  end
  else
  begin
    N2.Enabled:= True;
    N3.Enabled:= True;
    N4.Enabled:= True;
    if adsBrowse.FieldByName('filename').AsString='' then
      N5.Enabled:= False
    else
      N5.Enabled:= True;
  end;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  if Checkvprev then
  begin
    if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
      exit;
    ADOConn.BeginTrans;
    try
      with aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'delete from Data0097 where rkey=' + adsBrowseRKEY.AsString;
        ExecSQL;
      end;
      ADOConn.CommitTrans;
      ShowMessage('删除成功!');
      btnRefreshClick(nil);
    except
      ADOConn.RollbackTrans;
      ShowMessage('删除失败!');
    end;
  end;
end;

procedure TfrmMain.aq97NewRecord(DataSet: TDataSet);
begin
  aq97.FieldByName('OPEN_SOS').AsInteger:= 0;
end;

end.
