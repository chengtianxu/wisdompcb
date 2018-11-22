unit Browse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, DB, ADODB,
  Menus;

type
  TfrmBrowse = class(TForm)
    pnlClient: TPanel;
    pnlTop: TPanel;
    lblFilter: TLabel;
    dtpDate: TDateTimePicker;
    edtFilter: TEdit;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnColumn: TBitBtn;
    benDefined: TBitBtn;
    dbgBrowse: TDBGridEh;
    pmColumn: TPopupMenu;
    dmDesignRpt: TPopupMenu;
    MI1: TMenuItem;
    pnlBottom: TPanel;
    rgStatus: TRadioGroup;
    pmOp: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure benDefinedClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure dbgBrowseTitleClick(Column: TColumnEh);
    procedure dbgBrowseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgStatusClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure pmOpPopup(Sender: TObject);
  private
    Field_Name: String;
    PreColumn: TColumnEh;  
    OrigSQL, NewSQL: String;
    function Checkvprev: Boolean;
    procedure ViewData(OP: Byte);
    procedure Item_Click(Sender: TObject);
  public
    YY: Byte;  {1新增、2编辑、3检查}
    function OpenQuery(CName: TADOQuery; Params: array of string;
      sqlText: string=''; OpenType: Byte=0):Boolean;
  end;

var
  frmBrowse: TfrmBrowse;
  USERRKEY: string;
  
implementation

uses common, damo, condition, Detail;

{$R *.dfm}

{ TfrmBrowse }

procedure TfrmBrowse.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConn) then
  begin
    showmsg('程序启动失败，请联系管理员！',1);
    application.Terminate;
  end;


//  dm.ADOConn.Connected:= False;
//  dm.ADOConn.Connected:= True;
//  vprev:= '4';  //4写银
//  rkey73:='136';


  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
end;

procedure TfrmBrowse.FormShow(Sender: TObject);
var
  i: Byte;
  item: TMenuItem;
begin
  if dm.ADOConn.Connected then
  begin
    OpenQuery(dm.aqTmp,[],'select EMPLOYEE_PTR from data0073 where rkey='+rkey73);
    USERRKEY := dm.aqTmp.fieldbyname('employee_ptr').asstring;
    dm.adsBrowse.Close;
    dm.adsBrowse.Parameters.ParamByName('dtpk1').Value:= getsystem_date(dm.aqTmp,1);
    dm.adsBrowse.Parameters.ParamByName('dtpk2').Value:= getsystem_date(dm.aqTmp,1) + 1;
    dm.adsBrowse.Prepared;
    dm.adsBrowse.Open;
    OrigSQL:= dm.adsBrowse.CommandText;
    NewSQL:= dm.adsBrowse.CommandText;
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

function TfrmBrowse.Checkvprev: Boolean;
begin
  {1:只读; 2:可写; 3:读银; 4:写银}
  Result:= True;
  if (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Result:= False;
  end;
end;

procedure TfrmBrowse.Item_Click(Sender: TObject);
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

function TfrmBrowse.OpenQuery(CName: TADOQuery; Params: array of string;
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
        if Parameters.Count = Length(Params) then
        begin
          for i:= 0 to Parameters.Count-1 do
            Parameters[i].Value:= Params[i];
        end
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

procedure TfrmBrowse.ViewData(OP: Byte);
var
  rkey:integer;
begin
  if not dm.adsBrowse.Active then Abort;
  if ((op <> 1) and (dm.adsBrowse.RecordCount <= 0)) then Abort;
  YY:= OP;
  if OP = 1 then
    OpenQuery(dm.aq98,['0'])
  else
    OpenQuery(dm.aq98,[dm.adsBrowse.FieldValues['RKEY']]);
  rkey:= dm.aq98RKEY.Value;

  frmDetail:= TfrmDetail.Create(Application);
  try
    with frmDetail do
    begin
      if OP = 3 then
        btnSave.Enabled:= False
      else
        btnSave.Enabled:= True;
    end;
    if frmDetail.ShowModal = mrok then
      btnRefreshClick(nil)
    else
      dm.aq98.Locate('rkey',rkey,[]);
  finally
    frmDetail.Free;
  end;
end;

procedure TfrmBrowse.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBrowse.btnRefreshClick(Sender: TObject);
var
  rkey:integer;
begin
  rkey:= dm.adsBrowseRKEY.Value;
  dm.adsBrowse.Close;
  dm.adsBrowse.Open;
  if rkey>0 then dm.adsBrowse.Locate('rkey',rkey,[]);
end;

procedure TfrmBrowse.btnExportClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgBrowse, self.Caption);
end;

procedure TfrmBrowse.btnQueryClick(Sender: TObject);
var
  i:byte;
begin
  with frmCondition do
  begin
    dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         dm.adsBrowse.Parameters.ParamValues['dtpk1']));
    dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         dm.adsBrowse.Parameters.ParamValues['dtpk2']-1));
    if ShowModal = mrok then
    begin
      with dm.adsBrowse do
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

procedure TfrmBrowse.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmBrowse.benDefinedClick(Sender: TObject);
begin
  dmDesignRpt.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TfrmBrowse.edtFilterChange(Sender: TObject);
var
  S: String;
  BDate,EDate: String;
