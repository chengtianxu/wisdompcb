unit uBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus, ComCtrls, ADODB, DB, Math;

type
  TfrmBrowse = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnColumn: TBitBtn;
    edtFilter: TEdit;
    lblFilter: TLabel;
    dbgBrowse: TDBGridEh;
    pmColumn: TPopupMenu;
    dtpDate: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure dbgBrowseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgBrowseTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure dbgBrowseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure dbgBrowseDblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Field_Name: String;
    PreColumn: TColumnEh;
    OrigSQL, NewSQL: String;
    function Checkvprev: Boolean;
    function DBGridRecordSize(mColumn: TColumnEh): Boolean;
    function DBGridAutoSize(mDBGrid: TDBGridEh; mOffset: Integer=20): Boolean;
    procedure Item_Click(Sender: TObject);
    procedure ViewData(OP: Byte);    
  public
    function OpenQuery(Query: TAdoQuery; Sqlstr: string): Boolean; overload;
    function OpenQuery(CName: TADOQuery; Params: array of string;
      sqlText: string=''; OpenType: Byte=0):Boolean; overload;
  end;

var
  frmBrowse: TfrmBrowse;
  USERRKEY: string;
  
implementation

{$R *.dfm}

uses uDM, common, condition, uChooseWO, uDetail;

procedure TfrmBrowse.FormCreate(Sender: TObject);
begin
{$IFDEF Release}
  if not App_init_2(DM.adoConn) then
  begin
    Showmessage('程序启动失败，请联系管理员！');
    Application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  DM.adoConn.Connected:= False;
  DM.adoConn.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='1597';
{$ENDIF}
  self.caption:= Application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
end;

procedure TfrmBrowse.FormShow(Sender: TObject);
var
  i: Byte;
  item: TMenuItem;
begin
  if DM.adoConn.Connected then
  begin
    if OpenQuery(DM.aqTmp,'select EMPLOYEE_PTR from data0073 where rkey='+rkey73) then
      USERRKEY := DM.aqTmp.fieldbyname('employee_ptr').asstring;
    DM.adsBrowse.Close;
    DM.adsBrowse.Parameters.ParamByName('dtpk1').Value:= getsystem_date(DM.aqTmp,1);
    DM.adsBrowse.Parameters.ParamByName('dtpk2').Value:= getsystem_date(DM.aqTmp,1) + 1;
    DM.adsBrowse.Prepared;
    DM.adsBrowse.Open;
    DBGridAutoSize(dbgBrowse);
    OrigSQL:= DM.adsBrowse.CommandText;
    NewSQL:= DM.adsBrowse.CommandText;
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

procedure TfrmBrowse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmBrowse.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBrowse.btnRefreshClick(Sender: TObject);
var
  rkey:integer;
begin
  rkey:= DM.adsBrowseRKEY.Value;
  DM.adsBrowse.Close;
  DM.adsBrowse.Open;
  DBGridAutoSize(dbgBrowse);
  if ((rkey>0) and (DM.adsBrowse.RecordCount>0)) then DM.adsBrowse.Locate('rkey',rkey,[]);
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
                         DM.adsBrowse.Parameters.ParamValues['dtpk1']));
    dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         DM.adsBrowse.Parameters.ParamValues['dtpk2']-1));
    if ShowModal = mrok then
    begin
      with DM.adsBrowse do
      begin
        close;
        CommandText:= OrigSQL;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
          CommandText:= CommandText + frmCondition.SGrid1.Cells[2,i] + #13;
        Parameters.ParamValues['dtpk1']:= strtodate(formatdatetime('yyyy-mm-dd ',dtpk1.Date));
        Parameters.ParamValues['dtpk2']:= strtodate(formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
        Prepared;
        open;
        DBGridAutoSize(dbgBrowse);
        NewSQL:= CommandText;
      end;
    end;
  end;
end;

procedure TfrmBrowse.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmBrowse.dbgBrowseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((DM.dsBrowse.DataSet as TADODataSet).CommandText, mtInformation, [mbOK], 0);
end;

procedure TfrmBrowse.dbgBrowseTitleClick(Column: TColumnEh);
begin
  IF DM.dsBrowse.DataSet.Active then
  begin
    if Column.Title.SortMarker = smDownEh then  //排序
    begin
      Column.Title.SortMarker:= smUpEh;
      DM.adsBrowse.IndexFieldNames:= Column.FieldName;
    end
    else
    begin
      Column.Title.SortMarker:= smDownEh;
      DM.adsBrowse.IndexFieldNames:= Column.FieldName + ' DESC';
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
    if DM.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      dtpDate.Date := getsystem_date(DM.aqTmp,1);
      edtFilter.SendToBack;
    end
    else
    begin
      edtFilter.BringToFront;
      with DM.adsBrowse do
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

procedure TfrmBrowse.edtFilterChange(Sender: TObject);
var
  S: String;
  BDate,EDate: String;
begin
  IF DM.dsBrowse.DataSet.Active Then
  begin
    DM.adsBrowse.Filter := '';
    S:= '';
    if trim(edtFilter.text) <> '' then
    begin
      if DM.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtFilter.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtFilter.text) + '%''';
      end
      else
      if DM.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
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

    if DM.adsBrowse.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      BDate:= DateToStr(dtpDate.Date) + ' 00:00:00';
      EDate:= DateToStr(dtpDate.Date) + ' 23:59:59';
      DM.adsBrowse.Close;
      S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
      DM.adsBrowse.CommandText:= NewSQL + S;
      DM.adsBrowse.Open;
    end;
  end;
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

