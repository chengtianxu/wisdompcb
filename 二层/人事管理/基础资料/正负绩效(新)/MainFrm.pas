unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, Buttons, Menus, Math,
  common, Damo, DateUtils, DB, ADODB;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edt_1: TEdit;
    BitBtn4: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    bbt_4: TBitBtn;
    lb_2: TLabel;
    dtp4: TDateTimePicker;
    N3: TMenuItem;
    N4: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    BitBtn5: TBitBtn;
    mniReCheck: TMenuItem;
    ts1: TTabSheet;
    qry1: TADOQuery;
    ds1: TDataSource;
    pnl1: TPanel;
    pnl2: TPanel;
    dbgrdh1: TDBGridEh;
    dtp1: TDateTimePicker;
    lbl1: TLabel;
    btn1: TBitBtn;
    wdstrngfldqry1DSDesigner: TWideStringField;
    strngfldqry1DSDesigner2: TStringField;
    intgrfldqry1DSDesigner3: TIntegerField;
    wdstrngfldqry1DSDesigner1: TWideStringField;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure bbt_4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure mniReCheckClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, StartSql :string;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
uses
  EditFrm, QueFrm, EditFrms, ExcelFrm,ReCheck;

{$R *.dfm}

//新增
procedure TFrmMain.N1Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您没有可写权限，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  FrmEdit := TFrmEdit.Create(Application);
  FrmEdit.ShowModal;
  if frmedit.ShowModal=mrok then
    begin
      
     DM.qry1.Close;
     DM.qry1.Open;
      dm.qry1.Sort :='rkey desc';
    end;

  FrmEdit.Free;
end;

