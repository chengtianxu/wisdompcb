unit Uadd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGridEh, IdBaseComponent,
  IdComponent, IdTCPConnection,IdTCPClient,ComObj,IdFTP, Math, Menus, ComCtrls;//IdTCPClient;
type
  TForm_add = class(TForm)
    Splitter1: TSplitter;
    Panel4: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    CheckBox1: TCheckBox;
    Edit6: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Memo2: TMemo;
    GroupBox3: TGroupBox;
    DBGridEh1: TDBGridEh;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    IdFTP1: TIdFTP;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    OpenDialog1: TOpenDialog;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    N8: TMenuItem;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Timer1: TTimer;
    Edit4: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    CheckBox2: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    StringGrid2: TStringGrid;
    StringGrid1: TStringGrid;
    BtActNote: TButton;
    Panel1: TPanel;
    Panel5: TPanel;
    Label14: TLabel;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    popht: TPopupMenu;
    N9: TMenuItem;
    N11: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure StringGrid2GetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure StringGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtActNoteClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
     ssql,host,password,Username,host1,password1,Username1,FIDKey:string;
    list,list1:TStringList;
    Rsave : Integer;
    y, i :Boolean ;
      procedure insert_data099(rkey:integer;quantity_:string);
      function SbctoDbc(s:string):string;
     function Update_Seed(table_name : string): boolean;overload; //更新自动增长的字符
     function invo_number_error(number: string): boolean;
     procedure ExcelToDB_1;
     function Get_05Ptr(ARkey73:string;AType:Integer):string;
     procedure CreateDir2(AFtp:TIdFTP;ADir:string);
     function CheckFtpDir(AFtp:TIdFTP;ADir:string):Boolean;
     function GetIDKey:string;
     procedure upseino;
    { Private declarations }
  public
    status ,rkey25,rkey600:Integer;
    { Public declarations }
  end;

var
  Form_add: TForm_add;
const
  TmpFileDir = 'c:\tmp\';


implementation

uses Udemo,common,Pick_Item_Single,ConstVar, Unusual, Uaddmx,ShellAPI,
  Umoney_ft;

{$R *.dfm}

procedure TForm_add.FormShow(Sender: TObject);
begin
 stringgrid2.Cells[0,0] := '确认日期';
 stringgrid2.Cells[1,0] := '制造厂别';
 stringgrid2.Cells[2,0] := '料号';
 stringgrid2.Cells[3,0] := '厂内周期';
 stringgrid2.Cells[4,0] := '形态';
 stringgrid2.Cells[5,0] := '描述';
 stringgrid2.Cells[6,0] := '单位';
 stringgrid2.Cells[7,0] := '数量';
 stringgrid2.Cells[8,0] := '预估单价';
 stringgrid2.Cells[9,0] := '客服担当';
 stringgrid2.Cells[10,0] := '生产月份';
 stringgrid1.Cells[0,0] := '确认日期';
 stringgrid1.Cells[1,0] := '制造厂别';
 stringgrid1.Cells[2,0] := '料号';
 stringgrid1.Cells[3,0] := '厂内周期';
 stringgrid1.Cells[4,0] := '形态';
 stringgrid1.Cells[5,0] := '描述';
 stringgrid1.Cells[6,0] := '单位';
 stringgrid1.Cells[7,0] := '数量';
 stringgrid1.Cells[8,0] := '预估单价';
 stringgrid1.Cells[9,0] := '客服担当';
 stringgrid1.Cells[10,0] := '生产月份';
 y:=True;
 i:=True;
 list := TStringList.Create;   //删除ftp文件名list
 list1 := TStringList.Create;  //删除ftp没保存的文件名list1
 Rsave := 0; //记录是否点击保存
 //-------------------------------------取货币------------

// if status = 1 then      //新建
//  begin
   dm.ADOQuery1.Close;
   dm.ADOQuery1.SQL.Text:='select * from data0001';
   dm.ADOQuery1.Open;
   ComboBox1.Items.Clear;
   if not DM.ADOQuery1.IsEmpty then
   begin
    while not dm.ADOQuery1.Eof do
    begin
     ComboBox1.Items.AddObject(dm.ADOQuery1.fieldBYName('CURR_NAME').AsString,Pointer(dm.ADOQuery1.fieldBYName     ('rkey').AsInteger));
     dm.ADOQuery1.Next;
    end;
   end;
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.ADOQuery1.fieldBYName('rkey').AsString);
  ComboBox1.ItemIndex:=0;

 if status = 1 then      //新建
  begin
  //------------------------------------取索赔码---------------------------------------------------

   DM.ADOQuery1.Close;
   DM.ADOQuery1.SQL.Clear;
   DM.ADOQuery1.SQL.Text:='select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG '+
                     'from Data0004 where table_name = ''data0597''';
   DM.ADOQuery1.Open;

   if DM.ADOQuery1.FieldByName('SEED_FLAG').AsInteger <> 1 then
      Edit1.Text := DM.ADOQuery1.FieldByName('SEED_VALUE').AsString;
   if DM.ADOQuery1.FieldByName('SEED_FLAG').AsInteger = 4 then
      Edit1.ReadOnly := True;
 // ------------- 新增编辑-----------------------------------------------

  self.Caption:='品质索赔-新建';
   with DM.qryFileList2 do
   begin
    Close;
    Parameters[0].Value:= 0;
    open;
   end;
   with DM.qryFtp2 do
   begin
    Close;
    Parameters[0].Value:= 0;
    Open;
   end;
   with DM.ADS598 do
   begin
    Close;
    Parameters[0].Value:= 0;
    Open;
   end;
   with DM.ado618pres do
   begin
    Close;
    DM.ADO618pres.Parameters[0].Value:=null;
    Open;
   end;
  end
 else
 begin
  if status <> 1 then
   begin
    self.Caption:='品质索赔-编辑';
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text:='select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG '+
                       'from Data0004 where table_name = ''data0597''';
    DM.ADOQuery1.Open;
    if DM.ADOQuery1.FieldByName('SEED_FLAG').AsInteger = 4 then
    Edit1.ReadOnly := True;


