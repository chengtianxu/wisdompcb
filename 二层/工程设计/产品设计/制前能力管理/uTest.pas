unit uTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,ConstVar, ComCtrls,common,
  Grids, DBGrids, Menus, dbcgrids,DB, DBGridEh,IdFTP, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

type
  TFormTest = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label_submitdet: TLabel;
    Label_submitperson: TLabel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Edit1: TEdit;
    Label71: TLabel;
    Label25: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label67: TLabel;
    Label9: TLabel;
    Edit17: TEdit;
    BitBtn14: TBitBtn;
    Label10: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label8: TLabel;
    dt1: TDateTimePicker;
    Label15: TLabel;
    SpeedButton4: TSpeedButton;
    Label_742deptstr: TLabel;
    Label_741rkey: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    PopupMenu1: TPopupMenu;
    Add: TMenuItem;
    Edit: TMenuItem;
    Delete: TMenuItem;
    Edit6: TEdit;
    Grd2: TDBGridEh;
    PopupMenu3: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Label22: TLabel;
    Memo2: TMemo;
    IdFTP1: TIdFTP;
    Label2: TLabel;
    Label16: TLabel;
    Edit5: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure update_04(v_seed:string);
    procedure SpeedButton4Click(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    list,list1:TStringList;
    FIDKey:string;
    host,password,Username,host1,password1,Username1 : string;
    function GetIDKey:string;
    function Get_05Ptr(ARkey73:string;AType:Integer):string;
    function CheckFtpDir(AFtp:TIdFTP;ADir:string):Boolean;
    procedure CreateDir2(AFtp:TIdFTP;ADir:string);
    { Private declarations }
  public
    rkey25,rkey738: Integer;
    { Public declarations }
  end;

var
  FormTest: TFormTest;
  function Power(x, y : extended) : extended;

implementation

uses part_search, uDM,Pick_Item_Single,DEPT_Edit,DEPT_Add, DEPT_Main,uNew,uFAEdit,PubFunc,ShellAPI;

{$R *.dfm}

procedure TFormTest.BitBtn3Click(Sender: TObject);
begin
 frmcustpart := tfrmcustpart.Create(application);
  with frmcustpart.ADOQuery1 do
  begin
    close;
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'''); //and data0025.customer_ptr='+inttostr(dm.ADOQuery4.FieldValues['customer_ptr'])+' ORDER BY MANU_PART_NUMBER');
    open;
  end;
  frmcustpart.Edit1.Text:=trim(edit4.Text);
 if frmcustpart.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的产品型号!',mtinformation,[mbok],0);
   edit4.SetFocus;
  end
  else
 if frmcustpart.ShowModal=mrok then
  if frmcustpart.ADOQuery1.FieldByName('onhold_sales_flag').AsString='1' then
    messagedlg('此产品型号已暂缓销售!',mtwarning,[mbcancel],0)
  else
   with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select ORIG_CUSTOMER from data0025 where MANU_PART_NUMBER='''+edit4.Text+'''');
      open;
    end;
   edit4.Text := trim(frmcustpart.ADOQuery1.fieldvalues['manu_part_number']);
   label71.Caption:=edit4.Text;
   edit4.Font.Color := clwindowtext;
   Edit17.Text:= dm.ADOQuery1.FieldByName('ORIG_CUSTOMER').AsString;
   Label67.Visible:=True;
   label67.Caption := frmcustpart.ADOQuery1.fieldbyname('manu_part_desc').AsString;
   label25.Caption:=frmcustpart.ADOQuery1.fieldbyname('rkey25').AsString;
   //dm.ADOFaTest.Parameters.ParamByName('MANU_PART_NUMBER').Value:=Edit4.Text;


end;

procedure TFormTest.BitBtn14Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'RKEY/序号/100,CUST_CODE/客户代码/100,CUSTOMER_NAME/客户名称/277,ABBR_NAME/客户简称/100';
    InputVar.Sqlstr := 'select RKEY,CUST_CODE,CUSTOMER_NAME,ABBR_NAME from Data0010 where CUSTOMER_TYPE<>4';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit17.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Label10.Caption := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      Edit17.Font.Color:=clwindowtext;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFormTest.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TFormTest.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TFormTest.SpeedButton1Click(Sender: TObject);
begin
  {
try
 if  Edit4.Text='' then
  begin
    showmessage('请输入本厂编号...');
    Edit4.SetFocus;
    exit;
  end;

   if  Edit9.Text='' then
  begin
    showmessage('请输入数量...');
    Edit4.SetFocus;
    exit;
  end;


 dm.ADOConnection1.BeginTrans;  //开始一个会话期间

  dm.ADO0738.Close;
  dm.ADO0738.Open;
  dm.ADO0738.Append;
  dm.ADO0738AUDITED_ptr.AsString:=user_ptr;
  dm.ADO0738FA_NUM.AsString:=Edit1.Text;
  dm.ADO0738RKEY25.Value:=StrToInt(Label25.caption);
  dm.ADO0738RKEY10.AsString:=Label10.caption;
  dm.ADO0738CreateDate.Value:=dt1.DateTime;
  dm.ADO0738Quality.Value:=strtoInt(Edit9.text);
  //dm.ADO0738BasicTechnology.AsString:=Memo2.text;
  //dm.ADO0738DifficultPoint.AsString:=Memo1.text;
  //dm.ADO0738BEIZHU.AsString:=Memo3.text;
  dm.ADO0738check_type.AsString:=Label_741rkey.Caption;  // 审批流程rkey
  dm.ADO0738circle.Value:=1;
  dm.ADO0738FAStatus.Value:=RadioGroup1.ItemIndex;
  dm.ADO0738.Post;
  ShowMsg('新增操作成功!',1);

  //dm.ADOTMP1.ExecSQL;
  dm.ADOD04.Close;
  dm.ADOD04.Open;
 if dm.ADOD04SEED_FLAG.Value<>1 then
 self.update_04(trim(dm.ADOD04SEED_VALUE.Value));


 dm.ADOConnection1.CommitTrans;
 except
 on e:exception do
 begin
  showmessage(e.Message);
  dm.ADOConnection1.RollbackTrans;
 end;
end;  }
 modalresult:=mrok;

end;

procedure TFormTest.FormShow(Sender: TObject);
begin
  //Label16.Visible:=False;
  //Edit5.Visible:=False;
  //Label17.Visible:=False;
  //RadioButton1.Visible:=False;
 // RadioButton2.Visible:=False;
 // RadioButton3.Visible:=False;
 list := TStringList.Create;   //删除ftp文件名list
 list1 := TStringList.Create;  //删除ftp没保存的文件名list1

 with DM.qryFtp2 do
 begin
 Close;
 Parameters[0].Value:= 0;
 Open;
 end;

 with DM.qryFileList2 do
 begin
 Close;
 Parameters[0].Value:= 0;
 open;
 end;

 with DM.ADOFTP do
 begin
 Close;
 Parameters[0].Value:=dm.ADO0738.fieldbyname('Rkey').Value;
 open;
 end;

Edit5.Text:=IntToStr(dm.ADO0738.FieldValues['Rkey']);  
end;


procedure TFormTest.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.adod04.Edit; //使前缀不变后缀加1
    dm.adod04SEED_VALUE.Value := new_seed;
    dm.adod04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adod04.Edit;
     dm.adod04SEED_VALUE.Value := new_seed;
     dm.adod04.Post;
    end;
end;

function Power(x, y : extended) : extended;
begin
result := exp(y*ln(x));
end;


procedure TFormTest.SpeedButton4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
  frmPick_Item_Single.Width :=800;
  frmPick_Item_Single.Height :=600;
  InputVar.Fields := 'type_code/审批代码/80,name/审批流程名称/100,dept_name/审批流程/650';
  InputVar.Sqlstr :=dm.Queryofbp.SQL.Text;
  InputVar.AdoConn := dm.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar) ;
  if frmPick_Item_Single.ShowModal=mrok then
  begin
      edit6.Text := frmPick_Item_Single.adsPick.FieldValues['name'];
      Label_741rkey.Caption:=frmPick_Item_Single.adsPick.FieldValues['d741_ptr'];
      Label_742deptstr.Caption :=frmPick_Item_Single.adsPick.FieldValues['dept_name'];



  end;
  finally
  frmPick_Item_Single.adsPick.Close;
  frmPick_Item_Single.Free ;
  end;
end;

procedure TFormTest.AddClick(Sender: TObject);
var
  bookmark: TBookMark;
begin
  dm.ADOQuery4.Active:=False;
 { Label16.Visible:=False;
  Edit5.Visible:=False;
  Label17.Visible:=False;
  RadioButton1.Visible:=False;
  RadioButton2.Visible:=False;
  RadioButton3.Visible:=False;
  RadioButton3.Checked:=True;
  Edit5.Text:=IntToStr(dm.ADOQuery4.FieldValues['Rkey']); }
  dm.ADOQuery4.Active:=True;
  //Edit5.Text:=IntToStr(dm.ADOQuery4.FieldValues['Rkey']);
  //dm.ADOQuery4.Active:=False;



  dm.ADOTable1.Close;
  dm.ADOTable1.ReadOnly:=false;
  dm.ADOTable1.Open;
  Form3:=TForm3.Create(Application);
  Bookmark:=dm.AdoTable1.GetBookmark();


 // Form1.Hide;
  dm.AdoTable1.Append;
 // dm.AdoTable1.FieldValues['d738_ptr']:=dm.ADO0738Rkey.Value;
 //dm.AdoTable1.FieldValues['d738_ptr']:=dm.ADOQuery4Rkey.Value;
 dm.AdoTable1.FieldValues['d738_ptr']:=IntToStr(dm.ADO0738.fieldbyname('Rkey').Value);
  dm.AdoTable1.FieldValues['DEPT_CODE']:='';
  dm.AdoTable1.FieldValues['BasicTechnology']:='';
  dm.AdoTable1.FieldValues['DifficultPoint']:='';
  dm.AdoTable1.FieldValues['BEIZHU']:='';
  dm.AdoTable1.FieldValues['varchar_738']:=IntToStr(dm.ADO0738.fieldbyname('Rkey').Value);
  if Form3.ShowModal<>mrok then
  dm.AdoTable1.GotoBookmark(bookmark);
  Form3.Free;
  dm.AdoTable1.FreeBookmark(bookmark);
  dm.ADOTable1.Close;
  dm.ADOTable1.ReadOnly:=true;
  dm.ADOTable1.Open;


end;

procedure TFormTest.DeleteClick(Sender: TObject);
begin
 if dm.QRY1.Active then
 dm.QRY1.Close;
 dm.QRY1.Parameters.ParamValues['DEPT_CODE'] := dm.ADOTable1DEPT_CODE.Value ;
 if MessageDlg('你确定要删除这条记录吗？',mtConfirmation,[mbyes,mbno],0)=mryes then
 dm.QRY1.ExecSQL ;
 dm.ADOTable1.Close;
 dm.ADOTable1.Open;
end;

procedure TFormTest.FormActivate(Sender: TObject);
begin
dm.AdoTable1.Open;
dm.ADOQuery4.Open;

//if not dm.ADO0740.IsEmpty then
//dm.AdoTable1.Filter:='d738_ptr like ''%'+(dm.ADOQuery4.fieldbyname('rkey').value)+'%'''

end;

procedure TFormTest.EditClick(Sender: TObject);
begin
  
 if not dm.AdoTable1.IsEmpty then
  begin

  if dm.ADOQuery2.Active then
    dm.ADOQuery2.Close;
    dm.ADOQuery2.Parameters.ParamValues['DEPT_CODE'] := dm.ADOTable1DEPT_CODE.Value ;
    dm.ADOQuery2.Open;
    dm.ADOQuery2.Edit;
   // FormNew.Hide;
    try
    Form2:=TForm2.Create(Application);
    Form2.DBEdit1.Text:=dm.ADOTable1DEPT_CODE.Value;
    Form2.DBEdit1.Enabled:=False;
    Form2.BitBtn3.Enabled:=False;


   // dm.ADOTable1.ReadOnly:=False;
   // dm.ADOTable1.Edit;


    if Form2.ShowModal=mrok then
    begin
    dm.ADOTable1.Edit;
    dm.ADOTable1.Post;
    ShowMessage('编辑操作成功!');
    end;
    finally
    Form2.Free;

  end;
  end;
end;

procedure TFormTest.N11Click(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LFtp:= TIdFTP.Create(nil);
  try
    LFileName:= DM.ADOFTPFileName.AsString;
    LFtpName:= DM.ADOFTPFtp_fileName.AsString;

//    if not DirectoryExists('D:\ENGFileTmp\') then
//    begin
//      if not CreateDir('D:\ENGFileTmp\') then
//      begin
//        LSaveDlg.FileName:= LFileName;
//        if LSaveDlg.Execute then LFileName:= LSaveDlg.FileName
//        else Exit;
//      end
//      else  LFileName:= 'D:\ENGFileTmp\' + LFileName;
//    end
//    else LFileName:= 'D:\FileTmp\' + LFileName;

    LSaveDlg.FileName:= DM.ADOFTPFileName.AsString;
    if LSaveDlg.Execute then
    begin
      LFileName:= LSaveDlg.FileName;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where rkey = ' + DM.ADOFTPFtp_Ptr.AsString;
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
                        ' FROM dbo.FA0744 INNER JOIN dbo.Tier3_CustomerFiles ON dbo.FA0744.FtpIDKey = dbo.Tier3_CustomerFiles.IDKey '+
                        ' where FA0744.contract_rkey ='+dm.ADO0738RKEY.AsString + ' and FA0744.rkey ='+dm.ADOFTPrkey.AsString;
               
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

procedure TFormTest.N10Click(Sender: TObject);
var
  LFtp: TIdFTP;
  LODialog: TOpenDialog;
  LFilePath,LFtpDir,LRkey:string;
begin
  rkey738 := dm.ADO0738RKEY.Value;
  LODialog:= TOpenDialog.Create(self);
  LFtp:= TIdFTP.Create(nil);
  try

    if LODialog.Execute then
    begin
      LFilePath:= LODialog.FileName;
      FIDKey := GetIDKey;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where FtpID = 3 order by rkey desc';
        open;
        if not IsEmpty then
        begin
          LFtp.Host := Fields[1].AsString;
          LFtp.Username := Fields[2].AsString;
          LFtp.Password := Fields[3].AsString;
          LFtpDir := Trim(Fields[4].AsString) ;
          LRkey:= Fields[0].AsString;
          host1 := LFtp.Host;
          Username1 := LFtp.Username;
          password1 := LFtp.Password;
//          ShowMessage(LFtp.Host);
//          ShowMessage(LFtp.Username);
//          ShowMessage(LFtp.Password);
//          ShowMessage(LFtpDir);
        end
        else
        begin
          ShowMessage('没有找到FTP服务器，请联系管理员');
          exit;
        end;
      end;

//        with LTmp do
//        begin
//          Close;
//          sql.Text:= 'SELECT IDkey from Tier3_CustomerFiles where FileName=' + QuotedStr(LFilePath);
//          Open;
//          if not IsEmpty then
//          begin
//            ShowMessage('已存在同名文件');
//            Exit;
//          end
//        end;
//        else
//        begin

      try
        if not LFtp.Connected then LFtp.Connect(True,10000);
        if LFtp.Connected then
        begin

          if not CheckFtpDir(LFtp,LFtpDir) then Self.CreateDir2(LFtp,LFtpDir);

          LFtp.Put(LFilePath,LFtpDir + FIDKey,True);

          list1.Add(LFtpDir+FIDKey);  //记录上传的ftp文件

          DM.qryFtp2.Append;
          DM.qryFtp2.FieldByName('IDKey').Value:= FIDKey;
          DM.qryFtp2.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
          DM.qryFtp2.FieldByName('Ftp_Ptr').Value:= LRkey;
          DM.qryFtp2.FieldByName('Ftp_FileName').Value:= FIDKey;
          DM.qryFtp2.FieldByName('UPLoadTime').Value:= getsystem_date(DM.ADOQuery1,0);
          DM.qryFtp2.FieldByName('GroupIDKey').Value:= FIDKey;
          DM.qryFtp2.FieldByName('BEnable').Value:= 1;
          DM.qryFtp2.FieldByName('UPloadUser_d05ptr').AsString:= Get_05Ptr(rkey73,0);
          DM.qryFtp2.post;

          DM.qryFileList2.Append;
          DM.qryFileList2.FieldByName('contract_rkey').Value:= dm.ADO0738RKEY.Value;
          DM.qryFileList2.FieldByName('FtpIDKey').Value:= FIDKey;
          dm.qryFileList2.FieldByName('rkey').value:= Dm.qryFileList2.RecordCount+1;
          DM.qryFileList2.Post;


          DM.ADOFTP.Append;
          DM.ADOFTP.FieldByName('rkey').value:= Dm.qryFileList2.RecordCount+1;
          DM.ADOFTP.FieldByName('contract_rkey').Value:= dm.ADO0738RKEY.Value;
          DM.ADOFTP.FieldByName('FtpIDKey').Value:= FIDKey;
          DM.ADOFTP.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
          Dm.ADOFTP.FieldByName('UploadTime').value:= DM.qryFtp2.FieldByName('UPLoadTime').Value;
          Dm.ADOFTP.FieldByName('rkey').value:= Dm.qryFileList2.FieldByName('rkey').value;
          Dm.ADOFTP.FieldByName('IDKey').value:= FIDKey;
          Dm.ADOFTP.FieldByName('Ftp_Ptr').Value:= LRkey;
          Dm.ADOFTP.FieldByName('Ftp_fileName').value:= FIDKey;
          DM.ADOFTP.FieldByName('UploadUser_d05ptr').AsString:=user_ptr;
          DM.ADOFTP.FieldByName('GroupIDKey').AsString:=FIDKey;
          DM.ADOFTP.Post;

          DM.ADOFTP.Close;
          DM.ADOFTP.Open;
        end;
      except
        ShowMessage('FTP链接失败,上传失败');
      end;
//        end;
//      end;
    end;

  finally
    if LFtp.Connected then LFtp.Disconnect;
    LODialog.Free;
    LFtp.Free;
  end;
end;

procedure TFormTest.N12Click(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFtpName:string;
begin
   LFtp:= TIdFTP.Create(nil);
  try
//      LFileName:= DM.ADS601FileName.AsString;
    LFtpName:= DM.ADOFTPFtp_fileName.AsString;
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                 ' from tier3_ftplist where rkey = ' + DM.ADOFTPFtp_Ptr.AsString;
      open;
      if not IsEmpty then
      begin
        LFtp.Host := Fields[1].AsString;
        LFtp.Username := Fields[2].AsString;
        LFtp.Password := Fields[3].AsString;
        LFtpDir := Trim(Fields[4].AsString);
        host := LFtp.Host;
        Username := LFtp.Username;
        password := LFtp.Password;
      end
      else
      begin
        ShowMessage('没有找到FTP服务器，请联系管理员');
        exit;
      end;
    end;

    list.Add(LFtpDir+LFtpName);

//    try
//      if not LFtp.Connected then LFtp.Connect(True,10000);
//      if LFTp.Connected then
//      begin
//        LFTp.Delete(LFtpDir+LFtpName);
//        ShowMessage('删除完成！');
//      end;
//    except
//      ShowMessage('可能服务器上的文件已删除,删除服务器文件失败');
////      Exit;
//    end;

    if DM.qryFileList2.Locate('FtpIDKey',DM.ADOFTPIDKey.Value,[]) then
    begin
      DM.qryFileList2.Delete;

      DM.qryFileList2.First;
      while not DM.qryFileList2.Eof do
      begin
        DM.qryFileList2.Edit;
        DM.qryFileList2.FieldByName('rkey').Value := DM.qryFileList2rkey.value;
        DM.qryFileList2.Post;
        DM.qryFileList2.Next;
      end;
    end;

    if DM.qryFtp2.Locate('IDKey',DM.ADOFTPIDKey.Value,[]) then
      DM.qryFtp2.Delete;

    DM.ADOFTP.Delete;
    DM.ADOFTP.First;
    while not DM.ADOFTP.Eof do
    begin
      DM.ADOFTP.Edit;
      DM.ADOFTP.FieldByName('rkey').Value := DM.ADOFTPrkey.Value;
      DM.ADOFTP.Post;
      DM.ADOFTP.Next;
    end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LFTp.Free;
  end;

end;


function TFormTest.GetIDKey: string;
var
  FGUID:TGUID;
begin
  CreateGUID(FGUID);
  Result:= GUIDToString(FGUID);
end;

function TFormTest.Get_05Ptr(ARkey73: string;
  AType: Integer): string;
begin
 with dm.ADOQuery1 do
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

function TFormTest.CheckFtpDir(AFtp: TIdFTP; ADir: string): Boolean;
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

procedure TFormTest.CreateDir2(AFtp: TIdFTP; ADir: string);
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


procedure TFormTest.PopupMenu3Popup(Sender: TObject);
begin
if  dm.ADOFTP.IsEmpty then
begin
N11.Enabled:=False;
end
else
begin
N11.Enabled:=True;
end;
end;

procedure TFormTest.Edit5Change(Sender: TObject);
begin
 if trim(Edit5.Text)<>'' then
    dm.AdoTable1.Filter:='varchar_738='+Trim(Edit5.Text)
 else
    dm.AdoTable1.Filter:='';
end;

procedure TFormTest.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF (ssalt in shift) and ((KEY=ORD('S')) OR (KEY=ORD('s')))
then showmessage(dm.ADOFTP.CommandText);
end;

end.

