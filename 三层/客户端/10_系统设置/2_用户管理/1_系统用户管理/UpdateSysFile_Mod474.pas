unit UpdateSysFile_Mod474;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  uBaseEditFrm, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, IdGlobal, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP;

type
  TfrmUpdateSysFile_Mod474 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    ehLocalFile: TDBGridEh;
    ehUpdateDB: TDBGridEh;
    ehUpLoadFTP: TDBGridEh;
    cdsLocalFile: TClientDataSet;
    dsLocalFile: TDataSource;
    cdsUpdateDB: TClientDataSet;
    dsUpdateDB: TDataSource;
    dsUpLoadFtp: TDataSource;
    cdsUploadFtp: TClientDataSet;
    cdsLocalFileFileName: TStringField;
    cdsLocalFileLocalPath: TStringField;
    cdsLocalFileFtpPath: TStringField;
    cdsLocalFileCheckByVer: TIntegerField;
    cdsUpdateDBDBName: TStringField;
    cdsUpdateDBChecked: TBooleanField;
    cdsUploadFtpChecked: TBooleanField;
    cdsUploadFtpFtpDesc: TStringField;
    cdsUploadFtpFtpIP: TStringField;
    cdsUploadFtpUpdateOK: TIntegerField;
    cdsUpdateDBUpdateOK: TIntegerField;
    idftp1: TIdFTP;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function UpdateDB: Boolean;
    function UploadFtp: Boolean;
  end;

implementation

uses
  uCommFunc;

{$R *.dfm}

procedure TfrmUpdateSysFile_Mod474.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmUpdateSysFile_Mod474.btnSaveClick(Sender: TObject);
begin
  inherited;
  UpdateDB;
  UploadFtp;
  ShowMessage('更新完毕');
end;

procedure TfrmUpdateSysFile_Mod474.FormCreate(Sender: TObject);
begin
  inherited;
  cdsLocalFile.CreateDataSet;
  cdsUpdateDB.CreateDataSet;
  cdsUploadFtp.CreateDataSet;
end;

function TfrmUpdateSysFile_Mod474.UpdateDB: Boolean;
var
  LSql: string;
  LFileArr: string;
  LCds: TClientDataSet;
  LFileFullName: string;
  LFileVer: string;
  LFileModifyTime: TDateTime;
  LErrMsg: string;
  LTmpData: OleVariant;

begin
  Result := True;
  LCds := TClientDataSet.Create(Self);
  LCds.DisableControls;
  cdsLocalFile.DisableControls;
  cdsUpdateDB.DisableControls;
  try
    cdsLocalFile.First;
    while not cdsLocalFile.Eof do
    begin
      if LFileArr = '' then
        LFileArr := QuotedStr(cdsLocalFile.FieldByName('FileName').AsString)
      else
      begin
        LFileArr := LFileArr + ',' + QuotedStr(cdsLocalFile.FieldByName('FileName').AsString);
      end;
      cdsLocalFile.Next;
    end;
    LFileArr := '(' + LFileArr + ')';

    cdsUpdateDB.First;
    while not cdsUpdateDB.Eof do
    begin
      if cdsUpdateDB.FieldByName('checked').AsBoolean then
      begin
        LSql := 'select * from Tier3_SysFiles where FileName in ' + LFileArr;
        if not gSvrIntf.IntfGetDataBySql(LSql,LTmpData,LErrMsg,cdsUpdateDB.FieldByName('DBName').AsString,'公共基础',False) then
        begin
          ShowMessage('数据库:' + cdsUpdateDB.FieldByName('DBName').AsString + ' 更新失败!');
          ShowMessage(LErrMsg);
          cdsUpdateDB.Next;
          Continue;
        end;

        LCds.Data := LTmpData;
        LCds.First;
        while not LCds.Eof do
        begin
          LFileFullName := LCds.FieldByName('DestDir').AsString;
          if LFileFullName[Length(LFileFullName)] <> '\' then
            LFileFullName := LFileFullName + '\';
          LFileFullName := LFileFullName + LCds.FieldByName('FileName').AsString;

          if not FileExists(LFileFullName) then
          begin
            ShowMessage('不存在: ' + LFileFullName);
            LCds.Next;
            Continue;
          end;

          LFileModifyTime := gSysFunc.GetFileModifyTime(LFileFullName);
          if LCds.FieldByName('CheckByVer').AsInteger = 1 then
          begin
            LFileVer := gSysFunc.GetFileVersion(LFileFullName);
            LCds.Edit;
            LCds.FieldByName('LastVersion').AsString := LFileVer;
            LCds.FieldByName('LastModifyTime').AsDateTime := LFileModifyTime;
            LCds.Post;
          end else
          begin
