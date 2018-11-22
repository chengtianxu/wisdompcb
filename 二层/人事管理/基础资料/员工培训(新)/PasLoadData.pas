unit PasLoadData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGridEh, StdCtrls, Eastriver_API, Eastriver_Helper,
  Buttons,xmldom, XMLIntf, msxmldom, XMLDoc, ExtCtrls;

type
  TfrmLoadData = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    dbDevList: TDBGridEh;
    btnDown: TBitBtn;
    Panel3: TPanel;
    lbShow: TLabel;
    btnUp: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
//    procedure btnClearClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
  private
    pck:TClockInfo;
    TOXML:TXMLDocument;
//    errStr:string;
//    function CheckHandle(hPort: THandle): Boolean;
    procedure DisConDev(hDev: THandle);
    function GetPck:TClockInfo;
    function ConnectVirtory(var hPort:THandle):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoadData: TfrmLoadData;
  rootNode,childNode:IXMLNode;
  
implementation

uses DAMO;

{$R *.dfm}

procedure TfrmLoadData.FormShow(Sender: TObject);
begin
  DM.adoLoadData.Open;
  DM.cdsLoadData.Data := DM.dspLoadData.Data;
end;

procedure WriteRecord(CardNO, CardTime,EmpId: string);    //写记录
var
  cardNode:IXMLNode;
begin
  cardNode:=childNode.AddChild('CARD_INFO');
  cardNode.Attributes['CardNo'] := CardNo;
  cardNode.Attributes['CardTime'] := CardTime;
  cardNode.Attributes['Emp_ID']:= EmpId;
  cardNode.Attributes['HasIntoDB'] := 'F';
end;

function DataProgressProc(p: Pointer;lpReadData: PReadData): Boolean;stdcall;    //回调函数
var
  Records:TICRecord;
begin
  FillChar(Records,SizeOf(Records),0);
  Move(lpReadData^.CardNo[0],Records.Card[0],sizeof(lpReadData^.CardNo));
  Move(lpReadData^.TimeString[0],Records.timeString[0],sizeof(lpReadData.TimeString));
  Records.flag:=lpReadData.flag;
  WriteRecord(records.Card, Records.timeString,Records.EmpId);
  Result:=true;
end;

function TfrmLoadData.GetPck: TClockInfo;
begin
   FillChar(Result,sizeof(Result),0);
   Result.CommStyle:=1;
   Result.IPAddr:=Trim(DM.adoLoadData.fieldbyname('devip').AsString);
   Result.IPPort:=DevPort;
   Result.clock_id:=DM.adoLoadData.fieldbyname('devid').AsInteger;
end;

procedure TfrmLoadData.DisConDev(hDev: THandle);
begin
  if CheckHandle(hDev) then
  begin
    DllAPI.UnCallClock(hDev);
    DllAPI.ClosePortHandle(hDev);
  end;
end;

procedure WaitProc(p: Pointer; dwMilliseconds: Integer);stdcall;   //延时函数
begin
  Application.ProcessMessages;
end;

function TfrmLoadData.ConnectVirtory( var hPort: THandle): Boolean;  //判断连接状态
var
  DevTime:Double;
begin
  Result:=False;
  with DM.cdsLoadData do
  begin
    hPort:=DllAPI.OpenClientSocket(PAnsiChar(Trim(FieldByName('devip').AsString)),DevPort);
    if (not CheckHandle(hPort)) or (not DllAPI.CallClock(hPort,StrToIntDef(Trim(FieldByName('devip').AsString),0))) then
    begin
      Edit;
      FieldByName('connctstatus').Value:='连接失败';
      Post;
    end
    else
    begin
      Edit;
      if DllAPI.ReadClockTime(hPort,DevTime) then
      begin
        FieldByName('devtime').AsDateTime:=DevTime;
        FieldByName('connctstatus').AsString:='连线中';
        Result:=True;
      end
      else
      begin
        FieldByName('connctstatus').AsString:='连接失败';
      end;
      Post;
    end;
  end;
