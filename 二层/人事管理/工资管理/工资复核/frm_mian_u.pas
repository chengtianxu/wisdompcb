unit frm_mian_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons,common, ComCtrls,
  DB, ADODB, DBGridEh, Menus;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    btn_save: TBitBtn;
    btn_audit: TBitBtn;
    btn_NoAudit: TBitBtn;
    qry_Main: TADOQuery;
    ds: TDataSource;
    qry_MainYearMonth: TStringField;
    qry_Mainremark: TStringField;
    qry_MainODate: TDateTimeField;
    qry_Mainstatus: TIntegerField;
    qry_Mainrkey: TAutoIncField;
    qry_Mainstatus2: TStringField;
    qry_Mainoperator: TStringField;
    PopupMenu1: TPopupMenu;
    N_del: TMenuItem;
    DBGrid2: TDBGrid;
    fltfld_Maindays: TFloatField;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_auditClick(Sender: TObject);
    procedure btn_NoAuditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N_delClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin

//    user_ptr:='3'; //人员ID
//   vprev:='4';    //权限
//   rkey73:='3062';   //



  if not app_init(dm.ADOConnection1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
  end;




   
    self.Caption :=Application.Title;
    //damo.people_right:=strtoint(vprev);//权限
    //damo.op_people:=strtoint(user_ptr);//当前操作员
    dm.ADOConnection1.Open;

   DateSeparator := '-';
   ShortDateFormat := 'yyyy-mm-dd';
   if dm.ADOConnection1.Connected then
      dm.ADOQuery1.Active :=true;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
if strtoint(vprev)  in [1,3] then
begin
showmessage('没有可写权限');
exit;
end;
bitbtn2.Enabled := false;
dm.ADOTMP.SQL.Text :='insert into salarycheck(checkyearmonth) '+
  ' select   '+
  ' substring(convert(nvarchar(20), '+
  ' dateadd(month,1,(max(checkyearmonth)+'+#39+'-01'+#39+')), '+
  ' 120),1,7) from salarycheck  ';
dm.ADOTMP.ExecSQL;
dm.ADOQuery1.Active := false;
dm.ADOQuery1.Active := true;
dm.ADOQuery1.Last;
dm.ADOQuery1.Sort := 'checkyearmonth';
bitbtn2.Enabled := true;

end;

procedure Tfrm_main.BitBtn3Click(Sender: TObject);
var str_yearmonth :string;
begin
  if strtoint(vprev)  in [1,3] then
  begin
  showmessage('没有可写权限');
  exit;
  end;
  if dm.ADOQuery1ischeck.Value = 1 then
  begin
  showmessage('不可以重复审核');
  exit;
  end;
  str_yearmonth := dm.ADOQuery1checkyearmonth.Value;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :=' update salarycheck '+
    ' set ischeck=1,checkman='+user_ptr+',checkdate=getdate(),checkdesc='+#39+#39+
    ' from salarycheck '+
    ' where ischeck=0 and checkyearmonth='+#39+str_yearmonth+#39 ;
  dm.ADOTMP.ExecSQL;
  dm.ADOQuery1.Active := false;
  dm.ADOQuery1.Active := true;
  dm.ADOQuery1.Locate('checkyearmonth',str_yearmonth,[]);
end;

procedure Tfrm_main.BitBtn6Click(Sender: TObject);
var str_yearmonth :string;
begin
  if strtoint(vprev)  in [1,2,3] then
  begin
  showmessage('没有可写权限');
  exit;
  end;
  if dm.ADOQuery1ischeck.Value = 0 then
  begin
  showmessage('未审核状态不可以反审核');
  exit;
  end;
  str_yearmonth := dm.ADOQuery1checkyearmonth.Value;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :=' update salarycheck '+
    ' set ischeck=0,checkman='+user_ptr+',checkdate=getdate(),checkdesc='+#39+'反审核'+#39+
    ' from salarycheck '+
    ' where ischeck=1 and checkyearmonth='+#39+str_yearmonth+#39 ;
  dm.ADOTMP.ExecSQL;
  dm.ADOQuery1.Active := false;
  dm.ADOQuery1.Active := true;
  dm.ADOQuery1.Locate('checkyearmonth',str_yearmonth,[]);
end;

procedure Tfrm_main.BitBtn4Click(Sender: TObject);
var str_yearmonth :string;
begin
  if strtoint(vprev)  in [1,3] then
  begin
  showmessage('没有可写权限');
  exit;
  end;
  if dm.ADOQuery1ischeck.Value = 1 then
  begin
  showmessage('已审核的工资月份不可以激活');
  exit;
  end;
  str_yearmonth := dm.ADOQuery1checkyearmonth.Value;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :=' update salarycheck '+
    ' set actived=1 '+
    ' from salarycheck '+
    ' where actived=0 and checkyearmonth='+#39+str_yearmonth+#39 ;
  dm.ADOTMP.ExecSQL;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :=' update salarycheck '+
    ' set actived=0 '+
    ' from salarycheck '+
    ' where actived=1 and checkyearmonth<>'+#39+str_yearmonth+#39 ;
  dm.ADOTMP.ExecSQL;
  dm.ADOQuery1.Active := false;
  dm.ADOQuery1.Active := true;
  dm.ADOQuery1.Locate('checkyearmonth',str_yearmonth,[]);
end;
      
procedure Tfrm_main.BitBtn5Click(Sender: TObject);
var str_yearmonth :string;
begin
  if strtoint(vprev)  in [1,3] then
  begin
  showmessage('没有可写权限');
  exit;
  end;
  if dm.ADOQuery1actived.Value = 0 then
  begin
  showmessage('未激活的月份不可以初始化');
  exit;
  end;
  bitbtn5.Enabled := false;
  str_yearmonth := dm.ADOQuery1checkyearmonth.Value;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :=' exec dbo.hrsp_InitWage '+#39+str_yearmonth+#39  ;
  dm.ADOTMP.ExecSQL;
  dm.ADOTMP.SQL.Clear;
  showmessage('初始化完成');
  bitbtn5.Enabled := true;
end;

procedure Tfrm_main.btn_saveClick(Sender: TObject);
begin

    if strtoint(vprev)  in [1,3] then
    begin
    showmessage('没有可写权限');
    exit;
    end;

   if  qry_Main.IsEmpty  then exit;
    if qry_main.fieldbyname('status').asinteger=1  then
     begin
     ShowMessage('已审核不能修改!');
     exit;
     end;

    qry_main.Append;
     
    qry_Main.UpdateBatch(arall);
    qry_Main.Requery;
    qry_Main.Last;


end;

procedure Tfrm_main.btn_auditClick(Sender: TObject);
var
 rkey: integer;
 ssql: string;
 bk: Tbookmark;
begin
  if strtoint(vprev)  in [1,3] then
  begin
  showmessage('没有可写权限');
  exit;
  end;

 if   qry_Main.IsEmpty then exit;
   bk:=qry_Main.GetBookmark;
  rkey:= qry_main.fieldbyname('rkey').asinteger;
  if qry_main.fieldbyname('status').asinteger=1  then  exit;

  ssql:= ' update overworkset  set status=1 , ODate= getdate(), oper_id='+user_ptr+'  where rkey='+inttostr(rkey)+'';

  try
  execsql(dm.ADOTMP,ssql);
  qry_Main.close;
    qry_main.open;
    qry_Main.GotoBookmark(bk);
 // showmessage('审核成功！');  
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
end;

procedure Tfrm_main.btn_NoAuditClick(Sender: TObject);
var
 rkey: integer;
 ssql: string;
 bk: Tbookmark;
begin
 if strtoint(vprev)  in [1,3] then
  begin
  showmessage('没有可写权限');
  exit;
  end;



 if   qry_Main.IsEmpty then exit;
      bk:=qry_Main.GetBookmark;
  rkey:= qry_main.fieldbyname('rkey').asinteger;
  if qry_main.fieldbyname('status').asinteger=0  then  exit;

  ssql:= ' update overworkset  set status=0 , ODate=getdate(), oper_id='+user_ptr+' ,remark=''反审核''  where rkey='+inttostr(rkey)+'';

  //ShowMessage(ssql);
  try
  execsql(dm.ADOTMP,ssql);

  qry_Main.Requery;
  qry_Main.GotoBookmark(bk);
   // qry_main.open;
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
 if not  qry_main.active  then  qry_main.Open;
end;

procedure Tfrm_main.N_delClick(Sender: TObject);
var  ssql: string;
begin

 if qry_main.IsEmpty  then exit;

 try
 ssql:=' delete from overworkset  where rkey= '+inttostr(qry_Main.fieldbyname('rkey').asinteger)+' ';
 ExecSql(dm.ADOTMP,ssql);
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
end;


 qry_Main.Requery;
 qry_Main.Last;

end;

end.
