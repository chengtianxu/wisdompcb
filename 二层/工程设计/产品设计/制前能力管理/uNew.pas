unit uNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,ConstVar, ComCtrls,common,
  Grids, DBGrids, Menus, dbcgrids,DB, DBGridEh,IdFTP, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

type
  TFormNew = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label_submitdet: TLabel;
    Label_submitperson: TLabel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    Add: TMenuItem;
    Edit: TMenuItem;
    Delete: TMenuItem;
    PopupMenu2: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    DBText1: TDBText;
    dbtxt: TDBText;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    Label71: TLabel;
    Label25: TLabel;
    Label6: TLabel;
    Label67: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    SpeedButton4: TSpeedButton;
    Label_742deptstr: TLabel;
    Label_741rkey: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Edit17: TEdit;
    BitBtn14: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    dt1: TDateTimePicker;
    Edit6: TEdit;
    Memo2: TMemo;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label1: TLabel;
    Grd2: TDBGridEh;
    IdFTP1: TIdFTP;
    Label2: TLabel;
    Label16: TLabel;
    Edit5: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure update_04(v_seed:string);
    procedure SpeedButton4Click(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    list,list1:TStringList;
    FIDKey:string;
    host,password,Username,host1,password1,Username1 : string;
    function GetIDKey:string;
    function CheckFtpDir(AFtp:TIdFTP;ADir:string):Boolean;
    procedure CreateDir2(AFtp:TIdFTP;ADir:string);
    { Private declarations }
  public
     rkey25,rkey738: Integer;
    { Public declarations }
  end;

var
  FormNew: TFormNew;
  function Power(x, y : extended) : extended;

const
 TmpFileDir = 'c:\tmp\';


implementation
uses part_search, uDM,Pick_Item_Single,DEPT_Edit,DEPT_Add, DEPT_Main,PubFunc,ShellAPI,uMain;

{$R *.dfm}

procedure TFormNew.BitBtn3Click(Sender: TObject);
begin
 frmcustpart := tfrmcustpart.Create(application);
  with frmcustpart.ADOQuery1 do
  begin
    close;
    if  edit4.Text<>'' then
    begin
    frmcustpart.ADOQuery1.Close;
    frmcustpart.ADOQuery1.Open;
    end
    else
    begin
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%''');
    end;
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

  with dm.ADOQuery7 do
  begin
  close;
  Parameters[0].Value:=frmcustpart.ADOQuery1.fieldbyname('rkey25').value;
  open;
  end;

  if  not dm.ADOQuery7.IsEmpty then
  begin
  ShowMessage('存在该本厂编码在提交或者未提交状态');
  Exit;
  end;


   edit4.Text := trim(frmcustpart.ADOQuery1.fieldvalues['manu_part_number']);
   label71.Caption:=edit4.Text;
   edit4.Font.Color := clwindowtext;
   //Edit17.Text:= dm.ADOQuery1.FieldByName('ORIG_CUSTOMER').AsString;
   Edit17.Text:= frmcustpart.ADOQuery1.FieldByName('ABBR_NAME').AsString;
   Label10.Caption := frmcustpart.ADOQuery1.fieldbyname('rkey10').AsString;
   Label67.Visible:=True;
   label67.Caption := frmcustpart.ADOQuery1.fieldbyname('manu_part_desc').AsString;
   label25.Caption:=frmcustpart.ADOQuery1.fieldbyname('rkey25').AsString;

   //dm.ADOFaTest.Parameters.ParamByName('MANU_PART_NUMBER').Value:=Edit4.Text;



   with dm.ADOTMP1 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
  open;
  end;



end;

procedure TFormNew.BitBtn14Click(Sender: TObject);
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
      Edit17.Text := frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME'];
      Label10.Caption := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      Edit17.Font.Color:=clwindowtext;

    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;



procedure TFormNew.SpeedButton2Click(Sender: TObject);
begin
   with dm.ADOTMP2 do
   begin
   close;
   sql.Clear;
   SQL.Text:='delete FA0739 where d738_ptr not in (select Rkey from FA0738)'+ #13+
   ' select 1';
   open;
   end;

   with dm.ADOTMP3 do
   begin
   close;
   sql.Clear;
   SQL.Text:='delete FA0744 where contract_rkey not in (select Rkey from FA0738)'+ #13+
   ' select 1';
   open;
   end;
   close;
end;

procedure TFormNew.SpeedButton1Click(Sender: TObject);
begin
try
 if  Edit4.Text='' then
  begin
    showmessage('请输入本厂编号...');
    Edit4.SetFocus;
    exit;
  end;

  if  Edit6.Text='' then
  begin
    showmessage('请选择审批流程...');
    Edit6.SetFocus;
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
 // dm.ADO0738Quality.Value:=strtoInt(Edit9.text);  //拿掉
  dm.ADO0738check_type.AsString:=Label_741rkey.Caption;  // 审批流程rkey
  dm.ADO0738circle.Value:=1;
  //dm.ADO0738.Value:=DBRadioGroup1.ItemIndex;
 // dm.ADO0738FAStatus.Value:=RadioGroup1.ItemIndex;  //拿掉
  dm.ADO0738BasicTechnology.Value:=Memo2.Text;
  dm.ADO0738.Post;


//////////////////////////////////////////////////////////////////////////////////
  {
  dm.ADO0740.Close;
  dm.ADO0740.Open;
  dm.ADO0740.Append;
  dm.ADO0740RKEY25.Value:=StrToInt(Label25.caption);
  dm.ADO0740RKEY10.AsString:=Label10.caption;
  dm.ADO0740RKEY738.Value:=dm.ADO0738Rkey.Value;
  dm.ADO0740TestDate.Value:=DateTimePicker1.DateTime;
  dm.ADO0740Create_ptr.AsString:=user_ptr;
  dm.ADO0740TStatus.Value:=RadioGroup2.ItemIndex;
  dm.ADO0740finished.Value:=Edit7.text;
  dm.ADO0740suggestion.Value:=Memo1.text;
  dm.ADO0740.Post; }

//////////////////////////////////////////////////////////////////////////////////
 { dm.UPdate740.Close;
  dm.UPdate740.Parameters.ParamByName('d738_ptr').Value:=dm.ADO0738Rkey.Value;
  dm.UPdate740.Parameters.ParamByName('d738_ptr2').Value:=dm.ADO0738Rkey.Value;
  dm.UPdate740.Open;}


///////////////////////////////////////////////////////////////////////////////////

  showmessage('新增操作成功!');

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
end;
 modalresult:=mrok;


end;

procedure TFormNew.PageControl1Change(Sender: TObject);
begin
 dm.ADOQuery4.Active:=False;

 

 if  Edit4.Text='' then
  begin
    TabSheet2.Visible:=False;
    showmessage('请输入本厂编号...');
    PageControl1.activepage:=TabSheet1;

  end;

  if  Edit6.Text='' then
  begin
    TabSheet2.Visible:=False;
    showmessage('请选择审批流程...');
    PageControl1.activepage:=TabSheet1;

  end;


  with dm.ADOTMP1 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
  open;
  end;

  if not dm.ADOTMP1.IsEmpty then
  begin
  Edit5.Text:=IntToStr(dm.ADOTMP1.FieldValues['Rkey']);
  end
  else
  Edit5.Text:=IntToStr(1);
end;

procedure TFormNew.update_04(v_seed: string);
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


procedure TFormNew.SpeedButton4Click(Sender: TObject);
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

procedure TFormNew.AddClick(Sender: TObject);
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
  vtype:=0;

  with dm.ADOTMP2 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
  open;
  end;



  //dm.ADOQuery4.Active:=False;



  //dm.ADOTable1.Close;
  //dm.ADOTable1.ReadOnly:=false;
  //dm.ADOTable1.Open;
  Form3:=TForm3.Create(Application);
  Bookmark:=dm.AdoTable1.GetBookmark();

  with dm.ADOTMP1 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 * from FA0738 ';
  open;
  end;

 // Form1.Hide;
 ///////////////////////////////////////////////////////////
   with dm.ADOTMP3 do
   begin
   close;
   sql.Clear;
   SQL.Text:='alter table FA0739  NOCHECK constraint all'+ #13+
   ' select 1';
   open;
   end;


 ////////////////////////////////////////////////////////// 关闭外键约束


  dm.AdoTable1.Append;
 // dm.AdoTable1.FieldValues['d738_ptr']:=dm.ADO0738Rkey.Value;
 if not  dm.ADOTMP1.IsEmpty then
 begin
 dm.AdoTable1.FieldValues['d738_ptr']:=dm.ADOTMP2.FieldValues['Rkey'];
 end
 else
 dm.AdoTable1.FieldValues['d738_ptr']:=1;
 dm.AdoTable1.FieldValues['DEPT_CODE']:='';
 dm.AdoTable1.FieldValues['DifficultPoint']:='';
 dm.AdoTable1.FieldValues['BEIZHU']:='';
 if not  dm.ADOTMP1.IsEmpty then
 begin
 dm.AdoTable1.FieldValues['varchar_738']:=IntToStr(dm.ADOTMP2.FieldValues['Rkey']);
 end
 else
  dm.AdoTable1.FieldValues['varchar_738']:=IntToStr(1);
 if Form3.ShowModal<>mrok then
  dm.AdoTable1.GotoBookmark(bookmark);
  Form3.Free;
  dm.AdoTable1.FreeBookmark(bookmark);
  dm.ADOTable1.Close;
  //dm.ADOTable1.ReadOnly:=true;
  dm.ADOTable1.Open;

 /////////////////////////////////////////////////////
 with dm.ADOTMP3 do
   begin
   close;
   sql.Clear;
   SQL.Text:='alter table FA0739  CHECK constraint all'+ #13+
   ' select 1';
   open;
   end;
 //////////////////////////////////////////////////////// 打开外检约束


end;

procedure TFormNew.EditClick(Sender: TObject);
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

   {with dm.ADOTMP1 do
   begin
   close;
   sql.Clear;
   SQL.Text:='select top 1 Rkey=Rkey+1 from FA0738 order by Rkey desc';
   open;
   end;

    with dm.ADOTMP3 do
    begin
    Close;
    SQL.Clear;
    SQL.Text:='select * from fa0739 where d738_ptr='+inttostr(dm.ADOTMP1.fieldbyname('Rkey').value)+
             ' and DEPT_CODE='+quotedstr(DBEdit1.Text);
    Open;
    end;  }
    Form2.DBMemo2.Text:=dm.ADOTable1.fieldbyname('DifficultPoint').Value;
    Form2.DBMemo3.Text:=dm.ADOTable1.fieldbyname('BEIZHU').Value;

    Form2.DBEdit1.Enabled:=False;
    Form2.BitBtn3.Enabled:=False;
    vtype:=0;
   // dm.ADOTable1.Close;
    dm.ADOTable1.ReadOnly:=false;
    //dm.ADOTable1.Open;
    dm.ADOTable1.Edit;





    if Form2.ShowModal<>mrok then
    begin
    with dm.ADOUPdate749 do
    begin
    Close;
    Parameters[0].Value:=Form2.DBMemo2.Text;
    Parameters[1].Value:=Form2.DBMemo3.Text;
    Parameters[2].Value:=quotedstr(Form2.DBEdit1.Text);
    Parameters[3].Value:=dm.ADO0738.fieldbyname('Rkey').value;
    Open;
    end;

    ShowMessage('编辑操作成功!');
    end;
    finally
    Form2.Free;

  end;
  end;
end;

procedure TFormNew.DeleteClick(Sender: TObject);
begin
 if dm.QRY1.Active then
 dm.QRY1.Close;
 dm.QRY1.Parameters.ParamValues['DEPT_CODE'] := dm.ADOTable1DEPT_CODE.Value ;
 if MessageDlg('你确定要删除这条记录吗？',mtConfirmation,[mbyes,mbno],0)=mryes then
 dm.QRY1.ExecSQL ;
 dm.ADOTable1.Close;
 dm.ADOTable1.Open;
end;

procedure TFormNew.FormActivate(Sender: TObject);
begin
dm.AdoTable1.Open;
dm.ADOQuery4.Open;


//if not dm.ADO0740.IsEmpty then
//dm.AdoTable1.Filter:='d738_ptr like ''%'+(dm.ADOQuery4.fieldbyname('rkey').value)+'%'''

end;

procedure TFormNew.N10Click(Sender: TObject);
var
  LFtp: TIdFTP;
  LODialog: TOpenDialog;
  LFilePath,LFtpDir,LRkey:string;
begin
  rkey738 := dm.ADO0738RKEY.Value;
  LODialog:= TOpenDialog.Create(self);
  LFtp:= TIdFTP.Create(nil);
  try

    //dm.ADOConnection1.Open;
    
    if LODialog.Execute then
    begin
      LFilePath:= LODialog.FileName;
      FIDKey := GetIDKey;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where FtpID =7 order by rkey desc';
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
        end
        else
        begin
          ShowMessage('没有找到FTP服务器，请联系管理员');
          exit;
        end;
      end;



      try
      
        if not LFtp.Connected then LFtp.Connect(True,10000);
        //ShowMessage('123');
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
         // DM.qryFtp2.FieldByName('UPloadUser_d05ptr').AsString:= Get_05Ptr(rkey73,0);
          DM.qryFtp2.FieldByName('UPloadUser_d05ptr').AsString:=user_ptr;

          DM.qryFtp2.post;

          {DM.qryFileList2.Append;
          DM.qryFileList2.FieldByName('contract_rkey').Value:= dm.ADO0738RKEY.Value;
          DM.qryFileList2.FieldByName('FtpIDKey').Value:= FIDKey;
          dm.qryFileList2.FieldByName('rkey').value:= Dm.qryFileList2.RecordCount+1;
          DM.qryFileList2.Post;   }



          with dm.ADOTMP1 do
          begin
          close;
          sql.Clear;
          SQL.Text:='select top 1 rkey from FA0738 order by rkey desc ';
          open;
          end;

          with dm.ADOTMP2 do
          begin
          close;
          sql.Clear;
          SQL.Text:='alter table FA0744  NOCHECK constraint all'+ #13+
                   ' select 1';
          open;
          end;

          DM.ADOFTP.Append;
          if not dm.ADOTMP1.IsEmpty then
          begin
          DM.ADOFTP.FieldByName('contract_rkey').Value:=dm.ADOTMP1.FieldByName('rkey').Value+1;
          end
          else
          begin
          DM.ADOFTP.FieldByName('contract_rkey').Value:=1;
          end;
          DM.ADOFTP.FieldByName('FtpIDKey').Value:= FIDKey;
          DM.ADOFTP.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
          Dm.ADOFTP.FieldByName('UploadTime').value:= DM.qryFtp2.FieldByName('UPLoadTime').Value;
         // Dm.ADOFTP.FieldByName('rkey').value:= Dm.qryFileList2.FieldByName('rkey').value;
          Dm.ADOFTP.FieldByName('IDKey').value:= FIDKey;
          Dm.ADOFTP.FieldByName('Ftp_Ptr').Value:= LRkey;
          Dm.ADOFTP.FieldByName('Ftp_fileName').value:= FIDKey;
          DM.ADOFTP.FieldByName('UploadUser_d05ptr').AsString:=user_ptr;
          DM.ADOFTP.FieldByName('GroupIDKey').AsString:=FIDKey;
          DM.ADOFTP.Post;
          DM.ADOFTP.Close;
          DM.ADOFTP.Open;


          with dm.ADOTMP2 do
          begin
          close;
          sql.Clear;
          SQL.Text:='alter table  FA0744 CHECK constraint all'+ #13+
                   ' select 1';
          open;
          end;

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

procedure TFormNew.N11Click(Sender: TObject);
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

      if not dm.ADO0738.IsEmpty then
      begin
          with DM.ADOQuery1 do
          begin
            Close;
            SQL.Text := ' SELECT Tier3_CustomerFiles.FileName, Tier3_CustomerFiles.Ftp_fileName, Tier3_CustomerFiles.IDKey '+
                        ' FROM dbo.FA0744 INNER JOIN dbo.Tier3_CustomerFiles ON dbo.FA0744.FtpIDKey = dbo.Tier3_CustomerFiles.IDKey '+
                        ' where FA0744.contract_rkey ='+dm.ADO0738RKEY.AsString + ' and FA0744.rkey ='+dm.ADOFTPrkey.AsString;

            Open;
          end;
      end
      else
      begin
           with DM.ADOQuery1 do
          begin
            Close;
            SQL.Text := ' SELECT Tier3_CustomerFiles.FileName, Tier3_CustomerFiles.Ftp_fileName, Tier3_CustomerFiles.IDKey '+
                        ' FROM dbo.FA0744 INNER JOIN dbo.Tier3_CustomerFiles ON dbo.FA0744.FtpIDKey = dbo.Tier3_CustomerFiles.IDKey '+
                        ' where FA0744.contract_rkey =1' + ' and FA0744.rkey ='+dm.ADOFTPrkey.AsString;

            Open;
          end;
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

procedure TFormNew.N12Click(Sender: TObject);
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


    with dm.ADOTMP1 do
    begin
    close;
    sql.Clear;
    SQL.Text:='select top 1 rkey from FA0738 order by rkey desc ';
    open;
    end;


   ///////////////////////////////////////////////////////

    if not dm.ADOTMP1.IsEmpty then
    begin
        with dm.ADODelFpt do
        begin
        Close;
        Parameters[0].Value:=dm.ADOTMP1.fieldbyname('Rkey').Value+1;
        Parameters[1].Value:=dm.ADOFTP.fieldbyname('rkey').Value;
        Parameters[2].Value:=dm.ADOTMP1.fieldbyname('Rkey').Value+1;
        Parameters[3].Value:=dm.ADOFTP.fieldbyname('rkey').Value;
        Open;
        end;

        with DM.ADOFTP do
        begin
        Close;
        Parameters[0].Value:=dm.ADOTMP1.fieldbyname('Rkey').Value+1;
        open;
        end;
    end
    else
    begin
        with dm.ADODelFpt do
        begin
        Close;
        Parameters[0].Value:='1';
        Parameters[1].Value:=dm.ADOFTP.fieldbyname('rkey').Value;
        Parameters[2].Value:='1';
        Parameters[3].Value:=dm.ADOFTP.fieldbyname('rkey').Value;
        Open;
        end;

        with DM.ADOFTP do
        begin
        Close;
        Parameters[0].Value:=1;
        open;
        end;
    end;




   ///////////////////////////////////////////////////////
   // DM.ADOFTP.Delete;


   { while not DM.ADOFTP.Eof do
    begin
      DM.ADOFTP.Edit;
      DM.ADOFTP.FieldByName('rkey').Value := DM.ADOFTPrkey.Value;
      DM.ADOFTP.Post;
      DM.ADOFTP.Next;
    end;  }
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LFTp.Free;
  end;

end;

procedure TFormNew.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF (ssalt in shift) and ((KEY=ORD('S')) OR (KEY=ORD('s')))
then showmessage(dm.ADO0743.SQL.Text);
end;

function TFormNew.GetIDKey: string;
var
  FGUID:TGUID;
begin
  CreateGUID(FGUID);
  Result:= GUIDToString(FGUID);
end;


function TFormNew.CheckFtpDir(AFtp: TIdFTP; ADir: string): Boolean;
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


procedure TFormNew.CreateDir2(AFtp: TIdFTP; ADir: string);
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

procedure TFormNew.PopupMenu2Popup(Sender: TObject);
begin
if  dm.ADOFTP.IsEmpty  then
begin
N11.Enabled:=false;
N12.Enabled:=false;
end
else
begin
N12.Enabled:=True;
N11.Enabled:=True;
end;


end;


procedure TFormNew.FormShow(Sender: TObject);
var rkey_738:Integer;
begin
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


 with DM.ADOTMP1 do
 begin
 Close;
 SQL.Clear;
 SQL.Text:='select top 1 rkey from FA0738 order by rkey desc ' ;
 open;
 end;

if not dm.ADO0738.IsEmpty then
begin
rkey_738:=DM.ADOTMP1.fieldbyname('Rkey').Value;
rkey_738:=rkey_738+1;
end
else
rkey_738:=1;

 with DM.ADOFTP do
 begin
 Close;
 Parameters[0].Value:=rkey_738;
 open;
 end;


   with dm.ADOTMP3 do
  begin
  close;
  sql.Clear;
  SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
  open;
  end;

  if not dm.ADOTMP3.IsEmpty then
  begin
  Edit5.Text:=IntToStr(dm.ADOTMP3.FieldValues['Rkey']);
  end
  else
  Edit5.Text:=IntToStr(1);

end;

procedure TFormNew.PopupMenu1Popup(Sender: TObject);
begin
if DBEdit1.Text<>'' then
begin
Edit.Enabled:=True;
Delete.Enabled:=True;
end;
end;

procedure TFormNew.Edit5Change(Sender: TObject);
begin
 if trim(Edit5.Text)<>'' then
    dm.AdoTable1.Filter:='varchar_738='+Trim(Edit5.Text)
 else
    dm.AdoTable1.Filter:='';
end;

procedure TFormNew.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF (ssalt in shift) and ((KEY=ORD('S')) OR (KEY=ORD('s')))
then showmessage(dm.ADOFTP.CommandText);
end;

procedure TFormNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   with dm.ADOTMP2 do
   begin
   close;
   sql.Clear;
   SQL.Text:='delete FA0739 where d738_ptr not in (select Rkey from FA0738)'+ #13+
   ' select 1';
   open;
   end;

   with dm.ADOTMP3 do
   begin
   close;
   sql.Clear;
   SQL.Text:='delete FA0744 where contract_rkey not in (select Rkey from FA0738)'+ #13+
   ' select 1';
   open;
   end;
end;

end.

