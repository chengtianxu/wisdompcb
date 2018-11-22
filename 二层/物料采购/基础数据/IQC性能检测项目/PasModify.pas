unit PasModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus,IdTCPConnection, IdTCPClient, IdFTP;

type
  TfrmDetail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TBitBtn;
    lbl2: TLabel;
    lbl3: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    lbl4: TLabel;
    edt4: TEdit;
    ehDetail: TDBGridEh;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cbbCycle: TComboBox;
    lbl5: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FIDKey:string;
    
    function GetIDKey:string;
    function CheckFtpDir(AFtp:TIdFTP;ADir:string):Boolean;
    procedure CreateDir2(AFtp:TIdFTP;ADir:string);
    function Get_05Ptr(ARkey73:string;AType:Integer):string;
  public
    Ltype:Integer;
    procedure LInit;
    { Public declarations }
  end;

var
  frmDetail: TfrmDetail;

implementation

uses DEMO,Pick_Item_Single,ConstVar,ADODB,common;

{$R *.dfm}

procedure TfrmDetail.btn1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'iqc_number/iqc编号/80,barch_no/批号/80,GROUP_NAME/类别编号/60,GROUP_DESC/类别名称/100,INV_PART_NUMBER/材料编码/180,INV_DESCRIPTION/材料规格/250';
    InputVar.Sqlstr := 'select data0391.rkey,DATA0391.iqc_number,DATA0391.barch_no  '+#13+
                       '     ,Data0496.GROUP_NAME,data0496.GROUP_DESC,data0496.RKEY as rkey496   '+#13+
                       '     ,Data0017.INV_PART_NUMBER,Data0017.INV_DESCRIPTION  '+#13+
                       '     ,Data0070.SUPPLIER_POINTER,data0028.SUPPLIER_PART_NO,Data0023.ABBR_NAME  '+#13+
                       '   from DATA0391   '+#13+
                       '     inner join data0017 on DATA0391.rkey17 = data0017.RKEY   '+#13+
                       '     inner join Data0071 on DATA0391.rkey71 = Data0071.RKEY '+#13+
                       '     inner join Data0070 on Data0070.RKEY = Data0071.PO_PTR  '+#13+
                       '     inner join Data0028 on data0017.RKEY = Data0028.INVENTORY_PTR  '+#13+
                       '          and Data0028.SUPPLIER_PTR=Data0070.SUPPLIER_POINTER    '+#13+
                       '     inner join data0496 on data0017.GROUP_PTR = data0496.RKEY  '+#13+
                       '      inner join Data0023 on Data0070.SUPPLIER_POINTER = Data0023.RKEY  '+#13+
                       '   where DATA0391.appl_date > dateadd(MONTH,-3,getdate()) '+#13+
                       '    order by iqc_number desc';
    inputvar.KeyField:='';

    InputVar.AdoConn := dm.con1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin 
       edt1.Text:=frmPick_Item_Single.adsPick.fieldbyname('iqc_number').AsString;
       edt1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
       edt2.Text:=frmPick_Item_Single.adsPick.fieldbyname('GROUP_DESC').AsString;
       edt2.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey496').AsInteger;
       edt3.Text:=frmPick_Item_Single.adsPick.fieldbyname('ABBR_NAME').AsString;
       edt3.Tag:= frmPick_Item_Single.adsPick.fieldbyname('SUPPLIER_POINTER').AsInteger;
       edt4.Text:=frmPick_Item_Single.adsPick.fieldbyname('SUPPLIER_PART_NO').AsString;
    end
  finally
    frmPick_Item_Single.Free;
  end;
end;

function TfrmDetail.CheckFtpDir(AFtp: TIdFTP; ADir: string): Boolean;
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

procedure TfrmDetail.CreateDir2(AFtp: TIdFTP; ADir: string);
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

function TfrmDetail.GetIDKey: string;
var
  FGUID:TGUID;
begin
  CreateGUID(FGUID);
  Result:= GUIDToString(FGUID);
end;

function TfrmDetail.Get_05Ptr(ARkey73: string; AType: Integer): string;
begin
  with dm.qrytmp do
  begin
    close;
    sql.Text:='select data0073.EMPLOYEE_PTR,data0005.EMPLOYEE_NAME from data0073 '+#13+
            '    inner join data0005 on data0073.employee_ptr = data0005.rkey  '+#13+
             'where data0073.rkey='+ ARkey73;
    //             ShowMessage(SQL.Text);
    open;
    if not isempty then
    if AType = 0 then
      result:=fieldbyname('EMPLOYEE_PTR').AsString
    else
      result:=fieldbyname('EMPLOYEE_NAME').AsString;
  end;
end;

