unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  DBGrids;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BtnClose: TBitBtn;
    BtnRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BtnQuery: TBitBtn;
    BtnFieldsVisable: TBitBtn;
    DBGridEh1: TDBGridEh;
    Lab_Fielter: TLabel;
    Edt_Fielter: TEdit;
    PopupMenu1: TPopupMenu;
    Label21: TLabel;
    Edit2: TEdit;
    UpDown1: TUpDown;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    PopupMenu2: TPopupMenu;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox2: TCheckBox;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    N7: TMenuItem;
    N10: TMenuItem;
    GroupBox2: TGroupBox;
    Cbb_WareHouse: TComboBox;
    N5: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N13: TMenuItem;
    Label22: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Panel4: TPanel;
    Label24: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit8: TEdit;
    Label23: TLabel;
    Edit6: TEdit;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Edt_DeviNumb: TEdit;
    Label3: TLabel;
    Edt_DEPT_NAME: TEdit;
    Label4: TLabel;
    Edt_FASSET_NAME: TEdit;
    Label5: TLabel;
    Edt_ABBR_NAME: TEdit;
    Label7: TLabel;
    Edt_equipment_grade: TEdit;
    Label8: TLabel;
    Edt_LOCATION: TEdit;
    Label9: TLabel;
    Edt_DeviType: TEdit;
    Label10: TLabel;
    Edt_MainCycl: TEdit;
    Label6: TLabel;
    Edt_Impact: TEdit;
    Label11: TLabel;
    Edt_MainExecStat: TEdit;
    Label12: TLabel;
    Edt_d840_Location: TEdit;
    Label18: TLabel;
    Edt_MainImpl: TEdit;
    Label17: TLabel;
    Edt_Acomplish: TEdit;
    Label19: TLabel;
    Edt_User_Full_Name: TEdit;
    Label13: TLabel;
    Edt_StarMainTime: TEdit;
    Label14: TLabel;
    Edt_ActuCompTime: TEdit;
    Label15: TLabel;
    Edt_TimeCons: TEdit;
    Label16: TLabel;
    Edt_StdTimeCons: TEdit;
    Label20: TLabel;
    meno_Remark: TMemo;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    CheckBox8: TCheckBox;
    DBGridEh3: TDBGridEh;
    BitBtn3: TBitBtn;
    pm1: TPopupMenu;
    N18: TMenuItem;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BtnFieldsVisableClick(Sender: TObject);
    procedure Edt_FielterChange(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure BtnQueryClick(Sender: TObject);
    procedure DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure Cbb_WareHouseChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure meno_RemarkExit(Sender: TObject);
    procedure Edt_StdTimeConsKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_StdTimeConsExit(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edt_MainImplExit(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox8Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
  private
    PreColumn :TColumnEh;
    sql_text,ssql,sql821, strStatusValue,Log_USER_LOGIN_NAME,ware_house,strStatus :string;
    procedure StartMaintenance(vEmpl_ptr:string);
    procedure check848status();
    function find_error(v_rkey,v_status:Integer):Boolean;
    procedure CheckTime();
    procedure Assignment(Endtime:TDateTime);
    procedure CheckEditNull();
    procedure Exec_EndPause(vEmployeeRkey:string);
    procedure Acceptanceby(UserKey:string);
//    procedure item_click(sender: TObject);
    { Private declarations }
  public
    strsql:string;
    clickNum,QueryClick:Integer;
    function EmployeeStatusCheck(vEmpl_ptr:string;out vNUMBER:string):Boolean;
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo,common,DB, QuerySet, ColsDisplaySet_unt, formMultiSelectedItem,DateUtils,
  formGetUserRights, Edit, form_msg, formInputDlg, Pause, stdTimeCons,
  TimeQuery, IfReplaceFrm;

{$R *.dfm}

procedure Tfrm_main.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_main.BtnRefreshClick(Sender: TObject);
var
  rkey831:Integer;
begin
  rkey831 := DM.ADS831rkey.Value;
  with DM.ADS831 do
  begin
    Close;
    Open;
  end;
  if rkey831 >0 then
  DM.ADS831.Locate('rkey',rkey831,[]);
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
//  if not App_init_2(dm.ADOConnection1) then
//  begin
//    showmsg('程序起动失败请联系管理员!',1);
//    application.Terminate;
//    exit;
//  end;
  self.Caption:=application.Title;
  rkey73:='2551';
  user_ptr := '3054';
  vprev := '4';
end;

procedure Tfrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS831.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

//procedure Tfrm_main.item_click(sender: TObject);
//var i:byte;
//begin
//  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
//  for i:=0 to DBGridEh1.FieldCount-1 do
//  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
//  begin
//    if (sender as tmenuItem).Checked then
//    begin
//      DBGridEh1.Columns[i].Visible:=true;
//      break;
//    end
//    else
//    begin
//      DBGridEh1.Columns[i].Visible:=false;
//      break;
//    end;
//  end;
//end;

procedure Tfrm_main.FormShow(Sender: TObject);
//var
//  i:Integer;
//  item:TMenuItem;
begin
  PreColumn := DBGridEh1.Columns[1];
//  for i:=1 to DBGrideh1.Columns.Count do
//  begin
//    item := TmenuItem.Create(self) ;
//    item.Caption := dbgrideh1.Columns[i-1].Title.Caption ;
//    if dbgrideh1.Columns[i-1].Visible then
//      item.Checked := true ;
//    item.OnClick := item_click ;
//    self.PopupMenu2.Items.Add(item) ;
//  end;
  sql_text := DM.ADS831.CommandText;
  sql821 := DM.ADS821_old.CommandText;
  frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-10;
  frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0)+400;
  strStatusValue :=' and Data0831.RKEY832 in (1,3,4,5,6) ';
  strStatus := ' and d417.active_flag in (3,4) ';
  DM.ADS831.Close;
  dm.ADS831.CommandText := sql_text+strStatusValue+strStatus+ssql+' and (data0831.PlanMainDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+ ')'
    +' and (data0831.PlanMainDate <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
  
  DM.ADS831.Open;
  DM.ADS848.Open;
  with  DM.tmp do
  begin
    Close;
    SQL.Text := 'select RKEY,WAREHOUSE_CODE,ABBR_NAME from data0015';
    Open;
    First;
    while not Eof do
    begin
      Cbb_WareHouse.Items.Add(Trim(FieldByName('ABBR_NAME').AsString));
      Next;
    end;
    Cbb_WareHouse.Items.Add('全部');
    Cbb_WareHouse.ItemIndex := Cbb_WareHouse.Items.Count-1;
  end;

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
  PageControl1.ActivePage := TabSheet1;

  ResetGridColumns(Self,DM.ADOConnection1,StrToInt(rkey73),StrToInt(vprev)=2);

  DBGridEh1.FrozenCols := 5;
end;

procedure Tfrm_main.PageControl1Change(Sender: TObject);
begin
  BtnRefresh.Click;
  if (PageControl1.ActivePageIndex=1) and (not DM.ADs831.IsEmpty) and(CheckBox8.Checked) then
  begin
    DM.ADs468.Close;
    DM.ADs468.Parameters[0].Value:=DM.ADS831rkey.Value;
    DM.ADs468.Open;
  end;
  if (PageControl1.ActivePageIndex=1) and (not DM.ADs831.IsEmpty)then
  begin
    DM.ADS821.Close;
    DM.ADS821.CommandText := sql821 + ' and data0821.rkey831 = '+dm.ADS831rkey.AsString;
//    ShowMessage(DM.ADS821.CommandText);
    DM.ADS821.Open;
  end;
  DateTimePicker1.Date := DM.ADS831PlanMainDate.Value;
  Edt_DeviNumb.Text := DM.ADS831DeviNumb.Value;
  Edt_DEPT_NAME.Text := DM.ADS831DEPT_NAME.Value;
  Edt_FASSET_NAME.Text := DM.ADS831FASSET_NAME.Value;
  Edt_ABBR_NAME.Text := DM.ADS831ABBR_NAME.Value;
  Edt_Impact.Text := DM.ADS831Impact.Value;
  Edt_equipment_grade.Text := DM.ADS831equipment_grade.Value;
  Edt_LOCATION.Text := DM.ADS831LOCATION.Value;
  Edt_DeviType.Text := DM.ADS831DeviType.Value;
  Edt_MainCycl.Text := DM.ADS831MainCycl.Value;
  Edt_MainExecStat.Text := DM.ADS831MainExecStat.Value;
  Edt_d840_Location.Text := DM.ADS831d840_Location.Value;
  Edt_StarMainTime.Text := DM.ADS831StarMainTime.AsString;
  Edt_ActuCompTime.Text := DM.ADS831ActuCompTime.AsString;
  Edt_TimeCons.Text := DM.ADS831TimeCons.AsString;
  Edt_StdTimeCons.Text := DM.ADS831StdTimeCons.AsString;
  Edt_Acomplish.Text :=DM.ADS831Acomplish.Value;

//  if (dm.ADS831TimeCons.AsFloat <>0) and (Edt_StdTimeCons.Text <> '')then
//    Edt_Acomplish.Text :=FormatFloat('0.00',DM.ADS831StdTimeCons.Value/dm.ADS831TimeCons.AsFloat*100)+'%'
//  else
//    Edt_Acomplish.Text := '';

  Edt_MainImpl.Text := DM.ADS831MainImpl.Value;
  Edt_User_Full_Name.Text := DM.ADS831User_Full_Name.Value;
  meno_Remark.Lines.Text := DM.ADS831Remarks.Value;
  if StrToInt(vprev) in [3,4] then
  begin
    if DM.ADS831RKEY832.Value=1 then
    begin
      DateTimePicker1.Enabled :=True;
    end
    else
    begin
      DateTimePicker1.Enabled :=False;
    end;
  end
  else
  begin
    DateTimePicker1.Enabled :=False;
  end;
  if StrToInt(vprev) in [2,3,4]  then
  begin
    if DM.ADS831RKEY832.Value=3 then      //只有执行中 才能修改保养记录描述
    begin
      meno_Remark.Enabled:=True;
      Edt_MainImpl.Enabled := True;
    end
    else
    begin
      meno_Remark.Enabled := False;
      Edt_MainImpl.Enabled := False;
    end;
    if DM.ADS831RKEY832.Value in [1,3,4,5,6] then  //待执行（1），执行中，待验收，已通知，已暂停 状态可修改标准消耗时间
    begin
      Edt_StdTimeCons.Enabled := True;
    end
    else
    begin
      Edt_StdTimeCons.Enabled := False;
    end;
  end
  else
  begin
    Edt_StdTimeCons.Enabled := False;
    meno_Remark.Enabled := False;
  end;
end;

procedure Tfrm_main.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if DM.ADS831RKEY832.Value=1 then
  begin
    if (DM.ADS831PlanMainDate.AsDateTime <= Date) then
    begin
      AFont.Color :=clRed ;
    end
    else if (DM.ADS831PlanMainDate.AsDateTime =Date +1) then
    begin
      AFont.Color :=clBlue;
    end;
  end
  else if DM.ADS831RKEY832.Value=6 then
  begin
    AFont.Color := clGreen;
  end;

end;

procedure Tfrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS831.CommandText);
end;

procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker= smDownEh) or (Column.Title.SortMarker = smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    DM.ADS831.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    DM.ADS831.IndexFieldNames := Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Lab_Fielter.Caption := Column.Title.Caption;
    Edt_Fielter.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
    Edt_Fielter.Left := Lab_Fielter.Left + Lab_Fielter.Width + 5 ;
  end
  else
  Edt_Fielter.SetFocus;
end;

procedure Tfrm_main.BtnFieldsVisableClick(Sender: TObject);
begin
   show_ColsDisplaySet_frm (Self,DBGridEh1,StrToInt(rkey73)) ;
end;

procedure Tfrm_main.Edt_FielterChange(Sender: TObject);
begin
  if Trim(Edt_Fielter.Text)<>'' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+ Trim(Edt_Fielter.Text)+'%'''
  else
    DBGridEh1.DataSource.DataSet.Filter :='';
end;

procedure Tfrm_main.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  dbgrideh1.FrozenCols := newvalue;
end;

procedure Tfrm_main.BtnQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    DM.ADS831.Close;
    DM.ADS831.CommandText := sql_text;
    ssql :='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS831.CommandText := sql_text+strStatusValue+strStatus+ssql+ware_house+' and (data0831.PlanMainDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0831.PlanMainDate <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
    DM.ADS831.Open;
  end;
end;

procedure Tfrm_main.DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  SaveColsInfo(Self,StrToInt(rkey73));
end;

procedure Tfrm_main.CheckBox1Click(Sender: TObject);
begin
  strStatusValue :='';
  if CheckBox1.Checked then
    strStatusValue := '1,';
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
  //1待执行3执行中4待验收 2已验收5已通知6已暂停

  if strStatusValue <> '' then
    strStatusValue := ' and Data0831.RKEY832 in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')'+#13
  else
    strStatusValue := ' and Data0831.RKEY832 in (9)'+#13;

  With DM.ADS831 do
  begin
    Close;
    dm.ADS831.CommandText := sql_text+strStatusValue+strStatus+ssql+ware_house+' and (data0831.PlanMainDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0831.PlanMainDate <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
    Open;
  end;
end;

procedure Tfrm_main.Cbb_WareHouseChange(Sender: TObject);
begin
//  ware_house :='';
  if Cbb_WareHouse.Text='全部' then
    ware_house:=''
  else
    ware_house := ' and d15.ABBR_NAME ='+ QuotedStr(Cbb_WareHouse.Text);
  DM.ADS831.Close;
  DM.ADS831.CommandText := sql_text+ssql+strStatusValue+strStatus +ware_house+' and (data0831.PlanMainDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0831.PlanMainDate <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
  DM.ADS831.Open;
end;

procedure Tfrm_main.N1Click(Sender: TObject);
var
  rkey831:Integer;
begin
  frmMultiSelectedItem := TfrmMultiSelectedItem.Create(Application);

  if frmMultiSelectedItem.ShowModal = mrOk then
  begin
    try
      with DM.tmp do
      begin

        DM.ADOConnection1.BeginTrans;
        Close;
        SQL.Text := 'select d417.FASSET_NAME,d832.MainExecStat,d73.User_Full_Name,''定期保养'' as Impact,'+
         'd34.DEPT_NAME,d15.ABBR_NAME,d417.equipment_grade,d417.LOCATION,d840.Location as d840_Location,'+
         'data0831.rkey,data0831.PlanMainDate,data0831.DeviNumb,data0831.DeviType, data0831.MainCycl,'+
         'data0831.RKEY832,data0831.StarMainTime,data0831.ActuCompTime, data0831.MainImpl,data0831.Remarks,'+
         'data0831.TimeCons, data0831.MainAcce_UserPtr,data0831.StdTimeCons'+
         ' from data0831 join data0417 d417 on data0831.DeviNumb=d417.FASSET_CODE'+
         ' join data0034 d34 on d417.DEPT_PTR=d34.rkey join data0015 d15 on d417.warehouse_ptr=d15.rkey'+
         ' join data0832 d832 on data0831.RKEY832=d832.rkey left join data0073 d73 on data0831.MainAcce_UserPtr=d73.rkey'+
         ' left join data0840 d840 on d417.D840_ptr=d840.rkey ';
        Open;
        frmMultiSelectedItem.dt1.First;
        while not frmMultiSelectedItem.dt1.Eof do
        begin
          if frmMultiSelectedItem.Dgh1.FieldColumns['selected'].Field.AsBoolean = True then
          begin
            Append;
            FieldByName('PlanMainDate').Value := frmMultiSelectedItem.dt1.FieldByName('PlanMainDate').Value;
            FieldByName('DeviNumb').Value := frmMultiSelectedItem.dt1.FieldByName('Fasset_Code').Value;
//            FieldByName('FASSET_NAME').Value := frmMultiSelectedItem.dt1.FieldByName('FASSET_NAME').Value;
//            FieldByName('DEPT_Name').Value := frmMultiSelectedItem.dt1.FieldByName('DEPT_Name').Value;
//            FieldByName('ABBR_NAME').Value := frmMultiSelectedItem.dt1.FieldByName('ABBR_NAME').Value;
//            FieldByName('equipment_grade').Value := frmMultiSelectedItem.dt1.FieldByName('equipment_grade').Value;
//            FieldByName('LOCATION').Value := frmMultiSelectedItem.dt1.FieldByName('LOCATION').Value;
            FieldByName('DeviType').Value := frmMultiSelectedItem.dt1.FieldByName('DeviType').Value;
            FieldByName('MainCycl').Value := frmMultiSelectedItem.dt1.FieldByName('MainCycl').Value;
            FieldByName('RKEY832').Value := 1;
            FieldByName('StdTimeCons').Value := frmMultiSelectedItem.dt1.FieldByName('StdTimeCons').Value;
            Post;
            rkey831:=FieldByName('rkey').Value ;
            DM.ADS831.Close;
            DM.ADS831.Open;
            DM.ADS831.Locate('rkey',rkey831,[]);
            frmMultiSelectedItem.Dt1.Edit;
            frmMultiSelectedItem.Dt1.FieldByName('selected').AsBoolean:=False;
            frmMultiSelectedItem.Dt1.Post;
          end;
          frmMultiSelectedItem.Dt1.Next;
        end;
        DM.ADOConnection1.CommitTrans;


      end;

    except
      on E:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        MessageDlg(E.Message,mtError,[mbCancel],0);
      end;
    end;

    
  end;
end;

function Tfrm_main.find_error(v_rkey, v_status: Integer): Boolean;
begin
  with dm.tmp do
  begin
    Close;
    sql.Text:='select rkey from data0831 where rkey='+inttostr(v_rkey)+
              ' and rkey832='+inttostr(v_status);
    open;
  end;
  if dm.tmp.IsEmpty then
    Result:=True
  else
    result:=false;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
var
  i:integer;
  UserName:string;
  IsSenderMsg:Boolean;
begin
  if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  IsSenderMsg:=True;
  if (DM.ADS831.Active)and(not DM.ADS831.IsEmpty ) then
  begin
//    if messagebox(Self.Handle,'你确定要通知相关人员进行保养吗？','询问',MB_yesno+MB_iconquestion)=idNo then
//      Exit ;
    //2018-1-22取消手机短信发送 信息，下面代码注销
//    TempTable:='##PhoneMsg'+rkey73;   //临时名和登陆用户指针关联，即使不同的用户同时操作，也不会相互影响。
    with DM.tmp do
    begin
      Close;
      SQL.Text :='select rkey,User_FULL_NAME from data0073 where rkey= '+ rkey73;
      Open;
      UserName := FieldByName('User_FULL_NAME').AsString;
    end;
//    with   DghMain.DataSource.DataSet as TClientDataSet  do
    if   DBGridEh1.SelectedRows.Count   >   1   then  //如果用户选择的行数大于1，即多行。
      begin
        try
//          try
//            cdsMain.F_IsBatchOperating :=True;
//            cdsMain.DisableControls;
//            Screen.Cursor := crHourGlass;
//          if messagebox(Self.Handle,'需要正常微信通知部门负责人该设备要进行例行保养吗？','询问',MB_yesno+MB_iconquestion)= idNo then
//            IsSenderMsg:=False;
          DM.ADOConnection1.BeginTrans;

//          with DM.ADORead do    //2018-1-22取消手机短信发送 信息，下面代码注销
//          begin
//            Close;                                              //临时表已经存在，就将其删除并重新创建
//            SQL.Text:='if Exists(select * from tempdb.dbo.sysobjects  where name= '+QuotedStr(TempTable)+' and type= ''U'') '
//                      +' drop table '+TempTable+' create table  '+TempTable+' (Phone varchar(15),FASSET_ptr int,Msg varchar(1000)) '
//                      +' Create CLUSTERED INDEX INDEX'+TempTable+' ON '+TempTable+' ([Phone],[FASSET_ptr])';
//            ExecSQL;
//          end;

          for   i:=   DBGridEh1.SelectedRows.Count   -   1   downto   0   do
          begin
            DM.ADS831.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));


            with DM.tmp do
            begin
              Close;
              SQL.Text :='insert into data0821(Rkey831,Rkey17,Quantity,IfmustReplace,unit_ptr,ReplaceQuantity) '+#13+
                         '   select ' + dm.ADS831rkey.AsString + ',data0820.Rkey17,data0820.Quantity,data0820.IfMustReplace,data0820.Unit_ptr,0   '+#13+
                         '   from data0820 inner join data0417 on data0820.rkey417=data0417.rkey '+#13+
                         ' where data0417.Fasset_Code = '+ QuotedStr(DM.ADS831DeviNumb.AsString)+ #13+
                         '   and data0820.MainCycl = '+ QuotedStr(DM.ADS831MainCycl.AsString);
