unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  Menus,adodb, DB,ComObj, Excel2000, ExtCtrls, ppCtrls, ppBands, ppPrnabl,
  ppClass, ppVar, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppEndUsr,raide,ClipBrd, DBGridEh, ppModule, raCodMod, ppSubRpt,
  ppStrtch, ppMemo;

type
  TFrm_main = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    Panel1: TPanel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Bar1: TStatusBar;
    Splitter1: TSplitter;
    Timer1: TTimer;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    N4: TMenuItem;
    N6: TMenuItem;
    BitBtn4: TBitBtn;
    ppDB_300: TppDBPipeline;
    ppDB300: TppDBPipeline;
    ppDB301: TppDBPipeline;
    ppDB302: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    N7: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    ppDB493: TppDBPipeline;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;
    dbgrid1: TDBGridEh;
    ppTitleBand1: TppTitleBand;
    ppDBText10: TppDBText;
    ppLabel19: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine7: TppLine;
    ppLabel2: TppLabel;
    ppLine14: TppLine;
    ppLabel11: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine8: TppLine;
    ppLine13: TppLine;
    ppDBMemo1: TppDBMemo;
    ppLine15: TppLine;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppLabel18: TppLabel;
    ppDBText12: TppDBText;
    ppLabel3: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppLabel12: TppLabel;
    ppDB301ppField1: TppField;
    ppLine3: TppLine;
    ppLabel14: TppLabel;
    ppDBText3: TppDBText;
    ppLine9: TppLine;
    raCodeModule2: TraCodeModule;
    ppDB301ppField2: TppField;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure save_auth(wzrkey300,auth_ptr:integer);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N13Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure dbgrid1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
  private
    v_employee:integer;

    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;

    FsCheck,FsSearch:string;

   function find_received(wzdata300rkey:integer):boolean;
   procedure init;
   procedure getiFlag;
  public
  end;

var
  Frm_main: TFrm_main;

implementation
uses DM_u,common, Frm_Edit_u, Frm_AudInf_u, Frm_recv_u, Frm_EdtDetail_u,Frm_QrySet_u;

{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
  exit;
 end;
 self.Caption:=application.Title;

//
// rkey73:='851';
// vprev:='4';

 init;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrm_main.init;
begin
  field_name := dbgrid1.Columns[0].FieldName;
  PreColumn := dbgrid1.Columns[0];
  dbgrid1.Columns[0].Title.Color := clred ;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select employee_ptr,data0034.dept_code,data0034.dept_name');
    sql.Add('from data0073,data0005,data0034');
    sql.Add('where data0073.employee_ptr=data0005.rkey');
    sql.Add('and data0005.EMPLOYEE_ID=data0034.rkey');
    sql.Add('and data0073.rkey='+rkey73);
    open;
    v_employee:=fieldvalues['employee_ptr'];
    dept_code:=fieldvalues['dept_code'];
    dept_name:=fieldvalues['dept_name'];
    self.Caption := dept_name+self.Caption;

    close;
    sql.Clear;
    sql.Add('select rkey from wzdata300 where status=5');
    open;
    label1.Visible:=not dm.ADOQuery1.IsEmpty ;
  end;
  sSql:=DM.wzdata300.SQL.Text;
  FsSearch:=' where WZDATA300.type=0 and WZDATA300.ent_data >=getdate()-7 ';
  CheckBox1Click(nil);
  iFlag:=0;
end;


function TFrm_main.find_received(wzdata300rkey: integer): boolean;
begin
  with dm.adoquery1 do
  begin
   close;
   sql.Text:='SELECT dbo.WZDATA304.RKEY'+#13+
     'FROM dbo.WZDATA304 INNER JOIN'+#13+
     ' dbo.WZDATA301 ON dbo.WZDATA304.EPILIST_PTR = dbo.WZDATA301.RKEY'+#13+
     'where wzdata301.EPIBOLY_PTR='+inttostr(wzdata300rkey);
   open;
   result:=not isempty ;
  end;
end;


procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
begin
  FsCheck:=' and WZDATA300.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  DM.wzdata300.SQL.Text:=sSql+FsSearch+FsCheck;
  DM.wzdata300.Close;
  DM.wzdata300.Open;
end;


procedure TFrm_main.N1Click(Sender: TObject);          //Add
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3)   then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
  if (strtoint(vprev)=2) and ((Sender as TMenuItem).Name='N1') then
  begin
    messagedlg('对不起!您没有该功能的可写权限',mtinformation,[mbok],0);
    exit;
  end;
  dm.adowz300.Close;
  dm.adowz300.Parameters[0].Value := null;
  dm.adowz300.Open;
  dm.adowz300.Append;
  dm.adowz300STATUS.Value := 1;
  dm.adowz300ent_data.Value := common.getsystem_date(dm.ADOQuery1,1);
  dm.adowz300empl_ptr.Value:= v_employee;
  with dm.ADO301 do
  begin
    close;
    Parameters[0].Value:=dm.adowz300rkey.Value;
    open;
  end;

  with TFrm_Edit.Create(nil) do
  try
    iFlag:=TComponent(Sender).Tag;
    Fmod:=iFlag;
    initi;
    if ShowModal = mrok then
     begin
      dm.wzdata300.Close;
      dm.wzdata300.Open;
      dm.wzdata300.Locate('rkey',dm.adowz300RKEY.Value,[]);
      dm.adowz300.Close;
     end
    else
     with dm.ADO301 do
      begin
       close;
       Parameters[0].Value:=dm.wzdata300rkey.Value;
       open;
      end;
  finally
    free;
  end;
