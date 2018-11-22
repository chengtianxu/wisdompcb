unit Contract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, DB, ADODB,
  Menus, ComObj, ppReport, ppEndUsr, Mask, DBCtrls;

type
  TfrmContract = class(TForm)
    pnlAllClient: TPanel;
    pnlTop: TPanel;
    lblFilter: TLabel;
    dtpDate: TDateTimePicker;
    edtFilter: TEdit;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
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
    nEdit: TMenuItem;
    N3: TMenuItem;
    N9: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N11: TMenuItem;
    N8: TMenuItem;
    btnSet: TBitBtn;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    adsMain: TADODataSet;
    adsMainRKEY: TAutoIncField;
    adsMainContractNo: TStringField;
    adsMainCust_Id: TStringField;
    adsMainCust_Name: TStringField;
    adsMainStatus: TWordField;
    adsMainTStatus: TStringField;
    adsMainCreateName: TStringField;
    adsMainCreateDate: TDateTimeField;
    adsMainLastModifyName: TStringField;
    adsMainLastModifyDate: TDateTimeField;
    adsMainAuditName: TStringField;
    adsMainAuditDate: TDateTimeField;
    adsMainColorTag: TWordField;
    dsMain: TDataSource;
    nRFP11: TMenuItem;
    nRFQ21: TMenuItem;
    nN2: TMenuItem;
    nN3: TMenuItem;
    mmo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
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
    procedure nEditClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure dbgBrowseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnSetClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure nRFP11Click(Sender: TObject);
    procedure nRFQ21Click(Sender: TObject);
    procedure nN3Click(Sender: TObject);
  private
    Field_Name: String;
    PreColumn: TColumnEh;
    OrigSQL, NewSQL: String;
    function Checkvprev: Boolean;
    procedure Item_Click(Sender: TObject);
    procedure AuditData(OP: Byte);
    function SaveData(AFrm: TForm;ANew: Boolean = False): Boolean;
  public
    YY: Byte;  {1新增、2编辑、3检查}
  end;

var
  frmContract: TfrmContract;
  USERRKEY: string;

implementation

uses damo, common, condition, Detail, 
   CalcListFrm;

{$R *.dfm}

procedure TfrmContract.FormCreate(Sender: TObject);
begin

  if not App_init_2(dm.ADOConn) then
  begin
    showmsg('程序启动失败，请联系管理员！',1);
    application.Terminate;
  end;

//  dm.ADOConn.Connected:= False;
//  dm.ADOConn.Connected:= True;
//  vprev:= '4';  //4写银
//  rkey73:='1597';

  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';

  dm.aqParamName.Open;
  dm.adsLookup25.Open;
  dm.adsLookUp164.Open;
  dm.adslookup10.open;
end;

procedure TfrmContract.FormShow(Sender: TObject);
var
  i: Byte;
  item: TMenuItem;
begin
  if dm.ADOConn.Connected then
  begin
    dm.OpenQuery(dm.aqTmp,[],'select EMPLOYEE_PTR from data0073 where rkey='+rkey73);
    USERRKEY := dm.aqTmp.fieldbyname('employee_ptr').asstring;
    adsMain.Close;
    adsMain.Parameters.ParamByName('dtpk1').Value:= getsystem_date(dm.aqGetDate,1)-10;
    adsMain.Parameters.ParamByName('dtpk2').Value:= getsystem_date(dm.aqGetDate,1) + 1;
    adsMain.Prepared;
    adsMain.Open;
    OrigSQL:= adsMain.CommandText;
    NewSQL:= adsMain.CommandText;
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
  //if StrToInt(vprev) = 4 then rgStatus.ItemIndex:=1 else rgStatus.ItemIndex:= 0;
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
  rkey:= adsMainRKEY.Value;
  adsMain.Close;
  adsMain.Open;
  if ((rkey>0) and (adsMain.RecordCount>0)) then adsMain.Locate('rkey',rkey,[]);
end;

procedure TfrmContract.btnQueryClick(Sender: TObject);
var
  i:byte;
begin
  with frmCondition do
  begin
    dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         adsMain.Parameters.ParamValues['dtpk1']));
    dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         adsMain.Parameters.ParamValues['dtpk2']-1));
    if ShowModal = mrok then
    begin
      with adsMain do
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
var
  LFileName: string;
begin
  case (Sender as TMenuItem).Tag of
    0: LFileName := 'Rfq_Price_Rpt.rtm';
    1: LFileName := 'Rfq_Price_Rpt2.rtm';
    2: LFileName := 'Rfq_Price_Rpt3.rtm';
  end;

 dm.prprt1.Reset;
 dm.prprt1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      LFileName;
 dm.prprt1.Template.LoadFromFile;
 dm.prprt1.SaveAsTemplate := true;

 dm.ppDesigner1.ShowModal;