//              ShowMessage(SQL.Text);
              ExecSQL;
            end;

            with DM.tmp do
            begin
              Close;
              SQL.Text :='update data0831 set rkey832 =5 where rkey='+dm.ADS831rkey.AsString;
              ExecSQL;
            end;



//            with DM do
//            begin
//              cmdUpdate.Parameters.ParamByName('v1PlanMainDate').Value:=DateToStr(ADS831.FieldByName('PlanMainDate').Value);
//              cmdUpdate.Parameters.ParamByName('v2MainCycl').Value:=ADS831.FieldByName('MainCycl').Value;
//              cmdUpdate.Parameters.ParamByName('v3DeviNumb').Value:=ADS831.FieldByName('DeviNumb').Value;
//              cmdUpdate.Parameters.ParamByName('v4MainCycl').Value:=ADS831.FieldByName('MainCycl').Value;
//              cmdUpdate.Parameters.ParamByName('v5DeviNumb').Value:=ADS831.FieldByName('DeviNumb').Value;
//              cmdUpdate.Parameters.ParamByName('v7MainCycl').Value:=ADS831.FieldByName('MainCycl').Value;
//              cmdUpdate.Execute;                 //执行该存储过程，生成下一次的保养计划。
//            end;

            with DM.tmp do    //2018-1-24取消，改由下面的sql语句统一执行
            begin
              Close;
              SQL.Text := 'declare @LastDate datetime ,@classid  int '+
                '  select @LastDate=DateAdd(day,Cycl_Duration,'+quotedstr(DM.ADS831.FieldByName('PlanMainDate').AsString)+
                ')from DATA0816 WHERE MainCycl='+ QuotedStr(DM.ADS831.FieldByName('MainCycl').asstring)+
                '   if not exists(select * from data0831 where [PlanMainDate]=@LastDate ' +
                '   and [DeviNumb]='+ QuotedStr(DM.ADS831.FieldByName('DeviNumb').asstring)+' and [MainCycl]='+quotedstr(DM.ADS831.FieldByName('MainCycl').asstring)+') '+
                'begin   insert into data0831 (PlanMainDate,DeviNumb,DeviType,MainCycl,RKEY832,StdTimeCons) ' +
                '   select @LastDate,Fasset_Code,data0417.DeviType,data0812.MainCycl,1,'+
                '   StdTimeCons =(select top 1 StdTimeCons from [data0847] where [D417_ptr]=data0417.rkey and data0812.MainCycl= [data0847].MainCycl )' +
                '   from data0417 join data0812 on data0417.DeviType=data0812.DeviType    '+
                '   and Fasset_Code='+ QuotedStr(DM.ADS831.FieldByName('DeviNumb').asstring)+' and data0812.MainCycl= '+ QuotedStr(DM.ADS831.FieldByName('MainCycl').asstring) +#13+
                ' select @classid=@@identity '+#13+
  //              '   if not exists(select * from data0831 where [PlanMainDate]=@LastDate ' +
  //              '   and [DeviNumb]='+ QuotedStr(DM.ADS831.FieldByName('DeviNumb').asstring)+' and [MainCycl]='+quotedstr(DM.ADS831.FieldByName('MainCycl').asstring)+') '+
                ' insert into data0821(Rkey831,Rkey17,Quantity,IfmustReplace,unit_ptr,ReplaceQuantity)'+
                ' select @classid,data0820.Rkey17,data0820.Quantity,data0820.IfMustReplace,data0820.Unit_ptr'+
                ' ,0 from data0820 inner join data0417 on data0820.rkey417=data0417.rkey where data0417.Fasset_Code ='+
                QuotedStr(DM.ADS831DeviNumb.AsString)+' and data0820.MainCycl='+ QuotedStr(DM.ADS831MainCycl.AsString)+'  end';
              ExecSQL;
            end;

            if   IsSenderMsg=True then
            begin
              with DM.ADORead do     //微信发送保养信息
              begin
                Close;
                SQL.Text := 'insert into data0814(phonenumber,messagecontent,sendername,rkey73,sendtime)' +
                  ' select distinct data0834.Phone,ABBR_NAME+'+#13+' 部门：''+DEPT_NAME+'+#13+' 设备代码：''+FASSET_CODE+'+#13+'设备名称：''+FASSET_NAME+'+#13+'预计''' +
                  ' +CONVERT(varchar(100),data0831.PlanMainDate, 23)+''进行保养。''as msg,'
                  + #13#10 + '''系统生成'',data0834.User_ptr,getdate()' +
                  ' from data0417 ' +
                  ' join data0034 on data0417.Dept_Ptr=data0034.rkey ' +
                  ' join data0834 on data0834.DeptCode=data0034.Dept_Code and  data0834.warehouse_ptr=data0417.warehouse_ptr' +
                  ' join data0831 on data0831.DeviNumb=data0417.Fasset_Code ' +
                  ' join data0015 on data0417.warehouse_ptr=data0015.rkey' +
                  ' where data0831.rkey=  '+dm.ADS831rkey.AsString;
                ExecSQL;
              end;