//   DM.edit597rkey01.Value;
//   DM.edit597rkey10.Value;
    Label11.Caption:=Label11.Caption+dm.edit597Number.AsString;
//   Label12.Caption:=Label12.Caption+dm.edit597spmoney.AsString;

    Edit4.Text:=DM.ADO597spmoney.asstring;
    edit1.text:=DM.edit597spNumber.Value;
    edit2.text:=DM.edit597CUST_CODE.AsString ;
    edit2.Tag:= DM.edit597rkey10.Value;
    Label8.Caption:=DM.edit597name10.Value;

    edit3.text:=DM.edit597EMPL_CODE.Value;
    Edit3.Tag:= DM.edit597Salesman.Value;
    label10.Caption :=DM.edit597yw05.Value;

    edit5.text:=DM.edit597WAREHOUSE_CODE.value;
    Edit5.Tag:= DM.edit597rkey15.Value;
    label13.Caption :=DM.edit597name15.value;
    
    edit6.text:=DM.edit597v_ttype.AsString;
    ComboBox1.Text:=DM.edit597CURR_NAME.Value;
    ComboBox1.Tag:=DM.edit597rkey01.Value;
    Memo1.text:=DM.edit597ywexplain.Value;
    Memo2.text:=DM.edit597Remarks.Value;
    if DM.edit597Debit.Value=True then Form_add.CheckBox1.Checked else Form_add.CheckBox1.Checked:=False;
    if DM.edit597tax.Value=True then Form_add.CheckBox2.Checked else Form_add.CheckBox2.Checked:=False;


    DM.edit609.Close;
    DM.edit609.Parameters[0].Value:=DM.ADO597rkey.Value;
    DM.edit609.open;

    with DM.ado618pres do
    begin
     Close;
     DM.ADO618pres.Parameters[0].Value:=DM.ADO597rkey.Value;
     Open;
    end;

    with DM.edit609 do
    begin
     DM.edit609.First;
     while not Eof do
     begin
       //StringGrid1.Cells[0,StringGrid1.RowCount-1]
      StringGrid2.Cells[0,StringGrid2.RowCount-1]:=FieldByName('condate').Value;
      StringGrid2.Cells[1,StringGrid2.RowCount-1]:=FieldByName('remark').Value;
      StringGrid2.Cells[2,StringGrid2.RowCount-1]:=FieldByName('Number25').Value;
      StringGrid2.Cells[3,StringGrid2.RowCount-1]:=FieldByName('rec_no').value;
      StringGrid2.Cells[4,StringGrid2.RowCount-1]:=FieldByName('xingtai').Value;
      StringGrid2.Cells[5,StringGrid2.RowCount-1]:=FieldByName('explain').Value;
      StringGrid2.Cells[6,StringGrid2.RowCount-1]:=FieldByName('company').Value;
      StringGrid2.Cells[7,StringGrid2.RowCount-1]:=FieldByName('Number').Value;
      StringGrid2.Cells[8,StringGrid2.RowCount-1]:=FieldByName('spUnitPrice').AsString;
      StringGrid2.Cells[9,StringGrid2.RowCount-1]:=FieldByName('spliable').Value;
      StringGrid2.Cells[10,StringGrid2.RowCount-1]:=FieldByName('spmonth').Value;
      StringGrid2.RowCount:=StringGrid2.RowCount+1;
      Next;
     end;
    end;
   end;
  if status = 3 then
  begin
   self.Caption:='品质索赔-检查';
   SpeedButton1.Enabled := False;
   BitBtn5.Enabled := False;
   N1.Enabled := False;
   N2.Enabled := False;
   N3.Enabled := False;
   N4.Enabled := False;
   N5.Enabled := False;
   N6.Enabled := False;
   N7.Enabled := False;
   Panel2.enabled := False;
  end;

  with DM.qryFileList2 do
  begin
   Close;
   Parameters[0].Value:= DM.ADo597Rkey.Value;
   open;
  end;
  with DM.qryFtp2 do
  begin
   Close;
   Parameters[0].Value:= DM.qryFileList2.FieldByName('FtpIDKey').AsString;
   Open;
  end;

  with DM.ADS598 do
  begin
   Close;
   Parameters[0].Value:= DM.ADo597rkey.Value;
   Open;
  end;
 end;
