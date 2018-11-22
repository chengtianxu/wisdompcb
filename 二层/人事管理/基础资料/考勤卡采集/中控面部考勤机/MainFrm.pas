unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, ExtCtrls, Grids, DBGrids, Buttons, common,
  DBGridEh, DBClient, Provider, Menus;

type
  TfrmMain = class(TForm)
    lvDev: TListView;
    stat1: TStatusBar;
    sp1: TADOStoredProc;
    adslz: TADODataSet;
    ds1: TDataSource;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    btnSearch: TButton;
    btnReaddata: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btnViewLZ: TButton;
    grd1: TDBGrid;
    btnDeleLZ: TButton;
    tv1: TTreeView;
    pnl5: TPanel;
    btnFileToDB: TSpeedButton;
    lbl3: TLabel;
    lbl4: TLabel;
    qrytmp: TADOQuery;
    ts4: TTabSheet;
    ds2: TDataSource;
    qry2: TADOQuery;
    ts5: TTabSheet;
    qry2isSelect: TBooleanField;
    wdstrngfldqry2employeecode: TWideStringField;
    wdstrngfldqry2chinesename: TWideStringField;
    wdstrngfldqry2departmentname: TWideStringField;
    qry2ondutytime: TDateTimeField;
    btn3: TButton;
    dbgrideh4: TDBGridEh;
    pnl4: TPanel;
    btnViewDevUser: TButton;
    pnl6: TPanel;
    grp2: TGroupBox;
    Label2: TLabel;
    edt2: TEdit;
    dbgrideh2: TDBGridEh;
    btn1: TButton;
    lv3: TListView;
    btn5: TButton;
    Label1: TLabel;
    Label3: TLabel;
    ds3: TDataSource;
    qry3: TADOQuery;
    btn6: TButton;
    btn4: TButton;
    dbgrideh3: TDBGridEh;
    lvUser: TListView;
    edt1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    lv1: TListView;
    btn8: TButton;
    btn9: TButton;
    wdstrngfldqry3departmentname: TWideStringField;
    wdstrngfldqry3employeecode: TWideStringField;
    wdstrngfldqry3chinesename: TWideStringField;
    qry3ondutytime: TDateTimeField;
    btn2: TButton;
    lv2: TListView;
    btn7: TButton;
    Label6: TLabel;
    qry3faceTag: TStringField;
    qry3fingerTag: TStringField;
    btn10: TButton;
    con1: TADOConnection;
    btn12: TButton;
    btn13: TButton;
    qry4: TADOQuery;
    wdstrngfld1: TWideStringField;
    wdstrngfld2: TWideStringField;
    wdstrngfld3: TWideStringField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    ds4: TDataSource;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edt3: TEdit;
    Label12: TLabel;
    edt4: TEdit;
    btn14: TButton;
    btn15: TButton;
    Label11: TLabel;
    Label13: TLabel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    pb5: TProgressBar;
    Label10: TLabel;
    ts6: TTabSheet;
    dbgrideh5: TDBGridEh;
    btn16: TButton;
    edt5: TEdit;
    Label14: TLabel;
    btn17: TButton;
    Label15: TLabel;
    Label16: TLabel;
    btn18: TButton;
    qry5: TADOQuery;
    ds5: TDataSource;
    wdstrngfldqry5departmentname: TWideStringField;
    wdstrngfldqry5employeecode: TWideStringField;
    wdstrngfldqry5chinesename: TWideStringField;
    qry5ondutytime: TDateTimeField;
    qry5faceTag: TStringField;
    qry5fingerTag: TStringField;
    lv4: TListView;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox1: TGroupBox;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    ListView1: TListView;
    ListView2: TListView;
    Button1: TButton;
    Button2: TButton;
    Label20: TLabel;
    CheckBox1: TCheckBox;
    Button3: TButton;
    TabSheet2: TTabSheet;
    Button4: TButton;
    Button5: TButton;
    Label23: TLabel;
    adslzemployeecode: TWideStringField;
    adslzchinesename: TWideStringField;
    adslzoutdutytime: TDateTimeField;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    lblDevTime: TLabel;
    lblLocalTime: TLabel;
    Timer1: TTimer;
    btn11: TButton;
    qry2faceflag: TIntegerField;
    btn19: TBitBtn;
    btn20: TBitBtn;
    btn21: TBitBtn;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    qry_set_reg: TADOQuery;
    qry_cancel_reg: TADOQuery;
    CheckBox2: TCheckBox;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    qry_createtable: TADOQuery;
    qry_droptable: TADOQuery;
    Image1: TImage;
    Label21: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnReaddataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnViewLZClick(Sender: TObject);
    procedure btnDeleLZClick(Sender: TObject);
    procedure btnViewDevUserClick(Sender: TObject);
    procedure btnFileToDBClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure dbgrideh2TitleClick(Column: TColumnEh);
    procedure pgc1Change(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure edt3Change(Sender: TObject);
    procedure dbgrideh4TitleClick(Column: TColumnEh);
    procedure lv3ColumnClick(Sender: TObject; Column: TListColumn);
    procedure lv3Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lv3CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lv1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure lv1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure dbgrideh3TitleClick(Column: TColumnEh);
    procedure btn18Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure dbgrideh5TitleClick(Column: TColumnEh);
    procedure edt5Change(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btn19Click(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    FBDrop: Boolean; 
    pb: TProgressBar;
    FTextFile: String;
    PreColumn: TColumnEh;
    field_name: string;
    facekq_reg_IP: string;   //注册机IP
    facekq_reg_NO: Integer;  //注册机标号
    SortCol: Integer;
    SortWay: Integer;
    qry2SQL: string;
    GetLocalIP_str :string;
    devlist_sql: string;//机器清单
    devlist_reg_sql: string;
    devlist_sql_flag: string;//机器查找方案
    DevTime: TDateTime;
    DevTimeStartFlag: Integer;
    procedure XMLToDB(AFile: string);
    procedure InitPB;
    procedure freshdevlist;  //刷新机器列表
    procedure DataFileToTv(ADataFile: string);
  public
    { Public declarations }
    function CheckOperatorLock: Boolean;
    function GetRegistDev: Integer;
    function GetAllDevTime: Integer;
    function ReadDevDataToDB: Integer;
    function ExecStoreProc: Integer;
    function DeleteDevData: Integer;
  end;

  TThPf = function: Integer of object;

  TPfThread = class(TThread)
  private
    Fpf: TThPf;
  protected
    procedure Execute();override;
    constructor Create(Apf: TThPf);
    destructor Destroy;

  end;

var
  frmMain: TfrmMain;

implementation

uses
 WZ_gUnit,FaceDllInterface, FrmModeWait, DateUtils, DataMgr2, ActiveX,XMLIntf,
 zkemkeeper_TLB;//, PubFunc;  //

{$R *.dfm}

var
  gEventHandle : THandle;

procedure WaitFrmShowMsg(AStr: string);
begin
  MessageBox(Application.Handle,PChar(AStr),'提示',MB_OK);
end;
  
{ TfrmMain }

function TfrmMain.CheckOperatorLock: Boolean;
var
  table_name: string;
begin
  Result := True;
  table_name := '##WZ_CardMgr';
   try
     qrytmp.Close;
     qrytmp.SQL.Clear;
     qrytmp.SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
     ' select data0073.USER_FULL_NAME from '+table_name+' inner join data0073 on'+#13+
     table_name+'.rkey73=data0073.rkey'+#13+
     ' else select data0073.USER_FULL_NAME from data0073 WHERE data0073.RKey = -1 ';
     qrytmp.Open;
     if qrytmp.IsEmpty then
     begin
       qrytmp.Close;
       qrytmp.SQL.Clear;
       qrytmp.SQL.Add('select '+ gUser.User_Longin_Ptr +' as rkey73 into '+table_name);
       if qrytmp.ExecSQL <= 0 then
       begin
         ShowMessage('锁定失败!');
         FBDrop := False;
         Exit;
       end else
       begin
        FBDrop := True;
        Result := False;
       end;
       qrytmp.Close;
     end else
     begin
       ShowMessage('程序已经锁定，' + qrytmp.fieldByName('USER_FULL_NAME').AsString +' 正在导入数据！');
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
      InitPB;
   end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  table_name: string;
begin
 qry_droptable.ExecSQL; //释放对比名单临时表
  {
  if FBDrop then
  begin
    table_name := '##WZ_CardMgr';
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
    ' drop table '+table_name;
    qrytmp.ExecSQL;
  end;
  pb.Free;
  }
end;

procedure TfrmMain.InitPB;
var
  i: Integer;
begin
  pb := TProgressBar.Create(stat1);
  pb.Parent := stat1;
  pb.Position := 0;
  pb.Top := 2;
  for i := 0 to 4 do
    pb.Left := pb.Left + stat1.Panels[i].Width;
  pb.Left := pb.Left + 2;
  pb.Width := stat1.Panels[5].Width;
  pb.Visible := True;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  LThread: TPfThread;
begin
  gEventHandle := CreateEvent(nil, False, False, 'SearchDev');
  LThread := TPfThread.Create(GetRegistDev);
  try
    LThread.Resume;
    ShowWaitFrm(Self,'正在搜索已经注册的面部考勤机...');
    while WaitForSingleObject(gEventHandle,30) <> Wait_Object_0 do Application.ProcessMessages;
    if LThread.ReturnValue <> 1 then Exit;
  finally
    CloseHandle(gEventHandle);
    LThread.Free;
  end;
  
  gEventHandle := CreateEvent(nil, False, False, 'GetDevTime');
  LThread := TPfThread.Create(GetAllDevTime);
  try
    LThread.Resume;
    ShowWaitFrm(Self,'正在尝试连接已经注册的面部考勤机...');
    while WaitForSingleObject(gEventHandle,2) <> Wait_Object_0 do Application.ProcessMessages;
    if LThread.ReturnValue <> 1 then Exit;
  finally
    CloseHandle(gEventHandle);
    LThread.Free;
  end;
end;

function TfrmMain.GetRegistDev: Integer;
begin
  Result := 1;
  qrytmp.SQL.Clear;
  //qrytmp.SQL.Add('SELECT * FROM Dev_detail WHERE purpose = ' + QuotedStr('facekq') + ' order by devid');
  //此处修改为按用户分厂区加载2014-06-22
  qrytmp.SQL.Text := devlist_sql;

  try
    qrytmp.Open;
    if qrytmp.IsEmpty then
    begin
      WaitFrmShowMsg('没有注册的面部考勤机');
    end else
    begin
      lvDev.Items.Clear;
      qrytmp.First;
      while not qrytmp.Eof do
      begin
        with lvDev.Items.Add do
        begin
          Caption := '';
          SubItems.Add(qrytmp.fieldbyname('devid').AsString);
          SubItems.Add(qrytmp.fieldbyname('dev_ip').AsString);
          SubItems.Add(qrytmp.fieldbyname('position').AsString);
          SubItems.Add('');
          SubItems.Add('未连接');
        end;
        qrytmp.Next;
      end;
    end;
  except
    WaitFrmShowMsg('连接数据库失败');
    Result := 0;
    Exit;
  end;
end;

function TfrmMain.GetAllDevTime: Integer;
var
  I: Integer;
  Lyear,LMonth,LDay,LHour,LMin,LSec: Integer;
begin
  Result := 1;
  for I := 0 to lvDev.Items.Count - 1 do
  begin
    if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]),4370) then
    begin
      try
        gDev.GetDeviceTime(StrToInt(Trim(lvDev.Items[I].SubItems[0])),Lyear,LMonth,LDay,LHour,LMin,LSec);
        lvDev.Items[I].SubItems[3] := IntToStr(Lyear) + '-' + IntToStr(LMonth) + '-' + IntToStr(LDay) +
        ' ' + IntToStr(LHour) + ':' + IntToStr(LMin) + ':' + IntToStr(LSec);
        lvDev.Items[I].SubItems[4] := '已经连接';
      finally
        gDev.Disconnect;
      end;
    end;
  end;
