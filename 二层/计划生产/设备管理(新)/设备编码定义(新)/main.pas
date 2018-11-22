unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls,common,DB, Menus,
  ComCtrls;

type
  Tfrm_Main = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    BitQuit: TBitBtn;
    BitRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BitQuery: TBitBtn;
    BitFieldsVisable: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
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
    N11: TMenuItem;
    StatusBar1: TStatusBar;
    procedure BitQuitClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitFieldsVisableClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitQueryClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    strStatusValue:string;
    strsql,sql_text:string;
    ssql :string;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation

uses damo, QuerySet,  MaintenanceLog, ChangeLog, addEquipment;

{$R *.dfm}

procedure Tfrm_Main.BitQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_Main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS417.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_Main.BitRefreshClick(Sender: TObject);
var
  rkey417:integer;
begin
  rkey417:=DM.ADS417RKEY.Value;
  dm.ADS417.Close;
  dm.ADS417.Prepared;
  dm.ADS417.Open;
  if rkey417>0 then
  dm.ADS417.Locate('rkey',rkey417,[]);
end;


procedure Tfrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS417.CommandText);
end;

procedure Tfrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker = smDownEh then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS417.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS417.IndexFieldNames:=Column.FieldName+' DESC';
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
  sql_text := DM.ADS417.CommandText;
  strsql:=DM.ADO417.SQL.Text;

  
  DM.ADS417.Close;
  strStatusValue:=' and Data0417.active_flag in (1)'+#13;
  DM.ADS417.CommandText := sql_text + strStatusValue;
  DM.ADS417.Open;
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS417.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS417.RecordCount);
end;

procedure Tfrm_Main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure Tfrm_Main.BitFieldsVisableClick(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrm_Main.CheckBox1Click(Sender: TObject);
begin
  strStatusValue:='';
  if CheckBox1.Checked then
    strStatusValue:='1,';

  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'2,';

  if CheckBox3.Checked then
    strStatusValue:=strStatusValue+'3,';

  if CheckBox4.Checked then
    strStatusValue:=strStatusValue+'4,';

  if CheckBox5.Checked then
    strStatusValue:=strStatusValue+'5,';

  if CheckBox6.Checked then
    strStatusValue:=strStatusValue+'6,';

  if CheckBox7.Checked then
    strStatusValue:=strStatusValue+'7,';

  if  strStatusValue<>'' then
  begin                            //    去掉后面的一个","
    strStatusValue:=' and Data0417.active_flag in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')'+#13;
  end
  else
    strStatusValue := ' and Data0417.active_flag in(9)'+#13;

  with DM.ADS417 do
  begin
    Close;
    CommandText := sql_text+strStatusValue+ssql;
    Open;
  end;
end;

procedure Tfrm_Main.BitQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS417.Close;
    dm.ADS417.CommandText:=sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql :=ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS417.CommandText:=sql_text+strStatusValue+ssql;
//  dm.ADS417.CommandText:=sql_text+ssql;
    dm.ADS417.Open;
  end;
end;