//              with DM.ADORead do               //将和该设备编号对应部门的对就信息接收人的记录插入临时表中
//              begin                 //2018-1-22取消手机短信发送 信息，下面代码注销
//                Close;
//                SQL.Text:=
//                 'insert into '+TempTable+'(FASSET_ptr,Phone,Msg)'
//                +#13+'(select distinct data0417.rkey, data0834.Phone,ABBR_NAME+'' 部门：''+DEPT_NAME+'' 设备代码：''+FASSET_CODE+''，设备名称：''+FASSET_NAME+''，预计'' '
//                +#13+' +CONVERT(varchar(100),data0831.PlanMainDate, 23)+''进行保养。''as msg  '
//                +#13+'from data0417  '
//                +#13+'join data0034 on data0417.Dept_Ptr=data0034.rkey  '
//                +#13+'join data0834 on data0834.DeptCode=data0034.Dept_Code and  data0834.warehouse_ptr=data0417.warehouse_ptr   '
//                +#13+'join data0831 on data0831.DeviNumb=data0417.Fasset_Code '
//                +#13+'join data0015 on data0417.warehouse_ptr=data0015.rkey '
//                +#13+'where data0831.rkey=  '+dm.ADS831rkey.AsString+')';
//                ExecSQL;
//              end;
            end;

          end;

          DM.ADOConnection1.CommitTrans;
        except
          on e:Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            ShowMessage('通知失败！'+#13#10+e.Message);
          end;
        end;
//          finally
//            cdsMain.F_IsBatchOperating :=False;
//            cdsMain.EnableControls;
//            Screen.Cursor := crDefault;
//          end;
        //跨服务器插入数据不能写在事务里面
//        with DM.ADORead do      //2018-1-22取消手机短信发送 信息，下面代码注销
//        begin
//          Close;
//          SQL.Text:='SELECT distinct  Phone,Msg FROM '+TempTable;
//          Open;
//
//          if IsEmpty=False then
//          if   IsSenderMsg=True then
//          while not Eof do
//          begin
//
//            DM.tmp.Close;
//            DM.tmp.SQL.Text:=  'insert [172.18.9.10].[WzSmsCenter].dbo.[tblsms_outbox]'+//'insert ['+vSUPLFEDSHIP+'].'+vSUPLFEDMAT+'.dbo.'+vSUPLFEDMISC+
//                      '(phonenumber,messagecontent,sendername,companyid) '+
//                      'values ('+quotedstr(FieldByName('Phone').AsString)+','+quotedstr(FieldByName('Msg').AsString)+','+quotedstr(UserName)+',9)';
//            DM.tmp.ExecSQL;
//            Next;
//          end;
//
//        end;

      end
    else
      begin
        try
          if messagebox(Self.Handle,'需要正常微信通知部门负责人该设备要进行例行保养吗？','询问',MB_yesno+MB_iconquestion)= idNo then
            IsSenderMsg:=False;
//            Screen.Cursor := crHourGlass;
            DM.ADOConnection1.BeginTrans;

            with DM.tmp do
            begin
              Close;
              SQL.Text :='insert into data0821(Rkey831,Rkey17,Quantity,IfmustReplace,unit_ptr,ReplaceQuantity) '+#13+
                         '   select ' + dm.ADS831rkey.AsString + ',data0820.Rkey17,data0820.Quantity,data0820.IfMustReplace,data0820.Unit_ptr,0   '+#13+
                         '   from data0820 inner join data0417 on data0820.rkey417=data0417.rkey '+#13+
                         ' where data0417.Fasset_Code = '+ QuotedStr(DM.ADS831DeviNumb.AsString)+ #13+
                         '   and data0820.MainCycl = '+ QuotedStr(DM.ADS831MainCycl.AsString)+ #13+
                         ' and Data0820.rkey17 not in (select rkey17 from data0821 where rkey831 = '+ dm.ADS831rkey.AsString +')';
//              ShowMessage(SQL.Text);
              ExecSQL;
            end;


          with DM.tmp do
          begin
            Close;
            SQL.Text :='update data0831 set rkey832 =5 where rkey='+dm.ADS831rkey.AsString;
            ExecSQL;                             //将状态改为“已通知 ”
          end;

//          with DM do   //2018-1-24取消，改由下面的sql语句统一执行
//          begin
//            cmdUpdate.Parameters.ParamByName('v1PlanMainDate').Value:=DateToStr(ADS831.FieldByName('PlanMainDate').Value);
//            cmdUpdate.Parameters.ParamByName('v2MainCycl').Value:=ADS831.FieldByName('MainCycl').Value;
//            cmdUpdate.Parameters.ParamByName('v3DeviNumb').Value:=ADS831.FieldByName('DeviNumb').Value;
//            cmdUpdate.Parameters.ParamByName('v4MainCycl').Value:=ADS831.FieldByName('MainCycl').Value;
//            cmdUpdate.Parameters.ParamByName('v5DeviNumb').Value:=ADS831.FieldByName('DeviNumb').Value;
//            cmdUpdate.Parameters.ParamByName('v7MainCycl').Value:=ADS831.FieldByName('MainCycl').Value;
//            cmdUpdate.Execute;                                   //执行该存储过程，生成下一次的保养计划。
//          end;
          with DM.tmp do
          begin
            Close;
            SQL.Text := 'declare @LastDate datetime ,@classid  int '+
              '  select @LastDate=DateAdd(day,Cycl_Duration,'+quotedstr(DM.ADS831.FieldByName('PlanMainDate').AsString)+
              ')from DATA0816 WHERE MainCycl='+ QuotedStr(DM.ADS831.FieldByName('MainCycl').asstring)+
              '   if not exists(select * from data0831 where [PlanMainDate]=@LastDate ' +
              '   and [DeviNumb]='+ QuotedStr(DM.ADS831.FieldByName('DeviNumb').asstring)+' and [MainCycl]='+quotedstr(DM.ADS831.FieldByName('MainCycl').asstring)+') '+
              'begin   insert into data0831 (PlanMainDate,DeviNumb,DeviType,MainCycl,RKEY832,StdTimeCons) ' +
              '   select @LastDate,Fasset_Code,data0417.DeviType,data0812.MainCycl,1,'+
              '   StdTimeCons =(select top 1 StdTimeCons from [data0847] where [D417_ptr]=data0417.rkey and data0812.MainCycl= [data0847].MainCycl )' +
              '   from data0417 join data0812 on data0417.DeviType=data0812.DeviType    '+
              '   and Fasset_Code='+ QuotedStr(DM.ADS831.FieldByName('DeviNumb').asstring)+' and data0812.MainCycl= '+ QuotedStr(DM.ADS831.FieldByName('MainCycl').asstring) +#13+
              ' select @classid=@@identity '+#13+
//              '   if not exists(select * from data0831 where [PlanMainDate]=@LastDate ' +
//              '   and [DeviNumb]='+ QuotedStr(DM.ADS831.FieldByName('DeviNumb').asstring)+' and [MainCycl]='+quotedstr(DM.ADS831.FieldByName('MainCycl').asstring)+') '+
              ' insert into data0821(Rkey831,Rkey17,Quantity,IfmustReplace,unit_ptr,ReplaceQuantity)'+
              ' select @classid,data0820.Rkey17,data0820.Quantity,data0820.IfMustReplace,data0820.Unit_ptr'+
              ' ,0 from data0820 inner join data0417 on data0820.rkey417=data0417.rkey where data0417.Fasset_Code ='+
              QuotedStr(DM.ADS831DeviNumb.AsString)+' and data0820.MainCycl='+ QuotedStr(DM.ADS831MainCycl.AsString)+'  end';
//            ShowMessage( SQL.Text);
//            ShowMessage( FieldByName('PlanMainDate').AsString);
            ExecSQL;



          end;

          if   IsSenderMsg=True then     //微信发送保养信息
            with DM.ADORead do
            begin
              Close;
              SQL.Text := 'insert into data0814(phonenumber,messagecontent,sendername,rkey73,sendtime)' +
                ' select distinct data0834.Phone,ABBR_NAME+'' 部门：''+DEPT_NAME+'' 设备代码：''+FASSET_CODE+''设备名称：''+FASSET_NAME+''，预计''' +
                ' +CONVERT(varchar(100),data0831.PlanMainDate, 23)+''进行保养。''as msg,'
                + #13#10 + '''系统生成'',data0834.User_ptr,getdate()' +
                ' from data0417 ' +
                ' join data0034 on data0417.Dept_Ptr=data0034.rkey ' +
                ' join data0834 on data0834.DeptCode=data0034.Dept_Code and  data0834.warehouse_ptr=data0417.warehouse_ptr' +
                ' join data0831 on data0831.DeviNumb=data0417.Fasset_Code ' +
                ' join data0015 on data0417.warehouse_ptr=data0015.rkey' +
                ' where data0831.rkey=  '+dm.ADS831rkey.AsString;
              ExecSQL;
            end;
          DM.ADOConnection1.CommitTrans;
        except
          on e:Exception do
          begin

            DM.ADOConnection1.RollbackTrans;    //跨多个数据库的时候，不能使用事务。
//            cdsMain.Cancel;
//            cdsMain.Refresh;
            ShowMessage('通知失败！'+#13#10+e.Message);
          end;
        end;
//          if   IsSenderMsg=True then     //2018-1-22取消手机短信发送 信息，下面代码注销
//          with dm.ADORead do
//          begin
//
//            Close;
//            SQL.Text:=                     //将和该设备编号对应部门的对就信息接收人的记录插入临时表中
//            'select distinct data0834.Phone,ABBR_NAME+'' 部门：''+DEPT_NAME+'' 设备代码：''+FASSET_CODE+''，设备名称：''+FASSET_NAME+''，预计'' '
//            +#13+' +CONVERT(varchar(100),data0831.PlanMainDate, 23)+''进行保养。''as msg  '
//            +#13+'from data0417  '
//            +#13+'join data0034 on data0417.Dept_Ptr=data0034.rkey  '
//            +#13+'join data0834 on data0834.DeptCode=data0034.Dept_Code and  data0834.warehouse_ptr=data0417.warehouse_ptr   '
//            +#13+'join data0831 on data0831.DeviNumb=data0417.Fasset_Code '
//            +#13+'join data0015 on data0417.warehouse_ptr=data0015.rkey '
//            +#13+'where data0831.rkey=  '+dm.ADS831rkey.AsString;
//            Open;
//
//            while not Eof do
//            begin
//              DM.tmp.Close;
//              DM.tmp.SQL.Text:='insert [172.18.9.10].[WzSmsCenter].dbo.[tblsms_outbox]'//'insert ['+vSUPLFEDSHIP+'].'+vSUPLFEDMAT+'.dbo.'+vSUPLFEDMISC
//                        +'(phonenumber,messagecontent,sendername,companyid) '
//                        +#13+'values ('+quotedstr(FieldByName('Phone').AsString)+','
//                           +quotedstr(FieldByName('Msg').AsString)+','+quotedstr(UserName)+',9)';
//              dm.tmp.ExecSQL;
//
//              Next;
//            end;
//
//          end;

      end;
//    SetButtonStatus;
//    dsMainStateChange(nil);
  end;
  BtnRefreshClick(sender);

end;

procedure Tfrm_main.N3Click(Sender: TObject);
begin
  if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end ;
  with   DM.tmp  do
  if not DM.ADS831.IsEmpty  then
  begin
    if messagebox(Self.Handle,'你确定要取消通知吗？','询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;
    Close;
    SQL.Text := 'update data0831 set rkey832 =1 where rkey='+dm.ADS831rkey.AsString;
    ExecSQL;                                                 //将状态改为“待执行”

//    Close;
//    SQL.Text := 'delete from data0821 where rkey831 ='+dm.ADS831rkey.AsString;
//    ExecSQL;                                                 //将状态改为“待执行”
  end;
  BtnRefreshClick(Sender);
end;

procedure Tfrm_main.N12Click(Sender: TObject);
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
    Log_USER_LOGIN_NAME:=DM.tmp.FieldValues['USER_LOGIN_NAME'];
    DM.tmp.Close;
    ShowMessage('你已重置当前程序的登陆用户名，操作完成后务必关闭！！！');

  end;
end;

function Tfrm_main.EmployeeStatusCheck(vEmpl_ptr: string;
  out vNUMBER: string): Boolean;
begin
  Result:=False;
  with DM.ADORead do
  begin
    Close;
    SQL.Text:='select NUMBER from data0842 join data0567 on data0842.work_ptr=data0567.rkey where data0842.empl_ptr='
      +vEmpl_ptr+' and data0842.[status]=3';
    Open;
    if IsEmpty=False then         //如果该雇员存在未完成的记录，返回值为真
    begin
      ShowMessage('你在维修单：“'+FieldByName('NUMBER').AsString+'”中有执行中的状态！！！') ;
      Result:=True;
    end;

    Close;
    SQL.Text:='select CONVERT(varchar(100),PlanMainDate, 23)+'' ''+DeviNumb+'' ''+MainCycl as NUMBER'
         +' from data0831 join data0848 on data0848.work_ptr=data0831.rkey '
         +' where data0848.empl_ptr='+vEmpl_ptr+' and data0848.[status]=3';
    Open;
    if IsEmpty=False then         //如果该雇员存在未完成的记录，返回值为真
    begin
      ShowMessage('你在保养单：“'+FieldByName('NUMBER').AsString+'”中有执行中的状态！！！') ;
      Result:=True;
    end;
  end;
end;

procedure Tfrm_main.StartMaintenance(vEmpl_ptr: string);
var
  NowDate:TDateTime;
  vEMPLOYEE_NAME:string;
  vNUMBER:string;
begin
  try
    Screen.Cursor := crHourGlass;
    if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
    begin
      ShowMessage('状态已经改变，请刷新');
      Exit;
    end ;
    if  not DM.ADS831.IsEmpty then
    begin
      if EmployeeStatusCheck(vEmpl_ptr,vNUMBER) then
      begin
        Exit;
      end;
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005 where ACTIVE_FLAG=''Y''';
        Open;
      end;
      if DM.tmp.Locate('rkey',StrToInt(vEmpl_ptr),[])=False   then
      begin
        ShowMessage('没有找到你的雇员信息，无法添加！！！');
        Exit;
      end;
      vEMPLOYEE_NAME:=DM.tmp.Lookup('rkey',StrToInt(vEmpl_ptr),'EMPLOYEE_NAME')   ;

      NowDate:=getsystem_date(DM.tmp,0);

      try
        DM.ADOConnection1.BeginTrans;
        with DM.tmp do
        begin
          Close;
          if DM.ADS831.FieldByName('StarMainTime').IsNull then    //如果 '保养开始时间'是空，获取当前数据库服务器的时间
            SQL.Text := 'update data0831 set rkey832 =3,MainImpl='+QuotedStr(vEMPLOYEE_NAME)+',StarMainTime='+        //将状态改为“已执行 ”
            QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',NowDate))+' where rkey='+dm.ADS831rkey.AsString
          else
            SQL.Text := 'update data0831 set rkey832 =3,MainImpl='+QuotedStr(vEMPLOYEE_NAME)+' where rkey='+dm.ADS831rkey.AsString;
          ExecSQL;
        end;

        with DM.tmp do
        begin
          Close;                                      //自动添加维修受理的维修人员记录。
          SQL.Text:='insert into data0848(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status)values('
          +DM.ADS831rkey.AsString+',CONVERT(VARCHAR(10),GETDATE(),120),'
          + QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',NowDate))
          +','+vEmpl_ptr+','+'3' +')' ;
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
      except
        on e:Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('提交失败！'+#13#10+e.Message);
        end;
      end;
    end;
    BtnRefreshClick(Self);
  finally
    Screen.Cursor := crDefault;
  end;

end;



procedure Tfrm_main.N4Click(Sender: TObject);
begin
  if messagebox(Self.Handle,'你确定要开始保养吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  StartMaintenance(user_ptr);
end;

procedure Tfrm_main.N5Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if GetUserRights(Self,DM.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户保养') then
  begin
    if (StrToInt(vUser_rights) in[2,3,4])=False then
    begin
      ShowMessage('你没有保养的权限！');
      Exit;
    end;
    StartMaintenance(vEmployeeRkey) ;
  end;
end;

procedure Tfrm_main.N14Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights,vNUMBER:string;
begin
  if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;

  DM.ADS848.First;
  if   DM.ADS848.IsEmpty then
  begin
    if messagebox(Self.Handle,Pchar('你选择的保养单日期是“'+dm.ADS831PlanMainDate.AsString+'”设备名称是“'+dm.ADS831FASSET_NAME.asString +'”，'
         +#13+'你要继续吗？'),'询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;
  end
  else
  begin
    if messagebox(Self.Handle,Pchar('你选择的保养单日期是“'+dm.ADS831PlanMainDate.AsString+'”设备名称是“'+dm.ADS831FASSET_NAME.asString +'”，'
         +#13+ '第一保养人是“'+dm.ads848.FieldByName('EMPLOYEE_NAME').asString +'”,你要继续吗？'),'询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;
  end ;

  if GetUserRights(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'输入用户名和密码') then
  begin
    if (strtoint(vUser_rights)in [2,3,4])=False then
    begin
      messagedlg('对不起,您没有添加雇员的权限！',mtinformation,[mbok],0)  ;
      Exit ;
    end;
    if EmployeeStatusCheck(vEmployeeRkey,vNUMBER) then
    begin
      Exit;
    end;

    if DM.ADS848.IsEmpty=False then
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey  from data0848 where Work_ptr='+dm.ADS848Work_ptr.AsString
      +' and  WorkDate=CONVERT(VARCHAR(10),GETDATE(),120) and Empl_ptr='+vEmployeeRkey+' and EndTime>=getDate()' ;
      Open;

      if IsEmpty=False then
      begin
        ShowMessage('你今天在本维修单已存在工作记录，本次的开始时间不能小于'+#13+'或等于上次的结束时间，因此无法添加！！！');
        Exit;
      end;
    end;
    try

      with DM.tmp do
      begin
        Close;                                              //自动添加维修受理的维修人员记录。
        SQL.Text:='insert into data0848(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status)values('
        +DM.ADS831rkey.AsString+',CONVERT(VARCHAR(10),GETDATE(),120),'
        + QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(DM.ADORead,0)))
        +','+vEmployeeRkey+','+'3' +')' ;
        ExecSQL;
        ShowMessage('新增操作成功');
      end;
    finally
      BtnRefreshClick(Sender);
    end;
  end;

end;

procedure Tfrm_main.check848status;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,status from data0848 where rkey='+dm.ADS848rkey.AsString;
    Open;
    if IsEmpty then
    begin
      ShowMessage('此记录已经删除,请刷新');
      Abort;
    end;
    if FieldByName('status').Value<>DM.ADS848Status.Value then
    begin
      ShowMessage('此记录状态已经改变,请刷新');
      Abort;
    end;
  end;
end;

procedure Tfrm_main.N15Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if DM.ADS848.IsEmpty then
  Exit;
  check848status();
  if GetUserRights(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'编辑',
         Log_USER_LOGIN_NAME ) then
  begin
    if (strtoint(vUser_rights)in [2,3,4])=False then
    begin
      messagedlg('对不起,您没有权限！',mtinformation,[mbok],0)  ;
      Exit ;
    end;
    if (DM.ADS848Empl_ptr.AsInteger <> StrToInt(vEmployeeRkey ))and((strtoint(vUser_rights)in [4])=False)then
    begin
      messagedlg('对不起,您不是最高权限，只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
      Exit ;
    end;
    try
      
      frm_Edit := Tfrm_Edit.Create(Application);
//      frm_Edit.v_state := 1;
    //    frm_Edit.transferEmployeeRkey(vEmployeeRkey);
      frm_Edit.rkey848 := DM.ADS848Rkey.Value;
      frm_Edit.DateTimePicker1.Date := DM.ADS848BeginTime.Value;
      frm_Edit.DateTimePicker2.Time := DM.ADS848BeginTime.Value;
      frm_Edit.DateTimePicker3.Date := DM.ADS848EndTime.Value;
      frm_Edit.DateTimePicker4.Time := DM.ADS848EndTime.Value;
      frm_Edit.Edt_timereset.Text := DM.ADS848TimeRest.AsString;
      frm_Edit.Edt_DayShift.Text := DM.ADS848DayShift.AsString;
      frm_Edit.Memo_Remark.Lines.Text := DM.ADS848Remark.Value;
      if frm_Edit.ShowModal=mrok then
      begin
        BtnRefreshClick(Sender);
        DM.ADS848.Close;
        DM.ADS848.Open;
        DM.ADS848.Locate('rkey',frm_Edit.rkey848,[]);
        ShowMessage('编辑操作成功');
      end;

    finally
      frm_Edit.Free;
    end;
  end;

end;

procedure Tfrm_main.N16Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
  UniqueRecord:Boolean;
begin
  UniqueRecord:=False;
  with DM.ADS848 do
  if (Active)and( not IsEmpty) then
  begin
    if recordcount=1 then
    begin
      if  messagedlg('唯一保养人即将删除，你确定将维修单将退回到待受理状态吗?',mtconfirmation,[mbyes,mbcancel],0)=mrCancel then
      begin
        Exit;
      end
      else
      begin
        UniqueRecord:=True;
      end;
    end;
    check848status();
    if GetUserRights(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'删除',
          Log_USER_LOGIN_NAME) then
    begin
      if (strtoint(vUser_rights)in [2,3,4])=False then
      begin
        messagedlg('对不起,您没有权限！',mtinformation,[mbok],0)  ;
        Exit ;
      end;
      if DM.ADS848Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
      begin
        messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
        Exit ;
      end;
      
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'SELECT data0831.rkey,data0831.RKEY832, data0831.StarMainTime, data0831.MainImpl, data0831.Remarks,'+
                ' data0831.StdTimeCons from data0831 where data0831.rkey=' +dm.ADS831rkey.AsString;
        Open;

        if UniqueRecord then
        begin
          Edit;
          FieldByName('RKEY832').Value:= 5;      //已通知
          FieldByName('StarMainTime').Value:= null;
          FieldByName('MainImpl').Value:=null;
          FieldByName('Remarks').Value:='';
          Post;
        end;

        Close;
        SQL.Text := 'delete data0848 where rkey ='+dm.ADS848rkey.AsString;
        if ExecSQL>0 then
        begin
          common.ShowMsg('删除操作成功！',1);

        end;
        self.BtnRefreshClick(Sender);
      end;
    end;
  end;

end;

procedure Tfrm_main.Assignment(Endtime: TDateTime);     //个人结束时改变子表状态
var
  rkey848:Integer;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select  Data0848.rkey, Data0848.Work_ptr, Data0848.WorkDate, Data0848.BeginTime,'+
       'Data0848.EndTime,  Data0848.TimeRest, Data0848.Empl_ptr,'+
       'Data0848.Status, Data0848.WorkTime, Data0848.Remark, Data0848.DayShift,'+
       'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat'+#13+
       'from Data0848 left join data0005 on Data0848.Empl_ptr=data0005.rkey '+
       'join data0832 on Data0848.Status=data0832.rkey where data0848.rkey ='+dm.ADS848Rkey.AsString;
    Open;
    Edit;
    FieldByName('EndTime').Value := Endtime;
    FieldByName('status').Value := 7;
//    FieldByName('WorkTime').Value := MinutesBetween(DM.ADS842BeginTime.Value,Endtime)/60.0-FieldByName('TimeRest').Value;
    Post;
    rkey848 := DM.ADS848rkey.Value;
    DM.ADS848.Close;
    DM.ADS848.Open;
    DM.ADS848.Locate('rkey',rkey848,[]);
    DM.QryResultTime.Close;
    DM.QryResultTime.Parameters.ParamByName('vbeginTime').Value:=DM.ADS848BeginTime.Value;
    DM.QryResultTime.Parameters.ParamByName('vEndTime').Value:=DM.ADS848EndTime.Value;
    DM.QryResultTime.Open;
    Edit;
    FieldByName('TimeRest').Value:= DM.QryResultTime.FieldList[0].Value;
    Post;
    Edit;
    FieldByName('WorkTime').Value := MinutesBetween(DM.ADS848BeginTime.Value,Endtime)/60.0-FieldByName('TimeRest').Value;
    Post;
//    ShowMessage(DM.ADS842EndTime.AsString);
//    ShowMessage(DM.ADS842TimeRest.AsString);
  end;

end;

procedure Tfrm_main.CheckTime;         //当时间大于12小时时，并且开始时间在八点前，结束时间在八点后确认班次
var
  BeginTime,endTime,S:Integer;
  NowDate:TDateTime;
begin
  NowDate := common.getsystem_date(DM.tmp,0);
  if (DM.ADS848BeginTime.IsNull=False) then
    BeginTime:= HourOf(DM.ADS848BeginTime.AsDateTime)
  else
    BeginTime := HourOf(NowDate);
  if (DM.ADS848EndTime.IsNull=False) then
    endTime:= HourOf(DM.ADS848EndTime.AsDateTime)
  else
    endTime:= HourOf(NowDate);

  if ((BeginTime<8) and  (endTime>=8))or(MinutesBetween(DM.ADS848BeginTime.Value,NowDate)>720) then
  begin
    S:=Show_Msg(Self,'请重新确认你的班次',['']);
    with DM.tmp do
    begin
      Close;
      SQL.Text :='select  Data0848.rkey, Data0848.Work_ptr, Data0848.WorkDate, Data0848.BeginTime,'+
       'Data0848.EndTime, Data0848.TimeRest, Data0848.Empl_ptr,'+
       'Data0848.Status, Data0848.WorkTime, Data0848.Remark, Data0848.DayShift,'+
      ' data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat '+
       'from    Data0848 left join data0005 on Data0848.Empl_ptr=data0005.rkey'+
       ' join data0832 on Data0848.Status=data0832.rkey where data0848.rkey='+dm.ADS848Rkey.AsString;
      Open;
    end;
    if s=1 then
      begin
        DM.tmp.Edit;
        DM.tmp.FieldByName('DayShift').Value := 1;
        DM.tmp.Post;
      end
    else
    if  S=2 then
      begin
        DM.tmp.Edit;
        DM.tmp.FieldByName('DayShift').Value := 2;
        DM.tmp.Post;
      end
    else
      Abort;
  end;

end;

procedure Tfrm_main.CheckEditNull;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,remarks from data0831 where rkey ='+ DM.ADS831rkey.AsString;
    Open;
  end;

  if DM.tmp.FieldByName('remarks').AsString =''    then
  begin
    messagedlg('对不起,请输入保养记录描述!',mtinformation,[mbok],0);
    PageControl1.TabIndex:=1;
    PageControl1Change(Self);
//    Memo_maintain_text.SetFocus;
    Abort;
  end;
end;

procedure Tfrm_main.N17Click(Sender: TObject);    //个人结束
var
  Endtime,worktime:TDateTime;
  rkey848:Integer;
  islast : Boolean;
  strReason,vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if DM.ADS848.IsEmpty then
  Exit;
  Endtime := common.getsystem_date(DM.tmp,0);

  if  Endtime < DM.ADS848BeginTime.Value then
  begin
    ShowMessage('结束日期不能小于开始日期,请重新编辑开始日期！！！');
    Exit;
  end;
  if DM.ADS848Status.Value=7 then
  begin
    ShowMessage('本条记录已操作，请选择下一条');
    DM.ADS848.Next;
    Exit;
  end;
  if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  check848status();
  with DM.tmp do
  begin

    Close;
    SQL.Text := 'select rkey,status from data0848 where data0848.work_ptr ='+dm.ADS831rkey.AsString;
    Open;
    islast := True;
    First;
    while not Eof do
    begin
      if (DM.tmp.FieldByName('status').Value<>7) and (DM.tmp.FieldByName('rkey').Value <> DM.ADS848rkey.Value) then
      begin
        islast:=False;
        break;
      end;
      Next;
    end;
  end;

  try
    if islast=False then
    begin
      if GetUserRights(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,
      '雇员维修记录结束',Log_USER_LOGIN_NAME) then
      begin
        if (strtoint(vUser_rights)in [2,3,4])=False then
        begin
          messagedlg('对不起,您没有结束雇员的权限！',mtinformation,[mbok],0)  ;
          Exit ;
        end;
        if DM.ADS848Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
        begin
          messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
          Exit ;
        end;
        CheckTime();
        Assignment(Endtime);
//        ModifyTimeRest;
      end;
    end
    else
    begin
     // BtnRefreshClick(Sender);
      if messagedlg('这是最后一行状态是“执行中”的雇员记录，你要完工该保养记录吗?'+#13
                 +'完工点YES，暂停点NO。',mtconfirmation,[mbyes,mbno],0)=mrYes then
      begin
//        with DM.tmp do
//        begin
//          Close;
//          SQL.Text := 'select rkey,fail_type,maintain_text from data0567 where rkey ='+ DM.ADS567RKEY.AsString;
//          Open;
//        end;
//        PageControl1.TabIndex:=1;

        rkey848 := DM.ADS848rkey.Value;
        PageControl1Change(Self);
        CheckEditNull();

        DM.ADS848.Locate('rkey',rkey848,[]);

//        if DM.ADS842Empl_ptr.AsInteger<> StrToInt(user_ptr )then
        if GetUserRights(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'雇员保养记录结束',dm.ADS848EMPL_CODE.Value) then
        begin
          if (strtoint(vUser_rights)in [2,3,4])=False then
          begin
            messagedlg('对不起,您没有结束雇员的权限！',mtinformation,[mbok],0)  ;
            Exit ;
          end;
          if DM.ADS848Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
          begin
            messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0);
            Exit ;
          end;
          CheckTime();
//          ModifyTimeRest;

          //以下一段代码为2018-1-26增加更换材料输入
          try
            FrmIfReplace := TFrmIfReplace.Create(Self);
            DM.ads821_Old.Close;
            DM.ads821_Old.CommandText := sql821 + ' and data0821.rkey831 = '+ DM.ADS831rkey.AsString;

            DM.ads821_Old.Open;
            FrmIfReplace.FVisible := 0;
            if not DM.ads821_Old.IsEmpty then
            if FrmIfReplace.ShowModal = mrok then
            begin
              DM.ads821_Old.First;
              while not DM.ads821_Old.Eof do
              begin
                if (DM.ads821_OldIfmustReplace.AsBoolean = True) and (DM.ads821_OldNeedReplaceQuantitys.Value > 0) then
                begin
                  ShowMessage('必须更换的材料代码为:'+dm.ads821_OldINV_PART_NUMBER.AsString+'还有未更换的数量，请更换后再完成保养');
                  Exit;
                end;
                if DM.ads821_OldNeedReplaceQuantitys.Value < 0 then
                begin
                  if messagedlg('材料代码为:'+dm.ads821_OldINV_PART_NUMBER.AsString+'更换的数量大于需要更换的材料数量,是否更换?'+#13
                     +'更换点YES，不更换点NO。',mtconfirmation,[mbyes,mbno],0)<>mrYes then Exit;
                end;
                DM.ads821_Old.Next;
              end;

            end
            else
            begin
              Exit;
            end;
          finally
            FrmIfReplace.Free;
          end;

          try
            DM.ADOConnection1.BeginTrans;
            Assignment(Endtime);
            if DM.ads821_Old.Active then DM.ads821_Old.UpdateBatch();
            with DM.tmp do
            begin
              Close;
              SQL.Text := 'select rkey,rkey832,ActuCompTime,TimeCons from data0831 where rkey='+dm.ADS831rkey.AsString;
              Open;
              Edit;
              FieldByName('rkey832').Value := 4;
              FieldByName('ActuCompTime').Value := Endtime;

              worktime:=0;

              DM.ADORead.Close;
              DM.ADORead.SQL.Text:='select rkey,status,WorkTime,begintime,EndTime,TimeRest from data0848 where data0848.work_ptr ='+dm.ADS831rkey.AsString;
              DM.ADORead.Open;
              DM.ADORead.First;
              while not DM.ADORead.Eof do
              begin
                if DM.ADORead.FieldByName('WorkTime').Value>0  then    //工作时间
                  worktime:= worktime+ DM.ADORead.FieldByName('WorkTime').Value
                else if   DM.ADORead.FieldByName('WorkTime').Value =null then
                  worktime := worktime + HoursBetween(DM.ADS848BeginTime.Value,Endtime)-dm.ADORead.FieldByName('TimeRest').Value;
                DM.ADORead.Next;
              end;
              FieldByName('TimeCons').Value:=  worktime ;
              Post;

            end;

            DM.ADOConnection1.CommitTrans;

          except
            on e:Exception do
            begin
              DM.ADOConnection1.RollbackTrans;
              ShowMessage('提交失败！'+#13#10+e.Message);
            end;
          end;
        end;
      end
      else
      begin
        if InputDlg(Self.Handle,'暂停','输入暂停原因',strReason) then
        begin
          if GetUserRights(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,
          '维修单暂停',dm.ADS848EMPL_CODE.Value) then
          begin
            if (strtoint(vUser_rights)in [2,3,4])=False then
            begin
              messagedlg('对不起,您没有结束雇员的权限！',mtinformation,[mbok],0)  ;
              Exit ;
            end;
            if DM.ADS848Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
            begin
              messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
              Exit ;
            end;
            CheckTime();
//            ModifyTimeRest;

            try
              DM.ADOConnection1.BeginTrans;
              with DM.tmp do
              begin
                Close;
                SQL.Text := 'update data0831 set rkey832=6 where rkey='+dm.ADS831rkey.AsString;
                ExecSQL;
                
                Close;
                SQL.Text:='insert into dbo.DATA0833(rkey831,stop_begin_date,remark) values('
                           +DM.ADS831rkey.AsString+',CONVERT(varchar(100),GETDATE(),120)'+','+QuotedStr(strReason)+')';
                ExecSQL;

              end;
              Assignment(Endtime);
              DM.ADOConnection1.CommitTrans;
            except
              on e:Exception do
              begin
                DM.ADOConnection1.RollbackTrans;
                ShowMessage('提交失败！'+#13#10+e.Message);
              end;
            end;
          end;
        end;
      end;
    end;
  finally
     BtnRefresh.Click;
  end;

end;

procedure Tfrm_main.meno_RemarkExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,remarks from data0831 where rkey='+dm.ADS831rkey.AsString;
    Open;
    Edit;
    FieldByName('remarks').Value := meno_Remark.Lines.Text;
    Post;
  end;
end;

procedure Tfrm_main.Edt_StdTimeConsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',Edt_StdTimeCons.Text)>0then abort;//第二列小数点'.'不能重复
end;

procedure Tfrm_main.Edt_StdTimeConsExit(Sender: TObject);
begin
  try
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'select rkey,StdTimeCons from data0831 where rkey='+dm.ADS831rkey.AsString;
      Open;
      Edit;
      if Edt_StdTimeCons.Text='' then
//        FieldByName('StdTimeCons').Value := null
      else
      FieldByName('StdTimeCons').Value := Edt_StdTimeCons.Text;
      Post;
  //    Close;
  //    SQL.Text :='select data0831.rkey,data0831.StdTimeCons from data0831 where  DeviNumb ='+
  //               QuotedStr(DM.ads831.FieldByName('DeviNumb').AsString)+
  //                 ' and data0831.MainCycl='+QuotedStr(DM.ADS831.FieldByName('MainCycl').AsString) ;
  //    Open;
  //    First;
  //    while not Eof do
  //    begin
  //      Edit;
  //      if Edt_StdTimeCons.Text='' then
  //      begin
  //        FieldByName('StdTimeCons').Value := null;
  //      end
  //      else
  //      begin
  //        FieldByName('StdTimeCons').Value := Edt_StdTimeCons.Text;
  //      end;
  //      Post;
  //      Next;
  //    end;
    end;
  //    BtnRefresh.Click;
  //  if DM.ADS831.FieldByName('StdTimeCons').IsNull=False then
  //  if VarToStr(DM.ADS831.FieldByName('StdTimeCons').NewValue)<>VarToStr(DM.ADS831.FieldByName('StdTimeCons').OldValue) then


    with DM.ADORead do
    begin
      if not(Edt_StdTimeCons.Text='') then
      begin
        Close;
        SQL.Text:= 'if not exists(select  * from data0847 join data0417 on [D417_ptr]=data0417.rkey '
                   +#13+' where FASSET_CODE ='+QuotedStr(DM.ads831.FieldByName('DeviNumb').AsString)
                   +#13+' and [MainCycl]='+QuotedStr(DM.ADS831.FieldByName('MainCycl').AsString)+') '
                   +#13+'    insert into data0847([D417_ptr],[MainCycl],[StdTimeCons]) '
                   +#13+'    select data0417.rkey ,data0831.MainCycl,data0831.StdTimeCons from  data0417'+
                   ' INNER JOIN data0831 ON DATA0417.FASSET_CODE = data0831.DeviNumb where  data0831.rkey ='
                   +#13+QuotedStr(DM.ADS831.FieldByName('rkey').AsString)
                   +#13+'else '
                   +#13+'    update data0847 set [StdTimeCons]= '+dm.tmp.FieldByName('StdTimeCons').AsString
                   +#13+'    from data0847 join data0417 on [D417_ptr]=data0417.rkey '
                   +#13+'    where FASSET_CODE ='+QuotedStr(DM.ADS831.FieldByName('DeviNumb').AsString)
                   +#13+' and [MainCycl]='+QuotedStr(DM.ADS831.FieldByName('MainCycl').AsString) ;
        ExecSQL;
      end;
    end ;
    DM.ADOConnection1.CommitTrans;
  except
    on E:Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure Tfrm_main.Exec_EndPause(vEmployeeRkey: string);
var
  vNUMBER:string;
  NowDate:TDateTime;
begin
  try
    Screen.Cursor := crHourGlass;
     if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
    begin
      ShowMessage('状态已经改变，请刷新');
      Exit;
    end;
    if EmployeeStatusCheck(vEmployeeRkey,vNUMBER) then
    begin
      Abort;
    end;

    if DM.ADS848.IsEmpty=False then
    with DM.tmp do
    begin
      Close;
      SQL.Text:='select rkey from data0848 where Work_ptr='+dm.ADS831rkey.AsString
      +' and Empl_ptr='+vEmployeeRkey+' and EndTime>=getDate()' ;
      Open;
      if IsEmpty=False then
      begin
        ShowMessage('无法添加新的雇员记录，因为本次的开始时间不能小于或等于上次的结束时间！！！');
        Exit;
      end;
    end;

    NowDate:= getsystem_date(dm.ADORead,0) ;
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;                                //自动添加保养的人员记录。
      SQL.Text:='insert into data0848(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status,DayShift)values('
      +DM.ADS831rkey.AsString+',CONVERT(VARCHAR(10),GETDATE(),120),'//getDate()'
      +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',NowDate))
      +','+vEmployeeRkey+','+'3,'+'1' +')' ;
      ExecSQL;
    end;

    with dm.tmp do
    begin
      Close;
      SQL.Text :='update data0831 set rkey832=3 where rkey='+dm.ADS831rkey.AsString;
      ExecSQL;
    end;

    with dm.tmp do
    begin
      Close;          //将暂停记录的结束时间填写上
      SQL.Text:='update dbo.DATA0833 set stop_end_date=getdate() where rkey831='+dm.ADS831rkey.AsString +' and stop_end_date is null';
      ExecSQL;
    end;
    DM.ADOConnection1.CommitTrans;
    BtnRefreshClick(Self);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure Tfrm_main.N6Click(Sender: TObject);
begin
  if (StrToInt(vprev) in[2,3,4])=False then
  begin
    ShowMessage('你没有暂停结束的权限！');
    Exit;
  end;
  if messagebox(Self.Handle,'你确定要暂停结束吗？','询问',MB_yesno+MB_iconquestion)=idNo then
  Exit ;
  Exec_EndPause(user_ptr) ;
end;



procedure Tfrm_main.N7Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if GetUserRights(Self,DM.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户暂停结束') then
  begin
    if (StrToInt(vUser_rights) in[2,3,4])=False then
    begin
      ShowMessage('你没有暂停结束的权限！');
      Exit;
    end;
    Exec_EndPause(vEmployeeRkey) ;
  end;

end;

procedure Tfrm_main.N8Click(Sender: TObject);
var
  worktime:TDateTime;
begin
  if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  
  if not (DM.ADS831.IsEmpty) then
  begin
    with DM.ADS848 do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('Status').AsInteger=3 then
        begin
          ShowMessage('当前保养单还存在状态是“执行中”的雇员记录！！！');
          Exit;
        end;
        Next;
      end;
    end;
  end;
  if messagebox(Self.Handle,'你确定要提交验收吗？','询问',MB_yesno+MB_iconquestion)=idNo then
      Exit ;

//  with dm.tmp do
//  begin
//    Close;
//    SQL.Text :='update data0831 set rkey832=4,ActuCompTime=getdate() where rkey='+dm.ADS831rkey.AsString;
//    ExecSQL;
//  end;
  try
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'select rkey,rkey832,ActuCompTime,TimeCons from data0831 where rkey='+dm.ADS831rkey.AsString;
      Open;
      Edit;
      FieldByName('rkey832').Value := 4;
      FieldByName('ActuCompTime').Value := getsystem_date(DM.ADORead,0);

      worktime:=0;

      DM.ADORead.Close;
      DM.ADORead.SQL.Text:='select rkey,status,WorkTime,begintime,EndTime,TimeRest from data0848 where data0848.work_ptr ='+dm.ADS831rkey.AsString;
      DM.ADORead.Open;
      DM.ADORead.First;
      while not DM.ADORead.Eof do
      begin
        if DM.ADORead.FieldByName('WorkTime').Value>0  then    //工作时间
          worktime:= worktime+ DM.ADORead.FieldByName('WorkTime').Value
        else if   DM.ADORead.FieldByName('WorkTime').Value =null then
          worktime := worktime + HoursBetween(dm.ADORead.FieldByName('begintime').Value,dm.ADORead.FieldByName('EndTime').Value)-dm.ADORead.FieldByName('TimeRest').Value;
        DM.ADORead.Next;
      end;
      FieldByName('TimeCons').Value:=  worktime ;
      Post;
    end;
    DM.ADOConnection1.CommitTrans;
    BtnRefreshClick(Sender);
  except
    on E:Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end

end;

procedure Tfrm_main.Acceptanceby(UserKey: string);
begin
  if  Self.find_error(dm.ADS831rkey.Value,dm.ADS831RKEY832.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  with dm.tmp do
  begin
    Close;
    SQL.Text :='update data0831 set rkey832=2,MainAcce_UserPtr= '+UserKey+ ' where rkey='+dm.ADS831rkey.AsString;
    ExecSQL;
  end;
  BtnRefreshClick(Self);
end;

procedure Tfrm_main.N9Click(Sender: TObject);
begin
  if (StrToInt(vprev) in[2,3,4])=False then
  begin
    ShowMessage('你没有验收的权限！');
    Exit;
  end;
  if messagebox(Self.Handle,'你确定要验收通过吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  Acceptanceby(rkey73);
end;

procedure Tfrm_main.N10Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if GetUserRights(Self,DM.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户验收') then
  begin
    if (StrToInt(vUser_rights) in[2,3,4])=False then
    begin
      ShowMessage('你没有验收的权限！');
      Exit;
    end;
    Acceptanceby(vUsernameRkey) ;
  end;
end;

procedure Tfrm_main.N11Click(Sender: TObject);
begin
  frm_Pause := Tfrm_Pause.Create(Application);
  frm_Pause.ShowModal;
end;

procedure Tfrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled := (StrToInt(vprev)in [3,4]) ;
  N13.Enabled := (StrToInt(vprev)in [3,4]) and (DM.ADS831RKEY832.Value in [1]);
  N2.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [1]);
  N3.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [5]);
  N4.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [5]);
  N5.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [5]);
  N6.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [6]);
  N7.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [6]);
  N8.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [3]);
  N9.Enabled := (StrToInt(vprev)in [4]) and (DM.ADS831RKEY832.Value in [4]);
  N10.Enabled := (StrToInt(vprev)in [4]) and (DM.ADS831RKEY832.Value in [4]);
end;

procedure Tfrm_main.PopupMenu2Popup(Sender: TObject);
begin
  N14.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [3]);
  N15.Enabled := (StrToInt(vprev)in [2,3,4]);
  N16.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [3]) and (DM.ADS848Status.Value in [3]);
  N17.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS831RKEY832.Value in [3]) and (DM.ADS848Status.Value in [3]);
end;

procedure Tfrm_main.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
  begin
    frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-10;
    frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
  end
  else if RadioGroup1.ItemIndex=1 then
  begin
    frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)+1;
    frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0)+1;
  end
  else if RadioGroup1.ItemIndex=2 then
  begin
    frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)+2;
    frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0)+2;
  end
  else if RadioGroup1.ItemIndex=3 then
  begin
    frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-10;
    frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0)+400;
  end;
  With DM.ADS831 do
  begin
    Close;
    dm.ADS831.CommandText := sql_text+strStatusValue+strStatus+ssql+ware_house+' and (data0831.PlanMainDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0831.PlanMainDate <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date))+')';
    Open;
  end;
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
  if (StrToInt(vprev) in[2,3,4])=False then
  begin
    ShowMessage('你没有修改标准时间的权限！');
    Exit;
  end;
  frm_stdTimeCons := Tfrm_stdTimeCons.Create(Application);
  frm_stdTimeCons.ShowModal;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
  if  Assigned(Frm_TimeQuery)=False then
  Frm_TimeQuery := TFrm_TimeQuery.Create(Application);
  Frm_TimeQuery.ShowModal;
  inc(clickNum);   //clickNum 为点击次数，第一次点击的时候加载默认sql
end;

procedure Tfrm_main.Edt_MainImplExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'update data0831 set MainImpl='+QuotedStr(Edt_MainImpl.Text)+' where rkey='+dm.ADS831rkey.AsString;
    ExecSQL;
  end;
end;

procedure Tfrm_main.DateTimePicker1Exit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'update data0831 set PlanMainDate='+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+' where rkey='+dm.ADS831rkey.AsString;
    ExecSQL;
  end;
end;

procedure Tfrm_main.N13Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=2) then
    messagedlg('对不起!您没有该程序的删除权限',mtinformation,[mbok],0)
  else  
  if MessageDlg('您确定要删除该设备代码吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'delete data0821 where Rkey831 = '+ dm.ADS831rkey.AsString;
        ExecSQL;
      end;
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'delete data0831 where data0831.rkey ='+dm.ADS831rkey.AsString;
        if ExecSQL>0 then
        begin
          DM.ADOConnection1.CommitTrans;
          common.ShowMsg('删除操作成功！',1);
          self.BtnRefreshClick(Sender);
        end;
      end;


    except
     on E: Exception do
     begin
       DM.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
     end;
    end;
  end;
end;

procedure Tfrm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS848.CommandText);
end;

procedure Tfrm_main.CheckBox8Click(Sender: TObject);
begin
  with DM.ADS468 do
  if  CheckBox8.Checked then
  begin
    if Parameters.ParamByName('vD831_ptr').Value<>DM.ADS831rkey.Value then
    begin
      Close;
      Parameters.ParamByName('vD831_ptr').Value:=DM.ADS831rkey.Value;
      Open;
    end
    else
      Open;
  end
  else
    Close;
end;

procedure Tfrm_main.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex=0 then
  begin
    strStatus := ' and d417.active_flag in (3,4) ';
  end
  else if RadioGroup2.ItemIndex=1 then
  begin
    strStatus := ' and d417.active_flag in (1,2,3,4,5,6,7) ';
  end ;
  With DM.ADS831 do
  begin
    Close;
    dm.ADS831.CommandText := sql_text+strStatusValue+strStatus+ssql+ware_house+' and (data0831.PlanMainDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (data0831.PlanMainDate <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date))+')';
    Open;
  end;
end;

procedure Tfrm_main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.ADS468.CommandText);
end;

procedure Tfrm_main.DBGridEh3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.ADS821.CommandText);
end;

procedure Tfrm_main.BitBtn3Click(Sender: TObject);
begin
  try
    FrmIfReplace := TFrmIfReplace.Create(Self);
    FrmIfReplace.Fsql821:= sql821;
    FrmIfReplace.FVisible := 1;
    FrmIfReplace.ShowModal;
  finally
    FrmIfReplace.Free;
  end;
end;

procedure Tfrm_main.N18Click(Sender: TObject);
begin
  try
    FrmIfReplace := TFrmIfReplace.Create(Self);
    FrmIfReplace.Fsql821:= sql821;
    FrmIfReplace.FVisible := 2;
    FrmIfReplace.ShowModal;
  finally
    FrmIfReplace.Free;
  end;
end;

end.
