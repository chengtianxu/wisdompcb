unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGrids, Grids, DBGridEh, StdCtrls, Menus, Buttons,
  ComCtrls,DateUtils, DB, ADODB;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    PopupMenu2: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    BitBtn2: TBitBtn;
    PopupMenu3: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    BitBtn7: TBitBtn;
    N14: TMenuItem;
    N15: TMenuItem;
    BitBtn8: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
     rkey203:Integer;
     PreColumn: TColumnEh;
     sSql :string;
    FCondition:string;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses Demo,common,Detail, Unusual, UnDetail, QuerySet, auth_info,Report,
  Frm_Report, UDepname;

{$R *.dfm}

procedure TFrm_Main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := true;
      break;
    end;
  end else begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
//
//  dm.ADOConnection1.Open;
//  rkey73:= '3685';
//  user_ptr:='4330';
//vprev:= '1';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-MM-dd';
  LongDateFormat := 'yyyy-mm-dd HH:mm:ss';

end;

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TFrm_Main.BitBtn6Click(Sender: TObject);
begin
if (strtoint(vprev)<>4) then
 begin
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
 Exit;
 end;
 Application.CreateForm(TFrm_Unusual,Frm_Unusual);
 Frm_Unusual.ShowModal;
end;

procedure TFrm_Main.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
   
  Frm_Detail:=TFrm_Detail.Create(application);
  Frm_Detail.ade_flag:=1;//新增在线返工申请
  try
   DM.aq203.Parameters[0].Value:=null;
   DM.aq203.Open;
   dm.aq203.Filtered:=False;
   dm.aq203.Append;
   Frm_Detail.Memo1.ReadOnly:=True;
   Frm_Detail.Memo2.ReadOnly:=True;
   Frm_Detail.StringGrid2.Enabled:=False;
   Frm_Detail.ShowModal;
   rkey203:=dm.aq203RKEY.Value;
   dm.ADO203.Filtered:=true;
   dm.ADO203.Close;
   dm.ADO203.Open;
   dm.ADO203.Locate('rkey',rkey203,[]);
  finally
   Frm_Detail.Free;
  end;
 end;
end;

procedure TFrm_Main.N2Click(Sender: TObject);
var
rkey203:Integer;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
  try
   Frm_Detail:=TFrm_Detail.Create(application);
   Frm_Detail.ade_flag:=2;//编辑返工申请
   Frm_Detail.Memo1.ReadOnly:=True;
   Frm_Detail.Memo2.ReadOnly:=True;
   Frm_Detail.StringGrid2.Enabled:=False;
   dm.aq203.Close;
   dm.aq203.Parameters[0].Value:=dm.ADO203rkey.Value;
   dm.aq203.Open;
   dm.aq203.Edit;
   with Frm_Detail do
   begin
     BitBtn7.Enabled:=False;
     BitBtn8.Enabled:=False;
     Edit12.ReadOnly:=True;
   end;
   if Frm_Detail.ShowModal=mrok then
   begin
     rkey203:=dm.ADO203rkey.Value;
     dm.ADO203.Close;
     dm.ADO203.Open;
     dm.ADO203.Locate('rkey',rkey203,[]);
   end;
  finally
   Frm_Detail.Free;
  end;
 end;
end;

procedure TFrm_Main.N3Click(Sender: TObject);
begin
try
  Frm_Detail:=TFrm_Detail.Create(application);
  dm.aq203.Close;
  dm.aq203.Parameters[0].Value:=dm.ADO203rkey.Value;
  dm.aq203.Open;
  Frm_Detail.ade_flag:=3;//检查返工申请详细信息//////////////////////
  with Frm_Detail do
  begin
    BitBtn5.Enabled:=False;
    BitBtn7.Enabled:=False;
    BitBtn8.Enabled:=False;
    BitBtn1.Enabled:=False;
    Edit14.ReadOnly:=True;
    Edit12.ReadOnly:=True;
    Memo1.ReadOnly:=True;
    Memo2.ReadOnly:=True;
    Memo4.ReadOnly:=True;
    StringGrid1.Enabled:=False;
    StringGrid2.Enabled:=False;
  end;
  Frm_Detail.ShowModal;
finally
  Frm_Detail.Free;
end;
end;

