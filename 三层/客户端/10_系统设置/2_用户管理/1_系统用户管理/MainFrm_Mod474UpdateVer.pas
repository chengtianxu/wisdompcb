unit MainFrm_Mod474UpdateVer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMain_Mod474Update = class(TfrmBaseMain)
    mniUpdateVer: TMenuItem;
    procedure mniUpdateVerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
    procedure InLineInitUI;override;
  end;

implementation

uses
  UpdateSysFile_Mod474, System.IniFiles, System.StrUtils;

{$R *.dfm}

{ TfrmMain_Mod474Update }

procedure TfrmMain_Mod474Update.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  inherited;
end;

procedure TfrmMain_Mod474Update.InLineInitUI;
var
  I: Integer;
begin
  inherited;
  for I := 0 to ehMain.Columns.Count - 1 do
  begin
    if ehMain.Columns[I].FieldName.ToUpper = 'CHECKED' then
      ehMain.Columns[I].ReadOnly := False;
  end;
end;

function LoadDBList(ADBLst: TStringList): Boolean;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
  LStr: string;
begin
  Result := False;
  LFileName := ExtractFilePath(ParamStr(0)) + 'ERPLauncher.ini';
  if not fileexists(LFileName) then
  begin
    ShowMessage('没有找到ERPLauncher.ini配置文件，加载INI失败');
    Exit;
  end;

  Lini := TIniFile.Create(LFileName);
  LS := TStringList.Create;
  try
    Lini.ReadSectionValues('DBList', LS);
    for LStr in LS do
    begin
      ADBLst.Add(SplitString(LStr,'=')[0]);
    end;
  finally
    Lini.Free;
    LS.Free;
  end;
  Result := True;
end;

procedure TfrmMain_Mod474Update.mniUpdateVerClick(Sender: TObject);
var
  LFrm: TfrmUpdateSysFile_Mod474;
  LRecNO: Integer;
  LS: TStringList;
  I: Integer;
begin
  inherited;
  cdsMain.DisableControls;
  LRecNO := cdsMain.RecNo;
  cdsMain.First;
  LFrm := TfrmUpdateSysFile_Mod474.Create(Self);
  LS := TStringList.Create;
  try
    while not cdsMain.Eof do
    begin
      if cdsMain.FieldByName('Checked').AsBoolean then
      begin
        LFrm.cdsLocalFile.Append;
        LFrm.cdsLocalFile.FieldByName('FileName').AsString := cdsMain.FieldByName('FileName').AsString;
        LFrm.cdsLocalFile.FieldByName('LocalPath').AsString := cdsMain.FieldByName('DestDir').AsString;
        LFrm.cdsLocalFile.FieldByName('FtpPath').AsString := cdsMain.FieldByName('FtpDir').AsString;
        LFrm.cdsLocalFile.FieldByName('CheckByVer').AsInteger := cdsMain.FieldByName('CheckByVer').AsInteger;
        LFrm.cdsLocalFile.Post;
      end;
      cdsMain.Next;
    end;


    if LoadDBList(LS) then
    begin
      for I := 0 to LS.Count - 1 do
      begin
        LFrm.cdsUpdateDB.Append;
        LFrm.cdsUpdateDB.FieldByName('DBName').AsString := LS[I];
        LFrm.cdsUpdateDB.FieldByName('Checked').AsBoolean := True;
        LFrm.cdsUpdateDB.Post;
      end;
    end else
      Exit;

    {$REGION '添加写死 FTP'}
    LFrm.cdsUploadFtp.Append;
    LFrm.cdsUploadFtp.FieldByName('FtpIP').AsString := '172.16.8.112';
    LFrm.cdsUploadFtp.FieldByName('FtpDesc').AsString := '深圳演示';
    LFrm.cdsUploadFtp.FieldByName('Checked').AsBoolean := True;
    LFrm.cdsUploadFtp.Post;


    LFrm.cdsUploadFtp.Append;
    LFrm.cdsUploadFtp.FieldByName('FtpIP').AsString := '172.16.0.15';
    LFrm.cdsUploadFtp.FieldByName('FtpDesc').AsString := '深圳正式';
    LFrm.cdsUploadFtp.FieldByName('Checked').AsBoolean := True;
    LFrm.cdsUploadFtp.Post;

    LFrm.cdsUploadFtp.Append;
    LFrm.cdsUploadFtp.FieldByName('FtpIP').AsString := '172.18.0.8';
    LFrm.cdsUploadFtp.FieldByName('FtpDesc').AsString := '东莞HDI';
    LFrm.cdsUploadFtp.FieldByName('Checked').AsBoolean := True;
    LFrm.cdsUploadFtp.Post;

    LFrm.cdsUploadFtp.Append;
    LFrm.cdsUploadFtp.FieldByName('FtpIP').AsString := '172.17.1.183';
    LFrm.cdsUploadFtp.FieldByName('FtpDesc').AsString := '梅州志浩';
    LFrm.cdsUploadFtp.FieldByName('Checked').AsBoolean := True;
    LFrm.cdsUploadFtp.Post;

    LFrm.cdsUploadFtp.Append;
    LFrm.cdsUploadFtp.FieldByName('FtpIP').AsString := '172.18.8.37';
    LFrm.cdsUploadFtp.FieldByName('FtpDesc').AsString := '东莞测试8.37';
    LFrm.cdsUploadFtp.FieldByName('Checked').AsBoolean := True;
    LFrm.cdsUploadFtp.Post;

    LFrm.cdsUploadFtp.Append;
    LFrm.cdsUploadFtp.FieldByName('FtpIP').AsString := '192.168.1.37';
    LFrm.cdsUploadFtp.FieldByName('FtpDesc').AsString := '东莞测试1.37';
    LFrm.cdsUploadFtp.FieldByName('Checked').AsBoolean := True;
    LFrm.cdsUploadFtp.Post;

    {$ENDREGION}




    LFrm.ShowModal;

    cdsMain.RecNo := LRecNO;
  finally
    cdsMain.EnableControls;
    LFrm.Free;
    LS.Free;
  end;
end;

end.