end;

procedure TFrm_main.N2Click(Sender: TObject);           //edit
var
 rkeywz300:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    dm.adowz300.Close;
    dm.adowz300.Parameters[0].Value := dm.wzdata300rkey.Value;
    dm.adowz300.Open;
    dm.adowz300.Edit;
    dm.adowz300status.Value:=1;
    with TFrm_Edit.Create(application) do
    try
      getiFlag;
      Fmod:=Tcomponent(Sender).Tag;     //2
      initi;
      if ShowModal = mrok then
      begin
        rkeywz300:=dm.wzdata300rkey.Value;
        dm.wzdata300.Close;
        dm.wzdata300.Open;
        dm.wzdata300.Locate('rkey',rkeywz300,[]);
      end;
    finally
      free;
    end;
  end;
end;

procedure TFrm_main.N3Click(Sender: TObject); //检查
begin
    dm.adowz300.Close;
    dm.adowz300.Parameters[0].Value := dm.wzdata300rkey.Value;
    dm.adowz300.Open;
    Frm_Edit:=TFrm_Edit.Create(application);
    try
      getiFlag;
      Frm_Edit.Fmod:=Tcomponent(Sender).Tag;
      Frm_Edit.initi;
      Frm_Edit.BitBtn9.Visible := true;
      Frm_Edit.BitSve.Visible := false;
      Frm_Edit.BitClose.Visible := false;
      Frm_Edit.Edit1.Enabled := false;
      Frm_Edit.BitBtn4.Enabled := false;
      Frm_Edit.Edit2.Enabled := false;
      Frm_Edit.BitBtn5.Enabled := false;
      Frm_Edit.Edit4.Enabled := false;
      Frm_Edit.BitBtn7.Enabled := false;
      Frm_Edit.BitBtn8.Enabled := false;
      Frm_Edit.Edit5.Enabled := false;

      Frm_Edit.DBEdit1.Enabled:=false;
      Frm_Edit.DBEdit2.Enabled := false;
      Frm_Edit.DBEdit3.Enabled:=false;
      Frm_Edit.DBEdit4.Enabled:=false;
      Frm_Edit.DBEdit5.Enabled:=false;
      Frm_Edit.DBEdit6.Enabled:=false;
      Frm_Edit.DBEdit7.Enabled:=false;

      Frm_Edit.DBEdit9.Enabled:=false;

      Frm_Edit.DBGrid1.PopupMenu := Frm_Edit.PopupMenu3;
      Frm_Edit.ShowModal;
    finally
      Frm_Edit.free;
    end;
end;

