unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Grids, DBGrids, ComCtrls, Mask,
  DBCtrls, DB, ADODB, ToolWin, ExtCtrls;
type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    PopupMenu2: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    PopupMenu3: TPopupMenu;
    N21: TMenuItem;
    N22: TMenuItem;
    BitBtn4: TBitBtn;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N19: TMenuItem;
    N15: TMenuItem;
    Excel1: TMenuItem;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    N16: TMenuItem;
    N20: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    BitBtn6: TBitBtn;
    N41: TMenuItem;
    BitBtn7: TBitBtn;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N21Click(Sender: TObject);
    procedure save_530();
    procedure N4Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    OldGridWnd : TWndMethod;
    PreColumn: TColumn;
    sSql :string;
    FCondition:string;
    procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses Demo,common, PackList, EditNote, Condition, AdviceReport, TotalPrint,
  ComObj,Excel2000, PackSelect, PackDetail, Unit1;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
begin
if not app_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
 self.Caption:=application.Title;
// dm.ADOConnection1.Open;
// rkey73:='2217';
// vprev:='2';
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-MM-dd';
  LongDateFormat := 'yyyy-mm-dd HH:mm:ss';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='shipadvice_no';
end;

procedure TForm_Main.NewGridWnd(var Message:TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm_Main.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if not DM.ADS529.IsEmpty then
    i := DM.ADS529RKEY.AsInteger
  else i:=0;
  DM.ADS529.Close;
  DM.ADS529.Open;
  DM.ADS529.Sort:=PreColumn.FieldName;
  DM.ADS529.Locate('rkey',i,[]);
end;



procedure TForm_Main.N1Click(Sender: TObject);
var
rkey529:Integer;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
  Form_PackList:=TForm_PackList.Create(application);
  Form_PackList.ade_flag:=1;//新增发货通知单
  try
   DM.ADO529.Parameters[0].Value:=null;
   DM.ADO529.Open;
   dm.ADO529.Filtered:=False;
   dm.ADO529.Append;
   Form_PackList.ShowModal;
   rkey529:=dm.ADO529RKEY.Value;
   dm.ADS529.Filtered:=true;
   dm.ADS529.Close;
   dm.ADS529.Open;
   dm.ADS529.Locate('rkey',rkey529,[]);
  finally
   Form_PackList.Free;
  end;
 end;
end;

procedure TForm_Main.N2Click(Sender: TObject);
var
rkey529:Integer;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
  try
   Form_PackList:=TForm_PackList.Create(application);
   Form_PackList.ade_flag:=2;//编辑发货通知单
   with Form_PackList do
   begin
     Edit1.ReadOnly:=True;
     Edit17.Enabled:=False;
     BitBtn1.Enabled:=False;
     BitBtn3.Enabled:=False;
   end;
   dm.ADO529.Close;
   dm.ADO529.Parameters[0].Value:=dm.ADS529RKEY.Value;
   dm.ADO529.Open;
   dm.ADO529.Edit;
   if Form_PackList.ShowModal=mrok then
   begin
     rkey529:=dm.ADO529RKEY.Value;
     dm.ADO529.Close;
     dm.ADO529.Open;
     dm.ADO529.Locate('rkey',rkey529,[]);
   end;
  finally
   Form_PackList.Free;
  end;
 end;
end;

procedure TForm_Main.N3Click(Sender: TObject);
begin
try
  Form_PackList:=TForm_PackList.Create(application);
  dm.ADO529.Close;
  dm.ADO529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  DM.ADO529.Open;
  Form_PackList.ade_flag:=3;//检查发货通知单
  with Form_PackList do
  begin
    BtnSave.Enabled:=False;
    Edit1.ReadOnly:=True;
    Edit17.Enabled:=False;
    BitBtn1.Enabled:=False;
    BitBtn2.Enabled:=False;
    BitBtn3.Enabled:=False;
    DBEdit1.Enabled:=False;
    DBEdit2.Enabled:=False;
    DBEdit3.Enabled:=False;
    Edit10.ReadOnly:=True;
    Edit11.ReadOnly:=True;
    ComboBox1.Enabled:=False;
    Edit2.ReadOnly:=True;
    Edit3.ReadOnly:=True;
    Edit4.ReadOnly:=True;
    Edit5.ReadOnly:=True;
    Edit6.ReadOnly:=True;
    Edit7.ReadOnly:=True;
    Edit8.ReadOnly:=True;
    MaskEdit1.Enabled:=False;
  end;
  Form_PackList.ShowModal;
finally
  Form_PackList.Free;
end;
end;

procedure TForm_Main.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADS529.IsEmpty then
 begin
   n1.Enabled := true;
   n2.Enabled := false;
   n3.Enabled := false;
   n4.Enabled := false;
   n6.Enabled := false;
   n7.Enabled := false;
   n8.Enabled := false;
   n10.Enabled := false;
   n11.Enabled := false;
   N41.Enabled :=False;
   N50.Enabled :=False;
 end
 else
 begin
   N1.Enabled :=((StrToInt(vprev)=2) or (StrToInt(vprev)=4));  //新增
   n2.Enabled :=((StrToInt(vprev)=2) or (StrToInt(vprev)=4))and((DM.ADS529TSTATUS.Value=0)or(DM.ADS529TSTATUS.Value=3));   //编辑
   n3.Enabled := True;  //查看
   n4.Enabled := ((StrToInt(vprev)=2) or (StrToInt(vprev)=4))and((DM.ADS529TSTATUS.Value=0)or(DM.ADS529TSTATUS.Value=3));  //删除
   n6.Enabled := N4.Enabled; //提交
   n7.Enabled :=(StrToInt(vprev)=4)and(DM.ADS529TSTATUS.Value in [1,4]);//财务终审 ;
   n8.Enabled := (StrToInt(vprev)=4)and((DM.ADS529TSTATUS.Value=1)or(DM.ADS529TSTATUS.Value=2)or(DM.ADS529TSTATUS.Value=4)); //退回
   n10.Enabled := True;//DM.ADS529TSTATUS.Value=2;
   n11.Enabled := N10.Enabled;
   n12.Enabled := (StrToInt(vprev)=3) or (StrToInt(vprev)=4);
   N50.Enabled :=(StrToInt(vprev)=4)and(dm.ADS529TSTATUS.Value=1);//报关审核
   N41.Enabled :=N50.Enabled;   //取消提交
 end;
end;



procedure TForm_Main.FormShow(Sender: TObject);
begin
   with dm.adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    user_ptr:=fieldbyname('employee_ptr').asstring;
   end;
  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
  DBGrid1.Columns[0].Title.Color := clred ;
  if ((vprev='1') or (vprev='2')) then
    FCondition:='and data0010.rkey in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')'+#13
  else
  if (vprev='3')and (vprev='4') then
    FCondition:='and (1=1)';

  sSql:=dm.ads529.SQL.Text+FCondition ;
  dm.ADS529.SQL.Text:=sSql+'order by data0529.shipadvice_no';
  dm.ADS529.Parameters[0].Value:=common.getsystem_date(dm.ADOQuery1,1)-2;
  dm.ADS529.Parameters[1].Value:=common.getsystem_date(dm.ADOQuery1,1)+1;
  dm.ADS529.Close;
  dm.ADS529.Open;
  dm.ADO530.Close;
  dm.ADO530.Open;
  if vprev='3' then
  begin
    DBGrid2.Columns[8].Visible:=False;
    DBGrid2.Columns[9].Visible:=False;
  end;
