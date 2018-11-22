unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, Buttons, ExtCtrls, common, AddMain,DB, ADODB,
  Menus, ComCtrls, DateUtils,  AppEvnts, ToolWin;     //  RepFrm,

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    edt_1: TEdit;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3_Audit: TMenuItem;
    N4: TMenuItem;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    N6_Cancel: TMenuItem;
    N5: TMenuItem;
    N7_MultiAudit: TMenuItem;
    N8_MultiCancel: TMenuItem;
    N3: TMenuItem;
    N_Copy: TMenuItem;
    RadioGroup1: TRadioGroup;
    BitBtn8: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N3_AuditClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure edt_1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure EXCEL2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N6_CancelClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7_MultiAuditClick(Sender: TObject);
    procedure N8_MultiCancelClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure N_CopyClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    StartSQL, startFilter: string;
    //procedure NewGridWnd (var Message : TMessage);
  public
    rkey05   : Integer;
    User_Name:string;
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses DM, QFrm, ProWorkTotal, WorkdeptInfo, WorkEmpInfo, WorkpaceInfo,
  UpdateWorkHouse;

{$R *.dfm}

procedure TFrmMain.BitBtn5Click(Sender: TObject);
begin

  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  damo.Tag := 0;
  AddFrmMain := TAddFrmMain.Create(Application);
  AddFrmMain.ShowModal;

  if not damo.qry72s.IsEmpty then
   begin
    damo.qry72.Close;
    damo.qry72.Open;
    damo.qry72.Locate('rkey',damo.qry72sRKEY.Value, []);
    damo.qry73.Close;
    damo.qry73.Parameters[0].Value := damo.qry72sRKEY.Value;
    damo.qry73.Open;
   end;

  damo.qry72s.Close;
  damo.qry73s.Close;

  AddFrmMain.Free;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