//删除
procedure TFrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin

  if (strtoint(vprev) <> 4) then
  begin
    messagedlg('对不起! 您没有写银权限，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if pos('培训', DM.qry1.FieldByName('remark').AsString) > 0 then
  begin
    messagedlg('对不起! 该记录为培训记录，无法删除！',mtinformation,[mbok],0);
    Exit;
  end;
  if DM.qry1.IsEmpty then ShowMessage('当前记录为空！')
  else
  begin
    try
      DM.ADOConnection1.BeginTrans;
      if MessageDlg('删除后将无法恢复，确定要删除该行记录吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     // if(common.ShowMsg('删除后将无法恢复，确定要删除该行记录吗?',1);
      begin
        DM.qrytemp.Close;
        DM.qrytemp.SQL.Clear;
        DM.qrytemp.SQL.Text := 'delete from employee_rewards_punishment where rkey= ' + IntToStr(DM.qry1.FieldByName('rkey').Value);
        DM.qrytemp.ExecSQL;
      end;
      DM.ADOConnection1.CommitTrans;
      i := DBGridEh1.Row;
      DM.qry1.Close;
      DM.qry1.Open;
      DM.qry1.MoveBy(i - 1);
      DM.qry1s.Close;
      DM.qry1s.Open;
    except
      on e: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('网络异常...' + e.Message);
      end;
    end
  end;
end;

//修改
procedure TFrmMain.N3Click(Sender: TObject);
var
  i: Integer;
begin

if(dm.qry1.RecordCount<1) then
 begin
  showmessage('没有记录修改！！');
 exit;
 end;

  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您没有可写权限，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if pos('培训', DM.qry1.FieldByName('remark').AsString) > 0 then
  begin
    messagedlg('对不起! 该记录为培训记录，无法修改！',mtinformation,[mbok],0);
    Exit;
  end;
  FrmEdits := TFrmEdits.create(Application);
  FrmEdits.showmodal;
  FrmEdits.free;
  i := DM.qry1.FieldValues['rkey'];
  DM.qry1.Close;
  DM.qry1.Open;
  DM.qry1.Locate('rkey',i, []);
end;

//查看
procedure TFrmMain.FormCreate(Sender: TObject);
begin
//    rkey73:='3323' ;
//   user_ptr := '3301';
//  vprev := '4';


  if not App_init_2(DM.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;



    StartSql := DM.qry1.SQL.Text;
  Caption := application.Title;

end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := $00FFC4C4;
end;

procedure TFrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  Canvas.brush.Color := $00FFC4C4;
  If DM.qry1.FieldByName('flag').Value = 1 then
  Begin
    DBGridEh1.Canvas.Font.Color := clRed;
    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;
end;

//汇总绩效
procedure TFrmMain.bbt_4Click(Sender: TObject);
begin
  DM.qry1s.close;
  DM.qry1s.SQL.Text := Format('select distinct employeemsg.rkey,employeecode,chinesename,departmentname , '
    + '(select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + 'where employee_rewards_punishment.type=datadetail.rkey and flag= 0 and item<>''加其它'' AND item <> ''阿米巴奖''  '
    + 'and  year(effectdate)=''%s'' and month(effectdate)=''%s'' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''正绩效'', '

    + '  (select isnull(count(money),0) Smoney from employee_rewards_punishment, datadetail '
    + '  where employee_rewards_punishment.type=datadetail.rkey and flag= 0 and item<>''加其它'' AND item <> ''阿米巴奖'' '
   + '   and  year(effectdate)=''%s'' and month(effectdate)=''%s'' '
   + '   and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''正绩效次数'', '

    + '(select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + 'where employee_rewards_punishment.type=datadetail.rkey and flag= 0 and item=''加其它'' '
    + 'and  year(effectdate)=''%s'' and month(effectdate)=''%s'' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''加其它'', '

    + '  (select isnull(count(money),0) Smoney from employee_rewards_punishment, datadetail '
    + '  where employee_rewards_punishment.type=datadetail.rkey and flag= 0 and item=''加其它'''
   + '   and  year(effectdate)=''%s'' and month(effectdate)=''%s'' '
   + '   and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''加其它次数'', '

       + '(select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + 'where employee_rewards_punishment.type=datadetail.rkey and flag= 0 and item=''阿米巴奖'' '
    + 'and  year(effectdate)=''%s'' and month(effectdate)=''%s'' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''阿米巴奖'', '

    + '  (select isnull(count(money),0) Smoney from employee_rewards_punishment, datadetail '
    + '  where employee_rewards_punishment.type=datadetail.rkey and flag= 0 and item=''阿米巴奖'''
   + '   and  year(effectdate)=''%s'' and month(effectdate)=''%s'' '
   + '   and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''阿米巴奖次数'', '


    + ' (select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + ' where employee_rewards_punishment.type=datadetail.rkey  and flag = 1 and item <>''减其它'' '
    +  ' and  year(effectdate)=''%s'' and month(effectdate)=''%s'' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''负绩效'', '

   +  '   (select isnull(count(money),0) Smoney from employee_rewards_punishment, datadetail  '
   +  ' where employee_rewards_punishment.type=datadetail.rkey  '
   +  ' and flag = 1 and item <>''减其它''  and  year(effectdate)=''%s'' and month(effectdate)=''%s''  '
   +  ' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''负绩效次数'',  '


       + ' (select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + ' where employee_rewards_punishment.type=datadetail.rkey  and flag = 1 and item =''减其它''  '
    +  ' and  year(effectdate)=''%s'' and month(effectdate)=''%s'' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''减其它'', '

   +  '   (select isnull(count(money),0) Smoney from employee_rewards_punishment, datadetail  '
   +  ' where employee_rewards_punishment.type=datadetail.rkey  '
   +  ' and flag = 1 and item =''减其它''  and  year(effectdate)=''%s'' and month(effectdate)=''%s''  '
   +  ' and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''减其它次数'',  '


    + '(select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + 'where employee_rewards_punishment.type=datadetail.rkey and flag= 0 '
    + 'and year(effectdate)=''%s'' and month(effectdate)=''%s'' '
    + 'and employee_rewards_punishment.employeeid=employeemsg.rkey) '
    + '-(select isnull(sum(money),0) Smoney from employee_rewards_punishment, datadetail '
    + 'where employee_rewards_punishment.type=datadetail.rkey '
    + 'and flag = 1 and year(effectdate)=''%s'' and month(effectdate)=''%s'' '
    + 'and employee_rewards_punishment.employeeid=employeemsg.rkey) as ''实得奖惩金额'', datadetail.item '
    
    + 'from employee_rewards_punishment '
    + 'inner join employeemsg on employee_rewards_punishment.employeeid=employeemsg.rkey '
    + 'inner join dbo.datadepartment on employeemsg.departmentid=datadepartment.rkey '
    + 'inner join dbo.datadetail on employeemsg.position=datadetail.rkey '
    + 'where year(effectdate)=''%s'' and month(effectdate)=''%s'' '
    + 'order by employeecode '
    , [intToStr(YearOf(dtp4.DateTime)),
    IntToStr(MonthOf(dtp4.DateTime)), intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)), intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)), intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)),
    intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)), intToStr(YearOf(dtp4.DateTime)), IntToStr(MonthOf(dtp4.DateTime)), intToStr(YearOf(dtp4.DateTime))]);
  DM.qry1s.Open;
  Label3.Caption := IntToStr(DM.qry1s.RecordCount);  
end;