end;

procedure TfrmContract.dbgBrowseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg(adsMain.CommandText, mtInformation, [mbOK], 0);
end;

procedure TfrmContract.dbgBrowseTitleClick(Column: TColumnEh);
begin
  IF adsMain.Active then
  begin
    if Column.Title.SortMarker = smDownEh then  //排序
    begin
      Column.Title.SortMarker:= smUpEh;
      adsMain.IndexFieldNames:= Column.FieldName;
    end
    else
    begin
      Column.Title.SortMarker:= smDownEh;
      adsMain.IndexFieldNames:= Column.FieldName + ' DESC';
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
    if adsMain.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      dtpDate.Date := getsystem_date(dm.aqGetDate,1);
      edtFilter.SendToBack;
    end
    else
    begin
      edtFilter.BringToFront;
      with adsMain do
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
  IF adsMain.Active Then
  begin
    adsMain.Filter := '';
    S:= '';
    if rgStatus.ItemIndex <> 4 then
    begin
      S:= ' Status = ' + inttostr(rgStatus.ItemIndex);
    end;
    if trim(edtFilter.text) <> '' then
    begin
      if adsMain.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtFilter.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtFilter.text) + '%''';
      end
      else
      if adsMain.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
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
    adsMain.Filter:= S;

    if adsMain.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      BDate:= DateToStr(dtpDate.Date) + ' 00:00:00';
      EDate:= DateToStr(dtpDate.Date) + ' 23:59:59';
      adsMain.Close;
      if rgStatus.ItemIndex <> 4 then
        S:= ' and Status = ' + inttostr(rgStatus.ItemIndex) +
            ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +''''
      else
        S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
      adsMain.CommandText:= NewSQL + S;
      adsMain.Open;
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
  if adsMain.IsEmpty then
  begin
    nEdit.Enabled:= False;     //编辑
    n3.Enabled:= False;     //检查
    n5.Enabled:= False;     //审核
    n6.Enabled:= False;     //退审
    n8.Enabled:= False;     //打印报表
    n13.Enabled:= False;    //提交审核
  end
  else
  begin
    n3.Enabled:= True;
    case adsMainStatus.Value of
    0:begin
       nEdit.Enabled:= True;
       n13.Enabled:=True;
       n5.Enabled:= False;
       n6.Enabled:= False;
       n8.Enabled:= False;
      end;
    1:begin
       nEdit.Enabled:= True;
       n13.Enabled:=False;
       n5.Enabled:= True;
       n6.Enabled:= True;
       n8.Enabled:= False;
      end;
    2:begin
       nEdit.Enabled:= True;
       n13.Enabled:=False;
       n5.Enabled:= False;
       n6.Enabled:= True;
       n8.Enabled:= True;
      end;
    3:begin
       nEdit.Enabled:= True;
       n13.Enabled:=True;
       n5.Enabled:= False;
       n6.Enabled:= False;
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
var
  LFrm: TfrmDetail;
begin
  if Checkvprev then  //新增
  begin
    YY:= 1;
    LFrm := TfrmDetail.Create(Self);
    try
      LFrm.btnSave.Enabled:= True;
      LFrm.btnCalc.Enabled:= True;
      LFrm.ads167.Parameters[0].Value := -1;

      lfrm.ads167.Open;
      LFrm.ads167.Append;

      LFrm.ads167.FieldByName('cust_id').AsString := '';
      LFrm.ads167.FieldByName('ContractNo').AsString := LFrm.Get167No;
      LFrm.ads167.FieldByName('notes').AsString := mmo1.Text;

      LFrm.ads165.Close;
      LFrm.ads165.Parameters[0].Value := LFrm.ads167.FieldValues['RKEY'];
      LFrm.ads165.Open;

      LFrm.ads168.Close;
      LFrm.ads168.Parameters[0].Value := LFrm.ads167.fieldbyname('rkey').Value;
      LFrm.ads168.Open;


      if LFrm.ShowModal = mrok then
      begin
        SaveData(LFrm,True);
      end;
      adsMain.Requery();
    finally
      LFrm.Free;
    end;
  end;
end;

procedure TfrmContract.nEditClick(Sender: TObject);
var
  LFrm: TfrmDetail;
begin
  if Checkvprev then  //编辑
  begin
    LFrm := TfrmDetail.Create(Self);
    try
      LFrm.ads167.Parameters[0].Value := adsMain.fieldbyname('rkey').AsInteger;
      lfrm.ads167.Open;

      LFrm.ads165.Close;
      LFrm.ads165.Parameters[0].Value := LFrm.ads167.FieldValues['RKEY'];
      LFrm.ads165.Open;

      lfrm.ads165.First;
      while not LFrm.ads165.Eof do
      begin
        LFrm.Add166(LFrm.ads165.fieldbyname('rkey').AsString);
        LFrm.Add169(LFrm.ads165.fieldbyname('rkey').AsString);
        LFrm.ads165.Next;
      end;      

      LFrm.ads168.Close;
      LFrm.ads168.Parameters[0].Value := LFrm.ads167.fieldbyname('rkey').Value;
      LFrm.ads168.Open;

      if LFrm.ShowModal = mrok then
      begin
        SaveData(LFrm);
      end;

    finally
      LFrm.Free;
    end;
  end;
end;

procedure TfrmContract.N7Click(Sender: TObject);
begin
//  if Checkvprev then
//  begin
//    if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
//      exit;
//    dm.ADOConn.BeginTrans;
//    try
//      with dm.aqTmp do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Text:= 'delete from data0169 where PARAMETER_PTR = ' + adsMainRKEY.AsString;
//        ExecSQL;
//        Close;
//        SQL.Clear;
//        SQL.Text:= 'delete from data0168 where PARAMETER_PTR = ' + adsMainRKEY.AsString;
//        ExecSQL;
//        Close;
//        SQL.Clear;
//        SQL.Text:= 'delete from Data0167 where rkey=' + adsMainRKEY.AsString;
//        ExecSQL;
//      end;
//      dm.ADOConn.CommitTrans;
//      ShowMessage('删除成功!');
//      btnRefreshClick(nil);
//    except
//      dm.ADOConn.RollbackTrans;
//      ShowMessage('删除失败!');
//    end;
//  end;
end;

procedure TfrmContract.MenuItem1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgBrowse, self.Caption);
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
  if not adsMain.Active then Exit;
  if adsMain.RecordCount <= 0 then Exit;

  if OP = 1 then
  begin
    OPMsg:= '提交审核';
    AId:= '0';
    ADate:= StrToDate('1900-01-01');
  end
  else if OP = 2 then
  begin
    if adsMain.FieldByName('ColorTag').AsInteger = 1 then
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
      Parameters.ParamByName('RKEY').Value:= adsMainRKEY.Value;
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
  if adsMain.FieldByName('ColorTag').AsInteger = 1 then
    (Sender as TDBGridEh).Canvas.Font.Color:= clBlue;
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmContract.btnSetClick(Sender: TObject);
begin
  with TfrmCalcList.Create(Self) do
  begin
    try
      ShowModal;
      dm.adsLookUp164.Requery();
    finally
      Free;
    end;
  end;
end;

function TfrmContract.SaveData(AFrm: TForm;ANew: Boolean = False): Boolean;
var
  LFrm: TfrmDetail;
  I: Integer;
  LSql: string;
  LDS: TADODataSet;
begin
  LFrm := AFrm as TfrmDetail;

  LFrm.ads167.Edit;
  LFrm.ads167.FieldByName('Status').AsInteger := 2;
  LFrm.ads167.FieldByName('LastModifyId').AsString:= USERRKEY;
  LFrm.ads167.FieldByName('LastModifyDate').AsDateTime:= getsystem_date(dm.aqTmp,0);
  LFrm.ads167.Post;

  if ANew then
  begin
    LFrm.ads167.Edit;
    LFrm.ads167.FieldByName('CreateId').AsString:= USERRKEY;
    LFrm.ads167.Post;

    //刷新合同号
    LSql := 'select 1 from data0167 where ContractNo= ' + QuotedStr(LFrm.ads167.fieldbyname('ContractNo').AsString);
    dm.SqlOpen(LSql);
    if not dm.qrytmp.IsEmpty then //已经存在单号则重新取单号
    begin
      LFrm.ads167.Edit;
      LFrm.ads167.FieldByName('ContractNo').AsString := LFrm.Get167No;
      LFrm.ads167.Post;
    end;
  end;

  dm.ADOConn.BeginTrans;
  try
    LFrm.ads167.UpdateBatch();

    if ANew then LFrm.Update167_04(LFrm.ads167.FieldByName('ContractNo').AsString);

    LFrm.ads165.First;
    while not LFrm.ads165.Eof do
    begin
      if LFrm.ads165.FieldByName('rkey').AsString = '' then //表示新增
      begin
        LFrm.ads165.Edit;
        LFrm.ads165.FieldByName('RFQNo').AsString := LFrm.GetRFQNO;
        LFrm.Update165_04(LFrm.ads165.fieldbyname('RfqNo').AsString);
        LFrm.ads165.FieldByName('rkey167').AsInteger := LFrm.ads167.FieldByName('rkey').AsInteger;
        LFrm.ads165.Post;
      end;
      LFrm.ads165.UpdateBatch(arCurrent);
      LFrm.ads165.Next;
    end;

    lfrm.ads168.First;
    while not LFrm.ads168.Eof do
    begin
      LFrm.ads165.RecNo := LFrm.ads168.RecNo;
      if LFrm.ads168.FieldByName('rkey').AsString = '' then //表示新增
      begin
        LFrm.ads168.Edit;
        LFrm.ads168.FieldByName('rkey165').AsInteger := LFrm.ads165.fieldbyname('rkey').AsInteger;
        LFrm.ads168.FieldByName('RFQNo').AsString:= LFrm.ads165.fieldbyname('RFQNO').AsString;
        LFrm.ads168.Post;
      end;

      LFrm.ads168.UpdateBatch(arCurrent);
      LFrm.ads168.Next;
    end;

    LFrm.ads165.First;
    I := 0;
    while not LFrm.ads165.Eof do
    begin
      //增加166
      LDS := TADODataSet(LFrm.F166List[I]);
      LDS.First;
      while not LDS.Eof do
      begin
        if LDS.UpdateStatus = usInserted then
        begin
          LDS.Edit;
          LDS.FieldByName('rkey165').AsInteger := LFrm.ads165.fieldbyname('rkey').AsInteger;
          LDS.Post;
        end;
        LDS.Next;
      end;
      LDS.UpdateBatch();

      //增加169
      LDS := TADODataSet(LFrm.F169List[I]);
      LDS.First;
      while not LDS.Eof do
      begin
        if LDS.UpdateStatus = usInserted then
        begin      
          LDS.Edit;
          LDS.FieldByName('rkey165').AsInteger := LFrm.ads165.fieldbyname('rkey').AsInteger;
          LDS.Post;
        end;
        LDS.Next;
      end;
      LDS.UpdateBatch();

      LFrm.ads165.Next;
      Inc(I);
    end;

    dm.ADOConn.CommitTrans;
    Result := True;
  finally
    if dm.ADOConn.InTransaction then dm.ADOConn.RollbackTrans;
  end;
end;

procedure TfrmContract.N3Click(Sender: TObject);
var
  LFrm: TfrmDetail;
  I: Integer;
begin
  if Checkvprev then  //
  begin
    LFrm := TfrmDetail.Create(Self);
    try
      LFrm.ads167.Parameters[0].Value := adsMain.fieldbyname('rkey').AsInteger;
      lfrm.ads167.Open;

      LFrm.ads165.Close;
      LFrm.ads165.Parameters[0].Value := LFrm.ads167.FieldValues['RKEY'];
      LFrm.ads165.Open;

      lfrm.ads165.First;
      while not LFrm.ads165.Eof do
      begin
        LFrm.Add166(LFrm.ads165.fieldbyname('rkey').AsString);
        LFrm.Add169(LFrm.ads165.fieldbyname('rkey').AsString);
        LFrm.ads165.Next;
      end;      

      LFrm.ads168.Close;
      LFrm.ads168.Parameters[0].Value := LFrm.ads167.fieldbyname('rkey').Value;
      LFrm.ads168.Open;


      LFrm.ehRFQParam.ReadOnly := True;
      LFrm.eh169.PopupMenu := nil;
      LFrm.eh169.ReadOnly := True;
      LFrm.eh168.PopupMenu := nil;
      LFrm.eh168.ReadOnly := True;
      LFrm.btnLookCust.Enabled := False;
      LFrm.DBComboBox1.ReadOnly := True;
      LFrm.btnAddPrice.Enabled := False;
      LFrm.btnCancel.Enabled := False;
      LFrm.DBMemo1.ReadOnly := True;
      LFrm.btnCalc.Enabled := False;
      LFrm.btnCalcAll.Enabled := False;

      for I := 0 to LFrm.ComponentCount - 1 do
      begin
        if LFrm.Components[I] is TDBEdit then
        begin
          (LFrm.Components[I] as TDBEdit).ReadOnly := True;
        end;
      end;


      if LFrm.ShowModal = mrok then
      begin
        //SaveData(LFrm);
      end;

    finally
      LFrm.Free;
    end;
  end;
end;

procedure TfrmContract.nRFP11Click(Sender: TObject);
begin
  dm.BeginPrint(adsMain.fieldbyname('rkey').AsString);
end;

procedure TfrmContract.nRFQ21Click(Sender: TObject);
begin
  dm.BeginPrint(adsMain.fieldbyname('rkey').AsString,1);
end;

procedure TfrmContract.nN3Click(Sender: TObject);
begin
  dm.BeginPrint(adsMain.fieldbyname('rkey').AsString,2);
end;

end.