procedure TFrm_main.N5Click(Sender: TObject);        //delete
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    dm.ADOConnection1.BeginTrans;
    try
       dm.Tmp.Close;
       dm.Tmp.SQL.Text:='delete from wzdata305 where rkey301 in '+
                        '(select rkey from wzdata301 where EPIBOLY_PTR='+dm.wzdata300rkey.AsString+')';
       dm.Tmp.ExecSQL;
       
       dm.adowz300.Close;
       dm.adowz300.Parameters[0].Value := dm.wzdata300rkey.Value;
       dm.adowz300.Open;

       dm.adowz300.Delete;
       dm.ADOConnection1.CommitTrans;
       dm.wzdata300.Close;
       dm.wzdata300.Open;
       dm.adowz300.Close;
    except
       dm.ADOConnection1.RollbackTrans;
       messagedlg('数据删除不成功!请与管理员联系',mtwarning,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
 if dm.wzdata300.IsEmpty then
 begin
   n2.Enabled:=false;
   n4.Enabled:=false;
   n5.Enabled:=false;
   n6.Enabled:=false;
   n8.Enabled:=false;

   n3.Enabled:=false;
   n9.Enabled:=false;
   n10.Enabled:=false;
   n13.Enabled:=false;
   n7.Enabled:=false;
 end
 else
 begin
   n2.Enabled := false;   //编辑
   n4.Enabled := false;   //取消审批
   n5.Enabled := false;   //删除
   n6.Enabled := false;   //打印
   //n6.Enabled := dm.wzdata300status.AsInteger=3;    //打印
   n8.Enabled := false;  //提交审批
   n7.Enabled:=false;  //重新收货
   n3.Enabled := true;  //检查
   n9.Enabled := true;  //审批信息
   n10.Enabled := true; //收货信息
   n13.Enabled := true; //导出请购项目
   case dm.wzdata300status.Value of
    1:          //未提交
     begin
      n8.Enabled := true;
      n5.Enabled := true;  //删除
      n2.Enabled := true;
      n9.Enabled := false;  //审批信息
     end;
    2:         //待审批
     begin
      n4.Enabled:=true; //取消审批
     end;
    3:         //已审批
     begin
      n4.Enabled:=true; //取消审批
      n6.Enabled:= True;//打印
     end;
    4:        //已收货
     begin
       n7.Enabled:=true;  //重新收货
       n6.Enabled:= True; //打印
     end;
    5:        //被退回
     begin
      n2.Enabled := true;
      n5.Enabled := true;  //删除
     end;
   end;

  end;
end;

procedure TFrm_main.N8Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    dm.wzdata300.Edit;
    dm.wzdata300status.Value:=2;     //如果授理结束那幺状态变成提交审批
    dm.wzdata300refer_date.Value := common.getsystem_date(dm.ADOQuery1,0);
    self.save_auth(dm.wzdata300rkey.value,dm.wzdata300auth_ptr.value); //保存审批的人员
    dm.wzdata300.Post;
  end;
end;

procedure TFrm_main.N9Click(Sender: TObject);
begin
  try
    Frm_AudInf := TFrm_AudInf.Create(application);
    dm.Aqwz302.Open;
    Frm_AudInf.ShowModal;
  finally
    dm.Aqwz302.Close;
    Frm_AudInf.Free;
  end;
end;

procedure TFrm_main.N10Click(Sender: TObject);
begin
 try
  Frm_recv := TFrm_recv.Create(application);
  Frm_recv.ShowModal;
 finally
  Frm_recv.Free;
 end;
end;

procedure TFrm_main.DBGrid1DblClick(Sender: TObject);
var
 info:string;
begin
 if (dm.wzdata300status.Value=5)  then
  begin
   info := '该外发申请被退回,通过原因如下：'+#13;
   with dm.Tmp do
    begin
     close;
     sql.Clear;
     sql.Add('select data0073.user_full_name,wzdata302.remark');
     sql.Add('from wzdata302 inner join data0073');
     sql.add('on wzdata302.user_ptr=data0073.rkey');
     sql.Add('where wzdata302.epiboly_ptr='+dm.wzdata300rkey.AsString);
     sql.add('and auth_flag=''Y''');
     open;
     info:=info+'退回人员:'+fieldvalues['user_full_name']+#13;
     info:=info+'退回原因:'+fieldbyname('remark').asstring;
    end;
   showmessage(info);
  end
 else
  if dm.wzdata300status.Value=1 then
   n2click(N2);
end;

procedure TFrm_main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    dbgrid1dblclick(sender)
  else if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.wzdata300.SQL.Text);
end;


procedure TFrm_main.save_auth(wzrkey300,auth_ptr:integer);
var
 rkey14:integer;
begin
 rkey14:=0;