//            LFileModifyTime := gSysFunc.GetFileModifyTime(LFileFullName);
            LCds.Edit;
            LCds.FieldByName('LastModifyTime').AsDateTime := LFileModifyTime;
            LCds.Post;
          end;

          LCds.Next;
        end;

        if LCds.ChangeCount > 0 then
        begin
          LTmpData := LCds.Delta;
        end;

        if gSvrIntf.IntfPostDataByTable('Tier3_SysFiles',LTmpData,LErrMsg,cdsUpdateDB.FieldByName('DBName').AsString,'公共基础') then
        begin
          LCds.MergeChangeLog;

          cdsUpdateDB.Edit;
          cdsUpdateDB.FieldByName('UpdateOK').AsInteger := 1;
          cdsUpdateDB.Post;

        end else
        begin
          ShowMessage('数据库:' + cdsUpdateDB.FieldByName('DBName').AsString + ' 更新失败!');
          ShowMessage(LErrMsg);
        end;
      end;
      cdsUpdateDB.Next;
    end;

  finally
    cdsLocalFile.EnableControls;
    cdsUpdateDB.EnableControls;
    LCds.Free;
  end;
end;

function TfrmUpdateSysFile_Mod474.UploadFtp: Boolean;
var
  LFtpDir: string;
  LFileFullName: string;
begin
  Result := True;
  cdsUploadFtp.DisableControls;
  cdsLocalFile.DisableControls;
  try
    cdsUploadFtp.First;
    while not cdsUploadFtp.Eof do
    begin
      if cdsUploadFtp.FieldByName('checked').AsBoolean then
      begin


        idftp1.Disconnect;
        try
          idftp1.Host := cdsUploadFtp.FieldByName('FtpIP').AsString;
          idftp1.Port := 21;
          idftp1.Username := 'vss';
          idftp1.Password := 'topcbvss';
          idftp1.Connect;

          cdsLocalFile.First;
          while not cdsLocalFile.Eof do
          begin
            LFileFullName := cdsLocalFile.FieldByName('LocalPath').AsString;
            if LFileFullName[Length(LFileFullName)] <> '\' then
              LFileFullName := LFileFullName + '\';
            LFileFullName := LFileFullName + cdsLocalFile.FieldByName('FileName').AsString;
            if not FileExists(LFileFullName) then
            begin
              ShowMessage('不存在：' + LFileFullName);
              cdsLocalFile.Next;
              Continue;
            end;

            LFtpDir := cdsLocalFile.FieldByName('FtpPath').AsString;
            if LFtpDir <> '' then
            begin
              if LFtpDir[Length(LFtpDir)] = '\' then
                LFtpDir[Length(LFtpDir)] := ' ';
            end else
              LFtpDir := '/ERP_3_TIER/';

            try
              idftp1.ChangeDir(LFtpDir);
            except
              ShowMessage('不存在FTP路径 ' +  LFtpDir + ' ' + idftp1.Host);
              cdsLocalFile.Next;
              Continue;
            end;

            try
              idftp1.Put(LFileFullName,ExtractFileName(LFileFullName));
            except
              ShowMessage('上传失败 ：' + LFileFullName + ' ' + idftp1.Host);
              cdsLocalFile.Next;
              Continue;
            end;

            cdsLocalFile.Next;
          end;

        except
          ShowMessage('链接失败：' + cdsUploadFtp.FieldByName('FtpIP').AsString + ' ');
          cdsUploadFtp.Next;
          Continue;
        end;
        cdsUploadFtp.Edit;
        cdsUploadFtp.FieldByName('updateok').AsInteger := 1;
        cdsUploadFtp.Post;
      end;
      cdsUploadFtp.Next;
    end;
  finally
    cdsUploadFtp.EnableControls;
    cdsLocalFile.EnableControls;
    idftp1.Disconnect;
  end;
end;

end.
