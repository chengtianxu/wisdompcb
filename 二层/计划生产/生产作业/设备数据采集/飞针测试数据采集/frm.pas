unit frm;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms, ZLib, StrUtils,EncdDecd, Windows,
  Dialogs, StdCtrls, udm, RzTray, Menus, ExtCtrls, DateUtils, DB, ADODB, stat,
  XPMan;

const
  // 此处数字请看  dbf.rc 里的 base64加密后的字符串
  connstr         = 001;    //密码 帐号  数据库名 IP
  passtest        = 100;
  passreal        = 101;
  sa              = 200;
  WZPCBConnect    = 201;
  sj_live_20      = 300;
  wisdompcb       = 301;
  iptest          = 400;
  ipsz            = 401;
  ipmz            = 402;
  ipdg            = 403;


type
  Tarea = (TEST,MZ,DG,SZ);


  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_total: TEdit;
    edt_done: TEdit;
    edt_undo: TEdit;
    tray: TRzTrayIcon;
    pm: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    stattmr: TTimer;
    astmr: TTimer;
    updtmr: TTimer;
    Button1: TButton;
    updqry: TADOQuery;
    Button2: TButton;
    Button3: TButton;
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure stattmrTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
    procedure pmPopup(Sender: TObject);
    procedure astmrTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure updtmrTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure updateone;
    function getStrByID(strID:Integer):string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.N3Click(Sender: TObject);
var
  ver:string;
begin
  with TOpenDialog.Create(nil) do
  begin
    Options:=[ofPathMustExist,ofFileMustExist,ofEnableSizing,ofDontAddToRecent];
    Filter:='FlyProber主程序|FlyProber*.exe|所有可执行文件|*.exe';
    FilterIndex:=1;
    Title:='请选择宇之光飞针测试程序';
    if Execute then
    begin
      ver:=dm.getver(FileName);
      if StrToFloat(ver)>=3.8 then
        dm.recordprogram(FileName,ver)
      else
        ShowMessage('版本太低(低于3.8)或程序不对(非飞针测试程序)');
    end;
  end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  case dm.getRunProg of
  -1: tray.ShowBalloonHint('注意','请使用3.8以上版本',bhiWarning);
  -2: tray.ShowBalloonHint('注意','请确认已经打开并登录了飞测测试程序',bhiWarning);
  0:  tray.ShowBalloonHint('注意','请确认已经打开并登录了飞测测试程序',bhiWarning);
  else
    tray.ShowBalloonHint('提示','已找到程序',bhiInfo);
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  tray.Free;
  Application.Terminate;
end;

procedure TForm1.stattmrTimer(Sender: TObject);
begin
  with dm.statqry do
  begin
    Open;
    Close;
    edt_done.Text:=IntToStr(status[True]);
    edt_undo.Text:=IntToStr(status[False]);
    edt_total.Text:=IntToStr(status[False]+status[True]);
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=False;
  Self.Visible:=False;
  tray.MinimizeApp;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  tray.RestoreApp;
  Self.Visible:=True;
  Self.WindowState:=wsNormal;
end;

procedure TForm1.pmPopup(Sender: TObject);
begin
  N1.Default:=not Self.Visible;
end;

procedure TForm1.astmrTimer(Sender: TObject);
begin
  astmr.Enabled:=False;
  if dm.Tag=0 then
  N4.Click;
  astmr.Interval:=60000;
  if dm.Tag>0 then
    dm.mainstarter;
  astmr.Enabled:=True;
  updtmr.Enabled:=True;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //更换工厂的时候修改这个连接字符串 然后在目标数据库增加表 参考y1411.sql
  updqry.ConnectionString:=Format(getStrByID(connstr),
            [getStrByID(passreal),getStrByID(WZPCBConnect),
            getStrByID(wisdompcb),getStrByID(ipdg)]);
  astmr.Enabled:=True;
  SetWindowLong(Application.Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);

end;

procedure TForm1.updateone;
var
  one:TOneData;
  strs:TStrings;
  sdate,edate:TDateTime;
  y,m,d,h,n,s,ms:Word;
  i:Integer;
begin
  with dm do
  try
    if gettopdata(one) then
    begin
      strs:=TStringList.Create;
      if ExtractStrings([','],[],PChar(Trim(one.strline)),strs) = 15 then
      begin
        sdate:=StrToDateTime(one.datestr+' '+strs.Strings[1]);
        edate:=StrToTime(strs.Strings[9]);
        DecodeDateTime(edate,y,m,d,h,n,s,ms);
        edate:=IncSecond(IncMinute(IncHour(sdate,h),n),s);
        if Format('%.4d-%.2d-%.2d',[YearOf(edate),MonthOf(edate),DayOf(edate)])<>one.datestr then
        sdate:=IncDay(sdate,-1);
        DecodeTime(edate-sdate,h,n,s,ms);

        with updqry do
        begin
          for i:=0 to strs.Count-1 do
          case i of
          1: Parameters.Items[i].Value:=sdate;
          9: Parameters.Items[i].Value:=s+n*60+h*3600;
          else
            case Parameters.Items[i].DataType of
            ftInteger: Parameters.Items[i].Value:=StrToInt(strs.Strings[i]);
            ftString:  Parameters.Items[i].Value:=strs.Strings[i];
            end;
          end;
          Parameters.Items[15].Value:=edate;
          Parameters.Items[16].Value:=string(one.hash);
          try
            odataqry.Tag:=ExecSQL;
            Close;
          except
            odataqry.Tag:=10;
            Close;
          end;
        end;
      end;
    end;
  finally
    odataqry.close;
  end;


end;

procedure TForm1.updtmrTimer(Sender: TObject);
begin

  try
    updateone;
  except
    updtmr.Enabled:=False;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with tsfrm.Create(Self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  fs,ms:TMemoryStream;
  cs:TCompressionStream;
  size:Integer;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'empty.mdb') then
  begin
    fs:=TMemoryStream.Create;
    ms:=TMemoryStream.Create;
    cs:=TCompressionStream.Create(clMax,ms);
    try
      fs.LoadFromFile(ExtractFilePath(Application.ExeName)+'empty.mdb');
      size:=fs.Size;
      fs.SaveToStream(cs);
      fs.Clear;
      fs.WriteBuffer(Size,SizeOf(Size));
      fs.CopyFrom(ms,0);
      fs.SaveToFile(ExtractFilePath(Application.ExeName)+'db.res');
    finally
      ms.Free;
      cs.Free;
      fs.Free;
    end;
  end;


end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ds:TDecompressionStream;
  ms:TMemoryStream;
  rs:TResourceStream;
  s:Integer;
begin
  rs:=TResourceStream.Create(HInstance,'db','dbfile');
  rs.Position:=0;
  rs.ReadBuffer(s,SizeOf(s));
  ds:=TDecompressionStream.Create(rs);
  ms:=TMemoryStream.Create;
  ms.SetSize(s);
  ds.Read(ms.memory^,s);
  ms.SaveToFile(ExtractFilePath(Application.ExeName)+'data1.mdb');
  ds.Free;
  ms.Free;
  rs.Free;
end;

function TForm1.getStrByID(strID: Integer): string;
begin
  Result:=LoadStr(strID);
  if Length(Result) mod 4 >0 then
  Result:= LeftStr(Result+'====',(Length(Result) div 4 + 1)*4);
  Result:=DecodeString(Result);
end;

end.