end;

procedure TForm_add.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'ABBR_NAME/客户简称/200,CUST_CODE/客户代码/200';
  InputVar.Sqlstr := 'SELECT     RKEY, ABBR_NAME, CUST_CODE FROM  dbo.Data0010';
  inputvar.KeyField := 'RKEY';
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.adsPick.IsEmpty then
  begin
   application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+mb_iconstop+mb_systemmodal);
   edit2.SetFocus;
   exit;
  end;
  if frmPick_Item_Single.ShowModal = mrok then
  begin
   Edit2.Text := trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
   label8.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
   Edit2.tag:= frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
  end ;
 finally
  frmPick_Item_Single.Free ;
 end;
end;

procedure TForm_add.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'EMPL_CODE/工号/150,EMPLOYEE_NAME/姓名/150,DEPT_NAME/部门/150';
  InputVar.Sqlstr := 'SELECT dbo.Data0005.EMPL_CODE, dbo.Data0005.rkey,dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME '+
                     'FROM dbo.Data0005 INNER JOIN dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID = dbo.Data0034.RKEY';
  inputvar.KeyField := 'RKEY';
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.adsPick.IsEmpty then
  begin
   application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+mb_iconstop+mb_systemmodal);
   edit3.SetFocus;
   exit;
  end;
  if frmPick_Item_Single.ShowModal = mrok then
  begin
   Edit3.Text := trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
   label10.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
   Edit3.tag:= frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
  end ;
 finally
  frmPick_Item_Single.Free ;
 end;
end;

procedure TForm_add.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1'..'9',#8]) then key := #0 ;
end;

procedure TForm_add.BitBtn1Click(Sender: TObject);
begin
 Application.CreateForm(TFrm_Unusual,Frm_Unusual);
 Frm_Unusual.BitBtn1.Visible:=False;
 Frm_Unusual.BitBtn2.Visible:=False;
 Frm_Unusual.usest:=True;
 Frm_Unusual.BitBtn3.Visible:=True;
 if Frm_Unusual.ShowModal=mrok then
 edit6.text:=dm.ado607.FieldValues['v_ttype'];
end;
procedure TForm_add.SpeedButton2Click(Sender: TObject);
begin
 Close;
end;

function TForm_add.GetIDKey: string;
var
  FGUID:TGUID;
begin
 CreateGUID(FGUID);
 Result:= GUIDToString(FGUID);
end;

procedure TForm_add.N4Click(Sender: TObject);
var
  LFtp: TIdFTP;
  LODialog: TOpenDialog;
  LFilePath,LFtpDir,LRkey:string;
begin
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
                   ' from tier3_ftplist where FtpID = 4 order by rkey desc';

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
     DM.qryFileList2.FieldByName('FtpIDKey').Value:= FIDKey;
     dm.qryFileList2.FieldByName('rec_no').value:= dm.qryFileList2.RecordCount+1;
     DM.qryFileList2.Post;
     DM.ads598.Append;
     DM.ads598.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
     dm.ads598.FieldByName('UploadTime').value:= DM.qryFtp2.FieldByName('UPLoadTime').Value;
     dm.ads598.FieldByName('rec_no').value:= dm.qryFileList2.FieldByName('rec_no').value;
     dm.ads598.FieldByName('IDKey').value:= FIDKey;
     dm.ads598.FieldByName('Ftp_Ptr').Value:= LRkey;
     dm.ads598.FieldByName('Ftp_fileName').value:= FIDKey;
     DM.ads598.FieldByName('EMPLOYEE_NAME').AsString:= Get_05Ptr(rkey73,1);
     DM.ads598.Post;
   end;
    except
        ShowMessage('FTP链接失败,上传失败');
  end;
 end;
finally
 if LFtp.Connected then LFtp.Disconnect;
 LODialog.Free;
 LFtp.Free;
end;
end;

function TForm_add.CheckFtpDir(AFtp: TIdFTP; ADir: string): Boolean;
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

procedure TForm_add.CreateDir2(AFtp: TIdFTP; ADir: string);
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

function TForm_add.Get_05Ptr(ARkey73: string; AType: Integer): string;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select data0073.EMPLOYEE_PTR,data0005.EMPLOYEE_NAME from data0073 '+#13+
            '    inner join data0005 on data0073.employee_ptr = data0005.rkey  '+#13+
             'where data0073.rkey='+ ARkey73;
  open;
  if not isempty then
  if AType = 0 then
    result:=fieldbyname('EMPLOYEE_PTR').AsString
  else
    result:=fieldbyname('EMPLOYEE_NAME').AsString;
 end;
end;

procedure TForm_add.PopupMenu2Popup(Sender: TObject);
 var statusa :Integer;
begin
 N4.Enabled :=  (StrToInt(vprev) in[2,4]) and(status<>3) ;
 N5.Enabled := (status<>1)and (not (DM.ADS598.IsEmpty));
 N6.Enabled:=  (StrToInt(vprev) in[2,4]) and (not (DM.ADS598.IsEmpty))and(status<>3);
end;

