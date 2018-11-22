unit Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  Tfrm_Edit = class(TForm)
    BtnSave: TBitBtn;
    BitCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edt_timereset: TEdit;
    Edt_DayShift: TEdit;
    Memo_Remark: TMemo;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label5: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    procedure BtnSaveClick(Sender: TObject);
    procedure Edt_timeresetKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_DayShiftKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
//    workDay:TDate;

    { Private declarations }
  public
    rkey848,v_state : Integer;
    EmployeeRkey:string;
    procedure transferEmployeeRkey(vEmployeeRkey:string);
    { Public declarations }
  end;

var
  frm_Edit: Tfrm_Edit;

implementation

uses damo,common, formGetUserRights,DateUtils;

{$R *.dfm}

procedure Tfrm_Edit.transferEmployeeRkey(vEmployeeRkey: string);
begin
  EmployeeRkey := vEmployeeRkey;
end;

procedure Tfrm_Edit.BtnSaveClick(Sender: TObject);
var
  worktime:TDateTime;
begin

  if (Edt_timereset.Text ='') and (DM.ADS848MainexecStat.Value='已结束') then
  begin
    messagedlg('中途休息时间不能为空!',mtinformation,[mbcancel],0);
    Edt_timereset.SetFocus;
    Exit;
  end;
  if DM.ADS848MainexecStat.Value='已结束' then
  if Edt_timereset.Text<>'' then
  begin
    if (MinutesBetween(StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time))
        ,StrToDateTime( DateToStr(DateTimePicker3.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker4.Time)))/60.0 - StrToFloat(Edt_timereset.Text)<0) then
    begin
      messagedlg('操作不合法，雇员工作时间小于0!',mtinformation,[mbcancel],0);
      Exit;
    end;
  end
  else
  begin
    if (MinutesBetween(StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time))
        ,StrToDateTime( DateToStr(DateTimePicker3.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker4.Time)))/60.0 <0) then
    begin
      messagedlg('操作不合法，雇员工作时间小于0!',mtinformation,[mbcancel],0);
      Exit;
    end;
  end;
  try
    DM.ADOConnection1.BeginTrans;
    with dm.tmp do
    begin
      Close;
      SQL.Text := 'select  Data0848.rkey, Data0848.Work_ptr, Data0848.WorkDate, Data0848.BeginTime,'+
             'Data0848.EndTime,  Data0848.TimeRest, Data0848.Empl_ptr,'+
             'Data0848.Status, Data0848.WorkTime, Data0848.Remark, Data0848.DayShift,'+
             'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat'+#13+
             'from Data0848 left join data0005 on Data0848.Empl_ptr=data0005.rkey '+
             'join data0832 on Data0848.Status=data0832.rkey where data0848.rkey ='+inttostr(rkey848);
      Open;
      Edit;
      FieldByName('BeginTime').Value :=StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time));

      if ( DM.ADS848EndTime.AsString = '') then
      begin
      end
      else
      begin
        FieldByName('EndTime').Value :=StrToDateTime( DateToStr(DateTimePicker3.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker4.Time));
      end;
      if Edt_timereset.Text ='' then
      begin
        FieldByName('TimeRest').Value :=null;
      end
      else
      begin
        FieldByName('TimeRest').Value := Edt_timereset.Text;
      end;
      FieldByName('remark').Value := Memo_Remark.Lines.Text;
      
      if Edt_DayShift.Text =''then
        FieldByName('DayShift').Value := null
      else
        FieldByName('DayShift').Value := Edt_DayShift.Text;
      if FieldByName('EndTime').Value=null then
      begin

      end
      else
      begin
      FieldByName('WorkTime').Value := MinutesBetween(StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time))
      ,StrToDateTime( DateToStr(DateTimePicker3.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker4.Time)))/60.0 -FieldByName('TimeRest').Value;
      end;
      Post;

      DM.ADORead.Close;
      DM.ADORead.sQL.Text := 'select rkey,rkey832,ActuCompTime,TimeCons from data0831 where rkey='+dm.ADS831rkey.AsString;
      DM.ADORead.Open;

      Close;
      SQL.Text:='select rkey,status,WorkTime,begintime,EndTime,TimeRest from data0848 where data0848.work_ptr ='+dm.ADS831rkey.AsString;
      Open;

      DM.ADORead.Edit;
      worktime :=0;
      First;
      while not Eof do
      begin
        if FieldByName('WorkTime').Value>0  then    //工作时间
        begin
          worktime:= worktime+ FieldByName('WorkTime').Value
        end
        else if   FieldByName('WorkTime').Value =null then
        begin

//          worktime := worktime + HoursBetween(FieldByName('BeginTime').Value,FieldByName('EndTime').Value)-FieldByName('TimeRest').Value;

        end;
        Next;
      end;
      DM.ADORead.FieldByName('TimeCons').Value:=  worktime ;
      DM.ADORead.Post;

    end;
    dm.ADOConnection1.CommitTrans;
    
    ModalResult:=mrok;
  except
    on E:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      MessageDlg(e.Message,mtError,[mbCancel],0);
    end;
  end

end;

procedure Tfrm_Edit.Edt_timeresetKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',Edt_timereset.Text)>0then abort;//第二列小数点'.'不能重复
end;

procedure Tfrm_Edit.Edt_DayShiftKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',Edt_timereset.Text)>0then abort;//第二列小数点'.'不能重复
end;

procedure Tfrm_Edit.FormShow(Sender: TObject);
begin

  if (StrToInt(vUser_rights) in [4]) then
  begin
    DateTimePicker1.Enabled := True;
    DateTimePicker2.Enabled := True;
    DateTimePicker3.Enabled := True;
    DateTimePicker4.Enabled := True;
    Edt_timereset.Enabled := True;
  end
  else
  begin
    DateTimePicker1.Enabled := False;
    DateTimePicker2.Enabled := False;
    DateTimePicker3.Enabled := False;
    DateTimePicker4.Enabled := False;
    Edt_timereset.Enabled := False;
  end;
  if DM.ADS848EndTime.AsString='' then
  begin
    DateTimePicker3.Enabled := False;
    DateTimePicker4.Enabled := False;
  end;
end;

end.
