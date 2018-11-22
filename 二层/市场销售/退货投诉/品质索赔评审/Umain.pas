unit Umain;

interface

uses
  Windows,common, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, Menus, StdCtrls, Buttons,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP,ShellAPI;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    IdFTP1: TIdFTP;
    OpenDialog1: TOpenDialog;
    btn2: TBitBtn;
    btn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    N4: TMenuItem;
    Panel5: TPanel;
    Panel4: TPanel;
    DBGridEh3: TDBGridEh;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh4: TDBGridEh;
    BitBtn8: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
     ssql:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Upu597, Uweixin;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
 ssql:=dm.ADO597.SQL.Text;
 RadioGroup1.ItemIndex:=0;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 if not App_init_2(dm.ADOConnection1) then
 begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
    exit;
 end;

Caption := application.Title;
// dm.ADOConnection1.Open;
//  rkey73:= '4109';
//  user_ptr:='4330';
//  vprev:= '4';


  end;

procedure TForm2.N1Click(Sender: TObject);
var dx, str:string;
begin
 if(StrToInt(vprev)<>4)and(StrToInt(vprev)<>2) then
 begin
  messagedlg('对不起!您没有该程序的权限',mtinformation,[mbok],0);
  Exit;
 end;
 DM.ADOQuery2.Close;
 DM.ADOQuery2.SQL.Text:='SELECT TOP 1  status,mark,rkey73, rkey597,seq_no FROM data0599 WHERE rkey597= '+quotedstr(dm.ADO597rkey.AsString)+'  AND rkey73= '+rkey73 ;
 DM.ADOQuery2.Open;
 if DM.ADOQuery2.FieldByName('status').Value=True then
 begin
  ShowMessage('审批状态发生改变,请刷新数据');
  exit;
 end;

if messagedlg('确认评审?',mtconfirmation,[mbyes,mbno],1)<>mryes then exit
else

 DM.ADOPS.Close;
 DM.ADOPS.Parameters[0].Value:=DM.ADO597rkey.Value;
 DM.ADOPS.Open;
 if not DM.ADOPS.IsEmpty then
 begin
  str := InputBox('审批意见','','');
  dm.ADOPS.Edit;
  DM.ADOPSauth_date.AsDateTime := common.getsystem_date(DM.ADOQuery1,0);
  DM.ADOPSPUTH_INFO.Value:=str;
  DM.ADOPSstatus.Value:=True;
  DM.ADOPSmark.Value:=False;
  DM.ADOPS.Post;
  DM.ADOPS.UpdateBatch();

  DM.ADOQuery2.Close;
  DM.ADOQuery2.SQL.Text:='SELECT TOP 1  mark,rkey73, rkey597,seq_no FROM data0599 WHERE rkey597= '+quotedstr(dm.ADO597rkey.AsString)+'  AND status=0 ORDER BY SEQ_NO asc ' ;
  DM.ADOQuery2.Open;

  if not DM.ADOQuery2.IsEmpty then
  begin
   DM.ADOQuery2.Edit;
   DM.ADOQuery2.FieldByName('mark').Value:=True;
   DM.ADOQuery2.UpdateBatch();


   dx:=' (*＾-＾*) 客户品质索赔申请需要您审批.索赔编号 : '+dm.ADO597spNumber.Value+'.申请人:'+dm.ADO597USER_FULL_NAME.Value+' 数量: '+dm.ADO597Number.AsString+' 金额: '+dm.ADO597spmoney.AsString +'币种:'+dm.ADO597CURR_NAME.Value;

   with DM.ADOQuery1 do
   begin
    Close;
    sql.clear;
    SQL.Add('declare @classid as int');
    SQL.Add('INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES('+ QuotedStr( dx)+',GETDATE(),'+rkey73+')'+'select @classid=@@identity');
    SQL.Add('INSERT INTO data0314(emp_ptr,d14_ptr)VALUES('+dm.ADOQuery2.fieldbyname('rkey73').AsString+','+ '@classid'+')');
    ExecSQL;
   end;
  end
  else
  begin
   with DM.ADOQuery1 do
   begin
    Close;
    sql.clear;
    SQL.Add('UPDATE data0597 SET status=3 WHERE rkey='+dm.ADO597rkey.AsString);
    ExecSQL;
   end;
  end;
  BitBtn1Click(Sender);
  DM.ADO597AfterScroll(DM.ADO597);
 end;