procedure TForm_add.N5Click(Sender: TObject);
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

procedure TForm_add.N6Click(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFtpName:string;
begin
  LFtp:= TIdFTP.Create(nil);
  try
    LFtpName:= DM.ADS598Ftp_fileName.AsString;
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

    if DM.qryFileList2.Locate('FtpIDKey',DM.ADS598IDKey.Value,[]) then
    begin
      DM.qryFileList2.Delete;

      DM.qryFileList2.First;
      while not DM.qryFileList2.Eof do
      begin
        DM.qryFileList2.Edit;
        DM.qryFileList2.FieldByName('rec_no').Value := DM.qryFileList2.RecNo;
        DM.qryFileList2.Post;
        DM.qryFileList2.Next;
      end;
    end;

    if DM.qryFtp2.Locate('IDKey',DM.ADS598IDKey.Value,[]) then
      DM.qryFtp2.Delete;

    DM.ADS598.Delete;
    DM.ADS598.First;
    while not DM.ADS598.Eof do
    begin
      DM.ADS598.Edit;
      DM.ADS598.FieldByName('rec_no').Value := DM.ADS598.RecNo;
      DM.ADS598.Post;
      DM.ADS598.Next;
    end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LFTp.Free;
  end;
end;

procedure TForm_add.N1Click(Sender: TObject);
begin
 Form_addmx:= TForm_addmx.Create(Application);
 if Form_addmx.ShowModal=mrok then
 begin
  
 end;
end;

procedure TForm_add.N7Click(Sender: TObject);
var
 col,row,i: integer;
 MsExcel,WBook,WSheet:OleVariant;
begin

 if (strtoint(vprev)=1) or (strtoint(vprev)=2) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  abort;
 end;
for i:=1 to stringgrid2.RowCount-1 do
begin
 stringgrid2.Rows[i].Clear;
end;
 ExcelToDB_1;
 stringgrid2.Refresh;
 BitBtn6click(sender) ;



end;

procedure TForm_add.ExcelToDB_1;
var
  fileName:String;
  iCount,limit: Integer;
  //tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;
  try
   XLApp.workBooks.Open(fileName);
   Sheet := XLApp.Workbooks[1].WorkSheets[1];
   Panel1.Visible:=True;

   for iCount:=1 to 50000 do
   begin
    Application.ProcessMessages;
    //sleep(20);
     if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
     and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
     begin
      stringgrid2.Cells[0,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
      stringgrid2.Cells[1,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]);
      stringgrid2.Cells[2,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,3]);
      stringgrid2.Cells[3,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);
      stringgrid2.Cells[4,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,5]);
      stringgrid2.Cells[5,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,6]);
      stringgrid2.Cells[6,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,7]);
      stringgrid2.Cells[7,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,8]);
      stringgrid2.Cells[8,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,9]);
      stringgrid2.Cells[9,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,10]);
      stringgrid2.Cells[10,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,11]);
      //stringgrid2.Cells[8,iCount-1] := inttostr(iCount-1);
      stringgrid2.RowCount := iCount+1;
      Label14.Caption:='条数:'+IntToStr(iCount-1);
      Application.ProcessMessages;
     //sleep(10);
     end
     else begin
           Inc(limit);
           if limit >= 6 then
           Break;
     end;
   end;


   Timer1.Enabled:=True;
   XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid2.Refresh;
   stringgrid2.FixedRows := 1;
end;

procedure TForm_add.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in []) then key := #0 ;
end;

procedure TForm_add.SpeedButton1Click(Sender: TObject);
var
  money:Currency;
  SEED_VALUE:string;
  lftp : TIdFTP;
 suma, SEED_FLAG , i:Integer;
 staiss: Byte;
