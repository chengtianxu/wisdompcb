unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ComCtrls, Menus,DateUtils,
  DB, ADODB;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Popup1: TPopupMenu;
    Popup2: TPopupMenu;
    N_New: TMenuItem;
    N_Edit: TMenuItem;
    N_Delete: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N_OK: TMenuItem;
    N_Complete: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    DBGrd1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    N_PartEdit: TMenuItem;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    N1: TMenuItem;
    CheckBox7: TCheckBox;
    N_Idle: TMenuItem;
    N_Cancel_Idle: TMenuItem;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure item_Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N_NewClick(Sender: TObject);
    procedure publi(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure N_OKClick(Sender: TObject);
    procedure N_CompleteClick(Sender: TObject);
    procedure DBGrd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N_PartEditClick(Sender: TObject);
    procedure Popup2Popup(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N_IdleClick(Sender: TObject);
    procedure N_Cancel_IdleClick(Sender: TObject);
  private
    { Private declarations }
    sortDate:TDateTime;
    longDate:TDateTime;
    sqlText:string;
    preColumn:TColumnEh;
    strStatusValue:string;
    rkey417:Integer;
    function   GetEmployee_ptr(rkey73:Integer):string;
    procedure AddFassetList;
  public


    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;
  const
  StrSQL0417='SELECT [D845_ptr],DATA0417.RKEY,DATA0417.FASSET_CODE,DATA0417.FASSET_NAME,DATA0417.FASSET_DESC,Data0514.FASSET_TYPE,'
      +' Data0034.DEPT_NAME,DATA0417.LOCATION,DATA0417.PURCH_DATE,DATA0417.BOOK_DATE,DATA0417.REMARK, '
      +' case DATA0417.active_flag when 1 then ''新进'' when 2 then ''仓库确认'' when 3 then ''安装完成'' '
      +' when 4 then ''验收合格'' when 5 then ''报废'' when 6 then ''调拨外出'' end AS active_flag,  '
      +' DATA0417.USER_DATE,Data0005.EMPLOYEE_NAME,Data0015.ABBR_NAME,DATA0417.supplier_name, '
      +' DATA0417.MAKE_VENDER,DATA0417.confi_date,D05_1.EMPLOYEE_NAME AS confi_user, '
      +' DATA0417.install_date,D05_2.EMPLOYEE_NAME AS install_user,[EquiType], '
      +' CASE DATA0417 .[EquiType] WHEN 0 THEN ''是'' WHEN 1 THEN ''否'' end as 设备类型,'
      +' DATA0417.machine_number,id_code,equipment_grade,DeviType,IsGroup '
+'FROM   DATA0417 LEFT OUTER JOIN    '
      +' Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY LEFT OUTER JOIN   '
      +' Data0034 ON DATA0417.DEPT_PTR = Data0034.RKEY LEFT OUTER JOIN   '
      +' Data0005 ON DATA0417.USER_PTR = Data0005.RKEY LEFT OUTER JOIN  '
      +' Data0015 ON DATA0417.warehouse_ptr = Data0015.RKEY LEFT OUTER JOIN    '
      +' Data0005 AS D05_1 ON dbo.DATA0417.confi_userptr = D05_1.RKEY LEFT OUTER JOIN  '
      +' Data0005 AS D05_2 ON dbo.DATA0417.install_userptr = D05_2.RKEY  ';
    //  +' left join data0845 on DATA0417.[D845_ptr]=data0845.rkey';
//+'WHERE  Data0417.active_flag<>:V1 and Data0417.active_flag<>:V2     '
//      +' and Data0417.active_flag<>:V3 and Data0417.active_flag<>:V4 '
//      +'and Data0417.active_flag<>:V5 and Data0417.active_flag<>:V6  ';


implementation
                   // , addEquipment
uses dmo, common, Search, MaintenanceLog, ChangeLog, addEquipment;

{$R *.dfm}


procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

function   TFrm_Main.GetEmployee_ptr(rkey73:Integer):string;
var
  TempRead:TADOQuery;
begin
  Result:='';
  try
    TempRead:= TADOQuery.Create(nil);
    TempRead.Connection:=DM.ADOConn;
    TempRead.SQL.Text:='select employee_ptr from data0073 where rkey= '+IntToStr(rkey73);
    TempRead.Open;
    Result:=  TempRead.FieldByName('employee_ptr').AsString;
  finally
    TempRead.Free;
  end;
    

end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
 { }if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  user_ptr:= GetEmployee_ptr (StrToInt(rkey73));    //对雇员指针进行赋值。
      
{  dm.ADOConn.Close;
  dm.ADOConn.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConn.Open;
  user_ptr:= IntToStr(2995 );
  rkey73 := IntToStr(2522);
  vprev:=IntToStr(2);
  DM.ADOConn.Open; }

  Self.Caption:=Application.Title;
  WindowState:=wsMaximized;
end;

procedure TFrm_Main.DBGrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  DBGrd1.canvas.Font.Color:=clBlack;
  if DBGrd1.DataSource.DataSet.RecNo mod 2=0 then
    DBGrd1.canvas.Brush.color:=clInfoBk       //$00EEFFFF
  else
    DBGrd1.canvas.brush.color:=clWhite;
  if (gdSelected   in   State) then
  begin
    DBGrd1.Canvas.Brush.Color:=clAqua;
  end;
  DBGrd1.DefaultDrawColumnCell(rect,datacol,column,state);
end;

procedure TFrm_Main.FormShow(Sender: TObject);
var
  i:Byte;
  item:TMenuItem;
begin
  for i := 0 to DBGrd1.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=DBGrd1.Columns[i].Title.Caption;
    item.Checked:=DBGrd1.Columns[i].Visible;
    item.OnClick:=item_Click;
    Popup1.Items.Add(item);
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select getDate() as v_date');
    Active:=True;
    sortDate:=StrToDateTime(Formatdatetime('yyyy-MM-dd',StrToDateTime(FieldValues['v_date'])));
    longDate:=StrToDateTime(FieldValues['v_date']);
  end;
  sqlText:=DM.ADO417.CommandText;
  preColumn:=DBGrd1.FieldColumns['FASSET_CODE'];
  Label1.Caption:=preColumn.Title.Caption;
  CheckBox1Click(nil);
 { if DM.ADO417.IsEmpty then
  begin
    N_Edit.Enabled:=False;
    N_Delete.Enabled:=False;
    N4.Enabled:=False;
    N_OK.Enabled:=False;
    N_Complete.Enabled:=False;
    N9.Enabled:=False;
    N10.Enabled:=False;
    N_PartEdit.Enabled:=False;
  end;    }

  SpeedButton1.Click;
end;

procedure TFrm_Main.item_Click(Sender: TObject);
var
  i:Byte;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked  then
    begin
      for i := 0 to DBGrd1.Columns.Count-1 do
      begin
        if (Sender as TMenuItem).Caption=DBGrd1.Columns[i].Title.Caption then
        begin
          DBGrd1.Columns[i].Visible:=True;
          Break;
        end;
      end;
    end
  else
  begin
    for i := 0 to DBGrd1.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrd1.Columns[i].Title.Caption then
      begin
        DBGrd1.Columns[i].Visible:=False;
        Break;
      end;
    end;
  end;
end;

procedure TFrm_Main.BitBtn5Click(Sender: TObject);
begin
  Popup1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
var
  vrkey:Integer;
begin
  vrkey:=0;
  if  DM.ADO417.FieldByName('RKEY').IsNull =False then
  vrkey:=  DM.ADO417.FieldByName('RKEY').Value   ;
  DM.ADO417.Close;
  DM.ADO417.Open;
  if vrkey>0 then
  DM.ADO417.Locate('rkey',vrkey,[]);
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
begin
  if not DM.ADO417.IsEmpty then
  begin
    Export_dbGridEH_to_Excel(DBGrd1,Application.Title);
  end;
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
var
  i:Byte;
begin
  Frm_Search:=TFrm_Search.Create(Application);
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select rkey,fasset_type from data0514');
    Active:=True;
  end;
  DM.ADOQuery1.DisableControls;
  DM.ADOQuery1.First;
  Frm_Search.ComboBox2.Items.Clear;
  while not DM.ADOQuery1.Eof do
  begin
    Frm_Search.ComboBox2.Items.Add(DM.ADOQuery1.FieldValues['fasset_type']);
    DM.ADOQuery1.Next;
  end;
  DM.ADOQuery1.EnableControls;
  Frm_Search.ComboBox2.ItemIndex:=0;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select rkey,abbr_name from data0015');
    Active:=True;
  end;
  DM.ADOQuery1.DisableControls;
  DM.ADOQuery1.First;
  Frm_Search.ComboBox3.Items.Clear;
  while not DM.ADOQuery1.Eof do
  begin
    Frm_Search.ComboBox3.Items.Add(DM.ADOQuery1.FieldValues['abbr_name']);
    DM.ADOQuery1.Next;
  end;
  DM.ADOQuery1.EnableControls;
  Frm_Search.ComboBox3.ItemIndex:=0;
  Frm_Search.dtpk1.Date:=sortDate-dayof(sortDate)+1;
  Frm_Search.dtpk2.Date:=sortDate;
  if Frm_Search.ShowModal=mrok then
  begin
    with DM.ADO417 do
    begin
      Close;
      CommandText:=DM.Copy0417.SQL.Text+#10#13+'where 1=1 '+strStatusValue;
      for i := 1 to Frm_Search.SGrd1.RowCount-2 do
        CommandText:=CommandText+Frm_Search.SGrd1.Cells[2,i];

      CommandText:=CommandText+#10#13+' order by fasset_code';
      Open;
    end;
  end;
end;

procedure TFrm_Main.N_NewClick(Sender: TObject);
var
  fastype:string;
  warehouse:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  try
    Frm_addEquipment:=TFrm_addEquipment.Create(Application);
    Frm_addEquipment.FormState:='i';    //插入
    with DM.qry0813 do
    begin
      Close;
      Parameters[0].Value:='0';
      Open;
    end;
    with DM.ADO418 do
    begin
      Close;
      Parameters[0].Value:='0';
      Open;
    end;
    Frm_addEquipment.DateTimePicker1.DateTime:=sortDate;
    publi(nil);
    DM.ADO417.Append;
    if Frm_addEquipment.ShowModal=mrok then
    begin
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0514 where fasset_type='''+trim(Frm_addEquipment.ComboBox1.Text)+'''');
        Active:=True;
        fastype:=FieldValues['rkey'];
      end;
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0015 where abbr_name='''+trim(Frm_addEquipment.ComboBox2.Text)+'''');
        Active:=True;
        warehouse:=FieldValues['rkey'];
      end;
      try
        DM.ADOConn.BeginTrans;
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add('insert into data0417 (fasset_code,fasset_name,fasset_desc,fasset_type_ptr,dept_ptr,');
          SQL.Add('location,purch_date,remark,user_ptr,warehouse_ptr,supplier_name,');
          SQL.Add('make_vender,machine_number,equipment_grade,DeviType,IsGroup,D845_ptr,D840_ptr,[EquiType])');
          SQL.Add('values (:fasset_code,:fasset_name,:fasset_desc,:fasset_type_ptr,:dept_ptr,');
          SQL.Add(':location,:purch_date,:remark,:user_ptr,:warehouse_ptr,:supplier_name,');
          SQL.Add(':make_vender,:machine_number,:equipment_grade,:vDeviType,:vIsGroup,:vD845_ptr,:vD840_ptr,:EquiType)');
        //  SQL.Add('select @@IDENTITY
          Parameters[0].Value:=Trim(Frm_addEquipment.Edit1.Text);
          Parameters[1].Value:=Trim(Frm_addEquipment.Edit2.Text);
          if Trim(Frm_addEquipment.Edit_FASSET_DESC.Text)<>'' then
            Parameters[2].Value:=Trim(Frm_addEquipment.Edit_FASSET_DESC.Text)
          else
            Parameters[2].Value:=null;
          Parameters[3].Value:=fastype;
          if Trim(Frm_addEquipment.Label14.Caption)<>'' then
            Parameters[4].Value:=Trim(Frm_addEquipment.Label14.Caption)
          else
            Parameters[4].Value:=NULL;
          if Trim(Frm_addEquipment.Edit_LOCATION.Text)<>'' then
            Parameters[5].Value:=Trim(Frm_addEquipment.Edit_LOCATION.Text)
          else
            Parameters[5].Value:=null;
          Parameters[6].Value:=FormatDateTime('yyyy-MM-dd',Frm_addEquipment.DateTimePicker1.Date);
          Parameters[7].Value:=Trim(Frm_addEquipment.Memo1.Lines.Text);
          with DM.ADOQuery2 do
          begin
            Active:=False;
            SQL.Clear;
            SQL.Add('select employee_ptr from data0073 where rkey='+rkey73);
            Active:=True;
          end;
          Parameters[8].Value:=DM.ADOQuery2.FieldValues['employee_ptr'];
  //        Parameters[8].Value:='1919';
          Parameters[9].Value:=warehouse;
          Parameters[10].Value:=Trim(Frm_addEquipment.Edit7.Text);
          Parameters[11].Value:=Trim(Frm_addEquipment.Edit8.Text);
          if Trim(Frm_addEquipment.Edit_machine_number.Text)<>''then
            Parameters[12].Value:=Trim(Frm_addEquipment.Edit_machine_number.Text)
          else
            Parameters[12].Value:=null;
          Parameters[13].Value:=Trim(Frm_addEquipment.ComboBox3.Text);
          Parameters[14].Value:=Trim(Frm_addEquipment.cbb_DeviType.Text);
          Parameters.ParamByName('vIsGroup') .Value:=Frm_addEquipment.CheckBox1.Checked;
          Parameters.ParamByName('vD845_ptr') .Value:=DM.ADO417D845_ptr.Value;
          if  Frm_addEquipment.edt_Location.Tag > 0 then
          Parameters.ParamByName('vD840_ptr') .Value:=Frm_addEquipment.edt_Location.Tag;
          Parameters.ParamByName('EquiType') .Value:=Frm_addEquipment .cb_EquiType.Checked;
          ExecSQL;
          with dm.ADOQuery2 do
          begin
            Close;
            sql.Clear;
            SQL.Add('select top 1 rkey from data0417 order by rkey desc');
            Open;
            rkey417:=FieldValues['rkey'];
          end;
          if DM.ADO418.IsEmpty=False then
          begin
            dm.ADO418.First;
            while not DM.ADO418.Eof do
            begin
              with dm.ADOQuery2 do
              begin
                Close;
                sql.Clear;
                SQL.Add('insert into data0418 (fasset_ptr,name,seq_no,unit_ptr,qty,remark)values(');
                sql.Add(IntToStr(rkey417)+','''+dm.ADO418name.Value+''','+dm.ADO418seq_no.Text+',') ;
                sql.Add(dm.ADO418unit_ptr.Text+','+dm.ADO418qty.Text+','''+dm.ADO418remark.Value+''')');
                ExecSQL;
              end;
              dm.ADO418.Next;
            end;
          end;
          AddFassetList;
          DM.ADOConn.CommitTrans;
  //        Frm_addEquipment.Close;
          BitBtn2Click(nil);
          dm.ADO418.Close;
          dm.ADO418.Open;
          DM.ADO417.Locate('rkey',rkey417,[]);
          //DM.ADO417.RecNo:=DM.ADO417.RecordCount;
          
        end;
      except
        on e: exception do
        begin
          DM.ADOConn.RollbackTrans;
          DM.ADOQuery1.cancel;
          messagedlg(e.message,mterror,[mbcancel],0);
        end;
      end;
    end;

  finally
    Frm_addEquipment.Free;
  end;  // try
end;

procedure TFrm_Main.publi(Sender: TObject);
begin

  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select rkey,fasset_type from data0514');
    Active:=True;
  end;
  DM.ADOQuery1.DisableControls;
  DM.ADOQuery1.First;
  Frm_addEquipment.ComboBox1.Items.Clear;
  while not DM.ADOQuery1.Eof do
  begin
    Frm_addEquipment.ComboBox1.Items.Add(DM.ADOQuery1.FieldValues['fasset_type']);
    DM.ADOQuery1.Next;
  end;
  DM.ADOQuery1.EnableControls;
 // Frm_addEquipment.ComboBox1.ItemIndex:=-1;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select rkey,abbr_name from data0015 order by rkey');
    Active:=True;
  end;
  DM.ADOQuery1.DisableControls;
  DM.ADOQuery1.First;
  Frm_addEquipment.ComboBox2.Items.Clear;
  while not DM.ADOQuery1.Eof do
  begin
    Frm_addEquipment.ComboBox2.Items.Add(DM.ADOQuery1.FieldValues['abbr_name']);
    DM.ADOQuery1.Next;
  end;
  DM.ADOQuery1.EnableControls;
 // Frm_addEquipment.ComboBox2.ItemIndex:=-1;
end;

procedure TFrm_Main.N_EditClick(Sender: TObject);
var
  fastype,warehouse:string;
  //i:Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  try
    Frm_addEquipment:=TFrm_addEquipment.Create(Application);
   // Frm_addEquipment.StateIsInsert:=False;
    with DM.ADO418 do
    begin
      Close;
      Parameters[0].Value:=DM.ADO417RKEY.Value;
      Open;
    end;
    publi(nil);
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select dept_code,dept_name from data0034 where dept_name='''+DM.ADO417DEPT_NAME.Value+'''');
      Active:=True;
    end;
    with Frm_addEquipment do
    begin
      Frm_addEquipment.CheckBox1.Checked:=DM.ADO417IsGroup.AsBoolean;
      Edit1.Text:=DM.ADO417FASSET_CODE.Value;
      Edit2.Text:=DM.ADO417FASSET_NAME.Value;
      Edit_FASSET_DESC.Text:=DM.ADO417FASSET_DESC.Value;
      cb_EquiType.Checked:= DM.ADO417EquiType.AsBoolean;
      Edit10.Text:=DM.ADO417USER_DATE.AsString;   //创建日期
      Edit11.Text:=DM.ADO417EMPLOYEE_NAME.Value;   //创建人员：
      Edit12.Text:=DM.ADO417confi_date.AsString;   //确认日期：
      Edit13.Text:=DM.ADO417confi_user.Value;   //确认人员：
      Edit14.Text:=DM.ADO417install_date.AsString;   //安装日期：
      Edit15.Text:=DM.ADO417install_user.Value;   //安装人员：
  //    edt_FaultDesc.text:=DM.ADO417FaultDesc.Value;  //故障类别
      ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(DM.ADO417FASSET_TYPE.Value);
      if DM.ADOQuery1.IsEmpty then
      begin
        Edit5.Text:='';
        Label13.Caption:='';
      end
      else
      begin
        Edit5.Text:=DM.ADOQuery1.FieldValues['dept_code'];
        Label13.Caption:=DM.ADOQuery1.FieldValues['dept_name'];
      end;
      Edit_LOCATION.Text:=DM.ADO417LOCATION.Value;
      DateTimePicker1.Date:=DM.ADO417PURCH_DATE.Value;
      Memo1.Lines.Text:=DM.ADO417REMARK.Value;
      ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(DM.ADO417ABBR_NAME.Value);
      Edit7.Text:=DM.ADO417supplier_name.Value;
      Edit8.Text:=DM.ADO417MAKE_VENDER.Value;
      Edit_machine_number.Text:=DM.ADO417machine_number.Value;
      edt_Location.Text:=DM.ADO417d840_Location.Value;
      edt_Location.Tag:=DM.ADO417D840_ptr.Value;

      if DM.ADO417equipment_grade.Value='关键' then
        ComboBox3.ItemIndex:=0;
      if DM.ADO417equipment_grade.Value='重要' then
        ComboBox3.ItemIndex:=1;
      if DM.ADO417equipment_grade.Value='一般' then
        ComboBox3.ItemIndex:=2;
      if DM.ADO417equipment_grade.Value='其它' then
        ComboBox3.ItemIndex:=3;
      cbb_DeviType.ItemIndex:=cbb_DeviType.Items.IndexOf(Trim(DM.ADO417DeviType.Value));


   //   i:=DM.ADO417.RecNo;
    end;
    if Trim(Frm_addEquipment.Edit5.Text)<>'' then
    begin
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0034 where dept_code='''+trim(Frm_addEquipment.Edit5.Text)+'''');
        Active:=True;
        Frm_addEquipment.Label14.Caption:=FieldValues['rkey'];
      end;
    end
    else
      Frm_addEquipment.Label14.Caption:='';
      
    if Frm_addEquipment.ShowModal=mrok then
    begin
     // Edit1.Text:='';
     { // 彭华注释掉于2012-12-20，如果用户是在过滤状态下进行编辑，在还没有运行到下面修改语句，
     Edit1.Text设为空即去掉过滤,数据行已改变，后面执行UPDATE语句的时候，获取的RKEY的值是错误的。  }

      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0514 where fasset_type='''+trim(Frm_addEquipment.ComboBox1.Text)+'''');
        Active:=True;
        fastype:=FieldValues['rkey'];
      end;
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0015 where abbr_name='''+trim(Frm_addEquipment.ComboBox2.Text)+'''');
        Active:=True;
        warehouse:=FieldValues['rkey'];
      end;
      try
        DM.ADOConn.BeginTrans;
        with DM.ADOQuery1 do
        begin                    
          Active:=False;
          SQL.Clear;
          SQL.Add('update data0417 set fasset_code=:fasset_code,fasset_name=:fasset_name,fasset_desc=:fasset_desc,');
          SQL.Add('fasset_type_ptr=:fasset_type_ptr,dept_ptr=:dept_ptr,location=:location,remark=:remark,');
          SQL.Add('warehouse_ptr=:warehouse_ptr,supplier_name=:supplier_name,make_vender=:make_vender,');
          SQL.Add('machine_number=:machine_number,equipment_grade=:equipment_grade,DeviType=:vDeviType,');
          SQL.Add('IsGroup=:vIsGroup,purch_date=:vpurch_date,D845_ptr=:vD845_ptr,D840_ptr=:vD840_ptr,[EquiType]=:vEquiType where rkey=:rkey');
          Parameters[0].Value:=Trim(Frm_addEquipment.Edit1.Text);
          Parameters[1].Value:=Trim(Frm_addEquipment.Edit2.Text);
          Parameters[2].Value:=Trim(Frm_addEquipment.Edit_FASSET_DESC.Text);
          Parameters[3].Value:=fastype;
          if Trim(Frm_addEquipment.Label14.Caption)<>'' then
            Parameters[4].Value:=Trim(Frm_addEquipment.Label14.Caption)
          else
            Parameters[4].Value:=Null;
          Parameters[5].Value:=Trim(Frm_addEquipment.Edit_LOCATION.Text);
          Parameters[6].Value:=Trim(Frm_addEquipment.Memo1.Lines.Text);
          Parameters[7].Value:=warehouse;
          Parameters[8].Value:=Trim(Frm_addEquipment.Edit7.Text);
          Parameters[9].Value:=Trim(Frm_addEquipment.Edit8.Text);
          Parameters[10].Value:=Trim(Frm_addEquipment.Edit_machine_number.Text);
          Parameters[11].Value:=Frm_addEquipment.ComboBox3.Text;
          Parameters.ParamByName('vPurch_date').Value:=FormatDateTime('yyyy-MM-dd',Frm_addEquipment.DateTimePicker1.Date);
          Parameters.ParamByName('vDeviType').Value:=Frm_addEquipment.cbb_DeviType.Text;
          Parameters.ParamByName('vIsGroup') .Value:=Frm_addEquipment.CheckBox1.Checked;
          Parameters.ParamByName('vD845_ptr') .Value:=DM.ADO417D845_ptr.Value;
          Parameters.ParamByName('rkey').Value     :=DM.ADO417RKEY.Value;
          if Frm_addEquipment.edt_Location.Tag=0 then
            Parameters.ParamByName('vD840_ptr') .Value:=null
          else
            Parameters.ParamByName('vD840_ptr') .Value:=Frm_addEquipment.edt_Location.Tag;
          Parameters.ParamByName('vEquiType') .Value:=  Frm_addEquipment.cb_EquiType.Checked;
          ExecSQL;

          if DM.ADO418.IsEmpty=False then
          begin
            with DM.ADOQuery2 do
            begin
              Close;
              SQL.Clear;
              SQL.Text:='delete data0418 where fasset_ptr='+dm.ADO417RKEY.Text;
              ExecSQL;
            end;
            dm.ADO418.First;
            while not DM.ADO418.Eof do
            begin
              with dm.ADOQuery2 do
              begin
                Close;
                sql.Clear;
                SQL.Add('insert into data0418 (fasset_ptr,name,seq_no,unit_ptr,qty,remark)values(');
                sql.Add(dm.ADO417RKEY.Text+','''+dm.ADO418name.Value+''','+dm.ADO418seq_no.Text+',') ;
                sql.Add(dm.ADO418unit_ptr.Text+','+dm.ADO418qty.Text+','''+dm.ADO418remark.Value+''')');
                ExecSQL;
              end;
              dm.ADO418.Next;
            end;
          end;
          AddFassetList;
          DM.ADOConn.CommitTrans;
          BitBtn2Click(nil);
 //         DM.ADO417.RecNo:=i;
          
        end;
      except
        on e: exception do
        begin
          DM.ADOConn.RollbackTrans;
          DM.ADOQuery1.cancel;
          messagedlg(e.message,mterror,[mbcancel],0);
        end;
      end;

    end;
  finally
    Frm_addEquipment.Free;
  end;  // try
end;

procedure TFrm_Main.N4Click(Sender: TObject);
begin
  try
    Frm_addEquipment:=TFrm_addEquipment.Create(Application);
    Frm_addEquipment.FormState:='s';    //查看
    Frm_addEquipment.DBGrid2.ReadOnly:=True;
    Frm_addEquipment.Button1.Enabled:=False;  //添加设备
    Frm_addEquipment.Button2.Enabled:=False;  //删除设备
    Frm_addEquipment.Button3.Enabled:=False;  //取消
    Frm_addEquipment.btn_Location.Enabled:=False;  //取消
    with DM.ADO418 do
    begin
      Close;
      Parameters[0].Value:=DM.ADO417RKEY.Value;
      Open;
    end;
    publi(nil);
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select dept_code,dept_name from data0034 where dept_name='''+DM.ADO417DEPT_NAME.Value+'''');
      Active:=True;
    end;
    with Frm_addEquipment do
    begin
      Edit1.Text:=DM.ADO417FASSET_CODE.Value;
      Edit2.Text:=DM.ADO417FASSET_NAME.Value;
      Edit_FASSET_DESC.Text:=DM.ADO417FASSET_DESC.Value;
      ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(DM.ADO417FASSET_TYPE.Value);
      cb_EquiType.Checked:= DM.ADO417EquiType.AsBoolean;

      if not DM.ADOQuery1.IsEmpty then
      begin
        Edit5.Text:=DM.ADOQuery1.FieldValues['dept_code'];
        Label13.Caption:=DM.ADOQuery1.FieldValues['dept_name'];
      end
      else
      begin
        Edit5.Text:='';
        Label13.Caption:='';
      end;
      Edit_LOCATION.Text:=DM.ADO417LOCATION.Value;
      DateTimePicker1.Date:=DM.ADO417PURCH_DATE.Value;
      Memo1.Lines.Text:=DM.ADO417REMARK.Value;
      ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(DM.ADO417ABBR_NAME.Value);
      Edit7.Text:=DM.ADO417supplier_name.Value;
      Edit8.Text:=DM.ADO417MAKE_VENDER.Value;
      Edit_machine_number.Text:=DM.ADO417machine_number.Value;
      Edit9.Text:=DM.ADO417BOOK_DATE.Text;
      Edit10.Text:=DM.ADO417USER_DATE.Text;
      Edit11.Text:=DM.ADO417EMPLOYEE_NAME.Value;
      Edit12.Text:=DM.ADO417confi_date.Text;
      Edit13.Text:=DM.ADO417confi_user.Value;
      Edit14.Text:=DM.ADO417install_date.Text;
      Edit15.Text:=DM.ADO417install_user.Value;
      edt_Location.Text:=DM.ADO417d840_Location.Value;
 //     edt_FaultDesc.text:=DM.ADO417FaultDesc.Value;
      if DM.ADO417equipment_grade.Value='关键' then
        ComboBox3.ItemIndex:=0;
      if DM.ADO417equipment_grade.Value='重要' then
        ComboBox3.ItemIndex:=1;
      if DM.ADO417equipment_grade.Value='一般' then
        ComboBox3.ItemIndex:=2;
      if DM.ADO417equipment_grade.Value='其它' then
        ComboBox3.ItemIndex:=3;
      cbb_DeviType.ItemIndex:=cbb_DeviType.Items.IndexOf(Trim(DM.ADO417DeviType.Value));
      N_Upload.Enabled:=False;//上传按钮不可用。
      N_Delete.Enabled:=False;//删除按钮不可用。
    end;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select rkey from data0034 where dept_code='''+trim(Frm_addEquipment.Edit5.Text)+'''');
      Active:=True;
      if not IsEmpty then
        Frm_addEquipment.Label14.Caption:=FieldValues['rkey']
      else
        Frm_addEquipment.Label14.Caption:='';
    end;
    with Frm_addEquipment do
    begin
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit_FASSET_DESC.Enabled:=False;
      Edit_machine_number.Enabled:=False;
      Edit5.Enabled:=False;
      Edit_LOCATION.Enabled:=False;
      Edit7.Enabled:=False;
      Edit8.Enabled:=False;
      edt_FaultDesc1.Enabled:=False;
      bit_FaultDesc.Enabled:=False;
      ComboBox1.Enabled:=False;
      ComboBox2.Enabled:=False;
      BitBtn3.Enabled:=False;
      DateTimePicker1.Enabled:=False;
      Memo1.Enabled:=False;
      BitBtn1.Enabled:=False;
      btn1.Enabled:=False;
      btn2.Enabled:=False;
      btn3.Enabled:=False;
      ComboBox3.Enabled:=False;
      cbb_DeviType.Enabled:=False;
      edt_Location.Enabled:=False;
      CheckBox1.Enabled:=False;
      cb_EquiType.Enabled:=False;
    end;
    Frm_addEquipment.ShowModal;
  finally
    Frm_addEquipment.Free;
  end;  // try
end;

procedure TFrm_Main.N_DeleteClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if MessageDlg('数据一旦删除无法恢复，您确定要删除这条记录？',mtConfirmation,[mbYes,mbNo],0)<>6 then Exit;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('declare @rkey int select @rkey=:rkey');
    SQL.Add('update dbo.DATA0417 set Group_Ptr=null where Group_Ptr=@rkey');
    SQL.Add('delete DATA0417 where rkey=@rkey ');
  //  SQL.Add('delete data0417 where rkey=:rkey');
    Parameters[0].Value:=DM.ADO417RKEY.Value;
    ExecSQL;
    BitBtn2Click(nil);
    if not DM.ADO417.IsEmpty then
      DM.ADO417.RecNo:=DM.ADO417.RecordCount;
  end;
end;

procedure TFrm_Main.N_OKClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if DM.ADO417active_flag.Value<>'新进' then
  begin
    ShowMessage('此设备不是待确认状态');
    Exit;
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('update data0417 set confi_date=:confi_date,confi_userptr=:confi_userptr,active_flag=:active_flag where rkey=:rkey');

    with DM.ADOQuery2 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select employee_ptr from data0073 where rkey='+rkey73);
      Active:=True;
    end;
    Parameters[0].Value:=longDate;
    Parameters[1].Value:=DM.ADOQuery2.FieldValues['employee_ptr'];
    Parameters[2].Value:='2';
    Parameters[3].Value:=DM.ADO417RKEY.Value;
    ExecSQL;
    BitBtn2Click(Sender);
  end;
end;

procedure TFrm_Main.N_CompleteClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('update data0417 set install_date=:install_date,install_userptr=:install_userptr,active_flag=:active_flag where rkey=:rkey');
    with DM.ADOQuery2 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select employee_ptr from data0073 where rkey='+rkey73);
      Active:=True;
    end;
    Parameters[0].Value:=longDate;
    Parameters[1].Value:=DM.ADOQuery2.FieldValues['employee_ptr'];
    Parameters[2].Value:='3';
    Parameters[3].Value:=DM.ADO417RKEY.Value;
    ExecSQL;
    BitBtn2Click(Sender);
  end;
end;

procedure TFrm_Main.DBGrd1TitleClick(Column: TColumnEh);
begin
{ if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADO417.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADO417.IndexFieldNames:=Column.FieldName;
  end;  }

  with Column.Grid.DataSource.DataSet as TCustomADODataSet do
  begin
    if FieldByName(Column.FieldName).FieldKind in[ fkCalculated,fkLookup]  then  //
      exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      Sort:=Column.FieldName+' DESC';
    end;
  end;

  if Column.Tag<>1 then
  begin                                            //当前单击的列不能是布尔型
    if (preColumn.FieldName<>Column.FieldName)and (DM.ADO417.FieldByName(Column.FieldName).DataType<>ftBlob) then
    begin
      Label1.Caption:=Column.Title.Caption+':';
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
      preColumn:=Column;
      Edit1.Text:='';
      Edit1.SetFocus;
    end;
  end;
end;

procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADO417.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADO417.Filter:='';
end;

procedure TFrm_Main.DBGrd1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin    {
  if not DM.ADO417.IsEmpty then
  begin
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select active_flag from data0417 where rkey='+DM.ADO417RKEY.Text);
      Active:=True;
      if FieldValues['active_flag']=1 then
      begin
        N_Edit.Enabled:=True;
        N_Delete.Enabled:=True;
        N_OK.Enabled:=True;
        N_Complete.Enabled:=False;
        N_Idle.Enabled:=True;
        N_Cancel_Idle:=True;
      end;
      if FieldValues['active_flag']=2 then
      begin
        N_Edit.Enabled:=False;
        N_Delete.Enabled:=False;
        N_OK.Enabled:=False;
        N_Complete.Enabled:=True;
      end;
      if FieldValues['active_flag']>2 then
      begin
        N_Edit.Enabled:=False;
        N_Delete.Enabled:=False;
        N_OK.Enabled:=False;
        N_Complete.Enabled:=False;
      end;
      if FieldValues['active_flag']=7 then
      begin
        N_Edit.Enabled:=False;
        N_Delete.Enabled:=False;
        N_OK.Enabled:=False;
        N_Complete.Enabled:=False;
        N_Cancel_Idle:=True;
      end;
    end;
  end;           }
end;

procedure TFrm_Main.CheckBox1Click(Sender: TObject);
begin
  strStatusValue:='';
  if   (CheckBox1.Checked and CheckBox2.Checked and CheckBox3.Checked and CheckBox4.Checked and CheckBox5.Checked and CheckBox6.Checked)=False  then
  begin                              //如果记录的4种状态都要查询的话，退出。因为该查询条件根本不需要存在，查询速度会更快。

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
      strStatusValue:=' and Data0417.active_flag in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')';
    end;
  end;

  if RadioGroup1.ItemIndex=0 then
    strStatusValue:=strStatusValue+' and IsGroup=1'
  else
  if RadioGroup1.ItemIndex=1 then
    strStatusValue:=strStatusValue+' and IsGroup=0' ;

 // ShowMessage(strStatusValue)   ;

{  with DM.ADO417 do
  begin
    Close;
    DM.ADO417.CommandText:=StrSQL+' order by fasset_code';
    if CheckBox1.Checked then
      DM.ADO417.Parameters.ParamValues['V1']:= 0
    else
      DM.ADO417.Parameters.ParamValues['V1']:= 1;
    if CheckBox2.Checked then
      DM.ADO417.Parameters.ParamValues['V2']:= 0
    else
      DM.ADO417.Parameters.ParamValues['V2']:= 2;
    if CheckBox3.Checked then
      DM.ADO417.Parameters.ParamValues['V3']:= 0
    else
      DM.ADO417.Parameters.ParamValues['V3']:= 3;
    if CheckBox4.Checked then
      DM.ADO417.Parameters.ParamValues['V4']:= 0
    else
      DM.ADO417.Parameters.ParamValues['V4']:= 4;
    if CheckBox5.Checked then
      DM.ADO417.Parameters.ParamValues['V5']:= 0
    else
      DM.ADO417.Parameters.ParamValues['V5']:= 5;
    if CheckBox6.Checked then
      DM.ADO417.Parameters.ParamValues['V6']:= 0
    else
      DM.ADO417.Parameters.ParamValues['V6']:= 6;
    Open;
    if not IsEmpty then
    begin
      N_Edit.Enabled:=True;
      N_Delete.Enabled:=True;
      N4.Enabled:=True;
      N_OK.Enabled:=True;
      N_Complete.Enabled:=True;
      N9.Enabled:=True;
      N10.Enabled:=True;
      N_PartEdit.Enabled:=True;
    end
    else
    begin
      N_Edit.Enabled:=False;
      N_Delete.Enabled:=False;
      N4.Enabled:=False;
      N_OK.Enabled:=False;
      N_Complete.Enabled:=False;
      N9.Enabled:=False;
      N10.Enabled:=False;
      N_PartEdit.Enabled:=False;
    end;
  end;    }
end;

procedure TFrm_Main.DBGrd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    ShowMessage(DM.ADO417.CommandText);
end;

procedure TFrm_Main.N9Click(Sender: TObject);
begin
  Frm_MaintenanceLog:=TFrm_MaintenanceLog.Create(Application);
  with DM.ADO567 do
  begin
    Close;
    Parameters[0].Value:=DM.ADO417RKEY.Value;
    Open;
  end;
  Frm_MaintenanceLog.ShowModal;
end;

procedure TFrm_Main.N10Click(Sender: TObject);
begin
  Frm_ChangeLog:=TFrm_ChangeLog.Create(Application);
  with DM.ADO5734 do
  begin
    Close;
    Parameters[0].Value:=DM.ADO417RKEY.Value;
    Open;
  end;
  Frm_ChangeLog.ShowModal;
end;

procedure TFrm_Main.N_PartEditClick(Sender: TObject);
var
  //i_RecNo,
  vrkey:Integer;
  //strSQL,
//  strInsert,strDelete:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  try
    Frm_addEquipment:=TFrm_addEquipment.Create(Application);
    //i_RecNo:=DM.ADO417.RecNo;
    with DM.ADO418 do
    begin
      Close;
      Parameters[0].Value:=DM.ADO417RKEY.Value;
      Open;
    end;
    publi(nil);
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select dept_code,dept_name from data0034 where dept_name='''+DM.ADO417DEPT_NAME.Value+'''');
      Active:=True;
    end;
    with Frm_addEquipment do
    begin
      Frm_addEquipment.CheckBox1.Checked:=DM.ADO417IsGroup.AsBoolean;
      Edit1.Text:=DM.ADO417FASSET_CODE.Value;
      Edit2.Text:=DM.ADO417FASSET_NAME.Value;
      Edit_FASSET_DESC.Text:=DM.ADO417FASSET_DESC.Value;
      cb_EquiType.Checked:= DM.ADO417EquiType.AsBoolean;
      Edit10.Text:=DM.ADO417USER_DATE.AsString;   //创建日期
      Edit11.Text:=DM.ADO417EMPLOYEE_NAME.Value;   //创建人员：
      Edit12.Text:=DM.ADO417confi_date.AsString;   //确认日期：
      Edit13.Text:=DM.ADO417confi_user.Value;   //确认人员：
      Edit14.Text:=DM.ADO417install_date.AsString;   //安装日期：
      Edit15.Text:=DM.ADO417install_user.Value;   //安装人员：
 //     edt_FaultDesc.text:=DM.ADO417FaultDesc.Value;  //故障类别
      ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(DM.ADO417FASSET_TYPE.Value);
      if not DM.ADOQuery1.IsEmpty then
      begin
        Edit5.Text:=DM.ADOQuery1.FieldValues['dept_code'];
        Label13.Caption:=DM.ADOQuery1.FieldValues['dept_name'];
      end
      else
      begin
        Edit5.Text:='';
        Label13.Caption:='';
      end;
      Edit_LOCATION.Text:=DM.ADO417LOCATION.Value;
      DateTimePicker1.Date:=DM.ADO417PURCH_DATE.Value;
      Memo1.Lines.Text:=DM.ADO417REMARK.Value;
      ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(DM.ADO417ABBR_NAME.Value);
      Edit7.Text:=DM.ADO417supplier_name.Value;
      Edit8.Text:=DM.ADO417MAKE_VENDER.Value;
      Edit_machine_number.Text:=DM.ADO417machine_number.Value;
      Edit9.Text:=DM.ADO417BOOK_DATE.Text;
      Edit10.Text:=DM.ADO417USER_DATE.Text;
      Edit11.Text:=DM.ADO417EMPLOYEE_NAME.Value;
      Edit12.Text:=DM.ADO417confi_date.Text;
      Edit13.Text:=DM.ADO417confi_user.Value;
      Edit14.Text:=DM.ADO417install_date.Text;
      Edit15.Text:=DM.ADO417install_user.Value;
      if DM.ADO417equipment_grade.Value='关键' then
        ComboBox3.ItemIndex:=0;
      if DM.ADO417equipment_grade.Value='重要' then
        ComboBox3.ItemIndex:=1;
      if DM.ADO417equipment_grade.Value='一般' then
        ComboBox3.ItemIndex:=2;
      if DM.ADO417equipment_grade.Value='其它' then
        ComboBox3.ItemIndex:=3;
      cbb_DeviType.ItemIndex:=cbb_DeviType.Items.IndexOf(Trim(DM.ADO417DeviType.Value));
      edt_Location.Text:=DM.ADO417d840_Location.Value;
      edt_Location.Tag:=DM.ADO417D840_ptr.Value;
    end;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select rkey from data0034 where dept_code='''+trim(Frm_addEquipment.Edit5.Text)+'''');
      Active:=True;
      if not IsEmpty then
        Frm_addEquipment.Label14.Caption:=FieldValues['rkey']
      else
        Frm_addEquipment.Label14.Caption:='';
    end;
    with Frm_addEquipment do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=False;
      Edit_FASSET_DESC.Enabled:=False;
      Edit_machine_number.Enabled:=False;
      Edit5.Enabled:=False;
      Edit_LOCATION.Enabled:=False;
      Edit7.Enabled:=True;
      Edit8.Enabled:=True;
      ComboBox1.Enabled:=False;
      ComboBox2.Enabled:=False;
      BitBtn3.Enabled:=False;
      DateTimePicker1.Enabled:=False;
      Memo1.Enabled:=True;
      BitBtn1.Enabled:=True;
      btn1.Enabled:=True;
      btn2.Enabled:=True;
      btn3.Enabled:=True;
      ComboBox3.Enabled:=True;
      cbb_DeviType.Enabled:=True;
    end;
    //DM.ADO417.Edit;
    if Frm_addEquipment.ShowModal=mrok then
    begin
      try
        DM.ADOConn.BeginTrans;
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.add('update data0417 ') ;
          SQL.add('set fasset_code='     +QuotedStr(trim(Frm_addEquipment.Edit1.Text))) ;
          SQL.add(',supplier_name='      +QuotedStr(trim(Frm_addEquipment.Edit7.Text))) ;
          SQL.add(',make_vender='        +QuotedStr(trim(Frm_addEquipment.Edit8.Text))) ;
          SQL.add(',equipment_grade='    +QuotedStr(trim(Frm_addEquipment.ComboBox3.Text)));
          SQL.add(',REMARK='             +QuotedStr(trim(Frm_addEquipment.Memo1.Text))) ;
          SQL.add(',DeviType='           +QuotedStr(Trim(Frm_addEquipment.cbb_DeviType.Text)));
          SQL.add(',IsGroup='            +BoolToStr(Frm_addEquipment.CheckBox1.Checked ) )  ;
          SQL.add(',D845_ptr='           +InttoStr(DM.ADO417D845_ptr.Value)) ;
          if Frm_addEquipment.edt_Location.Tag=0 then
            SQL.add(',D840_ptr=null' )
          else
            SQL.add(',D840_ptr='           +InttoStr(Frm_addEquipment.edt_Location.Tag)) ;
          SQL.add(',EquiType='             +BoolToStr(Frm_addEquipment.cb_EquiType.Checked));
          SQL.add(' where rkey='        +inttostr(DM.ADO417RKEY.Value));
          ExecSQL;


          if DM.ADO418.IsEmpty=False then
          begin
            with DM.ADOQuery2 do
            begin
              Close;
              SQL.Clear;
              SQL.Text:='delete data0418 where fasset_ptr='+dm.ADO417RKEY.Text;
              ExecSQL;
            end;
            dm.ADO418.First;
            while not DM.ADO418.Eof do
            begin
              with dm.ADOQuery2 do
              begin
                Close;
                sql.Clear;
                SQL.Add('insert into data0418 (fasset_ptr,name,seq_no,unit_ptr,qty,remark)values(');
                sql.Add(dm.ADO417RKEY.Text+','''+dm.ADO418name.Value+''','+dm.ADO418seq_no.Text+',') ;
                sql.Add(dm.ADO418unit_ptr.Text+','+dm.ADO418qty.Text+','''+dm.ADO418remark.Value+''')');
                ExecSQL;
              end;
              dm.ADO418.Next;
            end;
          end;
          AddFassetList;
         { with DM.qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='update data0417 set Group_Ptr=null where Group_Ptr='+dm.ADO417RKEY.AsString;
            ExecSQL;    //将原来的修改为NULL

            with DM.cds0417  do
            begin
              if IsEmpty=False then
              begin
                try
                  strSQL:='';
                  vrkey:= FieldByName('rkey').Value;
                  DisableControls ;
                  First;
                  while not Eof do      //用循环语句获取不等于当前RKEY的值。
                  begin
                    strSQL:=strSQL+fieldByName('rkey').AsString+',';
                    Next;
                  end;
                  strSQL:=Copy(strSQL,0,Length(strSQL)-1);//去掉逗号
                finally
                  Locate('rkey',vRkey,[])   ;//重新定位
                  EnableControls;
                end;
              end;
            end;

            SQL.Clear;
            SQL.Text:='update data0417 set Group_Ptr='+dm.ADO417RKEY.AsString+' where rkey in ('+strSQL+')';
            ShowMessage(SQL.Text);
            ExecSQL;
          end;     }

          DM.ADOConn.CommitTrans;
        end;
      except
        on e: exception do
        begin
          DM.ADOConn.RollbackTrans;
          DM.ADOQuery1.cancel;
          messagedlg(e.message,mterror,[mbcancel],0);
        end;
      end;
      BitBtn2Click(nil);
 //     DM.ADO417.RecNo:=i_RecNo;
    end;
  finally
    Frm_addEquipment.Free;
  end;  // try
end;

procedure TFrm_Main.AddFassetList;
var
  strInsert,strDelete:string;
begin
  if (DM.cds0417.IsEmpty=False)and(DM.cds0417.ChangeCount >0) then
  begin
    DM.cdsTemp.Data:=DM.cds0417.Delta;
    with DM.cdsTemp do
    if IsEmpty=False then
    begin
      strInsert:='';
      strDelete:='';
      First;
      while not Eof do
      begin
       { if UpdateStatus=  usUnmodified then
          ShowMessage('usUnmodified')
        else
        if UpdateStatus=  usModified then
          ShowMessage('usModified')
        else }
        if UpdateStatus=  usInserted then
          begin
          strInsert:= strInsert+FieldByName('rkey').AsString+',';
          end
        else
        if UpdateStatus=  usDeleted then
          begin
          strDelete:= strDelete+FieldByName('rkey').AsString+',';
          end;

        Next;
      end;
      if strInsert<>'' then
      strInsert:=Copy(strInsert,0,Length(strInsert)-1);//去掉逗号

      if strDelete<>'' then
      strDelete:=Copy(strDelete,0,Length(strDelete)-1);//去掉逗号
    end;

    with DM.qryTemp do
    begin
      if strInsert<>'' then        //添加选择的设备，实际执行的SQL是将Group_Ptr这个字段的值设为主设备的RKEY。
      begin
        Close;
        SQL.Clear;
        if Frm_addEquipment.FormState='i' then    //如果是插入状态
          SQL.Text:='update data0417 set Group_Ptr='+IntToStr(rkey417)+' where rkey in ('+strInsert+')'
        else
          SQL.Text:='update data0417 set Group_Ptr='+dm.ADO417RKEY.AsString+' where rkey in ('+strInsert+')';
      //  ShowMessage(SQL.Text);
        ExecSQL;
      end;

      if strDelete<>'' then
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0417 set Group_Ptr=null where rkey in ('+strDelete+')';
    //    ShowMessage(SQL.Text);
        ExecSQL;
      end;
    end;
  end;
end;

procedure TFrm_Main.Popup2Popup(Sender: TObject);
begin
  if StrToInt(vprev )in [2,4] then
  begin
    with DM.ADO417DATA0417active_flag do
    if Value=1 then
    begin
      N_Edit.Enabled:=True;
      N_Delete.Enabled:=True;
      N_OK.Enabled:=True;
      N_Complete.Enabled:=False;
      N_Idle.Enabled:=True;
      N_Cancel_Idle.Enabled:=False;
    end
    else
    if Value=2 then
    begin
      N_Edit.Enabled:=False;
      N_Delete.Enabled:=False;
      N_OK.Enabled:=False;
      N_Complete.Enabled:=True;
      N_Idle.Enabled:=True;
      N_Cancel_Idle.Enabled:=True;
    end
    else
    if Value in[3,4] then
    begin
      N_Edit.Enabled:=False;
      N_Delete.Enabled:=False;
      N_OK.Enabled:=False;
      N_Complete.Enabled:=False;
      N_Idle.Enabled:=True;
      N_Cancel_Idle.Enabled:=True;
    end
    else
    if Value in[5,6] then
    begin
      N_Edit.Enabled:=False;
      N_Delete.Enabled:=False;
      N_OK.Enabled:=False;
      N_Complete.Enabled:=False;
      N_Idle.Enabled:=False;
      N_Cancel_Idle.Enabled:=True;
    end
    else
    if Value=7 then
    begin
      N_Edit.Enabled:=False;
      N_Delete.Enabled:=False;
      N_OK.Enabled:=False;
      N_Complete.Enabled:=False;
      N_Idle.Enabled:=False;
      N_Cancel_Idle.Enabled:=True;
    end;
  end
  else
  begin
      N_Edit.Enabled:=False;
      N_Delete.Enabled:=False;
      N_OK.Enabled:=False;
      N_Complete.Enabled:=False;
      N_Idle.Enabled:=False;
      N_Cancel_Idle.Enabled:=False;
  end;
 { if StrToInt(vprev)  in [1,3] then
  begin
    N_New.        Enabled:=False;
    N_Edit.       Enabled:=False;
    N_PartEdit.   Enabled:=False;
    N_Delete.     Enabled:=False;
    N_OK    .     Enabled:=False;
    N_Complete.   Enabled:=False;
  end;    }
end;

procedure TFrm_Main.SpeedButton1Click(Sender: TObject);
begin
  with DM.ADO417  do
  begin
    Close;
    CommandText:=  DM.Copy0417.SQL.Text+#10#13+'where 1=1 '+strStatusValue+#10#13+' order by fasset_code';
   // ShowMessage(CommandText);
    Open;
  end;
end;

procedure TFrm_Main.N_IdleClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if messagebox(Self.Handle,'你确定要将设备的状态改为闲置吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('update data0417 set active_flag=7 where rkey=:rkey');
    Parameters[0].Value:=DM.ADO417RKEY.Value;
    ExecSQL;
    BitBtn2Click(Sender);
  end;
end;

procedure TFrm_Main.N_Cancel_IdleClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if messagebox(Self.Handle,'你确定要将设备的状态改为新进吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('update data0417 set active_flag=1 where rkey=:rkey');
    Parameters[0].Value:=DM.ADO417RKEY.Value;
    ExecSQL;
    BitBtn2Click(Sender);
  end;
end;

end.