end;
procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 dm.ADO597.Close;
 DM.ADO597.Open;
end;
procedure TForm2.N3Click(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LFtp:= TIdFTP.Create(nil);
  try
    LFileName:= DM.ADS598FileName.AsString;
    LFtpName:= DM.ADS598Ftp_fileName.AsString;
    LSaveDlg.FileName:= DM.ADS598FileName.AsString;
    if LSaveDlg.Execute then
    begin
      LFileName:= LSaveDlg.FileName;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where rkey = ' + DM.ADS598Ftp_Ptr.AsString;
        open;
        if not IsEmpty then
        begin
          LFtp.Host := Fields[1].AsString;
          LFtp.Username := Fields[2].AsString;
          LFtp.Password := Fields[3].AsString;
          LFtpDir := Trim(Fields[4].AsString);
        end
        else
        begin
          ShowMessage('没有找到FTP服务器，请联系管理员');
          exit;
        end;
      end;
      try
        if not LFtp.Connected then LFtp.Connect(True,10000);
        if LFTp.Connected then
        begin

          with DM.ADOQuery1 do
          begin
            Close;
            SQL.Text := ' SELECT Tier3_CustomerFiles.FileName, Tier3_CustomerFiles.Ftp_fileName, Tier3_CustomerFiles.IDKey '+
                        ' FROM dbo.DATA0598 INNER JOIN dbo.Tier3_CustomerFiles ON dbo.DATA0598.FtpIDKey = dbo.Tier3_CustomerFiles.IDKey '+
                        ' where data0598.rkey597 ='+  dm.ADO597Rkey.AsString + ' and data0598.rec_no ='+dm.ADS598rec_no.AsString;

            Open;
          end;
          if not DM.ADOQuery1.IsEmpty then
          begin
            if FileExists(DM.ADOQuery1.FieldByName('FileName').AsString) then
            if MessageBoxA(Handle,'是否覆盖原有资料？','提示',MB_YESNO) <> id_yes then
            begin
              Exit;
            end;
          end;
          LFTp.Get(LFtpDir+LFtpName,LFileName,True);
          ShellExecute(self.Handle,nil,pchar(LFileName),nil,nil,SW_SHOWNORMAL);
        end;
      except
        ShowMessage('FTP链接失败,下载失败');
        Exit;
      end;
    end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LFTp.Free;
  end;

end;



procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
 if (DM.ADO597.IsEmpty) or (RadioGroup1.ItemIndex=1 ) then
 begin
   N1.Enabled:=False;
   N2.Enabled:=False;
   n4.Enabled:=False;
 end
 else
 begin
   N1.Enabled:=True;
   N2.Enabled:=True;
   n4.Enabled:=True;
 end;
 if (not DM.ADO597.IsEmpty) and (RadioGroup1.ItemIndex=1 ) then N4.Enabled:=True else N4.Enabled:=False; 
end;

procedure TForm2.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
end;

procedure TForm2.N2Click(Sender: TObject);
var str:string;
begin
 if(StrToInt(vprev)<>4)and(StrToInt(vprev)<>2) then
 begin
  messagedlg('对不起!您没有此权限',mtinformation,[mbok],0);
  Exit;
 end;
 DM.ADOQuery2.Close;
 DM.ADOQuery2.SQL.Text:='select status from data0597 WHERE rkey= '+quotedstr(dm.ADO597rkey.AsString) ;
 DM.ADOQuery2.Open;
 if DM.ADOQuery2.FieldByName('status').Value=4 then
 begin
  ShowMessage('审批状态发生改变,请刷新数据');
  exit;
 end;
 
 if messagedlg('确认退回?',mtconfirmation,[mbyes,mbno],1)=mrno then exit
 else
 str := InputBox('退回原因','','');
 DM.ADOConnection1.BeginTrans;
 try
  dm.ADOQuery2.Close;
  DM.ADOQuery2.SQL.Text:='UPDATE data0597 SET status=4 WHERE rkey= '+quotedstr( dm.ADO597rkey.AsString);
  DM.ADOQuery2.ExecSQL;
  dm.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='UPDATE data0599 SET status=NULL,auth_date=GETDATE(),PUTH_INFO= '+ QuotedStr(str)+' WHERE rkey597= '+quotedstr( dm.ADO597rkey.AsString)+'AND seq_no= '+quotedstr( dm.ADO597seq_no.AsString);
  DM.ADOQuery1.ExecSQL;
  DM.ADOConnection1.CommitTrans;
 except
   DM.ADOConnection1.RollbackTrans;
   end;

 BitBtn1Click(Sender);
 DM.ADO597AfterScroll(DM.ADO597);
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
 if DM.ADS598.IsEmpty then N3.Enabled:=False else N3.Enabled:=True;
end;



procedure TForm2.btn2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
 DM.ADO597.Close;
 DM.ADO597.SQL.Clear;
 if RadioGroup1.ItemIndex=0 then
 DM.ADO597.SQL.Text:=ssql+' and( dbo.data0597.status = 2) AND (dbo.data0599.rkey73 = '+rkey73+' ) AND (dbo.data0599.mark =1)'
 else
 DM.ADO597.SQL.Text:=ssql+' and( dbo.data0599.rkey73 = '+rkey73+' ) and dbo.data0597.status<>3 and mark<>1';
 DM.ADO597.Open;
 DM.ADO597AfterScroll(DM.ADO597);
end;

procedure TForm2.N4Click(Sender: TObject);
begin
 if(StrToInt(vprev)<>4)and(StrToInt(vprev)<>2) then
 begin
  messagedlg('对不起!您没有此权限',mtinformation,[mbok],0);
  Exit;
 end;
 DM.ADOQuery1.Close;
 DM.ADOQuery1.SQL.Text:='SELECT * FROM data0599 WHERE auth_date IS NULL AND rkey73= '+rkey73+' and rkey597= '+dm.ADO597rkey.AsString;
 DM.ADOQuery1.Open;
 if not DM.ADOQuery1.IsEmpty  then
 begin
  ShowMessage('未审批不允许取消');
  Exit;
 end;


 DM.ADOQuery1.Close;
 DM.ADOQuery1.SQL.Text:='SELECT rkey597 FROM data0599 WHERE  auth_date IS NOT NULL AND  seq_no> '+dm.ADO597seq_no.asstring+' and rkey597= '+dm.ADO597rkey.AsString;
 DM.ADOQuery1.Open;

 if dm.ADOQuery1.IsEmpty then
 begin
  DM.ADOConnection1.BeginTrans;
  try
   DM.ADOQuery2.Close;
   DM.ADOQuery2.SQL.Text:='UPDATE data0599 SET mark=0 WHERE  mark=1 and rkey597= '+dm.ADO597rkey.AsString;
   DM.ADOQuery2.ExecSQL;
   DM.ADOQuery1.Close;
   DM.ADOQuery1.SQL.Text:='UPDATE data0599 SET auth_date=NULL, PUTH_INFO=NULL,status=0, mark=1 WHERE seq_no= '+dm.ADO597seq_no.asstring+' and rkey597= '+dm.ADO597rkey.AsString;
   DM.ADOQuery1.ExecSQL;
   dm.ADOConnection1.CommitTrans;
  except
    DM.ADOConnection1.RollbackTrans;
    end;
  RadioGroup1.ItemIndex:=0;
  BitBtn1Click(Sender);
  DM.ADO597AfterScroll(DM.ADO597);
 end
 else
 ShowMessage('后面审批人员已审批,不能取消!');
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
begin
 Form5.ShowModal;
end;


end.
