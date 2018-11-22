unit Uedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB, ADODB,IdFTP;

type
  TfrmEdit = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    eh_file: TDBGridEh;
    btn_Save: TBitBtn;
    btn_exit: TBitBtn;
    pmFile: TPopupMenu;
    NUp: TMenuItem;
    NDown: TMenuItem;
    NDel: TMenuItem;
    qry_temp: TADOQuery;
    qry_file: TADOQuery;
    qry_tc: TADOQuery;
    ds_file: TDataSource;
    qry_fileSave: TADOQuery;
    qry_FTP: TADOQuery;
    lbl3: TLabel;
    lbl4: TLabel;
    edt_CCOde: TEdit;
    edt_CName: TEdit;
    atncfld_filerkey: TAutoIncField;
    intgrfld_fileTClass_ptr: TIntegerField;
    wdstrngfld_fileFTPIDKey: TWideStringField;
    strngfld_fileIDKey: TStringField;
    strngfld_fileFileName: TStringField;
    intgrfld_fileFtp_Ptr: TIntegerField;
    strngfld_fileFtpDir: TStringField;
    strngfld_fileFtp_fileName: TStringField;
    dtmfld_fileUploadTime: TDateTimeField;
    intgrfld_fileUploadUser_d05ptr: TIntegerField;
    strngfld_fileGroupIDKey: TStringField;
    qry_fileBEnable: TBooleanField;
    procedure NUpClick(Sender: TObject);
    procedure btn_SelDeptClick(Sender: TObject);
    procedure btn_SelPostClick(Sender: TObject);
    procedure NDownClick(Sender: TObject);
    procedure NDelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure pmFilePopup(Sender: TObject);
  private
    { Private declarations }
    FIDKey:string;
    function GetIDKey: string;
    function CheckFtpDir(AFtp:TIdFTP;ADir: string): Boolean;
    procedure CreateDir(AFtp: TIdFTP; ADir: string);
  public
    { Public declarations }
    FRkey:integer;
    FEditType:integer;
    procedure GetData(Arkey:integer);
  end;

var
  frmEdit: TfrmEdit;

implementation
      uses common,UDM,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TfrmEdit.CreateDir(AFtp: TIdFTP; ADir: string);
var
  LStrList:TStringList;
  LDir:string;
  i:Integer;
begin
  LDir:='/';
  LStrList:= TStringList.Create;
  try
    LStrList.Delimiter:='/';
    LStrList.DelimitedText:= ADir;
    if AFtp.Connected then
    begin
      for i:=1 to LStrList.Count - 2 do
      begin
        AFtp.ChangeDir(LDir);
        LDir:= LDir + LStrList[i] + '/';
        try
          AFtp.ChangeDir(LDir);
        except
          AFtp.MakeDir(LStrList[i]);
        end;
      end;
    end;
  finally
    LStrList.Free;
  end;
end;

function TfrmEdit.CheckFtpDir(AFtp:TIdFTP;ADir: string): Boolean;
begin
  Result:= False;
  if AFtp.Connected then
  try
    AFtp.ChangeDir(ADir);
    Result:= True;
  except
    Result:= False;
  end;
end;

function TfrmEdit.GetIDKey: string;
var
  FGUID:TGUID;
begin
  CreateGUID(FGUID);
  Result:= GUIDToString(FGUID);
end;

procedure TfrmEdit.GetData(Arkey: integer);
var
  Lsql:string;
begin
   qry_tc.close;
   qry_tc.Parameters[0].Value:=Arkey ;
   qry_tc.Open;

   qry_file.Close;
   qry_file.Parameters[0].value:=Arkey;
   qry_file.Open;

//       培训需求：
//     Lsql:='select rkey,item from dataDetail where  dictid=27 ';
//     dm.OpenQry(qry_temp,Lsql);
//     if not qry_temp.IsEmpty  then
//     begin
//     cbb_CType2.Items.Clear;
//     qry_temp.First;
//      while not qry_temp.Eof do
//      begin
//       cbb_CType2.Items.AddObject(qry_temp.FieldByName('item').AsString,TObject(qry_temp.FieldByName('rkey').AsInteger));
//       qry_temp.Next;
//      end;
//     end;

  if   FEditType=1 then
  begin
//    cbb_CType.ItemIndex:=0;
//    cbb_CType2.ItemIndex:=0;
//    cbb_TType.ItemIndex:=0;
//    cbb_EType.ItemIndex:=0;
//
//    edt_Thours.text:='0';
  end;
  if   FEditType<3  then
  begin
    qry_fileSave.Close;
    qry_fileSave.Open;
    qry_ftp.close;
    qry_ftp.open;
    FIDKey:=qry_FTP.fieldbyname('IDkey').asstring;
  end;

  if FEditType>1  then
  begin
     edt_CCOde.Text:=qry_tc.Fieldbyname('ccode').Value;
     edt_CName.Text:=qry_tc.Fieldbyname('CName').Value;

