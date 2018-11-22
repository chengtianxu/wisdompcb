unit Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DBCtrlsEh, Grids,
  DBGridEh, DB, Math, Menus, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, IdFTPList, IdFTPCommon;

const sqltext = 'select CONTROL_NO_LENGTH,SEED_VALUE,SEED_FLAG,Convert(varchar(8),getdate(),112) as StrDate from data0004 where SEED_MEAN=''报价时效编号''';

type
  TfrmDetail = class(TForm)
    pnlTools: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBText1: TDBText;
    btnLookCust: TBitBtn;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    btnLookType: TBitBtn;
    DBText2: TDBText;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dtCreate: TDBDateTimeEditEh;
    dtFinish: TDBDateTimeEditEh;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    IdFTP1: TIdFTP;
    dlgUp: TOpenDialog;
    dlgDown: TSaveDialog;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    sbtnSetLink: TSpeedButton;
    pnlSetFTPLink: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    sbtnSave: TSpeedButton;
    sbtnCancel: TSpeedButton;
    edtIP: TEdit;
    edtUID: TEdit;
    edtPSW: TEdit;
    pnlNotes: TPanel;
    lblNotes: TLabel;
    mmNotes: TMemo;
    sbtnYES: TSpeedButton;
    sbtnNO: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtFileDir: TEdit;
    btnLookSales: TBitBtn;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    btnLookCurr: TBitBtn;
    DBText3: TDBText;
    DBMemo1: TDBMemo;
    Label11: TLabel;
    DBComboBox1: TDBComboBox;
    DBMemo2: TDBMemo;
    Label15: TLabel;
    DBCheckBox5: TDBCheckBox;
    nN6: TMenuItem;
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ConnectFTP(Host, UId, PSW, FileDir: string);
    procedure FormShow(Sender: TObject);
    procedure btnLookCustClick(Sender: TObject);
    procedure btnLookTypeClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure sbtnSetLinkClick(Sender: TObject);
    procedure sbtnSaveClick(Sender: TObject);
    procedure sbtnCancelClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure sbtnYESClick(Sender: TObject);
    procedure sbtnNOClick(Sender: TObject);
    procedure btnLookSalesClick(Sender: TObject);
    procedure btnLookCurrClick(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure nN6Click(Sender: TObject);
  private
    IP,UID,PSW,FileDir: string;
    IsPost: Byte;
    SeqNO: Integer;
    function locateRecord(RKEY242:string; seqNO:string):Boolean;
    procedure Update_04(v_seed: string);
  public
    { Public declarations }
  end;
  TUp = function(FileName: PAnsiChar):Boolean; stdcall;
  TDown = function(DataBaseFileName,dlgFileName: PAnsiChar):Boolean; stdcall;
  TDel = function(FileName: PAnsiChar):Boolean; stdcall;

var
  frmDetail: TfrmDetail;

implementation

uses damo, Main, common, ConstVar, Pick_Item_Single, IniFiles;

{$R *.dfm}

procedure TfrmDetail.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmDetail.FormActivate(Sender: TObject);
begin
  SeqNO:= 1;
  if frmMain.YY = 1 then  //新增
  begin
    frmMain.OpenQuery(dm.aqTmp,[],sqltext);
    frmMain.OpenQuery(dm.aqMain,['0']);
    dm.aqMain.Append;
    dm.aqMain.FieldValues['RKEY']:= 0;
    
    //如PaperNo中的日期与实际日期不同,流水号从1开始
    if Copy(dm.aqTmp.FieldByName('SEED_VALUE').Value,1,8)<>dm.aqTmp.FieldByName('StrDate').Value
    then Update_04(dm.aqTmp.FieldByName('SEED_VALUE').Value);

    DBEdit1.Text:= dm.aqTmp.FieldByName('SEED_VALUE').Value;
    dm.aqMain.FieldValues['CreateTime']:= getsystem_date(dm.aqTmp,0);
    dm.aqMain.FieldValues['CreateBy_PTR']:= USERRKEY;
  end;
  if frmMain.YY = 2 then  //编辑
  begin
    if not (dm.aqMain.State in [dsInsert, dsEdit]) then dm.aqMain.Edit;
    dm.aqDetail.Last;
    While not dm.aqDetail.Bof do
    begin
      if SeqNO<=dm.aqDetail.FieldByName('SeqNO').AsInteger then
      begin
        SeqNO:=dm.aqDetail.FieldByName('SeqNO').AsInteger;
        Inc(SeqNO);
      end;
      dm.aqDetail.Prior;
    end;
    if not (dm.aqDetail.State in [dsInsert, dsEdit]) then dm.aqDetail.Edit;
  end;
end;

procedure TfrmDetail.Update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed,new_begin,old_begin:string;
begin
  old_begin:= Copy(v_seed,1,8);
  v_seed:= Copy(v_seed,9,Length(v_seed)-8);  //去掉前面的日期
  frmMain.OpenQuery(dm.aqTmp,[],sqltext);
  new_begin:= dm.aqTmp.FieldByName('StrDate').Value;
  v_length := length(v_seed);

  if old_begin <> new_begin then
  begin
    for i:= v_length-1 downto 1 do
    begin
      new_seed:= new_seed + '0';
    end;
    new_seed:= new_begin + new_seed + '1';    //如果日期不同,流水号则重新开始
    dm.aqTmp.Edit;
    dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
    dm.aqTmp.Post;
  end
  else
  begin
    for i := v_length downto 1 do
    if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
    begin
      v_last:= floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
      new_seed:= new_begin + copy(v_seed,1,i) + copy(v_last,i+1,v_length-i);
      dm.aqTmp.Edit; //使前缀不变后缀加1
      dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
      dm.aqTmp.Post;
      break;
    end
    else
    if i=1 then //如果第一位仍然是数字
    begin
      v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
      new_seed := new_begin + copy(v_last,2,v_length);
      dm.aqTmp.Edit;
      dm.aqTmp.FieldByName('SEED_VALUE').Value := new_seed;
      dm.aqTmp.Post;
    end;
  end;
end;

procedure TfrmDetail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if IsPost = 1 then Exit;
  if frmMain.YY <> 3 then
  begin
    if messagedlg('你确定不保存退出吗?', mtconfirmation, [mbyes, mbno],0) = mryes then
    begin
      if dm.aqMain.State in [dsInsert, dsEdit] then dm.aqMain.Cancel;
      if dm.aqDetail.State in [dsInsert, dsEdit] then dm.aqDetail.Cancel;
      self.ModalResult:= mrCancel;
    end
    else
      CanClose:= False;
  end;
end;

procedure TfrmDetail.btnSaveClick(Sender: TObject);
begin
//  if dm.aqMain.FieldByName('CUST_PTR').IsNull then
//  begin
//    ShowMessage('请选择客户!');
//    Abort;
//  end;
  if dm.aqMain.FieldByName('Type_PTR').IsNull then
  begin
    ShowMessage('请选择报价类型!');
    if btnLookType.CanFocus then btnLookType.SetFocus;
    Abort;
  end;
  if dm.aqMain.FieldByName('IsNewCustQuote').IsNull then
  begin
    ShowMessage('请选择是否新客户报价!');
    if DBCheckBox5.CanFocus then DBCheckBox5.SetFocus;
    Abort;
  end;
  if DBEdit3.Text='' then
  begin
    ShowMessage('客户名称不能为空!');
    if DBEdit3.CanFocus then DBEdit3.SetFocus;
    Abort;
  end;
  if DBEdit7.Text='' then
  begin
    ShowMessage('请输入客户型号!');
    if DBEdit7.CanFocus then DBEdit7.SetFocus;
    Abort;
  end;
  if DBEdit5.Text='' then
  begin
    ShowMessage('请选择业务代表!');
    if btnLookSales.CanFocus then btnLookSales.SetFocus;
    Abort;
  end;
    if DBEdit8.Text='' then
  begin
    ShowMessage('请选择货币!');
    if btnLookCurr.CanFocus then btnLookCurr.SetFocus;
    Abort;
  end;
  IsPost:= 1;
  dm.ADOConn.BeginTrans;
  try
    with dm.aqMain do
    begin
      if not (State in [dsinsert, dsedit]) then Edit;
//      if frmMain.YY = 1 then FieldByName('CreateBy_PTR').AsString:= USERRKEY;
      UpdateBatch();
    end;
    with dm.aqDetail do
    begin
      DisableControls;
      if frmMain.YY = 1 then
      begin
        First;
        while not Eof do
        begin
          if not (State in [dsEdit]) then Edit;
          FieldByName('PTR_242').Value:= dm.aqMainRKEY.Value;
          Next;
        end;
      end;
      UpdateBatch();
      EnableControls;
    end;
    if frmMain.YY = 1 then Update_04(trim(DBEdit1.Text));
    dm.ADOConn.CommitTrans;
    ModalResult:= mrok;
  except
    dm.ADOConn.RollbackTrans;
  end;
end;

procedure TfrmDetail.N1Click(Sender: TObject);
var
  DLLHandle: THandle;
  Func: TUp;
begin
  {因D7的IdFTP控件有BUG,改为调用dll(开发工具:XE3)完成该功能}
  if not dm.aqDetail.Active then Exit;
  if dlgUp.Execute then
  begin
    DLLHandle := LoadLibrary('myFTP.dll');
    if DLLHandle>0 then
    begin
      try
        @Func:= GetProcAddress(DLLHandle,'Up');
        if Assigned(@Func) then
        begin
          Application.ProcessMessages;
          if Func(PAnsiChar(dlgUp.FileName)) then
          begin
            with dm.aqDetail do
            begin
              Append;
              FieldByName('PTR_242').AsInteger:= dm.aqMain.FieldByName('RKEY').AsInteger;
              FieldByName('SeqNO').AsInteger:= SeqNO;
              FieldByName('FileName').AsString:= ExtractFileName(dlgUp.FileName);
              FieldByName('UploadTime').AsDateTime:= getsystem_date(dm.aqTmp,0);
              FieldByName('UploadBy_PTR').AsString:= USERRKEY;
              Post;
            end;
            Inc(SeqNO);
          end;
        end
        else
          Showmessage('在myFTP.dll中未找到Up函数!');
      finally
        FreeLibrary(DLLHandle);
      end;
    end
    else
      Showmessage('未找到myFTP.dll');
  end;
end;

procedure TfrmDetail.ConnectFTP(Host, UId, PSW, FileDir: string);
var
  vList: TStrings;
begin
  try
    IdFTP1.Host := Host;  //FTP服务器地址
    IdFTP1.Username := UId;  //FTP服务器用户名
    IdFTP1.Password := PSW;  //FTP服务器密码
    IdFTP1.Connect();  //连接到ftp

    IdFTP1.ChangeDir(FileDir);  //进入BJ_Data子目录{初始目录IdFTP1.RetrieveCurrentDir}
    vList:= TStringList.Create;
    try
      IdFTP1.List(vList);  //得到BJ_Data目录下所有文件列表
    finally
      vList.Free;
    end;
  except
    ShowMessage('连接FTP服务器失败!');
    Abort;
  end;
end;

procedure TfrmDetail.FormShow(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  MyIniFile:= TIniFile.Create(ExtractFilePath(ParamStr(0))+'FTP_Link.ini');
  try
    IP:= MyIniFile.ReadString('FTP服务器','服务器IP','172.18.0.15');
    UID:= MyIniFile.ReadString('FTP服务器','用户名','erpmk');
    PSW:= Base64_Decode(MyIniFile.ReadString('FTP服务器','密码','i/V12ur1WAY'));  //解密后:erpmkpcb
    FileDir:= MyIniFile.ReadString('FTP服务器','报价时效文档目录','BJ_Data');
  finally
    MyIniFile.Free;
  end;
end;

procedure TfrmDetail.btnLookCustClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                        'BILLING_ADDRESS_1/地址/251,SALES_REP_NAME/业务代表/100';
    if ((StrToInt(vprev) = 1) or (StrToInt(vprev) = 2)) then
    begin
      InputVar.Sqlstr:= 'Select t10.RKEY,t10.CUST_CODE,t10.CUSTOMER_NAME,t10.BILLING_ADDRESS_1, '+#13+
        't5.RKEY as RKEY5,t5.EMPLOYEE_NAME as SALES_REP_NAME,t10.PHONE,t10.GEN_EMAIL_ADDRESS,t10.CURRENCY_PTR '+#13+
        'from data0010 t10 inner Join data0100 t100 on t10.RKEY = t100.CUSTOMER_PTR'+#13+
        'Left Join data0005 t5 On t10.SALES_REP_PTR = t5.RKEY'+#13+
        'where t100.CSI_PTR ='+rkey73+#13+
        'order by t10.CUST_CODE';
    end
    else
      InputVar.Sqlstr:=
        'Select t10.RKEY,t10.CUST_CODE,t10.CUSTOMER_NAME,t10.BILLING_ADDRESS_1, '+#13+
        't5.RKEY as RKEY5,t5.EMPLOYEE_NAME as SALES_REP_NAME,t10.PHONE,t10.GEN_EMAIL_ADDRESS,t10.CURRENCY_PTR '+#13+
        'from data0010 t10 Left Join data0005 t5 '+#13+
        'On t10.SALES_REP_PTR = t5.RKEY '+#13+
        'order by t10.CUST_CODE';
    inputvar.InPut_value:=DBEdit2.Text;
    inputvar.KeyField:='CUST_CODE';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if not(dm.aqMain.State in[dsInsert, dsEdit]) then dm.aqMain.Edit;
      dm.aqMain.FieldByName('CUST_PTR').AsString:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString;
      dm.aqMain.FieldByName('CUSTOMER_NAME').AsString:= frmPick_Item_Single.adsPick.FieldByName('CUSTOMER_NAME').AsString;
      dm.aqMain.FieldByName('Sales_PTR').AsString:= frmPick_Item_Single.adsPick.FieldByName('RKEY5').AsString;
      dm.aqMain.FieldByName('Curr_Ptr').AsString:= frmPick_Item_Single.adsPick.FieldByName('CURRENCY_PTR').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDetail.btnLookTypeClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'Code/报价类型代码/110,Name/报价类型名称/251,'+
                        'Time/标准时间(分钟)/251';
    InputVar.Sqlstr :=
      'Select RKEY,Code,Name,Time FROM Data0241';
    inputvar.InPut_value:=DBEdit4.Text;
    inputvar.KeyField:='Code';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if not(dm.aqMain.State in[dsInsert, dsEdit]) then dm.aqMain.Edit;
      dm.aqMain.FieldByName('Type_PTR').AsString:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDetail.N2Click(Sender: TObject);
var
  DLLHandle: THandle;
  Func: TDown;
begin
  if ((StrToInt(vprev) = 1) or (StrToInt(vprev) = 2)) then
  begin
    ShowMessage('无下载权限!');
    Abort;
  end;
  if not locateRecord(dm.aqDetail.FieldByName('PTR_242').AsString,dm.aqDetail.FieldByName('SeqNO').AsString) then
  begin
    ShowMessage('请先保存后再操作!');
    Abort;
  end
  else
  begin
    if dm.aqDetail.FieldByName('FileName').IsNull then
    begin
      ShowMessage('文件未上传!');
      Abort;
    end;
    if dm.aqMain.FieldByName('FinishTime').IsNull then
    begin
      ShowMessage('未提交不允许下载!');
      Abort;
    end;
    dlgDown.FileName:= dm.aqDetail.FieldByName('FileName').AsString;
    if dlgDown.Execute then
    begin
      DLLHandle := LoadLibrary('myFTP.dll');
      if DLLHandle>0 then
      begin
        try
          @Func:= GetProcAddress(DLLHandle,'Down');
          if Assigned(@Func) then
          begin
            Application.ProcessMessages;
            if Func(PAnsiChar(dm.aqDetail.FieldByName('FileName').AsString),PAnsiChar(dlgDown.FileName)) then
            begin
              if dm.aqMain.FieldByName('Quote_Status').AsInteger<>2 then  //2:报价完成
              begin
                with dm.aqTmp do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text:= 'update data0242 set Quote_Status = 1'               //更新报价状态: 报价中
                            +' where RKEY='+dm.aqDetail.FieldByName('PTR_242').AsString;
                  ExecSQL;
                end;
                if dm.aqDetail.FieldByName('DownloadTime').IsNull then
                with dm.aqTmp do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text:= 'update data0243 set DownloadTime=getdate(),FirstDownloadBy_PTR='+USERRKEY
                            +' where PTR_242='+dm.aqDetail.FieldByName('PTR_242').AsString+' and SeqNO='+dm.aqDetail.FieldByName('SeqNO').AsString;
                  ExecSQL;
                end;
              end;
              //暂不考虑dm.aqDetail刷新
            end;
          end
          else
            Showmessage('在myFTP.dll中未找到Down函数!');
        finally
          FreeLibrary(DLLHandle);
        end;
      end
      else
        Showmessage('未找到myFTP.dll');
    end;
  end;
end;

procedure TfrmDetail.N3Click(Sender: TObject);
begin
  if ((StrToInt(vprev) = 1) or (StrToInt(vprev) = 2)) then
  begin
    ShowMessage('无此权限!');
    Abort;
  end;
  if dm.aqDetail.FieldByName('UploadTime').IsNull then
  begin
    ShowMessage('文件未上传!');
    Abort;
  end;
  if dm.aqDetail.FieldByName('DownloadTime').IsNull then
  begin
    ShowMessage('文件下载后才能询问!');
    Abort;
  end;
  if dm.aqMain.FieldByName('Quote_Status').AsInteger=2 then
  begin
    ShowMessage('已报价完成,不允许询问!');
    Abort;
  end;
  pnlNotes.Visible:= not pnlNotes.Visible;
  lblNotes.Caption:= '询问备注:';
  mmNotes.Text:= dm.aqDetail.FieldByName('AskInfo').AsString;
//  if dm.aqDetail.FieldByName('AskTime').IsNull then
//  with dm.aqDetail do
//  begin
//    if not (State in[dsInsert, dsEdit]) then Edit;
//    FieldByName('AskTime').AsDateTime:= getsystem_date(dm.aqTmp,0);
//    Post;
//  end;
end;

procedure TfrmDetail.N4Click(Sender: TObject);
begin
  if ((StrToInt(vprev) = 1) or (StrToInt(vprev) = 3)) then
  begin
    ShowMessage('无回复权限!');
    Abort;
  end;
  if dm.aqDetail.FieldByName('AskTime').IsNull then
  begin
    ShowMessage('未询问不能回复!');
    Abort;
  end;
  if dm.aqMain.FieldByName('Quote_Status').AsInteger=2 then
  begin
    ShowMessage('已报价完成,不允许回复!');
    Abort;
  end;
  pnlNotes.Visible:= not pnlNotes.Visible;
  lblNotes.Caption:= '回复备注:';
  mmNotes.Text:= dm.aqDetail.FieldByName('AnswerInfo').AsString;
//  if dm.aqDetail.FieldByName('AnswerTime').IsNull then
//  with dm.aqDetail do
//  begin
//    if not (State in[dsInsert, dsEdit]) then Edit;
//    FieldByName('AnswerTime').AsDateTime:= getsystem_date(dm.aqTmp,0);
//    Post;
//  end;
end;

procedure TfrmDetail.PopupMenu1Popup(Sender: TObject);
begin
  if frmMain.YY = 3 then  //检查
  begin
    N1.Visible:= False;
    if dm.aqDetail.RecordCount>0 then
    begin
      N2.Visible:= True;
      N3.Visible:= True;
      N4.Visible:= True;
    end
    else
    begin
      N2.Visible:= False;
      N3.Visible:= False;
      N4.Visible:= False;
    end;
    N5.Visible:= False;
  end
  else
  begin
    if dm.aqMain.FieldByName('status').AsInteger=0 then
    begin
      if not dm.aqDetail.Active then
      begin
        N1.Visible:= False;
        N2.Visible:= False;
        N3.Visible:= False;
        N4.Visible:= False;
        N5.Visible:= False;
      end;
      if ((dm.aqDetail.RecordCount>0) and (not (dm.aqDetail.FieldByName('FileName').IsNull))) then
      begin
        N1.Visible:= True;
        N2.Visible:= True;
        N3.Visible:= True;
        N4.Visible:= True;
        N5.Visible:= True;
      end
      else
      begin
        N1.Visible:= True;
        N2.Visible:= False;
        N3.Visible:= False;
        N4.Visible:= False;
        N5.Visible:= True;
      end;
    end
    else
    begin
      N1.Visible:= False;  //上传
      N2.Visible:= True;   //下载
      N3.Visible:= True;   //询问
      N4.Visible:= True;   //回复
      N5.Visible:= False;  //删除
    end;
  end;
end;

function TfrmDetail.locateRecord(RKEY242, seqNO: string): Boolean;
begin
  with dm.aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= 'select * from data0243 where PTR_242='+RKEY242+' and SeqNO='+seqNO;
//    Showmessage(sql.text);
    Open;
  end;
  if dm.aqTmp.RecordCount=1 then Result:= True
  else
    Result:= False;
end;

procedure TfrmDetail.sbtnSetLinkClick(Sender: TObject);
begin
  pnlSetFTPLink.Visible:= not pnlSetFTPLink.Visible;
  edtIP.Text:= IP;
  edtUID.Text:= UID;
  edtPSW.Text:= PSW;
  edtFileDir.Text:= FileDir;
end;

procedure TfrmDetail.sbtnSaveClick(Sender: TObject);
var
  MyIniFile: TIniFile;
begin
  with TResourceStream.Create(HInstance,'RC1',RT_RCDATA) do
  begin
    try
      SaveToFile('myFTP.dll');
    finally
      Free;
    end;
  end;
  pnlSetFTPLink.Visible:= False;
  try
    MyIniFile:= TIniFile.Create(ExtractFilePath(ParamStr(0))+'FTP_Link.ini');
    try
      MyIniFile.WriteString('FTP服务器','服务器IP',edtIP.Text);
      MyIniFile.WriteString('FTP服务器','用户名',edtUID.Text);
      MyIniFile.WriteString('FTP服务器','密码',Base64_Encode(edtPSW.Text));
      MyIniFile.WriteString('FTP服务器','报价时效文档目录',edtFileDir.Text);
      IP:= edtIP.Text;
      UID:= edtUID.Text;
      PSW:= edtPSW.Text;
      FileDir:= edtFileDir.Text;
    finally
      MyIniFile.Free;
    end;
    ShowMessage('设定参数成功!');
  except
    ShowMessage('设定参数失败!');
  end;
end;

procedure TfrmDetail.sbtnCancelClick(Sender: TObject);
begin
  pnlSetFTPLink.Visible:= False;
end;

procedure TfrmDetail.N5Click(Sender: TObject);
var
  DLLHandle: THandle;
  Func: TDel;
begin
  if not (dm.aqDetail.FieldByName('DownloadTime').IsNull) then
  begin
    ShowMessage('该文件已被下载,不允许删除!');
    Abort;
  end;
  if dm.aqDetail.FieldByName('FileName').AsString = '' then
    dm.aqDetail.Delete
  else
  begin
    DLLHandle := LoadLibrary('myFTP.dll');
    if DLLHandle>0 then
    begin
      try
        @Func:= GetProcAddress(DLLHandle,'Del');
        if Assigned(@Func) then
        begin
          Application.ProcessMessages;
          if Func(PAnsiChar(dm.aqDetail.FieldByName('FileName').AsString)) then
          begin
            dm.aqDetail.Delete;
          end;
        end
        else
          Showmessage('在myFTP.dll中未找到Del函数!');
      finally
        FreeLibrary(DLLHandle);
      end;
    end
    else
      Showmessage('未找到myFTP.dll');
  end;
end;

procedure TfrmDetail.sbtnYESClick(Sender: TObject);
begin
  if lblNotes.Caption='询问备注:' then
  begin
    try
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update Data0242 set Status=0, Quote_Status=3');  //输入中; 询问中
        SQL.Add(' where PaperNO='''+dm.aqMain.FieldByName('PaperNO').AsString+'''');
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('update data0243 set AskInfo='''+mmNotes.Text+'''');
        if dm.aqDetail.FieldByName('AskTime').IsNull then SQL.Add(' ,AskTime=getdate()');
        SQL.Add(' where PTR_242='+dm.aqDetail.FieldByName('PTR_242').AsString+' and SeqNO='+dm.aqDetail.FieldByName('SeqNO').AsString);
        ExecSQL;  
        Close;
        SQL.Clear;
        SQL.Text:= 'INSERT DATA0014(MESSAGE,whosend)'+#13
                  +'values(''报价时效单:'+dm.aqMain.FieldByName('PaperNO').AsString+' 已退回，退回日期:'''+'+convert(varchar,getdate(),120) +'''+#13+mmNotes.text+''','+rkey73+')'+#13
                  +'DECLARE @to int'+#13
                  +'SET @to=@@Identity'+#13
                  +'INSERT DATA0314(emp_ptr,d14_ptr) SELECT t73.RKEY,@to FROM DATA0242 t242 INNER JOIN Data0073 t73 ON t242.CreateBy_PTR=t73.EMPLOYEE_PTR WHERE t242.PaperNO = '''+dm.aqMain.FieldByName('PaperNO').AsString+'''';
        ExecSQL;
      end;
      ShowMessage('询问成功,单据已自动退回并通知创建者!');
    except
      ShowMessage('操作失败');
    end;
  end
  else
  if lblNotes.Caption='回复备注:' then
  begin
    try
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update Data0242 set Quote_Status=4');  //已回复
        SQL.Add(' where PaperNO='''+dm.aqMain.FieldByName('PaperNO').AsString+'''');
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Add('update data0243 set AnswerInfo='''+mmNotes.Text+'''');
        if dm.aqDetail.FieldByName('AnswerTime').IsNull then SQL.Add(' ,AnswerTime=getdate()');
        SQL.Add(' where PTR_242='+dm.aqDetail.FieldByName('PTR_242').AsString+' and SeqNO='+dm.aqDetail.FieldByName('SeqNO').AsString);
        ExecSQL;
      end;
      ShowMessage('回复成功,单据需重新提交!');
    except
      ShowMessage('操作失败');
    end;
//    if not (dm.aqDetail.State in[dsInsert, dsEdit]) then dm.aqDetail.Edit;
//    if dm.aqDetail.FieldByName('AnswerTime').IsNull then
//      dm.aqDetail.FieldByName('AnswerTime').AsDateTime:= getsystem_date(dm.aqTmp,0);
//    dm.aqDetail.FieldByName('AnswerInfo').AsString:=mmNotes.Text;
//    dm.aqDetail.Post;
  end
  else
    ShowMessage('未知操作');
  pnlNotes.Visible:= False;
end;

procedure TfrmDetail.sbtnNOClick(Sender: TObject);
begin
  pnlNotes.Visible:= False;
end;

procedure TfrmDetail.btnLookSalesClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'EMPL_CODE/业务员代码/110,EMPLOYEE_NAME/业务员名称/251';
    InputVar.Sqlstr :=
      'SELECT RKEY,EMPL_CODE,EMPLOYEE_NAME FROM Data0005';
    inputvar.InPut_value:=DBEdit5.Text;
    inputvar.KeyField:='EMPLOYEE_NAME';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if not(dm.aqMain.State in[dsInsert, dsEdit]) then dm.aqMain.Edit;
      dm.aqMain.FieldByName('Sales_Ptr').AsString:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDetail.btnLookCurrClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'CURR_CODE/货币代码/110,CURR_NAME/货币名称/251';
    InputVar.Sqlstr :=
      'SELECT RKEY,CURR_CODE,CURR_NAME FROM Data0001';
    inputvar.InPut_value:=DBEdit8.Text;
    inputvar.KeyField:='CURR_CODE';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if not(dm.aqMain.State in[dsInsert, dsEdit]) then dm.aqMain.Edit;
      dm.aqMain.FieldByName('Curr_Ptr').AsString:= frmPick_Item_Single.adsPick.FieldByName('RKEY').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDetail.DBComboBox1DropDown(Sender: TObject);
begin
  with dm.aq247 do
  begin
    Close;
    Open;
    First;
    DBComboBox1.Items.Clear;
    while not Eof do
    begin
      DBComboBox1.Items.Add(FieldByName('ProdUsageName').AsString);
      Next;
    end;
  end;
end;

procedure TfrmDetail.DBComboBox1Exit(Sender: TObject);
begin
  if DBComboBox1.Items.IndexOf(DBComboBox1.Text)<0 then
  begin
    Showmessage('您输入的内容不在选择列表中,请确认!');
    if DBComboBox1.CanFocus then DBComboBox1.SetFocus;
  end;
end;

procedure TfrmDetail.nN6Click(Sender: TObject);
begin
  if dm.aqMain.FieldByName('Quote_Status').AsInteger <> 4 then
  begin
    ShowMessage('只有在已回复才可以确认');
    Exit;
  end;
  try

    dm.aqMain.Edit;
    dm.aqMain.FieldByName('Quote_Status').AsInteger := 1;
    dm.aqMain.Post;
    with dm.aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select getdate() as nowtime');
      Open;
    end;
    dm.aqDetail.Edit;
    dm.aqDetail.FieldByName('AnswerRecveTime').AsDateTime := dm.aqTmp.fieldbyname('nowtime').AsDateTime;
    dm.aqDetail.FieldByName('AnswerRecvePeople').AsString := user_ptr;
    dm.aqDetail.Post;    
    ShowMessage('操作成功!');
  except
    ShowMessage('操作失败');
  end;
end;

end.