end;

{ TPbThread }

constructor TPfThread.Create(Apf: TThPf);
begin
 //  CoInitialize(nil);
  inherited Create(True);
  Fpf := Apf;
  FreeOnTerminate := False;
end;

destructor TPfThread.Destroy;
begin
  //CoUninitialize;
end;

procedure TPfThread.Execute;
begin
  inherited;
  try
    if Assigned(fpf) then Self.ReturnValue := Fpf;
  finally
    CloseWaitFrm;
    SetEvent(gEventHandle)  
  end;
end;

function TfrmMain.ReadDevDataToDB: Integer;
var
  I: Integer;
  LUserCardID: WideString;//用户卡ID
  LCardMode: Integer; //打卡类型0-密码，1-指纹。其他等等
  LInOutMode: Integer;
  Lyear,LMonth,LDay,LHour,LMin,LSec: Integer;
  LWordCode: Integer;

  XMLMgr: TDataMgr;
  MainNode: IXMLNode;
  LDevNode: IXMLNode;  

begin
  Result := 0;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add('SELECT * FROM employeecard_eastriver_rcd WHERE 1 = 0');
  qrytmp.Open;
  XMLMgr := TDataMgr.Create;
  MainNode := XMLMgr.AddNode(nil,'MainNode');
  try
    //将所有的选择的取到本地然后才删除
    for I := 0 to lvDev.Items.Count - 1 do
    begin
      if lvDev.Items[I].Checked then
      begin
        LDevNode := MainNode.AddChild('IP_' + lvDev.Items[I].SubItems[1]);
        LDevNode.Attributes['DevNo'] := lvDev.Items[I].SubItems[0];
        if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]),4370) then
        begin
          try
            if gDev.ReadAllGLogData(StrToInt(Trim(lvDev.Items[I].SubItems[0]))) then
              begin
                while True do
                begin
                  LUserCardID := '';
                  if not gDev.SSR_GetGeneralLogData(StrToInt(Trim(lvDev.Items[I].SubItems[0])),
                    LUserCardID,LCardMode,LInOutMode,Lyear,LMonth,LDay,LHour,LMin,LSec,LWordCode)
                  then Break;
                  qrytmp.Append;
                  qrytmp.FieldByName('empno').AsString := LUserCardID;
                  qrytmp.FieldByName('employeecard').AsString := LUserCardID;
                  qrytmp.FieldByName('card_time').AsDateTime := EncodeDate(Lyear,LMonth,LDay) + EncodeTime(LHour,LMin,LSec,0);
                  qrytmp.FieldByName('date_e').AsString := FormatDateTime('YYYY-MM-DD',EncodeDate(Lyear,LMonth,LDay));
                  qrytmp.FieldByName('time_e').AsString := FormatDateTime('hh:mm:ss',EncodeTime(LHour,LMin,LSec,0));
                  qrytmp.FieldByName('dev_id').AsString := Trim(lvDev.Items[I].SubItems[0]);
                  with LDevNode.AddChild('CardInfo') do
                  begin
                    Attributes['CardNo'] := qrytmp.FieldByName('employeecard').AsString;
                    Attributes['CardTime'] := FormatDateTime('YYYY-MM-DD hh:mm:ss',qrytmp.FieldByName('card_time').AsDateTime);
                    Attributes['HasIntoDB'] := 'T';
                  end;
                  qrytmp.Post;
                end;
              end
            else
              begin
                WaitFrmShowMsg('读取设备' + Trim(lvDev.Items[I].SubItems[0]) + '考勤记录为空, 采卡失败 。');
                Exit;
              end;
          finally
            gDev.Disconnect;
          end;
        end else
        begin
          WaitFrmShowMsg('连接设备' + Trim(lvDev.Items[I].SubItems[0]) + '失败, 采卡失败 。');
          Exit;
        end;
      end;
    end;
    XMLMgr.SaveToFile(FTextFile);
    Result := 1;
  except
    Result := 0;
    WaitFrmShowMsg('采集考勤数据到数据失败，采集考勤卡失败');
  end;
  XMLMgr.Free;
end;

procedure TfrmMain.btnReaddataClick(Sender: TObject);   
var
  LThread: TPfThread;
   svDlg: TSaveDialog;
    table_name: string;
    begindate,enddate,dayscross:string;
begin
  if frmMain.CheckOperatorLock then Exit;   //判断是否有其他采集操作；
  if lvDev.Items.Count = 0 then Exit;
 svDlg := TSaveDialog.Create(Self);
  try
    svDlg.Filter := '.data';
    svDlg.DefaultExt := 'data';
    svDlg.FileName := FormatDateTime('yyyyMMddhhmmss', Now());
    if svDlg.Execute then
      FTextFile := svDlg.FileName
    else
       begin
        FBDrop := True;
          if FBDrop then
          begin
            table_name := '##WZ_CardMgr';
            qrytmp.Close;
            qrytmp.SQL.Clear;
            qrytmp.SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
            ' drop table '+table_name;
            qrytmp.ExecSQL;
          end;
          Exit;
        end;
  finally
    FreeAndNil(svDlg);
  end;

  if not con1.InTransaction then con1.BeginTrans;
  try
    gEventHandle := CreateEvent(nil, False, False, 'ReadDevDate');
    LThread := TPfThread.Create(ReadDevDataToDB);
    try
      LThread.Resume;
      ShowWaitFrm(Self,'正在采集面部考勤机打卡数据到数据库...');
      while WaitForSingleObject(gEventHandle,30) <> Wait_Object_0 do Application.ProcessMessages;
      if LThread.ReturnValue <> 1 then Exit;
    finally
      CloseHandle(gEventHandle);
      LThread.Free;
    end;
    gEventHandle := CreateEvent(nil, False, False, 'DeleDevDate');
    LThread := TPfThread.Create(DeleteDevData);
    try
      LThread.Resume;
      ShowWaitFrm(Self,'考勤数据已经导入数据库中，正在清除面部考勤机打卡数据...');
      while WaitForSingleObject(gEventHandle,30) <> Wait_Object_0 do Application.ProcessMessages;
      if LThread.ReturnValue <> 1 then Exit;
    finally
      CloseHandle(gEventHandle);
      LThread.Free;
    end;
    con1.CommitTrans;
  except
    if con1.InTransaction then con1.RollbackTrans;
  end;
  //此处添加本次分析的最小时间和最大时间，并提示日期跨度
   qrytmp.Close;
   qrytmp.SQL.Clear;
   qrytmp.SQL.Text:= 'select isnull(max(card_time),getdate())as maxcardtime, ' +
    ' isnull(min(card_time),getdate())as mincardtime,  '  +
    ' datediff(day,isnull(min(card_time),getdate()),isnull(max(card_time),getdate())) as dayscross '+
    ' from dbo.employeecard_eastriver_rcd  ';
   qrytmp.ExecSQL;
   qrytmp.Open;
   enddate := FormatDateTime('yyyy-MM-dd HH:mm:ss',qrytmp.fieldbyname('maxcardtime').Value);
   begindate := FormatDateTime('yyyy-MM-dd HH:mm:ss',qrytmp.fieldbyname('mincardtime').Value);
   dayscross :=  qrytmp.fieldbyname('dayscross').AsString;
   qrytmp.Close;
  //
  //
  //
  gEventHandle := CreateEvent(nil, False, False, 'ExecStorProc');
  LThread := TPfThread.Create(ExecStoreProc);
  try
    LThread.Resume;
    ShowWaitFrm(Self,'考勤日期从: '+begindate+' 到 '+enddate+' 跨度'+dayscross+'天'+#13+'采集考勤数据到数据库中完毕,正在执行存储过程...');
    while WaitForSingleObject(gEventHandle,30) <> Wait_Object_0
    do Application.ProcessMessages;
    if LThread.ReturnValue <> 1 then Exit;
  finally
    CloseHandle(gEventHandle);
    LThread.Free;
    FBDrop := True;
  end;   
 if FBDrop then
  begin
    table_name := '##WZ_CardMgr';
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
    ' drop table '+table_name;
    qrytmp.ExecSQL;
  end;
  pb.Free;   //结束本次采集操作；
  ShowMessage('采集考勤记录成功');
  if StrToInt(dayscross)>20 then ShowMessage('考勤日期首尾差距大，请注意检查每台机器的日期');

end;

function TfrmMain.ExecStoreProc: Integer;
begin
  try
    sp1.ExecProc;
    Result := 1;
  except
    Result := 0;
    WaitFrmShowMsg('采集完毕执行存储过程失败');
  end;
end;

function TfrmMain.DeleteDevData: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]),4370) then
      begin
        try
          if not gDev.ClearGLog(StrToInt(Trim(lvDev.Items[I].SubItems[0]))) then
          begin
            WaitFrmShowMsg('清除' + Trim(lvDev.Items[I].SubItems[0]) + ' 设备内考勤记录失败, 采卡失败 。');
            Exit;
          end;
        finally
          gDev.Disconnect;
        end;
      end else
      begin
        WaitFrmShowMsg('连接设备' + Trim(lvDev.Items[I].SubItems[0]) + '失败, 清除机器内考勤数据 。');
        Exit;
      end;
    end;
  end;
  Result := 1; 
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  dtp1.Date := IncMonth(Now,-1);
  dtp2.Date := Now;
  freshdevlist;
   pgc1.ActivePageIndex := 0;
//  N2.Enabled:=False;
//  N5.Enabled:=False;
end;

