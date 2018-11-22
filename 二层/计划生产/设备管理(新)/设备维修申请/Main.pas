unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, ComCtrls, DBGrids,
  Mask, DBCtrlsEh, Menus;

type
  Tfrm_Main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitClose: TBitBtn;
    BitRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BitQuery: TBitBtn;
    BitFieldsVisable: TBitBtn;
    BitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox7: TCheckBox;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    UpDown1: TUpDown;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Edit8: TEdit;
    Label12: TLabel;
    Meno1: TMemo;
    Meno2: TMemo;
    Meno3: TMemo;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
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
    procedure BitCloseClick(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure BitFieldsVisableClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure PageControl1Change(Sender: TObject);
    procedure BitQueryClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtnClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
  private
    { Private declarations }
     PreColumn:TColumnEh;
     strStatusValue,ssql,sql_text:string;
     Log_USER_LOGIN_NAME:string;
     procedure AssigntoTab2();
     procedure item_click(sender: TObject);
  public
    
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation

uses damo,DB,common, QuerySet, AddMaintenance, employee, formGetUserRights,
  Frm_YS_u, Complaint, Recordt;

{$R *.dfm}

procedure Tfrm_Main.BitCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_Main.BitRefreshClick(Sender: TObject);
var
  rkey567:integer;
begin
  rkey567:=dm.ADS567RKEY.Value;
  dm.ADS567.Close;
  dm.ADS567.Prepared;
  dm.ADS567.Open;
  if rkey567>0 then
  dm.ADS567.Locate('rkey',rkey567,[]);
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin
 if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
{
 rkey73:='2551';
 user_ptr := '3054';
 vprev := '4'
 }
end;

procedure Tfrm_Main.item_click(sender: TObject);
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
  end
  else
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure Tfrm_Main.AssigntoTab2;
begin
  Meno1.Lines.Text := DM.ADS567failure_circs.Value;
  Edit3.Text := DM.ADS567disposal_date.AsString;
  Edit4.Text := DM.ADS567dispodalMan.Value;
  Edit5.Text := DM.ADS567complete_date.AsString;
  Edit6.Text := DM.ADS567maintain_empl.Value;
  Edit7.Text := DM.ADS567fail_type.Value;
  Meno2.Lines.Text := DM.ADS567maintain_text.Value;
  Edit8.Text := DM.ADS567vali_name.Value;
  Meno3.Lines.Text := DM.ADS567validate_appraise.Value;
end;

procedure Tfrm_Main.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  PreColumn := DBGridEh1.Columns[0];
  for i:=1 to DBGrideh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu1.Items.Add(item) ;
  end;

  sql_text:=DM.ADS567.CommandText;

  frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-7;
  frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
  DM.ADS567.CommandText := DM.ADS567.CommandText+' and (data0567.ent_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
  ') and (data0567.ent_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
  strStatusValue :=' and data0567.status in (0,1,3,6) ';

  DM.ADS567.Close;
  DM.ADs567.CommandText:=DM.ADS567.CommandText+strStatusValue ;
  DM.ADS567.Open;

  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS567.RecNo)+'/总记录数:'+ IntToStr(DM.ADS567.RecordCount);
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select EMPLOYEE_PTR,USER_FULL_NAME,USER_LOGIN_NAME from data0073 where  rkey='+rkey73;
    Open;
    user_ptr:=Fields[0].AsString;
    StatusBar1.Panels[1].Text:='用户名：'+trim(FieldValues['USER_FULL_NAME'])+' ('+trim(FieldValues['USER_LOGIN_NAME'])+')';
//    Log_USER_FULL_NAME:=FieldValues['USER_FULL_NAME'];
    Log_USER_LOGIN_NAME:=FieldValues['USER_LOGIN_NAME'];
    Close;
  end;
 // Self.AssigntoTab2();

  PageControl1.ActivePage := TabSheet1;
end;



procedure Tfrm_Main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.ADS567STATUS.Value = 2 then
     DBGridEh1.Canvas.Font.Color := clred
  else
   if dm.ADS567STATUS.Value = 1 then
     DBGridEh1.Canvas.Font.Color := clTeal //cllime
   else
   if dm.ADS567STATUS.Value = 0 then
     DBGridEh1.Canvas.Font.Color := clfuchsia
   else
    if dm.ADS567STATUS.Value = 3 then
     DBGridEh1.Canvas.Font.Color := clGreen;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS567.CommandText);
