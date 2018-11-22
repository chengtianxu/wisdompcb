unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, ExtCtrls, Buttons, ExtDlgs,common,
  DB, ADODB, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdFTP;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    N1: TMenuItem;
    N9: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    IdFTP1: TIdFTP;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh3CellClick(Column: TColumnEh);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation

uses demo, detail;

{$R *.dfm}

procedure TFrm_main.N1Click(Sender: TObject);
var     str:string;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
  DM.ADOQuery2.Close;
  DM.ADOQuery2.Parameters[0].Value:=DM.ado600rkey.Value;
  DM.ADOQuery2.Open;
  DM.ADOQuery2.First;
  while not DM.ADOQuery2.eof do
  begin
    if DM.ADOQuery2auth_flag.Value=2 then
    begin
     ShowMessage('其它流程已退回审批,审批结束');
     Exit;
    end
    else
    DM.ADOQuery2.Next;
  end;
 if messagedlg('是否确认评审?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    str := InputBox('审批意见','','');
    DM.ADOConnection1.BeginTrans;
   try
    DM.ADOedit602.Edit;
    DM.ADOedit602user_ptr.AsString:=user_ptr;
    DM.ADOedit602auth_date.Value:=getsystem_date(DM.temp,0);
    DM.ADOedit602PUTH_INFO.Value:=str;
    DM.ADOedit602auth_flag.Value:=1;
    DM.ADOedit602.Post;
    DM.ADOloop.Close;
    DM.ADOloop.Parameters[0].Value:=DM.ado600rkey.Value;
    DM.ADOloop.Open;
    if DM.ADOloop.IsEmpty then
    begin
      DM.ADOQuery2.Close;
      DM.ADOQuery2.Parameters[0].Value:=DM.ado600rkey.Value;
      DM.ADOQuery2.open;
      DM.ADOQuery2.Edit;
      DM.ADOQuery2status.Value:=3;
      DM.ADOQuery2auth_date.Value:=getsystem_date(DM.temp,0);
      DM.ADOQuery2.Post;
    end;
    DM.ADOConnection1.CommitTrans;
    DM.ado600.Close;
    dm.ado600.Open;

   except
    on E:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      MessageDlg(E.Message,mtError,[mbCancel],0);
    end;
   end;
  end;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
   end;
  self.caption:=application.Title;

// dm.ADOConnection1.Open;
 // user_ptr_dept := '8';//员工部门标识
//  rkey73:= '3685';
//  user_ptr:='4330'; //员工代码05.rey
//  vprev:= '4';
  DM.ado600.Close;
  DM.ado600.Parameters[0].Value:=user_ptr_dept;
  DM.ado600.Open;
end;

procedure TFrm_main.btn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin
 Application.CreateForm(TFrm_authinfo,Frm_authinfo);
 DM.ADOQuery1.Close;
 DM.ADOQuery1.Parameters[0].Value:=DM.ado600rkey.AsString;
 DM.ADOQuery1.open;
 Frm_authinfo.ShowModal;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
 DM.ado600.Open;
end;

procedure TFrm_main.DBGridEh3CellClick(Column: TColumnEh);
begin
 Memo1.Text:=DM.ADO603.fieldbyname('solution').AsString;
 Memo2.Text:=DM.ADO603.fieldbyname('diff_declare').AsString;
 Memo3.Text:=DM.ADO603.fieldbyname('status_date').AsString;
end;


procedure TFrm_main.DBGridEh1CellClick(Column: TColumnEh);
begin
 Memo1.Clear;
 Memo2.Clear;
 Memo3.Clear;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
 DM.ADOedit602.Close;
 dm.ADOedit602.Parameters[0].Value:=DM.ado600rkey.Value;
 dm.ADOedit602.Parameters[1].Value:=user_ptr_dept;
 DM.ADOedit602.Open;
 if (DM.ADOedit602auth_flag.Value=1) or (DM.ADOedit602auth_flag.Value=2)  then
 begin
  N1.Enabled:=False;
  N3.Enabled:=False;
 end
 else
 begin
  N1.Enabled:=True;
  N3.Enabled:=True
 end;

end;

procedure TFrm_main.FormActivate(Sender: TObject);
begin
 Memo1.Clear;
 Memo2.Clear;
 Memo3.Clear;
end;

procedure TFrm_main.N3Click(Sender: TObject);
var str:string;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
  DM.ADOQuery2.Close;
  DM.ADOQuery2.Parameters[0].Value:=DM.ado600rkey.Value;
  DM.ADOQuery2.SQL.Add('and dept_ptr = '+user_ptr_dept);
  DM.ADOQuery2.Open;
  str := InputBox('审批意见','','');
  DM.ADOQuery2.Edit;
  DM.ADOQuery2user_ptr.AsString:=user_ptr;
  DM.ADOQuery2auth_date.Value:=getsystem_date(DM.temp,0);
  DM.ADOQuery2date602.Value:=getsystem_date(DM.temp,0);
  DM.ADOQuery2PUTH_INFO.Value:=str;
  DM.ADOQuery2auth_flag.Value:=2;
  DM.ADOQuery2status.Value:=4;
  DM.ADOQuery2.Post;
  DM.ado600.Close;
  DM.ado600.Open;
end;

procedure TFrm_main.btn2Click(Sender: TObject);
begin
 dm.ado600.Close;
 DM.ado600.Open;
end;

procedure TFrm_main.N2Click(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LFtp:= TIdFTP.Create(nil);
  try
    with DM.ADS601 do
    begin
     Close;
     Parameters[0].Value:= dm.ado600rkey.Value;
     Open;
    end;
    LFileName:= DM.ADS601FileName.AsString;
    LFtpName:= DM.ADS601Ftp_fileName.AsString;
    LSaveDlg.FileName:= DM.ADS601FileName.AsString;
    if LSaveDlg.Execute then
    begin
      LFileName:= LSaveDlg.FileName;
      with DM.ADOQuery3 do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where rkey = ' + DM.ADS601Ftp_Ptr.AsString;
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
          
          with DM.ADOQuery3 do
          begin
            Close;
            SQL.Text := ' SELECT Tier3_CustomerFiles.FileName, Tier3_CustomerFiles.Ftp_fileName, Tier3_CustomerFiles.IDKey '+
                        ' FROM dbo.DATA0601 INNER JOIN dbo.Tier3_CustomerFiles ON dbo.DATA0601.FtpIDKey = dbo.Tier3_CustomerFiles.IDKey '+
                        ' where data0601.npi_ptr ='+dm.ado600rkey.AsString + ' and data0601.rec_no ='+dm.ADS601rec_no.AsString;

            Open;
          end;
          if not DM.ADOQuery3.IsEmpty then
          begin
            if FileExists(DM.ADOQuery3.FieldByName('FileName').AsString) then
            if MessageBoxA(Handle,'是否覆盖原有资料？','提示',MB_YESNO) <> id_yes then
            begin
              Exit;
            end;
          end;


          LFTp.Get(LFtpDir+LFtpName,LFileName,True);

          ShowMessage('下载完成！');
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

procedure TFrm_main.PopupMenu2Popup(Sender: TObject);
begin
 if DM.ADO601.IsEmpty then
  N2.Enabled:=False
 else
  N2.Enabled:=True;

end;

end.
