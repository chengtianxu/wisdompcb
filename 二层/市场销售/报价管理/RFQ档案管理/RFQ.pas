unit RFQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, DBGridEh, DB,
  ADODB, ComCtrls;

type
  TCustInfo = record
              CustId: string[10];
              CustName: string[100];
              CustAddr: string[100];
              CustSaler: string[10];
              CustTel: string[20];
              CustMail: string[50];
  end;

type
  TfrmRFQ = class(TForm)
    pnlTop: TPanel;
    pnlClient: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnColumn: TBitBtn;
    btnSetParam: TBitBtn;
    lblRFQ: TLabel;
    edtRFQ: TEdit;
    pmColumn: TPopupMenu;
    dbgBrowse: TDBGridEh;
    Panel1: TPanel;
    rgStatus: TRadioGroup;
    dtpDate: TDateTimePicker;
    pmOp: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    pnlAdd: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtCustCode: TEdit;
    btnOK: TBitBtn;
    btnNO: TBitBtn;
    btnLookCust: TBitBtn;
    N4: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    mmoFile: TMemo;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure btnSetParamClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtRFQChange(Sender: TObject);
    procedure dbgBrowseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgBrowseTitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnNOClick(Sender: TObject);
    procedure btnLookCustClick(Sender: TObject);
    procedure edtCustCodeChange(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure pmOpPopup(Sender: TObject);
    procedure dbgBrowseDblClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    Field_Name: String;
    PreColumn: TColumnEh;
    OrigSQL, NewSQL: String;
    CustList: array of string[10];
    procedure item_Click(Sender: TObject);
    procedure AuditData(OP: Byte);
    procedure ViewData(OP: Byte);
    function Checkvprev:Boolean;
  public
    YY: byte;  //操作类型(1新增、2编辑、3检查、4下载文件)
    CustInfo: TCustInfo;
    CustStr: String;
  end;

var
  frmRFQ: TfrmRFQ;
  USERRKEY: string;
  
implementation

uses damo, common, condition, SetParam, RFQInfo, ConstVar, Pick_Item_Single;

{$R *.dfm}

procedure TfrmRFQ.btnExitClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TfrmRFQ.btnRefreshClick(Sender: TObject);
var
  rkey:integer;
begin
  rkey:= dm.ADSRFQRKEY.Value;
  dm.ADSRFQ.Close;
  dm.ADSRFQ.Open;
  if rkey>0 then dm.ADSRFQ.Locate('rkey',rkey,[]);
end;

procedure TfrmRFQ.btnExportClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgBrowse, self.Caption);
end;

procedure TfrmRFQ.btnQueryClick(Sender: TObject);
var
  i:byte;