end;

procedure Tfrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (column.Title.SortMarker = smNoneEh) then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS567.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS567.IndexFieldNames:=Column.FieldName+' DESC';
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
  else
  edit1.SetFocus;
end;

procedure Tfrm_Main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure Tfrm_Main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS567.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_Main.BitFieldsVisableClick(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrm_Main.CheckBox1Click(Sender: TObject);
begin
  strStatusValue:='';
  if CheckBox1.Checked then
    strStatusValue:='0,';

  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'1,';

  if CheckBox3.Checked then
    strStatusValue:=strStatusValue+'2,';

  if CheckBox4.Checked then
    strStatusValue:=strStatusValue+'3,';

  if CheckBox5.Checked then
    strStatusValue:=strStatusValue+'4,';

  if CheckBox6.Checked then
    strStatusValue:=strStatusValue+'5,';

  if CheckBox7.Checked then
    strStatusValue:=strStatusValue+'6,';

  if  strStatusValue<>'' then
  begin                            //    去掉后面的一个","
    strStatusValue:=' and Data0567.status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')'+#13;
  end
  else
    strStatusValue := ' and Data0567.status in(9)'+#13;

  with DM.ADS567 do
  begin
    Close;
    CommandText := sql_text+strStatusValue+ssql+' and (data0567.ent_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
  ') and (data0567.ent_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
//       CommandText := sql_text+strStatusValue;
    Open;
  end;

end;

procedure Tfrm_Main.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  dbgrideh1.FrozenCols :=newvalue;
end;



procedure Tfrm_Main.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex=1) and not DM.ADs567.IsEmpty then
  begin
    DM.ADs568.Close;
    DM.ADs568.Parameters[0].Value:=DM.ADs567RKEY.Value;
    DM.ADs568.Open;
  end;
  Self.AssigntoTab2();
end;

procedure Tfrm_Main.BitQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS567.Close;
    dm.ADS567.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS567.CommandText := sql_text+strStatusValue+ssql+' and (data0567.ent_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0567.ent_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';;
    dm.ADS567.Open;
  end;

end;

procedure Tfrm_Main.BitBtnClick(Sender: TObject);
begin
  Frm_employee:=TFrm_employee.Create(Application);
  Frm_employee.ADO32.Open;
  Frm_employee.ShowModal;
end;

procedure Tfrm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    frm_AddMaintenance:=Tfrm_AddMaintenance.Create(Application);
    frm_AddMaintenance.v_status:=0;
    if frm_AddMaintenance.ShowModal=mrok then
    begin
      dm.ADS567.Close;
      dm.ADS567.Open;
      dm.ADS567.Locate('rkey',frm_AddMaintenance.rkey567,[]);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    frm_AddMaintenance.Free;
  end;
end;



procedure Tfrm_Main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    frm_AddMaintenance:=Tfrm_AddMaintenance.Create(Application);
    frm_AddMaintenance.v_status:=1;
    if frm_AddMaintenance.ShowModal=mrok then
    begin
      BitRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
     frm_AddMaintenance.Free;
  end;
end;

procedure Tfrm_Main.N3Click(Sender: TObject);
var
  recDay:TDate;