//刷新
procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
  i: Integer;
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    if DM.qry1.IsEmpty then Exit;
    i := DM.qry1.FieldValues['rkey'];
    DM.qry1.Close;
    DM.qry1.Open;
    DM.qry1.Locate('rkey',i, []);
    Label3.Caption := IntToStr(DM.qry1.RecordCount);
  end;
  if PageControl1.ActivePageIndex = 1 then
  begin
    if DM.qry1s.IsEmpty then Exit;
    bbt_4.Click;
  end;
end;

procedure TFrmMain.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qry1s.SQL.Text);
end;

procedure TFrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qry1.SQL.Text);
end;

procedure TFrmMain.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  If DM.qry1s.FieldByName('实得奖惩金额').Value < 0 then
  Begin
    DBGridEh2.Canvas.Font.Color := clRed;
    DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;
end;

procedure TFrmMain.DBGridEh2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := cl3DLight;
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry1.Sort:=Column.FieldName+' DESC';
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
  Label3.Caption := IntToStr(DM.qry1.RecordCount);
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  DM.qry1.Close;
  DM.qry1.SQL.Text := StartSql
    + ' and effectdate >= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker1.Date))
    + ' and effectdate <= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker2.Date))
    + ' order by employeecode';
  DM.qry1.Open;
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select convert(varchar(100), getdate(), 23) as sysdate';
    Open;
  end;
  dtp4.Date := Now();
   dtp1.Date := Now();
  bbt_4.Click;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  label1.Caption := DBGridEh1.Columns[0].Title.Caption;
  PageControl1.ActivePageIndex := 0;
  Label3.Caption := IntToStr(DM.qry1.RecordCount);
  label5.Caption := '从 '+  formatdatetime('YYYY-MM-DD',FrmQue.DateTimePicker1.Date) +' 到 '+
  formatdatetime('YYYY-MM-DD',FrmQue.DateTimePicker2.Date);
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    common.Export_dbGridEH_to_Excel(DBGridEh1, '员工奖惩明细');
  end;
  if PageControl1.ActivePageIndex = 1 then
  begin
    common.Export_dbGridEH_to_Excel(DBGridEh2, '员工奖惩汇总');
  end;
end;

//查询
procedure TFrmMain.BitBtn4Click(Sender: TObject);
var
 i: byte;
begin
  with FrmQue do
  begin
    if ShowModal = mrok then
    begin
      with DM.qry1 do
      begin
        close;
        SQL.Text := self.StartSql + #13;
        for i := 1 to SGrid1.RowCount - 2 do SQL.Text := SQL.Text + SGrid1.Cells[2,i] + #13;
        SQL.Text := SQL.Text
          + ' and effectdate >= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker1.Date))
          + ' and effectdate <= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker2.Date))
          + ' order by employeecode';
        open;
      end;
    end;
  end;
  Label3.Caption := IntToStr(DM.qry1.RecordCount);
  label5.Caption :='从 '+  formatdatetime('YYYY-MM-DD',FrmQue.DateTimePicker1.Date) +' 到 '+
  formatdatetime('YYYY-MM-DD',FrmQue.DateTimePicker2.Date);
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您没有可写权限，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  FrmExcel := TFrmExcel.Create(nil);
  if FrmExcel.ShowModal = mrok then
  begin
    DM.qry1.Requery();
  end;
  FrmExcel.Free;
end;

procedure TFrmMain.PageControl1Change(Sender: TObject);
begin
 if PageControl1.ActivePageIndex = 0 then
  Label3.Caption := IntToStr(DM.qry1.RecordCount);
 if PageControl1.ActivePageIndex = 1 then
  Label3.Caption := IntToStr(DM.qry1s.RecordCount);
end;

procedure TFrmMain.BitBtn5Click(Sender: TObject);
begin
 dm.updatemistake.ExecSQL;
 showmessage('更新完毕');
end;

procedure TFrmMain.mniReCheckClick(Sender: TObject);
var
  i: Integer;
begin
 { if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起! 您没有可写权限，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if pos('培训', DM.qry1.FieldByName('remark').AsString) > 0 then
  begin
    messagedlg('对不起! 该记录为培训记录，无法修改！',mtinformation,[mbok],0);
    Exit;
  end;      }
  FrmReCheck := TFrmReCheck.create(Application);
  FrmReCheck.showmodal;
  FrmReCheck.free;
  i := DM.qry1.FieldValues['rkey'];
  DM.qry1.Close;
  DM.qry1.Open;
  DM.qry1.Locate('rkey',i, []);
end;

procedure TFrmMain.btn1Click(Sender: TObject);
begin
with  qry1 do
begin
 close;
 Parameters[0].value:=FormatDateTime('yyyy-MM',dtp1.Date);
 open;
end;

end;

end.