procedure TfrmMain.btnViewLZClick(Sender: TObject);
begin
  if adslz.Active then adslz.Close;
  adslz.Parameters[0].Value := dtp1.Date;
  adslz.Parameters[1].Value := dtp2.Date;
  //ShowMessage(adslz.CommandText + DateToStr(dtp1.Date) + DateToStr(dtp2.Date));
  adslz.Open;
end;

procedure TfrmMain.btnDeleLZClick(Sender: TObject);
var
  I: Integer;
begin
  if MessageBoxA(Handle,'是否将以下人员从考勤机删除','提示 ',MB_YESNO) <> IDYEs then Exit;
  try
    lvDev.Enabled := False;
    pgc1.Enabled := False;
    screen.Cursor := crSQLWait;
    for I := 0 to lvDev.Items.Count - 1 do
    begin
      if lvDev.Items[I].Checked then
      begin
        if adslz.Active and ( not adslz.IsEmpty) then
        begin
          adslz.First;
          try
            if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]),4370) then
            begin
              while not adslz.Eof do
              begin
                if adslz.fieldbyname('employeecode').AsString <>'' then
                begin
                  gDev.SSR_DeleteEnrollData(StrToInt(Trim(lvDev.Items[I].SubItems[0])),adslz.fieldbyname('employeecode').AsString,12);
                  //gDev.SSR_DeleteEnrollData(StrToInt(Trim(lvDev.Items[I].SubItems[0])),'1111',12);
                end;
                adslz.Next;
              end;
            end;
          finally
            gDev.Disconnect;
          end;
        end;
      end;
    end;
    screen.Cursor := crDefault;
    ShowMessage('删除完毕');
  finally
    lvDev.Enabled := True;
    pgc1.Enabled := True;
  end;
end;

procedure TfrmMain.btnViewDevUserClick(Sender: TObject);
var
  i,j,flag: Integer;
begin
  lvuser.Items.Clear;
  
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Text :='truncate table #lvuser insert into #lvuser select employeecode,chinesename  from #lvdbgrideh  where employeecode not in  (select employeecode from #lv1 where faceflag='+#39+'有'+#39+')'+
  ' select * from #lvuser';
  qrytmp.ExecSQL;
  qrytmp.Open;
  i:=0;
  j:=0;
  while not qrytmp.Eof do
  begin    
    with lvUser.Items.Add do
        begin
          Caption := qrytmp.FieldByName('employeecode').Value;
          SubItems.Add(qrytmp.FieldByName('chinesename').Value);
        end;
    qrytmp.Next;
  end;

  {
  qry3.First;
  lvuser.Items.Clear;
  while  not  qry3.eof   do
  begin
    flag := 0;
    for j := 0 to lv1.Items.Count-1  do
    begin
      if qry3.FieldByName('employeecode').Value = lv1.Items[j].Caption
      then flag := 1;   //在本机中已经有名单。可对比

      if (qry3.FieldByName('employeecode').Value = lv1.Items[j].Caption)
        and (lv1.Items[j].SubItems.strings[1] <> '有') then
      begin 
        with lvUser.Items.Add do
        begin
          Caption := qry3.FieldByName('employeecode').Value;
          SubItems.Add(qry3.FieldByName('chinesename').Value);
        end;
      end;
    end;
    if flag = 0 then
    begin
      with lvUser.Items.Add do
      begin
        Caption := qry3.FieldByName('employeecode').Value;
        SubItems.Add(qry3.FieldByName('chinesename').Value);
      end;
    end;
    qry3.Next;
    application.ProcessMessages;
  end;
  }
  Label23.Caption := IntToStr(lvUser.Items.Count);
  ShowMessage('查看完毕'); 
end;


procedure TfrmMain.btnFileToDBClick(Sender: TObject);
var   
    table_name: string;
begin

  if frmMain.CheckOperatorLock then Exit;   //判断是否有其他采集操作；

  with TOpenDialog.Create(Self) do
  begin
    Filter :='*.data|*.data';
    FilterIndex := 0;
    if Execute then
    begin
      lbl4.Caption := FileName;
      DataFileToTv(FileName);
    end;
    if MessageBoxA(Handle,'是否导入到数据库','提示',MB_YESNO) = IDYES then
      XMLToDB(FileName); 
    Free;
  end;
   FBDrop := True;

    if FBDrop then
  begin
    table_name := '##WZ_CardMgr';
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
    ' drop table '+table_name;
    qrytmp.ExecSQL;
  end;
  
  pb.Free;   //结束本次采集操作；

end;

procedure TfrmMain.DataFileToTv(ADataFile: string);
var
  MainNode, DevNode, CardNode: IXMLNode;
  XMLMgr: TDataMgr;
  I,N: Integer;
  MainTNode, DevTNode: TTreeNode;

  DevIP,DevNo: string;
  CardNo, CardTime, HasInToDB: string;
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
            CardTime := CardNode.Attributes['CardTime'];
            tv1.Items.AddChild(DevTNode,'卡号: ' + CardNo + '       时间: ' + CardTime + '         导入过: ' + HasInToDB);
          end;
        end;
      end else
        ShowMessage('不是有效的数据文件');
    finally
      XMLMgr.Free;
    end;
  end;
end;

procedure TfrmMain.XMLToDB(AFile: string);
var
  XMLMgr: TDataMgr;
  MainNode,DevNode,CardNode: IXMLNode;
  I,N: Integer;
  DevIP,DevNo,CardNo,CardTime: string;
  Errstr: string;
  nn: Integer;