procedure Tfrm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Frm_addEquipment:=TFrm_addEquipment.Create(Application);
    Frm_addEquipment.strsqlAssign(strsql);
    Frm_addEquipment.v_status:=0;
    if Frm_addEquipment.ShowModal=mrok then
    begin
      dm.ADS417.Close;
      dm.ADS417.Open;
      dm.ADS417.Locate('rkey',dm.ADO417rkey.Value,[]);
      dm.ADO417.Close;
      ShowMsg('新增操作成功!',1);
    end;
  finally
    Frm_addEquipment.Free;
  end;
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConnection1) then
  begin
    showmsg('程序起动失败请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;

//  rkey73:='851';
//  user_ptr := '963';
//  vprev := '4';

end;

procedure Tfrm_Main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Frm_addEquipment:=TFrm_addEquipment.Create(Application);
    Frm_addEquipment.strsqlAssign(strsql);
    Frm_addEquipment.v_status:=1;
    if Frm_addEquipment.ShowModal=mrok then
    begin
      BitRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    Frm_addEquipment.Free;
  end;
end;

procedure Tfrm_Main.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Frm_addEquipment:=TFrm_addEquipment.Create(Application);
    Frm_addEquipment.strsqlAssign(strsql);
    Frm_addEquipment.v_status:=2;
    if Frm_addEquipment.ShowModal=mrok then
    begin
      BitRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    Frm_addEquipment.Free;
  end;
end;

procedure Tfrm_Main.N5Click(Sender: TObject);
begin
  Frm_addEquipment:=TFrm_addEquipment.Create(Application);
  Frm_addEquipment.v_status:=4;
  if Frm_addEquipment.ShowModal=mrok then
   begin
   
   end;
end;

procedure Tfrm_Main.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else  

  if MessageDlg('您确定要删除该设备代码吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
     with dm.tmp do
     begin
       close;
       sql.Text:='update data0417 set group_ptr=null where group_ptr='+quotedstr(IntToStr(dm.ADS417RKEY.Value));
       ExecSQL;
       Close;
       SQL.Text:='delete data0820 where rkey417 ='+quotedstr(IntToStr(dm.ADS417RKEY.Value));
       ExecSQL;
       close;
       sql.Text:='delete data0417 where rkey='+quotedstr(IntToStr(dm.ADS417RKEY.Value));
       
       if ExecSQL>0 then
       begin
         common.ShowMsg('删除操作成功！',1);
         self.BitRefreshClick(Sender);
       end;
     end;

    except
     on E: Exception do
     begin
       messagedlg(E.Message,mterror,[mbcancel],0);
     end;
    end;
  end;
end;

procedure Tfrm_Main.PopupMenu2Popup(Sender: TObject);
begin
  if DM.ADS417active_flag.Value='新进' then
  begin
    N1.Enabled := True;
    N2.Enabled := True;
    N3.Enabled := True;
    N4.Enabled := True;
    N5.Enabled := True;
    N6.Enabled := True;
    N7.Enabled := False;
    N8.Enabled := True;
    N9.Enabled := True;
    N10.Enabled := False;
    N11.Enabled := True;
  end
  else
  if Trim(DM.ADS417active_flag.Value)='仓库确认' then
  begin
    N1.Enabled := True;
    N2.Enabled := False;
    N3.Enabled := True;
    N4.Enabled := False;
    N5.Enabled := True;
    N6.Enabled := False;
    N7.Enabled := True;
    N8.Enabled := True;
    N9.Enabled := True;
    N10.Enabled := True;
    N11.Enabled := True;
  end
  else
  if (DM.ADS417active_flag.Value='安装完成') or (DM.ADS417active_flag.Value='验收合格') then
  begin
    N1.Enabled := True;
    N2.Enabled := False;
    N3.Enabled := True;
    N4.Enabled := False;
    N5.Enabled := True;
    N6.Enabled := False;
    N7.Enabled := False;
    N8.Enabled := True;
    N9.Enabled := True;
    N10.Enabled := True;
    N11.Enabled := True;
  end
  else
  if (DM.ADS417active_flag.Value='报废') or (DM.ADS417active_flag.Value='闲置')
    or (DM.ADS417active_flag.Value='调拨外出') then
  begin
    N1.Enabled := True;
    N2.Enabled := False;
    N3.Enabled := True;
    N4.Enabled := False;
    N5.Enabled := True;
    N6.Enabled := False;
    N7.Enabled := False;
    N8.Enabled := True;
    N9.Enabled := False;
    N10.Enabled := True;
    N11.Enabled := True;
  end;
end;

procedure Tfrm_Main.N6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  with DM.tmp do
  begin
    Close;
    SQL.Text:='select active_flag from  data0417  where rkey='+dm.ADS417RKEY.AsString;
    open;
  end;
  if DM.ADS417DATA0417active_flag.Value<>dm.tmp.FieldByName('active_flag').AsInteger then
  begin
    ShowMessage('此设备不是待确认状态,请刷新页面');
    Exit;
  end;

  try
    with DM.tmp do
    begin
      Close;
      SQL.Text:='update data0417 set confi_userptr='+common.user_ptr+
      ',active_flag=2,confi_date=getdate() where rkey='+dm.ADS417RKEY.AsString;
      ExecSQL;
    end;

    BitRefreshClick(Sender);
  except
    on E:Exception do
    begin
      MessageDlg(E.Message,mtError,[mbCancel],0);
    end;
  end;
end;

procedure Tfrm_Main.N7Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;

  with DM.tmp do
  begin
    Close;
    SQL.Text:='select active_flag from  data0417  where rkey='+dm.ADS417RKEY.AsString;
    open;
  end;
  if DM.ADS417DATA0417active_flag.Value<>dm.tmp.FieldByName('active_flag').AsInteger then
  begin
    ShowMessage('此设备不是待安装完成状态,请刷新页面');
    Exit;
  end;

  try
    with DM.tmp do
    begin
      Close;
       SQL.Text:='update data0417 set install_userptr='+common.user_ptr+
      ',active_flag=3,install_date=getdate() where rkey='+dm.ADS417RKEY.AsString;
      ExecSQL;
    end;
    BitRefreshClick(Sender);
  except
    on E:Exception do
    begin
      MessageDlg(E.Message,mtError,[mbCancel],0);
    end;
  end;
end;

procedure Tfrm_Main.N9Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if messagebox(Self.Handle,'你确定要将设备的状态改为闲置吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  with DM.tmp do
  begin
    Close;
    SQL.Text:='update data0417 set active_flag=7 where rkey='+dm.ADS417RKEY.AsString;
    ExecSQL;
  end;
  BitRefreshClick(Sender);
end;

procedure Tfrm_Main.N10Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if messagebox(Self.Handle,'你确定要将设备的状态改为新进吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit;
  try

    with DM.tmp do
    begin
      Close;
      SQL.Text:='update data0417 set active_flag=1,confi_userptr=null,confi_date=null,install_userptr=null,install_date=null where rkey='+dm.ADS417RKEY.AsString;
      ExecSQL;
    end;

    BitRefreshClick(Sender);
  except
    on E:Exception do
    begin
      
      MessageDlg(E.Message,mtError,[mbCancel],0);
    end;
  end;
end;

procedure Tfrm_Main.N8Click(Sender: TObject);
begin
  Frm_MaintenanceLog:=TFrm_MaintenanceLog.Create(Application);
  with Frm_MaintenanceLog.ADS567 do
  begin
    Close;
    Parameters[0].Value:=DM.ADS417RKEY.Value;
    Open;
  end;
  Frm_MaintenanceLog.ShowModal;
end;

procedure Tfrm_Main.N11Click(Sender: TObject);
begin
  Frm_ChangeLog:=TFrm_ChangeLog.Create(Application);
  with DM.ADS573 do
  begin
    Close;
    Parameters[0].Value:=DM.ADS417RKEY.Value;
    Open;
  end;
  Frm_ChangeLog.ShowModal;
end;

end.