procedure TfrmDetail.N1Click(Sender: TObject);
var
  LFtp: TIdFTP;
  LODialog: TOpenDialog;
  LTmp: TADOQuery;
  LFilePath,LFtpDir,LRkey:string;
begin
  LODialog:= TOpenDialog.Create(self);
  LTmp:= TADOQuery.Create(nil);
  LFtp:= TIdFTP.Create(nil);
  LTmp.Connection:= DM.con1;
  try
    if LODialog.Execute then
    begin
      LFilePath:= LODialog.FileName;
      FIDKey:= GetIDKey;
      with LTmp do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where FtpID = 6 order by rkey desc';
        open;
        if not IsEmpty then
        begin
          LFtp.Host := Fields[1].AsString;
          LFtp.Username := Fields[2].AsString;
          LFtp.Password := Fields[3].AsString;
          LFtpDir := Trim(Fields[4].AsString) ;
          LRkey:= Fields[0].AsString;
        end
        else
        begin
          ShowMessage('没有找到FTP服务器，请联系管理员');
          exit;
        end;
      end;

      try
        if not LFtp.Connected then LFtp.Connect(True,10000);
        if LFtp.Connected then
        begin
          if not CheckFtpDir(LFtp,LFtpDir) then Self.CreateDir2(LFtp,LFtpDir);
          LFtp.Put(LFilePath,LFtpDir + FIDKey,True);

          DM.qryFtp.Append;
          DM.qryFtp.FieldByName('IDKey').Value:= FIDKey;
          DM.qryFtp.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
          DM.qryFtp.FieldByName('Ftp_Ptr').Value:= LRkey;
          DM.qryFtp.FieldByName('Ftp_FileName').Value:= FIDKey;
          DM.qryFtp.FieldByName('UPLoadTime').Value:= getsystem_date(LTmp,0);
          DM.qryFtp.FieldByName('GroupIDKey').Value:= FIDKey;
          DM.qryFtp.FieldByName('BEnable').Value:= 1;
          DM.qryFtp.FieldByName('UPloadUser_d05ptr').AsString:= Get_05Ptr(rkey73,0);
          DM.qryFtp.post;

          DM.qryFileList.Append;
          if Ltype = 2 then DM.qryFileList.FieldByName('rkey622').Value:= DM.adsMainrkey.AsInteger;
          DM.qryFileList.FieldByName('FtpIDKey').Value:= FIDKey;
          DM.qryFileList.Post;

          DM.adsDetail.Append;
          DM.adsDetail.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
          dm.adsDetail.FieldByName('UploadTime').value:= DM.qryFtp.FieldByName('UPLoadTime').Value;
          dm.adsDetail.FieldByName('IDKey').value:= FIDKey;
          dm.adsDetail.FieldByName('Ftp_fileName').value:= FIDKey;
          DM.adsDetail.FieldByName('EMPLOYEE_NAME').AsString:= Get_05Ptr(rkey73,1);
          DM.adsDetail.Post;
        end;
      except
        ShowMessage('FTP链接失败,上传失败');
      end;
    end;
  finally
    if LFtp.Connected then LFtp.Disconnect;
    LODialog.Free;
    LTmp.Free;
    LFtp.Free;
  end;
end;

procedure TfrmDetail.N2Click(Sender: TObject);
begin
  if DM.qryFileList.Locate('FtpIDKey',DM.adsDetailIDKey.Value,[]) then
    DM.qryFileList.Delete;
  if DM.qryFtp.Locate('IDKey',DM.adsDetailIDKey.Value,[]) then
    DM.qryFtp.Delete;
  DM.adsDetail.Delete;
end;

procedure TfrmDetail.N3Click(Sender: TObject);
var
  LTmp:TADOQuery;
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LTmp:= TADOQuery.Create(nil);
  LTmp.Connection:= dm.con1;
  LFtp:= TIdFTP.Create(nil);
  try
    LFileName:= DM.adsDetail.Fields[0].AsString;
    LFtpName:= DM.adsDetail.Fields[4].AsString;
    dm.qryFtp.Locate('IDKey',DM.adsDetailIDKey.AsString,[]);
    LSaveDlg.FileName:= DM.adsDetail.Fields[0].AsString;
    if LSaveDlg.Execute then
    begin
      LFileName:= LSaveDlg.FileName;
      with LTmp do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where rkey = ' + DM.qryFtp.Fields[2].AsString;
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
  //                LFTp.TransferType:= ftBinary;
          LFTp.Get(LFtpDir+LFtpName,LFileName,True);
  //        ShellExecute(0,'open',pchar(LFileName),nil,nil,SW_SHOWNORMAL);
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
    LTmp.Free;
    LFTp.Free;
  end;
end;