begin
  Screen.Cursor := crSQLWait;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add('SELECT * FROM employeecard_eastriver_rcd WHERE 1 = 0');
  qrytmp.Open;
  con1.BeginTrans;
  if FileExists(AFile) then
  begin
    XMLMgr := TDataMgr.Create;
    try
      if XMLMgr.LoadXML(AFile) = frSOK then
      begin
        MainNode := XMLMgr.MainNode;
        for I := 0 to MainNode.ChildNodes.Count - 1 do
        begin
          DevNode := MainNode.ChildNodes[I];
          DevIP := DevNode.NodeName;
          DevNo := DevNode.Attributes['DevNo'];
          ErrStr := ErrStr + #13#10 + DevIP + '  总数:' + IntToStr(DevNode.ChildNodes.Count) + '条';
          nn := 0;
          for N := 0 to DevNode.ChildNodes.Count - 1 do
          begin
            CardNode := DevNode.ChildNodes[N];
            CardNo := CardNode.Attributes['CardNo'];
            CardTime := CardNode.Attributes['CardTime'];
            qrytmp.Append;
            qrytmp.FieldByName('empno').AsString := CardNo;
            qrytmp.FieldByName('employeecard').AsString := CardNo;
            qrytmp.FieldByName('card_time').AsDateTime := StrToDateTime(CardTime);
            qrytmp.FieldByName('date_e').AsString := FormatDateTime('YYYY-MM-DD',StrToDateTime(CardTime));
            qrytmp.FieldByName('time_e').AsString := FormatDateTime('hh:mm:ss',StrToDateTime(CardTime));
            qrytmp.FieldByName('dev_id').AsString := Trim(DevNo);
            qrytmp.Post;
            inc(nn);
            Application.ProcessMessages;
          end;
          Errstr := Errstr + '  导入:' + IntToStr(nn) + '条';
        end;
        con1.CommitTrans;

      end else
        ShowMessage('文件类型不正确!');
    finally
      XMLMgr.Free;
      if con1.InTransaction then con1.RollbackTrans;
    end;
  end;

  ExecStoreProc;

  ShowMessage('导入完毕' + #13  + Errstr );
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.btn1Click(Sender: TObject);
var
  i: Integer;
  Msg: string;
begin
  if dbgrideh2.SelectedRows.Count <= 0 then
  begin
    showmessage('请选择一个员工进行下载...');
    Exit;
  end;
  screen.Cursor := crSQLWait;
  if gDev.Connect_Net(facekq_reg_IP,4370) then
  begin
    Msg := '注册机已连接成功！' + #13 + #13
      + '是否将下列ERP人员信息添加到注册机: ['
      + inttostr(facekq_reg_NO) +']号面部机器';
    if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

    pb5.Position := 0;
    pb5.Max := qry2.RecordCount;
    qry2.First;
    for i := 0 to qry2.RecordCount - 1 do
    begin
      if gDev.SSR_SetUserInfo(facekq_reg_NO, qry2.FieldByName('employeecode').Value, qry2.FieldByName('chinesename').Value, '', 0, True) then
      begin
        pb5.Position := pb5.Position + 1;
        stat1.Panels[7].Text := inttostr(pb5.Position); 
      end;
      qry2.Next;
    end;
    showmessage('注册完毕！');
    pb5.Position := 0;
    screen.Cursor := crDefault;
  end
  else
  begin
    showmessage(inttostr(facekq_reg_NO) + '号机器连接异常，请联系管理员！');
  end;
end;

procedure TfrmMain.btn3Click(Sender: TObject);
var
  vtmpdata,vtmpdata2: widestring;
  i, j, vtmplength, EmpRkey, outflag, vtmplength2, h, g, k: integer;
  fs,fs2: TStringStream;
begin
  j := 0;
  for I := 0 to lv3.Items.Count - 1 do
  begin
    if lv3.Items[I].Checked then
    begin
      j := j + 1;
    end;
  end;
  if j <=0 then
  begin
    showmessage('请选择一条记录进行下载！');
    Exit;
  end;
  lv3.SetFocus;
  lv3.Items[0].Selected := True;
  screen.Cursor := crSQLWait;
  if gDev.Connect_Net(facekq_reg_IP, 4370) then  // facekq_reg_IP
  begin
    pb5.Position := 0;
    pb5.Max := j;
    j := 0;
    k := 0;
    h := 0;
    for I := 0 to lv3.Items.Count - 1 do
    begin
      if lv3.Items[I].Checked then
      begin
        h := h + 1;
        qrytmp.Close;
        qrytmp.SQL.Clear;
        qrytmp.SQL.text := 'select rkey from employeemsg where employeecode= '
          + quotedstr(lv3.Items[I].Caption);
        qrytmp.Open;
        if qrytmp.IsEmpty then Continue;
        EmpRkey := qrytmp.FieldValues['rkey'];
        if gDev.getuserfacestr(facekq_reg_NO, Trim(lv3.Items[I].Caption), 50, vtmpdata, vtmplength) then //facekq_reg_NO
        begin
          try
            fs := TStringStream.Create('');
            fs.WriteString(vtmpdata);
            qrytmp.Close;
            qrytmp.SQL.Clear;
            qrytmp.SQL.Add(' update employee_facedata  '+
            ' set  face_data=:file_data_s,face_length='+inttostr(vtmplength)+
            ' where exists (select employeeid from employee_facedata where employeeid='+inttostr(EmpRkey)+
            ') and employeeid='+inttostr(EmpRkey) ) ;
            qrytmp.Parameters.ParamByName('file_data_s').LoadFromStream(fs,ftBlob);
            qrytmp.ExecSQL;
            //先覆盖，再插入
            qrytmp.Close;
            qrytmp.SQL.Clear;
            qrytmp.SQL.Add(' insert into employee_facedata(employeeid,face_data,face_length)  '+
            'select ' + inttostr(EmpRkey) + ',:file_data_s,'+inttostr(vtmplength)+
            ' where not exists (select employeeid from employee_facedata where employeeid='+inttostr(EmpRkey)+')' ) ;
            qrytmp.Parameters.ParamByName('file_data_s').LoadFromStream(fs,ftBlob);
            qrytmp.ExecSQL;
            g := g + 1;
          finally
            fs.Free;
          end;
        end;
//        ShowMessage(IntToStr(facekq_reg_NO));
//        ShowMessage(trim(lv3.Items[i].caption));
        if gdev.GetUserTmpExStr(facekq_reg_NO,trim(lv3.Items[i].caption),0,outflag,vtmpdata2,vtmplength2) then  //facekq_reg_NO
        begin
//          ShowMessage(IntToStr(outflag));
//          ShowMessage(vtmpdata2);
//          ShowMessage(IntToStr(vtmplength2));
          if vtmplength2>1 then
          try
            fs2 := TStringStream.Create('');
            fs2.WriteString(vtmpdata2);
            qrytmp.Close;
            qrytmp.SQL.Clear;
            qrytmp.SQL.Add(' update  employee_facedata '+
            ' set finger_1 = :file_data_s2 ,'+
            ' finger_1_length= '+inttostr(vtmplength2)+
            ' ,finger_out_flag='+inttostr(outflag)+
            ' where employeeid='+ inttostr(EmpRkey));
            qrytmp.Parameters.ParamByName('file_data_s2').LoadFromStream(fs2,ftBlob);
            qrytmp.ExecSQL;
            k := k + 1;
          finally
            fs2.Free;
          end;
        end else if gdev.GetUserTmpExStr(facekq_reg_NO,trim(lv3.Items[i].caption),6,outflag,vtmpdata2,vtmplength2) then  //facekq_reg_NO
        begin
//          ShowMessage(IntToStr(outflag));
//          ShowMessage(vtmpdata2);
//          ShowMessage(IntToStr(vtmplength2));
          if vtmplength2>1 then
          try
            fs2 := TStringStream.Create('');
            fs2.WriteString(vtmpdata2);
            qrytmp.Close;
            qrytmp.SQL.Clear;
            qrytmp.SQL.Add(' update  employee_facedata '+
            ' set finger_1 = :file_data_s2 ,'+
            ' finger_1_length= '+inttostr(vtmplength2)+
            ' ,finger_out_flag='+inttostr(outflag)+
            ' where employeeid='+ inttostr(EmpRkey));
            qrytmp.Parameters.ParamByName('file_data_s2').LoadFromStream(fs2,ftBlob);
            qrytmp.ExecSQL;
            k := k + 1;
          finally
            fs2.Free;
          end;
        end;
        pb5.Position := pb5.Position + 1;
        application.ProcessMessages;
      end;
    end;
  end;
  qry4.Close;
  qry4.Open;
  screen.Cursor := crDefault;
  showmessage('本次预计下载数目: ' + inttostr(h) + #13
    + '成功下载人脸:' + inttostr(g) + '条, 指纹' + inttostr(h) + '条');
end;

procedure TfrmMain.btn4Click(Sender: TObject);
var
  i, j, k, outflag, outlen: Integer;
  len, Reclen,len2,Reclen2,longname: longint;
  fs: TStringStream;
  fs2: TStringStream;
  byte1 : Byte;
  vtmpdata, RecVtmpdata: WideString;
  vtmpdata2, RecVtmpdata2: WideString;
  outvtmpdata: WideString;
  IPGoal, NOGoal: String;     //选中机器IP、机器号
begin
  if lvUser.Items.Count <= 0 then
  begin
    showmessage('当前无待添加名单，请检查！');
    Exit;
  end;
  for I := 0 to lvDev.Items.Count - 1 do   //获取选中机器的IP, 机器号
  begin
    if lvDev.Items[I].Checked then
    begin
      IPGoal := Trim(lvDev.Items[I].SubItems[1]);
      NOGoal := Trim(lvDev.Items[I].SubItems[0]);
      break;
    end;
  end;
  screen.Cursor := crSQLWait;

  j := 0;
  k := 0;
  lvUser.SetFocus;
  lvUser.Items[0].Selected := True;
  pb5.Position := 0;
  pb5.Max := lvUser.Items.Count;
  for i := 0 to lvUser.Items.Count - 1 do
  begin
    try
      try
        if gDev.Connect_Net(IPGoal, 4370) then  //IPGoal
        begin
          qrytmp.Close;
          qrytmp.SQL.Clear;
          qrytmp.SQL.Text:='select face_data, face_length, finger_1, finger_1_length,finger_out_flag from employee_facedata where employeeid '+
          ' = ( select rkey from employeemsg where employeecode='
            + quotedstr(lvuser.Items[i].Caption)+')';
          qrytmp.Open;
          len := qrytmp.FieldValues['face_length'];  //人脸长度
          fs:=TStringStream.Create('');  //接收端
          TBlobfield(qrytmp.fieldbyname('face_data')).SaveToStream(fs);  //人脸信息（二进制数据）
          vtmpdata := fs.DataString;    //将字符串流转成字符串

          if not qrytmp.FieldByName('finger_1').IsNull then
          begin
            fs2:=TStringStream.Create('');  //接收端
            len2 := qrytmp.FieldValues['finger_1_length'];  //指纹长度
            outflag := qrytmp.FieldValues['finger_out_flag'];//指纹编号
            TBlobfield(qrytmp.fieldbyname('finger_1')).SaveToStream(fs2);  //指纹信息（二进制数据）
            vtmpdata2 := fs2.DataString;    //将字符串流转成字符串
          end;

          //获取本次添加人员是否在机器中已有人脸数据，如果有则从机器中删除，
          if gDev.GetUserFaceStr(strtoint(NOGoal), lvuser.Items[i].Caption, 50, outvtmpdata, Outlen) then
          begin
            if Outlen > 0 then gdev.SSR_DeleteEnrollData(strtoint(NOGoal),lvuser.Items[i].Caption,12);
          end;

          //将员工信息写入机器名单中
          gdev.SSR_SetUserInfo(strtoint(NOGoal),lvuser.items[i].Caption,lvuser.Items[i].SubItems.Strings[0],'',0,true);

          if TryStrToInt(lvuser.items[i].Caption,longname)  then
          gDev.SetUserInfoEx(strtoint(NOGoal),longname,128,byte1);
          
          //上传人脸数据
          if gDev.setuserfacestr(strtoint(NOGoal), lvuser.Items[i].Caption, 50, vtmpdata, len)
          then j := j + 1;

          //上传指纹数据
          if not qrytmp.FieldByName('finger_1').IsNull then
          begin
            if gdev.SetUserTmpExStr(strtoint(NOGoal),lvuser.Items[i].Caption,0,outflag,vtmpdata2)
            then k := k + 1;
          end;

          application.ProcessMessages;
          stat1.Panels[7].Text := '人脸:'+ inttostr(j)+ ', 指纹:' + inttostr(k);
          pb5.Position := pb5.Position + 1;
        end;
        {else
        begin
          if MessageBoxA(Handle,'上传名单异常，是否继续？','提示 ',MB_YESNO) <> IDYEs then Exit;
          Continue;
        end; }
      finally
        fs.Free;
        fs2.Free;
      end;
    except
      //if MessageBoxA(Handle,'上传名单异常，是否继续？','提示 ',MB_YESNO) <> IDYEs then Exit;
      Continue;
    end;
  end;
  screen.Cursor := crDefault;
  pb5.Position := 0;
  showmessage('本次预上传' + inttostr(lvUser.Items.Count)+ '条记录, '
    + ' 人脸成功:' + inttostr(j) + '条，' + '指纹成功:' + inttostr(k) + '条，');
  lvUser.Items.Clear;
  Label23.Caption := IntToStr(lvUser.Items.Count);
end;

procedure TfrmMain.dbgrideh2TitleClick(Column: TColumnEh);
begin
  if dbgrideh2.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry2.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry2.Sort:=Column.FieldName+' DESC';
  end;
  if dbgrideh2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    Label2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt2.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt2Change(edt2);
  end
  else
    edt2.SetFocus;
end;

procedure TfrmMain.pgc1Change(Sender: TObject);
begin
  stat1.Panels[7].Text := '';

  if pgc1.ActivePageIndex = 2 then
  begin
    DateTimePicker1.Date := Now;
    DateTimePicker2.Date := Now;
    qry2.Close;
    qry2.SQL.Text := qry2SQL + ' and ondutytime >= ' + QuotedStr(DateToStr(DateTimePicker1.Date))
      + ' and ondutytime <= ' + QuotedStr(DateToStr(DateTimePicker2.Date));
    qry2.Open;
    field_name := dbgrideh2.Columns[0].FieldName;
    PreColumn := dbgrideh2.Columns[0];
    dbgrideh2.Columns[0].Title.Color := clred ;
    Label2.Caption := dbgrideh2.Columns[0].Title.Caption;
    label13.Caption := inttostr(qry2.RecordCount);
  end;
  if pgc1.ActivePageIndex = 3 then
  begin
    field_name := dbgrideh4.Columns[0].FieldName;
    PreColumn := dbgrideh4.Columns[0];
    dbgrideh4.Columns[0].Title.Color := clred ;
    Label9.Caption := dbgrideh4.Columns[0].Title.Caption;
  end;  
  if pgc1.ActivePageIndex = 4 then
  begin
    field_name := dbgrideh3.Columns[0].FieldName;
    PreColumn := dbgrideh3.Columns[0];
    dbgrideh3.Columns[0].Title.Color := clred ;
    Label4.Caption := dbgrideh3.Columns[0].Title.Caption;
    try
    qry_createtable.ExecSQL;
    except
    showmessage('创建临时表失败');
    end;

  end;
  if pgc1.ActivePageIndex = 5 then
  begin
    field_name := dbgrideh5.Columns[0].FieldName;
    PreColumn := dbgrideh5.Columns[0];
    dbgrideh5.Columns[0].Title.Color := clred ;
    Label14.Caption := dbgrideh5.Columns[0].Title.Caption;
    qry5.Close;
    qry5.Open;
    Label19.Caption := IntToStr(qry5.RecordCount);
    with qrytmp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.dev_detail where purpose in( ''facekq'', ''facekq_reg'') order by devid';
      Open;

      lv4.Items.Clear;
      First;
      while not Eof do
      begin
        with lv4.Items.Add do
        begin
          Caption := '';
          SubItems.Add(qrytmp.fieldbyname('devid').AsString);
          SubItems.Add(qrytmp.fieldbyname('dev_ip').AsString);
          SubItems.Add(qrytmp.fieldbyname('position').AsString);
          //SubItems.Add('');
          //SubItems.Add('未连接');
        end;
        qrytmp.Next;
      end;
    end;
  end;
  if pgc1.ActivePageIndex = 6 then
  begin
    {field_name := dbgrideh5.Columns[0].FieldName;
    PreColumn := dbgrideh5.Columns[0];
    dbgrideh5.Columns[0].Title.Color := clred ;
    Label14.Caption := dbgrideh5.Columns[0].Title.Caption;
    qry5.Close;
    qry5.Open;
    Label19.Caption := IntToStr(qry5.RecordCount); }
    with qrytmp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.dev_detail where purpose in( ''facekq'', ''facekq_reg'') order by devid';
      Open;

      ListView1.Items.Clear;
      First;
      while not Eof do
      begin
        with ListView1.Items.Add do
        begin
          Caption := '';
          SubItems.Add(qrytmp.fieldbyname('devid').AsString);
          SubItems.Add(qrytmp.fieldbyname('dev_ip').AsString);
          SubItems.Add(qrytmp.fieldbyname('position').AsString);
          //SubItems.Add('');
          //SubItems.Add('未连接');
        end;
        qrytmp.Next;
      end;
    end;
  end;
end;

procedure TfrmMain.edt2Change(Sender: TObject);
begin
  dbgrideh2.DataSource.DataSet.Filtered := True;
  if dbgrideh2.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrideh2.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt2.text) <> '' then
      begin
        if dbgrideh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dbgrideh2.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt2.text) + '%'')' ;
          end
        else
          if dbgrideh2.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dbgrideh2.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt2.text,0))+')';
          end;
      end
    else
      dbgrideh2.DataSource.DataSet.Filter:='';
  end;
  label13.Caption := inttostr(qry2.RecordCount);