//    cbb_CTYpe.ItemIndex:=qry_tc.Fieldbyname('CTYpe').asinteger;
//    cbb_CTYpe2.ItemIndex:=cbb_CTYpe2.Items.IndexOfObject(TObject(qry_tc.Fieldbyname('ctype2').AsInteger));
//    cbb_TTYpe.ItemIndex:=qry_tc.Fieldbyname('TTYpe').asinteger;
//    cbb_ETYpe.ItemIndex:=qry_tc.Fieldbyname('ETYpe').asinteger;

//    edt_THours.text:= qry_tc.Fieldbyname('THours').asstring;
  end;

end;

procedure TfrmEdit.NUpClick(Sender: TObject);
var
  LFtp: TIdFTP;
  LODialog: TOpenDialog;
  LFilePath,LFtpDir,LRkey:string;
  Lsql:string;
begin
  LODialog:= TOpenDialog.Create(self);
  LFtp:= TIdFTP.Create(nil);
  try
    if LODialog.Execute then
    begin
      LFilePath:= LODialog.FileName;
      FIDKey:= GetIDKey;
     Lsql:= 'SELECT top 1  Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where ftpName=''人事部'' ';    //人事课件目录
     if not common.OpenQuery(qry_temp,Lsql) then exit;
        if not qry_temp.IsEmpty then
        begin
          LFtp.Host := qry_temp.Fields[1].AsString;
          LFtp.Username := qry_temp.Fields[2].AsString;
          LFtp.Password := qry_temp.Fields[3].AsString;
          LFtpDir := Trim(qry_temp.Fields[4].AsString) ;
          LRkey:= qry_temp.Fields[0].AsString;
        end;
       Lsql:= 'SELECT b.IDkey from Tier3_CustomerFiles b   inner join tier3_ftplist a on a.rkey=b.Ftp_Ptr '+
              ' where a.ftpName=''人事部'' and FileName=' + QuotedStr(ExtractFileName(LFilePath));    //ExtractFileName
      if not common.OpenQuery(qry_temp,Lsql) then Exit;
      if not qry_temp.IsEmpty then
        begin
         //  ShowMessage('已存在此文件');
//          Exit;
          qry_File.Append;
          qry_File.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
          qry_File.FieldByName('FtpIDKey').Value:=qry_temp.fieldbyname('IDKey').AsString; //FIDKey;
          qry_File.Post;
        end
        else
        begin
          DM.con.BeginTrans;
          try
            if not LFtp.Connected then LFtp.Connect(True,10000);
            if LFtp.Connected then
            begin
              if not qry_FTP.Active then qry_FTP.Open;
              qry_Ftp.Append;
              qry_Ftp.FieldByName('IDKey').Value:= FIDKey;
              qry_Ftp.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
              qry_Ftp.FieldByName('Ftp_Ptr').Value:= LRkey;
              qry_Ftp.FieldByName('Ftp_FileName').Value:= FIDKey;
              qry_Ftp.FieldByName('UPLoadTime').Value:= getsystem_date(qry_temp,0);
              qry_Ftp.FieldByName('UPloadUser_d05ptr').Value:=common.rkey73;
              qry_Ftp.FieldByName('GroupIDKey').Value:= FIDKey;
              qry_Ftp.FieldByName('BEnable').Value:= 1;
              qry_Ftp.post;

              qry_File.Append;
              qry_File.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
              qry_File.FieldByName('FtpIDKey').Value:= FIDKey;
              qry_File.Post;
              if not CheckFtpDir(LFtp,LFtpDir) then Self.CreateDir(LFtp,LFtpDir);
              LFtp.Put(LFilePath,LFtpDir + FIDKey,True);
              DM.con.CommitTrans;
            end;
          except
            DM.con.RollbackTrans;
            ShowMessage('FTP链接失败,上传失败');
          end;
        end;

    end;
  finally
    if LFtp.Connected then LFtp.Disconnect;
    LODialog.Free;
    LFtp.Free;
  end;

end;

procedure TfrmEdit.btn_SelDeptClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'departmentname/部门名称/100,departmentcode/部门号码/100,rkey/部门ID/120,';
    InputVar.Sqlstr :='select * from datadepartment order by 2';
    InputVar.AdoConn := DM.con;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     // edt_Dept.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
     // edt_Dept.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
      //lb_deptname.Caption := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmEdit.btn_SelPostClick(Sender: TObject);
 var
 inputRec:PdlgInput;
begin
    frmPick_item_single:= TfrmPick_item_single.Create(nil);
    inputRec.fields:= 'item/职务名称/400';
    inputrec.sqlstr:='select  rkey, item   from datadetail where dictid=1 ';
    inputrec.keyField:='rKey' ;
    inputrec.ADoConn:=dm.con;
    try
    frmPick_item_single.InitForm_New(inputrec);
    if frmPick_item_single.ShowModal =mrok then
    begin
     //edt_post.text:= frmPick_item_single.adsPick.fieldbyname('item').asstring;
    // edt_post.Tag:= frmpick_item_single.adsPick.fieldByName('rkey').asinteger
    end;

    finally
      frmpick_item_single.Free;
   end;