begin
  IF dm.dsBrowse.DataSet.Active Then
  begin
    DM.adsBrowse.Filter := '';
    S:= '';
    if rgStatus.ItemIndex <> 0 then
    begin
      S:= ' RMA_STATUS = ' + inttostr(rgStatus.ItemIndex);
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
          ShowMessage('输入的内容不符，请输入数字！');
        end;
      end;
    end;
    DM.adsBrowse.Filter:= S;

    if dm.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      BDate:= DateToStr(dtpDate.Date) + ' 00:00:00';
      EDate:= DateToStr(dtpDate.Date) + ' 23:59:59';
      dm.adsBrowse.Close;
      if rgStatus.ItemIndex <> 0 then
        S:= ' and RMA_STATUS = ' + inttostr(rgStatus.ItemIndex) +
            ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +''''
      else
        S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
      dm.adsBrowse.CommandText:= NewSQL + S;
      dm.adsBrowse.Open;
    end;
  end;
end;

procedure TfrmBrowse.dtpDateChange(Sender: TObject);
begin
  edtFilterChange(edtFilter);
end;

procedure TfrmBrowse.dbgBrowseTitleClick(Column: TColumnEh);
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
      dtpDate.Date := getsystem_date(dm.aqTmp,1);
      edtFilter.SendToBack;
    end
    else
    begin
      edtFilter.BringToFront;
      with dm.adsBrowse do
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

procedure TfrmBrowse.dbgBrowseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((dm.dsBrowse.DataSet as TADODataSet).CommandText, mtInformation, [mbOK], 0);
end;

procedure TfrmBrowse.rgStatusClick(Sender: TObject);
begin
  edtFilterChange(edtFilter);
end;

procedure TfrmBrowse.N1Click(Sender: TObject);
begin
  if Checkvprev then  //新增
    ViewData(1);
end;

procedure TfrmBrowse.N2Click(Sender: TObject);
begin
  if Checkvprev then  //编辑
    ViewData(2);
end;

procedure TfrmBrowse.N3Click(Sender: TObject);
begin
  ViewData(3);  //检查
end;

procedure TfrmBrowse.N4Click(Sender: TObject);
begin
  if Checkvprev then  //提交
  begin
    dm.ADOConn.BeginTrans;
    try
      OpenQuery(dm.aqTmp,[dm.adsBrowseRKEY.AsString],
        'update Data0098 set RMA_STATUS = 2 where RMA_STATUS = 1 and rkey = :rkey98',1);
      dm.ADOConn.CommitTrans;
      ShowMessage('提交成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('提交失败!');
    end;
  end;    
end;

procedure TfrmBrowse.N5Click(Sender: TObject);
begin
  if Checkvprev then  //取消提交
  begin
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select * from data0416 where so_ptr='+dm.adsBrowserkey70.Text;
      Open;
      if not IsEmpty then
      begin
        showmsg('此退货已入仓，不允许取消提交!',1);
        btnRefreshClick(Sender);
        Exit;
      end;
    end;
    dm.ADOConn.BeginTrans;
    try
      OpenQuery(dm.aqTmp,[dm.adsBrowseRKEY.AsString],
        'update Data0098 set RMA_STATUS = 1 where RMA_STATUS = 2 and rkey = :rkey98',1);
      dm.ADOConn.CommitTrans;
      ShowMessage('取消提交成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('取消提交失败!');
    end;
  end;
end;

procedure TfrmBrowse.N6Click(Sender: TObject);
begin
  if Checkvprev then
  begin
    if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
      exit;
    dm.ADOConn.BeginTrans;
    try
      //更新WZCP0063中的退货数
      frmBrowse.OpenQuery(dm.aqTmp,[CurrToStr(dm.adsBrowseQTY_AUTH.AsCurrency),
                                    dm.aq98SO_SHIP_PTR.AsString],
      'Update t63 Set returen_qty = t63.returen_qty - :Qnty'+#13+
      'From WZCP0063 t63 INNER JOIN Data0098 t98 ON t63.rkey= t98.SO_SHIP_PTR'+#13+
      'Where t98.SO_SHIP_PTR = :rkey63',1);

      OpenQuery(dm.aqTmp,[dm.adsBrowseRKEY.AsString],
        'delete from Data0098 where RMA_STATUS = 1 and rkey = :rkey98',1);
      dm.ADOConn.CommitTrans;
      ShowMessage('删除成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('删除失败!');
    end;
  end;
end;

procedure TfrmBrowse.pmOpPopup(Sender: TObject);
begin
  if dm.adsBrowse.IsEmpty then
  begin
    N2.Enabled:= False;     //编辑
    N3.Enabled:= False;     //检查
    N4.Enabled:= False;     //提交
    N5.Enabled:= False;     //取消提交
    N6.Enabled:= False;     //删除
  end
  else
  begin
    N3.Enabled:= True;
    case dm.adsBrowseRMA_STATUS.Value of
    1:begin  //未提交
       N2.Enabled:= True;
       N4.Enabled:= True;
       N5.Enabled:= False;
       N6.Enabled:= True;
      end;
    2:begin  //待入仓
       N2.Enabled:= False;
       N4.Enabled:= False;
       N5.Enabled:= True;
       N6.Enabled:= False;
      end;
    else
      begin
       N2.Enabled:= False;
       N4.Enabled:= False;
       N5.Enabled:= False;
       N6.Enabled:= False;
      end;
    end;
  end;
end;

end.