begin
  staiss:=0;
 suma:=0;
 money:=0.0000;
 if edit2.text='' then
 begin
   ShowMessage('请选择客户名称');
   Exit;
 end;
 if edit3.text='' then
 begin
   ShowMessage('请选择主管业务员');
   Exit;
 end;
 if edit5.text='' then
 begin
   ShowMessage('请选择工厂');
   Exit;
 end;
 if edit6.text='' then
 begin
   ShowMessage('请选择审批流程');
   Exit;
 end;
 if edit4.text='' then
 begin
   ShowMessage('请输入索赔金额');
   Exit;
 end;
 

 if DM.ADO618pres.IsEmpty then
 if messagedlg('没有输入责任分摊,是否继续?',mtconfirmation,[mbyes,mbno],1)<>mryes then exit
 else

 SEED_FLAG := 0 ;
 if status=1 then
 begin
  DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG '+
                     'from Data0004 where table_name = ''data0597''';
  DM.ADOQuery1.Open;
  SEED_VALUE:=DM.ADOQuery1.FieldByName('SEED_VALUE').AsString;
  SEED_FLAG:= DM.ADOQuery1.FieldByName('SEED_FLAG').AsInteger;
  if self.invo_number_error(trim(edit1.Text)) then
  begin
   if SEED_FLAG <>1 then
    begin
     Edit1.Text:=SEED_VALUE;
     messagedlg('索赔编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
    end
   else
   begin
    messagedlg('索赔编号重复!请手工重新输入',mterror,[mbok],0);
    Edit1.SetFocus;
    exit;
   end;
  end;
 end;
 DM.ADOConnection1.BeginTrans;
 try

  if status=1 then
   begin
    if (SEED_FLAG <>1) then        //新增保存之后处理04初始值加1
    Update_Seed('data0597');
    with DM.ADOQuery1 do
    begin
     Close;
     SQL.Text := 'select tax,spmoney,Number, spNumber, rkey10, rkey73, EntryTime, rkey01, Debit, Remarks, status,' +
                 'submit_date,v_ttype, Salesman, ywexplain, rkey15, rkey FROM  dbo.data0597 where rkey = null' ;

     Open;
    end;
    DM.ADOQuery1.Append;
   end
  else
  begin
   with DM.ADOQuery1 do
   begin
    Close;
    SQL.Text := 'select tax,spmoney,Number, spNumber, rkey10, rkey73, EntryTime, rkey01, Debit, Remarks, status,' +
                'submit_date, Salesman,v_ttype, ywexplain, rkey15, rkey FROM  dbo.data0597 where rkey =  '+ DM.ADo597Rkey.AsString;
    Open;
   end;
   DM.ADOQuery1.Edit;
   staiss:=1;//记录 DM.ADOQuery1.Edit状态

  end;
  if vprev<>'3' then //权限3不执行
  begin

   DM.ADOQuery1.FieldByName('spmoney').AsString := Edit4.Text;
   DM.ADOQuery1.FieldByName('spNumber').AsString := Edit1.Text;
   DM.ADOQuery1.FieldByName('rkey10').Value :=edit2.Tag;
   if staiss=0 then
   DM.ADOQuery1.FieldByName('rkey73').Value := StrToInt(rkey73);
   DM.ADOQuery1.FieldByName('EntryTime').AsDateTime := common.getsystem_date(DM.tmp,0);
   DM.ADOQuery1.FieldByName('rkey15').Value :=edit5.tag;
   DM.ADOQuery1.FieldByName('rkey01').Value :=combobox1.tag;
   DM.ADOQuery1.FieldByName('tax').value :=CheckBox2.checked;
   DM.ADOQuery1.FieldByName('Debit').value := CheckBox1.checked;
   DM.ADOQuery1.FieldByName('Salesman').Value := Edit3.tag;
   DM.ADOQuery1.FieldByName('ywexplain').Value := Memo1.Text;
//   DM.ADOQuery1.FieldByName('Remarks').Value :=  Memo2.Text;
   DM.ADOQuery1.FieldByName('status').Value :=  1;
  end;
  DM.ADOQuery1.FieldByName('Remarks').Value :=  Memo2.Text;
  DM.ADOQuery1.FieldByName('v_ttype').AsString := edit6.text; //审批人员变动,客诉可以改审批流程
  DM.ADOQuery1.Post;
  rkey600 := DM.ADOQuery1.FieldByName('rkey').asinteger;


  DM.qryFileList2.First;
  while not DM.qryFileList2.Eof do
  begin
   DM.qryFileList2.Edit;
   DM.qryFileList2.FieldByName('rkey597').Value := rkey600;
   DM.qryFileList2.Post;
   DM.qryFileList2.Next;
  end;
  DM.qryFtp2.UpdateBatch();
  DM.qryFileList2.UpdateBatch();

  with DM.ADOQuery2 do
  begin
   Close;
   SQL.Text := ' SELECT rkey597 FROM  dbo.data0609 where rkey597= '+ IntToStr(rkey600);
   Open;
  end;
  if not DM.ADOQuery2.IsEmpty then
  begin
   with DM.ADOQuery3 do
   begin
    Close;
    SQL.Text := ' DELETE data0609 WHERE rkey597= '+ inttostr(rkey600);
    ExecSQL;
   end;
  end;
  if stringgrid2.RowCount<>2 then
  begin
    with dm.ADOQuery2 do
    begin
     Close;
     SQL.Text :='SELECT rkey597, Number25, condate, remark, rec_no, xingtai, explain, company, '+
                ' Number, spUnitPrice, spliable, spmonth FROM dbo.data0609';
     Open;
    end;
    for i:=1 to stringgrid2.RowCount-2 do
    begin
     dm.ADOQuery2.Append;
     dm.ADOQuery2.FieldByName('rkey597').Value:=rkey600;
     dm.ADOQuery2.FieldByName('condate').Value:=StrToDateTime(StringGrid2.Cells[0,i]);
     dm.ADOQuery2.FieldByName('remark').Value:=StringGrid2.Cells[1,i];
     dm.ADOQuery2.FieldByName('Number25').Value:=StringGrid2.Cells[2,i];
     dm.ADOQuery2.FieldByName('rec_no').value:=StringGrid2.Cells[3,i];
     dm.ADOQuery2.FieldByName('xingtai').Value:=StringGrid2.Cells[4,i];
     dm.ADOQuery2.FieldByName('explain').Value:=StringGrid2.Cells[5,i];
     dm.ADOQuery2.FieldByName('company').Value:=StringGrid2.Cells[6,i];
     dm.ADOQuery2.FieldByName('Number').Value:=StrToInt(StringGrid2.Cells[7,i]);
     dm.ADOQuery2.FieldByName('spUnitPrice').Value:=StrToCurr(StringGrid2.Cells[8,i]);
     dm.ADOQuery2.FieldByName('spliable').Value:=StringGrid2.Cells[9,i];
     dm.ADOQuery2.FieldByName('spmonth').Value:=StrToDateTime(StringGrid2.Cells[10,i]);

     suma:=suma+StrToInt(StringGrid2.Cells[7,i]);
//     money:=money+StrToCurr(StringGrid2.Cells[8,i]);
     dm.ADOQuery2.Post;
    end;
   with DM.ADOQuery1 do
   begin
    Edit;
    FieldByName('Number').Value:= suma;
//    FieldByName('spmoney').Value:= money;
    post;
   end;
  end;
  if stringgrid2.RowCount=2 then
  begin
   with DM.ADOQuery1 do
   begin
    Edit;
    FieldByName('Number').Value:= 0;
//    FieldByName('spmoney').Value:= 0;
    post;
   end;
  end;


  DM.ADOConnection1.CommitTrans;


  upseino;

  Rsave := 1; //记录是否有点击保存
    //删除ftp文件
  if list.Count<> 0 then
  begin
   LFtp:= TIdFTP.Create(nil);
   try
    LFtp.Host := host;
    LFtp.Username := Username;
    LFtp.Password := password;
    try
     if not LFtp.Connected then LFtp.Connect(True,10000);
     if LFTp.Connected then
     begin
      for i :=0 to (list.Count - 1) do
      begin
       try
        LFTp.Delete(list[i]);
       except
        // ShowMessage('文件已经不存在');
        Continue;
       end
      end;
      if status <> 1 then
     end;
    except
     ShowMessage('FTP链接失败,删除失败');
    end;

   finally
    if LFTp.Connected then LFTp.Disconnect;
    LFTp.Free;
    list.Free;
   end;
  end;

  if(StrToInt(vprev)<>3) then
  begin
   DM.ADOQuery1.Close;
   DM.ADOQuery1.SQL.Text:='SELECT * FROM data0607 WHERE v_ttype= '+QuotedStr(Edit6.Text);
   DM.ADOQuery1.Open;
   with DM.ADOQuery2 do
   begin
    Close;
    sql.clear;
    
    SQL.Add('declare @classid as int');
    SQL.Add('INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES('+ QuotedStr( ' (*＾-＾*) 索赔申请需要您导入明细并提交')+',GETDATE(),'+rkey73+')'+'select @classid=@@identity');
    SQL.Add('INSERT INTO data0314(emp_ptr,d14_ptr)VALUES('+dm.ADOQuery1.fieldbyname('rkey73').AsString+','+ '@classid'+')');
    ExecSQL;
   end;
  end;


  ModalResult := mrOk;
 except
  on E:Exception do
  begin
   DM.ADOConnection1.RollbackTrans;
   MessageDlg(E.Message,mtError,[mbCancel],0);
  end;
 end;
end;

procedure TForm_add.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'ABBR_NAME/工厂/350';
  InputVar.Sqlstr :='SELECT RKEY,WAREHOUSE_CODE, ABBR_NAME from dbo.Data0015 where active_flag= '+QuotedStr('y');
  inputvar.KeyField:='rkey';
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   Edit5.Text:=frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
   Label13.Caption:=frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
   Edit5.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
  end ;
 finally
 frmPick_Item_Single.Free ;
 end;
end;

function TForm_add.invo_number_error(number: string): boolean;
begin
 result:=false;
 with dm.ADOQuery1 do
 begin
  close;
  SQL.Text:='select rkey, spNumber from Data0597 where spNumber='+QuotedStr(number);
  open;
  if not IsEmpty then
  result:=true;
 end;
end;

function TForm_add.Update_Seed(table_name: string): boolean;
var
 i, v_length: integer;
 v_Seed: string;
 v_last, new_seed: string;
begin
 DM.ADOQuery1.Close;
 DM.ADOQuery1.SQL.Text := 'select Seed_Value from data0004 where  table_name = '+QuotedStr(table_name);
 DM.ADOQuery1.Open;
 v_Seed := DM.ADOQuery1.Fieldbyname('Seed_Value').AsString;
 v_length := length(v_seed);
 for i := v_length downto 1 do
 if not (v_seed[i] in ['0'..'9']) then //如果不是数字
 begin
  v_last := floattostr(power(10, v_length - 1) + strtofloat(copy(v_seed, i + 1, v_length - i)) + 1); //后缀加1
  new_seed := copy(v_seed, 1, i) + copy(v_last, i + 1, v_length - i);
  break;
 end
 else
 if i = 1 then //如果第一位仍然是数字
 begin
  v_last := floattostr(power(10, v_length) + strtofloat(v_seed) + 1);
  new_seed := copy(v_last, 2, v_length);
 end;
 try
  DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text := ' update data0004 set Seed_Value= ' + QuotedStr(new_Seed) + ' where table_name = '+QuotedStr(table_name);
  DM.ADOQuery1.ExecSQL;
  result := True ;
 except
 result := False;
 end;
end;

procedure TForm_add.ComboBox1Change(Sender: TObject);
begin
 DM.ADOQuery1. Close;
 DM.ADOQuery1.SQL.Text := 'SELECT RKEY, CURR_NAME FROM  dbo.Data0001 where CURR_NAME= ' + QuotedStr(combobox1.text);//+ DM.ADS697Rkey.AsString;
 DM.ADOQuery1. Open;
 combobox1.tag:= DM.ADOQuery1.FieldByName('RKEY').value;
end;

function TForm_add.SbctoDbc(s: string): string;
var nlength,i:Integer;
    strTxt,ctmp,C1,C2:string;
begin
 nlength:=Length(s);
 if (nlength=0) then Exit;
 strTxt:='';
 setlength(ctmp,nlength+1);
 ctmp:=s;
 i:=1;
 while (i<=nlength) do
 begin
  C1:=ctmp[i];
  C2:=ctmp[i+1];
  if (C1=#163) then
  begin
   strTxt:=strTxt+chr(ord(C2[1])-128);
   inc(i,2);
   continue;
  end;
  if (C1>#163) then
  begin
   strTxt:=strTxt+C1;
   strTxt:=strTxt+C2;
   inc(i,2);
   continue;
  end;
  if (C1=#161) and (C2=#161) then
  begin
   strTxt:=strTxt+' ';
   inc(i,2);
   continue;
   end;
  strTxt:=strTxt+C1;
  inc(i);
 end;
 Result:=strTxt;
end;

procedure TForm_add.BitBtn6Click(Sender: TObject);
var
a:string;
i,j:integer;TempDate:TDateTime;
b:Currency;
begin
  a:= '  格式不正确,请修改后导入!' ;
  SpeedButton1.enabled:=False;
 if stringgrid2.Cells[0,0] <> '确认日期'then begin ShowMessage(a);Exit; end;
 if stringgrid2.Cells[1,0] <> '制造厂别'then begin ShowMessage(a); Exit;end ;
 if stringgrid2.Cells[2,0] <> '料号'then begin ShowMessage(a);Exit; end ;
 if stringgrid2.Cells[3,0] <> '厂内周期'then begin ShowMessage(a); Exit;end ;
 if stringgrid2.Cells[4,0] <>'形态'then begin ShowMessage(a); Exit;end ;
 if stringgrid2.Cells[5,0] <> '描述'then begin ShowMessage(a);Exit; end ;
 if stringgrid2.Cells[6,0] <> '单位'then begin ShowMessage(a);Exit; end ;
 if stringgrid2.Cells[7,0]<> '数量'then begin ShowMessage(a);Exit; end ;
 if stringgrid2.Cells[8,0] <> '预估单价'then begin ShowMessage(a); Exit;end ;
 if stringgrid2.Cells[9,0] <> '客服担当'then begin ShowMessage(a); Exit; end;
 if stringgrid2.Cells[10,0] <> '生产月份'then begin ShowMessage(a); Exit;end ;
  a:= '  格式不正确,请修改!' ;
 with stringgrid2 do
 begin
  for i:=RowCount-2 downto 1 do
  begin
   if (Trim(Cells[0,i])='') or (TryStrToDateTime(Cells[0,i],TempDate)=False) then
   begin
    ShowMessage('第1列数据为 : '+Cells[0,i]+a);
    exit;
   end;
   if Trim(Cells[1,i])=''  then
   begin
    ShowMessage('第2列数据为 : '+Cells[1,i]+a);
    Exit;
   end;

   if Trim(Cells[2,i])=''  then
   begin
    ShowMessage('第3列数据为 : '+Cells[2,i]+a);
    Exit;
   end
   else
   begin
    DM.ADOQuery1. Close;
    DM.ADOQuery1.SQL.Text := 'SELECT MANU_PART_NUMBER FROM dbo.Data0025 where MANU_PART_NUMBER= '+ QuotedStr(Cells[2,i]);
    DM.ADOQuery1. Open;
    if DM.ADOQuery1.IsEmpty then
    begin
     ShowMessage('第3列数据为 : '+Cells[2,i]+' 没有此本厂编号,请修改!');
     exit;
    end;
   end;
   if Trim(Cells[3,i])=''  then
   begin
    ShowMessage('第4列数据为 : '+Cells[3,i]+a);
    Exit;
   end;
   if Trim(Cells[4,i])=''  then
   begin
    ShowMessage('第5列数据为 : '+Cells[4,i]+a);
    Exit;
   end;
   if Trim(Cells[5,i])=''  then
   begin
    ShowMessage('第6列数据为 : '+Cells[5,i]+a);
    Exit;
   end;
   if Trim(Cells[6,i])=''  then
   begin
    ShowMessage('第7列数据为 : '+Cells[6,i]+a);
    Exit;
   end;
   if (Trim(Cells[7,i])='') or (TryStrToInt(Cells[7,i],j)=False) then
   begin
    ShowMessage('第8列数据为 : '+Cells[7,i]+a);
    exit;
   end;
   if (Trim(Cells[8,i])='') or (TryStrToCurr(Cells[8,i],b)=False) then
   begin
    ShowMessage('第9列数据为 : '+Cells[8,i]+a);
    exit;
   end;
   if (Trim(Cells[9,i])='') then
   begin
    ShowMessage('第10列数据为 : '+Cells[9,i]+a);
    exit;
   end;
   if (Trim(Cells[10,i])='') or (TryStrToDateTime(Cells[10,i],TempDate)=False) then
   begin
    ShowMessage('第11列数据为 : '+Cells[10,i]+a);
    exit;
   end;
   if  (Cells[0,i])=(Cells[0,0]) then break;    // TryStrToCurr()
  end;

 end;
 SpeedButton1.enabled:=True;
end;

procedure TForm_add.BitBtn5Click(Sender: TObject);
begin
 Export_Grid_to_Excel(StringGrid1,Self.Caption,False);
end;

procedure TForm_add.insert_data099(rkey: integer; quantity_: string);
begin
// with DM.ADOQuery3 do
// begin
//  Close;
//  SQL.Text := 'INSERT INTO data0599(rkey597,rkey73,seq_no) SELECT '+ IntToStr(rkey) +',rkey73, seq_no FROM Data0608  WHERE v_ttype= '+ QuotedStr(quantity_);
//  ExecSQL;
// end;
end;

procedure TForm_add.PopupMenu1Popup(Sender: TObject);
begin
   if status<>3 then
  N7.Enabled :=  StrToInt(vprev) in[3,4] ;
end;

procedure TForm_add.N8Click(Sender: TObject);
begin
 BitBtn6click(sender) ;
end;

procedure TForm_add.StringGrid2GetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
 SpeedButton1.enabled:=False;
end;

procedure TForm_add.FormActivate(Sender: TObject);
begin
 if vprev='3' then
 begin
 // BitBtn1.Enabled:=False;
  BitBtn2.Enabled:=False;
  BitBtn3.Enabled:=False;
  BitBtn4.Enabled:=False;
  edit4.Enabled:=False;
  ComboBox1.Enabled:=False;
  CheckBox1.Enabled:=False;
  CheckBox2.Enabled:=False;
 end;
end;

procedure TForm_add.StringGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if StringGrid2.Row=StringGrid2.RowCount-1 then
  StringGrid2.RowCount:=StringGrid2.RowCount+1;

end;

procedure TForm_add.N3Click(Sender: TObject);
var
  i:Integer;
begin
  if stringgrid2.RowCount<=2 then Exit;
 for i:=stringgrid2.Row to stringgrid2.RowCount-1 do
 stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text; 
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
end;


procedure TForm_add.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  BtActNote.Visible:=false;
  if (Acol=2) and (ARow>0) then
  begin
    BtActNote.Left:=StringGrid2.Left+StringGrid2.ColWidths[0]+StringGrid2.ColWidths[1]+StringGrid2.ColWidths[2]-BtActNote.Width+2;
    BtActNote.Top:=ARow*(StringGrid2.RowHeights[0]+1)+StringGrid2.Top+2;
    BtActNote.Visible:=True;
  end;

  if  (ARow=0) or (ACol=2) then
    StringGrid2.Options:=StringGrid2.Options-[goEditing]
  else
    StringGrid2.Options:=StringGrid2.Options+[goEditing];
end;

procedure TForm_add.BtActNoteClick(Sender: TObject);
var inputvar: PDlgInput;
begin
 SpeedButton1.Enabled:=False;
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/200,MANU_PART_DESC/客户型号/200';
  InputVar.Sqlstr :='SELECT MANU_PART_NUMBER, MANU_PART_DESC FROM Data0025 ';
  inputvar.KeyField:='rkey';
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   stringgrid2.Cells[stringgrid2.Col,stringgrid2.Row]:=frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER'];

  end ;
 finally
 frmPick_Item_Single.Free ;
 end;
end;

procedure TForm_add.Timer1Timer(Sender: TObject);
begin
Panel1.Visible:=False;
Timer1.enabled:=False;
end;

procedure TForm_add.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
  abort;
end;



procedure TForm_add.N9Click(Sender: TObject);
begin
 try
  Form_money:= TForm_money.Create(Application);
  Form_money.stats:=1;
  if Form_money.ShowModal=mrok then
 finally
  Form_money.free;
 end;
end;

procedure TForm_add.N11Click(Sender: TObject);
begin
 dm.ado618pres.delete;
end;

procedure TForm_add.upseino;
var i:Integer;
begin

 DM.tmp2.Close;
 DM.tmp2.SQL.Text:='SELECT rkey FROM data0597 WHERE spNumber= '+QuotedStr(Edit1.Text);   //取597rkey
 DM.tmp2.Open;

 DM.ADO618pres.First;
 i:=1;
 while not DM.ADO618pres.Eof do
 begin
  DM.ADO618pres.Edit;
  DM.ADO618pressel_n.Value:=i;
  DM.ADO618presrkey597.value:= DM.tmp2.FieldByName('rkey').Value;
  DM.ADO618pres.Post;
  DM.ADO618pres.Next;
  i:=i+1;
 end;


 DM.ADO618pres.UpdateBatch();

end;

end.
