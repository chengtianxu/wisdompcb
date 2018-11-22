unit Contract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, DB, ADODB,
  Menus, ComObj, ppReport, ppEndUsr;

type
  TfrmContract = class(TForm)
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
    N4: TMenuItem;
    N9: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    N8: TMenuItem;
    pmToExcel: TPopupMenu;
    MenuItem1: TMenuItem;
    N12: TMenuItem;
    aspExcel: TADOStoredProc;
    aspExcelContractNo: TStringField;
    aspExcelCust_Id: TStringField;
    aspExcelABBR_NAME: TStringField;
    aspExcelSalesMan: TStringField;
    aspExcelRFQNo: TStringField;
    aspExcelTPOType: TStringField;
    aspExcelPartsId: TStringField;
    aspExcelLayers: TWordField;
    aspExcelSetSizeX: TStringField;
    aspExcelSetSizeY: TStringField;
    aspExcelPCS_SET: TStringField;
    aspExcelLAM2: TStringField;
    aspExcelBoardThick: TStringField;
    aspExcelSurfaceDeal: TStringField;
    aspExcelWCCPTH: TStringField;
    aspExcelNCCPTH: TStringField;
    aspExcelQnty: TIntegerField;
    aspExcelDueArea: TBCDField;
    aspExcelPrice: TBCDField;
    aspExcelEngAmount: TBCDField;
    aspExcelTestAmount: TBCDField;
    aspExcelOtherAmount: TBCDField;
    aspExcelDiscount: TBCDField;
    aspExcelAftDiscountAmount: TBCDField;
    aspExcelContractAmt: TBCDField;
    aspExcelCURR_CODE: TStringField;
    aspExcelDueDays: TWordField;
    aspExcelNotes: TStringField;
    aspExcelTFlag: TStringField;
    aspExcelFileName: TStringField;
    btnSet: TBitBtn;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    mniN16: TMenuItem;
    mniN17: TMenuItem;
    mniN18: TMenuItem;
    pcs1: TMenuItem;
    PCB21: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure benDefinedClick(Sender: TObject);
    procedure MI1Click(Sender: TObject);
    procedure dbgBrowseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgBrowseTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure pmOpPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure dbgBrowseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mniN17Click(Sender: TObject);
    procedure mniN18Click(Sender: TObject);
    procedure pcs1Click(Sender: TObject);
    procedure PCB21Click(Sender: TObject);
  private
    Field_Name: String;
    PreColumn: TColumnEh;  
    OrigSQL, NewSQL: String;
    function Checkvprev: Boolean;
    procedure ViewData(OP: Byte);
    procedure Item_Click(Sender: TObject);
    procedure AuditData(OP: Byte);
  public
    YY: Byte;  {1新增、2编辑、3检查}
    procedure UseReport(RKEY167, OP: Integer; RFQNO: string=''; rptNo: Byte=0);  //OP: 0设计; 1打印;
    function OpenQuery(CName: TADOQuery; Params: array of string;
      sqlText: string=''; OpenType: Byte=0):Boolean;
  end;

var
  frmContract: TfrmContract;
  USERRKEY: string;

implementation

uses damo, common, condition, Detail, SetItem, Reports;

{$R *.dfm}