end;

procedure TfrmMain.btn9Click(Sender: TObject);
var
  i, j, SelNO: Integer;
  DepartIds: string;
begin
  j := 0;
  for I := 0 to lvDev.Items.Count - 1 do   //获取选中机器号
  begin
    if lvDev.Items[I].Checked then
    begin
      SelNO := strtoint(Trim(lvDev.Items[I].SubItems[0]));
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
//  ShowMessage(IntToStr(SelNO));
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Text := 'select departmentidstring from dev_detail where devid= '+ inttostr(SelNO);
  qrytmp.Open;
//  ShowMessage(qrytmp.SQL.Text);
  if not qrytmp.IsEmpty then
  begin

    DepartIds := qrytmp.FieldValues['departmentidstring'];

     qry3.Close;
     qry3.SQL.Clear;
     qry3.SQL.Text := ' truncate table #lvdbgrideh ' +
     ' insert into #lvdbgrideh '+
     ' select  a.employeecode,a.chinesename '+
     ' from employeemsg a join employee_facedata b on a.rkey=b.employeeid '+
     ' where (status=1 or status=0) and a.departmentid in ' +
     ' (' + DepartIds + ')';

//     ShowMessage(qry3.SQL.Text);
     try
     qry3.ExecSQL;
     except
     showmessage('载入对比临时表失败1');
     end;
      qry3.Close;
      qry3.SQL.Clear;
      qry3.SQL.Text := 'select departmentname,employeecode,chinesename, ondutytime, '
        + ' case when face_length > 0 then ''有'' else ''无'' end faceTag, '
        + ' case when finger_1_length > 0 then ''有'' else ''无'' end fingerTag '
        + ' from v_employeemsg a join employee_facedata b on a.rkey=b.employeeid '
        + ' where (status=1 or status=0 )and a.departmentid in '
        + ' (' + DepartIds + ')';
    qry3.Open;
    label11.Caption := inttostr(qry3.RecordCount);
  end;
end;

procedure TfrmMain.btn8Click(Sender: TObject);
var
  I, j, Num, len, half_len: Integer;
  LName,LID,LPassWord,Vtmpdata, OutTmpdata, WS, str1, str2: WideString;
  LQX, vtmplength, OutFlag, OutLength: Integer;
  LEnable: WordBool;
begin

  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Text :='truncate table  #lv1 ';
  qrytmp.ExecSQL;

  j := 0;
  for I := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  screen.Cursor := crSQLWait;
  lv1.Items.Clear;
  pb5.Position := 0;
  pb5.Max := 10;
  Num := 0;
  for I := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      try
        if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]),4370) then
        begin
          if gDev.ReadAllUserID(StrToInt(Trim(lvDev.Items[I].SubItems[0]))) then
          begin
            while gDev.SSR_GetAllUserInfo(StrToInt(Trim(lvDev.Items[I].SubItems[0])),LID,LName,LPassWord,LQX,LEnable) do
            begin
              if LQX = 3 then Continue;
              with lv1.Items.Add do
              begin
                Caption := LID;
                SubItems.Add(LName);
                if gDev.GetUserFaceStr(StrToInt(Trim(lvDev.Items[I].SubItems[0])), LID, 50, Vtmpdata, vtmplength) then
                  begin
                  SubItems.Add('有');
                  str1 :='有';
                  end
                  else
                  begin
                  SubItems.Add('无');
                  str1 :='无';
                  end;
                if gDev.GetUserTmpExStr(StrToInt(Trim(lvDev.Items[I].SubItems[0])), LID, 0, OutFlag, OutTmpdata, OutLength) then
                  begin
                    SubItems.Add('有');
                    str2 :='有';
                  end
                   else
                  begin
                    SubItems.Add('无');
                    str2 :='无';
                  end;
              end;
              application.ProcessMessages;
              Num := Num + 1;
              label10.Caption := inttostr(Num);
              stat1.Panels[7].Text := inttostr(Num);
              pb5.Position := pb5.Position + 1;
              if pb5.Position = 10 then pb5.Position := 0;

                len := length(LName) ;
                half_len := strtoint(inttostr(len)) div 2;
                setlength(WS,half_len);
                for j := 1 to half_len do
                begin
                  WS[J]:= LName[J];
                end;
                  qrytmp.Close;
                  qrytmp.SQL.Clear;
                  qrytmp.SQL.Text := format('insert into  #lv1  select ''%s'',''%s'',''%s'',''%s'' ', [LID,WS,str1,str2]);
                 //showmessage(qrytmp.SQL.Text);
                 qrytmp.ExecSQL; 

            end;
          end;
        end;
      finally
        gDev.Disconnect;
      end;
    end;
  end;
  screen.Cursor := crDefault;
  label10.Caption := inttostr(lv1.Items.Count);    
  ShowMessage('查看完毕');
  pb5.Position := 0;
end;

procedure TfrmMain.btn5Click(Sender: TObject);
var
  I: Integer;
  LName,LID,LPassWord,Vtmpdata, OutTmpdata: WideString;
  LQX, vtmplength, OutFlag, OutLength: Integer;
  LEnable: WordBool;
begin
  ShowMessage(facekq_reg_IP);
  if facekq_reg_IP='' then  Exit;
  screen.Cursor := crSQLWait;
  lv3.Items.Clear;
  i := 0;
  pb5.Position := 0;
  pb5.Max := 10;
  if gDev.Connect_Net(facekq_reg_IP, 4370) then  //facekq_reg_IP
  begin
    if gDev.ReadAllUserID(facekq_reg_NO) then   //facekq_reg_NO
    begin
      while gDev.SSR_GetAllUserInfo(facekq_reg_NO,LID,LName,LPassWord,LQX,LEnable) do    //facekq_reg_NO
      begin
        with lv3.Items.Add do
        begin
          Caption := LID;
          SubItems.Add(LName);
          if gDev.GetUserFaceStr(facekq_reg_NO, LID, 50, Vtmpdata, vtmplength) then   //facekq_reg_NO
            SubItems.Add('有')
          else SubItems.Add('无');
          if gDev.GetUserTmpExStr(facekq_reg_NO, LID, 0, OutFlag, OutTmpdata, OutLength) then  //facekq_reg_NO
            SubItems.Add('有')
          else if gDev.GetUserTmpExStr(facekq_reg_NO, LID, 6, OutFlag, OutTmpdata, OutLength) then  //facekq_reg_NO
            SubItems.Add('有')
          else SubItems.Add('无');;
        end;
        application.ProcessMessages;
        i := i + 1;
        pb5.Position := pb5.Position + 1;
        stat1.Panels[7].Text := inttostr(i);
        if pb5.Position = 10 then  pb5.Position := 0;
      end;
    end;
  end;
  screen.Cursor := crDefault;
  pb5.Position := 0;
  ShowMessage('人员加载完毕');
  gDev.Disconnect;
end;

procedure TfrmMain.btn2Click(Sender: TObject);
var
  i,j,flag,Num: Integer;
begin
  lv2.Items.Clear;

  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Text :='truncate table #lv2 insert into #lv2 select employeecode,chinesename from #lv1 where employeecode not in (select employeecode from #lvdbgrideh  ) select * from #lv2';
  //showmessage(qrytmp.SQL.Text);
  qrytmp.ExecSQL;
  qrytmp.Open;
  i:=0;
  j:=0;
  stat1.Panels[7].Text := inttostr(qrytmp.RecordCount);
  while not qrytmp.Eof do
  begin

  with lv2.Items.Add do
        begin
          Caption := qrytmp.FieldByName('employeecode').Value;
          SubItems.Add(qrytmp.FieldByName('chinesename').Value);
        end;
   qrytmp.Next;

  end;

 {
    pb5.Position := 0;
  pb5.Max := lv1.Items.Count;
  Num := 0;
 for i:= 0  to lv1.Items.Count -1   do
  begin
    flag := 0 ;
    qry3.First;
    while not qry3.eof  do
    begin
      if qry3.FieldByName('employeecode').Value = lv1.Items[i].Caption
      then    flag := 1;   //在本机中已经有名单。可对比
      qry3.Next;
    end;
    if flag = 0 then
    begin
        with lv2.Items.Add do
        begin
          Caption := lv1.Items[i].Caption;
          SubItems.Add(lv1.Items[i].SubItems.Strings[0]);
          Num := Num +1;
          stat1.Panels[7].Text := inttostr(Num);
        end;
    end;
    application.ProcessMessages;
    pb5.Position := pb5.Position + 1;
  end;  
  screen.Cursor := crDefault; }
  ShowMessage('查看完毕');
end;

procedure TfrmMain.btn7Click(Sender: TObject);
var
  i, j, p, q, Num: Integer;