end;

procedure TfrmEdit.NDownClick(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
  Lsql:string;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LFtp:= TIdFTP.Create(nil);
  try
      Lsql:= 'SELECT FileName,Ftp_FileName FROM Tier3_CustomerFiles WHERE IDKey = ' + QuotedStr(qry_file.fieldbyname('FtpIDKey').AsString);
     dm.OpenQry(qry_temp,Lsql);

        if not qry_temp.IsEmpty then
        begin
          LFileName:= qry_temp.Fields[0].AsString;
          LFtpName:= qry_temp.Fields[1].AsString;
          LSaveDlg.FileName:= LFileName;
          if LSaveDlg.Execute then
          begin
              Lsql:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                      ' from tier3_ftplist where rkey = ' + qry_file.fieldbyname('Ftp_ptr').AsString;
             dm.OpenQry(qry_temp,Lsql);
              if not qry_temp.IsEmpty then
              begin
                LFtp.Host := qry_temp.Fields[1].AsString;
                LFtp.Username := qry_temp.Fields[2].AsString;
                LFtp.Password := qry_temp.Fields[3].AsString;
                LFtpDir := Trim(qry_temp.Fields[4].AsString);
              end;

            try
              if not LFtp.Connected then LFtp.Connect(True,10000);
              if LFTp.Connected then
              begin
                LFTp.Get(LFtpDir+LFtpName,LSaveDlg.FileName,True);
              end;
            except
              ShowMessage('FTP链接失败,下载失败');
              Exit;
            end;
          end;
        end
        else
        begin
          ShowMessage('此文件还没有上传到FTP，请先保存后再下载！');
          exit;
        end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LFTp.Free;
  end;
end;

procedure TfrmEdit.NDelClick(Sender: TObject);
begin
  qry_file.Delete;
end;

procedure TfrmEdit.btn_SaveClick(Sender: TObject);
var
  Lsql:string;
begin
   if Trim(edt_CCOde.text)=''  then
   begin
   ShowMessage('课程编码不能为空');
   edt_CCOde.SetFocus;
   exit;
   end;

   if Trim(edt_CName.text)=''  then
   begin
   ShowMessage('课程名称不能为空');
   edt_CName.SetFocus;
   exit;
   end;


   if FEditType=1  then
   begin
   qry_tc.Append;
   qry_tc.FieldByName('CCode').value:=Trim(edT_ccode.Text);
   end
   else  if FEditType=2  then
   qry_tc.Edit;

   qry_tc.FieldByName('Cname').value:=Trim(edt_CName.Text);
  // qry_tc.FieldByName('Deptid').value:=edt_Dept.tag;
  // qry_tc.FieldByName('Postid').value:=edt_Post.tag;

//   qry_tc.FieldByName('CType').value:=cbb_CTYpe.ItemIndex;
//   qry_tc.FieldByName('CType2').value:=Integer(cbb_CType2.Items.Objects[cbb_CType2.ItemIndex]);
//   qry_tc.FieldByName('TType').value:=cbb_TType.ItemIndex;
//   qry_tc.FieldByName('EType').value:=cbb_ETYpe.ItemIndex;
//
//   qry_tc.FieldByName('THours').value:=edt_THours.text;
   qry_tc.Post;


   try
   dm.con.BeginTrans;
   qry_tc.UpdateBatch(arall);
   qry_FTP.UpdateBatch(arall);
   Lsql:='delete from  trainclass_file where TClass_ptr='+qry_tc.fieldbyname('rkey').asstring+' ';

   if FEditType>1  then
   dm.execsql(qry_temp,Lsql);

   qry_file.First;
   while not qry_file.Eof do
   begin
   qry_fileSave.Append;
   qry_fileSave.FieldByName('TClass_ptr').value:=qry_tc.FieldByName('rkey').value;
   qry_fileSave.FieldByName('FTPIDKey').value:=qry_file.FieldByName('FtpIDKey').value ;
   qry_fileSave.post;
   qry_file.Next;
   end;
   
   qry_fileSave.UpdateBatch(arall);

   dm.con.CommitTrans;
   self.ModalResult:=mrok ;
   except on e:Exception do
    begin
    ShowMessage('错误 ：'+e.message);
    dm.con.RollbackTrans;
    end;

   end;
end;

procedure TfrmEdit.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TfrmEdit.pmFilePopup(Sender: TObject);
begin
     NUp.Enabled:=(FEditType in [1,2]);
     NDown.Enabled:=(not qry_file.IsEmpty);
     NDel.Enabled:=(not qry_file.IsEmpty) and (FEditType<>3);

end;

end.
