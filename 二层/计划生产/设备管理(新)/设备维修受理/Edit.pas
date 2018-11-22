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
    procedure BtnSaveClick(Sender: TObject);
    procedure Edt_timeresetKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_DayShiftKeyPress(Sender: TObject; var Key: Char);
  private
//    workDay:TDate;

    { Private declarations }
  public
    rkey842,v_state : Integer;
    EmployeeRkey :string;
    procedure transferEmployeeRkey(vEmployeeRkey:string);
    { Public declarations }
  end;

var
  frm_Edit: Tfrm_Edit;

implementation

uses damo,common;

{$R *.dfm}

procedure Tfrm_Edit.transferEmployeeRkey(vEmployeeRkey: string);
begin
  EmployeeRkey := vEmployeeRkey;
end;

procedure Tfrm_Edit.BtnSaveClick(Sender: TObject);
begin
  if Edt_timereset.Text ='' then
  begin
    messagedlg('中途休息时间不能为空!',mtinformation,[mbcancel],0);
    Edt_timereset.SetFocus;
    Exit;
  end;
//  if v_state =0 then
//  begin
//    workDay := common.getsystem_date(DM.tmp,1);
//    try
//     DM.ADOConnection1.BeginTrans;
//     with dm.tmp do
//     begin
//      Close;
//      SQL.Text := 'select  Data0842.rkey, Data0842.Work_ptr, Data0842.WorkDate, Data0842.BeginTime,'+
//             'Data0842.EndTime, Data0842.TimeCons, Data0842.TimeRest, Data0842.Empl_ptr,'+
//             'Data0842.Status, Data0842.WorkTime, Data0842.Remark, Data0842.DayShift,'+
//             'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat'+#13+
//             'from Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey '+
//             'join data0832 on Data0842.Status=data0832.rkey where data0842.rkey is null';
//      Open;
//      Append;
//      FieldByName('work_ptr').Value := DM.ADS567RKEY.Value;
//      FieldByName('workDate').Value := workDay;
//      FieldByName('Empl_ptr').Value := EmployeeRkey;
//      FieldByName('status').Value := 3;
//      FieldByName('BeginTime').Value :=StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time));
//      FieldByName('TimeRest').Value := Edt_timereset.Text;
//      FieldByName('remark').Value := Memo_Remark.Lines.Text;
//      if Edt_DayShift.Text ='' then
//        FieldByName('DayShift').Value := null
//      else
//        FieldByName('DayShift').Value := Edt_DayShift.Text;
//      Post;
//      rkey842 := FieldByName('rkey').Value;
//     end;
//     dm.ADOConnection1.CommitTrans;
//     ModalResult:=mrok;
//    except
//      on E:Exception do
//      begin
//        DM.ADOConnection1.RollbackTrans;
//        MessageDlg(e.Message,mtError,[mbCancel],0);
//      end;
//    end
//  end
//  else if v_state =1 then
//  begin
    try
      DM.ADOConnection1.BeginTrans;
      
      with dm.tmp do
      begin
        Close;
        SQL.Text := 'select  Data0842.rkey, Data0842.Work_ptr, Data0842.WorkDate, Data0842.BeginTime,'+
               'Data0842.EndTime, Data0842.TimeCons, Data0842.TimeRest, Data0842.Empl_ptr,'+
               'Data0842.Status, Data0842.WorkTime, Data0842.Remark, Data0842.DayShift,'+
               'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat'+#13+
               'from Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey '+
               'join data0832 on Data0842.Status=data0832.rkey where data0842.rkey ='+inttostr(rkey842);
        Open;

        Edit;
       // FieldByName('BeginTime').Value := DateTimePicker1.Date;
        FieldByName('BeginTime').Value :=StrToDateTime( DateToStr(DateTimePicker1.Date)+FormatDateTime(' HH:mm:ss',DateTimePicker2.Time));
        FieldByName('TimeRest').Value := Edt_timereset.Text;
        FieldByName('remark').Value := Memo_Remark.Lines.Text;
        if Edt_DayShift.Text =''then
          FieldByName('DayShift').Value := null
        else
          FieldByName('DayShift').Value := Edt_DayShift.Text;
        Post;
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
//  end;
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
  if not (key in ['1','2',#8,#13]) then abort//判断是否输入数字
//  else
//  if key = chr(46) then
//  if pos('.',Edt_timereset.Text)>0then abort;//第二列小数点'.'不能重复
end;

end.