end;

procedure TfrmLoadData.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLoadData.btnDownClick(Sender: TObject);
var
  hDevPort,hDevPort2:THandle;
  cardNode:IXMLNode;
  boolstr:Boolean;
  recTotalCount,i,j,errCount,loadRecordCount:Integer;
  saveFile:TSaveDialog;
  saveFileName,errstr,devip,devno,cardNo,cardTime,cardTimeTmp:string;
//  isVirtory:string;
begin
  errstr:='';
  errCount:=0;
  saveFile:=TSaveDialog.Create(Self);
  try
    saveFile.Filter:='.xml';
    saveFile.DefaultExt:='xml';
    saveFile.FileName:=FormatDateTime('yyyyMMddhhmmss',Now());
    if saveFile.Execute then saveFileName:=saveFile.FileName
    else Exit;
  finally
    saveFile.Free;
  end;
  lbShow.Caption:='正在采集数据....';

  TOXML:=TXMLDocument.Create(nil);
  TOXML.Active:=True;
  TOXML.Version:='1.0';
  TOXML.Options:= [doNodeAutoCreate,doNodeAutoIndent,doAttrNull,doAutoPrefix,doNamespaceDecl];
  rootNode:=TOXML.AddChild('Main');
  if not DM.cdsLoadData.IsEmpty then
  begin
    with DM.cdsLoadData do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('selected').AsBoolean then
        begin
          recTotalCount:=0;
          dbDevList.Cursor:= crHourGlass;
          Application.ProcessMessages;
          childNode:=rootNode.AddChild('IP_ADDR');
          childNode.Attributes['IP']:=FieldByName('devip').AsString ;
          childNode.Attributes['DevID']:= Trim(FieldByName('devid').AsString);
          childNode.Attributes['Vir']:='T';
          try
            if ConnectVirtory(hDevPort) then  //判断是否联机
            begin
              if not DllAPI.ReadClockRecordTotal(hDevPort,recTotalCount) then        //取得总记录数
              begin
                DM.cdsLoadData.Edit;
                DM.cdsLoadData.FieldByName('note').AsString:='取得记录总数失败';
                DM.cdsLoadData.Post;
              end;
              loadRecordCount:=DllAPI.ReadAllRecord(hDevPort,@pck,DataProgressProc,WaitProc);    //下载记录
              if recTotalCount=loadRecordCount then
              begin
                DM.cdsLoadData.Edit;
                DM.cdsLoadData.FieldByName('note').AsString:='下载成功';
                DM.cdsLoadData.Post;
              end
              else
              begin
                DM.cdsLoadData.Edit;
                DM.cdsLoadData.FieldByName('note').AsString:='下载失败';
                DM.cdsLoadData.Post;
                childNode.Attributes['Vir']:='F';
              end;
            end;
            TOXML.SaveToFile(saveFileName);
          finally
            DisConDev(hDevPort);                             //关闭联机
            dbDevList.Cursor:=crDefault;
          end;
        end;
        Next;
      end;
    end;
  end
  else ShowMessage('不存在培训卡钟');
  TOXML.Active:=False;


  lbShow.Caption:='正在保存数据....';
  if FileExists(saveFileName) then
  begin
    try
      dbDevList.Cursor:=crHourGlass;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('if exists(select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb..#traintmp'') and type=''U'') '+ #13+
                'drop table #traintmp '+#13+
                'create table #traintmp(employeeid int,employeecard nvarchar(20),card_datetime datetime,card_date nvarchar(20), ' +
                'card_time nvarchar(20),devid nvarchar(10),remark nvarchar(20),flag bit)');
        ExecSQL;
      end;

      TOXML.LoadFromFile(saveFileName);
      TOXML.Active:=True;
      rootNode:=TOXML.DocumentElement;
      if rootNode<>nil then
      begin
        childNode:=rootNode.ChildNodes.First;
        if childNode<>nil then
        begin
          devip:=childNode.Attributes['IP'];
          devno:=childNode.Attributes['DevID'];

          for i:=0 to rootNode.ChildNodes.Count-1 do
          begin
            errCount:=0;
            errstr:=errstr+'机号'+ devno + '：总数 '+ IntToStr(childNode.ChildNodes.Count) + ' 条/';
            for j:=0 to childNode.ChildNodes.Count-1 do
            begin
              cardNode:=childNode.ChildNodes[j];
              cardNo:=cardNode.Attributes['CardNo'];
              cardTimeTmp:=cardNode.Attributes['CardTime'];

              CardTime := Copy(cardTimeTmp,1,4) + '-' + Copy(cardTimeTmp,5,2) + '-' +  Copy(cardTimeTmp,7,2) + ' ' + Copy(cardTimeTmp,9,2) + ':' + Copy(cardTimeTmp,11,2) + ':' + Copy(cardTimeTmp,13,2);
              DM.adoTmp.Close;
              DM.adoTmp.SQL.Clear;
              DM.adoTmp.SQL.Text:='insert into #traintmp values(0,'+ QuotedStr(cardNo)+','+ QuotedStr(CardTime)+','+
                                  QuotedStr(FormatDateTime('yyyy-MM-dd',StrToDateTime(CardTime)))+','+
                                  QuotedStr(FormatDateTime('HH:MM:ss',StrToDateTime(CardTime)))+','+ QuotedStr(devno) +',null,0)';
              if DM.adoTmp.ExecSQL<>-1 then
              begin
                cardNode.Attributes['HasIntoDB']:='T';
                Inc(errCount);
              end;

            end;
            Application.ProcessMessages;
          end;
          errstr:=errstr+'导入 '+ IntToStr(errCount)+' 条'+#13;
        end;
        TOXML.SaveToFile(saveFileName);
        TOXML.Active:=False;
        TOXML:=nil;
      end;

      with dm.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update #traintmp '+#13+
                  'set #traintmp.employeeid=employeemsg.rkey '+#13+
                  'from #traintmp join employeemsg on #traintmp.employeecard=employeemsg.cardno';
        ExecSQL;
      end;
      DM.ADOConnection1.BeginTrans;
      with dm.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='insert into employee_train_eastid'+#13+
                  'select employeeid, employeecard, card_datetime, card_date, card_time, devid, remark, flag from #traintmp';
        ExecSQL;
      end;
      dbDevList.Cursor:=crDefault;
      DM.ADOConnection1.CommitTrans;
    except
      on E: Exception do
      begin
        dbDevList.Cursor:=crDefault;
        DM.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end
  else ShowMessage('文件不存在');
  ShowMessage(errstr+#13);
  lbShow.Caption:='保存完成';

  if MessageDlg('是否删除卡机上的打卡数据？删除操作只针对于下载成功的卡机',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    lbShow.Caption:='正在删除记录...';
    if not DM.cdsLoadData.IsEmpty  then
    begin
      DM.cdsLoadData.First;
      while not DM.cdsLoadData.Eof do
      begin
        if (DM.cdsLoadDataselected.Value=True) and  (DM.cdsLoadData.FieldByName('note').AsString='下载成功') then
        begin
          try
            if ConnectVirtory(hDevPort2) then
            begin
              boolstr:=DllAPI.ClearAllReadCard(hDevPort2);
              if boolstr then
              begin
                DM.cdsLoadData.Edit;
                DM.cdsLoadData.FieldByName('note').AsString:='删除成功';
                DM.cdsLoadData.Post;
              end
              else
              begin
                DM.cdsLoadData.Edit;
                DM.cdsLoadData.FieldByName('note').AsString:='删除失败';
                DM.cdsLoadData.Post;
              end;
            end;
          finally
            DisConDev(hDevPort2);
          end;
        end;
        DM.cdsLoadData.Next;
      end;
    end;
    lbShow.Caption:='删除完成';
  end;
end;

//procedure TfrmLoadData.btnClearClick(Sender: TObject);
//var
//  hDevPort2:THandle;
//  boolstr:Boolean;
//begin
//  if MessageDlg('确实要删除打卡记录吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
//  begin
//    lbShow.Caption:='正在删除记录';
//    if not DM.cdsLoadData.IsEmpty  then
//    begin
//      DM.cdsLoadData.First;
//      while not DM.cdsLoadData.Eof do
//      begin
//        if (DM.cdsLoadDataselected.Value=True) and (DM.cdsLoadData.FieldByName('note').AsString='下载成功') then
//        begin
//          try
//            if ConnectVirtory(hDevPort2) then
//            begin
//              boolstr:=DllAPI.ClearAllReadCard(hDevPort2);
//              if boolstr then
//              begin
//                DM.cdsLoadData.Edit;
//                DM.cdsLoadData.FieldByName('note').AsString:='删除成功';
//                DM.cdsLoadData.Post;
//              end
//              else
//              begin
//                DM.cdsLoadData.Edit;
//                DM.cdsLoadData.FieldByName('note').AsString:='删除失败';
//                DM.cdsLoadData.Post;
//              end;
//            end;
//          finally
//            DisConDev(hDevPort2);
//          end;
//        end;
//        DM.cdsLoadData.Next;
//      end;
//    end;
//    lbShow.Caption:='删除完成';
//  end;
//end;

procedure TfrmLoadData.btnUpClick(Sender: TObject);
var
  isCheckDev:Boolean;
  devIP,devNO:string;
  cardNO,empcode,chname:string;
  totalCount,upCount:Integer;
  hDevPort:THandle;
begin
  isCheckDev:=False;
  totalCount:=0;
  with DM.cdsLoadData do
  begin
    First;
    while not DM.cdsLoadData.Eof do
    begin
      if DM.cdsLoadDataselected.Value then isCheckDev:= True;
      DM.cdsLoadData.Next;
    end;
  end;
  if not isCheckDev then
  begin
    ShowMessage('请先选择一个设备');
    exit;
  end;
  btnUp.Cursor:=crHourGlass;
  lbShow.Caption:='正在上传名单...';
  Application.ProcessMessages;
  try
    DM.cdsLoadData.First;
    while not DM.cdsLoadData.Eof do
    begin
      upCount:=0;
      if DM.cdsLoadDataselected.Value then
      begin
        devIP:=DM.cdsLoadDatadevip.Value;
        devNO:=DM.cdsLoadDatadevid.Value;
        try
          if ConnectVirtory(hDevPort) then
          begin
            if DllAPI.ClearAllNamelist(hDevPort)>=0 then
            begin
              with DM.adoTmp do
              begin
                Close;
                SQL.Clear;
                SQL.Text := 'SELECT employeecode, chinesename,  cardno ' +
                            ' FROM employeemsg WHERE (status = 1 or status=0) and len(cardno)=10 ';
                Open;
                totalCount:=RecordCount;
                First;
                while not Eof do
                begin
                  cardNO:= Trim(FieldByName('cardno').AsString);
                  empcode:= Trim(FieldByName('employeecode').AsString);
                  chname:= Trim(FieldByName('chinesename').AsString);
                  if DllAPI.SetAllowedCard(hDevPort,PChar(cardNO),PChar(empcode),PAnsiChar(chname)) then
                  begin
                    Inc(upCount);
                    Next;
                  end;
                end;
              end;
            end;
          end;
        finally
          DisConDev(hDevPort);
        end;
        
        if totalCount=upCount then
        begin
          DM.cdsLoadData.Edit;
          DM.cdsLoadData.FieldByName('note').AsString:='上传成功';
          DM.cdsLoadData.Post;
        end
        else
        begin
          DM.cdsLoadData.Edit;
          DM.cdsLoadData.FieldByName('note').AsString:='上传失败';
          DM.cdsLoadData.Post;
        end;
      end;
      DM.cdsLoadData.Next;
    end;
    lbShow.Caption:='上传名单完成';
    btnUp.Cursor:=crDefault;
  except
    on E: Exception do
    begin
      btnUp.Cursor:=crDefault;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

end;

end.