if messagedlg('是否短信通知审批人员?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 with dm.Tmp do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0014 where rkey is null');
   open;
   append;
   fieldvalues['MESSAGE'] := '有一张外发申请单需要通过您的审批,请购人员:'+
                             dm.wzdata300employee_name.Value+'外发编号:'+
                             dm.wzdata300epiboly_number.Value;
   fieldvalues['whosend']:= strtoint(rkey73);
   post;
   rkey14:=fieldvalues['rkey'];
  end;

dm.ADOConnection1.BeginTrans;
try

 with dm.ADOwz302 do
  begin
   close;
   Parameters[0].Value := wzrkey300;
   open;
  end;
 while not dm.ADOwz302.eof do dm.ADOwz302.Delete;//如果该外发申请已有审批人员,删除原有审批人员

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT USER_PTR FROM Data0275');
   sql.Add('where AUTH_GROUP_PTR = '+inttostr(auth_ptr));
   sql.Add('ORDER BY rkey');
   open;
  end;
  while not dm.ADOQuery1.Eof do
   begin
    dm.ADOwz302.Append;
    dm.ADOwz302epiboly_ptr.Value:=wzrkey300;
    dm.ADOwz302user_ptr.Value:=dm.ADOQuery1.FieldValues['user_ptr'];
    dm.ADOwz302ranking.value:=dm.ADOQuery1.RecNo;
    if dm.ADOQuery1.RecNo=1 then
     dm.ADOwz302auth_flag.Value:='Y'
    else
     dm.ADOwz302auth_flag.Value:='N';
    dm.ADOwz302.Post;
    dm.ADOQuery1.Next;
    if rkey14>0 then
    with dm.Tmp do
     begin
      close;
      sql.Clear;
      sql.Add('select * from data0314 where rkey is null');
      open;
      append;
      fieldvalues['emp_ptr']:=dm.ADOwz302user_ptr.Value;
      fieldvalues['d14_ptr']:= rkey14;
      post;
     end;
   end;

 dm.ADOConnection1.CommitTrans;
 dm.ADOQuery1.Close;
 dm.Tmp.Close; 
except
 dm.ADOConnection1.RollbackTrans;
 showmessage('数据提交出现错误,请与管理员联系!!!');
end;

end;

procedure TFrm_main.N13Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
    Screen.Cursor := crHourglass;
    dbgrid2.DataSource.DataSet.DisableControls;
    bm := dbgrid2.DataSource.DataSet.GetBookmark;
    dbgrid2.DataSource.DataSet.First;

     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TStringList.Create;
    sline := '';

    for col := 0 to dbgrid1.FieldCount-1 do
     sline := sline + dbgrid1.Columns[col].Title.Caption + #9;
    mem.Add(sline);

    sline := '';
    for col := 0 to dbgrid1.FieldCount-1 do
     sline := sline + dbgrid1.Fields[col].AsString + #9;
    mem.Add(sline);            //导出请购编号

    mem.Add('');//增加一行空行

    sline := '';
    for col := 0 to dbgrid2.FieldCount-1 do
     sline := sline + dbgrid2.Columns[col].Title.Caption + #9;
    mem.Add(sline);

    for row := 0 to dbgrid2.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to dbgrid2.FieldCount-1 do
       sline := sline + dbgrid2.Fields[col].AsString + #9;
      mem.Add(sline);
      dbgrid2.DataSource.DataSet.Next;
     end;

      sline := '';

    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;

    dbgrid2.DataSource.DataSet.GotoBookmark(bm);
    dbgrid2.DataSource.DataSet.FreeBookmark(bm);
    dbgrid2.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TFrm_main.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select top 1 rkey from wzdata300 where status=5');
    open;
    label1.Visible:=not dm.ADOQuery1.IsEmpty ;
  end;
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
var
 v_rkey68: integer;
begin
  v_rkey68 := 0;
  if not dm.wzdata300.IsEmpty then  v_rkey68 := dm.wzdata300rkey.Value;
   dm.wzdata300.Close;
   dm.wzdata300.Open;
  if v_rkey68 > 0 then  dm.wzdata300.Locate('rkey',v_rkey68,[]);
  self.Timer1Timer(sender);
end;