end;

procedure TForm_Main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then showmessage(dm.ADS529.SQL.Text);
end;

procedure TForm_Main.N21Click(Sender: TObject);
begin
try
 Form_EditNote:=TForm_EditNote.Create(Application);
 Form_EditNote.Caption:='装运指派常用信息';
 dm.AQR530.Close;
 dm.AQR530.Parameters[0].Value:=dm.ADO530rkey64_PTR.Value;
 DM.AQR530.Parameters[1].Value:=dm.ADO530rkey529_ptr.Value;
 dm.AQR530.Open;
  if not dm.AQR530.IsEmpty then
  begin
    Form_EditNote.Edit1.Text:=DM.AQR530total_amount.AsString;
    Form_EditNote.Edit2.Text:=DM.AQR530weight.AsString;
    Form_EditNote.Edit6.Text:=DM.AQR530nweight.AsString;
    Form_EditNote.Edit3.Text:=DM.AQR530reference_number.Value;
    Form_EditNote.Edit4.Text:=dm.AQR530remark1.Value;
    Form_EditNote.Edit5.Text:=dm.AQR530remark2.Value;
    Form_EditNote.Edit7.Text:=DM.AQR530cust_decl.AsString;
  end;
 if Form_EditNote.ShowModal=mrok then
  begin
   Self.save_530();
  end;
  DM.ADO530.Close;
  dm.ADO530.Open;
  BitBtn3Click(sender);
 finally
  Form_EditNote.free;
 end;