begin
  if MessageBoxA(Handle,'是否将以下人员从考勤机删除','提示 ',MB_YESNO) <> IDYEs then Exit;
  p := 0;
  for I := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      p := p + 1;
    end;
  end;
  if p <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  if lv2.Items.Count <= 0 then
  begin
    showmessage('当前无待移除名单，请检查！');
    Exit;
  end;
  lv2.SetFocus;
  lv2.Items[0].Selected := True;
  screen.Cursor := crSQLWait;
  Num := 0;

  for I := 0 to lvDev.Items.Count - 1 do
  begin
    try
      if lvDev.Items[I].Checked then
      begin
        pb5.Position := 0;
        pb5.Max := lv2.Items.Count;
        if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]), 4370) then
        for j := Pred (lv2.Items.Count) downto 0 do
        begin
          if lv2.Items[j].Checked then
          begin
            Num := Num +1;
            if gDev.SSR_DeleteEnrollData(StrToInt(Trim(lvDev.Items[I].SubItems[0])), lv2.Items[j].Caption, 12)
            then q := q + 1;
            application.ProcessMessages;
            stat1.Panels[7].Text := inttostr(q);
            pb5.Position := pb5.Position +1;
            lv2.Items[j].Delete;
          end;
        end;
      end;
    except
      Continue;
    end;
  end;
  screen.Cursor := crDefault;
  pb5.Position := 0;
  showmessage('本次预删除' + inttostr(Num)+ '条记录, '
      + ' 成功:' + inttostr(q) + '条');
  gDev.Disconnect;
end;

procedure TfrmMain.btn6Click(Sender: TObject);
var
  i, Num: Integer;
begin
  if MessageBoxA(Handle,'是否将以下人员从注册机删除','提示 ',MB_YESNO) <> IDYes then Exit;
  lv3.SetFocus;
  lv3.Items[0].Selected := True;
  Num := 0;
  pb5.Position := 0;
  pb5.Max := lv3.Items.Count;
  if gDev.Connect_Net(facekq_reg_IP, 4370) then
  for i := Pred (lv3.Items.Count) downto 0 do
  begin
    begin
      if lv3.Items[i].Checked then
      begin
        gDev.SSR_DeleteEnrollData(facekq_reg_No, lv3.Items[i].Caption, 12);
        lv3.Items[i].Delete;
        application.ProcessMessages;
        Num := Num + 1;
      end;
    end;
    pb5.Position := pb5.Position + 1;
  end;
  pb5.Position := 0;  
  showmessage('本次成功删除数目：' + inttostr(Num) + '笔');
  stat1.Panels[7].Text := inttostr(strtoint(stat1.Panels[7].Text) - Num);
  gDev.Disconnect;
end;

procedure TfrmMain.btn10Click(Sender: TObject);
begin
  qry4.Close;
  qry4.Open;
  label8.Caption := inttostr(qry4.RecordCount) + ' 条';
end;

procedure TfrmMain.btn11Click(Sender: TObject);
var
  i: Integer;
begin
  screen.Cursor := crSQLWait;
  for I := 0 to lvDev.Items.Count - 1 do  
  begin
    if lvDev.Items[I].Checked then
    begin
      if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]), 4370) then
      begin
        lvDev.Items[I].SubItems[3] := datetimetostr(Now);
        lvDev.Items[I].SubItems[4] := '连接成功';
        application.ProcessMessages;
      end;
    end;
  end;
  showmessage('测试完毕！');
  screen.Cursor := crDefault;
end;

procedure TfrmMain.btn12Click(Sender: TObject);
var
 i:integer;
begin
  for i:=0 to lv3.Items.Count - 1 do
  begin
    lv3.items[i].Checked := true;
  end;
end;

procedure TfrmMain.btn13Click(Sender: TObject);
var
 i:integer;
begin
  for i:=0 to lv3.Items.Count - 1 do
  begin
    lv3.items[i].Checked := false;
  end;
end;


procedure TfrmMain.edt3Change(Sender: TObject);
begin
  dbgrideh4.DataSource.DataSet.Filtered := True;
  if dbgrideh4.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrideh4.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt3.text) <> '' then
      begin
        if dbgrideh4.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dbgrideh4.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt3.text) + '%'')' ;
          end
        else
          if dbgrideh4.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dbgrideh4.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt3.text,0))+')';
          end;
      end
    else
      dbgrideh4.DataSource.DataSet.Filter:='';
  end;
  label8.Caption := inttostr(qry4.RecordCount) + ' 条';
end;

procedure TfrmMain.dbgrideh4TitleClick(Column: TColumnEh);
begin
  if dbgrideh4.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry4.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry4.Sort:=Column.FieldName+' DESC';
  end;
  if dbgrideh4.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    Label9.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt3.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt3Change(edt3);
  end
  else
    edt3.SetFocus;
end;

procedure TfrmMain.lv3ColumnClick(Sender: TObject; Column: TListColumn);
begin
  SortCol:=Column.Index;
  if (SortWay=1) then SortWay:=-1 else SortWay:=1;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TfrmMain.lv3Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  t: Integer;
begin
  if (SortCol=0) then
  begin
    Compare:=SortWay * CompareText(Item1.Caption,Item2.Caption);
  end
  else
  begin
    t:=SortCol-1;
    Compare:=SortWay * CompareText(Item1.SubItems[t],Item2.SubItems[t]);
  end;
end;

procedure TfrmMain.lv3CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
   i: integer;
begin
   {i:= (Sender as TListView).Items.IndexOf(Item);
   if odd(i) then 
     sender.Canvas.Brush.Color:= $02E0F0D7
   else 
     sender.Canvas.Brush.Color:= $02F0EED7;
   Sender.Canvas.FillRect(Item.DisplayRect(drIcon));
    }
end;

procedure TfrmMain.btn14Click(Sender: TObject);
var
  i: Integer;
begin
  lv3.ItemIndex := -1;
  for i := 0 to lv3.Items.Count - 1 do
  begin
    if trim(lv3.Items[i].Caption) = trim(edt4.Text) then
    begin
      lv3.SetFocus;
      lv3.ItemIndex := i;
      break;
    end;
  end;
end;

procedure TfrmMain.btn15Click(Sender: TObject);
var
  I, j,len,half_len: Integer;
  LName,LID,LPassWord,Vtmpdata, OutTmpdata: WideString;
  str1,str2,WS :WideString;
  //WS:String ;
  LQX, vtmplength, OutFlag, OutLength: Integer;
  LEnable: WordBool;
begin
  str1:='有';
  str2:='无';
  j := 0;
  for I := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;

  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Text :='truncate table  #lv1 ';
  qrytmp.ExecSQL;

  screen.Cursor := crSQLWait;

  lv1.Items.Clear;

  for I := 0 to lvDev.Items.Count - 1 do
  begin
    try
      if lvDev.Items[I].Checked then
      begin
        if gDev.Connect_Net(Trim(lvDev.Items[I].SubItems[1]),4370) then
        begin
          if gDev.ReadAllUserID(StrToInt(Trim(lvDev.Items[I].SubItems[0]))) then
          begin
            while gDev.SSR_GetAllUserInfo(StrToInt(Trim(lvDev.Items[I].SubItems[0])),LID,LName,LPassWord,LQX,LEnable) do
            begin
              if LQX = 3 then Continue;
              with lv1.Items.Add do
              begin
                  Caption := LID;
                  SubItems.Add(LName);
                  SubItems.Add('有');
                  SubItems.Add('有');

                len := length(LName) ;
                half_len := strtoint(inttostr(len)) div 2;
                setlength(WS,half_len);
                for j := 1 to half_len do
                begin
                  WS[J]:= LName[J];
                end;
                  qrytmp.Close;
                  qrytmp.SQL.Clear;
                  qrytmp.SQL.Text := format('insert into  #lv1  select ''%s'',''%s'',''%s'',''%s'' ', [LID,WS,str1,str1]);
                 //showmessage(qrytmp.SQL.Text);
                 qrytmp.ExecSQL;
                 application.ProcessMessages;
              end;
            end;
          end;
        end;
      end;
    finally
      gDev.Disconnect;
    end;
  end;
  label10.Caption := inttostr(lv1.Items.Count);
  screen.Cursor := crDefault;
  ShowMessage('查看完毕');
end;

procedure TfrmMain.edt1Change(Sender: TObject);
begin
  dbgrideh3.DataSource.DataSet.Filtered := True;
  if dbgrideh3.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrideh3.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt1.text) <> '' then
      begin
        if dbgrideh3.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dbgrideh3.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt1.text) + '%'')' ;
          end
        else
          if dbgrideh3.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dbgrideh3.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt1.text,0))+')';
          end;
      end
    else
      dbgrideh3.DataSource.DataSet.Filter:='';
  end;
  label11.Caption := inttostr(qry3.RecordCount);
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  with lvUser.Items.Add do
  begin
    Caption := qry3.FieldByName('employeecode').Value;
    SubItems.Add(qry3.FieldByName('chinesename').Value);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
 if not app_init_2(con1) then
  begin
    ShowMessage('程序起动失败请联系管理员');
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
  //判定是否需要过滤其他机器
  devlist_sql_flag:='';
  qrytmp.SQL.Clear;
  qrytmp.SQL.Text :='select warehouse_ptr from data0073 where rkey='+rkey73;
  qrytmp.Open;
  if not qrytmp.fieldbyname('warehouse_ptr').IsNull
  then devlist_sql_flag:= qrytmp.fieldbyname('warehouse_ptr').AsString;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  //
  qry2SQL := qry2.SQL.Text;
end;

procedure TfrmMain.lv1ColumnClick(Sender: TObject; Column: TListColumn);
begin
  SortCol:=Column.Index;
  if (SortWay=1) then SortWay:=-1 else SortWay:=1;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TfrmMain.lv1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  t: Integer;
begin
  if (SortCol=0) then
  begin
    Compare:=SortWay * CompareText(Item1.Caption,Item2.Caption);
  end
  else
  begin
    t:=SortCol-1;
    Compare:=SortWay * CompareText(Item1.SubItems[t],Item2.SubItems[t]);
  end;
end;

procedure TfrmMain.dbgrideh3TitleClick(Column: TColumnEh);
begin
  if dbgrideh3.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry3.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry3.Sort:=Column.FieldName+' DESC';
  end;
  if dbgrideh3.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    Label4.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt1Change(edt1);
  end
  else
    edt1.SetFocus;
end;

procedure TfrmMain.btn18Click(Sender: TObject);
begin
  qry2.Requery();
  Label13.Caption := IntToStr(qry2.RecordCount);  
end;

procedure TfrmMain.btn17Click(Sender: TObject);
begin
  if qry5.Active then qry5.Active := false;
  qry5.SQL.Clear;
 qry5.SQL.Text :=' select departmentname,employeecode,chinesename, ondutytime,  '+