function TfrmBrowse.OpenQuery(Query: TAdoQuery; Sqlstr: string): Boolean;
begin
  result := true;
  try
    Query.Close;
    Query.Sql.Clear;
    Query.SQL.Add(sqlstr);
    Query.Open;
  except
    Result := false;
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

function TfrmBrowse.DBGridRecordSize(mColumn: TColumnEh): Boolean;
{ 返回记录数据网格列显示最大宽度是否成功 }
begin
  Result := False;
  if not Assigned(mColumn.Field) then Exit;
  mColumn.Field.Tag := Max(mColumn.Field.Tag,
  TDBGridEh(mColumn.Grid).Canvas.TextWidth(mColumn.Field.DisplayText));
  Result := True;
end;

procedure TfrmBrowse.dbgBrowseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  DBGridRecordSize(Column);

  //已确认的记录用颜色
  if dm.adsBrowse.FieldByName('TSTATUS').AsInteger = 1 then
    (Sender as TDBGridEh).Canvas.Font.Color:= clBlue;
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

function TfrmBrowse.DBGridAutoSize(mDBGrid: TDBGridEh; mOffset: Integer): Boolean;
{ 返回数据网格自动适应宽度是否成功 }  
var  
  I: Integer;  
begin  
  Result := False;  
  if not Assigned(mDBGrid) then Exit;  
  if not Assigned(mDBGrid.DataSource) then Exit;  
  if not Assigned(mDBGrid.DataSource.DataSet) then Exit;  
  if not mDBGrid.DataSource.DataSet.Active then Exit;  
  for I := 0 to mDBGrid.Columns.Count - 1 do
  begin
    if not mDBGrid.Columns[i].Visible then Continue;
    if Assigned(mDBGrid.Columns[i].Field) then
      mDBGrid.Columns[i].Width := Max(mDBGrid.Columns[i].Field.Tag,
        mDBGrid.Canvas.TextWidth(mDBGrid.Columns[i].Title.Caption)) + mOffset
    else mDBGrid.Columns[i].Width :=
      mDBGrid.Canvas.TextWidth(mDBGrid.Columns[i].Title.Caption)+ mOffset;
    mDBGrid.Refresh;
  end;  
  Result := True;
end;

procedure TfrmBrowse.N2Click(Sender: TObject);
begin
  if not Checkvprev then Exit;
  if (((Sender AS TMenuItem).Tag=1) and (StrToInt(vprev) <> 4)) then
  begin
    Showmessage('您没有补料的权限');
    Exit;
  end;
  frmChooseWO:= TfrmChooseWO.Create(Application);
  frmChooseWO.Init((Sender AS TMenuItem).Tag);
  frmChooseWO.ShowModal;
  if frmChooseWO.ModalResult=mrOk then
  begin
    ViewData(1);

  end;
end;

procedure TfrmBrowse.ViewData(OP: Byte);  {OP: 1新增、2编辑、3检查}
var
  rkey:integer;
begin
  if not dm.adsBrowse.Active then Abort;
  if ((op <> 1) and (dm.adsBrowse.RecordCount <= 0)) then Abort;
  if OP = 1 then
    OpenQuery(dm.aq731,['0'])
  else
    OpenQuery(dm.aq731,[dm.adsBrowse.FieldValues['RKEY']]);
  rkey:= dm.aq731RKEY.Value;

  frmDetail:= TfrmDetail.Create(Application);
  frmDetail.Init(OP);
  try
    with frmDetail do
    begin
      if OP = 3 then
      begin
        btnSave.Enabled:= False;
        SpeedButton1.Enabled:= False;
        SpeedButton2.Enabled:= False;
        DBGridEh1.ReadOnly:= True;
//        DBGridEh1.Columns[4].EditButtons[0].Visible:= False;
        DBGridEh1.Columns[5].EditButtons[0].Visible:= False;
      end
      else
      begin
        btnSave.Enabled:= True;
        SpeedButton1.Enabled:= True;
        SpeedButton2.Enabled:= True;
        DBGridEh1.ReadOnly:= False;
//        DBGridEh1.Columns[4].EditButtons[0].Visible:= True;
        DBGridEh1.Columns[5].EditButtons[0].Visible:= True;
      end;
    end;
    if frmDetail.ShowModal = mrok then
    begin
      btnRefreshClick(nil);
      if OP=1 then  //定位到新增行
      begin
        if dm.aq731.Active then
          dm.adsBrowse.Locate('rkey',dm.aq731.FieldByName('rkey').AsInteger,[]);
      end;
    end
    else
      dm.aq731.Locate('rkey',rkey,[]);
  finally
    if Assigned(frmDetail) then frmDetail.Free;
  end;
