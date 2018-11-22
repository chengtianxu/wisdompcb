unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, Menus;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    BitClose: TBitBtn;
    BitRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BitQuery: TBitBtn;
    BitFieldsVisable: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitFieldsVisableClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitQueryClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    strStatusValue,ssql,sql_text : string;
    PreColumn:TColumnEh;
    procedure item_click(sender: TObject);
    { Private declarations }
  public
    empl_ptr:string;
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo,common,DB, QuerySet, shipped_meth, miscreport, mul_report;

{$R *.dfm}

procedure Tfrm_main.BitCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
// rkey73:='2551';
// user_ptr := '3054';
// vprev := '4'
end;

procedure Tfrm_main.BitRefreshClick(Sender: TObject);
var
  rkey209:integer;
begin
  rkey209 := DM.ADS209RKEY.Value;
  dm.ADS209.Close;
  dm.ADS209.Prepared;
  dm.ADS209.Open;
  if rkey209>0 then
  dm.ADS209.Locate('rkey',rkey209,[]);
end;

procedure Tfrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS209.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i := 0 to dbgrideh1.FieldCount - 1 do
  if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
  begin
    if (sender as tmenuItem).Checked then
    begin
      dbgrideh1.Columns[i].Visible := true;
      break;
    end
    else
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
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
  with dm.tmp do
  begin
    Close;     //取系统用户员工指针赋值
    sql.Text := 'select employee_ptr from data0073 where rkey='+rkey73;
    Open;
    if not isempty then
      self.empl_ptr := fieldvalues['employee_ptr'];
  end;
  sql_text := DM.ADS209.CommandText;
  frmQuerySet.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-90;
  frmQuerySet.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
  strStatusValue :=' and data0209.status in (0) ';
  With DM.ADS209 do
  begin
    Close;
    CommandText := sql_text+strStatusValue+ssql+' and (Data0209.TDATE  >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (Data0209.TDATE  <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
    Open;
  end;
  
end;

procedure Tfrm_main.CheckBox1Click(Sender: TObject);
begin
   strStatusValue :='';
  if CheckBox1.Checked then
    strStatusValue := '0,';
  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'1,';

  if strStatusValue <> '' then
    strStatusValue := ' and Data0209.status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')'+#13
  else
    strStatusValue := ' and Data0209.status in (9)'+#13;

  With DM.ADS209 do
  begin
    Close;
    CommandText := sql_text+strStatusValue+ssql+
    ' and (Data0209.TDATE  >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (Data0209.TDATE  <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
    Open;
  end;
end;

procedure Tfrm_main.BitFieldsVisableClick(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure Tfrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS209.CommandText);
end;

procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (column.Title.SortMarker = smNoneEh) then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS209.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS209.IndexFieldNames:=Column.FieldName+' DESC';
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



procedure Tfrm_main.BitQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS209.Close;
    dm.ADS209.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS209.CommandText := sql_text+strStatusValue+ssql+
    ' and (Data0209.TDATE  >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))+
    ') and (Data0209.TDATE  <='+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker2.Date+1))+')';
    dm.ADS209.Open;
  end;

end;