' case when face_length > 0 then '+quotedstr('有')+
' else '+quotedstr('有')+' end faceTag,  '+
' case when finger_1_length > 0 then '+quotedstr('有')+
' else '+quotedstr('无')+' end fingerTag '+
' from v_employeemsg a join employee_facedata b on a.rkey=b.employeeid '+
' where (status=1 or status=0)  and departmentid in  '+
' (select departmentid from hr_permission ' +
' where operator_ptr= ' + rkey73+
' and program_ptr=(select rkey from data0419 where programe ='+quotedstr('WZ_FACE_Card.exe')+'))';
 qry5.Open();
end;

procedure TfrmMain.DateTimePicker1Change(Sender: TObject);
begin
   if CheckBox2.Checked then
   begin
      qry2.Close;
      qry2.SQL.Text := qry2SQL + ' and ondutytime >= ' + QuotedStr(DateToStr(DateTimePicker1.Date))
      + ' and ondutytime <= ' + QuotedStr(DateToStr(DateTimePicker2.Date));
      qry2.Open;
      Label13.Caption := IntToStr(qry2.RecordCount);
   end
   else
   begin
      qry2.Close;
      qry2.SQL.Text := qry2SQL + ' and ondutytime >= ' + QuotedStr(DateToStr(DateTimePicker1.Date))
      + ' and ondutytime <= ' + QuotedStr(DateToStr(DateTimePicker2.Date))
      + ' and rkey not  in (select employeeid from employee_facedata where face_data is  not null)';
      qry2.Open;
      Label13.Caption := IntToStr(qry2.RecordCount);
   end;
end;

procedure TfrmMain.dbgrideh5TitleClick(Column: TColumnEh);
begin
  if dbgrideh5.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry5.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry5.Sort:=Column.FieldName+' DESC';
  end;
 // if dbgrideh5.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    Label14.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt5.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt5Change(edt5);
  end
  else
    edt5.SetFocus;
end;

procedure TfrmMain.edt5Change(Sender: TObject);
begin
  dbgrideh5.DataSource.DataSet.Filtered := True;
  if dbgrideh5.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrideh5.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt5.text) <> '' then
      begin
        if dbgrideh5.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dbgrideh5.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt5.text) + '%'')' ;
          end
        else
          if dbgrideh5.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dbgrideh5.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt5.text,0))+')';
          end;
      end
    else
      dbgrideh5.DataSource.DataSet.Filter:='';
  end;
  label19.Caption := inttostr(qry5.RecordCount) + ' 条';
end;

procedure TfrmMain.btn16Click(Sender: TObject);
var
  i, ii, j, k, outflag, outlen, Count: Integer;
  len, Reclen,len2,Reclen2,longname: longint;
  fs: TStringStream;
  fs2: TStringStream;
  byte1 : Byte;
  vtmpdata, RecVtmpdata: WideString;
  vtmpdata2, RecVtmpdata2: WideString;
  outvtmpdata: WideString;
  IPGoal, NOGoal: String;     //选中机器IP、机器号
  MsgString: string;