begin
  with form_condition do
  begin
    dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         dm.ADSRFQ.Parameters.ParamValues['dtpk1']));
    dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         dm.ADSRFQ.Parameters.ParamValues['dtpk2']-1));
    if ShowModal = mrok then
    begin
      with dm.ADSRFQ do
      begin
        close;
        CommandText:= OrigSQL;
        for i:= 1 to form_condition.SGrid1.RowCount - 2 do
          CommandText:= CommandText + form_condition.SGrid1.Cells[2,i] + #13;
        Parameters.ParamValues['dtpk1']:= strtodate(formatdatetime('yyyy-mm-dd ',dtpk1.Date));
        Parameters.ParamValues['dtpk2']:= strtodate(formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
        Prepared;
        open;
        NewSQL:= CommandText;
      end;
    end;
  end;
end;

procedure TfrmRFQ.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmRFQ.btnSetParamClick(Sender: TObject);
begin
  if Checkvprev then
  begin
    frmSetParam:= TfrmSetParam.Create(Application);
    try
      with frmSetParam do
      begin
        dm.AQSetParam.Close;
        dm.AQSetParam.Open;
        ShowModal;
      end;
    finally
      frmSetParam.Free;
    end;
  end;
end;

procedure TfrmRFQ.FormShow(Sender: TObject);
var
  i: Byte;
  j: Integer;
  item: TMenuItem;
begin
  if dm.ADOConn.Connected then
  begin
    CustStr:= '';
    if vprev = '1' then  //如果只有只读1权限,绑定客户; 3,2,4权限都不需要绑定
    begin
      with dm.AQEmp do
      begin
       close;
       sql.Clear;
       sql.Add('select t10.CUST_CODE from data0010 t10 inner join data0100 t100 ');
       sql.Add('on t10.RKEY = t100.CUSTOMER_PTR ');
       sql.Add('where t100.CSI_PTR = '+rkey73);
       open;
       First;
       SetLength(CustList, RecordCount);
      end;
      if dm.AQEmp.RecordCount = 0 then CustStr:= ' And 1<>1 '
      else
      for j:=0 to dm.AQEmp.RecordCount-1 do  //读取绑定客户到数组CustList
      begin
        CustList[j]:= dm.AQEmp.FieldByName('CUST_CODE').AsString;
        if j=0 then CustStr:= ' And Cust_Id in('''+CustList[j]+''''+','
        else if j=dm.AQEmp.RecordCount-1 then CustStr:= CustStr+''''+CustList[j]+''''+')'
        else CustStr:= CustStr + ''''+CustList[j]+''''+',';

        if ((j=0) and (j=dm.AQEmp.RecordCount-1)) then  //如果只绑定了一个客户
          CustStr:= ' And Cust_Id in('''+CustList[j]+''''+')';

        dm.AQEmp.Next;           //生成条件CustStr
      end;
      //ShowMessage(CustStr);
    end;

    with dm.AQEmp do
    begin
     close;
     sql.Clear;
     sql.Add('select EMPLOYEE_PTR from data0073');
     sql.Add('where rkey='+rkey73);
     open;
     USERRKEY := fieldbyname('employee_ptr').asstring;
    end;
    dm.ADSRFQ.Close;
    dm.ADSRFQ.CommandText:= dm.ADSRFQ.CommandText + CustStr;
    dm.ADSRFQ.Parameters.ParamByName('dtpk1').Value:= getsystem_date(dm.ADQGetDate,1);
    dm.ADSRFQ.Parameters.ParamByName('dtpk2').Value:= getsystem_date(dm.ADQGetDate,1) + 1;
    dm.ADSRFQ.Prepared;
    dm.ADSRFQ.Open;
    
    OrigSQL:= dm.ADSRFQ.CommandText;
    NewSQL:= dm.ADSRFQ.CommandText;
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

procedure TfrmRFQ.item_Click(Sender: TObject);
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

procedure TfrmRFQ.edtRFQChange(Sender: TObject);
var
  S: String;
  BDate,EDate: String;
begin
  IF dm.dsRFQ.DataSet.Active Then
  begin
    DM.ADSRFQ.Filter := '';
    S:= '';
    if rgStatus.ItemIndex <> 2 then
    begin
      S:= ' Status = ' + inttostr(rgStatus.ItemIndex);
    end;
    if trim(edtRFQ.text) <> '' then
    begin
      if dm.ADSRFQ.Fields.FieldByName(Field_Name).DataType in [ftString, ftWideString] then
      begin
        if S = '' then
          S:= Field_Name + ' like ''%' + Trim(edtRFQ.text) + '%'''
        else
          S:= S + ' and ' + Field_Name + ' like ''%' + trim(edtRFQ.text) + '%''';
      end
      else
      if dm.ADSRFQ.Fields.FieldByName(Field_Name).DataType in [ftSmallint, ftInteger, ftWord] then
      begin
        try
          StrToInt(edtRFQ.Text);
          if S = '' then
            S:= Field_Name + ' = ' + trim(edtRFQ.text)
          else
            S:= S + ' and ' + Field_Name+' = ' + trim(edtRFQ.text);
        except
          ShowMessage('输入的内容不相符，只能输入数字！');
        end;
      end;
    end;
    DM.ADSRFQ.Filter:= S;

    if dm.ADSRFQ.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      BDate:= DateToStr(dtpDate.Date) + ' 00:00:00';
      EDate:= DateToStr(dtpDate.Date) + ' 23:59:59';
      dm.ADSRFQ.Close;
      if rgStatus.ItemIndex <> 2 then
        S:= ' and Status = ' + inttostr(rgStatus.ItemIndex) +
            ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +''''
      else
        S:= ' and ' + Field_Name + ' Between ''' + BDate + '''' + ' and ''' + EDate +'''';
      dm.ADSRFQ.CommandText:= NewSQL + S;
      dm.ADSRFQ.Open;
    end;
  end;
end;

procedure TfrmRFQ.dbgBrowseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg((dm.dsRFQ.DataSet as TADODataSet).CommandText, mtInformation, [mbOK], 0);
end;

procedure TfrmRFQ.dbgBrowseTitleClick(Column: TColumnEh);
begin
  IF dm.dsRFQ.DataSet.Active then
  begin
    if Column.Title.SortMarker = smDownEh then  //排序
    begin
      Column.Title.SortMarker:= smUpEh;
      dm.ADSRFQ.IndexFieldNames:= Column.FieldName;
    end
    else
    begin
      Column.Title.SortMarker:= smDownEh;
      dm.ADSRFQ.IndexFieldNames:= Column.FieldName + ' DESC';
    end;
    if Field_Name <> Column.FieldName then
    begin
      Field_Name:= Column.FieldName;
      lblRFQ.Caption:= Column.Title.Caption;
      edtRFQ.Text:= '' ;
      edtRFQ.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end
    else
    if Field_Name = Column.FieldName then
    begin
      edtRFQ.SetFocus;
      PreColumn.Title.Color:= clBtnFace;
      Column.Title.Color:= clred;
      PreColumn:= Column;
    end;
    if dm.ADSRFQ.Fields.FieldByName(Field_Name).DataType in [ftDate, ftTime, ftDateTime] then
    begin
      dtpDate.Date := getsystem_date(dm.ADQGetDate,1);
      edtRFQ.SendToBack;
    end
    else
    begin
      edtRFQ.BringToFront;
      with dm.ADSRFQ do
      begin
        Close;
        CommandText:= NewSQL;
        Open;
      end;
    end;
  end
  else
    ShowMessage('没有打开数据，请按: 查询 ');
end;

procedure TfrmRFQ.FormCreate(Sender: TObject);
begin
{$IFDEF Release}
  if not App_init_2(dm.ADOConn) then
  begin
    showmsg('程序起动失败，请联系管理员！',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  dm.ADOConn.Connected:= False;
  dm.ADOConn.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='2444';   //2913
{$ENDIF}
  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
end;

procedure TfrmRFQ.rgStatusClick(Sender: TObject);
begin
  edtRFQChange(edtRFQ);
end;

procedure TfrmRFQ.dtpDateChange(Sender: TObject);
begin
  edtRFQChange(edtRFQ);
end;

procedure TfrmRFQ.N1Click(Sender: TObject);
begin
  if Checkvprev then
  begin
    YY:= 1;
    pnlAdd.Visible:= True;
    edtCustCode.Text:= '';
    mmoFile.Text:= '';
    with CustInfo do
    begin
      CustId:= '';
      CustName:= '';
      CustAddr:= '';
      CustSaler:= '';
      CustTel:= '';
      CustMail:= '';
    end;
    edtCustCode.SetFocus;
  end;
end;

procedure TfrmRFQ.N2Click(Sender: TObject);
begin
  if Checkvprev then ViewData(2);  //编辑
end;

procedure TfrmRFQ.N3Click(Sender: TObject);
begin
  ViewData(3);  //检查
end;

procedure TfrmRFQ.btnOKClick(Sender: TObject);
begin
  pnlAdd.Visible:= False;
  frmRFQInfo:= TfrmRFQInfo.Create(Application);
  try
    if (edtCustCode.Text <> '') and (CustInfo.CustId = '') then  //如果客户代码是手动输入的
    begin
      CustInfo.CustId:= edtCustCode.Text;
      with dm.AQ0010 do
      begin
        Close;
        Filter:= ' CUST_CODE = ' + '''' + CustInfo.CustId + '''';
        Open;
      end;
      if dm.AQ0010.RecordCount > 0 then
      begin
        CustInfo.CustName:= VarToStr(dm.AQ0010.FieldValues['CUSTOMER_NAME']);
        CustInfo.CustAddr:= VarToStr(dm.AQ0010.FieldValues['BILLING_ADDRESS_1']);
        CustInfo.CustSaler:= VarToStr(dm.AQ0010.FieldValues['SALES_REP_NAME']);
        CustInfo.CustTel:= VarToStr(dm.AQ0010.FieldValues['PHONE']);
        CustInfo.CustMail:= VarToStr(dm.AQ0010.FieldValues['GEN_EMAIL_ADDRESS']);
      end;
    end;
    with frmRFQInfo do
    begin
      edtCustId.Text:= CustInfo.CustId;
      edtCustName.Text:= CustInfo.CustName;
      edtCustAddr.Text:= CustInfo.CustAddr;
      edtSalesMan.Text:= CustInfo.CustSaler;
      edtTel.Text:= CustInfo.CustTel;
      edtMail.Text:= CustInfo.CustMail;
      edtFileName.Text:= mmoFile.Text;
      rgPOType.ItemIndex:= 0;
      vIsUP:= False;
    end;
    if frmRFQInfo.ShowModal = mrok then
      btnRefreshClick(nil);
  finally
    frmRFQInfo.Free;
  end;
end;

procedure TfrmRFQ.btnNOClick(Sender: TObject);
begin
  pnlAdd.Visible:= False;
end;

procedure TfrmRFQ.btnLookCustClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                        'BILLING_ADDRESS_1/地址/251';
    InputVar.Sqlstr :=
      'Select t10.CUST_CODE,t10.CUSTOMER_NAME,t10.BILLING_ADDRESS_1, '+#13+
      't5.EMPLOYEE_NAME as SALES_REP_NAME,t10.PHONE,t10.GEN_EMAIL_ADDRESS '+#13+
      'from data0010 t10 Left Join data0005 t5 '+#13+
      'On t10.SALES_REP_PTR = t5.RKEY '+#13+
      'order by t10.CUST_CODE';
    inputvar.InPut_value:=edtCustCode.Text;
    inputvar.KeyField:='CUST_CODE';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      with CustInfo,frmPick_Item_Single.adsPick do
      begin
        CustId:= FieldByName('CUST_CODE').AsString;
        CustName:= FieldByName('CUSTOMER_NAME').AsString;
        CustAddr:= FieldByName('BILLING_ADDRESS_1').AsString;
        CustSaler:= FieldByName('SALES_REP_NAME').AsString;
        CustTel:= FieldByName('PHONE').AsString;
        CustMail:= FieldByName('GEN_EMAIL_ADDRESS').AsString;
      end;
      edtCustCode.Text:= CustInfo.CustId;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmRFQ.edtCustCodeChange(Sender: TObject);
begin
  with CustInfo do
  begin
    CustId:= '';
    CustName:= '';
    CustAddr:= '';
    CustSaler:= '';
    CustTel:= '';
    CustMail:= '';
  end;
end;

procedure TfrmRFQ.N4Click(Sender: TObject);
var
  rkey:integer;
begin
  if Checkvprev then
  try
    if not dm.ADSRFQ.Active then Exit;
    if dm.ADSRFQ.RecordCount <= 0 then Exit;
    
    with dm.ASPCopyData do
    begin
      Close;
      Parameters.ParamByName('@RKEY165').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
      Parameters.ParamByName('@RKEY4').Value:= 83;
      Parameters.ParamByName('@EmpId').Value:= USERRKEY;
      Prepared;
      Open;
    end;
    rkey:= dm.ASPCopyData.Fields[0].AsInteger;
    dm.ADSRFQ.Close;
    dm.ADSRFQ.Open;
    if rkey>0 then dm.ADSRFQ.Locate('rkey',rkey,[]);
    N2.Click;
  except
    on E:Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TfrmRFQ.N5Click(Sender: TObject);
begin
  if Checkvprev then
  begin
    with dm.AQEmp do
    begin
      close;
      sql.Clear;
      sql.Add('Select MustInput,Param_Value From Data0166 ');
      sql.Add('Where PARAMETER_PTR = :PARAMETER_PTR Order By SEQ_NO');
      Parameters.ParamByName('PARAMETER_PTR').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
      open;
      First;
      while not Eof do
      begin
        if Fields[0].Value = 1 then  //MustInput
        begin
          if Fields[1].Value = '' then  //Param_Value
          begin
            ShowMessage('必填参数未输入完成,请检查并输入!');
            Abort;
          end;
        end;
        Next;
      end;
    end;
    AuditData(1);  //审核
  end;
end;

procedure TfrmRFQ.N6Click(Sender: TObject);
begin
//  if Checkvprev then
  if (StrToInt(vprev) <> 4) then
    MessageDlg('对不起!您没有该权限',mtinformation,[mbok],0)
  else
    AuditData(0);  //退审
end;

procedure TfrmRFQ.AuditData(OP: Byte);
var
  OPMsg, AId: String;
  ADate: TDateTime;
begin
  if not dm.ADSRFQ.Active then Abort;
  if dm.ADSRFQ.RecordCount <= 0 then Abort;

  if OP = 1 then
  begin
    OPMsg:= '审核';
    AId:= USERRKEY;          
    ADate:= getsystem_date(dm.ADQGetDate,0);
  end
  else//if OP = 0 then
  begin
    OPMsg:= '退审';
    AId:= '0';
    ADate:= StrToDate('1900-1-1');
  end;

  dm.ADOConn.BeginTrans;
  try
    with dm.ACAudit do
    begin
      //Close;  {TADOCommand无Close方法,此处将直接调用窗体的Close方法造成程序退出}
      Parameters.ParamByName('Status').Value:= OP;
      Parameters.ParamByName('AuditId').Value:= AId;
      Parameters.ParamByName('AuditDate').Value:= ADate;
      Parameters.ParamByName('RKEY').Value:= dm.ADSRFQRKEY.Value;
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

procedure TfrmRFQ.N7Click(Sender: TObject);
begin
  if Checkvprev then
  begin
    if MessageBox(Handle,'确定删除这条记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
      exit;
    dm.ADOConn.BeginTrans;
    try
      dm.temp.Close;
      dm.temp.SQL.Text:= 'delete from data0166 where PARAMETER_PTR = ' + DM.ADSRFQRKEY.AsString;
      dm.temp.ExecSQL;
      dm.temp.Close;
      dm.temp.SQL.Text:= 'delete from Data0165 where rkey=' + DM.ADSRFQRKEY.AsString;
      dm.temp.ExecSQL;
      dm.ADOConn.CommitTrans;
      ShowMessage('删除数据成功!');
      btnRefreshClick(nil);
    except
      dm.ADOConn.RollbackTrans;
      ShowMessage('删除数据失败!');
    end;
  end;
end;

procedure TfrmRFQ.pmOpPopup(Sender: TObject);
begin
  if dm.ADSRFQ.IsEmpty then
  begin
    n2.Enabled:= False;     //编辑
    n3.Enabled:= False;     //检查
    n4.Enabled:= False;     //复制
    n5.Enabled:= False;     //审核
    n6.Enabled:= False;     //退审
    n7.Enabled:= False;     //删除
    n11.Enabled:= False;    //打印报表
    n12.Enabled:= False;    //下载文件
    n13.Enabled:= False;    //复改
  end
  else
  begin
    n3.Enabled:= True;
    n4.Enabled:= True;
    n11.Enabled:= True;
    n12.Enabled:= True;
    n13.Enabled:= True;
    case dm.ADSRFQStatus.Value of
    0:begin
       n2.Enabled:= True;
       n5.Enabled:= True;
       n6.Enabled:= False;
       n7.Enabled:= True;
      end;
    1:begin
       n2.Enabled:= False;
       n5.Enabled:= False;
       n6.Enabled:= True;
       n7.Enabled:= False;
      end;
    end;
  end;
end;

function TfrmRFQ.Checkvprev: Boolean;
begin
  {1:只读; 2:可写; 3:读银; 4:写银}
  Result:= True;
  if (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Result:= False;
  end;
end;

procedure TfrmRFQ.ViewData(OP: Byte);
var
  rkey:integer;
begin
  if not dm.ADSRFQ.Active then Exit;
  if dm.ADSRFQ.RecordCount <= 0 then Exit;
  YY:= OP;
  with dm.AQMain do
  begin
    Close;
    Parameters.ParamByName('RKEY').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
    Open;
  end;
  rkey:= dm.AQMainRKEY.Value;
  frmRFQInfo:= TfrmRFQInfo.Create(Application);
  try
    with frmRFQInfo do
    begin
      edtRFQNo.Text:= dm.AQMain.FieldByName('RFQNo').AsString;
      edtCustId.Text:= dm.AQMain.FieldByName('Cust_Id').AsString;
      edtCustName.Text:= dm.AQMain.FieldByName('Cust_Name').AsString;
      edtCustAddr.Text:= dm.AQMain.FieldByName('Cust_Addr').AsString;
      edtSalesMan.Text:= dm.AQMain.FieldByName('SalesMan').AsString;
      edtTechContact.Text:= dm.AQMain.FieldByName('TechContact').AsString;
      edtTel.Text:= dm.AQMain.FieldByName('Tel').AsString;
      edtMail.Text:= dm.AQMain.FieldByName('Mail').AsString;
      edtFileName.Text:= dm.AQMain.FieldByName('FileName').AsString;
      edtFilePath.Text:= dm.AQMain.FieldByName('FilePath').AsString;
      edtPartsId.Text:= dm.AQMain.FieldByName('PartsId').AsString;
      rgPOType.ItemIndex:= dm.AQMain.FieldByName('POType').AsInteger;
      vIsUP:= dm.AQMain.FieldByName('IsUP').AsBoolean;
    end;
    if OP = 4 then
    begin
      frmRFQInfo.Show;
      frmRFQInfo.sbtnDown.Click;
      Abort;
    end
    else
    if frmRFQInfo.ShowModal = mrok then
      btnRefreshClick(nil)
    else
      dm.AQMain.Locate('rkey',rkey,[]);
  finally
    frmRFQInfo.Free;
  end;
end;

procedure TfrmRFQ.dbgBrowseDblClick(Sender: TObject);
begin
  ViewData(3);
end;

procedure TfrmRFQ.N11Click(Sender: TObject);
begin
  with dm.AQPrint do
  begin
    Close;
    Parameters.ParamByName('RKEY165').Value:= dm.ADSRFQRKEY.Value;
    Open;
  end;
  frmRFQInfo:= TfrmRFQInfo.Create(Application);
  with frmRFQInfo do
  begin
    ppReport1.Reset;
    ppReport1.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'RFQInfo.rtm';
    ppReport1.Template.LoadFromFile;
    ppReport1.Print;
  end;
end;

procedure TfrmRFQ.N12Click(Sender: TObject);
begin
  ViewData(4);
end;

procedure TfrmRFQ.N13Click(Sender: TObject);
var
  rkey:integer;
begin
  if Checkvprev then
  try
    if not dm.ADSRFQ.Active then Exit;
    if dm.ADSRFQ.RecordCount <= 0 then Exit;
    
    with dm.ASPCopyData1 do
    begin
      Close;
      Parameters.ParamByName('@RKEY165').Value:= dm.ADSRFQ.FieldByName('RKEY').AsString;
      Parameters.ParamByName('@EmpId').Value:= USERRKEY;
      Prepared;
      Open;
    end;
    rkey:= dm.ASPCopyData1.Fields[0].AsInteger;
    dm.ADSRFQ.Close;
    dm.ADSRFQ.Open;
    if rkey>0 then dm.ADSRFQ.Locate('rkey',rkey,[]);
    N2.Click;
  except
    on E:Exception do
    ShowMessage(E.Message);
  end;
end;

end.