begin
   try
     DM.ADOConnection1.BeginTrans;
     DM.tmp.Close;
     DM.tmp.SQL.Text:='update data0567 set status=1,referring_date=getdate() where rkey='+DM.ADS567RKEY.AsString+' and status in (0,5)';
     if DM.tmp.ExecSQL<>0 then
     begin
       with DM.tmp do
       begin
         Close;
         SQL.Text :='select cast(getdate() as smalldatetime)';
         Open;
         recDay := FieldList[0].AsDateTime;
         Close;
         SQL.Text:='insert into DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                    +'values('+DM.ADS567RKEY.AsString+','+common.rkey73+','+'1'+','
                    +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',recDay))+')';
             // ShowMessage(DM.tmp.SQL.Text);
         DM.tmp.ExecSQL;
       end;
       with DM.tmp do
       begin
         Close;
         SQL.Text := 'declare @classid as int '+#13+
         'INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES(''你有新的'+dm.ADS567DEPT_NAME.AsString+'设备维修申请单'+#13+'维修单号：'+
         dm.ADS567NUMBER.AsString+''+#13+'设备编码为：'+dm.ADS567FASSET_CODE.AsString+ ''+#13+'设备名称为: '+dm.ADS567FASSET_NAME.AsString+
         ''+#13+'故障情况说明为:'+ DM.ADS567failure_circs.AsString+
         ''+#13+'故障程度为:'+ DM.ADS567failure_degree.AsString+
         ''+#13+'请对该设备进行维修受理'',GETDATE(),'+rkey73+')'+'select @classid=@@identity ' +#13+
         'INSERT INTO data0314(emp_ptr,d14_ptr) select User_ptr ,@classid   from DATA0834 where DeptCode= ' +
         quotedstr(DM.ADS567DEPT_CODE.AsString) + ' and warehouse_ptr=' + DM.ADS567WHOUSE_PTR.AsString;
         ExecSQL;
       end;
       DM.ADOConnection1.CommitTrans;
     end
     else
     begin
       DM.ADOConnection1.CommitTrans;
       showmessage('申请单状态发生改变而未能成功提交!');
     end;
   except
     on e:Exception do
     begin
       DM.ADOConnection1.RollbackTrans;
       ShowMessage('提交失败！'+#13#10+e.Message);
     end;
   end;
   BitRefreshClick(Sender);
end;

procedure Tfrm_Main.N4Click(Sender: TObject);
var
    vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if GetUserRights(Self,dm.ADOConnection1,vUsernameRkey,vEmployeeRkey,vUser_rights,'删除',Log_USER_LOGIN_NAME) then
  begin
    if (strtoint(vUser_rights)in [2,4])=False then
    begin
      messagedlg('对不起,您没有权限！',mtinformation,[mbok],0)  ;
      Exit ;
    end;
    if (DM.ADs567EMPL_PTR.AsInteger<> StrToInt(vEmployeeRkey ))and(vUser_rights='2')then
    begin
      messagedlg('你只能删除自己的申请单。',mtinformation,[mbok],0)  ;
      Exit ;
    end;
    try
      Screen.Cursor := crHourGlass;
      try
        DM.ADOConnection1.BeginTrans;
        with DM.tmp do
        begin
          Close;
          SQL.Text:='delete  data0841 where D567_ptr='+DM.ADs567rkey.AsString;
          ExecSQL;

          Close;
          SQL.Text:='delete  data0842 where Work_ptr='+DM.ADs567rkey.AsString;
          ExecSQL;

          Close;
          SQL.Text:='delete  data0567 where rkey='+DM.ADs567rkey.AsString;//+' and status in (0,5)' ;
               // ShowMessage(SQL.Text);

          if DM.tmp.ExecSQL<>1 then
          begin
            DM.ADOConnection1.CommitTrans;
            showmessage('删除数据失败,数据状态已发生变化...');
          end
          else
            DM.ADOConnection1.CommitTrans;
        end;

      except
        on e:Exception do
        begin
          ShowMessage('失败！'+#13#10+e.Message);
          DM.ADOConnection1.RollbackTrans;
        end;
      end;
      BitRefreshClick(Sender);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure Tfrm_Main.N5Click(Sender: TObject);
var
  DelTime:TDate;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  try

    if MessageBox(Handle,'确定取消提交此单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
    DM.ADOConnection1.BeginTrans;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='update data0567 set status=0,referring_date=null where rkey='+DM.ADS567rkey.AsString+' and status=1' ;
    if DM.tmp.ExecSQL<>0 then
    with  DM.tmp do            //在DATA0841表添加一行状态的记录。
    begin
      Close;
      SQL.Text :='select cast(getdate() as smalldatetime)';
      Open;
      DelTime := FieldList[0].AsDateTime;
      Close;
      SQL.Text:='insert into DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                  +'values('+DM.ADs567RKEY.AsString+','+rkey73+','+'0'+','
                  +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',DelTime))+')';
      ExecSQL;
      DM.ADOConnection1.CommitTrans;
    end
    else
    begin
      DM.ADOConnection1.CommitTrans;
      showmessage('取消提交此单失败,数据状态已发生变化...请刷新');
    end;
  except
    on e:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('提交失败！'+#13#10+e.Message);
    end;
  end;
  BitRefreshClick(Sender);
end;

procedure Tfrm_Main.N6Click(Sender: TObject);
var
  checkDay:TDate;
begin
  if (DM.ADS567fail_type.AsString='') or (DM.ADS567maintain_text.AsString='') or (DM.ADS567maintain_empl.AsString='') then
         showmessage('维修部还未将异常类别、维修记录、维修人员输入完整,不能进行验收!')
  else
  begin
    if DM.ADS567EMPL_PTR.Value<>StrToInt(user_ptr) then
    begin
      messagedlg('对不起!该维修申请单不是您申报的',mtinformation,[mbok],0);
      abort;
    end;
    with TFrm_YS.Create(nil) do
    try
      DM.tmp.Close;
      DM.tmp.SQL.Text :='select cast(getdate() as smalldatetime)';
      DM.tmp.Open;
      checkDay := DM.tmp.FieldList[0].AsDateTime;
      PDValiDate.Date := DM.tmp.FieldList[0].AsDateTime;
      EdtValMan.Text:= DM.ADS567EMPLOYEE_NAME.Value;
      EdtValMan.Tag:=DM.ADS567EMPL_PTR.Value;
      if showmodal=mrok then
      begin
        try
          DM.ADOConnection1.BeginTrans;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0567 set status=4,validate_date='''+FormatDateTime('yyyy-MM-dd H:mm:ss',PDValiDate.Date)+
                            ''',validate_emplptr='+inttostr(EdtValMan.tag)+
                            ',validate_appraise='+QuotedStr(CBAppr.Text)
                            +',validate_Description='+QuotedStr(Memo1.Text)
                            +'  where rkey='+DM.ADS567rkey.AsString+' and status=3' ;
          if DM.tmp.ExecSQL<>0 then
          with  DM.tmp do            //在DATA0841表添加一行状态的记录。
          begin
            Close;
            SQL.Text:='insert into DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                      +'values('+DM.ADS567RKEY.AsString+','+rkey73+','+'4'+','
                      +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',checkDay))
                      +')';

            ExecSQL;
            DM.ADOConnection1.CommitTrans;
          end
          else
          begin
            DM.ADOConnection1.CommitTrans;
            showmessage('验收此维修单失败,数据状态已发生变化...请刷新');
          end;
        except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            ShowMessage('提交失败！'+#13#10+e.Message);
          end;
        end;
        BitRefreshClick(Sender);
      end;
    finally
      free;
    end;
  end;
end;

procedure Tfrm_Main.N7Click(Sender: TObject);
var
  complaintDay:TDate;
begin
  frm_Complaint:=Tfrm_Complaint.Create(Application);
  if frm_Complaint.ShowModal=mrok then
  begin
    if frm_Complaint.Memo1.Lines.Text <> '' then
    begin
     with  DM.tmp do   //7　投诉
     begin
      DM.tmp.Close;
      DM.tmp.SQL.Text :='select cast(getdate() as smalldatetime)';
      DM.tmp.Open;
      complaintDay := DM.tmp.FieldList[0].AsDateTime;
      Close;
      SQL.Text:='insert into DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date,remark)'
            +'values('+DM.ADS567RKEY.AsString+','+rkey73+','+'7'+','
            +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',complaintDay))
            +','+QuotedStr(frm_Complaint.Memo1.Lines.Text)+')';
      //ShowMessage(DM.tmp.SQL.Text);
      ExecSQL;
     end;
    end;
  end;

end;

procedure Tfrm_Main.N8Click(Sender: TObject);
begin
  frm_Recordt:=Tfrm_Recordt.Create(Application);
  frm_Recordt.Caption:=(Sender as TMenuItem).Caption;

 // if frm_Recordt.ShowModal=mrok then
  with frm_Recordt do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:='select data0073.USER_FULL_NAME ,case data0841.Status_ptr when 0 then ''未提交'' when 1 then ''待受理'''+
     ' when 2 then ''已受理'' when 3 then ''已完工'' when 4 then ''已验收'' when 5 then ''被退回'' when 6 then ''已暂停'''+
     ' when 7 then ''投诉'' end as Status,data0841.Record_date,data0841.remark from DATA0841 join data0073 on DATA0841.User_ptr= data0073.rkey'+
     ' where Status_ptr<>7 and D567_ptr= ' + DM.ADS567RKEY.AsString;
    ADOQuery1.Open;
    DBGridEh1.Columns[0].Title.Caption := '用户';
    DBGridEh1.Columns[0].Width :=120;
    DBGridEh1.Columns[1].Title.Caption := '状态';
    DBGridEh1.Columns[1].Width :=80;
    DBGridEh1.Columns[2].Title.Caption := '日期';
    DBGridEh1.Columns[2].Width :=150;
    DBGridEh1.Columns[3].Title.Caption := '描述';
    DBGridEh1.Columns[3].Width :=200;
    ShowModal;
  end;
end;

procedure Tfrm_Main.N9Click(Sender: TObject);
begin
  frm_Recordt:=Tfrm_Recordt.Create(Application);
  frm_Recordt.Caption:=(Sender as TMenuItem).Caption;
  with frm_Recordt do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:='select data0073.USER_FULL_NAME ,case data0841.Status_ptr when 0 then ''未提交'' when 1 then ''待受理'''+
     ' when 2 then ''已受理'' when 3 then ''已完工'' when 4 then ''已验收'' when 5 then ''被退回'' when 6 then ''已暂停'''+
     ' when 7 then ''投诉'' end as Status,data0841.Record_date,data0841.remark from DATA0841 join data0073 on DATA0841.User_ptr= data0073.rkey'+
     ' where Status_ptr=7 and D567_ptr= ' + DM.ADS567RKEY.AsString;
    ADOQuery1.Open;
    DBGridEh1.Columns[0].Title.Caption := '用户';
    DBGridEh1.Columns[0].Width :=120;
    DBGridEh1.Columns[1].Title.Caption := '状态';
    DBGridEh1.Columns[1].Width :=80;
    DBGridEh1.Columns[2].Title.Caption := '日期';
    DBGridEh1.Columns[2].Width :=150;
    DBGridEh1.Columns[3].Title.Caption := '描述';
    DBGridEh1.Columns[3].Width :=200;
    ShowModal;
  end;
end;

procedure Tfrm_Main.N10Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin   //GetUserRights
  if GetUserRights(Self,DM.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'重置登陆用户名') then
  begin
    vprev:= vUser_rights;
    rkey73:=vUsernameRkey;
    user_ptr:=vEmployeeRkey;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select d3.USER_FULL_NAME,d3.USER_LOGIN_NAME,d3.EMPLOYEE_PTR,d5.EMPLOYEE_NAME,d5.EMPL_CODE '
          +' from data0073 as d3 left join data0005 d5 on d3.EMPLOYEE_PTR=d5.rkey where d3.rkey='+rkey73;
    DM.tmp.Open;
    StatusBar1.Panels[1].Text:='用户名：'+trim(DM.tmp.FieldValues['USER_FULL_NAME'])+' ('+trim(DM.tmp.FieldValues['USER_LOGIN_NAME'])+')';
    DM.tmp.Close;
    ShowMessage('你已重置当前程序的登陆用户名，操作完成后务必关闭！！！');
  end;

end;

procedure Tfrm_Main.PopupMenu2Popup(Sender: TObject);
begin
  if DM.ADS567.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //提交审批
    N4.Enabled:=false;    //删除
    n5.Enabled:=false;    //取消提交
    n6.Enabled:=false;    //验收
    N8.Enabled:=false;
    N7.Enabled:=false;    //投诉
    N9.Enabled :=False;
  end
  else
  begin
    n2.Enabled := ((dm.ADS567status.Value=0) or (dm.ADS567status.Value=5)) and(DM.ADS567EMPL_PTR.Value=StrToInt(user_ptr)) ;
    n3.Enabled := n2.Enabled ;
    N4.Enabled := (DM.ADS567STATUS.AsInteger in [0,5]);
    n5.Enabled := (dm.ADS567status.Value=1) and (dm.ADS567EMPL_PTR.Value =StrToInt(user_ptr));
    n6.Enabled := dm.ADS567status.Value=3;
//    N8.Enabled:=(dm.ADO567status.Value=3)and(DM.ADO567EMPL_PTR.Value=StrToInt(user_ptr));
    N7.Enabled := (DM.ADS567EMPL_PTR.Value=StrToInt(user_ptr));
    N8.Enabled :=True;
    N9.Enabled := True;
  end;
end;

end.