end;

procedure TForm_Main.save_530();
begin
   dm.AQR530.Edit;
   DM.AQR530total_amount.Value:=StrToFloat(Form_EditNote.Edit1.Text);
   DM.AQR530nweight.Value:=StrToFloat(Form_EditNote.Edit6.Text);
   dm.AQR530weight.Value:=StrToFloat(Form_EditNote.Edit2.Text);
   DM.AQR530reference_number.Value:=Form_EditNote.Edit3.Text;
   dm.AQR530remark1.Value:=Trim(Form_EditNote.Edit4.Text);
   dm.AQR530remark2.Value:=Trim(Form_EditNote.Edit5.Text);
   //dm.AQR530remark3.Value:=Form_EditNote.Edit6.Text;
   dm.AQR530cust_decl.AsString:=Form_EditNote.Edit7.Text;
   dm.AQR530.Post;
end;

procedure TForm_Main.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
if messagedlg('您确定要删除该条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
   with DM.ADOQuery1 do
   begin
     Close;
     SQL.Clear;
     sql.Add('select rkey64_ptr,quan_declare,cartons_no from data0530 where rkey529_ptr='+dm.ADS529RKEY.AsString);
     Open;
     First;
     while not Eof do//修改64表已报关数量和箱数
     begin
       with dm.ADOQuery2 do
       begin
         Close;
         SQL.Clear;
         sql.Add('update data0064 set rkey529_ptr=rkey529_ptr-');
         SQL.Add(IntToStr(dm.ADOQuery1.FieldValues['quan_declare']));
         SQL.Add(',cartons_no=cartons_no+');
         SQL.Add(IntToStr(dm.ADOQuery1.FieldValues['cartons_no']));
         SQL.Add('where rkey='+IntToStr(dm.ADOQuery1.FieldValues['rkey64_ptr']));
         ExecSQL;
       end;
       Next;
     end;
   end;
   with DM.ADOQuery1 do //先删除相关530记录
   begin
    Close;
    sql.Clear;
    SQL.Add('delete from data0530 where rkey529_ptr='+dm.ADS529RKEY.AsString);
    ExecSQL;
   end;
   with dm.ADOQuery1 do  //再删除主表
    begin
     close;
     sql.Clear;
     sql.Add('delete from data0529');
     sql.Add('where rkey='+dm.ADS529RKEY.AsString);
     ExecSQL;
    end;
   dm.ADOConnection1.CommitTrans;
   BitBtn3Click(Sender);
   showmessage('数据成功删除!!!');
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据不成功,请速与管理员联系!!!');
  end;
 end;
end;

procedure TForm_Main.N22Click(Sender: TObject);
begin
 try
  Form_EditNote:=TForm_EditNote.Create(Application);
  Form_EditNote.Button1.Enabled:=False;
  Form_EditNote.Edit1.Text:=dm.ADO530total_amount.AsString;
  Form_EditNote.Edit2.Text:=dm.ADO530weight.AsString;
  Form_EditNote.Edit3.Text:=DM.ADO530reference_number.Value;
  Form_EditNote.Edit4.Text:=dm.ADO530remark1.Value;
  Form_EditNote.Edit5.Text:=dm.ADO530remark2.Value;
  Form_EditNote.Edit7.Text:=dm.ADO530cust_decl.AsString;
  Form_EditNote.Edit6.Text:=dm.ADO530nweight.AsString;
  Form_EditNote.Edit2.ReadOnly:=True;
  Form_EditNote.Edit3.ReadOnly:=True;
  Form_EditNote.Edit4.ReadOnly:=True;
  Form_EditNote.Edit5.ReadOnly:=True;
  Form_EditNote.Edit6.ReadOnly:=True;
  Form_EditNote.Edit7.ReadOnly:=True;
  Form_EditNote.ShowModal;
 finally
   Form_EditNote.Free;
 end;
end;

procedure TForm_Main.N6Click(Sender: TObject);
var i : Integer;
begin
  i := DM.ADs529RKEY.Value;
  
with dm.ADOQuery1 do
begin
  Close;
  sql.Clear;
  sql.Add('update data0529 set tstatus=1,tdate=:date where rkey='+dm.ADS529RKEY.AsString);
  Parameters[0].Value:=common.getsystem_date(DM.ADOQuery2,0);
  ExecSQL;
  dm.ADS529.Close;
  dm.ADS529.Prepared;
  DM.ADS529.Open;
end;
  DM.ADS529.Locate('rkey',i,[]);
end;

procedure TForm_Main.N7Click(Sender: TObject);
var i : Integer;
begin
  if DM.ADS529TSTATUS.Value=1 then
  if MessageBox(Handle,'确定不经过报关审核(系统认为不需要报关,财务结案!)，直接财务终审吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO
  then exit;
    i := DM.ADs529RKEY.Value;
  with dm.ADOQuery1 do
   begin
    Close;
    sql.Clear;
    sql.Add('update data0529 set tstatus=2,audit_ptr='+user_ptr);
    SQL.Add('where rkey='+dm.ADS529RKEY.AsString);
    ExecSQL;
    dm.ADS529.Close;
    dm.ADS529.Prepared;
    DM.ADS529.Open;
   end;
    DM.ADS529.Locate('rkey',i,[]);
end;

procedure TForm_Main.N8Click(Sender: TObject);
var i : Integer;
begin
  i := DM.ADs529RKEY.Value;
  //ShowMessage(IntToStr(i));
with dm.ADOQuery1 do
begin
  Close;
  sql.Clear;
  sql.Add('update data0529 set tstatus=3,audit_ptr=null,final_ptr=null where rkey='+dm.ADS529RKEY.AsString);
  ExecSQL;
  dm.ADS529.Close;
  dm.ADS529.Prepared;
  DM.ADS529.Open;
end;
 DM.ADS529.Locate('rkey',i,[]);
end;

procedure TForm_Main.DBGrid1DblClick(Sender: TObject);
begin
 if (not dm.ADS529.IsEmpty) and ((StrToInt(vprev)=2) or (StrToInt(vprev)=4))and((DM.ADS529TSTATUS.Value=0)or(DM.ADS529TSTATUS.Value=3)) then N2Click(Sender);
end;

procedure TForm_Main.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;



procedure TForm_Main.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  dm.ADS529.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''
 else
  dm.ADS529.Filter := '';
end;

procedure TForm_Main.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dm.ADS529TSTATUS.Value = 3 then
   DBGrid1.Canvas.Font.Color := clred
  else
  if dm.ADS529TSTATUS.Value = 0 then
   DBGrid1.Canvas.Font.Color := clTeal
  else
  if dm.ADS529TSTATUS.Value = 1 then
   DBGrid1.Canvas.Font.Color := clGreen
  else
  if dm.ADS529TSTATUS.Value=4 then
   DBGrid1.Canvas.Font.Color:= clBlack
  else
  if dm.ADS529TSTATUS.Value=2 then
   DBGrid1.Canvas.Font.Color:= clHotLight;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Main.BitBtn2Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Form_Condition=nil then  Form_Condition:=TForm_Condition.Create(Application);
  if Form_Condition.ShowModal=mrok then
  begin
    dm.ADS529.Parameters[0].Value:=formatdatetime('YYYY/MM/DD',form_condition.DateTimePicker1.Date);
    dm.ADS529.Parameters[1].Value:=form_condition.DateTimePicker2.Date;
    for i:=1 to Form_Condition.sgrid1.RowCount-2 do
      if Form_Condition.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Form_Condition.sgrid1.Cells[2,i];
    dm.ADS529.SQL.Text:=sSql+Sqlstr+'order by data0529.shipadvice_no';
    dm.ADS529.Close;
    dm.ADS529.Open;
    DBGrid1.DataSource:=nil;
    DBGrid1.DataSource:=dm.DataSource1;
  end;
end;
procedure TForm_Main.BitBtn4Click(Sender: TObject);
begin
 Self.Edit1.Text:='';
end;

procedure TForm_Main.BitBtn5Click(Sender: TObject);
begin
 PopupMenu2.Popup(Mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm_Main.N13Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr529_2.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N17Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'Invoice529_2.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N23Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr529_2.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N28Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Invoice529_2.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N12Click(Sender: TObject);
begin
  Form_TotalPrint:=TForm_TotalPrint.Create(application);
  if vprev='3' then
  begin
    Form_TotalPrint.DBGrid1.Columns[6].Visible:=False;
    Form_TotalPrint.DBGrid1.Columns[7].Visible:=False;
  end;
  Form_TotalPrint.dtpk1.Date:=dm.ADS529.Parameters.ParamValues['dtpk2']-1;
  Form_TotalPrint.dtpk2.Date:=dm.ADS529.Parameters.ParamValues['dtpk2']-1;
  if not dm.ADS529.IsEmpty then
  Form_TotalPrint.ShowModal;
  Form_TotalPrint.Free;
end;

procedure TForm_Main.N14Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr529_1.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N24Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr529_1.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N18Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'Invoice529_1.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N33Click(Sender: TObject);
begin
  Form_TotalPrint:=TForm_TotalPrint.Create(application);
  Form_TotalPrint.ppReport1.Reset;
  Form_TotalPrint.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'TotalPack529.rtm';
  Form_TotalPrint.ppReport1.Template.LoadFromFile;
  Form_TotalPrint.ppReport1.SaveAsTemplate:=true;
  Form_TotalPrint.ppDesigner1.ShowModal;
  Form_TotalPrint.Free;
end;

procedure TForm_Main.N19Click(Sender: TObject);
begin
  Form_TotalPrint:=TForm_TotalPrint.Create(application);
  Form_TotalPrint.ppReport1.Reset;
  Form_TotalPrint.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'TotalInvoice529.rtm';
  Form_TotalPrint.ppReport1.Template.LoadFromFile;
  Form_TotalPrint.ppReport1.SaveAsTemplate:=true;
  Form_TotalPrint.ppDesigner1.ShowModal;
  Form_TotalPrint.Free;
end;

procedure TForm_Main.N29Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Invoice529_1.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N16Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr529_3.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N20Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr529_4.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N34Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'Invoice529_3.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N35Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'Invoice529_4.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N25Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr529_3.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N26Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr529_4.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N30Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Invoice529_3.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N31Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Invoice529_4.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;
procedure TForm_Main.PopupMenu3Popup(Sender: TObject);
begin
  if dm.ADS529.IsEmpty=True then
  begin
   N21.Enabled:=False;
   N22.Enabled:=False;
  end
  else
  begin
   N22.Enabled:=True;
   N21.Enabled:=((StrToInt(vprev)=2) or (StrToInt(vprev)=4))and((DM.ADS529TSTATUS.Value=0)or(DM.ADS529TSTATUS.Value=3));
  end;
end;

procedure TForm_Main.N36Click(Sender: TObject);
begin
  Form_TotalPrint:=TForm_TotalPrint.Create(application);
  Form_TotalPrint.ppReport1.Reset;
  Form_TotalPrint.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Contract529_SZ.rtm';
  Form_TotalPrint.ppReport1.Template.LoadFromFile;
  Form_TotalPrint.ppReport1.SaveAsTemplate:=true;
  Form_TotalPrint.ppDesigner1.ShowModal;
  Form_TotalPrint.Free;
end;

procedure TForm_Main.Excel1Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid2,self.Caption);
end;



procedure TForm_Main.N39Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr529_5.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N40Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Invoice529_5.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N37Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr529_5.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N38Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'Invoice529_5.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.BitBtn6Click(Sender: TObject);
begin
 if strtoint(vprev)=2 then
  begin
   messagedlg('对不起!您没有权限查看！',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
  Form_PackSelect:=TForm_PackSelect.Create(application);
  with Form_PackSelect.ADS64 do
  begin
   Close;
   Parameters[0].Value:=common.getsystem_date(dm.ADOQuery1,1);
   Parameters[1].Value:=common.getsystem_date(dm.ADOQuery1,1)+1;
   Open;
  end;
  Form_PackSelect.ShowModal;
 end;
end;

procedure TForm_Main.N41Click(Sender: TObject);
var i : Integer;
begin
  i := DM.ADs529RKEY.Value;
 with dm.ADOQuery1 do
 begin
  Close;
  sql.Clear;
  sql.Add('update data0529 set tstatus=0 where rkey='+dm.ADS529RKEY.AsString);
  ExecSQL;
  dm.ADS529.Close;
  dm.ADS529.Prepared;
  DM.ADS529.Open;
 end;
   DM.ADS529.Locate('rkey',i,[]);
end;

procedure TForm_Main.BitBtn7Click(Sender: TObject);
begin
 if strtoint(vprev)=2 then
  begin
   messagedlg('对不起!您没有权限查看！',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
  Form_Packdetail:=TForm_PackDetail.Create(application);
  with Form_PackDetail.ADS64 do
  begin
   Close;
   Parameters[0].Value:=common.getsystem_date(dm.ADOQuery1,1);
   Parameters[1].Value:=common.getsystem_date(dm.ADOQuery1,1);
   Open;
  end;
  Form_PackDetail.ShowModal;
 end;
end;

procedure TForm_Main.N44Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr529_6.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N45Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Invoice529_6.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N42Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr529_6.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N43Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'Invoice529_6.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N46Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'wzpr529_7.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N47Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.Aqwz529.close;
  Form_Report.Aqwz529.Parameters[0].Value:=dm.ADS529RKEY.Value;
  Form_Report.Aqwz529.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'Invoice529_7.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_Main.N48Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr529_7.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N49Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Invoice529_7.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TForm_Main.N50Click(Sender: TObject);
var i : Integer;
begin
  i := DM.ADs529RKEY.Value;
  with dm.ADOQuery1 do
  begin
   Close;
   sql.Clear;
   sql.Add('update data0529 set tstatus=4,final_ptr='+user_ptr);
   SQL.Add('where rkey='+dm.ADS529RKEY.AsString);
   ExecSQL;
   dm.ADS529.Close;
   dm.ADS529.Prepared;
   DM.ADS529.Open;
  end;
  DM.ADS529.Locate('rkey',i,[]);
end;

procedure TForm_Main.BitBtn8Click(Sender: TObject);
begin
 with dm.ADOQuery1 do
 begin
  Close;
  sql.Clear;
  sql.Add('update data0529');
  sql.Add('set curr_ptr=(select data0010.CURRENCY_PTR from data0010');
  sql.Add('where data0012.customer_ptr=data0010.rkey)');
  sql.Add('from data0529 inner join data0012');
  sql.Add('on data0529.ship_addr_ptr=data0012.rkey');
  ExecSQL;
 end;
 with dm.ADOQuery2 do
 begin
  Close;
  sql.Clear;
  sql.Add('update data0530');
  sql.Add('set cust_decl=(select data0530.quan_declare*Data0064.part_price');
  sql.Add('from data0064 where data0064.rkey=data0530.rkey64_ptr)');
  sql.Add('from data0530 inner join data0064');
  sql.Add('on data0530.rkey64_ptr=data0064.rkey');
  sql.Add('where data0064.rkey529_ptr>0');
  ExecSQL;
 end;
 ShowMessage('数据更新成功！');
end;

procedure TForm_Main.N51Click(Sender: TObject);
begin
  Form_TotalPrint:=TForm_TotalPrint.Create(application);
  Form_TotalPrint.ppReport1.Reset;
  Form_TotalPrint.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'Contract529.rtm';
  Form_TotalPrint.ppReport1.Template.LoadFromFile;
  Form_TotalPrint.ppReport1.SaveAsTemplate:=true;
  Form_TotalPrint.ppDesigner1.ShowModal;
  Form_TotalPrint.Free;
end;

procedure TForm_Main.N52Click(Sender: TObject);
begin
  Form_TotalPrint:=TForm_TotalPrint.Create(application);
  Form_TotalPrint.ppReport1.Reset;
  Form_TotalPrint.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'TotalPack529_In.rtm';
  Form_TotalPrint.ppReport1.Template.LoadFromFile;
  Form_TotalPrint.ppReport1.SaveAsTemplate:=true;
  Form_TotalPrint.ppDesigner1.ShowModal;
  Form_TotalPrint.Free;
end;

end.