procedure TFrm_Main.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
if messagedlg('您确定要删除该条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     sql.Add('update data0006 set wtype=0 where rkey in (select rkey06 from data0252 where rkey203='+dm.ADO203rkey.AsString+')');
     ExecSQL;
   end;
   with DM.ADOQuery1 do //删除相关252记录
   begin
    Close;
    sql.Clear;
    SQL.Add('delete from data0252 where rkey203='+dm.ADO203rkey.AsString);
    ExecSQL;
   end;
   with DM.ADOQuery1 do //删除相关239记录
   begin
    Close;
    sql.Clear;
    SQL.Add('delete from data0239 where rkey203='+dm.ADO203rkey.AsString);
    ExecSQL;
   end;
   with DM.ADOQuery1 do //删除相关260记录
   begin
    Close;
    sql.Clear;
    SQL.Add('delete from data0260 where rkey203='+dm.ADO203rkey.AsString);
    ExecSQL;
   end;
   with dm.ADOQuery1 do  //再删除主表
    begin
     close;
     sql.Clear;
     sql.Add('delete from data0203');
     sql.Add('where rkey='+dm.ADO203rkey.AsString);
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

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if not DM.ADO203.IsEmpty then
    i := DM.ADO203rkey.AsInteger
  else i:=0;
  DM.ADO203.Close;
  DM.ADO203.Open;
  DM.ADO203.Locate('rkey',i,[]);
end;


procedure TFrm_Main.N4Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=2) then
  begin
   messagedlg('对不起!您没有权限提交!',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
//  with dm.ADOQuery1 do
//  begin
//    Close;
//    sql.Clear;
//    sql.Add('select * from data0239 where rkey203='+dm.ADO203rkey.AsString);
//    Open;
//  end;
//  if dm.ADOQuery1.IsEmpty then
//  begin
//   messagedlg('还未确定返工流程不能提交!',mtinformation,[mbok],0);
//   Exit;
//  end;
  with dm.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from data0203 where rkey='+dm.ADO203rkey.AsString);
    Open;
  end;
  if (dm.ADOQuery1.fieldbyname('reason').Value='') or (dm.ADOQuery1.fieldbyname('scheme').Value= '') then
  begin
   messagedlg('请先工艺修改之后提交!',mtinformation,[mbok],0);
   Exit;
  end;
   
  dm.ADOConnection1.BeginTrans;
  try
   if dm.ADO203status.Value=3 then
   begin
     with dm.qrytmp do
     begin
       Close;
       SQL.Clear;
       SQL.Add('delete from data0260 where rkey203='+dm.ADO203rkey.AsString);
       ExecSQL
     end;
   end;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey34,name_no,seq_no from data0258 where v_ttype='+quotedstr(dm.ADO203v_ttype.AsString));
    SQL.Add('order by seq_no');
    Open;

   end;
   dm.ADOQuery1.First;
   while not dm.ADOQuery1.Eof do
   begin
     DM.ADO260.Close;
     dm.ADO260.Open;
     DM.ADO260.Append;
     if DM.ADOQuery1.FieldByName('seq_no').Value=1 then
     begin
      with DM.ADOQuery2 do
      begin
        Close;
        sql.clear;
        SQL.Add('declare @classid as int');
        SQL.Add('INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES(''返工申请需要您审核'',GETDATE(),'+rkey73+')'+'select @classid=@@identity');
        SQL.Add('INSERT INTO data0314(emp_ptr,d14_ptr)VALUES('+dm.ADOQuery1.fieldbyname('name_no').AsString+','+ '@classid'+')');
        ExecSQL;
      end;
      dm.ADO260rkey203.Value:=dm.ADO203rkey.Value;
      dm.ADO260dept_ptr.Value:=dm.ADOQuery1.fieldbyname('rkey34').Value;
      dm.ADO260seq_no.Value:=dm.ADOQuery1.fieldbyname('seq_no').Value;
      DM.ADO260Information.Value:=DM.ADOQuery1.fieldbyname('name_no').value;
      dm.ADO260auth_flag.Value:=True;
     end
     else
     begin
      dm.ADO260rkey203.Value:=dm.ADO203rkey.Value;
      dm.ADO260dept_ptr.Value:=dm.ADOQuery1.fieldbyname('rkey34').Value;
      dm.ADO260seq_no.Value:=dm.ADOQuery1.fieldbyname('seq_no').Value;
      DM.ADO260Information.Value:=DM.ADOQuery1.fieldbyname('name_no').Value;
      dm.ADO260auth_flag.Value:=False;
     end;
     dm.ADO260.Post;
     DM.ADOQuery1.Next;
   end;
   with dm.qrytmp do
   begin
     Close;
     SQL.Clear;
     sql.Add('update data0203 set status=1,submit=getdate() where rkey='+dm.ADO203rkey.AsString);
     ExecSQL;
   end;
   dm.ADOConnection1.CommitTrans;
   ShowMessage('提交成功!');

   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey34,name_no,seq_no from data0258 where v_ttype='+quotedstr(dm.ADO203v_ttype.AsString));
    SQL.Add('order by seq_no');
    Open;
   end;
   dm.ADOQuery1.First;
   if DM.ADOQuery1.FieldByName('seq_no').Value=1 then
   begin
    with dm.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select SUPLFEDSHIP,SUPLFEDMAT,SUPLFEDMISC from data0192';
      Open;
    end;
    if Trim(dm.tmp.FieldByName('SUPLFEDSHIP').AsString) <> '' then
    begin
      DM.tmp2.SQL.Clear;
      DM.tmp2.Close;
      DM.tmp2.SQL.Text:='SELECT dbo.Data0005.PHONE, dbo.Data0073.RKEY, dbo.Data0005.EMPLOYEE_NAME '+
      'FROM dbo.Data0005 INNER JOIN '+
      'dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR where dbo.Data0073.RKEY= '+ dm.ADOQuery1.fieldbyname('name_no').AsString;
      DM.tmp2.Open;
      DM.tmp3.SQL.Clear;
      DM.tmp3.Close;
      DM.tmp3.SQL.Text:='SELECT EMPLOYEE_NAME FROM Data0005 WHERE RKEY='+ user_ptr;
      DM.tmp3.Open;

      with dm.tmp1 do
      begin
        Close;
        SQL.Text:='insert ['+dm.tmp.FieldValues['SUPLFEDSHIP']+'].'+dm.tmp.FieldValues['SUPLFEDMAT']+'.dbo.'+dm.tmp.FieldValues['SUPLFEDMISC']+
                  '(phonenumber,messagecontent,sendername,companyid) '+
                  'values (:phonenumber,:messagecontent,:sendername,9)';
        if DM.tmp2.FieldByName('PHONE').Value<>Null then
        begin
          Parameters[0].Value:=DM.tmp2.FieldValues['PHONE'] ;
          Parameters[1].Value:='有返工申请需要您审核';
          Parameters[2].Value:=DM.tmp3.FieldValues['EMPLOYEE_NAME'] ;
          ExecSQL;
         // ShowMessage('手机短信已发出');
        end;
      end;
    end;
   end;
   BitBtn3Click(Sender);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
     exit;
    end;
  end;
 end;
end;

procedure TFrm_Main.N5Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有权限提交!',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
  with dm.qrytmp do
  begin
   Close;
   SQL.Clear;
   SQL.Add('select top 1 * from data0260 where rkey203='+dm.ADO203rkey.AsString);
   SQL.Add('order by seq_no');
   Open;
  end;
  if dm.qrytmp.FieldByName('user_ptr').Value>0 then
  begin
   messagedlg('对不起!此返工申请已有人审核不能再取消提交!',mtinformation,[mbok],0);
   exit;
  end;
  dm.ADOConnection1.BeginTrans;
  try
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('delete from data0260 where rkey203='+dm.ADO203rkey.AsString);
    ExecSQL;
   end;
   with dm.qrytmp do
   begin
     Close;
     SQL.Clear;
     sql.Add('update data0203 set status=0 where rkey='+dm.ADO203rkey.AsString);
     ExecSQL;
   end;
   dm.ADOConnection1.CommitTrans;
   ShowMessage('取消提交成功!');
   BitBtn3Click(Sender);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
     exit;
    end;
  end;
 end;
end;

procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_Main.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
  DateTimePicker1.Date:=getsystem_date(dm.adoquery1,1)-15;
  DateTimePicker2.Date:=getsystem_date(dm.adoquery1,1)+1;
  self.DateTimePicker1Change(Sender);
  PreColumn := DBGridEh1.Columns[0];
  FCondition:='and (1=1)';

  sSql:=dm.ADO203.CommandText+FCondition ;
  for i:=1 to DBGrideh1.Columns.Count do
   begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
   end;

   if StrToInt(vprev)<>4 then
   BitBtn6.Visible:=False
   else
   BitBtn6.Visible:=True;
end;

procedure TFrm_Main.DateTimePicker1Change(Sender: TObject);
begin
  WITH dm.ADO203 do
  begin
    close;
    parameters.ParamByName('vdate1').Value :=datetimepicker1.Date ;
    parameters.ParamByName('vdate2').Value :=datetimepicker2.Date ;
    Prepared;
    open;
  end;
end;


procedure TFrm_Main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.ADO203status.value=4 then
  DBGrideh1.Canvas.Font.Color :=clGray;
  if dm.ADO203status.value=3 then
  DBGrideh1.Canvas.Font.Color := clRed;
  if dm.ADO203status.Value=2 then
  DBGrideh1.Canvas.Font.Color := clBlue;
  if dm.ADO203status.Value=1 then
  DBGrideh1.Canvas.Font.Color :=clOlive;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADO203.CommandText);