procedure Tfrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    Frm_shipped := TFrm_shipped.Create(Application);
    if Frm_shipped.ShowModal =mrok then
    begin
      BitRefreshClick(Sender);
    end;
  end;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else

  if MessageDlg('您确定要取消退货吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try

      with dm.tmp do
      begin
        Close;
        SQL.Text := 'SELECT Data0235.QUAN_ON_HAND, Data0235.quan_to_ship,Data0209.QUANTITY,'+
        'case dbo.Data0209.status when ''1'' then ''已装运'' when ''0'' then ''未装运'' end  as ''v_state'' FROM Data0209 INNER JOIN Data0235'+
        ' ON Data0209.SRCE_PTR = Data0235.RKEY where data0209.rkey='+dm.ADS209Rkey.AsString;
        Open;
//        ShowMessage(FieldByName('v_state').Value);
        if DM.ADS209v_state.Value <> FieldByName('v_state').Value then
        begin
          ShowMessage('已有人进行了装运，状态发生改变，请刷新后再操作');
          Exit;
        end;
        if DM.ADS209quan_to_ship.Value=0 then
        begin
          ShowMessage('已有人进行了操作，状态发生改变，请刷新后再操作');
          Exit;
        end;
        DM.ADOConnection1.BeginTrans;
        Edit;

        FieldByName('QUAN_ON_HAND').Value := FieldByName('QUAN_ON_HAND').Value+ FieldByName('QUANTITY').Value;
        FieldByName('quan_to_ship').Value := FieldByName('quan_to_ship').Value- FieldByName('QUANTITY').Value;
        Post;
      end;
      with dm.tmp do
      begin
        close;
        sql.Text:='delete data0209 where rkey='+dm.ADS209Rkey.AsString ;
      end;
      DM.ADOConnection1.CommitTrans;
      if DM.tmp.ExecSQL>0 then
      begin
        common.ShowMsg('取消操作成功！',1);
        self.BitRefreshClick(Sender);
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

procedure Tfrm_main.PopupMenu2Popup(Sender: TObject);
begin
  if DM.ADS209.RecordCount >0 then
  begin
    N1.Enabled := True;
    N2.Enabled := True;
    N3.Enabled := True;
  end
  else
  begin
    N1.Enabled := False;
    N2.Enabled := False;
    N3.Enabled := False;
  end;
  if DM.ADS209v_state.Value='已装运' then
  begin
    N1.Enabled := False;
    N2.Enabled := False;
    N3.Enabled := True;
  end
  else if  DM.ADS209v_state.Value='未装运' then
  begin
    N1.Enabled := True;
    N2.Enabled := True;
    N3.Enabled := False;
  end;

end;

procedure Tfrm_main.N3Click(Sender: TObject);
begin
  Form_miscreport:=TForm_miscreport.Create(application);
  Form_miscreport.ado209.close;
  Form_miscreport.ado209.Parameters[0].Value:=dm.ADS209Rkey.Value;
  Form_miscreport.ado209.open;

  Form_miscreport.ppReport1.Reset;
  Form_miscreport.ppReport1.Template.FileName:=
  StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'EP304.rtm';
  Form_miscreport.ppReport1.Template.LoadFromFile;
  Form_miscreport.ppReport1.SaveAsTemplate:=false;
  Form_miscreport.ppReport1.Print;
//  BitRefreshClick(sender);
  Form_miscreport.Free;
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
  try
    Form_miscreport:=TForm_miscreport.Create(Application);
    Form_miscreport.ppReport1.Reset;
    Form_miscreport.ppReport1.Template.FileName:=
       StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'EP304.rtm';
    Form_miscreport.ppReport1.Template.LoadFromFile;
    Form_miscreport.ppReport1.SaveAsTemplate:=True;
    Form_miscreport.ppDesigner1.ShowModal;
  finally
    Form_miscreport.Free;
  end;
end;

procedure Tfrm_main.N4Click(Sender: TObject);
var
 i:integer;
begin

 form_mulreport:=tform_mulreport.Create(application);

  if form_mulreport.ShowModal=mrok then
  begin
    for i:=1 to form_mulreport.StG2.RowCount-2 do
    begin
      Form_miscreport:=TForm_miscreport.Create(application);
      Form_miscreport.ppReport1.DeviceType := 'Printer';
      Form_miscreport.ppReport1.ShowPrintDialog := false;
      Form_miscreport.ado209.close;
      Form_miscreport.ado209.Parameters[0].Value:=strtoint(form_mulreport.StG2.Cells[2,i]);
      Form_miscreport.ado209.open;

      Form_miscreport.ado493.Open;

      Form_miscreport.ppReport1.Reset;
      Form_miscreport.ppReport1.Template.FileName:=
        StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'EP304.rtm';
      Form_miscreport.ppReport1.Template.LoadFromFile;

      Form_miscreport.ppReport1.SaveAsTemplate:=false;
      Form_miscreport.ppReport1.Print;
      Form_miscreport.Free;
    end;
  end;
   form_mulreport.free;
 BitRefreshClick(sender);
end;

end.
