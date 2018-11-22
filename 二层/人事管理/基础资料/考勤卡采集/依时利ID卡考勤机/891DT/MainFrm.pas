unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DMFrm, ComCtrls, Grids, DBGridEh, Menus, StdCtrls, Buttons,
  DBGrids, ExtCtrls, DB, DBClient;

type
  TfrmMain = class(TForm)
    ehDevList: TDBGridEh;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    btnDownCard: TButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    stat1: TStatusBar;
    btnOpenXMLFile: TButton;
    tv1: TTreeView;
    btnXMLToDB: TButton;
    btnDeleCardData: TButton;
    pnl3: TPanel;
    lbl1: TLabel;
    dbgrdData: TDBGrid;
    pnl7: TPanel;
    lbl9: TLabel;
    btn5: TSpeedButton;
    lbl10: TLabel;
    edtDBGX: TEdit;
    btnGetDBNameList: TButton;
    pnl4: TPanel;
    lbl2: TLabel;
    pnl6: TPanel;
    lbl8: TLabel;
    btn4: TSpeedButton;
    edtDevGX: TEdit;
    btnGetDevNameList: TButton;
    btnDBToDev: TButton;
    ts3: TTabSheet;
    lbl6: TLabel;
    lvDepart: TListView;
    cbx1: TCheckBox;
    lbl7: TLabel;
    lvDev: TListView;
    cbx2: TCheckBox;
    btn2: TButton;
    btnAddToDev: TButton;
    btn3: TButton;
    btnShowDevDepartment: TButton;
    btnSetDevTime: TButton;
    ts4: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnUpLoad: TBitBtn;
    Label1: TLabel;
    lbFilter: TLabel;
    edtEmployeeCode: TEdit;
    dbEmployee: TDBGridEh;
    lvMDev: TListView;
    Label3: TLabel;
    lbCount: TLabel;
    btnSearch: TBitBtn;
    chkAll: TCheckBox;
    cds1: TClientDataSet;
    eh1: TDBGridEh;
    ds1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnDownCardClick(Sender: TObject);
    procedure btnOpenXMLFileClick(Sender: TObject);
    procedure btnXMLToDBClick(Sender: TObject);
    procedure btnDeleCardDataClick(Sender: TObject);
    procedure btnGetDBNameListClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnGetDevNameListClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnDBToDevClick(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure cbx2Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnAddToDevClick(Sender: TObject);
    procedure btnShowDevDepartmentClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSetDevTimeClick(Sender: TObject);
    procedure dbEmployeeTitleClick(Column: TColumnEh);
    procedure btnSearchClick(Sender: TObject);
    procedure edtEmployeeCodeChange(Sender: TObject);
    procedure chkAllClick(Sender: TObject);
    procedure btnUpLoadClick(Sender: TObject);
    procedure edtEmployeeCodeKeyPress(Sender: TObject; var Key: Char);
    procedure eh1TitleClick(Column: TColumnEh);
  private
    { Private declarations }
    FBDrop: Boolean;
    preColumn:TColumnEh;
    FHotCol: TColumnEh;
    function ConnectDev(var hDev: THandle): Boolean;
    function ConDev(var hPort:THandle;itemID:Integer):Boolean;
    procedure DisConDev(hDev: THandle);
    procedure LockUI;
    procedure UnLockUI;

    function DownCardData(hDev: THandle): Boolean;
    function DeleCardData(hdev: THandle): Boolean;
    procedure WriteRecord(ACardNO,ATime: string);
    procedure XMLToDB(AFile: string);
    procedure DataFileToTv(ADataFile: string);
    function DownDevEmpList(hDev: THandle): Boolean;
    function UploadEmp(hdev: THandle): Boolean;
    function GetDevDepart(AIP,AID: string): string;

    function SetDevTime(hdev: THandle; ATime: TDateTime): Boolean;
  public
    { Public declarations }
    function CheckOperatorLock: Boolean;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Eastriver_Helper, DataMgr, XMLIntf, Eastriver_API, ADODB, WZ_gUnit;

var
  XMLMgr: TDataMgr;
  MainNode: IXMLNode;
  LDevNode: IXMLNode;

{$R *.dfm}

function TfrmMain.ConnectDev(var hDev: THandle): Boolean;
var
  LDevTime: Double;
begin
  Result := False;
  if DM1.cdsDevList.IsEmpty then Exit;
  if DM1.cdsDevList.FieldByName('selected').AsBoolean then
  begin
    hDev := DllAPI.OpenClientSocket(PAnsiChar(trim(DM1.cdsDevList.fieldbyname('devip').asstring)),DevPort);
    if (not CheckHandle(hDev)) or (not DllAPI.CallClock(hDev,StrToIntdef(trim(DM1.cdsDevList.fieldbyname('devid').asstring),0))) then
    begin
      DM1.cdsDevList.Edit;
      DM1.cdsDevList.FieldByName('constatue').AsString := '连接失败';
      DM1.cdsDevList.Post;
    end else
    begin
      DM1.cdsDevList.Edit;
      if DllAPI.ReadClockTime(hDev,LDevTime) then
      begin
        DM1.cdsDevList.FieldByName('devtime').AsDateTime := LDevTime;
        DM1.cdsDevList.FieldByName('constatue').AsString := '连线中';
        Result := True;
      end else
      begin
        DM1.cdsDevList.FieldByName('constatue').AsString := '连接失败';
      end;
      DM1.cdsDevList.Post;    
    end;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  lvItem,LItem: TListItem;
  i: Integer;
begin
  DM1.adsDevList.Open;
  DM1.cdsDevList.Data := DM1.dspDevList.Data;
  preColumn:= dbEmployee.Columns[0];
  lvDepart.Clear;
//    qrytmp.Close;
//    qrytmp.SQL.Clear;
//    qrytmp.SQL.Add('SELECT RKey, Departmentname FROM datadepartment');
  try
    DM1.SqlOpen('SELECT RKey, Departmentname FROM datadepartment');
    if not DM1.qrytmp.IsEmpty then
    begin
      DM1.qrytmp.First;
      while not DM1.qrytmp.Eof do
      begin
        LItem := lvDepart.Items.Add;
        LItem.Caption := '';
        LItem.SubItems.Add(DM1.qrytmp.fieldbyname('Departmentname').AsString);
        LItem.Data := Pointer(DM1.qrytmp.fieldbyname('RKey').asinteger);
        DM1.qrytmp.Next;
      end;
    end;

    lvDev.Clear;
//      qrytmp.Close;
//      qrytmp.SQL.Clear;
//      qrytmp.SQL.Add('SELECT RKey, DevID, Dev_IP FROM dev_detail WHERE devaddr = ' + QuotedStr('local'));
    DM1.SqlOpen('SELECT RKey, DevID, Dev_IP FROM dev_detail WHERE devaddr = ' + QuotedStr('local'));
    if not dm1.qrytmp.IsEmpty then
    begin
      dm1.qrytmp.First;
      while not dm1.qrytmp.Eof do
      begin
        LItem := lvDev.Items.Add;
        LItem.Caption := '';
        LItem.SubItems.Add(dm1.qrytmp.fieldbyname('DevID').AsString);
        LItem.SubItems.Add(dm1.qrytmp.fieldbyname('Dev_IP').AsString);
        LItem.Data := Pointer(dm1.qrytmp.fieldbyname('RKey').asinteger);
        DM1.qrytmp.Next;
      end;
    end;

    dm1.qrytmp.Close;
  except
    ShowMessage('取得部门,设备失败');
  end;
  pgc1.ActivePageIndex := 0;
  ts3.TabVisible := gUser.User_Permit = '4';


  //2015-11-13增加以下修改
  btnUpLoad.Caption:='开'+#13+'始'+#13+'上'+#13+'传';
  with DM1.adoQuickUpload do
  begin
    Close;
    Open;
    lbCount.Caption:=IntToStr(RecordCount);
  end;
  lvMDev.Items.Clear;
  with DM1.qrytmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,devid,dev_ip from dev_detail where devaddr=''local''';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        lvItem:= lvMDev.Items.Add;
        lvItem.Caption:='';
        lvItem.SubItems.Add(Trim(FieldByName('devid').AsString));
        lvItem.SubItems.Add(FieldByName('dev_ip').AsString);
        lvItem.Data := Pointer(FieldByName('rkey').AsInteger);
        Next;
      end;
    end;
  end;

  with cds1 do
  begin
    FieldDefs.Add('ID', ftString,20 , False);
    FieldDefs.Add('Name', ftString, 20, False);
    FieldDefs.Add('CardNo', ftString, 20, False);
    CreateDataSet;
  end;
  FHotCol :=eh1.Columns[0];  
end;

procedure TfrmMain.btnDownCardClick(Sender: TObject);
var
  hDev: THandle;
  svDlg: TSaveDialog;
  lFilename: string;
begin
  svDlg := TSaveDialog.Create(Self);
  try
    svDlg.Filter := '.data';
    svDlg.DefaultExt := 'data';
    svDlg.FileName := FormatDateTime('yyyyMMddhhmmss', Now());
    if svDlg.Execute then
      lFilename := svDlg.FileName
    else
      Exit;
  finally
    FreeAndNil(svDlg);
  end;

  LockUI;
  DM1.ClearAllNote;
  XMLMgr := TDataMgr.Create;
  MainNode := XMLMgr.AddNode(nil,'MainNode');
  DM1.cdsDevList.First;
  try
    while not dm1.cdsDevList.Eof do
    begin
      if DM1.cdsDevList.FieldByName('selected').AsBoolean then
      begin
        LDevNode := MainNode.AddChild('IP_' + DM1.cdsDevList.fieldbyname('devip').AsString);
        LDevNode.Attributes['DevNo'] := DM1.cdsDevList.fieldbyname('devid').AsString;      
        try
          if ConnectDev(hDev) then
          begin
            DownCardData(hDev);
          end;
        finally
          DisConDev(hDev);
        end;
      end;
      DM1.cdsDevList.Next;
    end;
    XMLMgr.SaveToFile(lFilename);
  finally
    XMLMgr.Free;
    UnLockUI;
  end;
  
  if MessageBoxA(Handle,PChar('是否将结果添加到数据库中?'),'Note',MB_YESNO) = IDYES then
  begin
    DM1.ClearDB;
    XMLToDB(lFilename);
  end;

end;

procedure TfrmMain.DisConDev(hDev: THandle);
begin
  if CheckHandle(hDev) then
  begin
    DllAPI.UnCallClock(hDev);
    DllAPI.ClosePortHandle(hDev);
  end;
end;

procedure TfrmMain.LockUI;
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[I] is TWinControl then
    begin
      (Self.Components[I] as TWinControl).Enabled := False;
    end;
  end;
end;

procedure TfrmMain.UnLockUI;
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[I] is TWinControl then
    begin
      (Self.Components[I] as TWinControl).Enabled := True;
    end;
  end;
end;

function GetPck: TClockInfo;
begin
  FillChar(Result,sizeof(Result),0);
  Result.CommStyle:=1;
  Result.IPAddr:=Trim(DM1.cdsDevList.fieldbyname('devip').AsString);
  Result.IPPort:=DevPort;
  Result.clock_id:=StrToIntdef(Trim(DM1.cdsDevList.fieldbyname('devid').AsString),0);
end;

procedure WaitProc(p: Pointer; dwMilliseconds: Integer);stdcall;   //延时函数
begin
  Application.ProcessMessages;
end;

function DataProgressProc(p: Pointer;lpReadData: PReadData): Boolean;stdcall;
var
  Records: TICRecord;
begin
  FillChar(Records,SizeOf(Records),0);
  Move(lpReadData^.CardNo[0],Records.Card[0],sizeof(lpReadData^.CardNo));
  Move(lpReadData^.TimeString[0],Records.timeString[0],sizeof(lpReadData.TimeString));
  Records.flag:=lpReadData.flag;
  frmMain.WriteRecord(Records.Card, Records.timeString);
  frmMain.stat1.Panels[5].Text := IntToStr(strtointdef(frmMain.stat1.Panels[5].Text,0) + 1);
  Result:=true;
end;

function TfrmMain.DownCardData(hDev: THandle): Boolean;
var
  LTotalNo,LHasDownNum: Integer;
  LClockInfo: TClockInfo;
begin
  Result := False;
  LClockInfo := GetPck;
  if not DllAPI.ReadClockRecordTotal(hDev,LTotalNo) then
  begin
    DM1.SetCdsValue('note','失败-取得总数失败');
    Exit;
  end;
  
  stat1.Panels[1].Text := DM1.cdsDevList.fieldbyname('devid').AsString;
  stat1.Panels[3].Text := IntToStr(LTotalNo);
  stat1.Panels[5].Text := '';

  LHasDownNum := DllAPI.ReadAllRecord(hDev,@LClockInfo,DataProgressProc,WaitProc);
  if LHasDownNum = LTotalNo then
  begin
    DM1.SetCdsValue('note','成功-' + IntToStr(LHasDownNum) + '/' + IntToStr(LTotalNo));
  end else
  begin
    DM1.SetCdsValue('note','失败-' + IntToStr(LHasDownNum) + '/' + IntToStr(LTotalNo));
  end;
end;

procedure TfrmMain.WriteRecord(ACardNO, ATime: string);
begin
  //mmo1.Lines.Add(ACardNO + ' ' + ATime);
  with LDevNode.AddChild('CardInfo') do
  begin
    Attributes['CardNo'] := ACardNO;
    Attributes['CardTime'] := ATime;
    Attributes['HasIntoDB'] := 'F';
  end;
end;

procedure TfrmMain.XMLToDB(AFile: string);
var
  CardNode: IXMLNode;
  I,N: Integer;
  DevIP,DevNo,CardNo,CardTime: string;
  SqlText: string;
  tmp: string;

  Errstr: string;
  nn: Integer;
begin
  if FileExists(AFile) then
  begin
    XMLMgr := TDataMgr.Create;
    LockUI;
    try
      if XMLMgr.LoadXML(AFile) = frSOK then
      begin
        MainNode := XMLMgr.MainNode;
        for I := 0 to MainNode.ChildNodes.Count - 1 do
        begin
          LDevNode := MainNode.ChildNodes[I];
          DevIP := LDevNode.NodeName;
          DevNo := LDevNode.Attributes['DevNo'];
          ErrStr := ErrStr + #13#10 + DevIP + '  总数:' + IntToStr(LDevNode.ChildNodes.Count) + '条';
          stat1.Panels[1].Text := DevNo;
          stat1.Panels[3].Text := IntToStr(LDevNode.ChildNodes.Count);
          stat1.Panels[5].Text := '';
          nn := 0;
          for N := 0 to LDevNode.ChildNodes.Count - 1 do
          begin
            CardNode := LDevNode.ChildNodes[N];
            CardNo := CardNode.Attributes['CardNo'];
            tmp := CardNode.Attributes['CardTime'];

            CardTime := Copy(tmp,1,4) + '-' + Copy(tmp,5,2) + '-' +  Copy(tmp,7,2) + ' ' + Copy(tmp,9,2) + ':' + Copy(tmp,11,2) + ':' + Copy(tmp,13,2);
            SqlText := 'INSERT INTO employeecard_eastriver_rcd(empno, employeecard, card_time ' +
	                            ', date_e, time_e, dev_id, dev_mark,empid, remark1, remark2, remark3, factorytype) VALUES(NULL,';
            SqlText := SqlText + QuotedStr(CardNo) + ',' + QuotedStr(CardTime) + ',' + QuotedStr(DateToStr(StrToDateTime(CardTime))) + ',' + QuotedStr(FormatDateTime('hh:mm:ss',StrToDateTime(CardTime))) + ',' + DevNo + ',';
            SqlText := SqlText + 'NULL,NULL,NULL,NULL,NULL,NULL)';
//            if CardNo = '0015496298' then
//            begin
//              CardNode.Attributes['HasIntoDB'] := 'T';
//              Inc(nn);
//            end else
            if DM1.SqlExec(SqlText) <> -1 then
            begin
              CardNode.Attributes['HasIntoDB'] := 'T';
              inc(nn);
            end;
            Application.ProcessMessages;
          end;
          Errstr := Errstr + '  导入:' + IntToStr(nn) + '条';
        end;
        XMLMgr.SaveToFile(AFile);

        with DM1.qrytmp do
        begin
          Close;
          SQL.Text:= 'select datediff(day,min(card_time),max(card_time)) from employeecard_eastriver_rcd';
          Open;
          if not IsEmpty then
          begin
            if Fields[0].Value > 31 then
            begin
              ShowMessage('数据已导入，但时间跨度超过31天，请检查卡钟时间并联系管理员！！');
            end;
          end;
        end;

        DM1.sp1.ExecProc;
      end else
        ShowMessage('文件类型不正确!');
      ShowMessage(Errstr);
    finally
      XMLMgr.Free;
      UnLockUI;
    end;
  end;
end;

procedure TfrmMain.btnOpenXMLFileClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
  begin
    Filter :='*.data|*.data';
    FilterIndex := 0;
    if Execute then
    begin
      //lbl4.Caption := FileName;
      DataFileToTv(FileName);
    end;
    Free;
  end;
end;

procedure TfrmMain.DataFileToTv(ADataFile: string);
var
  DevNode, CardNode: IXMLNode;
  XMLMgr: TDataMgr;
  I,N: Integer;
  MainTNode, DevTNode, CardTNode: TTreeNode;

  DevIP,DevNo: string;
  CardNo, CardTime, tmp, HasInToDB: string;
begin
  if FileExists(ADataFile) then
  begin
    XMLMgr := TDataMgr.Create;
    try
      if XMLMgr.LoadXML(ADataFile) = frSOK then
      begin
        tv1.Items.Clear;
        MainNode := XMLMgr.MainNode;
        MainTNode := tv1.Items.AddChild(nil,'所有设备');
        for I := 0 to MainNode.ChildNodes.Count - 1 do
        begin
          DevNode := MainNode.ChildNodes[I];
          DevIP := DevNode.NodeName;
          DevNo := DevNode.Attributes['DevNo'];
          DevTNode := tv1.Items.AddChild(MainTNode,DevIP + '   设备号 ' + DevNo);
          for N := 0 to DevNode.ChildNodes.Count - 1 do
          begin
            CardNode := DevNode.ChildNodes[N];
            CardNo := CardNode.Attributes['CardNo'];
            HasInToDB := CardNode.Attributes['HasIntoDB'];
            tmp := CardNode.Attributes['CardTime'];

            CardTime := Copy(tmp,1,4) + '-' + Copy(tmp,5,2) + '-' +  Copy(tmp,7,2) + ' ' + Copy(tmp,9,2) + ':' + Copy(tmp,11,2) + ':' + Copy(tmp,13,2);
            CardTNode := tv1.Items.AddChild(DevTNode,'卡号: ' + CardNo + '       时间: ' + CardTime + '         导入过: ' + HasInToDB);
          end;
        end;
      end else
        ShowMessage('不是有效的数据文件');
    finally
      XMLMgr.Free;
    end;
  end;
end;

procedure TfrmMain.btnXMLToDBClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
  begin
    Filter :='*.data|*.data';
    FilterIndex := 0;
    if Execute then
    begin
      DM1.ClearDB;
      XMLToDB(FileName);
      DataFileToTv(FileName);
    end;
    Free;
  end;
end;

procedure TfrmMain.btnDeleCardDataClick(Sender: TObject);
var
  hDev: THandle;
begin
  if MessageBox(Handle, '是否删除设备打卡记录','Note', MB_YESNO) = ID_YES then
  begin
    LockUI;
    DM1.ClearAllNote;
    DM1.cdsDevList.First;
    try
      while not dm1.cdsDevList.Eof do
      begin
        if DM1.cdsDevList.FieldByName('selected').AsBoolean then
        begin
          try
            if ConnectDev(hDev) then
            begin
              DeleCardData(hDev)
            end;
          finally
            DisConDev(hDev);
          end;
        end;
        DM1.cdsDevList.Next;
      end;
    finally
      UnLockUI;
    end;

  end;
end;

function TfrmMain.DeleCardData(hdev: THandle): Boolean;
begin
  stat1.Panels[1].Text := DM1.cdsDevList.fieldbyname('devid').AsString;
  //stat1.Panels[3].Text := IntToStr(LTotalNo);
  stat1.Panels[5].Text := '';

  Result := DllAPI.ClearAllReadCard(hdev);

  if Result then
  begin
    DM1.SetCdsValue('note','成功-删除');
  end else
  begin
    DM1.SetCdsValue('note','失败-删除');
  end;
end;

procedure TfrmMain.btnGetDBNameListClick(Sender: TObject);
var
  sSQL: string;
  LDepart: string;
begin
  if DM1.GetDevSelectCount <> 1 then
  begin
    ShowMessage('请勾选一个设备');
    Exit;
  end;

  LDepart := GetDevDepart(DM1.cdsDevList.fieldbyname('devip').AsString, DM1.cdsDevList.fieldbyname('devid').AsString);

  sSql := 'SELECT employeecode AS ''工号'', chinesename as ''姓名'',  cardno AS ''卡号'', departmentname AS ''部门''' +
    ' FROM employeemsg left join datadepartment ON employeemsg.departmentid = datadepartment.RKey ' +
    ' WHERE status = 1 and len(cardno)=10 and employeemsg.departmentid IN ' + LDepart +
    ' union all ' +
    ' select employeecode,chinesename,cardno, departmentname from employeemsg_extra ' +
    ' where flag=1 and len(cardno)=10 ';
  DM1.adsMD.Close;
  DM1.adsMD.CommandText := sSQL;
  DM1.adsMD.Open;

  lbl10.Caption := IntToStr(DM1.adsMD.RecordCount);
end;

procedure TfrmMain.btn5Click(Sender: TObject);
begin
  if DM1.adsMD.Active then
  if not DM1.adsMD.Locate('工号',edtDBGX.Text,[]) then
    ShowMessage('没有找到');
end;

procedure TfrmMain.btnGetDevNameListClick(Sender: TObject);
var
  hDev: THandle;
begin
  if DM1.GetDevSelectCount <> 1 then
  begin
    ShowMessage('请勾选一个设备');
    Exit;
  end;
  
  LockUI;
  DM1.ClearAllNote;
  DM1.cdsDevList.First;
  try
    while not dm1.cdsDevList.Eof do
    begin
      if DM1.cdsDevList.FieldByName('selected').AsBoolean then
      begin
        try
          if ConnectDev(hDev) then
          begin
            DownDevEmpList(hDev);
          end;
        finally
          DisConDev(hDev);
        end;
      end;
      DM1.cdsDevList.Next;
    end;
  finally
    UnLockUI;
  end;
end;

function TfrmMain.DownDevEmpList(hDev: THandle): Boolean;
var
  LTotalNo, LHasDownNum, WhiteNo,BlackNo: Integer;
  ListCards: TNameListArray;
  PosEnd:Boolean;
  i,iPos:integer;
  iCount:integer;  
begin
  Result := False;
  if not DllAPI.ReadListCardTotal(hDev,LTotalNo,WhiteNo,BlackNo ) then
  begin
    DM1.SetCdsValue('note','失败-取得总数失败');
    Exit;
  end;
  
  stat1.Panels[1].Text := DM1.cdsDevList.fieldbyname('devid').AsString;
  stat1.Panels[3].Text := IntToStr(WhiteNo + BlackNo);
  stat1.Panels[5].Text := '';

  fillChar(ListCards,sizeof(ListCards),0);
  while not cds1.IsEmpty do
    cds1.Delete;
  iPos:=0;
  LHasDownNum := 0;
  PosEnd := False;
  while not PosEnd do
  begin
    iCount:=16;
    if DllAPI.ReadDeviceListCard(hDev,iPos,iCount,ListCards) then
    begin
      iPos:=iPos+iCount;
      if iCount=0 then
        PosEnd:=True
      else
      if iCount>0 then
      begin
        cds1.DisableControls;
        for i:=0 to iCount-1 do
        begin
          cds1.Append;
          cds1.FieldByName('ID').AsString := ListCards[i].emp_no;
          cds1.FieldByName('Name').AsString := ListCards[i].emp_name;
          cds1.FieldByName('cardno').AsString := ListCards[i].cardno;
          cds1.Post;

//          with lvDevNLst.Items.Add do
//          begin
//            Caption := ListCards[i].emp_no;
//            SubItems.Add(ListCards[i].emp_name);
//            SubItems.Add(ListCards[i].cardno);
//          end;
        end;
        cds1.EnableControls;
      end;
      LHasDownNum := LHasDownNum + iCount;
      stat1.Panels[5].Text := IntToStr(LHasDownNum);
    end
    else
      PosEnd:=True;
    Application.ProcessMessages;    
  end;

  if LHasDownNum = (WhiteNo + BlackNo) then
  begin
    DM1.SetCdsValue('note','成功-' + IntToStr(LHasDownNum) + '/' + IntToStr(WhiteNo + BlackNo));
  end else
  begin
    DM1.SetCdsValue('note','失败-' + IntToStr(LHasDownNum) + '/' + IntToStr(WhiteNo + BlackNo));
  end;
end;

procedure TfrmMain.btn4Click(Sender: TObject);
begin
  if edtDevGX.Text  = '' then
  begin
    cds1.Filtered := False;
  end else
  begin
    cds1.Filter := FHotCol.FieldName + ' = ' + QuotedStr(edtDevGX.Text);
    cds1.Filtered := True;
  end;
end;

procedure TfrmMain.btnDBToDevClick(Sender: TObject);
var
  hDev: THandle;
begin
  if MessageBox(Handle, '是否同步','Note',MB_YESNO) <> ID_YES then
  begin
    Exit;
  end;
  
  if DM1.GetDevSelectCount <> 1 then
  begin
    ShowMessage('请勾选一个设备');
    Exit;
  end;
  btnGetDBNameListClick(btnGetDBNameList);
  if DM1.adsMD.IsEmpty then
  begin
    ShowMessage('数据库名单为空');
    Exit;
  end;

  LockUI;
  DM1.ClearAllNote;
  DM1.cdsDevList.First;
  try
    while not dm1.cdsDevList.Eof do
    begin
      if DM1.cdsDevList.FieldByName('selected').AsBoolean then
      begin
        try
          if ConnectDev(hDev) then
          begin
            if DllAPI.ClearAllNamelist(hDev) >= 0 then
            begin
              UploadEmp(hDev);
            end;
          end;
        finally
          DisConDev(hDev);
        end;
      end;
      DM1.cdsDevList.Next;
    end;
  finally
    UnLockUI;
  end;  
  
end;

function TfrmMain.UploadEmp(hdev: THandle): Boolean;
var
  LHasUpload: Integer;
  chname,cardno,empno: string;
begin
  Result := False;
  
  stat1.Panels[1].Text := DM1.cdsDevList.fieldbyname('devid').AsString;
  stat1.Panels[3].Text := IntToStr(DM1.adsMD.RecordCount);
  stat1.Panels[5].Text := '';

  LHasUpload:=0;
  while not cds1.IsEmpty do cds1.Delete;
  DM1.adsMD.First;
  while LHasUpload < DM1.adsMD.RecordCount do
  begin
    chname := DM1.adsMD.fieldbyname('姓名').AsString;
    cardno := DM1.adsMD.fieldbyname('卡号').AsString;
    if cardno = '' then cardno := '0';
    empno := DM1.adsMD.fieldbyname('工号').AsString;


    if DllAPI.SetAllowedCard(hdev,PChar(Trim(cardno)),PChar(Trim(empno)),PChar(Trim(chname))) then
    begin
      Inc(LHasUpload);
          cds1.Append;
          cds1.FieldByName('ID').AsString := empno;
          cds1.FieldByName('Name').AsString := chname;
          cds1.FieldByName('cardno').AsString := cardno;
          cds1.Post;
      DM1.adsMD.Next;
    end;
    stat1.Panels[5].Text := IntToStr(LHasUpload);
    Application.ProcessMessages;
  end;

  if (LHasUpload = dm1.adsMD.RecordCount) and (LHasUpload <> 0) then
  begin
    DM1.SetCdsValue('note','成功-' + IntToStr(LHasUpload) + '/' + IntToStr(dm1.adsMD.RecordCount));
  end else
  begin
    DM1.SetCdsValue('note','失败-' + IntToStr(LHasUpload) + '/' + IntToStr(dm1.adsMD.RecordCount));
  end;

end;

procedure TfrmMain.cbx1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lvDepart.Items.Count - 1 do
    lvDepart.Items[I].Checked := cbx1.Checked;
end;

procedure TfrmMain.cbx2Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lvDev.Items.Count - 1 do
    lvDev.Items[I].Checked := cbx2.Checked;
end;

procedure TfrmMain.btn2Click(Sender: TObject);
var
  sDepart: string;
  sDev: string;
  sSQL: string;
  I: Integer;
begin
  if lvDepart.Items.Count = 0 then
  begin
    ShowMessage('部门列表为空');
    Exit;
  end;
  if lvDev.Items.Count = 0 then
  begin
    ShowMessage('设备列表为空');
    Exit;
  end;


  for I := 0 to lvDepart.Items.Count - 1 do
  begin
    if lvDepart.Items[I].Checked then
      sDepart := sDepart + IntToStr(Integer(lvDepart.Items[I].Data)) + ',';
  end;
  if sDepart[Length(sDepart)] = ',' then
    sDepart := Copy(sDepart,1,Length(sDepart)-1);
    
  for I := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
      sDev := sDev + IntToStr(Integer(lvDev.Items[I].Data)) + ',';
  end;
  if sDev[Length(sDev)] = ',' then
    sDev := Copy(sDev,1,Length(sDev)-1);

  sSQL := 'UPDATE dev_detail SET departmentidstring = ' + QuotedStr(sDepart);
  sSQL := sSQL + ' WHERE RKey IN (' + sDev + ')';

  if DM1.SqlExec(sSQL) > 0 then
    ShowMessage('设置成功');

//  ShowMessage(sDepart);
//  ShowMessage(sDev);
end;

procedure TfrmMain.btnAddToDevClick(Sender: TObject);
  function GetAddDepartment: string;
  var
    I: Integer;
    sDepart: string;
  begin
    for I := 0 to lvDepart.Items.Count - 1 do
    begin
      if lvDepart.Items[I].Checked then
        sDepart := sDepart + IntToStr(Integer(lvDepart.Items[I].Data)) + ',';
    end;
    if sDepart[Length(sDepart)] = ',' then
      sDepart := Copy(sDepart,1,Length(sDepart)-1);
    if sDepart = '' then
      Result := '0'
    else
      Result := sDepart;
  end;


  function GetSelectDev: string;
  var
    I: Integer;
    sDev: String;
  begin
    for I := 0 to lvDev.Items.Count - 1 do
    begin
      if lvDev.Items[I].Checked then
        sDev := sDev + IntToStr(Integer(lvDev.Items[I].Data)) + ',';
    end;
    if sDev[Length(sDev)] = ',' then
      sDev := Copy(sDev,1,Length(sDev)-1);
    if sDev = '' then
      Result := '0'
    else
      Result := sDev;
  end;

var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(Self);
  LQry.Connection := dm1.con1;
  try
    LQry.SQL.Clear;
    LQry.SQL.Add('UPDATE dev_detail SET departmentidstring = departmentidstring + ');
    LQry.SQL.Add(QuotedStr(',' +GetAddDepartment));
    LQry.SQL.Add(' WHERE RKey IN ( ');
    LQry.SQL.Add(GetSelectDev + ')');
    if LQry.ExecSQL > 0 then
      ShowMessage('添加成功');
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

procedure TfrmMain.btnShowDevDepartmentClick(Sender: TObject);
var
  LQry: TADOQuery;
  sDepartString: string;
  devIP,DevID: string;
  tmps: string;
  I: Integer;
begin
  LQry := TADOQuery.Create(nil);
  LQry.Connection := DM1.con1;
  try
    for I := 0 to lvDev.Items.Count - 1 do
    begin
      if lvDev.Items[I].Checked then
      begin
        DevID := lvDev.Items[I].SubItems[0];
        devIP := lvDev.Items[I].SubItems[1];
        tmps := '设备IP:' + devIP + '  部门名单:    ' + #13 + #13;
        sDepartString := GetDevDepart(devIP,DevID);

        LQry.Close;
        LQry.SQL.Clear;
        LQry.SQL.Add('SELECT departmentname FROM datadepartment WHERE RKey IN ');
        LQry.SQL.Add(sDepartString);
        LQry.Open;
        while not LQry.Eof do
        begin
          tmps := tmps + LQry.FieldByName('departmentname').AsString + '    ,    ';
          if LQry.RecNo mod 2 = 0 then tmps := tmps + #13;
          LQry.Next;
        end;
        ShowMessage(tmps);
      end;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

function TfrmMain.GetDevDepart(AIP, AID: string): string;
var
  LDepart: string;
  ssqL: string;
begin
  //取得部门
  sSQL := 'SELECT departmentidstring FROM dev_detail WHERE devid = ' + QuotedStr(AID) +
    ' AND dev_ip = ' + QuotedStr(AIP);
  if DM1.SqlOpen(sSQL) then
  begin
    if DM1.qrytmp.IsEmpty then
    begin
      LDepart := '(0)';
    end else
    begin
      if Trim(DM1.qrytmp.FieldByName('departmentidstring').AsString) <> '' then
      begin
        LDepart := '(' + Trim(DM1.qrytmp.fieldbyname('departmentidstring').AsString) + ')'
      end else
      begin
        LDepart := '(0)';
      end;
    end;
  end else
  begin
    LDepart := '(0)';
  end;
  Result := LDepart;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  table_name: string;
begin
  if FBDrop then
  begin
    table_name := '##WZ_CardMgr';
    DM1.qrytmp.Close;
    DM1.qrytmp.SQL.Clear;
    dm1.qrytmp.SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
    ' drop table '+table_name;
    dm1.qrytmp.ExecSQL;
  end;
end;

function TfrmMain.CheckOperatorLock: Boolean;
var
  table_name: string;
begin
  Result := True;
  table_name := '##WZ_CardMgr';
   try
     DM1.qrytmp.Close;
     DM1.qrytmp.SQL.Clear;
     DM1.qrytmp.SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
     ' select data0073.USER_FULL_NAME from '+table_name+' inner join data0073 on'+#13+
     table_name+'.rkey73=data0073.rkey'+#13+
     ' else select data0073.USER_FULL_NAME from data0073 WHERE data0073.RKey = -1 ';
     dm1.qrytmp.Open;
     if DM1.qrytmp.IsEmpty then
     begin
       dm1.qrytmp.Close;
       dm1.qrytmp.SQL.Clear;
       dm1.qrytmp.SQL.Add('select '+ gUser.User_Longin_Ptr +' as rkey73 into '+table_name);

       if dm1.qrytmp.ExecSQL <= 0 then
       begin
         ShowMessage('锁定失败!');
         FBDrop := False;
         Exit;
       end else
       begin
        FBDrop := True;
        Result := False;
       end;
       dm1.qrytmp.Close;
     end else
     begin
       ShowMessage('程序已经锁定，' + dm1.qrytmp.fieldByName('USER_FULL_NAME').AsString +' 正在操作！');
       FBDrop := False;
       Exit;
     end;
   except
    showmessage('锁定异常!');
    FBDrop := False;
    Exit;
   end;
   if not Result then
   begin
    DoubleBuffered := True;
    //InitPB;
   end;
end;

procedure TfrmMain.btnSetDevTimeClick(Sender: TObject);
var
  hDev: THandle;
begin
  LockUI;
  DM1.ClearAllNote;
  DM1.cdsDevList.First;
  try
    while not dm1.cdsDevList.Eof do
    begin
      if DM1.cdsDevList.FieldByName('selected').AsBoolean then
      begin
        try
          if ConnectDev(hDev) then
          begin
            SetDevTime(hDev,Now);
          end;
        finally
          DisConDev(hDev);
        end;
      end;
      DM1.cdsDevList.Next;
    end;
  finally
    UnLockUI;
  end;

end;

function TfrmMain.SetDevTime(hdev: THandle; ATime: TDateTime): Boolean;
begin
  Result := False;

  stat1.Panels[1].Text := DM1.cdsDevList.fieldbyname('devid').AsString;
  stat1.Panels[3].Text := '';
  stat1.Panels[5].Text := '';

  if DllAPI.SetClockTime(hdev,ATime) then
  begin
    DM1.SetCdsValue('note','成功-' + FormatDateTime('YYYY-MM-DD hh:mm:ss', ATime));
  end else
  begin
    DM1.SetCdsValue('note','失败-' + FormatDateTime('YYYY-MM-DD hh:mm:ss', ATime));
  end;
  Result := False;
end;

procedure TfrmMain.dbEmployeeTitleClick(Column: TColumnEh);
begin
  if Column.Title.Caption<>preColumn.Title.Caption then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtEmployeeCode.SetFocus;
    preColumn:=Column;
  end;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
begin
  if Trim(edtEmployeeCode.Text)<>'' then
  begin
    DM1.adoQuickUpload.Filtered:=False;
    DM1.adoQuickUpload.Filter:=preColumn.FieldName + ' = ' + QuotedStr(Trim(edtEmployeeCode.Text));
    DM1.adoQuickUpload.Filtered:=True;
    lbCount.Caption:=IntToStr(DM1.adoQuickUpload.RecordCount);
  end
  else
  begin
    DM1.adoQuickUpload.Filter:='';
  end;
end;

procedure TfrmMain.edtEmployeeCodeChange(Sender: TObject);
begin
  if Trim(edtEmployeeCode.Text)='' then
  begin
    DM1.adoQuickUpload.Filter:='';
    lbCount.Caption:=IntToStr(DM1.adoQuickUpload.RecordCount);
  end;
end;

procedure TfrmMain.chkAllClick(Sender: TObject);
var
  i:Integer;
begin
  for i:= 0 to lvMDev.Items.Count-1 do
    lvMDev.Items[i].Checked:=chkAll.Checked;
end;

procedure TfrmMain.btnUpLoadClick(Sender: TObject);
var
  i,isLoad,totalCount:Integer;
  hPort:THandle;
  conFailID,succeedID,empName,cardNO,empCode:string;
begin
  if DM1.adoQuickUpload.RecordCount=0 then
  begin
    ShowMessage('上传人员名单不能为空');
    Exit;
  end;
  if MessageDlg('确定要把左边的名单上传到选中的卡钟吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    conFailID:='';
    succeedID:='';
    totalCount:=DM1.adoQuickUpload.RecordCount;
    LockUI;
    try
      for i:=0 to lvMDev.Items.Count-1 do
      begin
        if lvMDev.Items[i].Checked=True then
        begin
          isLoad:=0;
          if ConDev(hPort,i) then
          begin
            DM1.adoQuickUpload.First;
            while not DM1.adoQuickUpload.Eof do
            begin
              empName:=DM1.adoQuickUpload.fieldbyname('chinesename').AsString;
              empCode:=DM1.adoQuickUpload.fieldbyname('employeecode').AsString;
              cardNO:=DM1.adoQuickUpload.fieldbyname('Cardno').AsString;
              if cardNO='' then cardNO:='0';
              if DllAPI.SetAllowedCard(hPort,PChar(Trim(cardNO)),PChar(Trim(empCode)),PChar(Trim(empName))) then
              begin
                Inc(isLoad);
              end;
              DM1.adoQuickUpload.Next;
            end;
          succeedID:= lvMDev.Items[i].SubItems[0]+ ' 号卡钟上传总数：' + IntToStr(totalCount) + ' 已成功数：' + IntToStr(isLoad) + #13 + succeedID;
          end
          else
          begin
            conFailID:= lvMDev.Items[i].SubItems[0] + ' 号卡钟连接失败，请检查网络后重试。' + #13+ conFailID;
          end;
        end;
      end;
    finally
      UnLockUI;
      DisConDev(hPort);
    end;
    if (succeedID+ conFailID)<>'' then ShowMessage(succeedID + conFailID);
  end;
end;

function TfrmMain.ConDev(var hPort: THandle;itemID:Integer): Boolean;
var
  DevTime:Double;
begin
  Result:=False;
  hPort:=DllAPI.OpenClientSocket(PAnsiChar(lvMDev.Items[itemID].SubItems[1]),DevPort);
  if CheckHandle(hPort) and DllAPI.CallClock(hPort,StrToIntDef(lvMDev.Items[itemID].SubItems[0],0)) then
  begin
    if DllAPI.ReadClockTime(hPort,DevTime) then
    begin
      Result:=True;
    end;
  end;
end;

procedure TfrmMain.edtEmployeeCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btnSearchClick(nil);
end;

procedure TfrmMain.eh1TitleClick(Column: TColumnEh);
begin
  FHotCol := Column;
  lbl8.Caption := FHotCol.Title.Caption;
end;

end.