begin
  Count := 0;
  for i := 0 to lv4.Items.Count - 1 do if lv4.Items[i].Checked then Count := Count + 1;
  if (qry5.RecordCount <= 0) or (Count <= 0) then
  begin
    showmessage('当前无待添加名单或未选择要添加至的设备，请检查！');
    Exit;
  end;
  if qry5.RecordCount > 200 then
  begin
    ShowMessage('对不起，当前设备每次上传人员数量最多支持200人，请重新筛选名单！');
    Exit;
  end;
  if MessageBoxA(Handle,'您确定将左边表格所列数据上传到右边选择的设备上？','提示 ',MB_YESNO) <> IDYEs then Exit;
  pb5.Position := 0;
  pb5.Max := Count * qry5.RecordCount;
  //qry5.DisableControls;
  for i := 0 to lv4.Items.Count - 1 do
  begin
    screen.Cursor := crSQLWait;
    if lv4.Items[i].Checked then
    begin
      j := 0;
      k := 0;
      if gDev.Connect_Net(Trim(lv4.Items[I].SubItems[1]),4370) then  //IPGoal
      begin
        qry5.First;
        for ii := 0 to qry5.RecordCount - 1 do
        begin
          qrytmp.Close;
          qrytmp.SQL.Clear;
          qrytmp.SQL.Text:='select face_data, face_length, finger_1, finger_1_length,finger_out_flag from employee_facedata where employeeid '+
          ' = ( select rkey from employeemsg where employeecode='
            + quotedstr(qry5.FieldValues['employeecode'])+')';
          qrytmp.Open;
          len := qrytmp.FieldValues['face_length'];  //人脸长度
          fs:=TStringStream.Create('');  //接收端
          TBlobfield(qrytmp.fieldbyname('face_data')).SaveToStream(fs);  //人脸信息（二进制数据）
          vtmpdata := fs.DataString;    //将字符串流转成字符串

          if not qrytmp.FieldByName('finger_1').IsNull then
          begin
            fs2:=TStringStream.Create('');  //接收端
            len2 := qrytmp.FieldValues['finger_1_length'];  //指纹长度
            outflag := qrytmp.FieldValues['finger_out_flag'];//指纹编号
            TBlobfield(qrytmp.fieldbyname('finger_1')).SaveToStream(fs2);  //指纹信息（二进制数据）
            vtmpdata2 := fs2.DataString;    //将字符串流转成字符串
          end;

          //获取本次添加人员是否在机器中已有人脸数据，如果有则从机器中删除，
          if gDev.GetUserFaceStr(strtoint(Trim(lv4.Items[I].SubItems[0])), qry5.FieldValues['employeecode'], 50, outvtmpdata, Outlen) then
          begin
            if Outlen > 0 then gdev.SSR_DeleteEnrollData(strtoint(Trim(lv4.Items[I].SubItems[0])),qry5.FieldValues['employeecode'],12);
          end;

          //将员工信息写入机器名单中
          gdev.SSR_SetUserInfo(strtoint(Trim(lv4.Items[I].SubItems[0])),qry5.FieldValues['employeecode'],qry5.FieldValues['chinesename'],'',0,true);
          //
          if TryStrToInt(qry5.FieldValues['employeecode'],longname)  then
          gDev.SetUserInfoEx(strtoint(Trim(lv4.Items[I].SubItems[0])),longname,128,byte1);
          //上传人脸数据


          if gDev.setuserfacestr(strtoint(Trim(lv4.Items[I].SubItems[0])), qry5.FieldValues['employeecode'], 50, vtmpdata, len)
          then j := j + 1;

          //上传指纹数据
          if not qrytmp.FieldByName('finger_1').IsNull then
          begin
            if gdev.SetUserTmpExStr(strtoint(Trim(lv4.Items[I].SubItems[0])), qry5.FieldValues['employeecode'],0,outflag,vtmpdata2)
            then k := k + 1;
          end;
          Application.ProcessMessages;
          pb5.Position := pb5.Position + 1;
          qry5.Next;
        end;
        MsgString := MsgString + Trim(lv4.Items[I].SubItems[0]) + '号设备成功上传面部数据: ' + IntToStr(j) + '， 指纹数据: ' + IntToStr(k) + #13;
      end;
    end;
    screen.Cursor := crDefault;
  end;
  //qry5.EnableControls;
  ShowMessage('上传完毕！' + #13 + #13 + MsgString);
  pb5.Position := 0;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  i, j, p, pp, q, Num: Integer;
begin
  p := 0;
  pp := 0;
  for I := 0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[I].Checked then
    begin
      p := p + 1;
    end;
  end;
  if p <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  for I := 0 to ListView2.Items.Count - 1 do
  begin
    if ListView2.Items[I].Checked then
    begin
      pp := pp + 1;
    end;
  end;
  if pp <= 0 then ShowMessage('至少要选择一个员工进行操作，请检查！');
  if MessageBoxA(Handle,'是否将以下人员从考勤机删除','提示 ',MB_YESNO) <> IDYEs then Exit;

  ListView2.SetFocus;
  ListView2.Items[0].Selected := True;
  screen.Cursor := crSQLWait;
  Num := 0;
  for I := 0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[I].Checked then
    begin
      pb5.Position := 0;
      pb5.Max := lv2.Items.Count;
      if gDev.Connect_Net(Trim(ListView1.Items[I].SubItems[1]), 4370) then
      for j := Pred (ListView2.Items.Count) downto 0 do
      begin
        if ListView2.Items[j].Checked then
        begin
          Num := Num +1;
          if gDev.SSR_DeleteEnrollData(StrToInt(Trim(ListView1.Items[I].SubItems[0])), ListView2.Items[j].Caption, 12) then
          begin
            q := q + 1;
            Label20.Caption := IntToStr(StrToInt(Label20.Caption)-1);
          end;
          application.ProcessMessages;
          stat1.Panels[7].Text := inttostr(q);
          pb5.Position := pb5.Position +1;
          ListView2.Items[j].Delete;
        end;
      end;
    end;
  end;
  screen.Cursor := crDefault;
  pb5.Position := 0;
  showmessage('本次预删除' + inttostr(Num)+ '条记录, '
      + ' 成功:' + inttostr(q) + '条');
  gDev.Disconnect;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  I, j: Integer;
  LName,LID,LPassWord,Vtmpdata, OutTmpdata: WideString;
  LQX, vtmplength, OutFlag, OutLength: Integer;
  LEnable: WordBool;
begin
  j := 0;
  for I := 0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[I].Checked then
    begin
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  screen.Cursor := crSQLWait;
  ListView2.Items.Clear;
  try
    for I := 0 to ListView1.Items.Count - 1 do
    begin
      if ListView1.Items[I].Checked then
      begin
        if gDev.Connect_Net(Trim(ListView1.Items[I].SubItems[1]),4370) then
        begin
          if gDev.ReadAllUserID(StrToInt(Trim(ListView1.Items[I].SubItems[0]))) then
          begin
            while gDev.SSR_GetAllUserInfo(StrToInt(Trim(ListView1.Items[I].SubItems[0])),LID,LName,LPassWord,LQX,LEnable) do
            begin
              if LQX = 3 then Continue;
              with ListView2.Items.Add do
              begin
                Caption := LID;
                SubItems.Add(LName);
                with qrytmp do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select departmentname,ondutytime from v_employeemsg where employeecode=' + QuotedStr(Caption);
                  Open;
                  SubItems.Add(FieldValues['departmentname']);
                  SubItems.Add(FieldValues['ondutytime']);
                end;
                application.ProcessMessages;
                label20.Caption := inttostr(ListView2.Items.Count);
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    gDev.Disconnect;
  end;
  screen.Cursor := crDefault;
  ShowMessage('查看完毕');
end;

procedure TfrmMain.CheckBox1Click(Sender: TObject);
var
 i:integer;
begin
  for i:=0 to ListView2.Items.Count - 1 do
  begin
    ListView2.items[i].Checked := CheckBox1.Checked;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  I, j: Integer;
  LName,LID,LPassWord,Vtmpdata, OutTmpdata: WideString;
  LQX, vtmplength, OutFlag, OutLength: Integer;
  LEnable: WordBool;
begin
  j := 0;
  for I := 0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[I].Checked then
    begin
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  screen.Cursor := crSQLWait;
  ListView2.Items.Clear;
  try
    for I := 0 to ListView1.Items.Count - 1 do
    begin
      if ListView1.Items[I].Checked then
      begin
        if gDev.Connect_Net(Trim(ListView1.Items[I].SubItems[1]),4370) then
        begin
          if gDev.ReadAllUserID(StrToInt(Trim(ListView1.Items[I].SubItems[0]))) then
          begin
            while gDev.SSR_GetAllUserInfo(StrToInt(Trim(ListView1.Items[I].SubItems[0])),LID,LName,LPassWord,LQX,LEnable) do
            begin
              if LQX = 3 then Continue;
              with ListView2.Items.Add do
              begin
                Caption := LID;
                SubItems.Add(LName);
                application.ProcessMessages;
                label20.Caption := inttostr(ListView2.Items.Count);
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    gDev.Disconnect;
  end;
  screen.Cursor := crDefault;
  ShowMessage('查看完毕');
end;

procedure TfrmMain.Button4Click(Sender: TObject);
var
  i, j, GoNo: Integer;
  GoIp: string;
begin
  j := 0;
  for i := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      GoNo := StrToInt(Trim(lvDev.Items[I].SubItems[0]));
      GoIp := Trim(lvDev.Items[I].SubItems[1]);
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  if MessageBoxA(Handle,'确定要重启机器吗？','提示 ',MB_YESNO) <> IDYEs then Exit;
  if gDev.Connect_Net(GoIp, 4370) then
  begin
    if GDev.RestartDevice(GoNo) then ShowMessage('重启操作成功！');
  end;
end;

procedure TfrmMain.Button5Click(Sender: TObject);
var
  i, j, GoNo: Integer;
  GoIp: string;
begin
  j := 0;
  for i := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      GoNo := StrToInt(Trim(lvDev.Items[I].SubItems[0]));
      GoIp := Trim(lvDev.Items[I].SubItems[1]);
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  if MessageBoxA(Handle,'确定要关闭机器吗？','提示 ',MB_YESNO) <> IDYEs then Exit;
  if gDev.Connect_Net(GoIp, 4370) then
  begin
    if GDev.PowerOffDevice(GoNo) then ShowMessage('关闭操作成功！');
  end;
end;

procedure TfrmMain.Button6Click(Sender: TObject);
begin
  if ((Trim(edt5.Text) <> '') and (Label14.Caption='工号')) then
  dbgrideh5.DataSource.DataSet.Filter := ' employeecode = ' + edt5.Text;

   if ((Trim(edt5.Text) <> '') and (Label14.Caption='入职日期')) then
  dbgrideh5.DataSource.DataSet.Filter := ' ondutytime = ' + edt5.Text;


end;

procedure TfrmMain.Button7Click(Sender: TObject);
begin
  if MessageBoxA(Handle,'确定要关闭注册机吗？','提示 ',MB_YESNO) <> IDYEs then Exit;
  if gDev.Connect_Net(facekq_reg_IP, 4370) then
  begin
    if GDev.PowerOffDevice(facekq_reg_NO) then ShowMessage('关闭注册机操作成功！');
  end;
end;

procedure TfrmMain.Button8Click(Sender: TObject);
begin
  if MessageBoxA(Handle,'确定要重启注册机吗？','提示 ',MB_YESNO) <> IDYEs then Exit;
  if gDev.Connect_Net(facekq_reg_IP, 4370) then
  begin
    if GDev.RestartDevice(facekq_reg_NO) then ShowMessage('重启注册机操作成功！');
  end;
end;

procedure TfrmMain.Button9Click(Sender: TObject);
var
  i, j, GoNo, dwYear, dwMonth, dwDay, dwHour, dwMinute, dwSecond: Integer;
  GoIp: string;
begin
  j := 0;
  for i := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      GoNo := StrToInt(Trim(lvDev.Items[I].SubItems[0]));
      GoIp := Trim(lvDev.Items[I].SubItems[1]);
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  if MessageBoxA(Handle,'确定要将选中的机器时间同步为电脑当前时间吗？','提示 ',MB_YESNO) <> IDYEs then Exit;
  if gDev.Connect_Net(GoIp, 4370) then if GDev.SetDeviceTime(GoNo)then
  begin
    ShowMessage('同步完成！');
  end;
end;

procedure TfrmMain.Button10Click(Sender: TObject);
var
  i, j, GoNo, dwYear, dwMonth, dwDay, dwHour, dwMinute, dwSecond: Integer;
  GoIp: string;
begin
  j := 0;
  for i := 0 to lvDev.Items.Count - 1 do
  begin
    if lvDev.Items[I].Checked then
    begin
      GoNo := StrToInt(Trim(lvDev.Items[I].SubItems[0]));
      GoIp := Trim(lvDev.Items[I].SubItems[1]);
      j := j + 1;
    end;
  end;
  if j <> 1 then
  begin
    showmessage('请选择一个机器且只能选择一个机器进行操作！');
    Exit;
  end;
  if gDev.Connect_Net(GoIp, 4370) then
  begin
    if GDev.GetDeviceTime(GoNo, dwYear, dwMonth, dwDay, dwHour, dwMinute, dwSecond) then
    begin
      lblDevTime.Caption := '设备当前时间：' + IntToStr(dwYear) + '-' + IntToStr(dwMonth) + '-' +IntToStr(dwDay)
        + ' ' +IntToStr(dwHour) + ':' +IntToStr(dwMinute) + ':' +IntToStr(dwSecond);
      DevTime := StrToDateTime(IntToStr(dwYear) + '-' + IntToStr(dwMonth) + '-' +IntToStr(dwDay)
        + ' ' +IntToStr(dwHour) + ':' +IntToStr(dwMinute) + ':' +IntToStr(dwSecond));
    end;
    DevTimeStartFlag := 1;
  end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  lblLocalTime.Caption := '本地当前时间：' + DateTimeToStr(Now);  
end;

procedure TfrmMain.btn19Click(Sender: TObject);
begin
  Export_Tlistview_to_Excel(lv2,'名单');
end;

procedure TfrmMain.btn21Click(Sender: TObject);
begin
   Export_Tlistview_to_Excel(lv1,'名单');
end;

procedure TfrmMain.btn20Click(Sender: TObject);
begin
  Export_Tlistview_to_Excel(lvuser,'名单');
end;

procedure TfrmMain.freshdevlist;  //刷新机器列表
 begin
    facekq_reg_IP := '';
    stat1.Panels[1].Text :='';
    stat1.Panels[3].Text :='';

    if devlist_sql_flag='' then
    begin
      devlist_sql:= 'select * from dbo.dev_detail where purpose like ''facekq%'' order by devid';
      devlist_reg_sql:= 'select top 1 * from dbo.dev_detail where purpose=''facekq_reg'' ';
    end
  else
    begin
    devlist_sql:= 'select * from dbo.dev_detail where purpose like ''facekq%'' and mealtype='+devlist_sql_flag+' order by devid';
    devlist_reg_sql:= 'select  top 1 * from dbo.dev_detail where purpose=''facekq_reg'' and mealtype='+devlist_sql_flag;
    end;

  with qrytmp do
  begin
    Close;
    SQL.clear;
    SQL.text :=devlist_sql;
    Open;
    lvDev.Items.Clear;
    First;
    while not Eof do
    begin
      with lvDev.Items.Add do
      begin
        Caption := '';
        SubItems.Add(qrytmp.fieldbyname('devid').AsString);
        SubItems.Add(qrytmp.fieldbyname('dev_ip').AsString);
        SubItems.Add(qrytmp.fieldbyname('position').AsString);
        SubItems.Add('');
        SubItems.Add('未连接');
      end;
      qrytmp.Next;
    end;
    Close;
    SQL.clear;
    SQL.text :=devlist_reg_sql;
    Open;
    if not isempty then
    begin
      facekq_reg_NO := fieldByName('devid').Value;
      facekq_reg_IP := fieldByName('dev_ip').Value;
      stat1.Panels[1].Text := facekq_reg_IP;
      stat1.Panels[3].Text := inttostr(facekq_reg_NO);
    end;
  end;

 end;

procedure TfrmMain.N2Click(Sender: TObject);
begin

  if lvDev.SelCount=0 then
 begin
    ShowMessage('请选定机器');
   Exit;
 end;

   if    lvDev.Selected.SubItems[1]='' then
   begin
    ShowMessage('请选定机器');
    exit;
   end;
   qry_set_reg.Parameters[0].Value := lvDev.Selected.SubItems[1];
   qry_set_reg.Parameters[1].Value := lvDev.Selected.SubItems[1];
   qry_set_reg.Parameters[2].Value := lvDev.Selected.SubItems[1];
   qry_set_reg.Parameters[3].Value := lvDev.Selected.SubItems[1];
   //ShowMessage(qry_set_reg.SQL.Text);
   try
    qry_set_reg.ExecSQL;
   except
     ShowMessage('执行发生错误');
     end;
   freshdevlist;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin

 if lvDev.SelCount=0 then
 begin
    ShowMessage('请选定机器');
   Exit;
 end;
    
   if    lvDev.Selected.SubItems[1]='' then
   begin
    ShowMessage('请选定机器');
    exit;
   end;
   qry_cancel_reg.Parameters[0].Value := lvDev.Selected.SubItems[1];
   //ShowMessage(qry_set_reg.SQL.Text);
   try
    qry_cancel_reg.ExecSQL;
   except
     ShowMessage('执行发生错误');
     end;
   freshdevlist;
end;

procedure TfrmMain.CheckBox2Click(Sender: TObject);
begin
   if CheckBox2.Checked then
   begin
      qry2.Close;
      qry2.SQL.Text := qry2SQL + ' and ondutytime >= ' + QuotedStr(DateToStr(DateTimePicker1.Date))
      + ' and ondutytime <= ' + QuotedStr(DateToStr(DateTimePicker2.Date));
      qry2.Open;
      Label13.Caption := IntToStr(qry2.RecordCount);
   end
   else
   begin
      qry2.Close;
      qry2.SQL.Text := qry2SQL + ' and ondutytime >= ' + QuotedStr(DateToStr(DateTimePicker1.Date))
      + ' and ondutytime <= ' + QuotedStr(DateToStr(DateTimePicker2.Date))
      + ' and rkey not  in (select employeeid from employee_facedata where face_data is  not null)';
      qry2.Open;
      Label13.Caption := IntToStr(qry2.RecordCount);
   end;

end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel (dbgrideh2,'注册名单');
end;

end.