end;

procedure TFrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADO203.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADO203.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TFrm_Main.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Form_Condition=nil then  Form_Condition:=TForm_Condition.Create(Application);
  if Form_Condition.ShowModal=mrok then
  begin
    dm.ADO203.Close;
    dm.ADO203.Parameters[0].Value:=formatdatetime('YYYY/MM/DD',form_condition.DateTimePicker1.Date);
    dm.ADO203.Parameters[1].Value:=form_condition.DateTimePicker2.Date;
    for i:=1 to Form_Condition.sgrid1.RowCount-2 do
      if Form_Condition.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Form_Condition.sgrid1.Cells[2,i];
    dm.ADO203.CommandText:=sSql+Sqlstr+'order by data0203.return_code';
   
    dm.ADO203.Open;
    DBGridEh1.DataSource:=nil;
    DBGridEh1.DataSource:=dm.DataSource1;
  end;
end;

procedure TFrm_Main.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADO203.IsEmpty then
 begin
   n1.Enabled := true;
   n2.Enabled := false;
   n3.Enabled := false;
   n7.Enabled := false;
   n4.Enabled := false;
   n5.Enabled := false;
   N10.Enabled:=False;
   N13.Enabled:=False;
   N14.Enabled:=False;
   N15.Enabled:=False;
 end
 else
 begin
   N1.Enabled :=((StrToInt(vprev)=2) or (StrToInt(vprev)=4));
   n2.Enabled :=((StrToInt(vprev)=2) or (StrToInt(vprev)=4))and((dm.ADO203STATUS.Value=0)or(dm.ADO203STATUS.Value=3));
   n3.Enabled := True;
   n7.Enabled := n2.Enabled;
   n4.Enabled := ((StrToInt(vprev)=3) or (StrToInt(vprev)=4))and((dm.ADO203STATUS.Value=0)or(dm.ADO203STATUS.Value=3));
   n5.Enabled := ((StrToInt(vprev)=2) or (StrToInt(vprev)=4))and(dm.ADO203STATUS.Value=1);
   N10.Enabled:=N4.Enabled;
   N13.Enabled:=(dm.ADO203status.Value=2);
   N14.Enabled:=((StrToInt(vprev)=3) or (StrToInt(vprev)=4))and(dm.ADO203STATUS.Value=0);
   N15.Enabled:=((StrToInt(vprev)=1) or (StrToInt(vprev)=4))and (DM.ADO203status.Value=2) ;
   
 end;