end;

procedure TfrmBrowse.N4Click(Sender: TObject);
begin
  if not Checkvprev then Exit;
  ViewData(2);
end;

procedure TfrmBrowse.N5Click(Sender: TObject);
begin
  ViewData(3);
end;

procedure TfrmBrowse.N7Click(Sender: TObject);
begin
  if StrToInt(vprev) <> 4 then
  begin
    Showmessage('您没有确认的权限');
    Exit;
  end;
  try
    if messagedlg('是否继续？', mtconfirmation, [mbyes, mbno],0) = mryes then
    begin
      OpenQuery(dm.aqTmp, [USERRKEY,dm.adsBrowse.FieldByName('RKEY').AsString],
                'UPDATE Data0731 SET confirm_ptr= :RKEY05 ,confirm_time=GETDATE(),TSTATUS=1 WHERE TSTATUS=0 AND RKEY= :RKEY731',1);
      Showmessage('确认成功');
      btnRefreshClick(nil);
    end;                   
  except
    Showmessage('确认失败');
  end;
end;

procedure TfrmBrowse.N8Click(Sender: TObject);
begin
  if StrToInt(vprev) <> 4 then
  begin
    Showmessage('您没有反确认的权限');
    Exit;
  end;
  OpenQuery(dm.aqTmp, [dm.adsBrowse.FieldByName('RKEY').AsString],
            'SELECT 1 FROM Data0732 WHERE qg_flag=1 AND rkey731= :RKEY731',0);
  if dm.aqTmp.RecordCount<>0 then
  begin
    Showmessage('明细中存在已切割的作业单,不允许操作');
    Exit;
  end;
  try
    OpenQuery(dm.aqTmp, [dm.adsBrowse.FieldByName('RKEY').AsString],
              'UPDATE Data0731 SET confirm_ptr= NULL ,confirm_time=NULL,TSTATUS=0 WHERE TSTATUS=1 AND RKEY= :RKEY731',1);
    Showmessage('反确认成功');
    btnRefreshClick(nil);
  except
    Showmessage('反确认失败');
  end;
end;

procedure TfrmBrowse.N10Click(Sender: TObject);
begin
  if StrToInt(vprev) <> 4 then
  begin
    Showmessage('您没有删除的权限');
    Exit;
  end;
  if dm.adsBrowse.FieldByName('TSTATUS').AsInteger=1 then
  begin
    Showmessage('已确认不允许删除');
    Exit;
  end;
  OpenQuery(dm.aqTmp, [dm.adsBrowse.FieldByName('rkey').AsString], 'SELECT 1 FROM Data0732 WHERE qg_flag=1 AND rkey731= :RKEY731',0);
  if dm.aqTmp.RecordCount<>0 then
  begin
    Showmessage('已切割不允许删除');
    Exit;
  end;
  dm.adoConn.BeginTrans;
  try
    if dm.adsBrowse.FieldByName('TTYPE').AsInteger=0 then
      OpenQuery(dm.aqTmp, [dm.adsBrowse.FieldByName('rkey').AsString],
                'UPDATE t6 SET ENGG_PROD_FLAG=0 FROM Data0006 t6 INNER JOIN DATA0732 t732 ON t6.RKEY=t732.rkey06 WHERE t6.ENGG_PROD_FLAG=1 AND t732.rkey731= :RKEY731',1);
    OpenQuery(dm.aqTmp, [dm.adsBrowse.FieldByName('rkey').AsString], 'DELETE Data0732 WHERE rkey731= :RKEY731',1);
    OpenQuery(dm.aqTmp, [dm.adsBrowse.FieldByName('rkey').AsString], 'DELETE Data0731 WHERE rkey= :RKEY',1);
    dm.adoConn.CommitTrans;
    btnRefreshClick(nil);
  except
    on E:Exception do
    begin
      Showmessage(E.Message+#13+'请重试!');
      if dm.adoConn.InTransaction then dm.adoConn.RollbackTrans;
    end;
  end;
end;

procedure TfrmBrowse.PopupMenu1Popup(Sender: TObject);
begin
  case dm.adsBrowse.FieldByName('TSTATUS').AsInteger of
  0:begin
      N4.Enabled:=True;
      N7.Enabled:=True;
      N8.Enabled:=False;
    end;
  1:begin
      N4.Enabled:=False;
      N7.Enabled:=False;
      N8.Enabled:=True;
    end;
  else
    N4.Enabled:=False;  
    N7.Enabled:=False;
    N8.Enabled:=False;
  end;
end;

procedure TfrmBrowse.dbgBrowseDblClick(Sender: TObject);
begin
  ViewData(3);
end;

procedure TfrmBrowse.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((DM.dsBrowse1.DataSet as TADOQuery).SQL.Text, mtInformation, [mbOK], 0);
end;

end.