procedure TFrm_main.N4Click(Sender: TObject);
begin
if self.find_received(dm.wzdata300rkey.Value) then
 messagedlg('对不起!该外发申单已有收货记录无法取消',mtinformation,[mbok],0)
else
 if (strtoint(vprev)<>4) then
  messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
 else
  if messagedlg('你确定要将该申请取消审核，重新提交吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    dm.adowz300.Close;
    dm.adowz300.Parameters[0].Value := dm.wzdata300rkey.Value;
    dm.adowz300.Open;
    if dm.adowz300status.value=dm.wzdata300status.value then
     begin
     dm.adowz300.Edit;
     dm.adowz300status.Value := 1;
     dm.adowz300refer_date.AsVariant := null;
     dm.adowz300.Post;
     dm.wzdata300.close;
     dm.wzdata300.open;
     dm.wzdata300.Locate('rkey',dm.adowz300rkey.value,[]);
     dm.adowz300.close;
     end
    else
     begin
      dm.wzdata300.close;
      dm.wzdata300.open;
      dm.wzdata300.Locate('rkey',dm.adowz300rkey.value,[]);
      dm.adowz300.close;
      showmessage('取消操作不成功，可能已被成功审核了');
     end;
   end;
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin
 dm.adowz300.Close;
 dm.adowz300.Parameters[0].Value := dm.wzdata300rkey.Value;
 dm.adowz300.Open;
 dm.Aqwz302.Open;

  ppReport1.Reset;
  ppReport1.Template.FileName:=stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+'epiboly.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.SaveAsTemplate:=false;
  ppReport1.Print;

  dm.adowz300.Close;
  dm.Aqwz302.Close;
end;

procedure TFrm_main.BitBtn4Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+'epiboly.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.SaveAsTemplate:=true;
  ppdesigner1.ShowModal;
end;

procedure TFrm_main.N7Click(Sender: TObject);
begin
 if (strtoint(vprev)<>4) then
  messagedlg('对不起!您没有该程序的重新收货权限',mtinformation,[mbok],0)
 else
  if messagedlg('你确定要将该申请重新收货吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='select top 1 rkey from wzdata301 where EPIBOLY_PTR='+DM.wzdata300rkey.AsString+
                     ' and quantity > RECEVIED_QTY+RETURN_QTY+reject_qty';
    DM.Tmp.Open;
    if not DM.Tmp.IsEmpty then     //存在有未收货完成的记录可以更新
     begin
      dm.adowz300.Close;
      dm.adowz300.Parameters[0].Value := dm.wzdata300rkey.Value;
      dm.adowz300.Open;
      if dm.adowz300status.value=dm.wzdata300status.value then
       begin
       dm.adowz300.Edit;
       dm.adowz300status.Value := 3;
       dm.adowz300.Post;
       dm.wzdata300.close;
       dm.wzdata300.open;
       dm.wzdata300.Locate('rkey',dm.adowz300rkey.value,[]);
       dm.adowz300.close;
       end
      else
       begin
        dm.wzdata300.close;
        dm.wzdata300.open;
        dm.wzdata300.Locate('rkey',dm.adowz300rkey.value,[]);
        dm.adowz300.close;
        showmessage('恢复收货操作不成功，可能已被恢复了');
       end;
     end
    else
     showmessage('该外发单货已收完,不能再重新收货!');

   end;
end;

procedure TFrm_main.getiFlag;
begin
  if DM.ADO301.IsEmpty then exit;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select top 1 rkey  from  wzdata305 where epiboly_ptr='+DM.ADO301epiboly_ptr.AsString;
  DM.Tmp.Open;
  iFlag:=DM.Tmp.RecordCount;
  DM.Tmp.Close;
end;

procedure TFrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.wzdata300status.Value = 5 then
     DBGrid1.Canvas.Font.Color := clred
  else if dm.wzdata300status.Value = 1 then
     DBGrid1.Canvas.Font.Color := cllime ;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      dbgrid1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.dbgrid1TitleClick(Column: TColumnEh);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.wzdata300.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.wzdata300.Sort:=Column.FieldName+' DESC';
  end;
  DM.wzdata300AfterScroll(DM.wzdata300);
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  dbgrid1TitleClick(PreColumn);
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    FsSearch:=' where wzdata300.type=0 and wzdata300.ent_data>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and wzdata300.ent_data-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;

   CheckBox1Click(nil);
  end;
end;

end.