end;

procedure TFrm_Main.N8Click(Sender: TObject);
begin
 application.CreateForm(tform_authinfo,form_authinfo);
 dm.ads260.Open;
 Form_authinfo.ShowModal;
 dm.ads260.Close;
 form_authinfo.Free;
end;

procedure TFrm_Main.N10Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=2) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end
 else
 begin
  try
   Frm_Detail:=TFrm_Detail.Create(application);
   Frm_Detail.ade_flag:=4;//工艺编辑返工申请
   dm.aq203.Close;
   dm.aq203.Parameters[0].Value:=dm.ADO203rkey.Value;
   dm.aq203.Open;
   dm.aq203.Edit;
   with Frm_Detail do
   begin
     BitBtn7.Enabled:=False;
     BitBtn8.Enabled:=False;
     Edit12.ReadOnly:=True;
   end;
   if Frm_Detail.ShowModal=mrok then
   begin
     rkey203:=dm.ADO203rkey.Value;
     dm.ADO203.Close;
     dm.ADO203.Open;
     dm.ADO203.Locate('rkey',rkey203,[]);
   end;
  finally
   Frm_Detail.Free;
  end;
 end;
end;

procedure TFrm_Main.N13Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.aqwz203.close;
  Form_Report.aqwz203.Parameters[0].Value:=dm.ADO203RKEY.Value;
  Form_Report.aqwz203.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr252.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TFrm_Main.N11Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  'wzpr252.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=true;
  Form_Report.ppDesigner1.ShowModal;
  Form_Report.Free;
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
begin
popupmenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_Main.BitBtn7Click(Sender: TObject);
begin
  if DM.ADO203.IsEmpty then exit;
  Export_dbGridEH_to_Excel(DBGridEh1,'返工申请列表')
