unit PasFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus;

type
  TfrmFile = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnClose: TBitBtn;
    ehFile: TDBGridEh;
    pm1: TPopupMenu;
    mniOPen: TMenuItem;
    procedure ehFileDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFile: TfrmFile;

implementation

uses damo,ADODB,idftp,ShellAPI;

{$R *.dfm}

procedure TfrmFile.ehFileDblClick(Sender: TObject);
var
  LTmp:TADOQuery;
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
  LFrm: TfrmFile;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LTmp:= TADOQuery.Create(nil);
  LTmp.Connection:= dm.ADOConnection1;
  LFtp:= TIdFTP.Create(nil);
  try
    LFileName:= DM.qryFile.Fields[0].AsString;
    LFtpName:= DM.qryFile.Fields[1].AsString;
    if not DirectoryExists('D:\FileTmp\') then
    begin
      if not CreateDir('D:\FileTmp\') then
      begin
        LSaveDlg.FileName:= LFileName;
        if LSaveDlg.Execute then LFileName:= LSaveDlg.FileName
        else Exit;
      end
      else  LFileName:= 'D:\FileTmp\' + LFileName;
    end
    else LFileName:= 'D:\FileTmp\' + LFileName;
//          LSaveDlg.FileName:= LFileName;
//          if LSaveDlg.Execute then
//          begin
      with LTmp do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where rkey = ' + DM.qryFile.Fields[2].AsString;
        open;
        if not IsEmpty then
        begin
          LFtp.Host := Fields[1].AsString;
          LFtp.Username := Fields[2].AsString;
          LFtp.Password := Fields[3].AsString;
          LFtpDir := Trim(Fields[4].AsString);
        end;
      end;
      try
        if not LFtp.Connected then LFtp.Connect(True,10000);
        if LFTp.Connected then
        begin
//                LFTp.TransferType:= ftBinary;
          LFTp.Get(LFtpDir+LFtpName,LFileName,True);
          ShellExecute(0,'open',pchar(LFileName),nil,nil,SW_SHOWNORMAL);
        end;
      except
        ShowMessage('FTP¡¥Ω” ß∞‹,œ¬‘ÿ ß∞‹');
        Exit;
      end;
//          end;

  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LTmp.Free;
    LFTp.Free;
  end;
end;

end.