procedure TfrmDetail.pm1Popup(Sender: TObject);
begin
  N1.Enabled:= (Ltype = 1) or (Ltype =2 );
  N2.Enabled:= (not DM.adsDetail.IsEmpty) and ((Ltype = 1) or (Ltype =2 ));
  N3.Enabled:= (not DM.adsDetail.IsEmpty) ;
end;

procedure TfrmDetail.btnSaveClick(Sender: TObject);
var
  Ltime:TDateTime;
begin
  if Trim(edt1.Text) = '' then
  begin
    ShowMessage('请先选择批次');
    Exit;
  end;

  DM.con1.BeginTrans;
  try
    if Ltype = 1 then  //新增
    begin
      Ltime:= getsystem_date(DM.qrytmp,0);
      with DM.qrytmp do
      begin
        Close;
        SQL.Text:='SELECT rkey, rkey23, rkey496, Model, rkey391, CheckCycle '+#13+
                 ' , CreateTime, CreateUser, status FROM DATA0622 where 1=0';
        Open;
        Append;
        FieldByName('rkey23').Value:= edt3.Tag;
        FieldByName('rkey496').Value:= edt2.Tag;
        FieldByName('Model').Value:= Trim(edt4.Text);
        FieldByName('rkey391').Value:= edt1.Tag;
        FieldByName('CheckCycle').Value:= cbbCycle.ItemIndex + 1;
        FieldByName('CreateTime').Value:= Ltime;
        FieldByName('CreateUser').Value:= StrToInt(rkey73);
        FieldByName('status').Value:= 0;
        Post;
      end;
//      ShowMessage(DM.qrytmp.FieldByName('rkey').AsString);
      if DM.qryFileList.Active then
      begin
        DM.qryFileList.First;
        while not DM.qryFileList.Eof do
        begin
          DM.qryFileList.Edit;;
          DM.qryFileList.FieldByName('rkey622').Value:= DM.qrytmp.FieldByName('rkey').AsInteger;
          DM.qryFileList.Post;
          DM.qryFileList.Next
        end;
      end;
    end
    else if Ltype = 2 then
    begin
      if cbbCycle.ItemIndex <> DM.adsMainCheckCycle.AsInteger -1 then
      with DM.qrytmp do
      begin
        Close;
        SQL.Text:='SELECT rkey, rkey23, rkey496, Model, rkey391, CheckCycle '+#13+
                 ' , CreateTime, CreateUser, status FROM DATA0622 where rkey = ' + DM.adsMainrkey.AsString;
        Open;
        Edit;
        FieldByName('CheckCycle').Value:= cbbCycle.ItemIndex + 1;
        Post;
      end;
    end;
    if DM.qryFtp.Active then DM.qryFtp.UpdateBatch(arAll);
    if DM.qryFileList.Active then DM.qryFileList.UpdateBatch(arAll);

    DM.con1.CommitTrans;
    ModalResult:= mrOk;
  except
    on E: Exception do
    begin
      dm.con1.RollbackTrans;
      messagedlg(E.Message, mterror, [mbcancel], 0);
    end;
  end;
end;


procedure TfrmDetail.LInit;
begin
  edt1.Text:= DM.adsMainiqc_number.AsString;
  edt1.Tag:= DM.adsMainrkey391.AsInteger;
  edt2.Text:= DM.adsMainGROUP_DESC.AsString;
  edt2.Tag:= DM.adsMainrkey496.AsInteger;
  edt3.Text:= DM.adsMainABBR_NAME.AsString;
  edt3.Tag:= DM.adsMainrkey23.AsInteger;
  edt4.Text:= DM.adsMainModel.AsString;
  cbbCycle.ItemIndex:= DM.adsMainCheckCycle.AsInteger - 1;
end;

procedure TfrmDetail.FormShow(Sender: TObject);
begin
  if Ltype = 1 then
  begin
   with DM.qryFileList do
   begin
     Close;
     Parameters[0].Value:= 0;
     open;
   end;
   with DM.qryFtp do
   begin
     Close;
     Parameters[0].Value:= '';
     Open;
   end;
   with DM.adsDetail do
   begin
     Close;
     Parameters[0].Value:= 0;
     Open;
   end;
  end
  else
  begin
   with DM.qryFileList do
   begin
     Close;
     Parameters[0].Value:= DM.adsMainrkey.Value;
     open;
   end;
   with DM.qryFtp do
   begin
     Close;
     Parameters[0].Value:= DM.qryFileList.FieldByName('FtpIDKey').AsString;
     Open;
   end;
   with DM.adsDetail do
   begin
     Close;
     Parameters[0].Value:= DM.adsMainrkey.Value;
     Open;
   end;
  end;
end;

end.