procedure TfrmContract.FormCreate(Sender: TObject);
begin
{$IFDEF Release}
  if not App_init_2(dm.ADOConn) then
  begin
    showmsg('程序启动失败，请联系管理员！',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  dm.ADOConn.Connected:= False;
  dm.ADOConn.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='1597';
{$ENDIF}
  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
end;

procedure TfrmContract.FormShow(Sender: TObject);
var
  i: Byte;
  item: TMenuItem;
begin
  if dm.ADOConn.Connected then
  begin
    OpenQuery(dm.aqTmp,[],'select EMPLOYEE_PTR from data0073 where rkey='+rkey73);
    USERRKEY := dm.aqTmp.fieldbyname('employee_ptr').asstring;
    dm.adsBrowse.Close;
    dm.adsBrowse.Parameters.ParamByName('dtpk1').Value:= getsystem_date(dm.aqGetDate,1);
    dm.adsBrowse.Parameters.ParamByName('dtpk2').Value:= getsystem_date(dm.aqGetDate,1) + 1;
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
  if StrToInt(vprev) = 4 then rgStatus.ItemIndex:=1 else rgStatus.ItemIndex:= 0;
  rgStatusClick(nil);
end;

procedure TfrmContract.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmContract.btnRefreshClick(Sender: TObject);
var
  rkey:integer;
begin
  rkey:= dm.adsBrowseRKEY.Value;
  dm.adsBrowse.Close;
  dm.adsBrowse.Open;
  if ((rkey>0) and (dm.adsBrowse.RecordCount>0)) then dm.adsBrowse.Locate('rkey',rkey,[]);
end;

procedure TfrmContract.btnExportClick(Sender: TObject);
begin
  pmToExcel.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TfrmContract.btnQueryClick(Sender: TObject);
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

procedure TfrmContract.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmContract.benDefinedClick(Sender: TObject);
begin
  dmDesignRpt.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TfrmContract.MI1Click(Sender: TObject);
begin
  UseReport(dm.adsBrowseRKEY.Value, 0, '', (Sender as TMenuItem).Tag);
end;

procedure TfrmContract.dbgBrowseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((dm.dsBrowse.DataSet as TADODataSet).CommandText, mtInformation, [mbOK], 0);
end;

procedure TfrmContract.dbgBrowseTitleClick(Column: TColumnEh);
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
        CommandText:= NewSQL;
        Open;
      end;
    end;
  end
  else
    ShowMessage('没有打开数据，请按: 查询');
end;

procedure TfrmContract.edtFilterChange(Sender: TObject);
var
  S: String;
  BDate,EDate: String;
begin
  IF dm.dsBrowse.DataSet.Active Then
  begin
    DM.adsBrowse.Filter := '';
    S:= '';
    if rgStatus.ItemIndex <> 4 then
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
      if rgStatus.ItemIndex <> 4 then
        S:= ' and Status = ' + inttostr(rgStatus.ItemIndex) +
            ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +''''
      else
        S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
      dm.adsBrowse.CommandText:= NewSQL + S;
      dm.adsBrowse.Open;
    end;
  end;
end;

procedure TfrmContract.dtpDateChange(Sender: TObject);
begin
  edtFilterChange(edtFilter);
end;

procedure TfrmContract.rgStatusClick(Sender: TObject);
begin
  edtFilterChange(edtFilter);
end;

procedure TfrmContract.pmOpPopup(Sender: TObject);
begin
  if dm.adsBrowse.IsEmpty then
  begin
    n2.Enabled:= False;     //编辑
    n3.Enabled:= False;     //检查
    n4.Enabled:= False;     //复制
    n5.Enabled:= False;     //审核
    n6.Enabled:= False;     //退审
    n7.Enabled:= False;     //删除
    n8.Enabled:= False;     //打印报表
    n13.Enabled:= False;    //提交审核
  end
  else
  begin
    n3.Enabled:= True;
    n4.Enabled:= True;
    case dm.adsBrowseStatus.Value of
    0:begin
       n2.Enabled:= True;
       n13.Enabled:=True;
       n5.Enabled:= False;
       n6.Enabled:= False;
       n7.Enabled:= True;
       n8.Enabled:= False;
      end;
    1:begin
       n2.Enabled:= False;
       n13.Enabled:=False;
       n5.Enabled:= True;
       n6.Enabled:= True;
       n7.Enabled:= False;
       n8.Enabled:= False;
      end;
    2:begin
       n2.Enabled:= False;
       n13.Enabled:=False;
       n5.Enabled:= False;
       n6.Enabled:= True;
       n7.Enabled:= False;
       n8.Enabled:= True;
      end;
    3:begin
       n2.Enabled:= True;
       n13.Enabled:=True;
       n5.Enabled:= False;
       n6.Enabled:= False;
       n7.Enabled:= True;
       n8.Enabled:= False;
      end;
    end;
  end;
end;

function TfrmContract.Checkvprev: Boolean;
begin
  {1:只读; 2:可写; 3:读银; 4:写银}
  Result:= True;
  if (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Result:= False;
  end;
end;

procedure TfrmContract.ViewData(OP: Byte);
var
  rkey:integer;
begin
  if not dm.adsBrowse.Active then Abort;
  if ((op <> 1) and (dm.adsBrowse.RecordCount <= 0)) then Abort;
  YY:= OP;
  if OP = 1 then
    OpenQuery(dm.aqMain,['0'])
  else
    OpenQuery(dm.aqMain,[dm.adsBrowse.FieldValues['RKEY']]);
  rkey:= dm.aqMainRKEY.Value;

  frmDetail:= TfrmDetail.Create(Application);
  try
    with frmDetail do
    begin
      if OP = 3 then
      begin
        btnSave.Enabled:= False;
        sbtnCalc.Enabled:= False;
      end
      else
      begin
        btnSave.Enabled:= True;
        sbtnCalc.Enabled:= True;
      end;
    end;
    if frmDetail.ShowModal = mrok then
      btnRefreshClick(nil)
    else
      dm.aqMain.Locate('rkey',rkey,[]);
  finally
    if Assigned(frmDetail) then frmDetail.Free;
  end;
end;

procedure TfrmContract.Item_Click(Sender: TObject);
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

procedure TfrmContract.N1Click(Sender: TObject);
begin
  if Checkvprev then  //新增
    ViewData(1);
end;

procedure TfrmContract.N2Click(Sender: TObject);
begin
  if Checkvprev then  //编辑
    ViewData(2);
end;

procedure TfrmContract.N3Click(Sender: TObject);
begin
  ViewData(3);  //检查
end;

procedure TfrmContract.UseReport(RKEY167, OP: Integer; RFQNO: string; rptNo: Byte);
const rptName: array[0..3] of string=('ContractReport.rtm','ContractProdReport.rtm','JGContractReport.rtm','ContractDReport.rtm');
var ppReport:TppReport;
    ppDesigner:TppDesigner;
begin
  frmReports:= TfrmReports.Create(Application);
  with frmReports do
  begin
    case rptNo of
    0:begin
        if dm.adsBrowseStatus.Value<>2 then Abort;
        ppReport:= ppReport1;
        ppDesigner:= ppDesigner1;
        adsRpt167.Close;
        adsRpt167.Parameters[0].Value:= RKEY167;
        adsRpt167.Open;
      end;
    1:begin
        ppReport:= ppReport2;
        ppDesigner:= ppDesigner2;
        adsProd.Close;
        adsProd.Parameters[0].Value:= RKEY167;
        adsProd.Parameters[1].Value:= RFQNO;
        adsProd.Open;
      end;
    2:begin
        if dm.adsBrowseStatus.Value<>2 then Abort;
        ppReport:= ppReport1;
        ppDesigner:= ppDesigner1;
        adsRpt167.Close;
        adsRpt167.Parameters[0].Value:= RKEY167;
        adsRpt167.Open;
      end;
    3:begin
       if dm.adsBrowseStatus.Value<>2 then Abort;
        ppReport:= ppReport1;
        ppDesigner:= ppDesigner1;
        adsRpt167.Close;
        adsRpt167.Parameters[0].Value:= RKEY167;
        adsRpt167.Open;
      end;
    else
      MessageDlg('未知报表',  mtWarning, [mbOK], 0);
     end;
     
    try
      adsRpt493.Close;
      adsRpt493.Open;
      ppReport.Reset;

      ppReport.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ rptName[rptNo];
      ppReport.Template.LoadFromFile;
      if OP = 1 then
      begin
        ppReport.SaveAsTemplate:= False;
        ppReport.Print;
      end
      else if OP = 0 then
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

procedure TfrmContract.N7Click(Sender: TObject);
begin
  if Checkvprev then
  begin
    if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
      exit;
    dm.ADOConn.BeginTrans;
    try
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:= 'delete from data0169 where PARAMETER_PTR = ' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text:= 'delete from data0168 where PARAMETER_PTR = ' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text:= 'delete from Data0167 where rkey=' + dm.adsBrowseRKEY.AsString;
        ExecSQL;
      end;
      dm.ADOConn.CommitTrans;
      ShowMessage('删除成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('删除失败!');
    end;
  end;
end;

procedure TfrmContract.N8Click(Sender: TObject);
begin
  UseReport(dm.adsBrowseRKEY.Value, 1);
end;

procedure TfrmContract.MenuItem1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgBrowse, self.Caption);
end;

procedure TfrmContract.N12Click(Sender: TObject);
var
  vCondition: string;
  Excel: Variant;
  Row, Col: Integer;
begin
  if not dm.adsBrowse.Active then Exit;
  if dm.adsBrowse.RecordCount = 0 then Exit
  else
  begin
    vCondition:= ' Where RKEY in (';
    with dm.adsBrowse do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          if Bof then vCondition:= vCondition + dm.adsBrowse.FieldByName('RKEY').AsString
          else vCondition:= vCondition + ',' + dm.adsBrowse.FieldByName('RKEY').AsString;
          Next;
        end;
        vCondition:= vCondition+')';
      finally
        EnableControls;
      end;
    end;
  end;
  with aspExcel do
  begin
    Close;
    Parameters.ParamByName('@Condition').Value:= vCondition;
    Open;
    DisableControls;
    First;
    try
      try
        Excel:= CreateOleObject('Excel.application');
        Excel.Visible:= True;
        Excel.Workbooks.Add;
        Excel.WorkBooks[1].WorkSheets[1].Name := '合同详细资料';
        Row:= 1;
        while not Eof do
        begin
          Col:= 1;
          while Col <= FieldCount do
          begin
            if Row = 1 then  //先写表头
            begin
              if ((Col > 1) and (Fields[Col-2].DisplayName = Fields[Col-1].DisplayName)) then
              begin
                Excel.Cells.item[Row,Col]:= '';
                Excel.Range[Excel.Cells[Row,Col-1], Excel.Cells[Row,Col]].Merge;  //如果前后两单元格名称一样,合并单元格
              end
              else
                Excel.Cells.item[Row,Col]:= Fields[Col-1].DisplayName;

              Excel.Cells.item[Row,Col].HorizontalAlignment:= 3;  //居中
            end;
            Excel.Cells.item[Row+1,Col]:= ''''+Fields[Col-1].AsString;  //资料前加分号防止科学计数法
            Inc(Col);
          end;
          Next;
          Inc(Row);
        end;
        Excel.ActiveSheet.Rows.Font.Color:= clBlue;
        Excel.ActiveSheet.Rows.Font.Size:= 9;
        Excel.ActiveSheet.Rows[1].Font.Color:= clBlack;
        Excel.ActiveSheet.Rows[1].Font.Name:= '隶书';
        Excel.ActiveSheet.Rows[1].Font.Size:= 11;
      except
        MessageDlg('导出资料失败,请确认是否已安装Excel程序!',  mtError, [mbOK], 0);
        Abort;
      end;
    finally
      EnableControls;
    end;
  end;
end;

function TfrmContract.OpenQuery(CName: TADOQuery; Params: array of string;
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

procedure TfrmContract.btnSetClick(Sender: TObject);
var
  dlgSetItem: TfrmSetItem;
begin
  dlgSetItem:= TfrmSetItem.Create(Self);
  try
    with dlgSetItem do
    begin
      dm.aqSetItem.Close;
      dm.aqSetItem.Open;
      pcBase.ActivePage:= TabSheet1;
      ShowModal;
    end;
  finally
    dlgSetItem.Free;
  end;
end;

procedure TfrmContract.N13Click(Sender: TObject);
begin
  if Checkvprev then AuditData(1);  //提交
end;

procedure TfrmContract.N5Click(Sender: TObject);
begin
  if (StrToInt(vprev) = 4) then AuditData(2)  //审核
  else MessageDlg('对不起!您没有该程序的审核权限',mtinformation,[mbok],0);
end;

procedure TfrmContract.N6Click(Sender: TObject);
begin
  if (StrToInt(vprev) = 4) then AuditData(3)  //退審
  else MessageDlg('对不起!您没有该程序的退審权限',mtinformation,[mbok],0);
end;

procedure TfrmContract.AuditData(OP: Byte);
var
  OPMsg, AId: String;
  ADate: TDateTime;
begin        //0:未审核; 1已提交; 2已审核; 3已退回
  if not dm.adsBrowse.Active then Exit;
  if dm.adsBrowse.RecordCount <= 0 then Exit;

  if OP = 1 then
  begin
    OPMsg:= '提交审核';
    AId:= '0';
    ADate:= StrToDate('1900-01-01');
  end
  else if OP = 2 then
  begin
    if dm.adsBrowse.FieldByName('ColorTag').AsInteger = 1 then
    begin
      if MessageBox(Handle, '工程费低于标准，确定审核通过吗？', '警告', MB_OKCANCEL + MB_ICONQUESTION) = IDCANCEL
      then Abort;
    end;
    OPMsg:= '审核';
    AId:= USERRKEY;
    ADate:= getsystem_date(dm.aqTmp,0);
  end
  else if OP = 3 then
  begin
    OPMsg:= '退审';
    AId:= '0';
    ADate:= StrToDate('1900-01-01');
  end;

  dm.ADOConn.BeginTrans;
  try
    with dm.acAudit do
    begin
      Parameters.ParamByName('Status').Value:= OP;
      if AId = '0' then
        Parameters.ParamByName('AuditId').Value:= NULL
      else
        Parameters.ParamByName('AuditId').Value:= AId;
      if ADate = StrToDate('1900-01-01') then
        Parameters.ParamByName('AuditDate').Value:= NULL
      else
        Parameters.ParamByName('AuditDate').Value:= ADate;
      Parameters.ParamByName('RKEY').Value:= dm.adsBrowseRKEY.Value;
      Execute;
    end;
    dm.ADOConn.CommitTrans;
    ShowMessage(OPMsg + '成功!');
    btnRefreshClick(nil);
  except
    dm.ADOConn.RollbackTrans;
    ShowMessage(OPMsg + '失败!');
  end;
end;

procedure TfrmContract.dbgBrowseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  //工程费用低于标准用颜色标识
  if dm.adsBrowse.FieldByName('ColorTag').AsInteger = 1 then
    (Sender as TDBGridEh).Canvas.Font.Color:= clBlue;
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmContract.mniN17Click(Sender: TObject);
begin
  UseReport(dm.adsBrowseRKEY.Value, 1,'',2);
end;

procedure TfrmContract.mniN18Click(Sender: TObject);
begin
  UseReport(dm.adsBrowseRKEY.Value, 0, '', (Sender as TMenuItem).Tag);
end;

procedure TfrmContract.pcs1Click(Sender: TObject);
begin
   UseReport(dm.adsBrowseRKEY.Value, 1,'',3);
end;



procedure TfrmContract.PCB21Click(Sender: TObject);
begin
  UseReport(dm.adsBrowseRKEY.Value, 0, '', (Sender as TMenuItem).Tag);
end;

end.