//   rkey73 := '190';
//  vprev := '4';
//  damo.ADOConnection1.Open;

  if not App_init_2(damo.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;


 StartSQL := damo.qry72.SQL.Text;
  
  {OldGridWnd := DBGridEh1.WindowProc;
  DBGridEh1.WindowProc := NewGridWnd;
 // damo.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=system83032678;Persist Security Info=True;User ID=sa;Initial Catalog=demo2;Data Source=172.18.12.2';
  damo.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb_wlg;Data Source=172.18.12.2;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=LXL-PC;Use Encryption for Data=False;Tag with column collation when possible=False';
  damo.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb_wlg;Data Source=172.18.12.2';
   {}


  with damo.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select data0005.rkey, employee_name from data0005 inner join data0073 '
       + 'on data0005.rkey=data0073.employee_ptr where data0073.rkey=' + rkey73;
    open;
    rkey05    := FieldValues['rkey'];
    User_Name := FieldValues['employee_name'];
  end;

  Caption := application.Title;

end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  damo.qry73.Close;
  damo.qry73.Parameters[0].Value := damo.qry72RKEY.Value;
  damo.qry73.Open;
end;

//删除
procedure TFrmMain.N1Click(Sender: TObject);
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
//  with damo.qryTemp do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Text := 'select rkey,EMPLOYEE_PTR from data0073 where rkey= ' + common.rkey73;
//    Open;
//    if FieldByName('EMPLOYEE_PTR').AsInteger <> damo.qry72ENT_USERPTR.Value then
//    begin
//      ShowMessage('对不起，您只能对您自己录入的记录进行操作！');
//      Exit;
//    end;
//  end;
  if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  with damo.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'delete from wzcp0072 where rkey='+inttostr(damo.qry72rkey.Value);
    ExecSQL;
  end;
  BitBtn2.Click;
end;

//审核
procedure TFrmMain.N3_AuditClick(Sender: TObject);
var
  i : Integer;
begin                        //菜单项：审核
  if strtoint(vprev) < 3 then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;

//  if  damo.qry72status.AsInteger=1 then
//  begin
//    messagebox(Self.Handle,'状态已经是已审核！','',MB_ok+MB_iconinformation);
//  end;

  i := damo.qry72rkey.Value;
  with damo.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'update wzcp0072 set auth_usreptr= ' + IntToStr(rkey05)
      + ', auth_date=CONVERT(varchar(100) , getdate(), 23)'
      + ', status = 1 '
      + ' where rkey='+inttostr(damo.qry72rkey.Value);
    ExecSQL;
  end;
  damo.qry72.Close;
  damo.qry72.Open;
  damo.qry72.Locate('rkey', i, []);
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
var
  N_MultiAudit,N_MultiCancel:Boolean;
  BM:Pointer;
  i:Integer;
begin
  if DBGridEh1.SelectedRows.Count<=1 then
  begin
    if (damo.qry72.FieldByName('status').AsInteger <> 0) and (damo.qry72.FieldByName('status').AsInteger <> 2) then
    begin
      N1.Enabled := False;
      N2.Enabled := False;
      N3_Audit.Enabled := False;
      N6_Cancel.Enabled := True;
    end
    else
    begin
      N1.Enabled := True;
      N2.Enabled := True;
      N3_Audit.Enabled := True;
      N6_Cancel.Enabled := False;
    end;
    N7_MultiAudit.Enabled := False;          //在单行选择的时候，多行审核和多行取消审核按钮都是灰
    N8_MultiCancel.Enabled := False;
  end
  else
  begin
    with DBGridEh1 do
    try
      Screen.Cursor := crHourGlass;
      with   damo.qry72   do
      begin
        DisableControls ;
        N_MultiAudit   :=True;
        N_MultiCancel  :=True;
        BM:=GetBookmark;
        for   i:=   SelectedRows.Count   -   1   downto   0   do
        begin
          GotoBookmark(pointer(SelectedRows.Items[i]));
          if FieldByName('status').AsInteger=0 then    // 未审核
          begin
            N_MultiCancel:=False;
          end
          else
          if FieldByName('status').AsInteger=1 then    // 已审核
          begin
            N_MultiAudit:=False;
          end
          else
          if FieldByName('status').AsInteger=2 then    // 已取消
          begin
            N_MultiCancel:=False;
          end
        end;
        N7_MultiAudit.Enabled:=N_MultiAudit;
        N8_MultiCancel.Enabled:=N_MultiCancel;
        N3_Audit.Enabled  := False;                    //在多选择的时候，审核和取消审核按钮都是灰
        N6_Cancel.Enabled := False;
      end;
    finally
      damo.qry72.GotoBookmark(BM);  // 重新定位到书签
      damo.qry72.FreeBookmark(bm ); //释放书签。
      damo.qry72.EnableControls;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmMain.N2Click(Sender: TObject);
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
//  with damo.qryTemp do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Text := 'select rkey from data0073 where employee_ptr= ' + IntToStr(damo.qry72rkey05.value);
//    Open;
//    if FieldByName('rkey').AsString <> rkey73 then
//    begin
//      ShowMessage('对不起，您只能对您自己录入的记录进行操作！');
//      Exit;
//    end;
//  end;
  damo.Tag := 1 ;
  AddFrmMain := TAddFrmMain.Create(Application);
  if AddFrmMain.ShowModal=mrok then
   begin
     BitBtn2Click(sender);
   end;
  AddFrmMain.Free;
end;

procedure TFrmMain.edt_1Change(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
  startFilter := DBGridEh1.DataSource.DataSet.Filter;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  damo.qry72.Close;
  damo.qry72.SQL.Text := StartSQL  + ' and work_date >= '
    + QuotedStr(DateToStr(frmQ.DateTimePicker1.Date))
    + ' and work_date <= ' + QuotedStr(DateToStr(frmQ.DateTimePicker2.Date))
    + ' order by ent_date desc ';
  damo.qry72.Open;
  damo.qry73.Close;
  damo.qry73.Parameters[0].Value := damo.qry72RKEY.Value;
  damo.qry73.Open;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry72.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry72.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  i: Integer;
begin
  i := damo.qry72rkey.Value;
  damo.qry72.Close;
  damo.qry72.Open;
  damo.qry72.Locate('rkey',i, []);
  damo.qry73.Close;
  damo.qry73.Parameters[0].Value := damo.qry72RKEY.Value;
  damo.qry73.Open;
end;

procedure TFrmMain.EXCEL1Click(Sender: TObject);
begin
  if (strtoint(vprev) <> 2) and (strtoint(vprev) <> 4) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  common.Export_dbGridEH_to_Excel(DBGridEh1, '生产总工时');
end;

procedure TFrmMain.EXCEL2Click(Sender: TObject);
begin
  if (strtoint(vprev) <> 2) and (strtoint(vprev) <> 4) then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  common.Export_dbGridEH_to_Excel(DBGridEh2, '生产工时明细');
end;

procedure TFrmMain.BitBtn4Click(Sender: TObject);
begin
  FrmProWorkTotal := TFrmProWorkTotal.Create(Application);
  FrmProWorkTotal.ShowModal;
  FrmProWorkTotal.Free;
end;

procedure TFrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 // inherited;
  with  (Sender as TDBGridEh)do
  begin                      //   or (State=[gdSelected,gdFocused] )
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
 { with DBGridEh1 do     //  or (State=[gdSelected,gdFocused])
  begin
  if ((State = [gdSelected]) ) then
  begin
 //   Canvas.Font.Color :=ClYellow;
    Canvas.Brush.Color :=clInactiveCaption;  //   ClNavy
  end
  else
  begin
  if damo.qry72.RecNo mod 2 <> 0 then {判断当前数据是奇数还是偶数行}
    Canvas.brush.Color := $00FFC4C4//;ClWhite {如果是奇数行，DBGrid背景以白色显示}
//  else
//    Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
//  end;
 // DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
//  end;}
end;

procedure TFrmMain.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin                      //   or (State=[gdSelected,gdFocused] )
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
//  inherited;
//  with DBGridEh2 do
//  begin
//  if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
//  begin
//    Canvas.Font.Color :=ClYellow;
//    Canvas.Brush.Color :=ClNavy;
//  end
//  else
//  begin
//  if damo.qry73.RecNo mod 2 <> 0 then {判断当前数据是奇数还是偶数行}
//    Canvas.brush.Color :=ClWhite {如果是奇数行，DBGrid背景以白色显示}
//  else
//    Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
//  end;
//  DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
//  end;
  
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
var
  i: integer;
begin
  if frmQ=nil then  frmQ:=TfrmQ.Create(Application);
  if frmQ.ShowModal=mrok then
  begin
    with damo.qry72 do
    begin
      Close;
      SQL.Text := self.StartSQL + #13;
      for i := 1 to frmQ.SGrid1.RowCount - 2 do
        SQL.Text := SQL.Text + frmQ.SGrid1.Cells[2,i]+#13;
      SQL.Text := SQL.Text + ' order by ent_date desc ';
      open;
    end;
  end;
end;

procedure TFrmMain.BitBtn8Click(Sender: TObject);
begin
  FrmWorPace := TFrmWorPace.Create(Application);
  FrmWorPace.ShowModal;
  FrmWorPace.Free;
end;

procedure TFrmMain.BitBtn6Click(Sender: TObject);
begin
  FrmWorDept := TFrmWorDept.Create(Application);
  FrmWorDept.ShowModal;
  FrmWorDept.Free;
end;

procedure TFrmMain.BitBtn7Click(Sender: TObject);
begin
  FrmWorkEmp := TFrmWorkEmp.Create(Application);
  FrmWorkEmp.ShowModal;
  FrmWorkEmp.Free;
end;

procedure TFrmMain.N6_CancelClick(Sender: TObject);
var
   i: Integer;
begin           //菜单项：取消审核
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您的权限不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;

  i := damo.qry72rkey.Value;

  with damo.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select Top 1 ACTUAL_END_DATE from Data0451 order by RKEY desc';
    Open;

    if damo.qry72WORK_DATE.AsDateTime < FieldByName('ACTUAL_END_DATE').AsDateTime then
    begin
      ShowMessage('该期间工时已核算成本，取消失败！');
      Exit;
    end;
  end;

  with damo.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'update wzcp0072 set status = 2 '
      + ' where rkey='+inttostr(damo.qry72rkey.Value);
    ExecSQL;
  end;
  damo.qry72.Close;
  damo.qry72.Open;
  damo.qry72.Locate('rkey', i, []);
end;

procedure TFrmMain.N5Click(Sender: TObject);
begin
  damo.Tag := 2 ;
  AddFrmMain := TAddFrmMain.Create(Application);
  AddFrmMain.ShowModal;
  AddFrmMain.Free;
end;

procedure TFrmMain.N7_MultiAuditClick(Sender: TObject);
var
  i: Integer;
  BM:Pointer;
begin                         //菜单项：全部审核
  if strtoint(vprev) < 3 then
  begin
    messagedlg('对不起! 您的权限（读银）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if DBGridEh1.SelectedRows.Count<=1 then
  begin
    ShowMessage('请按Shift键选择多行！');
    Exit;
  end;

  if MessageBox(Handle,'确定要审核当前选择的记录吗?','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON2)=IDNO	then
    exit;
  with  DBGridEh1  do
  if   SelectedRows.Count > 1 then  //如果用户选择的行数大于1，即多行。
  begin
    bm:= DataSource.DataSet.GetBookmark;
    DataSource.DataSet.DisableControls;
    try
      try
        Screen.Cursor := crHourGlass;
        for   i:=   SelectedRows.Count   -   1   downto   0   do
        begin
          damo.qry72.GotoBookmark(pointer(SelectedRows.Items[i]));
          if  damo.qry72status.AsInteger<>1 then
          with damo.qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'update wzcp0072 set auth_usreptr= ' + IntToStr(rkey05)
              + ', auth_date=CONVERT(varchar(100) , getdate(), 23)'
              + ', status = 1 '
             + ' where rkey='+inttostr(damo.qry72.FieldByName('rkey').Value);
            ExecSQL;
          end;
        end;
        damo.qry72.Close;
        damo.qry72.Open;
      finally
        DataSource.DataSet.GotoBookmark(BM);
        DataSource.DataSet.FreeBookmark(BM);
        DataSource.DataSet.EnableControls;
        Screen.Cursor := crDefault;
      end;
    except
      on e:Exception do
      begin
        damo.qry72.Cancel;
        ShowMessage('提交失败！'+#13#10+e.Message);
      end;
    end;
  end ;

 { damo.qry72.First;
  for i := 0 to damo.qry72.RecordCount - 1 do
  begin
    with damo.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'update wzcp0072 set auth_usreptr= ' + IntToStr(rkey05)
        + ', auth_date=CONVERT(varchar(100) , getdate(), 23)'
        + ', status = 1 '
        + ' where rkey='+inttostr(damo.qry72rkey.Value);
      ExecSQL;
      damo.qry72.Next;
    end;
  end;   }


end;

procedure TFrmMain.N8_MultiCancelClick(Sender: TObject);
var
  i: Integer;
  bm:Pointer;
begin                    //菜单项：全部取消
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您的权限（写银）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if MessageBox(Handle,'确定要取消当前已选择的记录吗？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON2)=IDNO	then
    exit;

  with  DBGridEh1  do
  if   SelectedRows.Count > 1 then  //如果用户选择的行数大于1，即多行。
  begin
    bm:= DataSource.DataSet.GetBookmark;
    DataSource.DataSet.DisableControls;
    try
      try
        Screen.Cursor := crHourGlass;
        for   i:=   SelectedRows.Count   -   1   downto   0   do
        begin
          damo.qry72.GotoBookmark(pointer(SelectedRows.Items[i]));
          if  damo.qry72status.AsInteger<>2 then
          with damo.qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'update wzcp0072 set auth_usreptr= ' + IntToStr(rkey05)
            + ', auth_date=CONVERT(varchar(100) , getdate(), 23)'
            + ', status = 2 '
            + ' where rkey='+inttostr(damo.qry72rkey.Value);
            ExecSQL;
          end;
        end;
        damo.qry72.Close;
        damo.qry72.Open;
      finally
        DataSource.DataSet.GotoBookmark(BM);
        DataSource.DataSet.FreeBookmark(BM);
        DataSource.DataSet.EnableControls;
        Screen.Cursor := crDefault;
      end;
    except
      on e:Exception do
      begin
        damo.qry72.Cancel;
        ShowMessage('提交失败！'+#13#10+e.Message);
      end;
    end;
  end ;
{  damo.qry72.First;
  for i := 0 to damo.qry72.RecordCount - 1 do
  begin
    with damo.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'update wzcp0072 set auth_usreptr= ' + IntToStr(rkey05)
        + ', auth_date=CONVERT(varchar(100) , getdate(), 23)'
        + ', status = 2 '
        + ' where rkey='+inttostr(damo.qry72rkey.Value);
      ExecSQL;
      damo.qry72.Next;
    end;
  end;
  damo.qry72.Close;
  damo.qry72.Open; }
end;

procedure TFrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(damo.qry72.SQL.Text);
end;

procedure TFrmMain.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TFrmMain.DBGridEh2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TFrmMain.N_CopyClick(Sender: TObject);
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;

  damo.Tag := 1 ;
  AddFrmMain := TAddFrmMain.Create(Application);
  damo.Tag := 3;   //复制
  if AddFrmMain.ShowModal=mrok then
   begin
     
     BitBtn2Click(sender);
   end;
  AddFrmMain.Free;
  
end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
  damo.qry72.Filtered := True;
  if RadioGroup1.ItemIndex = 0 then                             //全部
  begin
    damo.qry72.Filter := startFilter + '';
  end;
  if RadioGroup1.ItemIndex = 1 then                             //未审核status = 0
  begin
    if startFilter <> '' then
      damo.qry72.Filter := startFilter + ' and (status = 0) '
    else
      damo.qry72.Filter := startFilter + ' (status = 0) ';
  end;
  if RadioGroup1.ItemIndex = 2 then                             //已审核status = 1
  begin
    if startFilter <> '' then
      damo.qry72.Filter := startFilter + ' and (status = 1) '
    else
      damo.qry72.Filter := startFilter + ' (status = 1) ';
  end;
  if RadioGroup1.ItemIndex = 3 then                             //已取消status = 2
  begin
    if startFilter <> '' then
      damo.qry72.Filter := startFilter + ' and (status = 2) '
    else
      damo.qry72.Filter := startFilter + ' (status = 2) ';
  end;
end;



end.