end;

procedure TFrm_Main.N14Click(Sender: TObject);
var     str:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=2) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;
 dm.tmp1.Close;
 dm.tmp1.SQL.Text:='SELECT  USER_FULL_NAME  FROM data0073 WHERE RKEY= '+rkey73;
 DM.tmp1.Open;
if messagedlg('退回操作是不可逆操作,你确定吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 str := InputBox('退回原因','','');
 if trim(str)<>'' then
 begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='UPDATE DATA0203 SET status=3, Return_sm= '+ QuotedStr(dm.tmp1.FieldByName('USER_FULL_NAME') .Value+' / '+str) +' where rkey= '+ DM.ADO203rkey.AsString;
  DM.tmp.ExecSQL;
 end
 else
 messagedlg('退回原因为空，退回操作不成',mtinformation,[mbok],0);
end;
 BitBtn3Click(Sender);
end;

procedure TFrm_Main.DBGridEh1DblClick(Sender: TObject);
begin
 DM.tmp.Close;
 DM.tmp.SQL.Text:='SELECT rkey,Return_sm FROM DATA0203 WHERE rkey= '+dm.ADO203rkey.AsString;
 DM.tmp.Open;
 if (DM.tmp.FieldByName('Return_sm') .Value =null) then Exit;
 ShowMessage('退回人员/退回原因:'+DM.tmp.FieldByName('Return_sm') .Value);
end;

procedure TFrm_Main.N15Click(Sender: TObject);
begin
  if (strtoint(vprev)=2) or (strtoint(vprev)=3) then
 begin
  ShowMessage('您没有此功能权限');
  exit;
 end;
 if messagedlg('是否品质通过?',mtconfirmation,[mbyes,mbno],0)<>mryes then Exit;
 DM.tmp.Close;
 DM.tmp.SQL.Text:='SELECT dbo.Data0034.DEPT_NAME, dbo.Data0073.RKEY FROM dbo.Data0034 INNER JOIN '+
   'dbo.Data0005 ON dbo.Data0034.RKEY = dbo.Data0005.EMPLOYEE_ID INNER JOIN '+
   'dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR AND '+
   'dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR WHERE (dbo.Data0073.RKEY = '+rkey73+' ) AND (dbo.Data0034.DEPT_NAME LIKE '+QuotedStr('%品质%')+')';

 DM.tmp.Open;
 if dm.tmp.IsEmpty then
 begin
  ShowMessage('您没有此功能权限');
  exit;
 end;

 DM.tmp.Close;
 DM.tmp.SQL.Text:='update data0006 set wtype=3,PROD_STATUS=3 from data0006 ' +
      'where rkey in (select rkey06 from data0252 where rkey203= '+dm.ADO203rkey.AsString+')';
 DM.tmp.ExecSQL;

 DM.tmp.Close;
 DM.tmp.SQL.Text:='UPDATE Data0203 SET status=4 WHERE RKEY= '+dm.ADO203rkey.AsString;
 DM.tmp.ExecSQL;
 BitBtn3Click(Sender);
end;

procedure TFrm_Main.BitBtn9Click(Sender: TObject);
begin
// form1:=TForm1.Create(Application);
// Form1.ShowModal;
// form1.Free;
end;

procedure TFrm_Main.BitBtn8Click(Sender: TObject);
begin
 ShowMessage(' 权限说明:1权限:只读  1权限+品质部:确认返工产品合格  3权限:工艺修改  4权限:最高权限,建审批流程');
end;

end.
